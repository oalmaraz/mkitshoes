unit RPT_CORTE_CAJAS_CXC_CC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
 Db, IBX.IBCustomDataSet, IBX.IBQuery,  ExtCtrls;

type
  TfrmRPT_CORTE_CAJAS_CXC_CC = class(TForm)
    qyCorteCC: TIBQuery;
    qyCorteCCR_MONTO_PAGO: TFloatField;
    qyCorteCCR_CC: TIntegerField;
    qyCorteCCR_CC_NOMBRE: TIBStringField;
    qyCorteCCR_CAJA: TIntegerField;
    qyCorteCCR_CAJA_NOMBRE: TIBStringField;
    qyCorteCCR_ALMACEN: TIntegerField;
    qyCorteCCR_ALMACEN_CLAVE: TIBStringField;
    qyCorteCCR_ALMACEN_NOMBRE: TIBStringField;
    qyCorteCCR_FECHA: TDateTimeField;
    qyCorteCCR_PRIORIDAD: TIBStringField;
    qyCorteCCR_MONTO_COLECTA: TFloatField;
    qyCorteCCR_SALDO: TFloatField;
    qyResumenCC: TIBQuery;
    qyResumenCCR_MONTO_PAGO: TFloatField;
    qyResumenCCR_CC: TIntegerField;
    qyResumenCCR_CC_NOMBRE: TIBStringField;
    qyResumenCCR_PRIORIDAD: TIBStringField;
    qyResumenCCR_MONTO_COLECTA: TFloatField;
    qyResumenCCR_SALDO: TFloatField;
    qyCorteCCR_MONEDA: TIntegerField;
    qyCorteCCR_MONEDA_CLAVE: TIBStringField;
    qyCorteCCR_MONEDA_DESCRIPCION: TIBStringField;
    qyCorteCCR_TOTAL_MBASE: TFloatField;
    qyResumenCCR_MONEDA: TIntegerField;
    qyResumenCCR_MONEDA_CLAVE: TIBStringField;
    qyResumenCCR_MONEDA_DESCRIPCION: TIBStringField;
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
  frmRPT_CORTE_CAJAS_CXC_CC: TfrmRPT_CORTE_CAJAS_CXC_CC;}

implementation

uses
  reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmRPT_CORTE_CAJAS_CXC_CC.Preview;
begin
   qyCorteCC.Close;
   qyCorteCC.ParamByName('P_FECHA_DEL').AsString := FormatDateTime('dd/mm/yyyy',fechaInicio);
   qyCorteCC.ParamByName('P_FECHA_AL').AsString  := FormatDateTime('dd/mm/yyyy',fechaFin);
   qyCorteCC.ParamByName('P_CAJA').AsInteger     := caja;
   qyCorteCC.ParamByName('P_ALMACEN').AsInteger  := almacen;
   qyCorteCC.ParamByName('P_OPCION').AsInteger   := opcion;
   qyCorteCC.Open;
   qyResumenCC.Close;
   qyResumenCC.ParamByName('P_FECHA_DEL').AsString := FormatDateTime('dd/mm/yyyy',fechaInicio);
   qyResumenCC.ParamByName('P_FECHA_AL').AsString  := FormatDateTime('dd/mm/yyyy',fechaFin);
   qyResumenCC.ParamByName('P_CAJA').AsInteger     := caja;
   qyResumenCC.ParamByName('P_ALMACEN').AsInteger  := almacen;
   qyResumenCC.ParamByName('P_OPCION').AsInteger   := opcion;
   qyResumenCC.Open;
//   crCorte.Preview;
end;

procedure TfrmRPT_CORTE_CAJAS_CXC_CC.FormCreate(Sender: TObject);
begin
   opcion  := 6;
   almacen := 0;
   caja    := 0;

end;


end.
