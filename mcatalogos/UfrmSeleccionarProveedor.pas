unit UfrmSeleccionarProveedor;

interface

uses
  UsqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet,     IBX.IBQuery,
  IBX.IBDatabase,  StdCtrls, Mask, DBCtrls,
       ExtCtrls,
   Menus,  Buttons, Grids, DBGrids;

type
  TfrmSeleccionarProveedor = class(TForm)
    pmCampos: TPopupMenu;
    SCID1: TMenuItem;
    itemCLAVE: TMenuItem;
    itemNOMBRE: TMenuItem;
    itemRAZON: TMenuItem;
    itemCompraMinima: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
    dgExplorar: TDBGrid;
    qyBusquedaID: TIntegerField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaNOMBRE: TIBStringField;
    qyBusquedaRAZON_SOCIAL: TIBStringField;
    qyBusquedaCOMPRA_MINIMA: TFloatField;
    qyBusquedaFACTURAR_A: TIBStringField;
    qyBusquedaTEL_PRINCIPAL: TIBStringField;
    itemTELEFONO: TMenuItem;
    qyBusquedaFORMAS_DE_PAGO: TIntegerField;
    qyBusquedaDESCUENTO_PORC: TFloatField;
    qyBusquedaMONEDA: TIntegerField;
    qyBusquedaESTATUS: TIBStringField;
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
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure buTodosClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buEjecutarClick(Sender: TObject);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure SCID1Click(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemNOMBREClick(Sender: TObject);
    procedure itemRAZONClick(Sender: TObject);
    procedure itemCompraMinimaClick(Sender: TObject);
    procedure itemTELEFONOClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    BAceptar : boolean;
    sqlSelec : TSqlAnaliza;
    procedure setCLAVE(valor : string);
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);

    function getID : integer;
    function getCLAVE : string;
    function getNOMBRE : string;
    function getRSOCIAL : string;
    function getAceptar : boolean;
    function getFacturarA : string;
    function getTELEFONO : string;
    function getCCOMERCIAL : integer;
    function getDESC_PORC : double;
    function getMONEDA : integer;
  public
    { Public declarations }
    function abrirConsulta : boolean;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property ID          : integer read getID;
     property CLAVE       : string read getCLAVE write setCLAVE;
     property NOMBRE      : string read getNOMBRE;
     property RSOCIAL     : string read getRSOCIAL;
     property ACEPTAR     : boolean read getAceptar write setAceptar;
     property FACTURAR_A  : string read getFacturarA;
     property TELEFONO    : string read getTELEFONO;
     property CCOMERCIAL  : integer read getCCOMERCIAL;
     property DESC_PORC   : double read getDESC_PORC;
     property MONEDA      : integer read getMONEDA;
  end;

var
  frmSeleccionarProveedor: TfrmSeleccionarProveedor;

implementation

{$R *.DFM}

procedure TfrmSeleccionarProveedor.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
   sqlSelec.DataBase   := valor;
end;

procedure TfrmSeleccionarProveedor.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
   sqlSelec.Transaction   := valor;

   sqlSelec.AddStrings(qyBusqueda.SQL);
end;

function TfrmSeleccionarProveedor.abrirConsulta : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   if edDato.Text <> '' then
   begin
      buBusqueda.Caption := 'S.CLAVE';
      edDato.Text        := UpperCase(edDato.Text);
      buEjecutar.Click;

     if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
     begin
         tmp := false;
         if (dsBusqueda.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado') then
         begin
            tmp := true;
            ShowMessage('No es posible hacer transacciones con un proveedor cancelado.');
         end;
     end
     else
      if qyBusqueda.IsEmpty then
      begin
         buBusqueda.Caption := 'S.NOMBRE';
         buEjecutar.Click;
         if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
         begin
            tmp := false;
            if (dsBusqueda.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado') then
            begin
               tmp := true;
               ShowMessage('No es posible hacer transacciones con un proveedor cancelado.');
            end;
         end;
      end;
   end;
   Result := tmp;
end;

function TfrmSeleccionarProveedor.getMONEDA : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('MONEDA').AsInteger;
end;

function TfrmSeleccionarProveedor.getCCOMERCIAL : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('FORMAS_DE_PAGO').AsInteger;
end;

function TfrmSeleccionarProveedor.getDESC_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('DESCUENTO_PORC').AsFloat;
end;

function TfrmSeleccionarProveedor.getTELEFONO : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('TEL_PRINCIPAL').AsString;
end;

function TfrmSeleccionarProveedor.getRSOCIAL : string;
begin
   result := dsBusqueda.DataSet.FieldByName('RAZON_SOCIAL').AsString;
end;

function TfrmSeleccionarProveedor.getFacturarA : string;
begin
   if dsBusqueda.DataSet.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
      Result := dsBusqueda.DataSet.FieldByName('RAZON_SOCIAL').AsString
   else
      Result := dsBusqueda.DataSet.FieldByName('NOMBRE').AsString;
end;

procedure TfrmSeleccionarProveedor.setCLAVE(valor : string);
begin
   edDato.Text := valor;
end;

procedure TfrmSeleccionarProveedor.setAceptar(valor : boolean);
begin
   BAceptar := valor;
   if BAceptar then
      Close;
end;

function TfrmSeleccionarProveedor.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarProveedor.getCLAVE : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('CLAVE').AsString;
end;

function TfrmSeleccionarProveedor.getNOMBRE : string;
begin
   Result :=  dsBusqueda.DataSet.FieldByName('NOMBRE').AsString;
end;

function TfrmSeleccionarProveedor.getAceptar : boolean;
begin
   Result := BAceptar;
end;

procedure TfrmSeleccionarProveedor.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
//   dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarProveedor.ini';
//   dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarProveedor.ini');

   sqlSelec := TSqlAnaliza.Create;
end;

procedure TfrmSeleccionarProveedor.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarProveedor.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarProveedor.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarProveedor.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarProveedor.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarProveedor.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarProveedor.buTodosClick(Sender: TObject);
begin
   sqlSelec.LoadOriginal;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlSelec.strSql);
   qyBusqueda.Open;
   
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarProveedor.buBusquedaClick(Sender: TObject);
begin
   buEjecutar.Click;
end;

procedure TfrmSeleccionarProveedor.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarProveedor.buEjecutarClick(Sender: TObject);
var
  vLogica    : string;
  vCampo     : string;
  vSentencia : string;
  vParam     : string;
  i, j       : integer;
  tmp        : string;
  vTipo      : TFieldType;
begin
   sqlSelec.LoadOriginal;

   vLogica := 'AND';

   vCampo := buBusqueda.Caption;
   vTipo  := sqlSelec.dameTipoC(vCampo);

   if vTipo in [ftDate, ftDateTime] then
   begin
   end
   else
      if vTipo = ftInteger then
      begin
         vSentencia := '=';
         vParam     := ':P_DATO';

         j := sqlSelec.AddParamIndex('P_DATO');
         sqlSelec.setParam(j, edDato.Text, psCadena);
      end
      else
      begin
         vSentencia := 'LIKE';
         vParam     := ':P_DATO';
         vCampo     := 'UPPER('+vCampo+')';

         j := sqlSelec.AddParamIndex('P_DATO');
         sqlSelec.setParam(j, '%'+edDato.Text+'%', psCadena);
      end;

   if (sqlSelec.CountWhere = 0) then
      vLogica := ''
   else
      vLogica := vLogica + ' ';

   tmp := vLogica+'('+vCampo+' '+vSentencia+' '+vParam+')';

   sqlSelec.AddWhereExtra(tmp);
   sqlSelec.construirExtra;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlSelec.strSql);
   for i := 1 to sqlSelec.indexParam do
   begin
      qyBusqueda.ParamByName(sqlSelec.dameParam(i)).Value := sqlSelec.dameParamValor(i);
   end;
   qyBusqueda.Open;

   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarProveedor.dgExplorarDblClick(Sender: TObject);
var
   estatus : string;
begin
   estatus := dsBusqueda.DataSet.FieldByName('ESTATUS').AsString;

   if not(qyBusqueda.IsEmpty) and (estatus <> 'Cancelado') then
      ACEPTAR := true
   else
   begin
     ShowMessage('No es posible hacer transacciones con un proveedor cancelado.');
   end;
end;

procedure TfrmSeleccionarProveedor.SCID1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'SP.ID';
end;

procedure TfrmSeleccionarProveedor.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.CLAVE';
end;

procedure TfrmSeleccionarProveedor.itemNOMBREClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
end;

procedure TfrmSeleccionarProveedor.itemRAZONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.RAZON_SOCIAL';
end;

procedure TfrmSeleccionarProveedor.itemCompraMinimaClick(Sender: TObject);
begin
   buBusqueda.Caption := 'SP.COMPRA_MINIMA';
end;

procedure TfrmSeleccionarProveedor.itemTELEFONOClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.TEL_PRINCIPAL';
end;

procedure TfrmSeleccionarProveedor.FormDestroy(Sender: TObject);
begin
   sqlSelec.Free;
end;

end.
