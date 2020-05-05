unit UfrmSeleccionarCXP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
       StdCtrls, Mask, DBCtrls,
   ExtCtrls,  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, Grids, DBGrids, Buttons;

type
  TfrmSeleccionarCXP = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    Id1: TMenuItem;
    Referencia1: TMenuItem;
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
    qyBusquedaPROVEEDOR: TIntegerField;
    qyBusquedaNUMERO_DE_DOCUMENTOS: TIntegerField;
    qyBusquedaDOCUMENTO: TIntegerField;
    qyBusquedaFECHA_VENCIMIENTO: TDateTimeField;
    qyBusquedaTOTAL: TFloatField;
    qyBusquedaSALDO_ACTUAL: TFloatField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaRAZON_SOCIAL: TIBStringField;
    qyBusquedaFACTURAR_A: TIBStringField;
    Proveedor1: TMenuItem;
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
    procedure Proveedor1Click(Sender: TObject);
  private
    { Private declarations }
    awrAceptar   : boolean;
    awrProveedor : integer;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);
    procedure setID_PROVEEDOR(valor : integer);

    function getAceptar : boolean;
    function getID : integer;
    function getID_PROVEEDOR : integer;
    function getNombre : string;
  public
    { Public declarations }
    function abrirConsulta : boolean;
  published
     property DATABASE     : TIBDatabase write setDatabase;
     property TRANSACTION  : TIBTransaction write setTransaction;
     property ID           : integer read getID;
     property ID_PROVEEDOR : integer read getID_PROVEEDOR write setID_PROVEEDOR;
     property NOMBRE       : string read getNombre;
     property ACEPTAR      : boolean read getAceptar write setAceptar;
  end;

var
  frmSeleccionarCXP: TfrmSeleccionarCXP;

implementation

{$R *.DFM}

const
   select = 'SELECT CXP.ID, CXP.REFERENCIA, CXP.PROVEEDOR, CXP.NUMERO_DE_DOCUMENTOS, CXP.DOCUMENTO, CXP.FECHA_VENCIMIENTO, CXP.TOTAL, CXP.SALDO_ACTUAL, S.NOMBRE, S.RAZON_SOCIAL, S.FACTURAR_A';
   from   = 'FROM CUENTAS_X_PAGAR CXP, SUJETOS_PROVEEDORES SP, SUJETOS S';
   where  = 'WHERE (CXP.PROVEEDOR = SP.ID) AND (SP.SUJETO = S.ID) AND (CXP.ESTATUS = "Pendiente de Pago")';


function TfrmSeleccionarCXP.abrirConsulta : boolean;
var
   tmp : boolean;
begin
   tmp := false;
   if edDato.Text <> '' then
   begin
      qyBusqueda.Close;
      qyBusqueda.SQL.Clear;
      qyBusqueda.SQL.Add(select);
      qyBusqueda.SQL.Add(from);
      qyBusqueda.SQL.Add(where);
      qyBusqueda.SQL.Add('AND CXP.REFERENCIA  = "'+edDato.Text+'"');
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

procedure TfrmSeleccionarCXP.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
end;

procedure TfrmSeleccionarCXP.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
end;

procedure TfrmSeleccionarCXP.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

procedure TfrmSeleccionarCXP.setID_PROVEEDOR(valor : integer);
begin
   awrProveedor := valor;

   qyBusqueda.Close;
   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.Add(Select);
   qyBusqueda.SQL.Add(From);
   qyBusqueda.SQL.Add(Where);
   qyBusqueda.SQL.Add('AND (CXP.PROVEEDOR = '+IntToStr(valor)+')');
   qyBusqueda.Open;
end;

function TfrmSeleccionarCXP.getAceptar : boolean;
begin
   Result := awrAceptar;
end;

function TfrmSeleccionarCXP.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarCXP.getID_PROVEEDOR : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('PROVEEDOR').AsInteger;
end;

function TfrmSeleccionarCXP.getNombre : string;
begin
   if dsBusqueda.DataSet.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
      Result := dsBusqueda.DataSet.FieldByName('RAZON_SOCIAL').AsString
   else
      Result := dsBusqueda.DataSet.FieldByName('NOMBRE').AsString;
end;

procedure TfrmSeleccionarCXP.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCXP.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCXP.ini');

   awrProveedor := 0;
end;

procedure TfrmSeleccionarCXP.buBusquedaClick(Sender: TObject);
begin
   buEjecutar.Click;
end;

procedure TfrmSeleccionarCXP.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarCXP.buEjecutarClick(Sender: TObject);
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

procedure TfrmSeleccionarCXP.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.SQL.Add(where);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
  
end;

procedure TfrmSeleccionarCXP.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCXP.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarCXP.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCXP.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarCXP.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCXP.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarCXP.dgExplorarDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCXP.Id1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'CXP.ID';
end;

procedure TfrmSeleccionarCXP.Referencia1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'CXP.REFERENCIA';
end;

procedure TfrmSeleccionarCXP.Proveedor1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
end;

end.
