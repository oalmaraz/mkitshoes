unit explorar_facturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db, 
  ComCtrls, Grids, DBGrids, Buttons, Menus, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, Mask, DBCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_Facturas = class(TfrmExplorarMDI)
    ibBlock: TBitBtn;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CIUDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_E_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_FACTURA: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_V_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_VENDEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_CC_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CC_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ZONA_D: TcxGridDBColumn;
    dgExplorarDBTableView1R_CANTIDAD: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ibBlockClick(Sender: TObject);
    procedure qyExplorarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_Facturas: TfrmExplorar_Facturas;

implementation

uses PRN_0012_Facturacion, PRN_0003_FACTURAR_TXT, IBData;

{$R *.DFM}

procedure TfrmExplorar_Facturas.FormCreate(Sender: TObject);
var
   awrSeguro : Boolean;
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_facturas';


  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';
  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //dgExplorarGRANTOTAL.Visible := awrSeguro;
  //dgExplorarSEGURO.Visible    := awrSeguro;
end;

procedure TfrmExplorar_Facturas.ibBlockClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0003_TXT        := TfrmPRN_0003_TXT.Create(Application);
     frmPRN_0003_TXT.BLOQUE := qyExplorar;
     if frmPRN_0003_TXT.OpenFormato then
        frmPRN_0003_TXT.imprimirBloque;
  finally
     frmPRN_0003_TXT.Free;
  end;
end;

procedure TfrmExplorar_Facturas.qyExplorarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('R_SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('R_SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('R_GRANTOTAL').AsFloat + DataSet.FieldByName('seguro').AsFloat;
end;

end.
