unit explorar_tentrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Menus,   Db, IBX.IBCustomDataSet, IBX.IBQuery,
    ComCtrls,
  Grids, DBGrids, Buttons,    StdCtrls, Mask,
  DBCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_tentrega = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_DESCRIPCION: TIBStringField;
    qyExplorarR_PESO: TFloatField;
    qyExplorarR_TARIFA: TFloatField;
    qyExplorarR_UNIDAD: TIBStringField;
    qyExplorarR_MONEDA: TIBStringField;
    qyExplorarR_TRANSPORTISTA: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_PESO: TcxGridDBColumn;
    dgExplorarDBTableView1R_TARIFA: TcxGridDBColumn;
    dgExplorarDBTableView1R_UNIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA: TcxGridDBColumn;
    dgExplorarDBTableView1R_TRANSPORTISTA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_tentrega: TfrmExplorar_tentrega;

implementation

{$R *.DFM}

procedure TfrmExplorar_tentrega.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_tentrega';
end;

end.
