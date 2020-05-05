unit explorar_almacenes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
      ComCtrls, Grids, DBGrids,
  Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_almacenes = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_COMPRA: TIBStringField;
    qyExplorarR_VENDE: TIBStringField;
    qyExplorarR_TRANSFORMA: TIBStringField;
    qyExplorarR_FECHA: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_COMPRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_VENDE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TRANSFORMA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_almacenes: TfrmExplorar_almacenes;

implementation

{$R *.DFM}

procedure TfrmExplorar_almacenes.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_almacenes';
end;

end.
