unit UfrmSeleccionarMaterialCompras;

interface

uses
  UsqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
       StdCtrls, Mask, DBCtrls,

   ExtCtrls,  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBDatabase, IBX.IBTable,  Buttons, Grids, DBGrids;

type
  TfrmSeleccionarMaterialCompras = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    SCID1: TMenuItem;
    itemCLAVE: TMenuItem;
    itemDESCRIPCION: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    dgExplorar: TDBGrid;
    itemCODIGODEBARRAS: TMenuItem;
    qyBusquedaID: TIntegerField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaDESCRIPCION: TIBStringField;
    qyBusquedaCODIGO_BARRAS: TIBStringField;
    qyBusquedaUNIDAD_BASE: TIntegerField;
    qyBusquedaIVA_PORC: TFloatField;
    qyBusquedaIEPS_PORC: TFloatField;
    qyBusquedaIMPUESTO_1_PORC: TFloatField;
    qyBusquedaIMPUESTO_2_PORC: TFloatField;
    qyBusquedaCOSTO_ULT_COMPRA: TFloatField;
    qyBusquedaLINEA: TIntegerField;
    TLineas: TIBTable;
    qyBusquedaFOTO: TBlobField;
    qyBusquedaUNIDADES_X_CAJA: TIntegerField;
    qyBusquedaOBSERVACIONES: TBlobField;
    qyBusquedaCOSTO: TFloatField;
    qyBusquedaESTATUS: TIBStringField;
    qyBusquedaNUM_SERIE: TIBStringField;
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
    procedure itemDESCRIPCIONClick(Sender: TObject);
    procedure itemCODIGODEBARRASClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    BAceptar : boolean;
    awrCampo : string;
    sqlSelec : TSqlAnaliza;
    procedure setCLAVE(valor : string);
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setAceptar(valor : boolean);

    function getLINEA_DESCRIPCION : string;
    function getLINEA : integer;
    function getID : integer;
    function getCLAVE : string;
    function getDESCRIPCION : string;
    function getCODIGO_BARRAS : string;
    function getUNIDAD_BASE : integer;
    function getIVA_PORC : double;
    function getIEPS_PORC : double;
    function getIMPUESTO1_PORC : double;
    function getIMPUESTO2_PORC : double;
    function getCOSTO : double;
    function getCOSTO_ULT_COMPRA : double;
    function getAceptar : boolean;
    function getPZASXCAJA : integer;
    function dameSerie : boolean;
  public
    { Public declarations }
    function abrirConsulta : boolean;
    procedure LoadFoto(var valor : TMemoryStream);
    procedure LoadObservaciones(var valor : TMemoryStream);
  published
     property DATABASE      : TIBDatabase write setDatabase;
     property TRANSACTION   : TIBTransaction write setTransaction;
     property CAMPO         : string read awrCampo write awrCampo;
     property ID            : integer read getID;
     property CLAVE         : string read getCLAVE write setCLAVE;
     property DESCRIPCION   : string read getDESCRIPCION;
     property CODIGO_BARRAS : string read getCODIGO_BARRAS;
     property UNIDAD_BASE   : integer read getUNIDAD_BASE;
     property IVA_PORC      : double read getIVA_PORC;
     property IEPS_PORC     : double read getIEPS_PORC;
     property IMPUESTO1_PORC: double read getIMPUESTO1_PORC;
     property IMPUESTO2_PORC: double read getIMPUESTO2_PORC;
     property COSTO         : double read getCOSTO;
     property COSTO_ULT_COMP: double read getCOSTO_ULT_COMPRA;
     property ACEPTAR       : boolean read getAceptar write setAceptar;
     property LINEA         : integer read getLINEA;
     property LINEA_NOMBRE  : string read getLINEA_DESCRIPCION;
     property PZASXCAJA     : integer read getPZASXCAJA;
     property SERIE         : boolean read dameSerie;
  end;

var
  frmSeleccionarMaterialCompras: TfrmSeleccionarMaterialCompras;

implementation

{$R *.DFM}

procedure TfrmSeleccionarMaterialCompras.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database := valor;
   TLineas.Database    := valor;
   sqlSelec.DataBase   := valor;
end;

procedure TfrmSeleccionarMaterialCompras.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction := valor;
   TLineas.Transaction    := valor;
   sqlSelec.Transaction   := valor;

   sqlSelec.AddStrings(qyBusqueda.SQL);
end;


function TfrmSeleccionarMaterialCompras.abrirConsulta : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   if edDato.Text <> '' then
   begin
      if (CAMPO <> '') then
      begin
         buBusqueda.Caption := CAMPO;
         edDato.Text        := UpperCase(edDato.Text);
         buEjecutar.Click;
      end
      else
      begin
         buBusqueda.Caption := 'M.CLAVE';
         edDato.Text        := UpperCase(edDato.Text);
         buEjecutar.Click;
         if qyBusqueda.IsEmpty then
         begin
            buBusqueda.Caption := 'M.CODIGO_BARRAS';
            edDato.Text        := UpperCase(edDato.Text);
            buEjecutar.Click;
         end;
      end;


     if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
     begin
         tmp := false;
         if (dsBusqueda.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado') then
         begin
            tmp := true;
            ShowMessage('No es posible hacer transacciones con un material cancelado.')
         end;
     end
     else
      if qyBusqueda.IsEmpty then
      begin
         buBusqueda.Caption := 'M.DESCRIPCION';
         buEjecutar.Click;
         if not(qyBusqueda.IsEmpty) and (dgExplorar.Datasource.Dataset.Recordcount = 1) then
         begin
            tmp := false;
            if (dsBusqueda.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado') then
            begin
               tmp := true;
               ShowMessage('No es posible hacer transacciones con un material cancelado.');
            end;
         end;
      end;
   end;
   Result := tmp;
end;

function TfrmSeleccionarMaterialCompras.dameSerie : boolean;
begin
   result := dsBusqueda.DataSet.FieldByName('NUM_SERIE').AsString = 'Si';
end;

function TfrmSeleccionarMaterialCompras.getPZASXCAJA : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('UNIDADES_X_CAJA').AsInteger;
end;

procedure TfrmSeleccionarMaterialCompras.LoadObservaciones(var valor : TMemoryStream);
begin
   valor.Clear;
   TBlobField(qyBusqueda.FieldByName('OBSERVACIONES')).SaveToStream(valor);
end;

procedure TfrmSeleccionarMaterialCompras.LoadFoto(var valor : TMemoryStream);
begin
   valor.Clear;
   TBlobField(qyBusqueda.FieldByName('FOTO')).SaveToStream(valor);
end;

function TfrmSeleccionarMaterialCompras.getLINEA_DESCRIPCION : string;
begin
   if TLineas.State = dsInactive then
      TLineas.Open;
   if not(dsBusqueda.DataSet.IsEmpty) then
      TLineas.Filter := 'ID = ' + dsBusqueda.DataSet.FieldByName('LINEA').AsString;
   Result := TLineas.FieldByName('DESCRIPCION').AsString;
end;

function TfrmSeleccionarMaterialCompras.getLINEA : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('LINEA').AsInteger;
end;

function TfrmSeleccionarMaterialCompras.getUNIDAD_BASE : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('UNIDAD_BASE').AsInteger;
end;

function TfrmSeleccionarMaterialCompras.getIVA_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('IVA_PORC').AsFloat;
end;

function TfrmSeleccionarMaterialCompras.getIEPS_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('IEPS_PORC').AsFloat;
end;

function TfrmSeleccionarMaterialCompras.getIMPUESTO1_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('IMPUESTO_1_PORC').AsFloat;
end;

function TfrmSeleccionarMaterialCompras.getIMPUESTO2_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('IMPUESTO_2_PORC').AsFloat;
end;

function TfrmSeleccionarMaterialCompras.getCOSTO_ULT_COMPRA : double;
begin
   if dsBusqueda.DataSet.FieldByName('COSTO_ULT_COMPRA').AsFloat <> 0 then
      result := dsBusqueda.DataSet.FieldByName('COSTO_ULT_COMPRA').AsFloat
   else
      result := COSTO;//Cuando se arranca el sistema y no existe ninguna orden de compra
end;

function TfrmSeleccionarMaterialCompras.getCOSTO : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('COSTO').AsFloat;
end;

procedure TfrmSeleccionarMaterialCompras.setCLAVE(valor : string);
begin
   edDato.Text := valor;
end;

procedure TfrmSeleccionarMaterialCompras.setAceptar(valor : boolean);
begin
   BAceptar := valor;
   if BAceptar then
      Close;
end;

function TfrmSeleccionarMaterialCompras.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
end;

function TfrmSeleccionarMaterialCompras.getCLAVE : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('CLAVE').AsString;
end;

function TfrmSeleccionarMaterialCompras.getDESCRIPCION : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('DESCRIPCION').AsString;
end;

function TfrmSeleccionarMaterialCompras.getCODIGO_BARRAS : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('CODIGO_BARRAS').AsString;
end;

function TfrmSeleccionarMaterialCompras.getAceptar : boolean;
begin
   Result := BAceptar;
end;

procedure TfrmSeleccionarMaterialCompras.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarMaterial.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarMaterial.ini');

   sqlSelec := TSqlAnaliza.Create;
end;

procedure TfrmSeleccionarMaterialCompras.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.Dataset.First;
end;

procedure TfrmSeleccionarMaterialCompras.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.Dataset.Prior;
end;

procedure TfrmSeleccionarMaterialCompras.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.Dataset.Next;
end;

procedure TfrmSeleccionarMaterialCompras.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.Dataset.Last;
end;

procedure TfrmSeleccionarMaterialCompras.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarMaterialCompras.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarMaterialCompras.buTodosClick(Sender: TObject);
begin
   sqlSelec.LoadOriginal;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlSelec.strSql);
   qyBusqueda.Open;

   dgExplorar.DataSource.Dataset.First;
end;

procedure TfrmSeleccionarMaterialCompras.buBusquedaClick(Sender: TObject);
begin
   buEjecutar.Click;
end;

procedure TfrmSeleccionarMaterialCompras.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarMaterialCompras.buEjecutarClick(Sender: TObject);
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
      if (vTipo = ftInteger) or (vCampo = 'M.CODIGO_BARRAS') then
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

   dgExplorar.DataSource.Dataset.First;
end;

procedure TfrmSeleccionarMaterialCompras.dgExplorarDblClick(Sender: TObject);
var
   estatus : string;
begin
   estatus := dsBusqueda.DataSet.FieldByName('ESTATUS').AsString;

   if not(qyBusqueda.IsEmpty) and (estatus <> 'Cancelado') then
      ACEPTAR := true
   else
   begin
     ShowMessage('No es posible hacer transacciones con un material cancelado.');
   end;
end;

procedure TfrmSeleccionarMaterialCompras.SCID1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'M.ID';
end;

procedure TfrmSeleccionarMaterialCompras.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'M.CLAVE';
end;

procedure TfrmSeleccionarMaterialCompras.itemDESCRIPCIONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'M.DESCRIPCION';
end;

procedure TfrmSeleccionarMaterialCompras.itemCODIGODEBARRASClick(Sender: TObject);
begin
   buBusqueda.Caption := 'M.CODIGO_BARRAS';
end;

procedure TfrmSeleccionarMaterialCompras.FormDestroy(Sender: TObject);
begin
   sqlSelec.Free;
end;

end.
