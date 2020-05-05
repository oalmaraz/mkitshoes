unit explorar_ordenes_de_compras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,
  IBX.IBCustomDataSet, IBX.IBQuery,   ComCtrls, Grids, DBGrids, Buttons,
  Menus, StdCtrls, Mask, DBCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_ordenes_de_compras = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_DEPARTAMENTO: TIBStringField;
    qyExplorarR_ALMACEN: TIBStringField;
    qyExplorarR_FECHA_ENTREGA: TDateTimeField;
    qyExplorarR_FECHA_ENTREGA_REAL: TDateTimeField;
    qyExplorarR_C_PROVEEDOR: TIBStringField;
    qyExplorarR_PROVEEDOR: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_FOLIO: TIntegerField;
    dgExplorarDBTableView1Column1: TcxGridDBColumn;
    dgExplorarDBTableView1Column2: TcxGridDBColumn;
    dgExplorarDBTableView1Column3: TcxGridDBColumn;
    dgExplorarDBTableView1Column4: TcxGridDBColumn;
    dgExplorarDBTableView1Column5: TcxGridDBColumn;
    dgExplorarDBTableView1Column6: TcxGridDBColumn;
    dgExplorarDBTableView1Column7: TcxGridDBColumn;
    dgExplorarDBTableView1Column8: TcxGridDBColumn;
    dgExplorarDBTableView1Column9: TcxGridDBColumn;
    dgExplorarDBTableView1Column10: TcxGridDBColumn;
    dgExplorarDBTableView1Column11: TcxGridDBColumn;
    dgExplorarDBTableView1Column12: TcxGridDBColumn;
    dgExplorarDBTableView1Column13: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_ordenes_de_compras: TfrmExplorar_ordenes_de_compras;

implementation

{$R *.DFM}

procedure TfrmExplorar_ordenes_de_compras.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_Ordenes_de_Compras';
end;

end.
