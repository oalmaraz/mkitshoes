unit explorar_conceptos_gastos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    Menus,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
    Mask, DBCtrls,
     jpeg,  ExtCtrls,
    ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_Conceptos_Gastos = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CONCEPTO: TIBStringField;
    qyExplorarR_PORC: TFloatField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONCEPTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PORC: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_Conceptos_Gastos: TfrmExplorar_Conceptos_Gastos;

implementation

{$R *.DFM}

procedure TfrmExplorar_Conceptos_Gastos.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_Conceptos_Gastos';
end;

end.
