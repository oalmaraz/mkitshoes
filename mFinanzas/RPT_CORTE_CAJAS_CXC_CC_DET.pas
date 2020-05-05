unit RPT_CORTE_CAJAS_CXC_CC_DET;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery, ExtCtrls, reglas_de_negocios,
  IBModulo;

type
  TfrmRPT_CORTE_CAJAS_CXC_CC_DET = class(TForm)
    qyCorteDetalleCC: TIBQuery;
    qyCorteDetalleCCR_ID: TIntegerField;
    qyCorteDetalleCCR_FOLIO_PAGO: TIntegerField;
    qyCorteDetalleCCR_CAJA: TIntegerField;
    qyCorteDetalleCCR_CAJA_NOMBRE: TIBStringField;
    qyCorteDetalleCCR_FECHA_ALTA: TDateTimeField;
    qyCorteDetalleCCR_ESTATUS: TIBStringField;
    qyCorteDetalleCCR_FECHA: TDateTimeField;
    qyCorteDetalleCCR_ALMACEN: TIntegerField;
    qyCorteDetalleCCR_ALMACEN_CLAVE: TIBStringField;
    qyCorteDetalleCCR_ALMACEN_NOMBRE: TIBStringField;
    qyCorteDetalleCCR_PRIORIDAD: TIBStringField;
    qyCorteDetalleCCR_CC: TIntegerField;
    qyCorteDetalleCCR_CC_NOMBRE: TIBStringField;
    qyCorteDetalleCCR_MONTO: TFloatField;
    qyCorteDetalleCCR_ESTATUS_DETALLE: TIBStringField;
    qyCorteDetalleCCR_GRANTOTAL: TFloatField;
    qyCorteDetalleCCR_CAMBIO: TFloatField;
    qyCorteDetalleCCR_CLIENTE: TIntegerField;
    qyCorteDetalleCCR_CLIENTE_CLAVE: TIBStringField;
    qyCorteDetalleCCR_CLIENTE_NOMBRE: TIBStringField;
    qyCorteDetalleCCR_MONEDA: TIntegerField;
    qyCorteDetalleCCR_MONEDA_CLAVE: TIBStringField;
    qyCorteDetalleCCR_MONEDA_DESCRIPCION: TIBStringField;
    qyCorteDetalleCCR_TOTAL_MBASE: TFloatField;
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
  frmRPT_CORTE_CAJAS_CXC_CC_DET: TfrmRPT_CORTE_CAJAS_CXC_CC_DET;}

implementation

{$R *.DFM}

procedure TfrmRPT_CORTE_CAJAS_CXC_CC_DET.Preview;
begin
   qyCorteDetalleCC.Close;
   qyCorteDetalleCC.ParamByName('P_FECHA_DEL').AsString := FormatDateTime('dd/mm/yyyy',fechaInicio);
   qyCorteDetalleCC.ParamByName('P_FECHA_AL').AsString  := FormatDateTime('dd/mm/yyyy',fechaFin);
   qyCorteDetalleCC.ParamByName('P_CAJA').AsInteger     := caja;
   qyCorteDetalleCC.ParamByName('P_ALMACEN').AsInteger  := almacen;
   qyCorteDetalleCC.ParamByName('P_OPCION').AsInteger   := opcion;
   qyCorteDetalleCC.Open;
//   qrCComercialDetalle.Preview;
end;

procedure TfrmRPT_CORTE_CAJAS_CXC_CC_DET.FormCreate(Sender: TObject);
begin
   opcion  := 9;
   almacen := 0;
   caja    := 0;
end;


end.
