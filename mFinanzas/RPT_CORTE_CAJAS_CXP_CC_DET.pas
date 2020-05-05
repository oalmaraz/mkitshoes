unit RPT_CORTE_CAJAS_CXP_CC_DET;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,   ExtCtrls;

type
  TfrmRPT_CORTE_CAJAS_CXP_CC_DET = class(TForm)
    qyCorteDetalle: TIBQuery;
    qyCorteDetalleR_ID: TIntegerField;
    qyCorteDetalleR_FOLIO_PAGO: TIntegerField;
    qyCorteDetalleR_CAJA: TIntegerField;
    qyCorteDetalleR_CAJA_NOMBRE: TIBStringField;
    qyCorteDetalleR_FECHA: TDateTimeField;
    qyCorteDetalleR_GRANTOTAL: TFloatField;
    qyCorteDetalleR_ESTATUS: TIBStringField;
    qyCorteDetalleR_CC_PAGO: TIntegerField;
    qyCorteDetalleR_CC_PAGO_NOMBRE: TIBStringField;
    qyCorteDetalleR_MONTO: TFloatField;
    qyCorteDetalleR_ESTATUS_DETALLE: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrCambio  : boolean;
    awrCaja    : integer;
    awrAlmacen : integer;
    awrFInicio : TDatetime;
    awrFFin    : TDatetime;
  public
    { Public declarations }
    procedure Preview;
  published
     property caja : integer read awrCaja write awrCaja;
     property almacen : integer read awrAlmacen write awrAlmacen;
     property fechaInicio : TDatetime read awrFInicio write awrFInicio;
     property fechaFin : TDatetime read awrFFin write awrFFin;
  end;

var
  frmRPT_CORTE_CAJAS_CXP_CC_DET: TfrmRPT_CORTE_CAJAS_CXP_CC_DET;

implementation

uses
  reglas_de_negocios;

{$R *.DFM}

procedure TfrmRPT_CORTE_CAJAS_CXP_CC_DET.Preview;
begin
   qyCorteDetalle.Close;
   qyCorteDetalle.ParamByName('P_FECHA').AsDate   := fechaInicio;
   qyCorteDetalle.ParamByName('P_CAJA').AsInteger := caja;
   qyCorteDetalle.Open;
end;

procedure TfrmRPT_CORTE_CAJAS_CXP_CC_DET.FormCreate(Sender: TObject);
begin
   almacen := 0;
   caja    := 0;
end;



end.
