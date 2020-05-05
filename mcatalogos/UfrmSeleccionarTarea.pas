unit UfrmSeleccionarTarea;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,

   ExtCtrls,
  StdCtrls, Mask, DBCtrls,  Menus, Db, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBDatabase, Buttons, Grids, DBGrids;

type
  TfrmSeleccionarTarea = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemDESCRIPCION: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    dgExplorar: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaDESCRIPCION: TIBStringField;
    Panel2: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buFin: TBitBtn;
    buSiguiente: TBitBtn;
    ibSalir: TBitBtn;
    deID: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure buTodosClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure itemIDClick(Sender: TObject);
    procedure itemDESCRIPCIONClick(Sender: TObject);
  private
    { Private declarations }
    awrAceptar : boolean;
    awrCampo : string;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);
    procedure setDESCRIPCION(valor : string);

    function getAceptar : boolean;
    function getID : integer;
    function getDESCRIPCION : string;
  public
    { Public declarations }
    function abrirConsulta : boolean;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property CAMPO       : string read awrCampo write awrCampo;
     property ACEPTAR     : boolean read getAceptar write setAceptar;

     property ID          : integer read getID;
     property DESCRIPCION : string read getDESCRIPCION write setDESCRIPCION;
  end;

var
  frmSeleccionarTarea: TfrmSeleccionarTarea;

implementation

{$R *.DFM}

const
   select = 'SELECT T.ID, T.DESCRIPCION';
   from   = 'FROM TAREAS T';


function TfrmSeleccionarTarea.abrirConsulta : boolean;
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
      qyBusqueda.SQL.Add('WHERE UPPER(T.DESCRIPCION) LIKE "%'+edDato.Text+'%"');
      qyBusqueda.Open;

      if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
         ACEPTAR := true
      else
         tmp := true
   end
   else
      tmp := true;
   Result := tmp;
end;

procedure TfrmSeleccionarTarea.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
end;

procedure TfrmSeleccionarTarea.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
end;

procedure TfrmSeleccionarTarea.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

function TfrmSeleccionarTarea.getAceptar : boolean;
begin
   Result := awrAceptar;
end;

function TfrmSeleccionarTarea.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarTarea.getDESCRIPCION : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('DESCRIPCION').AsString;
end;

procedure TfrmSeleccionarTarea.setDESCRIPCION(valor : string);
begin
   edDato.Text := valor;
end;

procedure TfrmSeleccionarTarea.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
  // dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarTareas.ini';
 //  dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarTareas.ini');
end;

procedure TfrmSeleccionarTarea.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarTarea.dgExplorarDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarTarea.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarTarea.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarTarea.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarTarea.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarTarea.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarTarea.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarTarea.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmSeleccionarTarea.buEjecutarClick(Sender: TObject);
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

procedure TfrmSeleccionarTarea.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarTarea.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'T.ID';
end;

procedure TfrmSeleccionarTarea.itemDESCRIPCIONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'T.DESCRIPCION';
end;

end.
