unit UfrmSeleccionarPedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,

  StdCtrls, Mask, DBCtrls,  Menus, IBX.IBStoredProc,
  IBX.IBTable, Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  Buttons, Grids, DBGrids;

type
  TfrmSeleccionarPedidos = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
    dsPartidas: TDataSource;
    TPreferencias: TIBTable;
    TPreferenciasID: TIntegerField;
    TPreferenciasNOMBRE: TIBStringField;
    TPreferenciasTIPO: TIBStringField;
    TPreferenciasVALOR: TIBStringField;
    spADD_PPEDIDOS_NC: TIBStoredProc;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemFOLIO: TMenuItem;
    itemCLAVE: TMenuItem;
    itemCLIENTE: TMenuItem;
    sbHijo: TPanel;
    deID: TDBEdit;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    sbUp: TBitBtn;
    sbDown: TBitBtn;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    dgEncabezado: TDBGrid;
    Splitter1: TSplitter;
    qyBusquedaID: TIntegerField;
    qyBusquedaCONSECUTIVO: TIntegerField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaRAZON_SOCIAL: TIBStringField;
    qyBusquedaDESCUENTO_GLOBAL_PORC: TFloatField;
    qyBusquedaGRANTOTAL: TFloatField;
    qyBusquedaESTATUS: TIBStringField;
    qyBusquedaPRIORIDAD: TIBStringField;
    qyPartidas: TIBQuery;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_CANTIDAD_ENTREGADA: TFloatField;
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
    dgExplorar: TDBGrid;
    itemRSOCIAL: TMenuItem;
    procedure buTodosClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure itemIDClick(Sender: TObject);
    procedure itemFOLIOClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemCLIENTEClick(Sender: TObject);
    procedure itemRSOCIALClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure ibSalirClick(Sender: TObject);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure sbDownClick(Sender: TObject);
  private
    { Private declarations }
    awrNC  : integer;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
  public
    { Public declarations }
    procedure Open;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property NC          : integer read awrNC write awrNC;
  end;

var
  frmSeleccionarPedidos: TfrmSeleccionarPedidos;

implementation

{$R *.DFM}

const
   select = 'SELECT P.ID, P.CONSECUTIVO, P.CLAVE, S.NOMBRE, S.RAZON_SOCIAL, P.DESCUENTO_GLOBAL_PORC, P.GRANTOTAL, P.PRIORIDAD, P.ESTATUS';
   from   = 'FROM PEDIDOS P, SUJETOS_CLIENTES SC, SUJETOS S';
   where  = 'WHERE (P.CLIENTE = SC.ID) AND (SC.SUJETO = S.ID)';

procedure TfrmSeleccionarPedidos.Open;
begin
   TPreferencias.Close;
   TPreferencias.Open;
   qyPartidas.Close;
   qyPartidas.Open;

   TPreferencias.Filter := 'ID = 32';
   //dgExplorarCAJAS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 66';
   //dgExplorarMEDIDAS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 69';
   //dgExplorarCOLORES.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmSeleccionarPedidos.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database        := valor;
   qyPartidas.Database        := valor;
   TPreferencias.Database     := valor;
   spADD_PPEDIDOS_NC.Database := valor;
end;

procedure TfrmSeleccionarPedidos.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction        := valor;
   qyPartidas.Transaction        := valor;
   TPreferencias.Transaction     := valor;
   spADD_PPEDIDOS_NC.Transaction := valor;
end;

procedure TfrmSeleccionarPedidos.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.SQL.Add(where);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPedidos.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmSeleccionarPedidos.buEjecutarClick(Sender: TObject);
var
   tmp : string;
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.SQL.Add(where);
  edDato.Text := UpperCase(edDato.Text);
  tmp := 'AND UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
  qyBusqueda.SQL.Add(tmp);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPedidos.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.ID';
end;

procedure TfrmSeleccionarPedidos.itemFOLIOClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.CONSECUTIVO';
end;

procedure TfrmSeleccionarPedidos.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.CLAVE';
end;

procedure TfrmSeleccionarPedidos.itemCLIENTEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
end;

procedure TfrmSeleccionarPedidos.itemRSOCIALClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.RAZON_SOCIAL';
end;

procedure TfrmSeleccionarPedidos.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPedidos.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarPedidos.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarPedidos.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarPedidos.FormCreate(Sender: TObject);
begin
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarPedidos.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarPedidos.ini');
end;

procedure TfrmSeleccionarPedidos.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarPedidos.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarPedidos.dgExplorarDblClick(Sender: TObject);
begin
{
   idCantidad.Entrada := FormatFloat('########0.00',dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsFloat);
   idCantidad.Execute;
   if idCantidad.Respuesta and (idCantidad.Entrada <> '') then
   begin
      spADD_PPEDIDOS_NC.ParamByName('P_ID').AsInteger      := NC;
      spADD_PPEDIDOS_NC.ParamByName('P_PARTIDA').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      spADD_PPEDIDOS_NC.ParamByName('P_CANTIDAD').AsFloat  := StrToFloat(idCantidad.Entrada);
      spADD_PPEDIDOS_NC.ExecProc;
      spADD_PPEDIDOS_NC.Transaction.CommitRetaining;
   end;
   }
end;

procedure TfrmSeleccionarPedidos.sbDownClick(Sender: TObject);
begin
   dgExplorar.OnDblClick(Sender);
end;

end.
