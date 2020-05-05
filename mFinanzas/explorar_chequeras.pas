unit explorar_chequeras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    Menus, IBX.IBCustomDataSet,
  IBX.IBQuery, ComCtrls, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_chequeras = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CUENTA: TIBStringField;
    qyExplorarR_SUCURSAL: TIBStringField;
    qyExplorarR_BANCO_NOMBRE: TIBStringField;
    qyExplorarR_SALDO: TFloatField;
    qyExplorarR_F_ULT_CHEQUE_I: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CUENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_SUCURSAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_BANCO_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_SALDO: TcxGridDBColumn;
    dgExplorarDBTableView1R_F_ULT_CHEQUE_I: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_chequeras: TfrmExplorar_chequeras;

implementation

{$R *.DFM}

procedure TfrmExplorar_chequeras.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_F_ULT_CHEQUE_I';
  FForma      := 'frmCapturar_chequeras';
end;

end.
