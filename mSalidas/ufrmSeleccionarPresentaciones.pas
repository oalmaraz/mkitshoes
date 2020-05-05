unit ufrmSeleccionarPresentaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, Buttons, Grids, DBGrids, Mask, DBCtrls, StdCtrls,
  ExtCtrls;

type
  TfrmSeleccionarPresentaciones = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    qyBusquedaID: TIntegerField;
    qyBusquedaDESCRIPCION: TIBStringField;
    dsBusqueda: TDataSource;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemDESCRIPCION: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    dgExplorar: TDBGrid;
    sbHijo: TPanel;
    deID: TDBEdit;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    sbUp: TBitBtn;
    sbDown: TBitBtn;
    procedure dgExplorarDblClick(Sender: TObject);
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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
  frmSeleccionarPresentaciones: TfrmSeleccionarPresentaciones;

implementation

{$R *.DFM}

const
   select = 'SELECT P.ID, P.DESCRIPCION';
   from   = 'FROM PRESENTACIONES P';

function TfrmSeleccionarPresentaciones.abrirConsulta : boolean;
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
      qyBusqueda.SQL.Add('WHERE UPPER(P.DESCRIPCION) LIKE "%'+edDato.Text+'%"');
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

procedure TfrmSeleccionarPresentaciones.dgExplorarDblClick(
  Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarPresentaciones.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarPresentaciones.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
end;

procedure TfrmSeleccionarPresentaciones.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
end;

procedure TfrmSeleccionarPresentaciones.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

procedure TfrmSeleccionarPresentaciones.setDESCRIPCION(valor : string);
begin
   edDato.Text := valor;
end;

function TfrmSeleccionarPresentaciones.getAceptar : boolean;
begin
   Result := awrAceptar;
end;

function TfrmSeleccionarPresentaciones.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarPresentaciones.getDESCRIPCION : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('DESCRIPCION').AsString;
end;

procedure TfrmSeleccionarPresentaciones.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarPresentaciones.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarPresentaciones.ini');
end;

procedure TfrmSeleccionarPresentaciones.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPresentaciones.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarPresentaciones.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarPresentaciones.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarPresentaciones.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarPresentaciones.buTodosClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.SQL.Clear;
  qyBusqueda.SQL.Add(select);
  qyBusqueda.SQL.Add(from);
  qyBusqueda.Open;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarPresentaciones.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmSeleccionarPresentaciones.buEjecutarClick(Sender: TObject);
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

procedure TfrmSeleccionarPresentaciones.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarPresentaciones.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.ID';
end;

procedure TfrmSeleccionarPresentaciones.itemDESCRIPCIONClick(
  Sender: TObject);
begin
   buBusqueda.Caption := 'P.DESCRIPCION';
end;

end.
