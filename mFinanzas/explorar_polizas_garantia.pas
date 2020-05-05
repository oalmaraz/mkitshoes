unit explorar_polizas_garantia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,  ComCtrls, Grids, DBGrids, Buttons, Menus,
  IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls, ExtCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_polizas_garantia = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_FECHA_FIN: TDateTimeField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_MONTO: TFloatField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_DIAS: TIntegerField;
    qyExplorarR_TELEFONO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_FIN: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_DIAS: TcxGridDBColumn;
    dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_polizas_garantia: TfrmExplorar_polizas_garantia;

implementation

{$R *.DFM}

procedure TfrmExplorar_polizas_garantia.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_polizas_garantia';
end;

end.
