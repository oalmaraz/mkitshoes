unit explorar_notas_de_entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    Menus, XPMenu,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
    ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_notas_de_entrada = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE_NOTA: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_FACTURA_PROVEEDOR: TIBStringField;
    qyExplorarR_CLAVE_ORDEN: TIBStringField;
    qyExplorarR_CLAVE_ALMACEN: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_OCOMPRA: TIntegerField;
    qyExplorarR_DESEMPAQUE: TIntegerField;
    qyExplorarR_FOLIO: TIntegerField;
    qyExplorarR_OC_FOLIO: TIntegerField;
    qyExplorarR_PROVEEDOR_C: TIBStringField;
    qyExplorarR_PROVEEDOR_N: TIBStringField;
    qyExplorarR_CONTRARECIBO: TIntegerField;
    qyExplorarR_FECHA_FACT_PROVEEDOR: TDateTimeField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE_NOTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FACTURA_PROVEEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE_ORDEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_OCOMPRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESEMPAQUE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_OC_FOLIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR_C: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR_N: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONTRARECIBO: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_FACT_PROVEEDOR: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_notas_de_entrada: TfrmExplorar_notas_de_entrada;

implementation

{$R *.DFM}

procedure TfrmExplorar_notas_de_entrada.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_Entradas';
end;

end.
