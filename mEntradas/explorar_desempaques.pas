unit explorar_desempaques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,ComCtrls, Grids, DBGrids, Buttons, Db,
  Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TfrmExplorar_desempaques = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_ORDEN_COMPRA: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_FECHA_RECEPCION: TDateTimeField;
    qyExplorarR_CONDUCTOR: TIBStringField;
    qyExplorarR_PLACAS: TIBStringField;
    qyExplorarR_FACTURA_PROVEEDOR: TIBStringField;
    qyExplorarR_ID_OC: TIntegerField;
    qyExplorarR_FOLIO_OC: TIntegerField;
    qyExplorarR_PROVEEDOR_C: TIBStringField;
    qyExplorarR_PROVEEDOR_N: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_ORDEN_COMPRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_RECEPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONDUCTOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_PLACAS: TcxGridDBColumn;
    dgExplorarDBTableView1R_FACTURA_PROVEEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_ID_OC: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_OC: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR_C: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR_N: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_desempaques: TfrmExplorar_desempaques;

implementation

{$R *.DFM}

procedure TfrmExplorar_desempaques.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_RECEPCION';
  FForma      := 'frmCapturar_desempaques';
end;

end.
