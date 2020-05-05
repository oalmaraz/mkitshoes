unit explorar_tipos_de_salida;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,  Db,
  IBX.IBCustomDataSet, IBX.IBQuery,   jpeg,   ExtCtrls,
   ComCtrls, Grids, DBGrids,
  Buttons,  Menus, StdCtrls,
  Mask, DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_tipos_de_salida = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_DESCRIPCION: TIBStringField;
    qyExplorarR_NCARGO_CXP: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_NCARGO_CXP: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_tipos_de_salida: TfrmExplorar_tipos_de_salida;

implementation

{$R *.DFM}

procedure TfrmExplorar_tipos_de_salida.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := '';
  FForma      := 'frmCapturar_tipos_de_salida';
end;

end.
