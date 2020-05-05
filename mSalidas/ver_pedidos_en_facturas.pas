unit ver_pedidos_en_facturas;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery,  ExtCtrls,
  StdCtrls, Grids, DBGrids, Buttons;

type
  TfrmVer_Pedidos_en_Facturas = class(TfrmPadre)
    ibActualizar: TBitBtn;
    ibEliminar: TBitBtn;
    dgPedidos: TDBGrid;
    qyPedidos: TIBQuery;
    dsPedidos: TDataSource;
    spDEL_PEDIDO_EN_FACTURA: TIBStoredProc;
    spACT_PEDIDO_EN_FACTURA: TIBStoredProc;
    ibSalir: TBitBtn;
    qyPedidosR_ID: TIntegerField;
    qyPedidosR_CLAVE: TIBStringField;
    qyPedidosR_FECHA_ALTA: TDateTimeField;
    qyPedidosR_FECHA_VALIDEZ: TDateTimeField;
    dsPartidas: TDataSource;
    procedure ibEliminarClick(Sender: TObject);
    procedure ibActualizarClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
    factura : integer;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_factura : integer);
  end;

var
  frmVer_Pedidos_en_Facturas: TfrmVer_Pedidos_en_Facturas;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmVer_Pedidos_en_Facturas.Crear(AOwner : TComponent; p_factura : integer);
begin
   Create(AOwner);
   factura := p_factura;
   qyPedidos.Close;
   qyPedidos.ParamByName('P_FACTURA').AsInteger := p_factura;
   qyPedidos.Open;
end;

procedure TfrmVer_Pedidos_en_Facturas.ibEliminarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgPedidos.DataSource.Dataset.RecordCount - 1 do
  begin
  {
     if dgPedidos.Items[i].Selected then
     begin
        spDEL_PEDIDO_EN_FACTURA.ParamByName('P_PEDIDO').AsInteger  := dgPedidos.Items[i].Values[0];
        spDEL_PEDIDO_EN_FACTURA.ParamByName('P_FACTURA').AsInteger := factura;
        spDEL_PEDIDO_EN_FACTURA.ExecProc;
        spDEL_PEDIDO_EN_FACTURA.Transaction.CommitRetaining;
     end;
     }
  end;
  reglas.refresh_IBQuery(qyPedidos);
  reglas.abrir_IBTabla(TIBTable(dsPartidas.DataSet));
end;

procedure TfrmVer_Pedidos_en_Facturas.ibActualizarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgPedidos.DataSource.Dataset.RecordCount - 1 do
  begin
  {
     if dgPedidos.Items[i].Selected then
     begin
        spACT_PEDIDO_EN_FACTURA.ParamByName('P_PEDIDO').AsInteger  := dgPedidos.Items[i].Values[0];
        spACT_PEDIDO_EN_FACTURA.ParamByName('P_FACTURA').AsInteger := factura;
        spACT_PEDIDO_EN_FACTURA.ExecProc;
        spACT_PEDIDO_EN_FACTURA.Transaction.CommitRetaining;
     end
     }
  end;
  reglas.refresh_IBQuery(qyPedidos);
  reglas.abrir_IBTabla(TIBTable(dsPartidas.DataSet));
end;

procedure TfrmVer_Pedidos_en_Facturas.ibSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
