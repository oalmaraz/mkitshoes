unit UfrmSeleccionarCotizacion;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, Db, Menus, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Grids, DBGrids, Buttons, StdCtrls, ExtCtrls;

type
  TfrmSeleccionarCotizacion = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemCLAVE: TMenuItem;
    itemNOMBRE: TMenuItem;
    dsBusqueda: TDataSource;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    edDato: TEdit;
    dgEncabezado: TDBGrid;
    Splitter1: TSplitter;
    fcImager2: TImage;
    spADD_REQ_REQCOT: TIBStoredProc;
    Panel6: TPanel;
    paEncabezado: TPanel;
    dgDetalle: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaFECHA_ALTA: TDateTimeField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaESTATUS: TIBStringField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_COTIZACION: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
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
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    qyPartidasR_COMENTARIO: TIBStringField;
    qyPartidasR_NUM_SERIE: TIBStringField;
    qyPartidasR_COSTO_ULT_COMPRA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buBusquedaClick(Sender: TObject);
    procedure fcImager2DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyBusquedaAfterOpen(DataSet: TDataSet);
    procedure itemIDClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemNOMBREClick(Sender: TObject);
    procedure dgEncabezadoDblClick(Sender: TObject);
    procedure dgEncabezadoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    sqlReq     : TSqlAnaliza;
    awrAceptar : Boolean;
    awrCliente : integer;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setCliente(valor : integer);
    procedure setAceptar(valor : boolean);
    function getCotizacion : integer;
  public
    { Public declarations }
    procedure Open;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property CLIENTE     : integer read awrCliente write setCliente;
     property ACEPTAR     : Boolean read awrAceptar write setAceptar;
     property COTIZACION  : integer read getCotizacion;
  end;

var
  frmSeleccionarCotizacion: TfrmSeleccionarCotizacion;

implementation

uses UfrmScript;

{$R *.DFM}

procedure TfrmSeleccionarCotizacion.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

function TfrmSeleccionarCotizacion.getCotizacion : integer;
begin
   result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

procedure TfrmSeleccionarCotizacion.setCliente(valor : integer);
begin
   awrCliente := valor;
end;

procedure TfrmSeleccionarCotizacion.Open;
begin
   sqlReq.Database    := qyBusqueda.Database;
   sqlReq.Transaction := qyBusqueda.Transaction;
   sqlReq.AddStrings(qyBusqueda.SQL);
end;

procedure TfrmSeleccionarCotizacion.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database       := valor;
   qyPartidas.Database       := valor;
   spADD_REQ_REQCOT.Database := valor;
end;

procedure TfrmSeleccionarCotizacion.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction       := valor;
   qyPartidas.Transaction       := valor;
   spADD_REQ_REQCOT.Transaction := valor;
end;

procedure TfrmSeleccionarCotizacion.FormCreate(Sender: TObject);
begin
   sqlReq     := TSqlAnaliza.Create;
   awrAceptar := false;
   awrCliente := 0;

   {
   dgEncabezado.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCotizacionesEnc.ini';
   dgEncabezado.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCotizacionesEnc.ini');

   dgDetalle.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCotizacionesDet.ini';
   dgDetalle.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCotizacionesDet.ini');
   }
end;

procedure TfrmSeleccionarCotizacion.buEjecutarClick(Sender: TObject);
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
      sqlReq.AddWhereExtra('('+vCampo+' = :P_DATO)');
   end
   else
      begin
         j := sqlReq.AddParamIndex('P_DATO');
         sqlReq.setParam(j, '%'+edDato.Text+'%', psCadena);
         sqlReq.AddWhereExtra('(UPPER('+vCampo+') LIKE :P_DATO)');
      end;
   sqlReq.construirExtra;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlReq.strSql);
   for i := 1 to sqlReq.indexParam do
   begin
      qyBusqueda.ParamByName(sqlReq.dameParam(i)).Value := sqlReq.dameParamValor(i);
   end;
   qyBusqueda.ParamByName('P_CLIENTE').AsInteger := awrCliente;
   qyBusqueda.Open;

   dgEncabezado.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCotizacion.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarCotizacion.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
  edDato.Setfocus;
end;

procedure TfrmSeleccionarCotizacion.fcImager2DblClick(Sender: TObject);
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

procedure TfrmSeleccionarCotizacion.FormDestroy(Sender: TObject);
begin
   sqlReq.Destroy;
end;

procedure TfrmSeleccionarCotizacion.qyBusquedaAfterOpen(
  DataSet: TDataSet);
begin
   qyPartidas.Close;
   qyPartidas.Open;
end;

procedure TfrmSeleccionarCotizacion.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'C.ID';
end;

procedure TfrmSeleccionarCotizacion.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'C.CLAVE';
end;

procedure TfrmSeleccionarCotizacion.itemNOMBREClick(
  Sender: TObject);
begin
   buBusqueda.Caption := 'C.NOMBRE';
end;

procedure TfrmSeleccionarCotizacion.dgEncabezadoDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) and (qyBusqueda.FieldByName('ESTATUS').AsString <> 'Autorizar') then
      ACEPTAR := true
   else
   if not(qyBusqueda.IsEmpty) and (qyBusqueda.FieldByName('ESTATUS').AsString = 'Autorizar') then
   begin
     ShowMessage('No es posible asignar la cotizacion, falta autorizacion.');
   end
end;

procedure TfrmSeleccionarCotizacion.dgEncabezadoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) and (qyBusqueda.FieldByName('ESTATUS').AsString <> 'Autorizar') then
      ACEPTAR := true
   else
   if (key = 13) and not(qyBusqueda.IsEmpty) and (qyBusqueda.FieldByName('ESTATUS').AsString = 'Autorizar') then
   begin
     ShowMessage('No es posible asignar la cotizacion, falta autorizacion.');
   end;
end;

end.
