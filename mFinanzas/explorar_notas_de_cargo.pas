unit explorar_notas_de_cargo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    Menus,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
    ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_notas_de_cargo = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_TIPO: TIBStringField;
    qyExplorarR_ALMACEN_CLAVE: TIBStringField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_MONEDA_CLAVE: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_FOLIO: TIntegerField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_FECHA: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TIPO: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_notas_de_cargo: TfrmExplorar_notas_de_cargo;

implementation

{$R *.DFM}

procedure TfrmExplorar_notas_de_cargo.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_notas_de_cargo';
end;

end.
