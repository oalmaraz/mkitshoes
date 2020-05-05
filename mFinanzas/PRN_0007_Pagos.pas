unit PRN_0007_Pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery, Grids, DBGrids,  IBX.IBTable,
     DBCtrls,   StdCtrls,
     Buttons, ComCtrls;

type
  TfrmPRN_0007 = class(TfrmPadre)
    qyCXCPagos: TIBQuery;
    qyCXCPagosDet: TIBQuery;
    dsCXCPagos: TDataSource;
    dsCXCPagosDet: TDataSource;
    TCajas: TIBTable;
    TCajasID: TIntegerField;
    TCajasNOMBRE: TIBStringField;
    TCajasALMACEN: TIntegerField;
    TCajasUSUARIO: TIntegerField;
    TCajasTIPO_DE_CAJA: TIBStringField;
    TCajasESTATUS: TIBStringField;
    TCajasMODULO_FUNCION: TIntegerField;
    dsCajas: TDataSource;
    qyAlmacenes: TIBQuery;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    Label3: TLabel;
    deFecha: TDateTimePicker;
    cbCajas: TDBLookupComboBox;
    Label2: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    Label4: TLabel;
    cePago: TEdit;
    Label1: TLabel;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    qyBusqueda: TIBQuery;
    dsBusquedaVenta: TDataSource;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_FOLIO_PAGO: TIntegerField;
    qyBusquedaR_CAJA: TIntegerField;
    qyBusquedaR_CAJA_NOMBRE: TIBStringField;
    qyBusquedaR_ALMACEN: TIntegerField;
    qyBusquedaR_ALMACEN_NOMBRE: TIBStringField;
    qyBusquedaR_TOTAL: TFloatField;
    qyBusquedaR_ESTATUS: TIBStringField;
    qyBusquedaR_FECHA: TDateTimeField;
    qyBusquedaR_FECHA_ALTA: TDateTimeField;
    qyBusquedaR_MONEDA: TIntegerField;
    qyBusquedaR_MONEDA_CLAVE: TIBStringField;
    qyBusquedaR_MONEDA_DESCRIPCION: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    awrId        : integer;
    ruta         : string;
    reporte      : string;
    strImpresora : string;
    modo         : string;
    procedure loadImpresora;
    procedure loadImpresora2;
    procedure setCaja(valor : integer);
    procedure setAlmacen(valor : integer);
    procedure setActivar(valor : boolean);
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_id : integer; total : double);
//    constructor CrearReImpresion(AOwner : TComponent; p_caja, p_almacen : integer; activar : boolean);
    procedure imprimir;
  published
    property CAJA    : integer write setCAJA;
    property ALMACEN : integer write setALMACEN;
    property ACTIVAR : boolean write setActivar;
  end;

var
  frmPRN_0007: TfrmPRN_0007;

implementation

uses IBModulo, inifiles, reglas_de_negocios, IBData, controladorImpresora;

{$R *.DFM}

constructor TfrmPRN_0007.Crear(AOwner : TComponent; p_id : integer; total : double);
begin
   Create(AOwner);

   awrID := p_id;

   qyCXCPagos.Close;
   qyCXCPagos.ParamByName('P_ID').AsInteger    := p_id;
   qyCXCPagos.Open;

   qyCXCPagosDet.Close;
   qyCXCPagosDet.ParamByName('P_ID').AsInteger := p_id;
   qyCXCPagosDet.Open;

   loadImpresora;
end;

procedure TfrmPRN_0007.setActivar(valor : boolean);
begin
   deFecha.Enabled      := valor;
   cbCajas.Enabled      := valor;
   cbAlmacenes.Enabled  := valor;
end;

procedure TfrmPRN_0007.setCaja(valor : integer);
begin
   reglas.abrir_IBTabla(TCajas);
   cbCajas.KeyValue := valor;
end;

procedure TfrmPRN_0007.setAlmacen(valor : integer);
begin
   reglas.abrir_IBQuery(qyAlmacenes);
   cbAlmacenes.KeyValue := valor;
end;

procedure TfrmPRN_0007.imprimir;
begin
end;

procedure TfrmPRN_0007.loadImpresora2;
var
   iniFile : TIniFile;
   strPrinterNom1 : string;
   strPrinterNom2 : string;
   strPrinterVal1 : string;
   strPrinterVal2 : string;
   SearchRec      : TSearchRec;
begin
   if reglas.activarElegirControladorImpresora('CUENTAS_POR_COBRAR') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boCXC;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Free;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraNom1','');
   strPrinterNom2 := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraNom2','');
   strPrinterVal1 := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraVal1','');
   strPrinterVal2 := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraVal2','');
   modo           := iniFile.ReadString('CUENTAS_POR_COBRAR','Modo','');

   if qyCXCPagos.FieldByName('R_PRIORIDAD').AsString  = 'Si' then
   begin
      //cargar archivo del directorio de reportes
      if FindFirst(ruta+'win_cxcPagosP.prt', faAnyFile, SearchRec) = 0 then
         reporte := 'win_cxcPagosP.prt';
      strImpresora := strPrinterNom2;
   end
   else
      strImpresora := strPrinterNom1;
   iniFile.Free;
end;

procedure TfrmPRN_0007.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strPrinterNom2 : string;
   strPrinterVal2 : string;
   SearchRec      : TSearchRec;
begin
   if reglas.activarElegirControladorImpresora('CUENTAS_POR_COBRAR') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boCXC;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Free;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1  := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraNom1','');
   strPrinterNom2  := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraNom2','');
   strPrinterVal1  := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraVal1','');
   strPrinterVal2  := iniFile.ReadString('CUENTAS_POR_COBRAR','ImpresoraVal2','');
   modo            := iniFile.ReadString('CUENTAS_POR_COBRAR','Modo','');

   if qyCXCPagos.FieldByName('R_PRIORIDAD').AsString  = 'Si' then
   begin
      //cargar archivo del directorio de reportes
      if FindFirst(ruta+'win_cxcPagosP.prt', faAnyFile, SearchRec) = 0 then
         reporte := 'win_cxcPagosP.prt';
      strImpresora := strPrinterNom2;
   end
   else
      strImpresora := strPrinterNom1;
   iniFile.Free;
end;

procedure TfrmPRN_0007.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
begin
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  inherited;
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  //cargar archivo del directorio de reportes
  if FindFirst(ruta+'win_cxcPagos.prt', faAnyFile, SearchRec) = 0 then
     reporte := 'win_cxcPagos.prt';
end;

procedure TfrmPRN_0007.ibImprimirClick(Sender: TObject);
begin
  inherited;
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate      := StrToDate(FormatDateTime('dd/mm/yyyy',deFecha.Date));
  qyBusqueda.ParamByName('P_FOLIO').AsInteger   := StrToInt(FormatFloat('########0',StrToFloat(cePago.Text)));
  qyBusqueda.ParamByName('P_CAJA').AsInteger    := cbCajas.KeyValue;
  qyBusqueda.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
  qyBusqueda.Open;
  if not(qyBusqueda.IsEmpty) then
  begin
     qyCXCPagos.Close;
     qyCXCPagos.ParamByName('P_ID').AsInteger    := qyBusqueda.FieldByName('R_ID').AsInteger;
     qyCXCPagos.Open;

     qyCXCPagosDet.Close;
     qyCXCPagosDet.ParamByName('P_ID').AsInteger := qyBusqueda.FieldByName('R_ID').AsInteger;
     qyCXCPagosDet.Open;

     loadImpresora2;
     imprimir;
  end
  else
  begin
    ShowMessage('Folio de Pago.  No se encuentra en la base de datos ');
  end;
end;

procedure TfrmPRN_0007.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; dejar asi.
end;

end.
