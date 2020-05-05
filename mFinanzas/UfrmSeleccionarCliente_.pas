unit UfrmSeleccionarCliente_;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, DBCtrls,
  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
  ExtCtrls,
  Buttons, Grids, DBGrids, System.Variants;

type
  TCliente = record
     nombre     : string;
     rfc        : string;
     direccion  : string;
     colonia    : string;
     cp         : string;
     ciudad     : string;
     ccomercial : variant;
     moneda     : variant;
     telefono   : string;
     desc_porc  : double;
  end;

  TfrmSeleccionarCliente_ = class(TForm)
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    buTodos: TBitBtn;
    edDato: TEdit;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    dsBusqueda: TDataSource;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    itemCLAVE: TMenuItem;
    itemNOMBRE: TMenuItem;
    itemRAZON: TMenuItem;
    itemVENDEDOR: TMenuItem;
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
    SCID1: TMenuItem;
    qyCiudad: TIBQuery;
    qyCiudadID: TIntegerField;
    qyCiudadR_CIUDAD: TIBStringField;
    qyCiudadID1: TIntegerField;
    qyCiudadR_ESTADO: TIBStringField;
    qyCiudadID2: TIntegerField;
    qyCiudadR_PAIS: TIBStringField;
    qyVendedor: TIBQuery;
    qyBusquedaC_ID: TIntegerField;
    qyBusquedaC_CLAVE: TIBStringField;
    qyBusquedaC_NOMBRE: TIBStringField;
    qyBusquedaC_LIMITE_CREDITO: TFloatField;
    qyBusquedaC_DESC_PORC: TFloatField;
    qyBusquedaC_DOMICILIO: TIntegerField;
    qyBusquedaC_TELEFONO: TIBStringField;
    qyBusquedaC_TELEFONOS: TIntegerField;
    qyBusquedaC_RFC: TIBStringField;
    qyBusquedaC_FACTURAR_A: TIBStringField;
    qyBusquedaC_RAZON_SOCIAL: TIBStringField;
    qyBusquedaC_FORMA_DE_PAGO: TIntegerField;
    qyBusquedaC_MONEDA: TIntegerField;
    qyBusquedaC_ESTATUS: TIBStringField;
    qyBusquedaC_VENDEDOR: TIntegerField;
    qyVendedorID: TIntegerField;
    qyVendedorSUJETO: TIntegerField;
    qyVendedorCLASIFICACION: TIntegerField;
    qyVendedorTABULADOR: TIntegerField;
    qyVendedorTABULADOR_IMPORTADOS: TIntegerField;
    qyVendedorTABULADOR_EXTEMPORANEOS: TIntegerField;
    qyVendedorTABULADOR_SIN_OCOMPRA: TIntegerField;
    qyVendedorID1: TIntegerField;
    qyVendedorCLAVE: TIBStringField;
    qyVendedorNOMBRE: TIBStringField;
    qyVendedorRAZON_SOCIAL: TIBStringField;
    qyVendedorRFC: TIBStringField;
    qyVendedorCURP: TIBStringField;
    qyVendedorDOMICILIO: TIntegerField;
    qyVendedorTELEFONOS: TIntegerField;
    qyVendedorCONTACTOS: TIntegerField;
    qyVendedorFECHA_ALTA: TDateTimeField;
    qyVendedorFACTURAR_A: TIBStringField;
    qyVendedorE_MAIL: TIBStringField;
    qyVendedorWWWW: TIBStringField;
    qyVendedorOBSERVACIONES: TBlobField;
    qyVendedorSEXO: TIBStringField;
    qyVendedorFOTO: TBlobField;
    qyVendedorTEL_PRINCIPAL: TIBStringField;
    qyCDomicilio: TIBQuery;
    qyCDomicilioID: TIntegerField;
    qyCDomicilioCALLE: TIBStringField;
    qyCDomicilioENTRE_CALLE: TIBStringField;
    qyCDomicilioY_CALLE: TIBStringField;
    qyCDomicilioNUM_EXT: TIBStringField;
    qyCDomicilioNUM_INT: TIBStringField;
    qyCDomicilioLETRA: TIBStringField;
    qyCDomicilioCP: TIBStringField;
    qyCDomicilioCOLONIA: TIBStringField;
    qyCDomicilioCIUDAD: TIntegerField;
    qyCDomicilioZONA: TIBStringField;
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buBusquedaClick(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure buTodosClick(Sender: TObject);
    procedure dgExplorarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ibSalirClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SCID1Click(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemNOMBREClick(Sender: TObject);
    procedure itemRAZONClick(Sender: TObject);
    procedure itemVENDEDORClick(Sender: TObject);
    procedure dgExplorarDblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    sqlSelec   : TSqlAnaliza;
    awrAceptar : boolean;
    awrDatos   : TCliente;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure setCLAVE(valor : string);
    procedure setAceptar(valor : boolean);

    function getDatos : TCliente;

    function getID : integer;
    function getCLAVE : string;
    function getAceptar : boolean;
    function getTELEFONOS : integer;
    function getCCOMERCIAL : variant;
    function getMONEDA : variant;
    function getDESC_PORC : double;
    function getTELEFONO : string;
    function getNOMBRE : string;
    function getNOMBRE__ : string;
    function getVendedor : integer;
    function getVendedorN : string;
  public
    { Public declarations }
    function abrirConsulta : boolean;
    function abrir : boolean;
  published
     property DATABASE     : TIBDatabase write setDatabase;
     property TRANSACTION  : TIBTransaction write setTransaction;
     property ID           : integer read getID;
     property TELEFONOS    : integer read getTELEFONOS;
     property CLAVE        : string read getCLAVE write setCLAVE;
     property NOMBRE       : string read getNOMBRE;
     property NOMBRE__     : string read getNOMBRE__;
     property CCOMERCIAL   : variant read getCCOMERCIAL;
     property MONEDA       : variant read getMONEDA;
     property DESC_PORC    : double read getDESC_PORC;
     property TELEFONO     : string read getTELEFONO;
     property VENDEDOR     : integer read getVendedor;
     property VENDEDOR_N   : string read getVendedorN;

     property FACTURACION  : TCliente read getDatos;
     property ACEPTAR      : boolean read getAceptar write setAceptar;
  end;

var
  frmSeleccionarCliente_: TfrmSeleccionarCliente_;

implementation

{$R *.DFM}

procedure TfrmSeleccionarCliente_.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction   := valor;
   qyCiudad.Transaction     := valor;
   sqlSelec.Transaction     := valor;
   qyVendedor.Transaction   := valor;
   qyCDomicilio.Transaction := valor;

   sqlSelec.AddStrings(qyBusqueda.SQL);
end;

procedure TfrmSeleccionarCliente_.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database   := valor;
   qyCiudad.Database     := valor;
   sqlSelec.DataBase     := valor;
   qyVendedor.DataBase   := valor;
   qyCDomicilio.DataBase := valor;
end;

function TfrmSeleccionarCliente_.abrir : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   if edDato.Text <> '' then
   begin
      edDato.Text := UpperCase(edDato.Text);
      buEjecutar.Click;

      if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
         tmp := false
   end;

   Result := tmp;
end;

function TfrmSeleccionarCliente_.abrirConsulta : boolean;
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
     end
     else
        if (qyBusqueda.IsEmpty) then
        begin
           buBusqueda.Caption := 'S.NOMBRE';
           buEjecutar.Click;
           if not(qyBusqueda.IsEmpty) and (dgExplorar.DataSource.DataSet.RecordCount = 1) then
           begin
              tmp := false;
           end;
        end;
   end;
   Result := tmp;
end;

procedure TfrmSeleccionarCliente_.setAceptar(valor : boolean);
begin
   awrAceptar := valor;
   if awrAceptar then
      Close;
end;

function TfrmSeleccionarCliente_.getAceptar : boolean;
begin
   Result := awrAceptar;
end;


function TfrmSeleccionarCliente_.getVendedor : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_VENDEDOR').AsInteger;
end;

function TfrmSeleccionarCliente_.getVendedorN : string;
begin
   qyVendedor.Close;
   qyVendedor.ParamByName('P_ID').AsInteger := dsBusqueda.DataSet.FieldByName('C_VENDEDOR').AsInteger;
   qyVendedor.Open;

   Result := qyVendedor.FieldByName('NOMBRE').AsString;
end;

function TfrmSeleccionarCliente_.getDatos : TCliente;
begin
   awrDatos.nombre     := '';
   awrDatos.rfc        := '';
   awrDatos.direccion  := '';
   awrDatos.colonia    := '';
   awrDatos.cp         := '';
   awrDatos.ciudad     := '';
   awrDatos.ccomercial := null;
   awrDatos.moneda     := null;
   awrDatos.telefono   := '';
   awrDatos.desc_porc  := 0;

   awrDatos.nombre     := NOMBRE;
   awrDatos.rfc        := dsBusqueda.DataSet.FieldByName('C_RFC').AsString;
   awrDatos.ccomercial := dsBusqueda.DataSet.FieldByName('C_FORMA_DE_PAGO').AsInteger;
   awrDatos.moneda     := dsBusqueda.DataSet.FieldByName('C_MONEDA').AsInteger;
   awrDatos.telefono   := TELEFONO;
   awrDatos.desc_porc  := dsBusqueda.DataSet.FieldByName('C_DESC_PORC').AsFloat;

   qyCDomicilio.Close;
   qyCDomicilio.ParamByName('P_ID').AsInteger := dsBusqueda.DataSet.FieldByName('C_DOMICILIO').AsInteger;
   qyCDomicilio.Open;

   awrDatos.direccion  := qyCDomicilio.FieldByName('CALLE').AsString;

   if qyCDomicilio.FieldByName('NUM_EXT').AsString <> '' then
      awrDatos.direccion  :=  awrDatos.direccion + ' ' + qyCDomicilio.FieldByName('NUM_EXT').AsString;
   if qyCDomicilio.FieldByName('LETRA').AsString <> '' then
      awrDatos.direccion  :=  awrDatos.direccion + '-' + qyCDomicilio.FieldByName('LETRA').AsString;
   if qyCDomicilio.FieldByName('NUM_INT').AsString <> '' then
      awrDatos.direccion  :=  awrDatos.direccion + 'INT. ' + qyCDomicilio.FieldByName('NUM_INT').AsString;
   awrDatos.colonia    := qyCDomicilio.FieldByName('COLONIA').AsString;
   awrDatos.cp         := qyCDomicilio.FieldByName('CP').AsString;

   qyCiudad.Close;
   qyCiudad.ParamByName('P_CIUDAD').AsInteger := qyCDomicilio.FieldByName('CIUDAD').AsInteger;
   qyCiudad.Open;

   awrDatos.ciudad := qyCiudad.FieldByName('R_CIUDAD').AsString+', '+qyCiudad.FieldByName('R_ESTADO').AsString+', '+qyCiudad.FieldByName('R_PAIS').AsString+'.';

   Result := awrDatos;
end;

function TfrmSeleccionarCliente_.getNOMBRE__ : string;
begin
   result := dsBusqueda.DataSet.FieldByName('C_NOMBRE').AsString;
end;

function TfrmSeleccionarCliente_.getNOMBRE : string;
var
   tmp : string;
begin
   tmp := dsBusqueda.DataSet.FieldByName('C_NOMBRE').AsString;
   if dsBusqueda.DataSet.FieldByName('C_FACTURAR_A').AsString = 'Razon Social' then
      tmp := dsBusqueda.DataSet.FieldByName('C_RAZON_SOCIAL').AsString;

   result := tmp;
end;

function TfrmSeleccionarCliente_.getTELEFONO : string;
begin
   result := dsBusqueda.DataSet.FieldByName('C_TELEFONO').AsString;
end;

function TfrmSeleccionarCliente_.getCCOMERCIAL : variant;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_FORMA_DE_PAGO').AsInteger;
end;

function TfrmSeleccionarCliente_.getMONEDA : variant;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_MONEDA').AsInteger;
end;

function TfrmSeleccionarCliente_.getDESC_PORC : double;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_DESC_PORC').AsFloat;
end;

function TfrmSeleccionarCliente_.getTELEFONOS : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_TELEFONOS').AsInteger;
end;

function TfrmSeleccionarCliente_.getID : integer;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_ID').AsInteger;
end;

procedure TfrmSeleccionarCliente_.setCLAVE(valor : string);
begin
   edDato.Text := UpperCase(valor);
end;

function TfrmSeleccionarCliente_.getCLAVE : string;
begin
   Result := dsBusqueda.DataSet.FieldByName('C_CLAVE').AsString;
end;

procedure TfrmSeleccionarCliente_.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarCliente_.buBusquedaClick(Sender: TObject);
begin
   buEjecutar.Click;
end;

procedure TfrmSeleccionarCliente_.buEjecutarClick(Sender: TObject);
var
  vLogica    : string;
  vCampo     : string;
//  vFecha     : TDatetime;
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
{      vSentencia := 'BETWEEN';
      vCampo     := 'F_FECHA('+vCampo+')';
      vParam     := ':P_INI AND :P_FIN';

      j      := sqlSelec.AddParamIndex('P_INI');
      vFecha :=  edDel.Date;
      sqlSelec.setParam(j, vFecha, psFecha);

      j      := sqlSelec.AddParamIndex('P_FIN');
      vFecha := edAl.Date;
      sqlSelec.setParam(j, vFecha, psFecha);}
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

{   edDato.Text := UpperCase(edDato.Text);
   awrSQL      := 'WHERE UPPER('+buBusqueda.Caption+') LIKE "%'+edDato.Text+'%"';
   ejecutar(true);}
end;

procedure TfrmSeleccionarCliente_.buTodosClick(Sender: TObject);
begin
   sqlSelec.LoadOriginal;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlSelec.strSql);
   qyBusqueda.Open;

   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCliente_.dgExplorarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      ACEPTAR := true;
end;

procedure TfrmSeleccionarCliente_.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSeleccionarCliente_.buInicioClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarCliente_.buAnteriorClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmSeleccionarCliente_.buSiguienteClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmSeleccionarCliente_.buFinClick(Sender: TObject);
begin
   dgExplorar.DataSource.DataSet.Last;
end;

procedure TfrmSeleccionarCliente_.FormCreate(Sender: TObject);
begin
   ACEPTAR := false;
   //dgExplorar.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarCliente.ini';
   //dgExplorar.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarCliente.ini');

   sqlSelec := TSqlAnaliza.Create;
end;

procedure TfrmSeleccionarCliente_.SCID1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'SC.ID';
end;

procedure TfrmSeleccionarCliente_.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.CLAVE';
end;

procedure TfrmSeleccionarCliente_.itemNOMBREClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
end;

procedure TfrmSeleccionarCliente_.itemRAZONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.RAZON_SOCIAL';
end;

procedure TfrmSeleccionarCliente_.itemVENDEDORClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S2.NOMBRE';
end;

procedure TfrmSeleccionarCliente_.dgExplorarDblClick(Sender: TObject);
begin
   if not(qyBusqueda.IsEmpty) then
      ACEPTAR := true
end;

procedure TfrmSeleccionarCliente_.FormDestroy(Sender: TObject);
begin
   sqlSelec.Free;
end;

end.
