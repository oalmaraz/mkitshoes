unit ver_cotizaciones_en_pedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmVer_Cotizaciones_en_Pedidos = class(TfrmPadre)
    ibActualizar: TBitBtn;
    ibEliminar: TBitBtn;
    dgCotizaciones: TDBGrid;
    qyCotizaciones: TIBQuery;
    dsCotizaciones: TDataSource;
    spELIMINAR_COT_EN_PEDIDO: TIBStoredProc;
    spACT_COT_EN_PEDIDO: TIBStoredProc;
    ibSalir: TBitBtn;
    qyCotizacionesR_ID: TIntegerField;
    qyCotizacionesR_CLAVE: TIBStringField;
    qyCotizacionesR_NOMBRE: TIBStringField;
    qyCotizacionesR_TELEFONO: TIBStringField;
    dsPartidas: TDataSource;
    procedure ibEliminarClick(Sender: TObject);
    procedure ibActualizarClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
    pedido : integer;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_pedido : integer);
  end;

var
  frmVer_Cotizaciones_en_Pedidos: TfrmVer_Cotizaciones_en_Pedidos;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmVer_Cotizaciones_en_Pedidos.Crear(AOwner : TComponent; p_pedido : integer);
begin
   Create(AOwner);
   pedido := p_pedido;
   qyCotizaciones.Close;
   qyCotizaciones.ParamByName('P_PEDIDO').AsInteger := p_pedido;
   qyCotizaciones.Open;
end;

procedure TfrmVer_Cotizaciones_en_Pedidos.ibEliminarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgCotizaciones.datasource.DataSet.RecordCount - 1 do
  begin
     {
     if dgCotizaciones.Items[i].Selected then
     begin
        spELIMINAR_COT_EN_PEDIDO.ParamByName('P_COTIZACION').AsInteger := dgCotizaciones.Items[i].Values[0];
        spELIMINAR_COT_EN_PEDIDO.ParamByName('P_PEDIDO').AsInteger     := pedido;
        spELIMINAR_COT_EN_PEDIDO.ExecProc;
        spELIMINAR_COT_EN_PEDIDO.Transaction.CommitRetaining;
     end;
     }
  end;
  reglas.refresh_IBQuery(qyCotizaciones);
  reglas.abrir_IBTabla(TIBTable(dsPartidas.DataSet));
end;

procedure TfrmVer_Cotizaciones_en_Pedidos.ibActualizarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgCotizaciones.datasource.DataSet.RecordCount - 1 do
  begin
     {
     if dgCotizaciones.Items[i].Selected then
     begin
        spACT_COT_EN_PEDIDO.ParamByName('P_COTIZACION').AsInteger := dgCotizaciones.Items[i].Values[0];
        spACT_COT_EN_PEDIDO.ParamByName('P_PEDIDO').AsInteger     := pedido;
        spACT_COT_EN_PEDIDO.ExecProc;
        spACT_COT_EN_PEDIDO.Transaction.CommitRetaining;
     end
     }
  end;
  reglas.refresh_IBQuery(qyCotizaciones);
  reglas.abrir_IBTabla(TIBTable(dsPartidas.DataSet));
end;

procedure TfrmVer_Cotizaciones_en_Pedidos.ibSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
