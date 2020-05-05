Unit explorar_remitentes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,
    ComCtrls, Grids, DBGrids, Buttons, Vcl.ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_remitentes = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_remitentes: TfrmExplorar_remitentes;

implementation

{$R *.DFM}

procedure TfrmExplorar_remitentes.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_remitentes';
end;

end.
