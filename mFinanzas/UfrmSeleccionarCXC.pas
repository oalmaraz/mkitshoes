unit UfrmSeleccionarCXC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
       StdCtrls, Mask, DBCtrls,

   ExtCtrls,  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, Grids, DBGrids, Buttons, System.Variants;

type
  TfrmSeleccionarCXC = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    sbHijo: TPanel;
    deID: TDBEdit;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    sbUp: TBitBtn;
    sbDown: TBitBtn;
    dgExplorar: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaREFERENCIA: TIBStringField;
    qyBusquedaCLIENTE: TIntegerField;
    qyBusquedaEXTENSION: TIntegerField;
    qyBusquedaALMACEN: TIntegerField;
    qyBusquedaNUMERO_DE_DOCUMENTOS: TIntegerField;
    qyBusquedaDOCUMENTO: TIntegerField;
    qyBusquedaFECHA: TDateTimeField;
    qyBusquedaFECHA_VENCIMIENTO: TDateTimeField;
    qyBusquedaIMPORTE_INICIAL: TFloatField;
    qyBusquedaF_1: TFloatField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaNOMBRE1: TIBStringField;
    Referencia1: TMenuItem;
    Id1: TMenuItem;
    Cliente1: TMenuItem;
    Extension1: TMenuItem;
    qyBusquedaRAZON_SOCIAL: TIBStringField;
    qyBusquedaFACTURAR_A: TIBStringField;
    qyBusquedaEXTENSION_NOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buEjecutarClick(Sender: TObject);
    procedure buTodosClick(Sender: TObject);
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ibSalirClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure Id1Click(Sender: TObject);
    procedure Referencia1Click(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure Extension1Click(Sender: TObject);
  private
    { Private declarations }
    awrAceptar     : boolean;
    awrCliente   : integer;
    awrExtension : variant;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);
    procedure setID_CLIENTE(valor : integer);
    procedure setID_EXTENSION(valor : variant);

    function getAceptar : boolean;
    function getID : integer;
    function getID_CLIENTE : integer;
    function getID_EXTENSION : variant;
    function getNombre : string;
  public
    { Public declarations }
    function abrirConsulta : boolean;
  published
     property DATABASE     : TIBDatabase write setDatabase;
     property TRANSACTION  : TIBTransaction write setTransaction;
     property ID           : integer read getID;
     property ID_CLIENTE   : integer read getID_CLIENTE write setID_CLIENTE;
     property ID_EXTENSION : variant read getID_EXTENSION write setID_EXTENSION;
     property ACEPTAR      : boolean read getAceptar write setAceptar;
     property NOMBRE       : string read getNombre;
  end;

var
  frmSeleccionarCXC: TfrmSeleccionarCXC;

implementation

{$R *.DFM}

const
   select1a = 'SELECT CXC.ID, CXC.REFERENCIA, CXC.CLIENTE, CXC.EXTENSION, CXC.ALMACEN, CXC.NUMERO_DE_DOCUMENTOS, CXC.DOCUMENTO, CXC.FECHA, CXC.FECHA_VENCIMIENTO, CXC.IMPORTE_INICIAL,';
   select1b = ' CXC.SALDO_ACTUAL + CXC.FINANCIAMIENTO + CXC.GASTOS + CXC.MORATORIOS + CXC.OTROS, S.CLAVE, S.NOMBRE, S.RAZON_SOCIAL, S.FACTURAR_A, A.NOMBRE, S.NOMBRE EXTENSION_NOMBRE';
   from1    = 'FROM CUENTAS_POR_COBRAR CXC, SUJETOS_CLIENTES SC, SUJETOS S, ALMACENES A';
   where1   = 'WHERE (CXC.CLIENTE = SC.ID) AND (SC.SUJETO = S.ID) AND (CXC.ALMACEN = A.ID) AND (CXC.ESTATUS = "Por Cobrar")';

   select2a = 'SELECT CXC.ID, CXC.REFERENCIA, CXC.CLIENTE, CXC.EXTENSION, CXC.ALMACEN, CXC.NUMERO_DE_DOCUMENTOS, CXC.DOCUMENTO, CXC.FECHA, CXC.FECHA_VENCIMIENTO, CXC.IMPORTE_INICIAL,';
   select2b = ' CXC.SALDO_ACTUAL + CXC.FINANCIAMIENTO + CXC.GASTOS + CXC.MORATORIOS + CXC.OTROS, S.CLAVE, S.NOMBRE, S.RAZON_SOCIAL, S.FACTURAR_A, A.NOMBRE, CE.NOMBRE EXTENSION_NOMBRE';
   from2    = 'FROM CUENTAS_POR_COBRAR CXC, SUJETOS_CLIENTES SC, SUJETOS S, ALMACENES A, CLIENTES_EXTENSIONES CE';
   where2   = 'WHERE (CXC.CLIENTE = SC.ID) AND (SC.SUJETO = S.ID) AND (CXC.ALMACEN = A.ID) AND (CXC.ESTATUS = "Por Cobrar") AND (CXC.EXTENSION = CE.ID)';


function TfrmSeleccionarCXC.abrirConsulta : boolean;
var
   tmp : boolean;
begin
   tmp := false;
   if edDato.Text <> '' then
   begin
      qyBusqueda.Close;
      qyBusqueda.SQL.Clear;
      qyBusqueda.SQL.Add(select2a);
      qyBusqueda.SQL.Add(select2b);
      qyBusqueda.SQL.Add(from2);
      qyBusqueda.SQL.Add(where2);
      qyBusqueda.SQL.Add('AND CXC.REFERENCIA  = "'+edDato.Text+'"');
      qyBusqueda.Open;

      if qyBusqueda.IsEmpty then
      begin
         buEjecutar.Click;
         if (qyBusqueda.RecordCount = 0) or (qyBusqueda.RecordCount > 1) then
            tmp := true;
      end;
   end
   else
      tmp := true;
   Result := tmp;
end;

procedure TfrmSeleccionarCXC.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
end;

procedure TfrmSeleccionarCXC.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
end;

procedure TfrmSeleccionarCXC.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

function TfrmSeleccionarCXC.getNombre : string;
begin
   if dsBusqueda.DataSet.FieldByName('EXTENSION').AsString <> '' then
      Result := dsBusqueda.DataSet.FieldByName('EXTENSION_NOMBRE').AsString
   else
   begin
      if dsBusqueda.DataSet.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
         Result := dsBusqueda.DataSet.FieldByName('RAZON_SOCIAL').AsString
      else
         Result := dsBusqueda.DataSet.FieldByName('NOMBRE').AsString;
   end;
end;

procedure TfrmSeleccionarCXC.setID_CLIENTE(valor : integer);
begin
   awrCliente   := valor;
   awrExtension := null;
   //dgExplorarEXTENSION.Visible := false;

   qyBusqueda.Close;
   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.Add(Select1a);
   qyBusqueda.SQL.Add(Select1b);
   qyBusqueda.SQL.Add(From1);
   qyBusqueda.SQL.Add(Where1);
   qyBusqueda.SQL.Add('AND (CXC.CLIENTE = '+IntToStr(valor)+')');
   qyBusqueda.Open;
end;

procedure TfrmSeleccionarCXC.setID_EXTENSION(valor : variant);
begin
   awrExtension := valor;
   awrCliente   := 0;
   //dgExplorarEXTENSION.Visible := true;

   qyBusqueda.Close;
   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.Add(Select2a);
   qyBusqueda.SQL.Add(Select2b);
   qyBusqueda.SQL.Add(From2);
   qyBusqueda.SQL.Add(Where2);
   qyBusqueda.SQL.Add('AND (CXC.EXTENSION = '+IntToStr(valor)+')');
   qyBusqueda.Open;
end;

function TfrmSeleccionarCXC.getAceptar : boolean;
begin
   Result := awrAceptar;
end;

function TfrmSeleccionarCXC.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarCXC.getID_CLIENTE : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('CLIENTE').AsInteger;
end;

function TfrmSeleccionarCXC.getID_EXTENSION : variant;
begin
   Result := dsBusqueda.DataSet.FieldByName('EXTENSION').Value;
end;

procedure TfrmSeleccionarCXC.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCXC.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCXC.ini');

   awrCliente   := 0;
   awrExtension := null;
end;

procedure TfrmSeleccionarCXC.buBusquedaClick(Sender: TObject);
begin
   buEjecutar.Click;
end;

procedure TfrmSeleccionarCXC.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarCXC.buEjecutarClick(Sender: TObject);
var
   tmp : string;
begin
   if (awrExtension <> null) or (buBusqueda.Caption = 'CE.NOMBRE') then
   begin
      //dgExplorarEXTENSION.Visible := true;
      qyBusqueda.Close;
      qyBusqueda.SQL.Clear;
      qyBusqueda.SQL.Add(select2a);
      qyBusqueda.SQL.Add(select2b);
      qyBusqueda.SQL.Add(from2);
      qyBusqueda.SQL.Add(where2);
      edDato.Text := UpperCase(edDato.Text);
      tmp := 'AND UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
      qyBusqueda.SQL.Add(tmp);
      qyBusqueda.Open;
   end
   else
   begin
      //dgExplorarEXTENSION.Visible := false;
      qyBusqueda.Close;
      qyBusqueda.SQL.Clear;
      qyBusqueda.SQL.Add(select1a);
      qyBusqueda.SQL.Add(select1b);
      qyBusqueda.SQL.Add(from1);
      qyBusqueda.SQL.Add(where1);
      edDato.Text := UpperCase(edDato.Text);
      tmp := 'AND UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
      qyBusqueda.SQL.Add(tmp);
      qyBusqueda.Open;
   end;
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCXC.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select2a);
  qyBusqueda.SQL.Add(select2b);
  qyBusqueda.SQL.Add(from2);
  qyBusqueda.SQL.Add(where2);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;

end;

procedure TfrmSeleccionarCXC.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCXC.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarCXC.buInicioClick(Sender: TObject);
begin
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCXC.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarCXC.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarCXC.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarCXC.dgExplorarDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCXC.Id1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'CXC.ID';
end;

procedure TfrmSeleccionarCXC.Referencia1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'CXC.REFERENCIA';
end;

procedure TfrmSeleccionarCXC.Cliente1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
end;

procedure TfrmSeleccionarCXC.Extension1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'CE.NOMBRE';
end;

end.
