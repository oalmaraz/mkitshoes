unit explorar_rutas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
    ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_rutas = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_TRANSPORTISTA_CLAVE: TIBStringField;
    qyExplorarR_TRANSPORTISTA_NOMBRE: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TRANSPORTISTA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TRANSPORTISTA_NOMBRE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_rutas: TfrmExplorar_rutas;

implementation

{$R *.DFM}

procedure TfrmExplorar_rutas.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_rutas';
end;

end.
