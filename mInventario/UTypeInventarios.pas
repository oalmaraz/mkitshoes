unit UTypeInventarios;

interface

uses
   UTipos, URecords, UdmInventarios, USQLAnaliza, db;

type
   TInventarios = class(TObject)
   private
     dmInventarios : TdmInventarios;
     FDatos        : _Inventarios;
     procedure SetLINEA(valor : variant);
     procedure SetALMACEN(valor : variant);
     procedure SetMATERIAL(valor : variant);
     procedure SetMEDIDA(valor : variant);
     procedure SetCLAVE(valor : String20);
     procedure SetDESCRIPCION(valor : String100);
     procedure SetMONEDA(valor : variant);
     procedure SetLOTE(valor : String50);
     procedure SetSERIE(valor : String50);
     procedure SetACTIVOFIJO(valor : String2);
     procedure setCOLOR(valor: variant);
     function getCOLOR : variant;
     function GetLINEA : variant;
     function GetALMACEN : variant;
     function GetMATERIAL : variant;
     function GetMEDIDA : variant;
     function GetCLAVE : String20;
     function GetDESCRIPCION : String100;
     function GetMONEDA : variant;overload;
     function GetLOTE : String50;
     function GetSERIE : String50;
     function GetACTIVOFIJO : String2;
     function GetDataSourceAlmacenes : TDataSource;
     function GetDataSourceMonedas : TDataSource;
     function getDataSourceInventario : TDataSource;
     function getDataSetStateInventario : TDataSetState;
     function dameMoneda : integer;
     function dameActivarMedidas : boolean;
     function dameActivarColores : boolean;
     function dameInterno : TSqlAnaliza;
   public
     constructor Create();
     destructor Destroy; override;
     procedure refreshAlmacenes;
     procedure refreshMonedas;
     procedure ejecutar;
   published
     property LINEA : variant read GetLINEA write SetLINEA;
     property ALMACEN : variant read GetALMACEN write SetALMACEN;
     property MATERIAL : variant read GetMATERIAL write SetMATERIAL;
     property MEDIDA : variant read GetMEDIDA write SetMEDIDA;
     property CLAVE : String20 read GetCLAVE write SetCLAVE;
     property DESCRIPCION : String100 read GetDESCRIPCION write SetDESCRIPCION;
     property MONEDA : variant read GetMONEDA write SetMONEDA;
     property LOTE : String50 read GetLOTE write SetLOTE;
     property SERIE : String50 read GetSERIE write SetSERIE;
     property ACTIVOFIJO  : String2 read GetACTIVOFIJO write SetACTIVOFIJO;
     property COLOR : variant read getCOLOR write setCOLOR;
     property DSALMACENES : TDataSource read GetDataSourceAlmacenes;
     property DSMONEDAS : TDataSource read GetDataSourceMonedas;
     property DSINVENTARIO : TDataSource read GetDataSourceInventario;
     property MBASE : integer read dameMoneda;
     property AMEDIDAS : boolean read dameActivarMedidas;
     property ACOLORES : boolean read dameActivarColores;
     property STATEINVENTARIO : TDataSetState read getDataSetStateInventario;
     property interno : TSqlAnaliza read dameInterno;
   end;

implementation

constructor TInventarios.Create();
begin
  inherited Create;
  dmInventarios := TdmInventarios.Create(nil);
  FDatos.ALMACEN     := 0;
  FDatos.MATERIAL    := 0;
  FDatos.CLAVE       := '';
  FDatos.DESCRIPCION := '';
  FDatos.MEDIDA      := 0;
  FDatos.COLOR       := 0;
  FDatos.MONEDA      := 0;
  FDatos.LOTE        := '';
  FDatos.SERIE       := '';
  FDatos.ACTIVOFIJO  := '';
  FDatos.LINEA       := 0;
end;

destructor TInventarios.Destroy;
begin
  dmInventarios.Free;
  dmInventarios := nil;
  inherited destroy;
end;

function TInventarios.dameInterno : TSqlAnaliza;
begin
   Result := dmInventarios.interno;
end;

function TInventarios.getDataSourceInventario : TDataSource;
begin
   Result := dmInventarios.dsInventario;
end;

procedure TInventarios.setCOLOR(valor: variant);
begin
   FDatos.COLOR := valor;
end;

function TInventarios.getCOLOR : variant;
begin
   Result := FDatos.COLOR;
end;

function TInventarios.getDataSetStateInventario : TDataSetState;
begin
   Result := dmInventarios.dsInventario.State;
end;

procedure TInventarios.ejecutar;
begin
   dmInventarios.ejecutar(FDatos);
end;

function TInventarios.GetDataSourceMonedas : TDataSource;
begin
   Result := dmInventarios.dsMonedas;
end;

procedure TInventarios.refreshMonedas;
begin
   dmInventarios.refreshMonedas;
end;

procedure TInventarios.refreshAlmacenes;
begin
   dmInventarios.refreshAlmacenes;
end;

function TInventarios.dameMoneda : integer;
begin
   Result := dmInventarios.getMoneda;
end;

function TInventarios.dameActivarColores : boolean;
begin
   Result := dmInventarios.getActivarColores;
end;

function TInventarios.dameActivarMedidas : boolean;
begin
   Result := dmInventarios.getActivarMedidas;
end;

function TInventarios.GetDataSourceAlmacenes : TDataSource;
begin
   Result := dmInventarios.dsAlmacenes;
end;

procedure TInventarios.SetLINEA(valor : variant);
begin
   FDatos.LINEA := valor;
end;

procedure TInventarios.SetALMACEN(valor : variant);
begin
   FDatos.ALMACEN := valor;
end;

procedure TInventarios.SetMATERIAL(valor : variant);
begin
   FDatos.MATERIAL := valor;
end;

procedure TInventarios.SetMEDIDA(valor : variant);
begin
   FDatos.MEDIDA := valor;
end;

procedure TInventarios.SetCLAVE(valor : String20);
begin
   FDatos.CLAVE := valor;
end;

procedure TInventarios.SetDESCRIPCION(valor : String100);
begin
   FDatos.DESCRIPCION := valor;
end;

procedure TInventarios.SetMONEDA(valor : variant);
begin
   FDatos.MONEDA := valor;
end;

procedure TInventarios.SetLOTE(valor : String50);
begin
   FDatos.LOTE := valor;
end;

procedure TInventarios.SetSERIE(valor : String50);
begin
   FDatos.SERIE := valor;
end;

procedure TInventarios.SetACTIVOFIJO(valor : String2);
begin
   FDatos.ACTIVOFIJO := valor;
end;

function TInventarios.GetLINEA : variant;
begin
   Result := FDatos.LINEA;
end;

function TInventarios.GetALMACEN : variant;
begin
   Result := FDatos.ALMACEN;
end;

function TInventarios.GetMATERIAL : variant;
begin
   Result := FDatos.MATERIAL;
end;

function TInventarios.GetMEDIDA : variant;
begin
   Result := FDatos.MEDIDA;
end;

function TInventarios.GetCLAVE : String20;
begin
   Result := FDatos.CLAVE;
end;

function TInventarios.GetDESCRIPCION : String100;
begin
   Result := FDatos.DESCRIPCION;
end;

function TInventarios.GetMONEDA : variant;
begin
   Result := FDatos.MONEDA;
end;

function TInventarios.GetLOTE : String50;
begin
   Result := FDatos.LOTE;
end;

function TInventarios.GetSERIE : String50;
begin
   Result := FDatos.SERIE;
end;

function TInventarios.GetACTIVOFIJO : String2;
begin
   Result := FDatos.ACTIVOFIJO;
end;

end.
