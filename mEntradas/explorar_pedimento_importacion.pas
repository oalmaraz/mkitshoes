unit explorar_pedimento_importacion;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, DBGrids, Buttons, Db,    Menus,
  IBX.IBCustomDataSet, IBX.IBQuery, ComCtrls, StdCtrls, Grids, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_pedimento_importacion = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_PEDIMENTO: TIBStringField;
    qyExplorarR_INCREMENTABLES: TFloatField;
    qyExplorarR_TOTAL: TFloatField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_PEDIMENTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_INCREMENTABLES: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_pedimento_importacion: TfrmExplorar_pedimento_importacion;

implementation

{$R *.DFM}

procedure TfrmExplorar_pedimento_importacion.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_Pedimento_Importacion';
end;

end.
