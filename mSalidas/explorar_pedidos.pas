unit explorar_pedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, IBX.IBStoredProc, Db,  Grids,
  DBGrids, Buttons, Menus, IBX.IBCustomDataSet, IBX.IBQuery, ComCtrls, StdCtrls,
  Mask, DBCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmExplorar_pedidos = class(TfrmExplorarMDI)
    ibBackOrder: TBitBtn;
    spBACKORDER_PEDIDO: TIBStoredProc;
    qyExplorarseguro: TFloatField;
    qyExplorarsupertotal: TFloatField;
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_C_CLAVE: TIBStringField;
    qyExplorarR_CLIENTE: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_CODIGO_PAIS: TIBStringField;
    qyExplorarR_CODIGO_ESTADO: TIBStringField;
    qyExplorarR_TELEFONO: TIBStringField;
    qyExplorarR_E_CLAVE: TIBStringField;
    qyExplorarR_EXTENSION: TIBStringField;
    qyExplorarR_FECHA_VALIDEZ: TDateTimeField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_PRIORIDAD: TIBStringField;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    qyExplorarR_CIUDAD: TIBStringField;
    qyExplorarR_ESTADO: TIBStringField;
    qyExplorarR_PAIS: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_V_CLAVE: TIBStringField;
    qyExplorarR_VENDEDOR: TIBStringField;
    qyExplorarR_ALMACEN: TIBStringField;
    qyExplorarR_CC_CLAVE: TIBStringField;
    qyExplorarR_CC_NOMBRE: TIBStringField;
    qyExplorarR_SEGURO_SUBTOTAL: TFloatField;
    qyExplorarR_SEGURO_IVA: TFloatField;
    qyExplorarR_CLIENTE_OC: TIBStringField;
    qyExplorarR_ZONA_D: TIBStringField;
    qyExplorarR_CANTIDAD: TFloatField;
    dgExplorarDBTableView1supertotal: TcxGridDBColumn;
    dgExplorarDBTableView1seguro: TcxGridDBColumn;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_CODIGO_PAIS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CODIGO_ESTADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn;
    dgExplorarDBTableView1R_E_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_VALIDEZ: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_PRIORIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CIUDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PAIS: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_V_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_VENDEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_CC_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CC_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE_OC: TcxGridDBColumn;
    dgExplorarDBTableView1R_ZONA_D: TcxGridDBColumn;
    dgExplorarDBTableView1R_CANTIDAD: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure ibBackOrderClick(Sender: TObject);
    procedure qyExplorarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_pedidos: TfrmExplorar_pedidos;

implementation

uses
   IBModulo, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmExplorar_pedidos.FormCreate(Sender: TObject);
var
   awrSeguro : Boolean;
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_pedidos';

  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';
  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //dgExplorarGRANTOTAL.Visible := awrSeguro;
  //dgExplorarSEGURO.Visible    := awrSeguro;


end;

procedure TfrmExplorar_pedidos.ibBackOrderClick(Sender: TObject);
var
   pedido : integer;
begin
   inherited;
   if MessageDlg('Este proceso revisara todos los pedidos que tenga en el explorador y unira todos los no surtidos en uno solo (Re-Surtir).', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      pedido := 0;

      if not(dsFuente.DataSet.IsEmpty) then
      begin
         while not(dgExplorarDBTableView1.DataController.Datasource.Dataset.EOF) do
         begin
            spBACKORDER_PEDIDO.ParamByName('P_USUARIO').AsInteger  := reglas.dame_usuario;
            spBACKORDER_PEDIDO.ParamByName('P_PEDIDO').AsInteger   := pedido;
            spBACKORDER_PEDIDO.ParamByName('P_RESURTIR').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
            spBACKORDER_PEDIDO.ExecProc;
            pedido := spBACKORDER_PEDIDO.ParamByName('R_PEDIDO').AsInteger;
            dgExplorarDBTableView1.DataController.Datasource.Dataset.Next;
         end;
         ShowMessage('BackOrder Terminado con pedido: '+spBACKORDER_PEDIDO.ParamByName('R_PEDIDO').AsString);
      end
      else
      begin
         ShowMessage('No hay pedidos que Re-Surtir en el explorador');
      end;
   end;
end;

procedure TfrmExplorar_pedidos.qyExplorarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('R_SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('R_SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('R_GRANTOTAL').AsFloat + DataSet.FieldByName('seguro').AsFloat;
end;

end.
