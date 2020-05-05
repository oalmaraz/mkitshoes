unit UPRN_0036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IBX.IBStoredProc,   Db, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TPRN_0036 = class(TForm)
    qyEncCotizacion: TIBQuery;
    qyDetCotizacion: TIBQuery;
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_COTIZACION: TIBStoredProc;
    qyEncCotizacionR_EMPRESA_CLAVE: TIBStringField;
    qyEncCotizacionR_EMPRESA_NOMBRE: TIBStringField;
    qyEncCotizacionR_EMPRESA_RAZON_SOCIAL: TIBStringField;
    qyEncCotizacionR_EMPRESA_FACTURAR: TIBStringField;
    qyEncCotizacionR_EMPRESA_RFC: TIBStringField;
    qyEncCotizacionR_EMPRESA_CURP: TIBStringField;
    qyEncCotizacionR_EMPRESA_TELEFONO1: TIBStringField;
    qyEncCotizacionR_EMPRESA_TELEFONO2: TIBStringField;
    qyEncCotizacionR_EMPRESA_CALLE: TIBStringField;
    qyEncCotizacionR_EMPRESA_ENTRE_CALLE: TIBStringField;
    qyEncCotizacionR_EMPRESA_Y_CALLE: TIBStringField;
    qyEncCotizacionR_EMPRESA_NUM_EXT: TIBStringField;
    qyEncCotizacionR_EMPRESA_NUM_INT: TIBStringField;
    qyEncCotizacionR_EMPRESA_LETRA: TIBStringField;
    qyEncCotizacionR_EMPRESA_CP: TIBStringField;
    qyEncCotizacionR_EMPRESA_COLONIA: TIBStringField;
    qyEncCotizacionR_EMPRESA_CIUDAD: TIBStringField;
    qyEncCotizacionR_ID: TIntegerField;
    qyEncCotizacionR_CLAVE: TIBStringField;
    qyEncCotizacionR_FECHA_ALTA: TDateTimeField;
    qyEncCotizacionR_FECHA_VALIDEZ: TDateTimeField;
    qyEncCotizacionR_FECHA_CANCELACION: TDateTimeField;
    qyEncCotizacionR_CLIENTE: TIntegerField;
    qyEncCotizacionR_CLIENTE_NOMBRE: TIBStringField;
    qyEncCotizacionR_CLIENTE_RAZON_SOCIAL: TIBStringField;
    qyEncCotizacionR_CLIENTE_TELEFONO: TIBStringField;
    qyEncCotizacionR_CONDICION_COMERCIAL: TIntegerField;
    qyEncCotizacionR_CC_CLAVE: TIBStringField;
    qyEncCotizacionR_CC_NOMBRE: TIBStringField;
    qyEncCotizacionR_ANTICIPO: TFloatField;
    qyEncCotizacionR_OBSERVACIONES: TBlobField;
    qyEncCotizacionR_SUBTOTAL: TFloatField;
    qyEncCotizacionR_IVA: TFloatField;
    qyEncCotizacionR_IEPS: TFloatField;
    qyEncCotizacionR_IMPUESTO1: TFloatField;
    qyEncCotizacionR_IMPUESTO2: TFloatField;
    qyEncCotizacionR_TOTAL: TFloatField;
    qyEncCotizacionR_DESCUENTO_GLOBAL_PORC: TFloatField;
    qyEncCotizacionR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    qyEncCotizacionR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    qyEncCotizacionR_GRANTOTAL: TFloatField;
    qyEncCotizacionR_MONEDA: TIntegerField;
    qyEncCotizacionR_MONEDA_CLAVE: TIBStringField;
    qyEncCotizacionR_MONEDA_DESCRIPCION: TIBStringField;
    qyEncCotizacionR_ESTATUS: TIBStringField;
    qyEncCotizacionR_CONSECUTIVO: TIntegerField;
    qyEncCotizacionR_VENDEDOR: TIntegerField;
    qyEncCotizacionR_USUARIO_NOMBRE: TIBStringField;
    qyEncCotizacionR_PAGOS: TIntegerField;
    qyEncCotizacionR_FINANCIAMIENTO: TFloatField;
    qyEncCotizacionR_FINANCIAMIENTO_PORC: TFloatField;
    qyEncCotizacionR_IVA_NETO: TFloatField;
    qyEncCotizacionR_IEPS_NETO: TFloatField;
    qyEncCotizacionR_IMPUESTO1_NETO: TFloatField;
    qyEncCotizacionR_IMPUESTO2_NETO: TFloatField;
    qyEncCotizacionR_SUBTOTAL_NETO: TFloatField;
    qyEncCotizacionR_CANTIDAD_CON_LETRAS: TIBStringField;
    qyEncCotizacionR_SUBTOTAL_DP: TFloatField;
    qyEncCotizacionR_SUBTOTAL_DG: TFloatField;
    qyEncCotizacionR_TOTAL_NETO: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrID           : integer;
    awrUSUARIO      : integer;

    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    modo            : string;
    pedirFolio      : boolean;
    procedure loadImpresora;
    procedure setID(valor : integer);
  public
    { Public declarations }
    procedure imprimir;
  published
     property ID      : integer read awrID write setID;
     property FOLIO   : boolean read pedirFolio write pedirFolio;
     property USUARIO : integer read awrUSUARIO write awrUSUARIO;
  end;

var
  PRN_0036: TPRN_0036;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios, IBData, IBModulo;

{$R *.DFM}

procedure TPRN_0036.setID(valor : integer);
begin
   awrID := valor;
   //encabezado
   qyEncCotizacion.Close;
   qyEncCotizacion.ParamByName('P_ID').AsInteger := valor;
   qyEncCotizacion.Open;
   //detalle
   qyDetCotizacion.Close;
   qyDetCotizacion.ParamByName('P_ID').AsInteger := valor;
   qyDetCotizacion.Open;
end;

procedure TPRN_0036.loadImpresora;
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

procedure TPRN_0036.imprimir;
var
   //prDos : TprTxReport;
   //prWin : TprReport;
   enteroStr : string;
   fracStr   : string;
begin
   if pedirFolio then
   begin
      spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := 19;//El valor 19 es el folio para cotizaciones, asignado en MODULOS_FUNCION
      spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := 0;
      spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
      spAUTO_FOLIO.ExecProc;
      spAUTO_FOLIO.Transaction.CommitRetaining;
      {
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
         idFolio.Entrada := qyEncCotizacion.FieldByName('R_CONSECUTIVO').AsString;
         idFolio.Execute;
         }
      end;
   {
   if (idFolio.Respuesta) and (idFolio.Entrada <> '') then
   begin
      spACTUALIZA_COTIZACION.ParamByName('P_ID').AsInteger      := qyEncCotizacion.FieldByName('R_ID').AsInteger;
      spACTUALIZA_COTIZACION.ParamByName('P_FOLIO').AsInteger   := StrToInt(idFolio.Entrada);
      spACTUALIZA_COTIZACION.ParamByName('P_USUARIO').AsInteger := USUARIO;
      spACTUALIZA_COTIZACION.ExecProc;
      spACTUALIZA_COTIZACION.Transaction.CommitRetaining;


      //se envia el texto, para poder imprimir y no tener un campo calculado con este valor.
      if (qyEncCotizacion.FieldByName('R_GRANTOTAL').AsString <> '') then
      begin
         reglas.separarFlotante(qyEncCotizacion.FieldByName('R_GRANTOTAL').AsFloat, enteroStr, fracStr);
         leCantidad.Numero := StrToInt(enteroStr);
         leCantidad.Moneda := qyEncCotizacion.FieldByName('R_MONEDA_DESCRIPCION').AsString;
         qyEncCotizacion.ParamByName('P_LETRAS').AsString := UpperCase(leCantidad.AsString + ' ' + fracStr + '/100 ' + qyEncCotizacion.FieldByName('R_MONEDA_CLAVE').AsString);
      end
      else
         qyEncCotizacion.FieldByName('P_LETRAS').AsString := '';

      reglas.refresh_IBQuery(qyEncCotizacion);

      //impresion
      if modo = 'DOS' then
      begin
         prDOS := TprTxReport.Create(Self);
         prDOS.LoadTemplateFromFile(ruta+reporte,false);
         prDOS.PrinterName  := strImpresora;
         prDOS.ESCModelName := strEscImpresora;
         prDOS.PrepareReport;
         prDOS.PrintPreparedReport;
         prDOS.Destroy;
      end
      else
         if modo = 'WIN' then
         begin
            prWIN := TprReport.Create(Self);
            prWIN.LoadTemplateFromFile(ruta+reporte,false);
            prWIN.PrinterName := strImpresora;
            prWIN.PrepareReport;
            prWIN.PrintPreparedReport;
            prWIN.Destroy;
         end;
   end;
   }
end;

procedure TPRN_0036.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
   nombre : string;
begin
   loadImpresora;
   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';

   if modo = 'DOS' then
      nombre := 'cotizaciones.prt'
   else
      if modo = 'WIN' then
         nombre := 'win_cotizaciones.prt';

   if FindFirst(ruta+nombre, faAnyFile, SearchRec) = 0 then
   begin
      reporte := nombre;
   end;
end;


end.

