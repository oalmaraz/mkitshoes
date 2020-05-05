unit explorar_anticipos_proveedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Menus,   ComCtrls,
  Grids, DBGrids, Buttons, Db,    IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_anticipos_proveedores = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_ALMACEN_CLAVE: TIBStringField;
    qyExplorarR_MONEDA_CLAVE: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    qyExplorarR_REFERENCIA: TIBStringField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_PROVEEDOR: TIBStringField;
    qyExplorarR_P_NOMBRE: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_P_NOMBRE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_anticipos_proveedores: TfrmExplorar_anticipos_proveedores;

implementation

{$R *.DFM}

procedure TfrmExplorar_anticipos_proveedores.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_anticipos_proveedores';
end;

end.
