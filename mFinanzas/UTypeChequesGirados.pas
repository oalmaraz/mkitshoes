unit UTypeChequesGirados;

interface

uses
   UTipos, URecords, UdmChequesGirados, classes, db, IBX.IBDatabase;

type
   TChequesGirados = class(TObject)
   private
     dmCheques : TdmChequesGirados;
     FDatos    : _ChequesGirados;

     procedure setID(valor : integer);
     procedure setREFERENCIA(valor : String20);
     procedure setMONTO(valor : double);
     procedure setMONEDA(valor : integer);
     procedure setPROVEEDOR(valor : variant);
     procedure setPROVEEDOR_CLAVE(valor : String50);
     procedure setPROVEEDOR_NOMBRE(valor : String100);
     procedure setFECHA_ALTA(valor : TDatetime);
     procedure setFECHA_APLICACION(valor : TDatetime);
     procedure setOBSERVACIONES(valor : TMemoryStream);
     procedure setFECHA_APLICACION_REAL(valor : TDatetime);
     procedure setSEL(valor : String2);
     procedure setTABLA_REFERENCIA(valor : String50);
     procedure setID_REFERENCIA(valor : variant);
     procedure setUSUARIO(valor : integer);
     procedure setAUTORIZO(valor : variant);
     procedure setESTATUS(valor : String20);
     procedure setCHEQUERA(valor : integer);
     procedure setBANCO(valor : integer);
     procedure setBANCO_NOMBRE(valor : String100);
     procedure setCONSECUTIVO(valor : integer);
     procedure setABONO_CTA(valor : String2);

     function getABONO_CTA : String2;
     function getID : integer;
     function getREFERENCIA : String20;
     function getMONTO : double;
     function getMONEDA : integer;
     function getPROVEEDOR : variant;
     function getPROVEEDOR_CLAVE : String50;
     function getPROVEEDOR_NOMBRE : String100;
     function getFECHA_ALTA : TDatetime;
     function getFECHA_APLICACION : TDatetime;
     function getOBSERVACIONES : TMemoryStream;
     function getFECHA_APLICACION_REAL : TDatetime;
     function getSEL : String2;
     function getTABLA_REFERENCIA : String50;
     function getID_REFERENCIA : variant;
     function getUSUARIO : integer;
     function getAUTORIZO : variant;
     function getESTATUS : String20;
     function getCHEQUERA : integer;
     function getBANCO : integer;
     function getBANCO_NOMBRE : String100;
     function getCONSECUTIVO : integer;

     function GetFecha : TDatetime;
     function GetVacio : Boolean;
     function GetdsMonedas : TDataSource;
     function GetdsChequeras : TDataSource;
     function GetdsEstatus : TDataSource;
     function GetdsPendientes : TDataSource;
     function GetDatabase : TIBDatabase;
     function GetTransaction : TIBTransaction;
     function GetMonedaBase : integer;
   public
     constructor Create();overload;
     constructor Create(pId : integer);overload;
     destructor Destroy; override;
     function Guardar : integer;
     procedure Cargar(v_id: Integer);
     procedure eliminar;
     procedure cargarEstatusEjecucion;
     procedure activarEstatus;
     procedure refreshMonedas;
     procedure refreshChequeras;
     procedure refreshPendientes;
     function ejecucionEstatus(id : integer) : boolean;
     procedure Seleccionar;
   published
     property ID                    : integer read getID write setID;
     property REFERENCIA            : String20 read getREFERENCIA write setREFERENCIA;
     property MONTO                 : double read getMONTO write setMONTO;
     property MONEDA                : integer read getMONEDA write setMONEDA;
     property PROVEEDOR             : variant read getPROVEEDOR write setPROVEEDOR;
     property PROVEEDOR_CLAVE       : String50 read getPROVEEDOR_CLAVE write setPROVEEDOR_CLAVE;
     property PROVEEDOR_NOMBRE      : String100 read getPROVEEDOR_NOMBRE write setPROVEEDOR_NOMBRE;
     property FECHA_ALTA            : TDatetime read getFECHA_ALTA write setFECHA_ALTA;
     property FECHA_APLICACION      : TDatetime read getFECHA_APLICACION write setFECHA_APLICACION;
     property OBSERVACIONES         : TMemoryStream read getOBSERVACIONES write setOBSERVACIONES;
     property FECHA_APLICACION_REAL : TDatetime read getFECHA_APLICACION_REAL write setFECHA_APLICACION_REAL;
     property SEL                   : String2 read getSEL write setSEL;
     property TABLA_REFERENCIA      : String50 read getTABLA_REFERENCIA write setTABLA_REFERENCIA;
     property ID_REFERENCIA         : variant read getID_REFERENCIA write setID_REFERENCIA;
     property USUARIO               : integer read getUSUARIO write setUSUARIO;
     property AUTORIZO              : variant read getAUTORIZO write setAUTORIZO;
     property ESTATUS               : String20 read getESTATUS write setESTATUS;
     property CHEQUERA              : integer read getCHEQUERA write setCHEQUERA;
     property BANCO                 : integer read getBANCO write setBANCO;
     property BANCO_NOMBRE          : String100 read getBANCO_NOMBRE write setBANCO_NOMBRE;
     property CONSECUTIVO           : integer read getCONSECUTIVO write setCONSECUTIVO;
     property ABONO_CTA             : String2 read getABONO_CTA write setABONO_CTA;

     property FECHA_SERVIDOR      : TDatetime read GetFecha;
     property VACIO               : Boolean read GetVacio;
     property dsMonedas           : TDataSource read GetdsMonedas;
     property dsChequeras         : TDataSource read GetdsChequeras;
     property dsEstatus           : TDataSource read GetdsEstatus;
     property dsPendientes        : TDataSource read GetdsPendientes;
     property DATABASE            : TIBDatabase read GetDatabase;
     property TRANSACTION         : TIBTransaction read GetTransaction;
     property MONEDABASE          : integer read GetMonedaBase;
   end;

implementation

constructor TChequesGirados.Create();
begin
  inherited Create;
  dmCheques            := TdmChequesGirados.Create(nil);
  FDatos.OBSERVACIONES := TMemoryStream.Create;
  refreshMonedas;
  refreshChequeras;
end;

constructor TChequesGirados.Create(pId : integer);
begin
   Inherited Create();
   Cargar(pId);
end;

destructor TChequesGirados.Destroy;
begin
  FDatos.OBSERVACIONES.Free;
  FDatos.OBSERVACIONES := nil;

  dmCheques.Free;
  dmCheques := nil;
  inherited destroy;
end;

procedure TChequesGirados.Seleccionar;
begin
   dmCheques.EjecutarSeleccionado;
end;

procedure TChequesGirados.refreshPendientes;
begin
   dmCheques.RefreshPendientes;
end;

function TChequesGirados.Guardar : integer;
begin
   Result := dmCheques.Guardar(FDatos);
end;

procedure TChequesGirados.Cargar(v_id: Integer);
begin
   dmCheques.Cargar(v_id, FDatos);
end;

procedure TChequesGirados.eliminar;
begin
   dmCheques.eliminar;
end;

procedure TChequesGirados.cargarEstatusEjecucion;
begin
   dmCheques.cargarEstatusEjecucion;
end;

function TChequesGirados.ejecucionEstatus(id : integer) : boolean;
begin
   Result := dmCheques.ejecucionEstatus(id);
end;

procedure TChequesGirados.activarEstatus;
begin
   dmCheques.activarEstatus(15, ESTATUS);
end;

procedure TChequesGirados.refreshMonedas;
begin
   dmCheques.refreshMonedas;
end;

procedure TChequesGirados.refreshChequeras;
begin
   dmCheques.refreshChequeras;
end;

function TChequesGirados.GetFecha : TDatetime;
begin
   Result := dmCheques.FECHA;
end;

function TChequesGirados.GetVacio : Boolean;
begin
   Result := dmCheques.dsEncabezado.DataSet.IsEmpty;
end;

function TChequesGirados.GetdsMonedas : TDataSource;
begin
   Result := dmCheques.dsMonedas;
end;

function TChequesGirados.GetdsChequeras : TDataSource;
begin
   Result := dmCheques.dsChequeras;
end;

function TChequesGirados.GetdsEstatus : TDataSource;
begin
   Result := dmCheques.dsEstatusProcesosDetalle;
end;

function TChequesGirados.GetdsPendientes : TDataSource;
begin
   Result := dmCheques.dsPendientes;
end;

function TChequesGirados.GetDatabase : TIBDatabase;
begin
   Result := dmCheques.TIBXChequesGirados.Database;
end;

function TChequesGirados.GetTransaction : TIBTransaction;
begin
   Result := dmCheques.TIBXChequesGirados.Transaction;
end;

function TChequesGirados.GetMonedaBase : integer;
begin
   Result := dmCheques.MONEDABASE;
end;

//****************ESTRUCTURA BASE DE DATOS****************//

procedure TChequesGirados.setABONO_CTA(valor : String2);
begin
   FDatos.ABONO_CTA := valor;
end;

function TChequesGirados.getABONO_CTA : String2;
begin
   result := FDatos.ABONO_CTA;
end;

procedure TChequesGirados.setID(valor : integer);
begin
   FDatos.ID := valor;
end;

procedure TChequesGirados.setREFERENCIA(valor : String20);
begin
   FDatos.REFERENCIA := valor;
end;

procedure TChequesGirados.setMONTO(valor : double);
begin
   FDatos.MONTO := valor;
end;

procedure TChequesGirados.setMONEDA(valor : integer);
begin
   FDatos.MONEDA := valor;
end;

procedure TChequesGirados.setPROVEEDOR(valor : variant);
begin
   FDatos.PROVEEDOR := valor;
end;

procedure TChequesGirados.setPROVEEDOR_CLAVE(valor : String50);
begin
   FDatos.PROVEEDOR_CLAVE := valor;
end;

procedure TChequesGirados.setPROVEEDOR_NOMBRE(valor : String100);
begin
   FDatos.PROVEEDOR_NOMBRE := valor;
end;

procedure TChequesGirados.setFECHA_ALTA(valor : TDatetime);
begin
   FDatos.FECHA_ALTA := valor;
end;

procedure TChequesGirados.setFECHA_APLICACION(valor : TDatetime);
begin
   FDatos.FECHA_APLICACION := valor;
end;

procedure TChequesGirados.setOBSERVACIONES(valor : TMemoryStream);
begin
   FDatos.OBSERVACIONES := valor;
end;

procedure TChequesGirados.setFECHA_APLICACION_REAL(valor : TDatetime);
begin
   FDatos.FECHA_APLICACION_REAL := valor;
end;

procedure TChequesGirados.setSEL(valor : String2);
begin
   FDatos.SEL := valor;
end;

procedure TChequesGirados.setTABLA_REFERENCIA(valor : String50);
begin
   FDatos.TABLA_REFERENCIA := valor;
end;

procedure TChequesGirados.setID_REFERENCIA(valor : variant);
begin
   FDatos.ID_REFERENCIA := valor;
end;

procedure TChequesGirados.setUSUARIO(valor : integer);
begin
   FDatos.USUARIO := valor;
end;

procedure TChequesGirados.setAUTORIZO(valor : variant);
begin
   FDatos.AUTORIZO := valor;
end;

procedure TChequesGirados.setESTATUS(valor : String20);
begin
   FDatos.ESTATUS := valor;
end;

procedure TChequesGirados.setCHEQUERA(valor : integer);
begin
   FDatos.CHEQUERA := valor;
end;

procedure TChequesGirados.setBANCO(valor : integer);
begin
   FDatos.BANCO        := dmCheques.dsChequeras.DataSet.FieldByName('BANCO').AsInteger;
   FDatos.BANCO_NOMBRE := dmCheques.dsChequeras.DataSet.FieldByName('NOMBRE').AsString;
end;

procedure TChequesGirados.setBANCO_NOMBRE(valor : String100);
begin
   FDatos.BANCO_NOMBRE := valor;
end;

procedure TChequesGirados.setCONSECUTIVO(valor : integer);
begin
   FDatos.CONSECUTIVO := valor;
end;

function TChequesGirados.getID : integer;
begin
   Result := FDatos.ID;
end;

function TChequesGirados.getREFERENCIA : String20;
begin
   Result := FDatos.REFERENCIA;
end;

function TChequesGirados.getMONTO : double;
begin
   Result := FDatos.MONTO;
end;

function TChequesGirados.getMONEDA : integer;
begin
   Result := FDatos.MONEDA;
end;

function TChequesGirados.getPROVEEDOR : variant;
begin
   Result := FDatos.PROVEEDOR;
end;

function TChequesGirados.getPROVEEDOR_CLAVE : String50;
begin
   Result := FDatos.PROVEEDOR_CLAVE;
end;

function TChequesGirados.getPROVEEDOR_NOMBRE : String100;
begin
   Result := FDatos.PROVEEDOR_NOMBRE;
end;

function TChequesGirados.getFECHA_ALTA : TDatetime;
begin
   Result := FDatos.FECHA_ALTA;
end;

function TChequesGirados.getFECHA_APLICACION : TDatetime;
begin
   Result := FDatos.FECHA_APLICACION;
end;

function TChequesGirados.getOBSERVACIONES : TMemoryStream;
begin
   Result := FDatos.OBSERVACIONES;
end;

function TChequesGirados.getFECHA_APLICACION_REAL : TDatetime;
begin
   Result := FDatos.FECHA_APLICACION_REAL;
end;

function TChequesGirados.getSEL : String2;
begin
   Result := FDatos.SEL;
end;

function TChequesGirados.getTABLA_REFERENCIA : String50;
begin
   Result := FDatos.TABLA_REFERENCIA;
end;

function TChequesGirados.getID_REFERENCIA : variant;
begin
   Result := FDatos.ID_REFERENCIA;
end;

function TChequesGirados.getUSUARIO : integer;
begin
   Result := FDatos.USUARIO;
end;

function TChequesGirados.getAUTORIZO : variant;
begin
   Result := FDatos.AUTORIZO;
end;

function TChequesGirados.getESTATUS : String20;
begin
   Result := FDatos.ESTATUS;
end;

function TChequesGirados.getCHEQUERA : integer;
begin
   Result := FDatos.CHEQUERA;
end;

function TChequesGirados.getBANCO : integer;
begin
   Result := FDatos.BANCO;
end;

function TChequesGirados.getBANCO_NOMBRE : String100;
begin
   Result := FDatos.BANCO_NOMBRE;
end;

function TChequesGirados.getCONSECUTIVO : integer;
begin
   Result := FDatos.CONSECUTIVO;
end;

end.
