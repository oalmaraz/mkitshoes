unit explorar_condiciones_comerciales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,      Menus,
   Db, IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
      Mask, DBCtrls,
      jpeg,  ExtCtrls,
     ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_condiciones_comerciales = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_PVTA: TIBStringField;
    qyExplorarR_PCXC: TIBStringField;
    qyExplorarR_PCXP: TIBStringField;
    qyExplorarR_PLANES: TIBStringField;
    qyExplorarR_DAR_CAMBIO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_PVTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_PCXC: TcxGridDBColumn;
    dgExplorarDBTableView1R_PCXP: TcxGridDBColumn;
    dgExplorarDBTableView1R_PLANES: TcxGridDBColumn;
    dgExplorarDBTableView1R_DAR_CAMBIO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_condiciones_comerciales: TfrmExplorar_condiciones_comerciales;

implementation

{$R *.DFM}

procedure TfrmExplorar_condiciones_comerciales.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_condiciones_comerciales';
end;

end.
