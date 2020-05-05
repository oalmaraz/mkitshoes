unit UfrmSeleccionarPedidoParaFacturas;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, Db, Menus, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TfrmSeleccionarPedidoParaFacturas = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    edDato: TEdit;
    Splitter1: TSplitter;
    fcImager2: TImage;
    Panel6: TPanel;
    paEncabezado: TPanel;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_CLIENTE_MAT_C: TIBStringField;
    qyPartidasR_CLIENTE_MAT_D: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_CANTIDAD_ENTREGADA: TFloatField;
    qyPartidasR_CANTIDAD_PENDIENTE: TFloatField;
    qyPartidasR_PRECIO: TFloatField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_TOTAL: TFloatField;
    qyPartidasR_DESCUENTO_PORC: TFloatField;
    qyPartidasR_DP: TFloatField;
    qyPartidasR_DG: TFloatField;
    qyPartidasR_GT: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    qyPartidasR_COTIZACION: TIntegerField;
    qyPartidasR_CLAVE_COTIZACION: TIBStringField;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_CAJAS: TIntegerField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    qyPartidasR_MATERIAL_CBARRAS: TIBStringField;
    qyPartidasR_MATERIAL_OBSERVACIONES: TBlobField;
    qyPartidasR_MATERIAL_FOTO: TBlobField;
    qyPartidasR_PZAS_X_CAJA: TIntegerField;
    qyPartidasR_COMENTARIO: TIBStringField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    qyPartidasR_F_PROM_ENT: TDateTimeField;
    qyPartidasR_PNC: TFloatField;
    qyPartidasR_SERIE: TIBStringField;
    qyPartidasR_NUM_SERIE: TIBStringField;
    qyPartidasR_COSTO_ULT_COMPRA: TFloatField;
    dgDetalle: TDBGrid;
    dgEncabezado: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaFECHA_ALTA: TDateTimeField;
    qyBusquedaCONSECUTIVO: TIntegerField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaRAZON_SOCIAL: TIBStringField;
    qyBusquedaDESCUENTO_GLOBAL_PORC: TFloatField;
    qyBusquedaGRANTOTAL: TFloatField;
    qyBusquedaPRIORIDAD: TIBStringField;
    qyBusquedaESTATUS: TIBStringField;
    spADD_PEDIDO_A_FACTURA: TIBStoredProc;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemFOLIO: TMenuItem;
    itemCLAVE: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buBusquedaClick(Sender: TObject);
    procedure fcImager2DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyBusquedaAfterOpen(DataSet: TDataSet);
    procedure itemIDClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemFOLIOClick(Sender: TObject);
    procedure dgEncabezadoColumn11ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    sqlReq      : TSqlAnaliza;
    awrAceptar  : Boolean;
    awrCliente  : integer;
    awrFactura  : integer;
    awrTicket   : integer;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setCliente(valor : integer);
    procedure setAceptar(valor : boolean);
  public
    { Public declarations }
    procedure Open;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property CLIENTE     : integer read awrCliente write setCliente;
     property ACEPTAR     : Boolean read awrAceptar write setAceptar;
     property FACTURA     : integer read awrFactura write awrFactura;
     property ESTICKET    : integer read awrTicket write awrTicket; 
  end;

var
  frmSeleccionarPedidoParaFacturas: TfrmSeleccionarPedidoParaFacturas;

implementation

uses UfrmScript;

{$R *.DFM}

procedure TfrmSeleccionarPedidoParaFacturas.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

procedure TfrmSeleccionarPedidoParaFacturas.setCliente(valor : integer);
begin
   awrCliente := valor;
end;

procedure TfrmSeleccionarPedidoParaFacturas.Open;
begin
   sqlReq.Database    := qyBusqueda.Database;
   sqlReq.Transaction := qyBusqueda.Transaction;
   sqlReq.AddStrings(qyBusqueda.SQL);
end;

procedure TfrmSeleccionarPedidoParaFacturas.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database             := valor;
   qyPartidas.Database             := valor;
   spADD_PEDIDO_A_FACTURA.Database := valor;
end;

procedure TfrmSeleccionarPedidoParaFacturas.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction             := valor;
   qyPartidas.Transaction             := valor;
   spADD_PEDIDO_A_FACTURA.Transaction := valor;
end;

procedure TfrmSeleccionarPedidoParaFacturas.FormCreate(Sender: TObject);
begin
   sqlReq     := TSqlAnaliza.Create;
   awrAceptar := false;
   awrCliente := 0;
   awrTicket  := 0;

   {
   dgEncabezado.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarPedidosParaFacturasEnc.ini';
   dgEncabezado.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarPedidosParaFacturasEnc.ini');

   dgDetalle.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarPedidosParaFacturasDet.ini';
   dgDetalle.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarPedidosParaFacturasDet.ini');
   }
end;

procedure TfrmSeleccionarPedidoParaFacturas.buEjecutarClick(Sender: TObject);
var
  vCampo     : string;
  i, j       : integer;
  vTipo      : TFieldType;
begin
   sqlReq.LoadOriginal;

   vCampo := buBusqueda.Caption;
   vTipo  := sqlReq.dameTipoC(vCampo);

   if vTipo in [ftInteger] then
   begin
      j := sqlReq.AddParamIndex('P_DATO');
      sqlReq.setParam(j, edDato.Text, psCadena);
      sqlReq.AddWhereExtra('AND ('+vCampo+' = :P_DATO)');
   end
   else
      begin
         j := sqlReq.AddParamIndex('P_DATO');
         sqlReq.setParam(j, '%'+edDato.Text+'%', psCadena);
         sqlReq.AddWhereExtra('AND (UPPER('+vCampo+') LIKE :P_DATO)');
      end;
   sqlReq.construirExtra;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlReq.strSql);
   for i := 1 to sqlReq.indexParam do
   begin
      qyBusqueda.ParamByName(sqlReq.dameParam(i)).Value := sqlReq.dameParamValor(i);
   end;
   qyBusqueda.ParamByName('P_CLIENTE').AsInteger := awrCliente;
   qyBusqueda.ParamByName('P_TICKET').AsInteger  := awrTicket;
   qyBusqueda.Open;

   dgEncabezado.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPedidoParaFacturas.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarPedidoParaFacturas.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
  edDato.Setfocus;
end;

procedure TfrmSeleccionarPedidoParaFacturas.fcImager2DblClick(Sender: TObject);
begin
  if sqlReq <> nil then
  begin
     try
        frmScript := TfrmScript.Create(Application);
        frmScript.AddStrings(sqlReq.strSql);
        frmScript.ShowModal;
     finally
        frmScript.Destroy;
     end;
  end;
end;

procedure TfrmSeleccionarPedidoParaFacturas.FormDestroy(Sender: TObject);
begin
   sqlReq.Destroy;
end;

procedure TfrmSeleccionarPedidoParaFacturas.qyBusquedaAfterOpen(
  DataSet: TDataSet);
begin
   qyPartidas.Close;
   qyPartidas.Open;
end;

procedure TfrmSeleccionarPedidoParaFacturas.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.ID';
end;

procedure TfrmSeleccionarPedidoParaFacturas.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.CLAVE';
end;

procedure TfrmSeleccionarPedidoParaFacturas.itemFOLIOClick(
  Sender: TObject);
begin
   buBusqueda.Caption := 'P.CONSECUTIVO';
end;

procedure TfrmSeleccionarPedidoParaFacturas.dgEncabezadoColumn11ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   if MessageDlg('�Agregar Pedido a Factura? ', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      spADD_PEDIDO_A_FACTURA.ParamByName('P_FACTURA').AsInteger := awrFactura;
      spADD_PEDIDO_A_FACTURA.ParamByName('P_PEDIDO').AsInteger  := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
      spADD_PEDIDO_A_FACTURA.ExecProc;
      spADD_PEDIDO_A_FACTURA.Transaction.CommitRetaining;

      ShowMessage('Registro agregado correctamente.');
   end;
end;

end.
