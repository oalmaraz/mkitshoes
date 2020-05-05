unit UTypeMovDeInvDet;

interface

uses
   UdmMovDeInvDet, UTipos, URecords, db, UfrmMInventarioLoad, grids, Dialogs;

Type
   TMovimientosDeInventarioDet = class(TObject)
   private
     dmMovimientosDeInventarioDet : TdmMovimientosDeInventarioDet;
     FDatos : _MovimientosDeInventarioDet;
     load   : TfrmMInventarioLoad;
     procedure SetID(value : integer);
     function GetID : integer;
     procedure SetMOVIMIENTOS_DE_INVENTARIO(value : integer);
     function GetMOVIMIENTOS_DE_INVENTARIO : integer;
     procedure SetMATERIAL(value : integer);
     function GetMATERIAL : integer;
     function GetMATERIAL_CLAVE : String20;
     function GetMATERIAL_DESCRIPCION : String100;
     procedure SetCANTIDAD(value : double);
     function GetCANTIDAD : double;
     procedure SetCOSTO(value : double);
     function GetCOSTO : double;
     procedure SetMONEDA(value : integer);
     function GetMONEDA : integer;
     procedure SetUNIDAD(value : integer);
     function GetUNIDAD : integer;
     procedure SetLOTE(value : String50);
     function GetLOTE : String50;
     procedure SetSERIE(value : String50);
     function GetSERIE : String50;
     procedure SetID_INVENTARIO(value : variant);
     function GetID_INVENTARIO : variant;
     procedure SetPROVEEDOR_CONSOLIDADO(value : variant);
     function GetPROVEEDOR_CONSOLIDADO : variant;
     procedure SetESTATUS(value : String20);
     function GetESTATUS : String20;
     procedure SetCAJAS(value : integer);
     function GetCAJAS : integer;
     procedure SetPEDIDO(value : variant);
     function GetPEDIDO : variant;
     procedure SetPEDIDO_DETALLE(value : variant);
     function GetPEDIDO_DETALLE : variant;
     procedure SetFACTURA(value : variant);
     function GetFACTURA : variant;
     procedure SetFACTURA_DETALLE(value : variant);
     function GetFACTURA_DETALLE : variant;
     procedure SetDEVOLUCIONES_CANTIDAD(value : double);
     function GetDEVOLUCIONES_CANTIDAD : double;
     procedure SetDEVOLUCIONES_CAJA(value : integer);
     function GetDEVOLUCIONES_CAJA : integer;
     procedure SetREFERENCIA(value : String50);
     function GetREFERENCIA : String50;
     function GetDataSourceMateriales : TDataSource;
     function GetDataSourceDetalle : TDataSource;
     function GetDataSourceUnidades : TDataSource;
     function GetDataSourceProveedores : TDataSource;
     function GetDataSourceClientes : TDataSource;
     function GetDataSourceMonedas : TDataSource;
     function GetMonedaBase : integer;
     function getGrid : TStringGrid;
     function getVACIO : boolean;
     function getEstaLoad : boolean;
   public
     constructor Create();overload;
     constructor Create(pId : integer);overload;
     destructor Destroy; override;
     function Guardar : integer;
     procedure Cargar(v_id: Integer);overload;
     procedure Cargar; overload;
     procedure CargarDatos(v_id : integer);
     procedure RefreshProveedores;
     procedure refreshClientes;
     procedure refreshMateriales;
     procedure refreshMonedas;
     procedure refreshUnidades;
     procedure eliminar;
     procedure SetCLIENTE(value : variant);
     function GetCLIENTE : variant;
     procedure SetMEDIDA(value : variant);
     function GetMEDIDA : variant;
     procedure SetCOLOR(value : variant);
     function GetCOLOR : variant;
     procedure mensajeError(valor : integer);
     procedure CargarArchivo;
   published
     property ID : integer read GetID write SetID;
     property MOVIMIENTOS_DE_INVENTARIO : integer read GetMOVIMIENTOS_DE_INVENTARIO write SetMOVIMIENTOS_DE_INVENTARIO;
     property MATERIAL : integer read GetMATERIAL write SetMATERIAL;
     property MATERIAL_CLAVE : String20 read GetMATERIAL_CLAVE;
     property MATERIAL_DESCRIPCION : String100 read GetMATERIAL_DESCRIPCION;
     property CANTIDAD : double read GetCANTIDAD write SetCANTIDAD;
     property COSTO : double read GetCOSTO write SetCOSTO;
     property MONEDA : integer read GetMONEDA write SetMONEDA;
     property UNIDAD : integer read GetUNIDAD write SetUNIDAD;
     property LOTE : String50 read GetLOTE write SetLOTE;
     property SERIE : String50 read GetSERIE write SetSERIE;
     property ID_INVENTARIO : variant read GetID_INVENTARIO write SetID_INVENTARIO;
     property PROVEEDOR_CONSOLIDADO : variant read GetPROVEEDOR_CONSOLIDADO write SetPROVEEDOR_CONSOLIDADO;
     property ESTATUS : String20 read GetESTATUS write SetESTATUS;
     property CAJAS : integer read GetCAJAS write SetCAJAS;
     property PEDIDO : variant read GetPEDIDO write SetPEDIDO;
     property PEDIDO_DETALLE : variant read GetPEDIDO_DETALLE write SetPEDIDO_DETALLE;
     property FACTURA : variant read GetFACTURA write SetFACTURA;
     property FACTURA_DETALLE : variant read GetFACTURA_DETALLE write SetFACTURA_DETALLE;
     property DEVOLUCIONES_CANTIDAD : double read GetDEVOLUCIONES_CANTIDAD write SetDEVOLUCIONES_CANTIDAD;
     property DEVOLUCIONES_CAJA : integer read GetDEVOLUCIONES_CAJA write SetDEVOLUCIONES_CAJA;
     property REFERENCIA : String50 read GetREFERENCIA write SetREFERENCIA;
     property DSMATERIALES : TDataSource read GetDataSourceMateriales;
     property DSDETALLE : TDataSource read GetDataSourceDetalle;
     property DSUNIDADES  : TDataSource read GetDataSourceUnidades;
     property DSPROVEEDORES  : TDataSource read GetDataSourceProveedores;
     property DSCLIENTES : TDataSource read GetDataSourceClientes;
     property DSMONEDAS  : TDataSource read GetDataSourceMonedas;
     property MONEDAB : integer read GetMonedaBase;
     property CLIENTE : variant read GetCLIENTE write SetCLIENTE;
     property MEDIDA : variant read GetMEDIDA write SetMEDIDA;
     property COLOR : variant read GetCOLOR write SetCOLOR;
     property GRID : TStringGrid read getGrid;
     property VACIO : boolean read getVACIO;
     property EstaLoad : boolean read getEstaLoad;
   end;

implementation



constructor TMovimientosDeInventarioDet.Create();
begin
   inherited Create;
   dmMovimientosdeInventarioDet := TdmMovimientosdeInventarioDet.Create(nil);
   load := TfrmMInventarioLoad.Create(nil);
end;

constructor TMovimientosDeInventarioDet.Create(pId : integer);
begin
   Inherited Create();
   Cargar(pId);
end;

destructor TMovimientosDeInventarioDet.Destroy;
begin
   load.Free;
   load := nil;
   dmMovimientosdeInventarioDet.Free;
   dmMovimientosdeInventarioDet := nil;
   inherited destroy;
end;

function TMovimientosDeInventarioDet.getEstaLoad : boolean;
begin
   Result := load.EstaActiva;
end;

function TMovimientosDeInventarioDet.getVACIO : boolean;
begin
   Result := dmMovimientosdeInventarioDet.dsMovimientosDeInventarioDet.DataSet.IsEmpty;
end;

function TMovimientosDeInventarioDet.getGrid : TStringGrid;
begin
   Result := Load.sgDatos;
end;

procedure TMovimientosDeInventarioDet.CargarArchivo;
begin
   load.acomodarPantalla;
   load.Show;
end;

procedure TMovimientosDeInventarioDet.mensajeError(valor : integer);
begin
   ShowMessage('Movimiento de Inventario Detalle');
   //mensaje.Mensaje2 := dmMovimientosDeInventarioDet.filtraMensaje(valor);
end;

procedure TMovimientosDeInventarioDet.Cargar;
begin
   dmMovimientosDeInventarioDet.Cargar(FDatos);
end;

procedure TMovimientosDeInventarioDet.refreshClientes;
begin
   dmMovimientosDeInventarioDet.RefreshClientes;
end;

function TMovimientosDeInventarioDet.GetDataSourceClientes : TDataSource;
begin
   dmMovimientosDeInventarioDet.RefreshClientes;
   Result := dmMovimientosDeInventarioDet.dsClientes;
end;

procedure TMovimientosDeInventarioDet.SetMEDIDA(value : variant);
begin
   FDatos.MEDIDA := value;
end;

function TMovimientosDeInventarioDet.GetMEDIDA : variant;
begin
   Result := FDatos.MEDIDA;
end;

procedure TMovimientosDeInventarioDet.SetCOLOR(value : variant);
begin
   FDatos.COLOR := value;
end;

function TMovimientosDeInventarioDet.GetCOLOR : variant;
begin
   Result := FDatos.COLOR;
end;

function TMovimientosDeInventarioDet.GetMATERIAL_CLAVE : String20;
begin
   Result := FDatos.MATERIAL_CLAVE;
end;

function TMovimientosDeInventarioDet.GetMATERIAL_DESCRIPCION : String100;
begin
   Result := FDatos.MATERIAL_DESCRIPCION;
end;

procedure TMovimientosDeInventarioDet.SetCLIENTE(value : variant);
begin
   FDatos.CLIENTE := value;
end;

function TMovimientosDeInventarioDet.GetCLIENTE : variant;
begin
   Result := FDatos.CLIENTE;
end;

procedure TMovimientosDeInventarioDet.eliminar;
begin
   dmMovimientosdeInventarioDet.eliminarDatos;
end;

procedure TMovimientosDeInventarioDet.refreshUnidades;
begin
   dmMovimientosDeInventarioDet.refreshUnidades;
end;

procedure TMovimientosDeInventarioDet.refreshMateriales;
begin
   dmMovimientosdeInventarioDet.refreshMateriales;
end;

procedure TMovimientosDeInventarioDet.refreshMonedas;
begin
   dmMovimientosdeInventarioDet.refreshMonedas;
end;

procedure TMovimientosDeInventarioDet.RefreshProveedores;
begin
   dmMovimientosDeInventarioDet.RefreshProveedores;
end;

procedure TMovimientosDeInventarioDet.CargarDatos(v_id : integer);
begin
   dmMovimientosDeInventarioDet.CargarDatos(v_id);
end;

function TMovimientosDeInventarioDet.GetMonedaBase : integer;
begin
   Result := dmMovimientosDeInventarioDet.GetMonedaBase;
end;

function TMovimientosDeInventarioDet.GetDataSourceMateriales : TDataSource;
begin
   dmMovimientosDeInventarioDet.activarMateriales;
   Result := dmMovimientosdeInventarioDet.dsMateriales;
end;

function TMovimientosDeInventarioDet.GetDataSourceUnidades : TDataSource;
begin
   dmMovimientosDeInventarioDet.activarUnidades;
   Result := dmMovimientosDeInventarioDet.dsUnidades;
end;

function TMovimientosDeInventarioDet.GetDataSourceProveedores : TDataSource;
begin
   dmMovimientosDeInventarioDet.activarProveedores;
   Result := dmMovimientosDeInventarioDet.dsProveedores;
end;

function TMovimientosDeInventarioDet.GetDataSourceMonedas : TDataSource;
begin
   dmMovimientosDeInventarioDet.activarMonedas;
   Result := dmMovimientosDeInventarioDet.dsMonedas;
end;

function TMovimientosDeInventarioDet.GetDataSourceDetalle : TDataSource;
begin
   Result := dmMovimientosdeInventarioDet.dsMovimientosDeInventarioDet;
end;

function TMovimientosDeInventarioDet.Guardar : integer;
begin
   Result := dmMovimientosDeInventarioDet.Guardar(FDatos);
end;

procedure TMovimientosDeInventarioDet.Cargar(v_id: Integer);
begin
   dmMovimientosDeInventarioDet.Cargar(v_id);
end;

procedure TMovimientosDeInventarioDet.SetID(value : integer);
begin
   FDatos.ID := value;
end;

function TMovimientosDeInventarioDet.GetID : integer;
begin
   Result := FDatos.ID;
end;

procedure TMovimientosDeInventarioDet.SetMOVIMIENTOS_DE_INVENTARIO(value : integer);
begin
   FDatos.MOVIMIENTOS_DE_INVENTARIO := value;
end;

function TMovimientosDeInventarioDet.GetMOVIMIENTOS_DE_INVENTARIO : integer;
begin
   Result := FDatos.MOVIMIENTOS_DE_INVENTARIO;
end;

procedure TMovimientosDeInventarioDet.SetMATERIAL(value : integer);
begin
   FDatos.MATERIAL := value;
end;

function TMovimientosDeInventarioDet.GetMATERIAL : integer;
begin
   Result := FDatos.MATERIAL;
end;

procedure TMovimientosDeInventarioDet.SetCANTIDAD(value : double);
begin
   FDatos.CANTIDAD := value;
end;

function TMovimientosDeInventarioDet.GetCANTIDAD : double;
begin
   Result := FDatos.CANTIDAD;
end;

procedure TMovimientosDeInventarioDet.SetCOSTO(value : double);
begin
   FDatos.COSTO := value;
end;

function TMovimientosDeInventarioDet.GetCOSTO : double;
begin
   Result := FDatos.COSTO;
end;

procedure TMovimientosDeInventarioDet.SetMONEDA(value : integer);
begin
   FDatos.MONEDA := value;
end;

function TMovimientosDeInventarioDet.GetMONEDA : integer;
begin
   Result := FDatos.MONEDA;
end;

procedure TMovimientosDeInventarioDet.SetUNIDAD(value : integer);
begin
   FDatos.UNIDAD := value;
end;

function TMovimientosDeInventarioDet.GetUNIDAD : integer;
begin
   Result := FDatos.UNIDAD;
end;

procedure TMovimientosDeInventarioDet.SetLOTE(value : String50);
begin
   FDatos.LOTE := value;
end;

function TMovimientosDeInventarioDet.GetLOTE : String50;
begin
   Result := FDatos.LOTE;
end;

procedure TMovimientosDeInventarioDet.SetSERIE(value : String50);
begin
   FDatos.SERIE := value;
end;

function TMovimientosDeInventarioDet.GetSERIE : String50;
begin
   Result := FDatos.SERIE;
end;

procedure TMovimientosDeInventarioDet.SetID_INVENTARIO(value : variant);
begin
   FDatos.ID_INVENTARIO := value;
end;

function TMovimientosDeInventarioDet.GetID_INVENTARIO : variant;
begin
   Result := FDatos.ID_INVENTARIO;
end;

procedure TMovimientosDeInventarioDet.SetPROVEEDOR_CONSOLIDADO(value : variant);
begin
   FDatos.PROVEEDOR_CONSOLIDADO := value;
end;

function TMovimientosDeInventarioDet.GetPROVEEDOR_CONSOLIDADO : variant;
begin
   Result := FDatos.PROVEEDOR_CONSOLIDADO;
end;

procedure TMovimientosDeInventarioDet.SetESTATUS(value : String20);
begin
   FDatos.ESTATUS := value;
end;

function TMovimientosDeInventarioDet.GetESTATUS : String20;
begin
   Result := FDatos.ESTATUS;
end;

procedure TMovimientosDeInventarioDet.SetCAJAS(value : integer);
begin
   FDatos.CAJAS := value;
end;

function TMovimientosDeInventarioDet.GetCAJAS : integer;
begin
   Result := FDatos.CAJAS;
end;

procedure TMovimientosDeInventarioDet.SetPEDIDO(value : variant);
begin
   FDatos.PEDIDO := value;
end;

function TMovimientosDeInventarioDet.GetPEDIDO : variant;
begin
   Result := FDatos.PEDIDO;
end;

procedure TMovimientosDeInventarioDet.SetPEDIDO_DETALLE(value : variant);
begin
   FDatos.PEDIDO_DETALLE := value;
end;

function TMovimientosDeInventarioDet.GetPEDIDO_DETALLE : variant;
begin
   Result := FDatos.PEDIDO_DETALLE;
end;

procedure TMovimientosDeInventarioDet.SetFACTURA(value : variant);
begin
   FDatos.FACTURA := value;
end;

function TMovimientosDeInventarioDet.GetFACTURA : variant;
begin
   Result := FDatos.FACTURA;
end;

procedure TMovimientosDeInventarioDet.SetFACTURA_DETALLE(value : variant);
begin
   FDatos.FACTURA_DETALLE := value;
end;

function TMovimientosDeInventarioDet.GetFACTURA_DETALLE : variant;
begin
   Result := FDatos.FACTURA_DETALLE;
end;

procedure TMovimientosDeInventarioDet.SetDEVOLUCIONES_CANTIDAD(value : double);
begin
   FDatos.DEVOLUCIONES_CANTIDAD := value;
end;

function TMovimientosDeInventarioDet.GetDEVOLUCIONES_CANTIDAD : double;
begin
   Result := FDatos.DEVOLUCIONES_CANTIDAD;
end;

procedure TMovimientosDeInventarioDet.SetDEVOLUCIONES_CAJA(value : integer);
begin
   FDatos.DEVOLUCIONES_CAJA := value;
end;

function TMovimientosDeInventarioDet.GetDEVOLUCIONES_CAJA : integer;
begin
   Result := FDatos.DEVOLUCIONES_CAJA;
end;

procedure TMovimientosDeInventarioDet.SetREFERENCIA(value : String50);
begin
   FDatos.REFERENCIA := value;
end;

function TMovimientosDeInventarioDet.GetREFERENCIA : String50;
begin
   Result := FDatos.REFERENCIA;
end;

end.
