unit RPT_CORTE_CAJAS_CXC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmRPT_CORTE_CAJAS_CXC = class(TForm)
    dsCorteDeCajas: TDataSource;
    qyCorteDeCajasCXC: TIBQuery;
    qyCorteDeCajasCXCR_ID: TIntegerField;
    qyCorteDeCajasCXCR_FOLIO_PAGO: TIntegerField;
    qyCorteDeCajasCXCR_FECHA_ALTA: TDateTimeField;
    qyCorteDeCajasCXCR_ALMACEN: TIntegerField;
    qyCorteDeCajasCXCR_ALMACEN_CLAVE: TIBStringField;
    qyCorteDeCajasCXCR_ALMACEN_NOMBRE: TIBStringField;
    qyCorteDeCajasCXCR_CAJERO: TIntegerField;
    qyCorteDeCajasCXCR_CAJERO_NOMBRE: TIBStringField;
    qyCorteDeCajasCXCR_CAJA: TIntegerField;
    qyCorteDeCajasCXCR_CAJA_NOMBRE: TIBStringField;
    qyCorteDeCajasCXCR_GRANTOTAL: TFloatField;
    qyCorteDeCajasCXCR_ESTATUS: TIBStringField;
    qyCorteDeCajasCXCR_PRIORIDAD: TIBStringField;
    qyCorteDeCajasCXCR_CLIENTE: TIntegerField;
    qyCorteDeCajasCXCR_CLIENTE_CLAVE: TIBStringField;
    qyCorteDeCajasCXCR_CLIENTE_NOMBRE: TIBStringField;
    qyCorteDeCajasCXCR_MONEDA: TIntegerField;
    qyCorteDeCajasCXCR_MONEDA_CLAVE: TIBStringField;
    qyCorteDeCajasCXCR_MONEDA_DESCRIPCION: TIBStringField;
    qyCorteDeCajasCXCR_TOTAL_MBASE: TFloatField;
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
  frmRPT_CORTE_CAJAS_CXC: TfrmRPT_CORTE_CAJAS_CXC;}

implementation

uses
  reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmRPT_CORTE_CAJAS_CXC.Preview;
begin
   qyCorteDeCajasCXC.Close;
   qyCorteDeCajasCXC.ParamByName('P_FECHA_DEL').AsString := FormatDateTime('dd/mm/yyyy',fechaInicio);
   qyCorteDeCajasCXC.ParamByName('P_FECHA_AL').AsString  := FormatDateTime('dd/mm/yyyy',fechaFin);
   qyCorteDeCajasCXC.ParamByName('P_CAJA').AsInteger     := caja;
   qyCorteDeCajasCXC.ParamByName('P_ALMACEN').AsInteger  := almacen;
   qyCorteDeCajasCXC.ParamByName('P_OPCION').AsInteger   := opcion;
   qyCorteDeCajasCXC.Open;
   //qrCorteCajas.PreviewModal;
end;


procedure TfrmRPT_CORTE_CAJAS_CXC.FormCreate(Sender: TObject);
begin
   opcion  := 0;
   almacen := 0;
   caja    := 0;

end;


end.
