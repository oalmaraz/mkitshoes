unit RPT_CORTE_CAJAS_CXC_DET;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,   ExtCtrls;

type
  TfrmRPT_CORTE_CAJAS_CXC_DET = class(TForm)
    dsDetalle: TDataSource;
    qyDetalleCXC: TIBQuery;
    qyDetalleCXCR_ID: TIntegerField;
    qyDetalleCXCR_FOLIO_PAGO: TIntegerField;
    qyDetalleCXCR_FECHA_ALTA: TDateTimeField;
    qyDetalleCXCR_ALMACEN: TIntegerField;
    qyDetalleCXCR_ALMACEN_CLAVE: TIBStringField;
    qyDetalleCXCR_ALMACEN_NOMBRE: TIBStringField;
    qyDetalleCXCR_CAJERO: TIntegerField;
    qyDetalleCXCR_CAJERO_NOMBRE: TIBStringField;
    qyDetalleCXCR_CAJA: TIntegerField;
    qyDetalleCXCR_CAJA_NOMBRE: TIBStringField;
    qyDetalleCXCR_GRANTOTAL: TFloatField;
    qyDetalleCXCR_ESTATUS: TIBStringField;
    qyDetalleCXCR_PRIORIDAD: TIBStringField;
    qyDetalleCXCR_CLIENTE: TIntegerField;
    qyDetalleCXCR_CLIENTE_CLAVE: TIBStringField;
    qyDetalleCXCR_CLIENTE_NOMBRE: TIBStringField;
    qyDetalleCXCR_DET_ID: TIntegerField;
    qyDetalleCXCR_DET_CUENTA_POR_COBRAR: TIntegerField;
    qyDetalleCXCR_DET_FECHA_DOCUMENTO: TDateTimeField;
    qyDetalleCXCR_DET_FECHA_VENCIMIENTO: TDateTimeField;
    qyDetalleCXCR_DET_IMPORTE: TFloatField;
    qyDetalleCXCR_DET_IMPORTE_INICIAL: TFloatField;
    qyDetalleCXCR_DET_SUERTE_PRINCIPAL: TFloatField;
    qyDetalleCXCR_DET_FINANCIAMIENTO: TFloatField;
    qyDetalleCXCR_DET_MORATORIOS: TFloatField;
    qyDetalleCXCR_DET_GASTOS: TFloatField;
    qyDetalleCXCR_DET_OTROS: TFloatField;
    qyDetalleCXCR_DET_NUMERO_DOCUMENTOS: TIntegerField;
    qyDetalleCXCR_DET_DOCUMENTO: TIntegerField;
    qyDetalleCXCR_DET_ETAPA_COBRANZA: TIntegerField;
    qyDetalleCXCR_DET_ESTATUS: TIBStringField;
    qyDetalleCXCR_DET_PRIORIDAD: TIBStringField;
    qyDetalleCXCR_EXTENSION: TIntegerField;
    qyDetalleCXCR_EXTENSION_CLAVE: TIBStringField;
    qyDetalleCXCR_EXTENSION_NOMBRE: TIBStringField;
    qyDetalleCXCR_GRANTOTAL_DETALLE: TFloatField;
    qyDetalleCXCR_REFERENCIA: TIBStringField;
    qyDetalleCXCR_MONEDA: TIntegerField;
    qyDetalleCXCR_MONEDA_CLAVE: TIBStringField;
    qyDetalleCXCR_MONEDA_DESCRIPCION: TIBStringField;
    qyDetalleCXCR_TOTAL_MBASE: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrCambio  : boolean;
    awrCaja    : integer;
    awrAlmacen : integer;
    awrFInicio : TDatetime;
    awrFFin    : TDatetime;
    awrOpcion  : integer;
  public
    { Public declarations }
    procedure Preview;
  published
     property caja : integer read awrCaja write awrCaja;
     property almacen : integer read awrAlmacen write awrAlmacen;
     property fechaInicio : TDatetime read awrFInicio write awrFInicio;
     property fechaFin : TDatetime read awrFFin write awrFFin;
     property opcion : integer read awrOpcion write awrOpcion;
  end;

{var
  frmRPT_CAJAS_CORTE_CXC_DET: TfrmRPT_CAJAS_CORTE_CXC_DET;}

implementation

uses
  reglas_de_negocios;

{$R *.DFM}

procedure TfrmRPT_CORTE_CAJAS_CXC_DET.Preview;
begin
   qyDetalleCXC.Close;
   qyDetalleCXC.ParamByName('P_FECHA_DEL').AsString := FormatDateTime('dd/mm/yyyy',fechaInicio);
   qyDetalleCXC.ParamByName('P_FECHA_AL').AsString  := FormatDateTime('dd/mm/yyyy',fechaFin);
   qyDetalleCXC.ParamByName('P_CAJA').AsInteger     := caja;
   qyDetalleCXC.ParamByName('P_ALMACEN').AsInteger  := almacen;
   qyDetalleCXC.ParamByName('P_OPCION').AsInteger   := opcion;
   qyDetalleCXC.Open;
   //qrCorteDetalle.PreviewModal;
end;

procedure TfrmRPT_CORTE_CAJAS_CXC_DET.FormCreate(Sender: TObject);
begin
   opcion  := 3;
   almacen := 0;
   caja    := 0;
end;


end.
