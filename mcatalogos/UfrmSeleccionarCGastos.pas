unit UfrmSeleccionarCGastos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,

   ExtCtrls,
  StdCtrls, Mask, DBCtrls,  IBX.IBStoredProc,  Buttons,
  Grids, DBGrids;

type
  TfrmSeleccionarCGastos = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    itemDESCRIPCION: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    dgExplorar: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaCONCEPTO: TIBStringField;
    qyBusquedaPORC: TFloatField;
    Panel2: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buFin: TBitBtn;
    buSiguiente: TBitBtn;
    ibSalir: TBitBtn;
    deID: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure buTodosClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure itemDESCRIPCIONClick(Sender: TObject);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    awrAceptar : boolean;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);

    function getAceptar : boolean;
    function getID : integer;
    function getCONCEPTO : string;
    function getPORC : double;
  public
    { Public declarations }
    function abrirConsulta : boolean;
  published
     property DATABASE     : TIBDatabase write setDatabase;
     property TRANSACTION  : TIBTransaction write setTransaction;
     property ACEPTAR      : boolean read getAceptar write setAceptar;
     property ID           : integer read getID;
     property CONCEPTO     : string read getCONCEPTO;
     property PORC         : double read getPORC;
  end;

var
  frmSeleccionarCGastos: TfrmSeleccionarCGastos;

implementation

{$R *.DFM}

const
   select = 'SELECT G.ID, G.CONCEPTO, G.PORC';
   from   = 'FROM CONCEPTOS_GASTOS G';


function TfrmSeleccionarCGastos.abrirConsulta : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   if edDato.Text <> '' then
   begin
      qyBusqueda.Close;
      qyBusqueda.SQL.Clear;
      qyBusqueda.SQL.Add(select);
      qyBusqueda.SQL.Add(from);
      qyBusqueda.SQL.Add('WHERE (ID > 0) AND (UPPER(G.CONCEPTO) LIKE "%'+UpperCase(edDato.Text)+'%")');
      qyBusqueda.Open;


      if not(qyBusqueda.IsEmpty) then
      begin
         if not(dgExplorar.DataSource.DataSet.RecordCount = 0) or (dgExplorar.DataSource.DataSet.RecordCount > 1) then
            tmp := false;
      end
   end;
   Result := tmp;
end;

procedure TfrmSeleccionarCGastos.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
end;

procedure TfrmSeleccionarCGastos.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
end;

procedure TfrmSeleccionarCGastos.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

function TfrmSeleccionarCGastos.getPORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('PORC').AsFloat;
end;

function TfrmSeleccionarCGastos.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarCGastos.getCONCEPTO : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('CONCEPTO').AsString;
end;

function TfrmSeleccionarCGastos.getAceptar : boolean;
begin
   Result := awrAceptar;
end;

procedure TfrmSeleccionarCGastos.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
  // dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCGastos.ini';
  // dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCGastos.ini');
end;

procedure TfrmSeleccionarCGastos.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCGastos.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarCGastos.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarCGastos.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarCGastos.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarCGastos.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCGastos.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmSeleccionarCGastos.buEjecutarClick(Sender: TObject);
var
   tmp : string;
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  edDato.Text := UpperCase(edDato.Text);
  tmp := 'WHERE (ID > 0) AND UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
  qyBusqueda.SQL.Add(tmp);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCGastos.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarCGastos.itemDESCRIPCIONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'G.CONCEPTO';
end;

procedure TfrmSeleccionarCGastos.dgExplorarDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) and (Self.WindowState = wsMaximized)  then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCGastos.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) and (Self.WindowState = wsMaximized) then
      ACEPTAR := true;
end;

end.
