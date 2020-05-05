unit UdmDetalleDeLaVenta;

interface

uses
  UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db,  IBX.IBCustomDataSet, IBX.IBQuery;

type
  TdmDetalleDeLaVenta = class(TDataModule)
    qyIBXDetalle: TIBQuery;
    dsDetalle: TDataSource;
    qyIBXDetalleR_ID: TIntegerField;
    qyIBXDetalleR_MATERIAL: TIntegerField;
    qyIBXDetalleR_MATERIAL_CLAVE: TIBStringField;
    qyIBXDetalleR_MATERIAL_DESCRIPCION: TIBStringField;
    qyIBXDetalleR_CANTIDAD: TFloatField;
    qyIBXDetalleR_UNIDAD: TIntegerField;
    qyIBXDetalleR_UNIDAD_CLAVE: TIBStringField;
    qyIBXDetalleR_UNIDAD_DESCRIPCION: TIBStringField;
    qyIBXDetalleR_PRECIO_VENTA: TFloatField;
    qyIBXDetalleR_DESCUENTO_PORC: TFloatField;
    qyIBXDetalleR_SUBTOTAL: TFloatField;
    qyIBXDetalleR_DESCUENTO_PARCIAL: TFloatField;
    qyIBXDetalleR_DESCUENTO_GLOBAL: TFloatField;
    qyIBXDetalleR_TOTAL: TFloatField;
    qyIBXDetalleR_DG_PORC: TFloatField;
    qyIBXDetalleR_IVA: TFloatField;
    qyIBXDetalleR_GT: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure refreshDetalle(p_cxc : integer);
  end;

{var
  dmDetalleDeLaVenta: TdmDetalleDeLaVenta;}

implementation

uses IBModulo;

{$R *.DFM}

procedure TdmDetalleDeLaVenta.refreshDetalle(p_cxc : integer);
begin
   qyIBXDetalle.Close;
   qyIBXDetalle.ParamByName('P_CXC').AsInteger := p_cxc;
   qyIBXDetalle.Open;
end;

procedure TdmDetalleDeLaVenta.DataModuleCreate(Sender: TObject);
begin
   dsDetalle.DataSet := qyIBXDetalle;
end;

end.
