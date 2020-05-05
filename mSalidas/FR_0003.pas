unit FR_0003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  frxClass, IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmFR_0003 = class(TForm)
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_COTIZACION: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    modo            : string;
    pedirFolio      : boolean;
    awrUSUARIO      : integer;
    procedure loadImpresora;
    procedure setID(valor : integer);
  public
    { Public declarations }
    procedure Imprimir;
    procedure Preview;
    function Open : boolean;
    function OpenCorta : boolean;
  published
     property ID      : integer write setID;
     property FOLIO   : boolean read pedirFolio write pedirFolio;
     property USUARIO : integer read awrUSUARIO write awrUSUARIO;
  end;

var
  frmFR_0003: TfrmFR_0003;

implementation

uses
  Inifiles, IBReportes, controladorImpresora, reglas_de_negocios;

{$R *.DFM}

procedure TfrmFR_0003.setID(valor : integer);
begin
   //encabezado
   dmReportes.qyEncCotizacion.Close;
   dmReportes.qyEncCotizacion.ParamByName('P_ID').AsInteger := valor;
   dmReportes.qyEncCotizacion.Open;
   //detalle
   dmReportes.qyDetCotizacion.Close;
   dmReportes.qyDetCotizacion.ParamByName('P_ID').AsInteger := valor;
   dmReportes.qyDetCotizacion.Open;
end;

procedure TfrmFR_0003.imprimir;
var
   enteroStr : string;
   fracStr   : string;
begin
   if pedirFolio then
   begin
      spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := 19;//El valor 19 es el folio para cotizaciones, asignado en MODULOS_FUNCION
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := 0;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;{
      idFolio.Entrada := spAUTO_FOLIO.ParamByName('R_FOLIO').AsString;
      idFolio.Execute;
      if (idFolio.Respuesta) and (idFolio.Entrada <> '') then
      begin
         //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
         if StrToInt(idFolio.Entrada) <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger then
         begin
            //El valor 7 es el folio para notas de credito
            spMODIFICAR_FOLIO.ParamByName('P_MODULO').AsInteger      := 19;
            spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger    := 0;
            spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsInteger := StrToInt(idFolio.Entrada);
            spMODIFICAR_FOLIO.ExecProc;
            spMODIFICAR_FOLIO.Transaction.CommitRetaining;
         end;
         spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := 19;//El valor 19 es el folio para cotizaciones
         spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := 0;
         spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'Si';
         spAUTO_FOLIO.ExecProc;
         spAUTO_FOLIO.Transaction.CommitRetaining;
      end;
      }
   end
   else
      begin
      {
         idFolio.Entrada := dmReportes.qyEncCotizacion.FieldByName('R_CONSECUTIVO').AsString;
         idFolio.Execute;
         }
      end;

   {
   if (idFolio.Respuesta) and (idFolio.Entrada <> '') then
   begin
      spACTUALIZA_COTIZACION.ParamByName('P_ID').AsInteger      := dmReportes.qyEncCotizacion.FieldByName('R_ID').AsInteger;
      spACTUALIZA_COTIZACION.ParamByName('P_FOLIO').AsInteger   := StrToInt(idFolio.Entrada);
      spACTUALIZA_COTIZACION.ParamByName('P_USUARIO').AsInteger := USUARIO;
      spACTUALIZA_COTIZACION.ExecProc;
      spACTUALIZA_COTIZACION.Transaction.CommitRetaining;


      //se envia el texto, para poder imprimir y no tener un campo calculado con este valor.
      if (dmReportes.qyEncCotizacion.FieldByName('R_GRANTOTAL').AsString <> '') then
      begin
         reglas.separarFlotante(dmReportes.qyEncCotizacion.FieldByName('R_GRANTOTAL').AsFloat, enteroStr, fracStr);
         leCantidad.Numero := StrToInt(enteroStr);
         leCantidad.Moneda := dmReportes.qyEncCotizacion.FieldByName('R_MONEDA_DESCRIPCION').AsString;
         dmReportes.qyEncCotizacion.ParamByName('P_LETRAS').AsString := UpperCase(leCantidad.AsString + ' ' + fracStr + '/100 ' + dmReportes.qyEncCotizacion.FieldByName('R_MONEDA_CLAVE').AsString);
      end
      else
         dmReportes.qyEncCotizacion.FieldByName('P_LETRAS').AsString := '';

      reglas.refresh_IBQuery(dmReportes.qyEncCotizacion);

      //impresion
      frxReport1.LoadFromFile(ruta+reporte);
      frxReport1.PrintOptions.ShowDialog := false;
      frxReport1.PrepareReport;
      frxReport1.Print;// ShowReport;
   end;
   }
end;

procedure TfrmFR_0003.preview;
begin
   //impresion
   frxReport1.LoadFromFile(ruta+reporte);
   frxReport1.ShowReport;
end;

procedure TfrmFR_0003.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('COTIZACIONES') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boCotizaciones;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1  := iniFile.ReadString('COTIZACIONES','ImpresoraNom1','');
   strPrinterVal1  := iniFile.ReadString('COTIZACIONES','ImpresoraVal1','');
   strEscModel1    := iniFile.ReadString('COTIZACIONES','EscModel1','');
   modo            := iniFile.ReadString('COTIZACIONES','Modo','');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
   modo := upperCase(modo);
end;

function TfrmFR_0003.Open : boolean;
var
   rsp    : boolean;
begin
   rsp     := true;
   reporte := 'frw_cotizacion.fr3';

   if not(FileExists(ruta+reporte)) then
   begin
      rsp           := false;
      ShowMessage('No se encontro reporte: '+ruta+reporte);
   end;

   result := rsp;
end;

function TfrmFR_0003.OpenCorta : boolean;
var
   rsp    : boolean;
begin
   rsp     := true;
   reporte := 'frw_cotizacion_corto.fr3';

   if not(FileExists(ruta+reporte)) then
   begin
      rsp           := false;
      ShowMessage( 'No se encontro reporte: '+ruta+reporte);
   end;

   result := rsp;
end;

procedure TfrmFR_0003.FormCreate(Sender: TObject);
begin
   loadImpresora;
   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';
end;

end.
