unit RPT_CORTE_CHEQUES_GIRADOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ExtCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids, DBGrids;

type
  TfrmRPT_CORTE_CHEQUES_GIRADOS = class(TForm)
    qyCheques: TIBQuery;
    qyChequesR_ID: TIntegerField;
    qyChequesR_REFERENCIA: TIBStringField;
    qyChequesR_MONTO: TFloatField;
    qyChequesR_MONEDA: TIntegerField;
    qyChequesR_MONEDA_CLAVE: TIBStringField;
    qyChequesR_PROVEEDOR: TIntegerField;
    qyChequesR_PROVEEDOR_NOMBRE: TIBStringField;
    qyChequesR_FECHA_ALTA: TDateTimeField;
    qyChequesR_FECHA_APLICACION: TDateTimeField;
    qyChequesR_FECHA_APLICACION_REAL: TDateTimeField;
    qyChequesR_BANCO: TIntegerField;
    qyChequesR_BANCO_NOMBRE: TIBStringField;
    qyChequesR_OBSERVACIONES: TBlobField;
    qyChequesR_AUTORIZO: TIntegerField;
    qyChequesR_AUTORIZO_NOMBRE: TIBStringField;
    qyChequesR_CONSECUTIVO: TIntegerField;
    qyChequesR_ESTATUS: TIBStringField;
    qyChequesR_PAGADO: TFloatField;
    qyChequesR_PENDIENTE: TFloatField;
    qyChequesR_BANCO_CUENTA: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrCambio        : boolean;
    awrEstatus       : integer;
    awrBancos        : integer;
    awrMonedas       : integer;
    awrFInicio       : TDatetime;
    awrFFin          : TDatetime;
    awrPorAplicacion : String;
  public
    { Public declarations }
    procedure Preview;
  published
     property Estatus       : integer read awrEstatus write awrEstatus;
     property Banco         : integer read awrBancos write awrBancos;
     property Moneda        : integer read awrMonedas write awrMonedas;
     property fechaInicio   : TDatetime read awrFInicio write awrFInicio;
     property fechaFin      : TDatetime read awrFFin write awrFFin;
     property PorAplicacion : String read awrPorAplicacion write awrPorAplicacion;
  end;

var
  frmRPT_CORTE_CHEQUES_GIRADOS: TfrmRPT_CORTE_CHEQUES_GIRADOS;

implementation

uses
  reglas_de_negocios;

{$R *.DFM}

procedure TfrmRPT_CORTE_CHEQUES_GIRADOS.Preview;
begin
   qyCheques.Close;
   qyCheques.ParamByName('P_FECHA_DEL').AsDateTime    := awrFInicio;
   qyCheques.ParamByName('P_FECHA_AL').AsDateTime     := awrFFin;
   qyCheques.ParamByName('P_ESTATUS').AsInteger       := awrEstatus;
   qyCheques.ParamByName('P_BANCO').AsInteger         := awrBancos;
   qyCheques.ParamByName('P_MONEDA').AsInteger        := awrMonedas;
   qyCheques.ParamByName('P_POR_APLICACION').AsString := awrPorAplicacion;
   qyCheques.Open;
   //qrCheques.Preview;
end;

procedure TfrmRPT_CORTE_CHEQUES_GIRADOS.FormCreate(Sender: TObject);
begin
   Estatus := -1;
   Banco   := -1;
   Moneda  := -1;
end;

end.
