
unit explorar_punto_de_ventas_reporteador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,  ComCtrls, Grids, DBGrids, Buttons, Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_punto_de_ventas_rep = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FOLIO_DE_VENTA: TIntegerField;
    qyExplorarR_SUBTOTAL: TFloatField;
    qyExplorarR_IVA: TFloatField;
    qyExplorarR_IEPS: TFloatField;
    qyExplorarR_IMPUESTO1: TFloatField;
    qyExplorarR_IMPUESTO2: TFloatField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_DESCUENTO_GLOBAL_PORC: TFloatField;
    qyExplorarR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    qyExplorarR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_CONDICION_COMERCIAL: TIntegerField;
    qyExplorarR_CAMBIO_ENTREGADO: TFloatField;
    qyExplorarR_TOTAL_REF_PAGOS: TFloatField;
    qyExplorarR_SALDO: TFloatField;
    qyExplorarR_CLIENTE: TIntegerField;
    qyExplorarR_NOMBRE_CLIENTE: TIBStringField;
    qyExplorarR_EXTENSION: TIntegerField;
    qyExplorarR_NOMBRE_EXTENSION: TIBStringField;
    qyExplorarR_MONEDA: TIntegerField;
    qyExplorarR_FOLIO_HISTORICO: TIntegerField;
    qyExplorarR_LIMITE_CREDITO: TFloatField;
    qyExplorarR_LIMITE_DISPONIBLE: TFloatField;
    qyExplorarR_CAJA: TIntegerField;
    qyExplorarR_CAJA_NOMBRE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_CAJERO: TIntegerField;
    qyExplorarR_CAJERO_NOMBRE: TIBStringField;
    qyExplorarR_DV_ID: TIntegerField;
    qyExplorarR_DV_PUNTO_DE_VENTA: TIntegerField;
    qyExplorarR_DV_MATERIAL: TIntegerField;
    qyExplorarR_DV_MATERIAL_CLAVE: TIBStringField;
    qyExplorarR_DV_MATERIAL_DESCRIPCION: TIBStringField;
    qyExplorarR_DV_CANTIDAD: TFloatField;
    qyExplorarR_DV_UNIDAD: TIntegerField;
    qyExplorarR_DV_UNIDAD_DESCRIPCION: TIBStringField;
    qyExplorarR_DV_PRECIO_VENTA: TFloatField;
    qyExplorarR_DV_COSTO_COMPRA: TFloatField;
    qyExplorarR_DV_VENDEDOR: TIntegerField;
    qyExplorarR_DV_VENDEDOR_NOMBRE: TIBStringField;
    qyExplorarR_DV_DESCUENTO_PORC: TFloatField;
    qyExplorarR_DV_SUBTOTAL: TFloatField;
    qyExplorarR_DV_IVA: TFloatField;
    qyExplorarR_DV_IEPS: TFloatField;
    qyExplorarR_DV_IMPUESTO1: TFloatField;
    qyExplorarR_DV_IMPUESTO2: TFloatField;
    qyExplorarR_DV_IVA_PORC: TFloatField;
    qyExplorarR_DV_IEPS_PORC: TFloatField;
    qyExplorarR_DV_IMPUESTO1_PORC: TFloatField;
    qyExplorarR_DV_IMPUESTO2_PORC: TFloatField;
    qyExplorarR_DV_IVA_DP: TFloatField;
    qyExplorarR_DV_IEPS_DP: TFloatField;
    qyExplorarR_DV_IMPUESTO1_DP: TFloatField;
    qyExplorarR_DV_IMPUESTO2_DP: TFloatField;
    qyExplorarR_DV_SUBTOTAL_DP: TFloatField;
    qyExplorarR_DV_IVA_DG: TFloatField;
    qyExplorarR_DV_IEPS_DG: TFloatField;
    qyExplorarR_DV_IMPUESTO1_DG: TFloatField;
    qyExplorarR_DV_IMPUESTO2_DG: TFloatField;
    qyExplorarR_DV_SUBTOTAL_DG: TFloatField;
    qyExplorarR_DV_ESTATUS: TIBStringField;
    qyExplorarR_C_ID: TIntegerField;
    qyExplorarR_C_FOLIO_DE_VENTA: TIntegerField;
    qyExplorarR_C_FOLIO_DE_VENTA_DETALLE: TIntegerField;
    qyExplorarR_C_CAJAS: TIBStringField;
    qyExplorarR_C_COBRO: TIBStringField;
    qyExplorarR_C_NUM_CAJAS: TIntegerField;
    qyExplorarR_C_TIPO_CAJA: TIntegerField;
    qyExplorarR_C_TIPO_CAJA_CLAVE: TIBStringField;
    qyExplorarR_C_TIPO_CAJA_DESCRIPCION: TIBStringField;
    qyExplorarR_C_PRECIO: TFloatField;
    qyExplorarR_C_CALIDADES: TIBStringField;
    qyExplorarR_ALMACEN: TIntegerField;
    qyExplorarR_ALMACEN_CLAVE: TIBStringField;
    qyExplorarR_ALMACEN_NOMBRE: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_DE_VENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_IEPS: TcxGridDBColumn;
    dgExplorarDBTableView1R_IMPUESTO1: TcxGridDBColumn;
    dgExplorarDBTableView1R_IMPUESTO2: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_GLOBAL_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_GLOBAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_PARCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONDICION_COMERCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAMBIO_ENTREGADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL_REF_PAGOS: TcxGridDBColumn;
    dgExplorarDBTableView1R_SALDO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_HISTORICO: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_CREDITO: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_DISPONIBLE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJERO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJERO_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_PUNTO_DE_VENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_MATERIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_MATERIAL_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_MATERIAL_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_CANTIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_UNIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_UNIDAD_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_PRECIO_VENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_COSTO_COMPRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_VENDEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_VENDEDOR_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_DESCUENTO_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IEPS: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO1: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO2: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IVA_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IEPS_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO1_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO2_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IVA_DP: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IEPS_DP: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO1_DP: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO2_DP: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_SUBTOTAL_DP: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IVA_DG: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IEPS_DG: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO1_DG: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_IMPUESTO2_DG: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_SUBTOTAL_DG: TcxGridDBColumn;
    dgExplorarDBTableView1R_DV_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_FOLIO_DE_VENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_FOLIO_DE_VENTA_DETALLE: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_CAJAS: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_COBRO: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_NUM_CAJAS: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_TIPO_CAJA: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_TIPO_CAJA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_TIPO_CAJA_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_PRECIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_CALIDADES: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn;
    procedure ibVerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_punto_de_ventas_rep: TfrmExplorar_punto_de_ventas_rep;

implementation

uses
   inifiles, reglas_de_negocios;

{$R *.DFM}

procedure TfrmExplorar_punto_de_ventas_rep.ibVerClick(Sender: TObject);
begin
  inherited;
//  reglas.abrir_IBQuery_seek('R_ID', qyExplorar.FieldByName('R_ID').AsInteger, qyExplorar);
end;

end.
