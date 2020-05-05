unit UTypeMovimientosDeInventario;

interface

uses
   UTipos, Dialogs, UdmMovimientosDeInventario, URecords, db, SysUtils, classes;

type
   TMovimientosDeInventario = class(TObject)
   private
     dmMovimientosDeInventario : TdmMovimientosDeInventario;
     FDatos                    : _MovimientosDeInventario;
     procedure SetID(value : integer);
     procedure SetFECHA_HORA(value : TDatetime);
     procedure SetCLAVE(value : String20);
     function GetCLAVE : String20;
     procedure SetTIPO(value : String20);
     procedure SetSUB_TIPO(value : variant);
     procedure SetREFERENCIA(value : String50);
     procedure SetIDREFERENCIA(value : variant);
     procedure SetALMACEN_ORIGEN(value : integer);//not null
     procedure SetALMACEN_DESTINO(value : variant);
     procedure SetOBSERVACIONES(value : String100);
     procedure SetESTATUS(value : String20);
     procedure SetFOLIO_ORIGEN(value : integer);
     procedure SetFOLIO_DESTINO(value : integer);
     procedure setLINEA(valor : variant);
     procedure setLINEA_DESCRIPCION(valor : String100);

     function getLINEA : variant;
     function getLINEA_DESCRIPCION : String100;
     function getFOLIO_ORIGEN : integer;
     function getFOLIO_DESTINO : integer;
     function GetID : integer;
     function GetFECHA_HORA : TDatetime;
     function GetTIPO : String20;
     function GetSUB_TIPO : variant;
     function GetREFERENCIA : String50;
     function GetIDREFERENCIA : variant;
     function GetALMACEN_ORIGEN : integer;//not null
     function GetALMACEN_DESTINO : variant;
     function GetOBSERVACIONES : String100;
     function GetESTATUS : String20;
     function GetDataSourceAlmacenes : TDataSource;
     function GetDataSourceEstatus : TDataSource;
     function GetDataSourceSubTipo : TDataSource;
     function GetFechaServidor : TDatetime;
     procedure SetUsuario(valor : integer);
     function GetUsuario : integer;
     function GetVacio : Boolean;
   public
     constructor Create();overload;
     constructor Create(pId : integer);overload;
     destructor Destroy; override;
     function Guardar : integer;
     procedure Cargar(v_id: Integer);
     procedure SubTipo;
     procedure cargarEstatusEjecucion;
     function ejecucionEstatus(id : integer) : boolean;
     procedure refreshAlmacenes;
     procedure refreshSubTipo(valor : string);overload;
     procedure refreshSubTipo;overload;
     procedure eliminar;
     procedure activarEstatus;
     procedure EjecutarReagrupar;
     procedure EjecutarAjusteConteo;
   published
     property ID: Integer read GetID write SetID;
     property FECHA_HORA: TDatetime read GetFECHA_HORA write SetFECHA_HORA;
     property CLAVE : String20 read GetCLAVE write setCLAVE;
     property TIPO: String20 read GetTIPO write SetTIPO;
     property SUB_TIPO : variant read GetSUB_TIPO write SetSUB_TIPO;
     property REFERENCIA : String50 read GetREFERENCIA write SetREFERENCIA;
     property IDREFERENCIA : variant read GetIDREFERENCIA write SetIDREFERENCIA;
     property ALMACEN_ORIGEN : integer read GetALMACEN_ORIGEN write SetALMACEN_ORIGEN;
     property ALMACEN_DESTINO : variant read GetALMACEN_DESTINO write SetALMACEN_DESTINO;
     property OBSERVACIONES : String100 read GetOBSERVACIONES write SetOBSERVACIONES;
     property ESTATUS : String20 read GetESTATUS write SetESTATUS;
     property DSALMACENES : TDataSource read GetDataSourceAlmacenes;
     property DSESTATUS : TDataSource read GetDataSourceEstatus;
     property DSSUBTIPO : TDataSource read GetDataSourceSubTipo;
     property FECHA_SERVIDOR : TDatetime read GetFechaServidor;
     property USUARIO : integer read GetUsuario write SetUsuario;
     property FOLIO_ORIGEN : integer read getFOLIO_ORIGEN write setFOLIO_ORIGEN;
     property FOLIO_DESTINO : integer read getFOLIO_DESTINO write setFOLIO_DESTINO;
     property VACIO : boolean read getVACIO;
     property LINEA : variant read getLINEA write setLINEA;
     property LINEA_DESCRIPCION : String100 read getLINEA_DESCRIPCION write setLINEA_DESCRIPCION;
   end;

implementation

procedure TMovimientosDeInventario.EjecutarAjusteConteo;
begin
   dmMovimientosdeInventario.EjecutarAjusteConteo;
end;

constructor TMovimientosDeInventario.Create();
begin
  inherited Create;
  FDatos.ID              := -1;
  FDatos.FECHA_HORA      := now;
  FDatos.CLAVE           := '';
  FDatos.TIPO            := '';
  FDatos.SUB_TIPO        := -1;
  FDatos.REFERENCIA      := '';
  FDatos.IDREFERENCIA    := -1;
  FDatos.ALMACEN_ORIGEN  := -1;
  FDatos.ALMACEN_DESTINO := -1;
  FDatos.OBSERVACIONES   := '';
  FDatos.ESTATUS         := '';
  FDatos.FOLIO_ORIGEN    := -1;
  FDatos.FOLIO_DESTINO   := -1;
  FDatos.LINEA           := -1;

  dmMovimientosdeInventario := TdmMovimientosdeInventario.Create(nil);
end;

function TMovimientosDeInventario.getLINEA_DESCRIPCION : String100;
begin
   Result := FDatos.LINEA_DESCRIPCION;
end;

procedure TMovimientosDeInventario.setLINEA(valor : variant);
begin
   FDatos.LINEA := valor;
end;

procedure TMovimientosDeInventario.setLINEA_DESCRIPCION(valor : String100);
begin
   FDatos.LINEA_DESCRIPCION := valor;
end;

function TMovimientosDeInventario.getLINEA : variant;
begin
   Result := FDatos.LINEA;
end;

function TMovimientosDeInventario.GetVacio : Boolean;
begin
   Result := dmMovimientosDeInventario.dsMovimientosDeInventario.DataSet.IsEmpty;
end;

procedure TMovimientosDeInventario.EjecutarReagrupar;
begin
   dmMovimientosdeInventario.EjecutarReagrupar;
end;

procedure TMovimientosDeInventario.SetFOLIO_ORIGEN(value : integer);
begin
   FDatos.FOLIO_ORIGEN := value;
end;

procedure TMovimientosDeInventario.SetFOLIO_DESTINO(value : integer);
begin
   FDatos.FOLIO_DESTINO := value;
end;

function TMovimientosDeInventario.getFOLIO_ORIGEN : integer;
begin
   Result := FDatos.FOLIO_ORIGEN;
end;

function TMovimientosDeInventario.getFOLIO_DESTINO : integer;
begin
   Result := FDatos.FOLIO_DESTINO;
end;

procedure TMovimientosDeInventario.SetUsuario(valor : integer);
begin
   FDatos.USUARIO := valor;
end;

function TMovimientosDeInventario.GetUsuario : integer;
begin
   Result := FDatos.USUARIO;
end;

function TMovimientosDeInventario.GetFechaServidor : TDatetime;
begin
   dmMovimientosDeInventario.RefreshFechaServidor;
   Result := dmMovimientosDeInventario.dsFechaServidor.DataSet.FieldByName('R_FECHA').AsDatetime;
end;

constructor TMovimientosDeInventario.Create(pId : integer);
begin
   Inherited Create();
   Cargar(pId);
end;

procedure TMovimientosDeInventario.SetCLAVE(value : String20);
begin
   FDatos.CLAVE := value;
end;

function TMovimientosDeInventario.GetCLAVE : String20;
begin
   Result := FDatos.CLAVE;
end;

procedure TMovimientosDeInventario.eliminar;
begin
   dmMovimientosDeInventario.eliminar(ID);
end;

procedure TMovimientosDeInventario.refreshAlmacenes;
begin
   dmMovimientosDeInventario.refreshAlmacenes;
end;

procedure TMovimientosDeInventario.activarEstatus;
begin
  dmMovimientosdeInventario.activarEstatus(18, ESTATUS);
end;

procedure TMovimientosDeInventario.refreshSubTipo;
begin
   dmMovimientosdeInventario.refreshSubTipos;
end;

procedure TMovimientosDeInventario.refreshSubTipo(valor : string);
begin
   dmMovimientosdeInventario.activarSubTipo(valor);
end;

function TMovimientosDeInventario.ejecucionEstatus(id : integer) : boolean;
begin
   Result := dmMovimientosDeInventario.ejecucionEstatus(id);
end;

procedure TMovimientosDeInventario.cargarEstatusEjecucion;
begin
   dmMovimientosDeInventario.cargarEstatusEjecucion;
end;

procedure TMovimientosDeInventario.SubTipo;
begin
   dmMovimientosdeInventario.activarSubTipo(TIPO);
end;

function TMovimientosDeInventario.GetDataSourceSubTipo : TDataSource;
begin
   Result := dmMovimientosdeInventario.dsSubTipo;
end;

function TMovimientosDeInventario.GetDataSourceEstatus : TDataSource;
begin
   Result := dmMovimientosdeInventario.dsEstatusProcesosDetalle;
end;

function TMovimientosDeInventario.GetDataSourceAlmacenes : TDataSource;
begin
   dmMovimientosdeInventario.activarAlmacenes;
   Result := dmMovimientosdeInventario.dsAlmacenes;
end;

destructor TMovimientosDeInventario.Destroy;
begin
  dmMovimientosdeInventario.Free;
  dmMovimientosdeInventario := nil;
  inherited destroy;
end;

function TMovimientosDeInventario.Guardar : integer;
begin
   Result := dmMovimientosDeInventario.Guardar(FDatos);
end;

procedure TMovimientosDeInventario.Cargar(v_id: Integer);
begin
   dmMovimientosDeInventario.Cargar(v_id, FDatos);
end;

procedure TMovimientosDeInventario.SetID(value : integer);
begin
   FDatos.ID := value;
end;

function TMovimientosDeInventario.GetID : integer;
begin
   Result := FDatos.ID;
end;

procedure TMovimientosDeInventario.SetFECHA_HORA(value : TDatetime);
begin
   FDatos.FECHA_HORA := value;
end;

function TMovimientosDeInventario.GetFECHA_HORA : TDatetime;
begin
   Result := FDatos.FECHA_HORA;
end;

procedure TMovimientosDeInventario.SetTIPO(value : String20);
begin
   FDatos.TIPO := value;
end;

function TMovimientosDeInventario.GetTIPO : String20;
begin
   Result := FDatos.TIPO;
end;

procedure TMovimientosDeInventario.SetSUB_TIPO(value : variant);
begin
   FDatos.SUB_TIPO := value;
end;

function TMovimientosDeInventario.GetSUB_TIPO : variant;
begin
   Result := FDatos.SUB_TIPO;
end;

procedure TMovimientosDeInventario.SetREFERENCIA(value : String50);
begin
   FDatos.REFERENCIA := value;
end;

function TMovimientosDeInventario.GetREFERENCIA : String50;
begin
   Result := FDatos.REFERENCIA;
end;

procedure TMovimientosDeInventario.SetIDREFERENCIA(value : variant);
begin
   FDatos.IDREFERENCIA := value;
end;

function TMovimientosDeInventario.GetIDREFERENCIA : variant;
begin
   Result := FDatos.IDREFERENCIA;
end;

procedure TMovimientosDeInventario.SetALMACEN_ORIGEN(value : integer);//not null
begin
   FDatos.ALMACEN_ORIGEN := value;
end;

function TMovimientosDeInventario.GetALMACEN_ORIGEN : integer;//not null
begin
   Result := FDatos.ALMACEN_ORIGEN;
end;

procedure TMovimientosDeInventario.SetALMACEN_DESTINO(value : variant);
begin
   FDatos.ALMACEN_DESTINO := value;
end;

function TMovimientosDeInventario.GetALMACEN_DESTINO : variant;
begin
   Result := FDatos.ALMACEN_DESTINO;
end;

procedure TMovimientosDeInventario.SetOBSERVACIONES(value : String100);
begin
   FDatos.OBSERVACIONES := value;
end;

function TMovimientosDeInventario.GetOBSERVACIONES : String100;
begin
   Result := FDatos.OBSERVACIONES;
end;

procedure TMovimientosDeInventario.SetESTATUS(value : String20);
begin
   FDatos.ESTATUS := value;
end;

function TMovimientosDeInventario.GetESTATUS : String20;
begin
   Result := FDatos.ESTATUS;
end;

end.
