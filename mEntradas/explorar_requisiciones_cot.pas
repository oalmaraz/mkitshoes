unit explorar_requisiciones_cot;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,   ComCtrls, Grids, DBGrids, Buttons,
  Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_requisicion_cotizaciones = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_DEPARTAMENTO: TIBStringField;
    qyExplorarR_FECHA_ENTREGA: TDateTimeField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_FECHA_VALIDEZ: TDateTimeField;
    qyExplorarCOMPRA_MINIMA: TFloatField;
    qyExplorarDESCUENTO_PORC: TFloatField;
    qyExplorarR_FECHA: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DEPARTAMENTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ENTREGA: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_VALIDEZ: TcxGridDBColumn;
    dgExplorarDBTableView1COMPRA_MINIMA: TcxGridDBColumn;
    dgExplorarDBTableView1DESCUENTO_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_requisicion_cotizaciones: TfrmExplorar_requisicion_cotizaciones;

implementation

{$R *.DFM}

procedure TfrmExplorar_requisicion_cotizaciones.FormCreate(
  Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_requisicion_cotizaciones';
end;

end.
