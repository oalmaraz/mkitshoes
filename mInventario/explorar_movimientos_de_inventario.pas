unit explorar_movimientos_de_inventario;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,  ComCtrls, Grids, DBGrids, Buttons,
  Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_movimientos_de_inventario = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_TIPO: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_ALMACEN_ORIGEN_CLAVE: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_OBSERVACIONES: TIBStringField;
    qyExplorarR_FOLIO_ORIGEN: TIntegerField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TIPO: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_ORIGEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_OBSERVACIONES: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_ORIGEN: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_movimientos_de_inventario: TfrmExplorar_movimientos_de_inventario;

implementation

uses reglas_de_negocios;

{$R *.DFM}

procedure TfrmExplorar_movimientos_de_inventario.FormCreate(
  Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmMovimientosDeInventario';
end;

end.
