unit explorar_tipos_de_entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,  Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
  jpeg,  ExtCtrls,
  ComCtrls, Grids, DBGrids,
  Buttons, Mask, DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_tipos_de_entrada = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_DESCRIPCION: TIBStringField;
    qyExplorarR_NCREDITO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_NCREDITO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_tipos_de_entrada: TfrmExplorar_tipos_de_entrada;

implementation

{$R *.DFM}

procedure TfrmExplorar_tipos_de_entrada.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_tipos_de_entrada';
end;

end.
