unit U0002_PR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet,   IBX.IBQuery, Grids, DBGrids,
   IBX.IBStoredProc;

type
  TPR_0002 = class(TForm)
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    qyActulizar: TIBQuery;
    qyPartDesempaque: TIBQuery;
    qyEncDesempaque: TIBQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    awrID           : integer;

    procedure loadImpresora;
    procedure setID(p_id : integer);
  public
    { Public declarations }
    function openReporte : boolean;
    procedure imprimir;
    procedure preview;
  published
      property ID : integer write setID;
  end;

var
  PR_0002: TPR_0002;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios, UfrmFolio;

{$R *.DFM}

function TPR_0002.openReporte : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   //cargar archivo del directorio de reportes
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\';
   reporte := 'win_desempaque.prt';
   if not(FileExists(ruta+reporte)) then
   begin
      tmp := false;
      ShowMessage('Falta archivo: '+ruta+reporte);
   end;

   result := tmp;
end;

procedure TPR_0002.setID(p_id : integer);
begin
   awrID := p_id;
   qyEncDesempaque.Close;
   qyEncDesempaque.ParamByName('P_ID').AsInteger := p_id;
   qyEncDesempaque.Open;

   qyPartDesempaque.Close;
   qyPartDesempaque.ParamByName('P_ID').AsInteger := p_id;
   qyPartDesempaque.Open;
end;

procedure TPR_0002.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('DESEMPAQUES') then
   begin
      frmControladorImpresoras       := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boDesempaques;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('DESEMPAQUES','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('DESEMPAQUES','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('DESEMPAQUES','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

procedure TPR_0002.preview;
//var
  // prWINReporte : TprReport;
begin
{
   prWINReporte := TprReport.Create(Self);
   prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
   prWINReporte.PrinterName  := strImpresora;
   prWINReporte.PrepareReport;
   prWINReporte.PreviewPreparedReport(true);
   prWINReporte.Destroy;
   }
end;

procedure TPR_0002.imprimir;
var
   //prWINReporte : TprReport;
   salir      : boolean;
   _mr        : boolean;
   _folio     : integer;
begin
   {
   repeat

      salir := true;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyEncDesempaque.FieldByName('R_ALMACEN').AsInteger;
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;

      try
         frmFolio        := TfrmFolio.Create(Application);
         frmFolio.Titulo := 'Desemapaque';
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
         qyVerificarFolio.ParamByName('P_ID').AsInteger      := qyEncDesempaque.FieldByName('R_ID').AsInteger;
         qyVerificarFolio.ParamByName('P_FOLIO').AsInteger   := _folio;
         qyVerificarFolio.Open;
         salir := (qyVerificarFolio.FieldByName('R_ACEPTADO').AsString = 'Si');
         if qyVerificarFolio.FieldByName('R_ACEPTADO').AsString = 'No' then
            meFolioRepetido.Execute;
      end;
   until salir;

   if (_mr) and (_folio <> 0) then
   begin
      //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
      if _folio <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger then
      begin
         spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger    := qyEncDesempaque.FieldByName('R_ALMACEN').AsInteger;
         spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsInteger := _folio;
         spMODIFICAR_FOLIO.ExecProc;
         spMODIFICAR_FOLIO.Transaction.CommitRetaining;
      end;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'Si';
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyEncDesempaque.FieldByName('R_ALMACEN').AsInteger;
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;
   end;

   if (_mr) and (_folio <> 0) then
   begin
      qyActulizar.ParamByName('P_ID').AsInteger    := qyEncDesempaque.FieldByName('R_ID').AsInteger;
      qyActulizar.ParamByName('P_FOLIO').AsInteger := _folio;
      qyActulizar.ExecSQL;
      qyActulizar.Transaction.CommitRetaining;
      reglas.refresh_IBQuery(qyEncDesempaque);

      //impresion WIN
      prWINReporte := TprReport.Create(Self);
      prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
      prWINReporte.PrinterName  := strImpresora;
      prWINReporte.PrepareReport;
      prWINReporte.PrintPreparedReport;
      prWINReporte.Destroy;
   end;
   }
end;

procedure TPR_0002.FormCreate(Sender: TObject);
begin
   loadImpresora;
end;

end.
