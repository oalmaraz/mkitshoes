unit explorar_grupos_tabulador;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Menus,   Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, Mask, DBCtrls, jpeg, ExtCtrls,
   ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_grupos_tabulador = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_PORC: TIBStringField;
    qyExplorarR_VALOR: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_VALOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_grupos_tabulador: TfrmExplorar_grupos_tabulador;

implementation

{$R *.DFM}

procedure TfrmExplorar_grupos_tabulador.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_grupos_tabulador';
end;

end.
