unit explorar_colores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,
    StdCtrls, Mask, DBCtrls,
     jpeg,  ExtCtrls,
    ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_Colores = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_ORDEN: TIntegerField;
    qyExplorarR_MOSTRAR: TIBStringField;
    qyExplorarR_PROCESOS: TIBStringField;
    qyExplorarR_PIGMENTOS: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ORDEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_MOSTRAR: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROCESOS: TcxGridDBColumn;
    dgExplorarDBTableView1R_PIGMENTOS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_Colores: TfrmExplorar_Colores;

implementation

{$R *.DFM}

procedure TfrmExplorar_Colores.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_colores';
end;

end.
