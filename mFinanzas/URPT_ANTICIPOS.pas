unit URPT_ANTICIPOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TRPT_ANTICIPOS = class(TForm)
    qyAnticiposEnc: TIBQuery;
    dsEncabezado: TDataSource;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_NOTA_DE_CREDITO: TIBStoredProc;
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    qyActulizar: TIBQuery;
  private
    { Private declarations }
     ruta            : string;
     reporte         : string;
     awrImpresora    : string;
     awrModo         : string;
     awrEscImpresora : string;
     awrID           : integer;
     
     function comprobarFolio : boolean;
     procedure loadImpresora;
     procedure setID(p_id : integer);
  public
     function openReporte : boolean;
     procedure imprimir;
     procedure preview;
  published
     property ID : integer write setID;
  end;

var
  RPT_ANTICIPOS: TRPT_ANTICIPOS;

implementation

uses IniFiles, controladorImpresora, UfrmFolio, reglas_de_negocios;

{$R *.DFM}

function TRPT_ANTICIPOS.openReporte : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   //cargar archivo del directorio de reportes
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\';
   reporte := LowerCase(awrModo) + '_anticipos.prt';
   if not(FileExists(ruta+reporte)) then
   begin
      tmp := false;
      ShowMessage('Falta archivo: '+ruta+reporte);
   end;

   result := tmp;
end;

procedure TRPT_ANTICIPOS.setID(p_id : integer);
begin
   awrID := p_id;
   qyAnticiposEnc.Close;
   qyAnticiposEnc.ParamByName('P_ID').AsInteger := p_id;
   qyAnticiposEnc.Open;
end;

procedure TRPT_ANTICIPOS.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('ANTICIPOS') then
   begin
      frmControladorImpresoras       := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boAnticipos;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   awrImpresora    := iniFile.ReadString('ANTICIPOS','ImpresoraNom1','');
   awrModo         := iniFile.ReadString('ANTICIPOS','Modo'         ,'');
   awrEscImpresora := iniFile.ReadString('ANTICIPOS','EscModel1'    ,'');
   iniFile.Destroy;
end;

function TRPT_ANTICIPOS.comprobarFolio : boolean;
var
   salir  : boolean;
   _mr    : boolean;
   _folio : integer;
begin
   repeat         
      salir := true;
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyAnticiposEnc.FieldByName('R_ALMACEN').AsInteger;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;

      try
         frmFolio        := TfrmFolio.Create(Application);
         frmFolio.Titulo := 'Anticipos';
         frmFolio.Folio  := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
         frmFolio.ShowModal;
         _mr    := frmFolio.ModalResult;
         _folio := frmFolio.Folio;
      finally
         frmFolio.Free;
      end;

      if (_mr) and (_folio <> 0) then
      begin
         qyVerificarFolio.Close;
         qyVerificarFolio.ParamByName('P_ID').AsInteger    := qyAnticiposEnc.FieldByName('R_ID').AsInteger;
         qyVerificarFolio.ParamByName('P_FOLIO').AsInteger := _folio;
         qyVerificarFolio.Open;
         salir := (qyVerificarFolio.FieldByName('R_ACEPTADO').AsString = 'Si');
         if qyVerificarFolio.FieldByName('R_ACEPTADO').AsString = 'No' then
         begin
           ShowMEssage('Ya se encuentra este folio.  Capturar otro folio.');
         end
      end;
   until salir;

   if (_mr) and (_folio <> 0) then
   begin
      //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
      if _folio <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger then
      begin
         spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger    := qyAnticiposEnc.FieldByName('R_ALMACEN').AsInteger;
         spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsInteger := _folio;
         spMODIFICAR_FOLIO.ExecProc;
         spMODIFICAR_FOLIO.Transaction.CommitRetaining;
      end;
      //incrementa folio para siguiente anticipo
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyAnticiposEnc.FieldByName('R_ALMACEN').AsInteger;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'Si';
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;
   end;

   if (_mr) and (_folio <> 0) then
   begin
      qyActulizar.ParamByName('P_ID').AsInteger    := qyAnticiposEnc.FieldByName('R_ID').AsInteger;
      qyActulizar.ParamByName('P_FOLIO').AsInteger := _folio;
      qyActulizar.ExecSQL;
      qyActulizar.Transaction.CommitRetaining;
      reglas.refresh_IBQuery(qyAnticiposEnc);

      result := true;
   end
   else
      result := false;
end;

procedure TRPT_ANTICIPOS.imprimir;

begin

end;

procedure TRPT_ANTICIPOS.preview;
begin
end;


end.
