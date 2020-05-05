unit UdmMovimientosDeInventario;

interface

uses
  UTipos, UfrmAutorizar, URecords, IBModulo, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBQuery,  IBX.IBStoredProc;

type
  TdmMovimientosDeInventario = class(TDataModule)
    TIBXMovimientosDeInventario: TIBTable;
    TIBXMovimientosDeInventarioID: TIntegerField;
    TIBXMovimientosDeInventarioFECHA_HORA: TDateTimeField;
    TIBXMovimientosDeInventarioTIPO: TIBStringField;
    TIBXMovimientosDeInventarioSUB_TIPO: TIntegerField;
    TIBXMovimientosDeInventarioREFERENCIA: TIBStringField;
    TIBXMovimientosDeInventarioIDREFERENCIA: TIntegerField;
    TIBXMovimientosDeInventarioALMACEN_ORIGEN: TIntegerField;
    TIBXMovimientosDeInventarioALMACEN_DESTINO: TIntegerField;
    TIBXMovimientosDeInventarioOBSERVACIONES: TIBStringField;
    TIBXMovimientosDeInventarioESTATUS: TIBStringField;
    dsMovimientosDeInventario: TDataSource;
    qyIBXAlmacenes: TIBQuery;
    qyIBXAlmacenesID: TIntegerField;
    qyIBXAlmacenesCLAVE: TIBStringField;
    qyIBXAlmacenesNOMBRE: TIBStringField;
    qyIBXAlmacenesCOMPRA: TIBStringField;
    qyIBXAlmacenesVENDE: TIBStringField;
    qyIBXAlmacenesTRANSFORMA: TIBStringField;
    qyIBXAlmacenesFECHA_ALTA: TDateTimeField;
    qyIBXAlmacenesRESPONSABLE: TIntegerField;
    qyIBXAlmacenesOBSERVACIONES: TBlobField;
    qyIBXAlmacenesSERIE_FACTURA: TIBStringField;
    qyIBXAlmacenesCONSECUTIVO: TIntegerField;
    qyIBXAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyIBXAlmacenesESTATUS: TIBStringField;
    qyIBXAlmacenesSERIE_NC: TIBStringField;
    qyIBXAlmacenesSERIE_NVENTA: TIBStringField;
    qyIBXAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    qyIBXEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    TIBXEstatusProcesosDetalle: TIBTable;
    TIBXEstatusProcesosDetalleID: TIntegerField;
    TIBXEstatusProcesosDetallePROCESO: TIntegerField;
    TIBXEstatusProcesosDetalleESTATUS: TIBStringField;
    TIBXEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TIBXEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    qyIBXEstatusProcesosID: TIntegerField;
    qyIBXEstatusProcesosNOMBRE: TIBStringField;
    qyIBXEstatusProcesosFORMA: TIntegerField;
    qyIBXEstatusProcesosESTATUS: TIBStringField;
    qyIBXSubTipo: TIBQuery;
    qyIBXSubTipoR_ID: TIntegerField;
    qyIBXSubTipoR_DESCRIPCION: TIBStringField;
    qyIBXSubTipoR_GENERA: TIBStringField;
    dsSubTipo: TDataSource;
    qyIBXUpdate: TIBQuery;
    spIBXInsert: TIBStoredProc;
    spIBXEstatus: TIBStoredProc;
    qyIBXEliminar: TIBQuery;
    TIBXMovimientosDeInventarioCLAVE: TIBStringField;
    qyIBXFechaServidor: TIBQuery;
    qyIBXFechaServidorR_FECHA: TDateTimeField;
    dsFechaServidor: TDataSource;
    TIBXMovimientosDeInventarioFOLIO_ALMACEN_ORIGEN: TIntegerField;
    TIBXMovimientosDeInventarioFOLIO_ALMACEN_DESTINO: TIntegerField;
    TIBXMovimientosDeInventarioUSUARIO: TIntegerField;
    spREAGRUPAR_MI: TIBStoredProc;
    spCONTEO_AJUSTE_TODAY: TIBStoredProc;
    TIBXMovimientosDeInventarioLINEA: TIntegerField;
    TIBXMovimientosDeInventariolinea_descripcion: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qyIBXEstatusProcesosAfterOpen(DataSet: TDataSet);
    procedure TIBXMovimientosDeInventarioCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    frmAutorizar : TfrmAutorizar;
  public
    { Public declarations }
    procedure Cargar(id: integer; var Datos: _MovimientosDeInventario);
    function Guardar(var Datos : _MovimientosDeInventario) : integer;
    procedure eliminar(p_id : integer);
    procedure activarAlmacenes;
    procedure activarEstatus(p_forma : integer; p_estatus : string);
    procedure activarSubTipo(tipo : string);
    procedure RefreshFechaServidor;
    procedure cargarEstatusEjecucion;
    function ejecucionEstatus(id : integer) : boolean;
    procedure refreshAlmacenes;
    procedure refreshSubTipos;
    procedure refreshMovimiento;
    procedure EjecutarReagrupar;
    procedure EjecutarAjusteConteo;
  end;

implementation

uses
  reglas_de_negocios, IBData;

{$R *.DFM}

procedure TdmMovimientosDeInventario.EjecutarAjusteConteo;
begin
   spCONTEO_AJUSTE_TODAY.ParamByName('P_ID').AsInteger := dsMovimientosDeInventario.DataSet.FieldByName('ID').AsInteger;
   spCONTEO_AJUSTE_TODAY.ExecProc;
   spCONTEO_AJUSTE_TODAY.Transaction.CommitRetaining;
end;

procedure TdmMovimientosDeInventario.EjecutarReagrupar;
begin
   spREAGRUPAR_MI.ParamByName('P_ID').AsInteger := dsMovimientosDeInventario.DataSet.FieldByName('ID').AsInteger;
   spREAGRUPAR_MI.ExecProc;
   spREAGRUPAR_MI.Transaction.CommitRetaining;
end;

procedure TdmMovimientosDeInventario.RefreshFechaServidor;
begin
   dsFechaServidor.DataSet.Close;
   dsFechaServidor.DataSet.Open;
end;

procedure TdmMovimientosDeInventario.refreshAlmacenes;
begin
   dsAlmacenes.DataSet.Close;
   dsAlmacenes.DataSet.Open;
end;

procedure TdmMovimientosDeInventario.refreshSubTipos;
begin
   dsSubTipo.DataSet.Close;
   dsSubTipo.DataSet.Open;
end;

function TdmMovimientosDeInventario.ejecucionEstatus(id : integer) : boolean;
var
   autorizar : string;
   ejecutar  : boolean;
   tmp       : boolean;
begin
  inherited;
  ejecutar  := true;
  tmp       := false;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  if autorizar = 'Si' then
  begin
     frmAutorizar := TfrmAutorizar.Crear(Application, 2);
     frmAutorizar.ShowModal;
     ejecutar := frmAutorizar.autorizacion;
     frmAutorizar.Free;
     frmAutorizar := nil;
  end;

  if ejecutar then
  begin
     spIBXEstatus.ParamByName('P_ID').AsInteger := id;
     spIBXEstatus.ExecProc;
     spIBXEstatus.Transaction.CommitRetaining;
     refreshMovimiento;
     tmp := true;
  end;
  Result := tmp;
end;

procedure TdmMovimientosDeInventario.cargarEstatusEjecucion;
begin
   spIBXEstatus.Params.Clear;
   spIBXEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
   spIBXEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
end;

procedure TdmMovimientosDeInventario.eliminar(p_id : integer);
begin
   qyIBXEliminar.ParamByName('P_ID').AsInteger := p_id;
   qyIBXEliminar.ExecSQL;
   qyIBXEliminar.Transaction.CommitRetaining;
end;

procedure TdmMovimientosDeInventario.refreshMovimiento;
begin
   if dsMovimientosDeInventario.DataSet.State = dsInactive then
      dsMovimientosDeInventario.DataSet.Open
   else
      begin
         dsMovimientosDeInventario.DataSet.Close;
         dsMovimientosDeInventario.DataSet.Open;
      end;
end;

procedure TdmMovimientosDeInventario.Cargar(Id : Integer; var Datos: _MovimientosDeInventario);
begin
   refreshMovimiento;
   dsMovimientosDeInventario.DataSet.Filter := 'ID = '+IntToStr(Id);
   Datos.ID                := dsMovimientosDeInventario.DataSet.FieldByName('ID').AsInteger;
   Datos.FECHA_HORA        := dsMovimientosDeInventario.DataSet.FieldByName('FECHA_HORA').AsDateTime;
   Datos.CLAVE             := dsMovimientosDeInventario.DataSet.FieldByName('CLAVE').AsString;
   Datos.TIPO              := dsMovimientosDeInventario.DataSet.FieldByName('TIPO').AsString;
   Datos.SUB_TIPO          := dsMovimientosDeInventario.DataSet.FieldByName('SUB_TIPO').AsInteger;
   Datos.REFERENCIA        := dsMovimientosDeInventario.DataSet.FieldByName('REFERENCIA').AsString;//Tabla Referencia
   Datos.IDREFERENCIA      := dsMovimientosDeInventario.DataSet.FieldByName('IDREFERENCIA').AsInteger;//Id Tabla Referencia
   Datos.ALMACEN_ORIGEN    := dsMovimientosDeInventario.DataSet.FieldByName('ALMACEN_ORIGEN').AsInteger;
   Datos.ALMACEN_DESTINO   := dsMovimientosDeInventario.DataSet.FieldByName('ALMACEN_DESTINO').AsInteger;
   Datos.OBSERVACIONES     := dsMovimientosDeInventario.DataSet.FieldByName('OBSERVACIONES').AsString;
   Datos.ESTATUS           := dsMovimientosDeInventario.DataSet.FieldByName('ESTATUS').AsString;
   Datos.FOLIO_ORIGEN      := dsMovimientosDeInventario.DataSet.FieldByName('FOLIO_ALMACEN_ORIGEN').AsInteger;
   Datos.FOLIO_DESTINO     := dsMovimientosDeInventario.DataSet.FieldByName('FOLIO_ALMACEN_DESTINO').AsInteger;
   Datos.LINEA             := dsMovimientosDeInventario.DataSet.FieldByName('LINEA').AsInteger;
   Datos.LINEA_DESCRIPCION := dsMovimientosDeInventario.DataSet.FieldByName('LINEA_DESCRIPCION').AsString;
end;

function TdmMovimientosDeInventario.Guardar(var Datos : _MovimientosDeInventario) : integer;
var
   tmp : integer;
begin
   tmp := -1;
   case Datos.ID of
     -1 : begin //registro nuevo
             spIBXInsert.ParamByName('P_FECHA').AsDatetime          := Datos.FECHA_HORA;
             spIBXInsert.ParamByName('P_CLAVE').AsString            := Datos.CLAVE;
             spIBXInsert.ParamByName('P_TIPO').AsString             := Datos.TIPO;
             spIBXInsert.ParamByName('P_SUB_TIPO').Value            := Datos.SUB_TIPO;
             spIBXInsert.ParamByName('P_ALMACEN_ORIGEN').AsInteger  := Datos.ALMACEN_ORIGEN;
             spIBXInsert.ParamByName('P_ALMACEN_DESTINO').Value     := Datos.ALMACEN_DESTINO;
             spIBXInsert.ParamByName('P_OBSERVACIONES').AsString    := Datos.OBSERVACIONES;
             spIBXInsert.ParamByName('P_ESTATUS').AsString          := Datos.ESTATUS;
             spIBXInsert.ParamByName('P_USUARIO').AsInteger         := Datos.USUARIO;
             spIBXInsert.ParamByName('P_LINEA').Value               := Datos.LINEA;
             spIBXInsert.ExecProc;
             spIBXInsert.Transaction.CommitRetaining;
             tmp := spIBXInsert.ParamByName('R_ID').AsInteger;
          end;
   else
      begin //registro modificado
         qyIBXUpdate.ParamByName('P_ID').AsInteger              := Datos.ID;
         qyIBXUpdate.ParamByName('P_FECHA').AsDatetime          := Datos.FECHA_HORA;
         qyIBXUpdate.ParamByName('P_CLAVE').AsString            := Datos.CLAVE;
         qyIBXUpdate.ParamByName('P_TIPO').AsString             := Datos.TIPO;
         qyIBXUpdate.ParamByName('P_SUB_TIPO').Value            := Datos.SUB_TIPO;
         qyIBXUpdate.ParamByName('P_ALMACEN_ORIGEN').AsInteger  := Datos.ALMACEN_ORIGEN;
         qyIBXUpdate.ParamByName('P_ALMACEN_DESTINO').Value     := Datos.ALMACEN_DESTINO;
         qyIBXUpdate.ParamByName('P_OBSERVACIONES').AsString    := Datos.OBSERVACIONES;
         qyIBXUpdate.ParamByName('P_ESTATUS').AsString          := Datos.ESTATUS;
         qyIBXUpdate.ParamByName('P_USUARIO').AsInteger         := Datos.USUARIO;
         qyIBXUpdate.ParamByName('P_LINEA').Value               := Datos.LINEA;
         qyIBXUpdate.ExecSQL;
         qyIBXUpdate.Transaction.CommitRetaining;
      end;
   end;
   Result := tmp;
end;

procedure TdmMovimientosDeInventario.DataModuleCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TFiltroLineas);
end;

procedure TdmMovimientosDeInventario.activarSubTipo(tipo : string);
begin
   qyIBXSubTipo.Close;
   qyIBXSubTipo.ParamByName('P_TIPO').AsString := tipo;
   qyIBXSubTipo.Open;
end;

procedure TdmMovimientosDeInventario.activarEstatus(p_forma : integer; p_estatus : string);
begin
   qyIBXEstatusProcesos.Close;
   qyIBXEstatusProcesos.ParamByName('P_FORMA').AsInteger  := p_forma;
   qyIBXEstatusProcesos.ParamByName('P_ESTATUS').AsString := p_estatus;
   qyIBXEstatusProcesos.Open;
end;

procedure TdmMovimientosDeInventario.activarAlmacenes;
begin
   if dsAlmacenes.DataSet.State = dsInactive then
   begin
      dsAlmacenes.DataSet.Open;
   end;
end;

procedure TdmMovimientosDeInventario.qyIBXEstatusProcesosAfterOpen(
  DataSet: TDataSet);
begin
   if TIBXEstatusProcesosDetalle.State = dsInactive then
      TIBXEstatusProcesosDetalle.Open;
end;

procedure TdmMovimientosDeInventario.TIBXMovimientosDeInventarioCalcFields(
  DataSet: TDataSet);
begin
   if DataSet.FieldByName('LINEA').AsString <> '' then
   begin
      dmIBData.TFiltroLineas.Filter := 'ID = '+DataSet.FieldByName('LINEA').AsString;
      DataSet.FieldByName('LINEA_DESCRIPCION').AsString := dmIBData.TFiltroLineas.FieldByName('DESCRIPCION').AsString;
   end
   else
      DataSet.FieldByName('LINEA_DESCRIPCION').AsString := '';
end;

end.
