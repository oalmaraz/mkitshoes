unit explorar_tabuladores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,       Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls, 
    ComCtrls, Grids, DBGrids, Buttons, Menus, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_tabuladores = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_LIMITE_INF: TFloatField;
    qyExplorarR_LIMITE_SUP: TFloatField;
    qyExplorarR_BASE_MONTO: TFloatField;
    qyExplorarR_PORCENTAJE: TFloatField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_INF: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_SUP: TcxGridDBColumn;
    dgExplorarDBTableView1R_BASE_MONTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PORCENTAJE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_tabuladores: TfrmExplorar_tabuladores;

implementation

{$R *.DFM}

procedure TfrmExplorar_tabuladores.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_tabuladores';
end;

end.
