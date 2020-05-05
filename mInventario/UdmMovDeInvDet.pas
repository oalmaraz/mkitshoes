unit UdmMovDeInvDet;

interface

uses
  UTipos, URecords, IBModulo, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBTable,  IBX.IBQuery, IBX.IBStoredProc;

type
  TdmMovimientosDeInventarioDet = class(TDataModule)
    dsMovimientosDeInventarioDet: TDataSource;
    spIBXInsert: TIBStoredProc;
    spIBXUpdate: TIBStoredProc;
    qyIBXMovimientosDeInventarioDet: TIBQuery;
    qyIBXMovimientosDeInventarioDetR_ID: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_MOVIMIENTOS_DE_INVENTARIO: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_MATERIAL: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_MATERIAL_CLAVE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_MATERIAL_DESCRIPCION: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_CANTIDAD: TFloatField;
    qyIBXMovimientosDeInventarioDetR_COSTO: TFloatField;
    qyIBXMovimientosDeInventarioDetR_MONEDA: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_UNIDAD: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_UNIDAD_CLAVE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_UNIDAD_DESCRIPCION: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_LOTE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_SERIE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_ID_INVENTARIO: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_PROVEEDOR_CONSOLIDADO: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_PROVEEDOR_CLAVE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_PROVEEDOR_NOMBRE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_ESTATUS: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_CAJAS: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_PEDIDO: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_PEDIDO_DETALLE: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_FACTURA: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_FACTURA_DETALLE: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_DEVOLUCIONES_CANTIDAD: TFloatField;
    qyIBXMovimientosDeInventarioDetR_DEVOLUCIONES_CAJA: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_REFERENCIA: TIBStringField;
    dsMateriales: TDataSource;
    qyIBXMateriales: TIBQuery;
    qyIBXMaterialesID: TIntegerField;
    qyIBXMaterialesCLAVE: TIBStringField;
    qyIBXMaterialesDESCRIPCION: TIBStringField;
    qyIBXMaterialesUNIDAD_BASE: TIntegerField;
    qyIBXMaterialesLINEA: TIntegerField;
    qyIBXMaterialesUNIDADES_COMPRADAS: TFloatField;
    qyIBXMaterialesUNIDADES_VENDIDAS: TFloatField;
    qyIBXMaterialesUNIDADES_PRODUCIDAS: TFloatField;
    qyIBXMaterialesLARGO: TFloatField;
    qyIBXMaterialesANCHO: TFloatField;
    qyIBXMaterialesALTO: TFloatField;
    qyIBXMaterialesUNIDAD_LAA: TIntegerField;
    qyIBXMaterialesLOTE: TIBStringField;
    qyIBXMaterialesNUM_SERIE: TIBStringField;
    qyIBXMaterialesCONSOLIDADO: TIBStringField;
    qyIBXMaterialesCOSTO_PROMEDIO: TIBStringField;
    qyIBXMaterialesCOSTO_PEPS: TIBStringField;
    qyIBXMaterialesCOSTO_UEPS: TIBStringField;
    qyIBXMaterialesFECHA_CERO_EXIST: TDateTimeField;
    qyIBXMaterialesFECHA_ULTIMA_COMPRA: TDateTimeField;
    qyIBXMaterialesCODIGO_BARRAS: TIBStringField;
    qyIBXMaterialesIVA_PORC: TFloatField;
    qyIBXMaterialesIEPS_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_1_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_2_PORC: TFloatField;
    qyIBXMaterialesOBSERVACIONES: TBlobField;
    qyIBXMaterialesFOTO: TBlobField;
    qyIBXMaterialesDIAS_DE_VIGENCIA: TIntegerField;
    qyIBXMaterialesCOSTO_ULT_COMPRA: TFloatField;
    qyIBXMaterialesNUM_ETIQUETAS: TIntegerField;
    qyIBXMaterialesACTIVO_FIJO: TIBStringField;
    qyIBXMaterialesCALIDAD: TIntegerField;
    qyIBXUnidades: TIBQuery;
    qyIBXProveedores: TIBQuery;
    dsUnidades: TDataSource;
    dsProveedores: TDataSource;
    qyIBXMonedas: TIBQuery;
    dsMonedas: TDataSource;
    qyIBXMonedasID: TIntegerField;
    qyIBXMonedasCLAVE: TIBStringField;
    qyIBXMonedasDESCRIPCION: TIBStringField;
    qyIBXMonedasFECHA_ULT_ACT: TDateTimeField;
    qyIBXMonedasPARIDAD: TFloatField;
    qyIBXProveedoresR_ID: TIntegerField;
    qyIBXProveedoresR_CLAVE: TIBStringField;
    qyIBXProveedoresR_NOMBRE: TIBStringField;
    qyIBXProveedoresR_RAZON_SOCIAL: TIBStringField;
    qyIBXProveedoresR_CLASIFICACION: TIBStringField;
    qyIBXProveedoresR_TELEFONO: TIBStringField;
    dsPreferencias: TDataSource;
    TIBXPreferencias: TIBTable;
    TIBXPreferenciasID: TIntegerField;
    TIBXPreferenciasNOMBRE: TIBStringField;
    TIBXPreferenciasTIPO: TIBStringField;
    TIBXPreferenciasVALOR: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_MONEDA_CLAVE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_MONEDA_DESCRIPCION: TIBStringField;
    qyIBXEliminar: TIBQuery;
    qyIBXUnidadesR_ID: TIntegerField;
    qyIBXUnidadesR_MATERIAL: TIntegerField;
    qyIBXUnidadesR_UNIDAD: TIntegerField;
    qyIBXUnidadesR_CLAVE: TIBStringField;
    qyIBXUnidadesR_DESCRIPCION: TIBStringField;
    qyIBXUnidadesR_FACTOR: TFloatField;
    qyIBXClientes: TIBQuery;
    dsClientes: TDataSource;
    qyIBXClientesR_ID: TIntegerField;
    qyIBXClientesR_CLAVE: TIBStringField;
    qyIBXClientesR_NOMBRE: TIBStringField;
    qyIBXClientesR_RAZON_SOCIAL: TIBStringField;
    qyIBXClientesR_CLASIFICACION: TIBStringField;
    qyIBXClientesR_TELEFONO: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_CLIENTE: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_CLIENTE_CLAVE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_CLIENTE_NOMBRE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_MEDIDA: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_MEDIDA_DESCRIPCION: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_COLOR: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_COLOR_NOMBRE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_ROWS: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_ERROR: TIBStringField;
    TManejo_Errores: TIBTable;
    qyIBXMovimientosDeInventarioDetR_ID_ERROR: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_SUJETO_NOMBRE: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_CODIGO_BARRAS: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_NUM_ETIQUETAS: TIntegerField;
    qyIBXMovimientosDeInventarioDetR_MATERIAL_ESTATUS: TIBStringField;
    qyIBXMovimientosDeInventarioDetR_ETIQUETAS: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qyIBXMaterialesAfterOpen(DataSet: TDataSet);
    procedure qyBDEMaterialesAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    formatoNumero : string;
    formatoMoneda : string;
    MonedaBase    : integer;
  public
    { Public declarations }
    procedure Cargar(var Datos: _MovimientosDeInventarioDet);overload;
    procedure Cargar(id: integer);overload;
    procedure CargarDatos(v_id : integer);
    function Guardar(var Datos : _MovimientosDeInventarioDet) : integer;
    procedure activarMateriales;
    procedure activarUnidades;
    procedure activarProveedores;
    procedure activarMonedas;
    function GetMonedaBase : integer;
    procedure RefreshProveedores;
    procedure RefreshClientes;
    procedure refreshMateriales;
    procedure refreshMonedas;
    procedure refreshUnidades;
    procedure eliminarDatos;
    function filtraMensaje(id : integer) : string;
  end;

implementation

{$R *.DFM}

function TdmMovimientosDeInventarioDet.filtraMensaje(id : integer) : string;
begin
   if TManejo_Errores.State = dsInactive then
   begin
      TManejo_Errores.Open;
   end;
   TManejo_Errores.Filter := 'ID = '+IntToStr(id);
   Result := TManejo_Errores.FieldByName('MENSAJE').AsString;
end;

procedure TdmMovimientosDeInventarioDet.Cargar(var Datos: _MovimientosDeInventarioDet);
begin
   Datos.ID                        := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_ID').AsInteger;
   Datos.MOVIMIENTOS_DE_INVENTARIO := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MOVIMIENTOS_DE_INVENTARIO').AsInteger;
   Datos.MATERIAL                  := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MATERIAL').AsInteger;
   Datos.MATERIAL_CLAVE            := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MATERIAL_CLAVE').AsString;
   Datos.MATERIAL_DESCRIPCION      := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
   Datos.CANTIDAD                  := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_CANTIDAD').AsFloat;
   Datos.COSTO                     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_COSTO').AsFloat;
   Datos.MONEDA                    := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MONEDA').AsInteger;
   Datos.UNIDAD                    := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_UNIDAD').AsInteger;
   Datos.LOTE                      := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_LOTE').AsString;
   Datos.SERIE                     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_SERIE').AsString;
   Datos.ID_INVENTARIO             := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_ID_INVENTARIO').Value;
   Datos.PROVEEDOR_CONSOLIDADO     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_PROVEEDOR_CONSOLIDADO').Value;
   Datos.CLIENTE                   := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_CLIENTE').Value;
   Datos.ESTATUS                   := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_ESTATUS').AsString;
   Datos.CAJAS                     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_CAJAS').AsInteger;
   Datos.PEDIDO                    := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_PEDIDO').Value;
   Datos.PEDIDO_DETALLE            := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_PEDIDO_DETALLE').Value;
   Datos.FACTURA                   := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_FACTURA').Value;
   Datos.FACTURA_DETALLE           := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_FACTURA_DETALLE').Value;
   Datos.DEVOLUCIONES_CANTIDAD     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_DEVOLUCIONES_CANTIDAD').AsFloat;
   Datos.DEVOLUCIONES_CAJA         := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_DEVOLUCIONES_CAJA').AsInteger;
   Datos.REFERENCIA                := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_REFERENCIA').AsString;
   Datos.MEDIDA                    := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_MEDIDA').Value;
   Datos.COLOR                     := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_COLOR').Value;
end;

procedure TdmMovimientosDeInventarioDet.RefreshClientes;
begin
   dsClientes.DataSet.Close;
   dsClientes.DataSet.Open
end;

procedure TdmMovimientosDeInventarioDet.refreshUnidades;
begin
   dsUnidades.DataSet.Close;
   dsUnidades.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.refreshMateriales;
begin
   dsMateriales.DataSet.Close;
   dsMateriales.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.refreshMonedas;
begin
   dsMonedas.DataSet.Close;
   dsMonedas.DataSet.Open;
end;

function TdmMovimientosDeInventarioDet.GetMonedaBase : integer;
begin
   Result := MonedaBase;
end;

procedure TdmMovimientosDeInventarioDet.activarMateriales;
begin
   if dsMateriales.DataSet.State = dsInactive then
      dsMateriales.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.activarUnidades;
begin
   if dsUnidades.DataSet.State = dsInactive then
      dsUnidades.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.RefreshProveedores;
begin
   dsProveedores.DataSet.Close;
   dsProveedores.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.activarProveedores;
begin
   if dsProveedores.DataSet.State = dsInactive then
      dsProveedores.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.activarMonedas;
begin
   if dsMonedas.DataSet.State = dsInactive then
      dsMonedas.DataSet.Open;
end;

procedure TdmMovimientosDeInventarioDet.CargarDatos(v_id : integer);
begin
   dsMovimientosDeInventarioDet.DataSet.Close;
   dsMovimientosDeInventarioDet.DataSet.Open;
   dsMovimientosDeInventarioDet.DataSet.Locate('R_ID', v_id, [loCaseInsensitive]);
end;

procedure TdmMovimientosDeInventarioDet.eliminarDatos;
begin
   if not(dsMovimientosDeInventarioDet.DataSet.IsEmpty) then
   begin
      qyIBXEliminar.ParamByName('P_ID').AsInteger := dsMovimientosDeInventarioDet.DataSet.FieldByName('R_ID').AsInteger;
      qyIBXEliminar.ExecSQL;
      qyIBXEliminar.Transaction.CommitRetaining;
      
      dsMovimientosDeInventarioDet.DataSet.Close;
      dsMovimientosDeInventarioDet.DataSet.Open;
   end;
end;

procedure TdmMovimientosDeInventarioDet.Cargar(Id : Integer);
begin
   qyIBXMovimientosDeInventarioDet.Close;
   qyIBXMovimientosDeInventarioDet.ParamByName('P_MOVIMIENTO').AsInteger := id;
   qyIBXMovimientosDeInventarioDet.Open;
end;

function TdmMovimientosDeInventarioDet.Guardar(var Datos : _MovimientosDeInventarioDet) : integer;
var
   tmp : integer;
begin
   tmp := -1;
                 case Datos.ID of
                   -1 : begin //registro nuevo
                           spIBXInsert.ParamByName('P_MOVIMIENTOS_DE_INVENTARIO').AsInteger := Datos.MOVIMIENTOS_DE_INVENTARIO;
                           spIBXInsert.ParamByName('P_MATERIAL').AsInteger                  := Datos.MATERIAL;
                           spIBXInsert.ParamByName('P_CANTIDAD').AsFloat                    := Datos.CANTIDAD;
                           spIBXInsert.ParamByName('P_COSTO').AsFloat                       := Datos.COSTO;
                           spIBXInsert.ParamByName('P_MONEDA').AsInteger                    := Datos.MONEDA;
                           spIBXInsert.ParamByName('P_UNIDAD').AsInteger                    := Datos.UNIDAD;
                           spIBXInsert.ParamByName('P_LOTE').AsString                       := Datos.LOTE;
                           spIBXInsert.ParamByName('P_SERIE').AsString                      := Datos.SERIE;
                           spIBXInsert.ParamByName('P_ID_INVENTARIO').Value                 := Datos.ID_INVENTARIO;
                           spIBXInsert.ParamByName('P_PROVEEDOR_CONSOLIDADO').Value         := Datos.PROVEEDOR_CONSOLIDADO;
                           spIBXInsert.ParamByName('P_ESTATUS').AsString                    := Datos.ESTATUS;
                           spIBXInsert.ParamByName('P_CAJAS').AsInteger                     := Datos.CAJAS;
                           spIBXInsert.ParamByName('P_PEDIDO').Value                        := Datos.PEDIDO;
                           spIBXInsert.ParamByName('P_PEDIDO_DETALLE').Value                := Datos.PEDIDO_DETALLE;
                           spIBXInsert.ParamByName('P_FACTURA').Value                       := Datos.FACTURA;
                           spIBXInsert.ParamByName('P_FACTURA_DETALLE').Value               := Datos.FACTURA_DETALLE;
                           spIBXInsert.ParamByName('P_DEVOLUCIONES_CANTIDAD').AsFloat       := Datos.DEVOLUCIONES_CANTIDAD;
                           spIBXInsert.ParamByName('P_DEVOLUCIONES_CAJA').AsInteger         := Datos.DEVOLUCIONES_CAJA;
                           spIBXInsert.ParamByName('P_REFERENCIA').AsString                 := Datos.REFERENCIA;
                           spIBXInsert.ParamByName('P_CLIENTE').Value                       := Datos.CLIENTE;
                           spIBXInsert.ParamByName('P_MEDIDA').Value                        := Datos.MEDIDA;
                           spIBXInsert.ParamByName('P_COLOR').Value                         := Datos.COLOR;
                           spIBXInsert.ExecProc;
                           spIBXInsert.Transaction.CommitRetaining;
                           tmp := spIBXInsert.ParamByName('R_ID').AsInteger;
                        end;
                  else
                     begin //registro modificado
                        spIBXUpdate.ParamByName('P_ID').AsInteger                := Datos.ID;
                        spIBXUpdate.ParamByName('P_MATERIAL').AsInteger            := Datos.MATERIAL;
                        spIBXUpdate.ParamByName('P_CANTIDAD').AsFloat              := Datos.CANTIDAD;
                        spIBXUpdate.ParamByName('P_COSTO').AsFloat                 := Datos.COSTO;
                        spIBXUpdate.ParamByName('P_MONEDA').AsInteger              := Datos.MONEDA;
                        spIBXUpdate.ParamByName('P_UNIDAD').AsInteger              := Datos.UNIDAD;
                        spIBXUpdate.ParamByName('P_LOTE').AsString                 := Datos.LOTE;
                        spIBXUpdate.ParamByName('P_SERIE').AsString                := Datos.SERIE;
                        spIBXUpdate.ParamByName('P_ID_INVENTARIO').Value           := Datos.ID_INVENTARIO;
                        spIBXUpdate.ParamByName('P_PROVEEDOR_CONSOLIDADO').Value   := Datos.PROVEEDOR_CONSOLIDADO;
                        spIBXUpdate.ParamByName('P_ESTATUS').AsString              := Datos.ESTATUS;
                        spIBXUpdate.ParamByName('P_CAJAS').AsInteger               := Datos.CAJAS;
                        spIBXUpdate.ParamByName('P_PEDIDO').Value                  := Datos.PEDIDO;
                        spIBXUpdate.ParamByName('P_PEDIDO_DETALLE').Value          := Datos.PEDIDO_DETALLE;
                        spIBXUpdate.ParamByName('P_FACTURA').Value                 := Datos.FACTURA;
                        spIBXUpdate.ParamByName('P_FACTURA_DETALLE').Value         := Datos.FACTURA_DETALLE;
                        spIBXUpdate.ParamByName('P_DEVOLUCIONES_CANTIDAD').AsFloat := Datos.DEVOLUCIONES_CANTIDAD;
                        spIBXUpdate.ParamByName('P_DEVOLUCIONES_CAJA').AsInteger   := Datos.DEVOLUCIONES_CAJA;
                        spIBXUpdate.ParamByName('P_REFERENCIA').AsString           := Datos.REFERENCIA;
                        spIBXUpdate.ParamByName('P_CLIENTE').Value                 := Datos.CLIENTE;
                        spIBXUpdate.ParamByName('P_MEDIDA').Value                  := Datos.MEDIDA;
                        spIBXUpdate.ParamByName('P_COLOR').Value                   := Datos.COLOR;
                        spIBXUpdate.ExecProc;
                        spIBXUpdate.Transaction.CommitRetaining;
                     end;
                 end;
   Result := tmp;
end;

procedure TdmMovimientosDeInventarioDet.DataModuleCreate(Sender: TObject);
begin
   dsMovimientosDeInventarioDet.DataSet := qyIBXMovimientosDeInventarioDet;
   dsMateriales.DataSet                 := qyIBXMateriales;
   dsUnidades.DataSet                   := qyIBXUnidades;
   dsProveedores.DataSet                := qyIBXProveedores;
   dsMonedas.DataSet                    := qyIBXMonedas;
   dsPreferencias.DataSet               := TIBXPreferencias;
   dsClientes.DataSet                   := qyIBXClientes;

   if dsPreferencias.DataSet.State = dsInactive then
      dsPreferencias.DataSet.Open;
   //Formato numero
   dsPreferencias.DataSet.Filter := 'ID = 64';
   formatoNumero := dsPreferencias.DataSet.FieldByName('VALOR').AsString;
   //Formato moneda
   dsPreferencias.DataSet.Filter := 'ID = 65';
   formatoMoneda := dsPreferencias.DataSet.FieldByName('VALOR').AsString;
   //Moneda base
   dsPreferencias.DataSet.Filter := 'ID = 3';
   MonedaBase := dsPreferencias.DataSet.FieldByName('VALOR').AsInteger;

   qyIBXMovimientosDeInventarioDetR_CANTIDAD.DisplayFormat := formatoNumero;
   qyIBXMovimientosDeInventarioDetR_COSTO.DisplayFormat    := formatoMoneda;
end;

procedure TdmMovimientosDeInventarioDet.qyIBXMaterialesAfterOpen(
  DataSet: TDataSet);
begin
   if dsUnidades.DataSet.State = dsInactive then
   begin
      dsUnidades.DataSet.Close;
      dsUnidades.DataSet.Open;
   end;
end;

procedure TdmMovimientosDeInventarioDet.qyBDEMaterialesAfterOpen(
  DataSet: TDataSet);
begin
   if dsUnidades.DataSet.State = dsInactive then
   begin
      dsUnidades.DataSet.Close;
      dsUnidades.DataSet.Open;
   end;
end;

end.
