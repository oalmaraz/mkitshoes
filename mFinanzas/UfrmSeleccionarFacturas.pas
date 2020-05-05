unit UfrmSeleccionarFacturas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IBX.IBStoredProc,
  Grids, DBGrids, Buttons, Data.DB, IBX.IBTable, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, Vcl.Menus, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ExtCtrls;

type
  TfrmSeleccionarFacturas = class(TForm)
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemFOLIO: TMenuItem;
    itemCLAVE: TMenuItem;
    itemCLIENTE: TMenuItem;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
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
    qyBusquedaSERIE_FACTURA: TIBStringField;
    qyBusquedaCONSECUTIVO: TIntegerField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaDESCUENTO_GLOBAL_PORC: TFloatField;
    qyBusquedaGRANTOTAL: TFloatField;
    qyBusquedaESTATUS: TIBStringField;
    qyPartidas: TIBQuery;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_FACTURA: TIntegerField;
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
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_CLAVE_PEDIDO: TIBStringField;
    qyPartidasR_CAJAS: TFloatField;
    qyPartidasR_KILOS: TFloatField;
    qyPartidasR_PIEZAS: TFloatField;
    qyPartidasR_CALIDAD: TIntegerField;
    qyPartidasR_CALIDAD_NOMBRE: TIBStringField;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_PARTIDAS: TIntegerField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    dsPartidas: TDataSource;
    dgExplorar: TDBGrid;
    TPreferencias: TIBTable;
    TPreferenciasID: TIntegerField;
    TPreferenciasNOMBRE: TIBStringField;
    TPreferenciasTIPO: TIBStringField;
    TPreferenciasVALOR: TIBStringField;
    spADD_PFACTURA_NC: TIBStoredProc;
    qyBusquedaCLIENTE: TIntegerField;
    qyBusquedaEXTENSION: TIntegerField;
    procedure buTodosClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure itemIDClick(Sender: TObject);
    procedure itemFOLIOClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemCLIENTEClick(Sender: TObject);
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
  frmSeleccionarFacturas: TfrmSeleccionarFacturas;

implementation

uses
  UfrmAddPartNCredito;

{$R *.DFM}

const
   select = 'SELECT F.ID, F.SERIE_FACTURA, F.CONSECUTIVO, F.CLAVE, F.NOMBRE, F.DESCUENTO_GLOBAL_PORC, F.GRANTOTAL, F.ESTATUS, F.CLIENTE, F.EXTENSION';
   from   = 'FROM FACTURAS F';

procedure TfrmSeleccionarFacturas.Open;
begin
   TPreferencias.Close;
   TPreferencias.Open;
   qyPartidas.Close;
   qyPartidas.Open;

   TPreferencias.Filter := 'ID = 33';
//   dgExplorarCAJAS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 54';
//   dgExplorarPIEZAS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 60';
//   dgExplorarKILOS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 66';
 //  dgExplorarMEDIDAS.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   TPreferencias.Filter := 'ID = 69';
//   dgExplorarCOLORES.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmSeleccionarFacturas.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database        := valor;
   qyPartidas.Database        := valor;
   TPreferencias.Database     := valor;
   spADD_PFACTURA_NC.Database := valor;
end;

procedure TfrmSeleccionarFacturas.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction        := valor;
   qyPartidas.Transaction        := valor;
   TPreferencias.Transaction     := valor;
   spADD_PFACTURA_NC.Transaction := valor;
end;

procedure TfrmSeleccionarFacturas.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarFacturas.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmSeleccionarFacturas.buEjecutarClick(Sender: TObject);
var
   tmp : string;
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  edDato.Text := UpperCase(edDato.Text);
  tmp := 'WHERE UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
  qyBusqueda.SQL.Add(tmp);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarFacturas.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'F.ID';
end;

procedure TfrmSeleccionarFacturas.itemFOLIOClick(Sender: TObject);
begin
   buBusqueda.Caption := 'F.CONSECUTIVO';
end;

procedure TfrmSeleccionarFacturas.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'F.CLAVE';
end;

procedure TfrmSeleccionarFacturas.itemCLIENTEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'F.NOMBRE';
end;

procedure TfrmSeleccionarFacturas.buInicioClick(Sender: TObject);
begin
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarFacturas.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarFacturas.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarFacturas.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarFacturas.FormCreate(Sender: TObject);
begin
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarFacturas.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarFacturas.ini');
end;

procedure TfrmSeleccionarFacturas.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarFacturas.ibSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSeleccionarFacturas.dgExplorarDblClick(Sender: TObject);
var
   _cantidad : double;
   _precio   : double;
   _mr       : boolean;
begin
   try
      frmAddPartNCredito                  := TfrmAddPartNCredito.Create(Application);
      frmAddPartNCredito.edCantidad.Text := dsPartidas.DataSet.FieldByName('R_CANTIDAD').asString;
      frmAddPartNCredito.edPrecio.Text   := dsPartidas.DataSet.FieldByName('R_PRECIO').asString;
      frmAddPartNCredito.setMaterial(dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger,
                                     dsBusqueda.DataSet.FieldByName('CLIENTE').AsInteger,
                                     dsBusqueda.DataSet.FieldByName('EXTENSION').AsInteger);
      frmAddPartNCredito.ShowModal;
      _mr       := frmAddPartNCredito.ModalResult = mrOk;
      _cantidad := StrToFloat(frmAddPartNCredito.edCantidad.Text);
      _precio   := StrToFloat(frmAddPartNCredito.edDiferencia.text);
   finally
      frmAddPartNCredito.Free;
   end;


   if _mr and (_cantidad <> 0) then
   begin
      spADD_PFACTURA_NC.ParamByName('P_ID').AsInteger      := NC;
      spADD_PFACTURA_NC.ParamByName('P_PARTIDA').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      spADD_PFACTURA_NC.ParamByName('P_CANTIDAD').AsFloat  := _cantidad;
      spADD_PFACTURA_NC.ParamByName('P_PRECIO').AsFloat    := _precio;
      spADD_PFACTURA_NC.ExecProc;
      spADD_PFACTURA_NC.Transaction.CommitRetaining;
   end;
end;

procedure TfrmSeleccionarFacturas.sbDownClick(Sender: TObject);
begin
   dgExplorar.OnDblClick(Sender);
end;

end.
