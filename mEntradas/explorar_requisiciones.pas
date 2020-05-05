unit explorar_requisiciones;

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
  TfrmExplorar_requisiciones = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_DEPARTAMENTO: TIBStringField;
    qyExplorarR_USUARIO: TIBStringField;
    qyExplorarR_FECHA_ENTREGA: TDateTimeField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_ESTATUS: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DEPARTAMENTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ENTREGA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_requisiciones : TfrmExplorar_requisiciones;

implementation

{$R *.DFM}

procedure TfrmExplorar_requisiciones.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_requisiciones';
end;

end.
