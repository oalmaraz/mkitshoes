unit ver_detalle_venta;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  hijo, Db, IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls,
  StdCtrls, Mask,
   Buttons, Grids, DBGrids, ExtCtrls;

type
  TfrmVerDetalleHijo = class(TfrmHijo)
    Label1: TLabel;
    dxDBGrid1: TDBGrid;
    qyPartidas: TIBQuery;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PUNTO_DE_VENTA: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_PRECIO: TFloatField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_TOTAL: TFloatField;
    qyPartidasR_DESCUENTO_PORC: TFloatField;
    qyPartidasR_DP: TFloatField;
    qyPartidasR_DG: TFloatField;
    qyPartidasR_GT: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    constructor crear(AOwner : TComponent; p_encabezado : integer; x1, y1, y2 : integer);
  end;

var
  frmVerDetalleHijo: TfrmVerDetalleHijo;

implementation

uses IBModulo;

{$R *.DFM}

constructor TfrmVerDetalleHijo.crear(AOwner : TComponent; p_encabezado : integer; x1, y1, y2 : integer);
begin
   Create(AOwner);
   Left   := x1;
   Top    := y1;
   Height := y2;
   qyPartidas.Close;
   qyPartidas.ParamByName('P_ID').AsInteger := p_encabezado;
   qyPartidas.Open;
end;

end.
