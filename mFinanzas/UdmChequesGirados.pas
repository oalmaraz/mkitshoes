unit UdmChequesGirados;

interface

uses
  UTipos, URecords, UfrmAutorizar,  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBModulo, IBX.IBQuery, Db, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBStoredProc, System.Variants;

type
  TdmChequesGirados = class(TDataModule)
    TIBXChequesGirados: TIBTable;
    dsEncabezado: TDataSource;
    TIBXPreferencias: TIBTable;
    TIBXPreferenciasID: TIntegerField;
    TIBXPreferenciasNOMBRE: TIBStringField;
    TIBXPreferenciasTIPO: TIBStringField;
    TIBXPreferenciasVALOR: TIBStringField;
    dsPreferencias: TDataSource;
    TIBXChequesGiradosID: TIntegerField;
    TIBXChequesGiradosREFERENCIA: TIBStringField;
    TIBXChequesGiradosMONTO: TFloatField;
    TIBXChequesGiradosMONEDA: TIntegerField;
    TIBXChequesGiradosPROVEEDOR: TIntegerField;
    TIBXChequesGiradosPROVEEDOR_NOMBRE: TIBStringField;
    TIBXChequesGiradosFECHA_ALTA: TDateTimeField;
    TIBXChequesGiradosFECHA_APLICACION: TDateTimeField;
    TIBXChequesGiradosOBSERVACIONES: TBlobField;
    TIBXChequesGiradosFECHA_APLICACION_REAL: TDateTimeField;
    TIBXChequesGiradosSEL: TIBStringField;
    TIBXChequesGiradosTABLA_REFERENCIA: TIBStringField;
    TIBXChequesGiradosID_REFERENCIA: TIntegerField;
    TIBXChequesGiradosUSUARIO: TIntegerField;
    TIBXChequesGiradosAUTORIZO: TIntegerField;
    TIBXChequesGiradosESTATUS: TIBStringField;
    TIBXChequesGiradosCHEQUERA: TIntegerField;
    TIBXChequesGiradosBANCO: TIntegerField;
    TIBXChequesGiradosCONSECUTIVO: TIntegerField;
    qyIBXEstatusProcesos: TIBQuery;
    qyIBXEstatusProcesosID: TIntegerField;
    qyIBXEstatusProcesosNOMBRE: TIBStringField;
    qyIBXEstatusProcesosFORMA: TIntegerField;
    qyIBXEstatusProcesosESTATUS: TIBStringField;
    dsEstatusProcesos: TDataSource;
    TIBXEstatusProcesosDetalle: TIBTable;
    TIBXEstatusProcesosDetalleID: TIntegerField;
    TIBXEstatusProcesosDetallePROCESO: TIntegerField;
    TIBXEstatusProcesosDetalleESTATUS: TIBStringField;
    TIBXEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TIBXEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    TIBXMonedas: TIBTable;
    TIBXMonedasID: TIntegerField;
    TIBXMonedasCLAVE: TIBStringField;
    TIBXMonedasDESCRIPCION: TIBStringField;
    TIBXMonedasFECHA_ULT_ACT: TDateTimeField;
    TIBXMonedasPARIDAD: TFloatField;
    dsMonedas: TDataSource;
    qyIBXFechaServidor: TIBQuery;
    qyIBXFechaServidorR_FECHA: TDateTimeField;
    dsFechaServidor: TDataSource;
    spID: TIBStoredProc;
    spIBXEstatus: TIBStoredProc;
    qyChequeras: TIBQuery;
    dsChequeras: TDataSource;
    qyChequerasCUENTA: TIBStringField;
    qyChequerasSUCURSAL: TIBStringField;
    qyChequerasCLAVE: TIBStringField;
    qyChequerasNOMBRE: TIBStringField;
    qyChequerasID: TIntegerField;
    qyChequerasBANCO: TIntegerField;
    qyPendientes: TIBQuery;
    qyPendientesR_FECHA_APLICACION: TDateTimeField;
    qyPendientesR_REFERENCIA: TIBStringField;
    qyPendientesR_CHEQUERA: TIntegerField;
    qyPendientesR_BANCO: TIntegerField;
    qyPendientesR_CUENTA: TIBStringField;
    qyPendientesR_SUCURSAL: TIBStringField;
    qyPendientesR_MONTO: TFloatField;
    qyPendientesR_MONEDA: TIntegerField;
    qyPendientesR_MONEDA_DESCRIPCION: TIBStringField;
    qyPendientesR_PROVEEDOR: TIntegerField;
    qyPendientesR_PROVEEDOR_NOMBRE: TIBStringField;
    qyPendientesR_SEL: TIBStringField;
    qyPendientesR_ESTATUS: TIBStringField;
    qyPendientesR_CONSECUTIVO: TIntegerField;
    qyPendientesR_COLOR: TIBStringField;
    dsPendientes: TDataSource;
    qyPendientesR_ID: TIntegerField;
    qyPendientesR_BANCO_NOMBRE: TIBStringField;
    qyPendientesR_PROVEEDOR_CLAVE: TIBStringField;
    spSELECCIONAR_CHEQUEGIRADO: TIBStoredProc;
    qyPendientesR_MONEDA_CLAVE: TIBStringField;
    TIBXChequesGiradosABONO_CTA: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qyIBXEstatusProcesosAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    awrMONEDABASE : integer;
    function GetFECHA : TDatetime;
    function getBANCO : String100;
  public
    { Public declarations }
    procedure LoadCompFromBlob(AField: TBlobField; AComponent: TComponent);
    procedure SaveCompToBlob(AField: TBlobField; AComponent: TComponent);
    procedure Cargar(id: integer; var Datos: _ChequesGirados);
    function Guardar(var Datos : _ChequesGirados) : integer;
    procedure eliminar;
    procedure activarEstatus(p_forma : integer; p_estatus : string);
    procedure cargarEstatusEjecucion;
    function ejecucionEstatus(id : integer) : boolean;
    procedure refreshMonedas;
    procedure refreshChequeras;
    procedure refreshEncabezado;
    procedure refreshPreferencias;
    procedure refreshPendientes;
    procedure EjecutarSeleccionado;
  published
    property FECHA : TDatetime read GetFECHA;
    property MONEDABASE :integer read awrMONEDABASE write awrMONEDABASE;
    property BANCO : String100 read getBANCO;
  end;

var
  dmChequesGirados: TdmChequesGirados;

implementation

{$R *.DFM}

procedure TdmChequesGirados.DataModuleCreate(Sender: TObject);
begin
   dsEncabezado.DataSet             := TIBXChequesGirados;
   dsFechaServidor.DataSet          := qyIBXFechaServidor;
   dsEstatusProcesos.DataSet        := qyIBXEstatusProcesos;
   dsEstatusProcesosDetalle.DataSet := TIBXEstatusProcesosDetalle;
   dsMonedas.DataSet                := TIBXMonedas;
   dsPreferencias.DataSet           := TIBXPreferencias;
   dsChequeras.DataSet              := qyChequeras;

   refreshPreferencias;
   //Moneda Base
   dsPreferencias.DataSet.Filter := 'ID = 3';
   MONEDABASE := dsPreferencias.DataSet.FieldByName('VALOR').AsInteger;
end;

procedure TdmChequesGirados.EjecutarSeleccionado;
begin
   spSELECCIONAR_CHEQUEGIRADO.ParamByName('P_ID').AsInteger := dsPendientes.DataSet.FieldByName('R_ID').AsInteger;
   spSELECCIONAR_CHEQUEGIRADO.ExecProc;
   spSELECCIONAR_CHEQUEGIRADO.Transaction.CommitRetaining;
   refreshPendientes;
end;

procedure TdmChequesGirados.refreshPendientes;
begin
   qyPendientes.Close;
   qyPendientes.Open;
end;

procedure TdmChequesGirados.LoadCompFromBlob(AField: TBlobField; AComponent: TComponent);
{var
  Stream: TBlobStream;
  i: integer;
  }
begin
  {
  try

    Stream := TBlobStream.Create(AField, bmRead);
    try
      //delete the all child components
      for i := AComponent.ComponentCount - 1 downto 0 do
        AComponent.Components[i].Free;
      Stream.ReadComponentRes(AComponent);
    finally
      Stream.Free;
    end;
  except
    on EFOpenError do; //nothing;
  end;
  }
end;

procedure TdmChequesGirados.SaveCompToBlob(AField: TBlobField; AComponent: TComponent);
//var
  //Stream: TBlobStream;
  //CompName: string;
begin
{
  CompName := Copy(AComponent.ClassName, 2, 99);
  Stream := TBlobStream.Create(AField, bmWrite);
  try
    Stream.WriteComponentRes(CompName, AComponent);
  finally
    Stream.Free;
  end;
  }
end;

procedure TdmChequesGirados.Cargar(id: integer; var Datos: _ChequesGirados);
begin
   refreshEncabezado;
   dsEncabezado.DataSet.Filter := 'ID = '+IntToStr(Id);

   if not(dsEncabezado.DataSet.IsEmpty) then
   begin
      Datos.ID                    := dsEncabezado.DataSet.FieldByName('ID').AsInteger;
      Datos.REFERENCIA            := dsEncabezado.DataSet.FieldByName('REFERENCIA').AsString;
      Datos.MONTO                 := dsEncabezado.DataSet.FieldByName('MONTO').AsFloat;
      Datos.MONEDA                := dsEncabezado.DataSet.FieldByName('MONEDA').AsInteger;
      Datos.PROVEEDOR             := dsEncabezado.DataSet.FieldByName('PROVEEDOR').Value;
      if dsEncabezado.DataSet.FieldByName('PROVEEDOR').AsString <> '' then
         Datos.PROVEEDOR_CLAVE    := dsPendientes.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString
      else
         Datos.PROVEEDOR_CLAVE       :=  '<FALTA>';
      Datos.PROVEEDOR_NOMBRE      := dsEncabezado.DataSet.FieldByName('PROVEEDOR_NOMBRE').AsString;
      Datos.FECHA_ALTA            := dsEncabezado.DataSet.FieldByName('FECHA_ALTA').AsDatetime;
      Datos.FECHA_APLICACION      := dsEncabezado.DataSet.FieldByName('FECHA_APLICACION').AsDatetime;
      Datos.FECHA_APLICACION_REAL := dsEncabezado.DataSet.FieldByName('FECHA_APLICACION_REAL').AsDatetime;
      Datos.SEL                   := dsEncabezado.DataSet.FieldByName('SEL').AsString;
      Datos.TABLA_REFERENCIA      := dsEncabezado.DataSet.FieldByName('TABLA_REFERENCIA').AsString;
      Datos.ID_REFERENCIA         := dsEncabezado.DataSet.FieldByName('ID_REFERENCIA').Value;
      Datos.USUARIO               := dsEncabezado.DataSet.FieldByName('USUARIO').AsInteger;
      Datos.AUTORIZO              := dsEncabezado.DataSet.FieldByName('AUTORIZO').Value;
      Datos.ESTATUS               := dsEncabezado.DataSet.FieldByName('ESTATUS').AsString;
      Datos.CHEQUERA              := dsEncabezado.DataSet.FieldByName('CHEQUERA').AsInteger;
      Datos.BANCO                 := dsEncabezado.DataSet.FieldByName('BANCO').AsInteger;
      Datos.BANCO_NOMBRE          := dsChequeras.DataSet.FieldByName('NOMBRE').AsString;
      Datos.CONSECUTIVO           := dsEncabezado.DataSet.FieldByName('CONSECUTIVO').AsInteger;
      Datos.ABONO_CTA             := dsEncabezado.DataSet.FieldByName('ABONO_CTA').AsString;

      Datos.OBSERVACIONES.Clear;
      TBlobField(dsEncabezado.DataSet.FieldByName('OBSERVACIONES')).SaveToStream(Datos.OBSERVACIONES);
   end
   else
      begin
         Datos.ID                    := -1;
         Datos.REFERENCIA            := '';
         Datos.MONTO                 := 0.00;
         if MONEDABASE <> 0 then
            Datos.MONEDA             := MONEDABASE
         else
            Datos.MONEDA             := -3;

         Datos.PROVEEDOR             := 0;
         Datos.PROVEEDOR_CLAVE       := '<FALTA>';
         Datos.PROVEEDOR_NOMBRE      := '<FALTA>';
         Datos.FECHA_ALTA            := FECHA;
         Datos.FECHA_APLICACION      := FECHA;
         Datos.FECHA_APLICACION_REAL := FECHA;
         Datos.SEL                   := 'No';
         Datos.TABLA_REFERENCIA      := '';;
         Datos.ID_REFERENCIA         := null;
//         Datos.USUARIO               := 0;
         Datos.AUTORIZO              := null;
         Datos.ESTATUS               := 'Pendiente de Pago';
         Datos.CHEQUERA              := 0;
         Datos.BANCO                 := 0;
         Datos.BANCO_NOMBRE          := '';
         Datos.CONSECUTIVO           := 0;
         Datos.ABONO_CTA             := 'No';

         Datos.OBSERVACIONES.Clear;
      end
end;

function TdmChequesGirados.Guardar(var Datos : _ChequesGirados) : integer;
var
   tmp : integer;
begin
   tmp := -1;

   case Datos.ID of
     -1 : begin //registro nuevo
             spID.ExecProc;
             spID.Transaction.CommitRetaining;

             TIBXChequesGirados.Insert;
             TIBXChequesGirados.FieldByName('ID').AsInteger                     := spID.ParamByName('R_ID').AsInteger;
             TIBXChequesGirados.FieldByName('REFERENCIA').AsString              := Datos.REFERENCIA;
             TIBXChequesGirados.FieldByName('MONTO').AsFloat                    := Datos.MONTO;
             TIBXChequesGirados.FieldByName('MONEDA').AsInteger                 := Datos.MONEDA;
             TIBXChequesGirados.FieldByName('PROVEEDOR').Value                  := Datos.PROVEEDOR;
             TIBXChequesGirados.FieldByName('PROVEEDOR_NOMBRE').AsString        := Datos.PROVEEDOR_NOMBRE;
             TIBXChequesGirados.FieldByName('FECHA_ALTA').AsDatetime            := Datos.FECHA_ALTA;
             TIBXChequesGirados.FieldByName('FECHA_APLICACION').AsDatetime      := Datos.FECHA_APLICACION;
             TIBXChequesGirados.FieldByName('SEL').AsString                     := Datos.SEL;
             TIBXChequesGirados.FieldByName('USUARIO').AsInteger                := Datos.USUARIO;
             TIBXChequesGirados.FieldByName('ESTATUS').AsString                 := Datos.ESTATUS;
             TIBXChequesGirados.FieldByName('CHEQUERA').AsInteger               := Datos.CHEQUERA;
             TIBXChequesGirados.FieldByName('BANCO').AsInteger                  := Datos.BANCO;
             TIBXChequesGirados.FieldByName('CONSECUTIVO').asInteger            := Datos.CONSECUTIVO;
             TIBXChequesGirados.FieldByName('ABONO_CTA').AsString                := Datos.ABONO_CTA;

             Datos.OBSERVACIONES.Position := 0;
             TIBXChequesGiradosOBSERVACIONES.LoadFromStream(Datos.OBSERVACIONES);
             TIBXChequesGirados.Post;
             TIBXChequesGirados.Transaction.CommitRetaining;
             tmp := spID.ParamByName('R_ID').AsInteger;
          end;
    else
       begin //registro modificado
          TIBXChequesGirados.Edit;
          TIBXChequesGirados.FieldByName('REFERENCIA').AsString         := Datos.REFERENCIA;
          TIBXChequesGirados.FieldByName('MONTO').AsFloat               := Datos.MONTO;
          TIBXChequesGirados.FieldByName('MONEDA').AsInteger            := Datos.MONEDA;
          TIBXChequesGirados.FieldByName('PROVEEDOR').Value             := Datos.PROVEEDOR;
          TIBXChequesGirados.FieldByName('PROVEEDOR_NOMBRE').AsString   := Datos.PROVEEDOR_NOMBRE;
          TIBXChequesGirados.FieldByName('FECHA_ALTA').AsDatetime       := Datos.FECHA_ALTA;
          TIBXChequesGirados.FieldByName('FECHA_APLICACION').AsDatetime := Datos.FECHA_APLICACION;
          TIBXChequesGirados.FieldByName('SEL').AsString                := Datos.SEL;
          TIBXChequesGirados.FieldByName('ESTATUS').AsString            := Datos.ESTATUS;
          TIBXChequesGirados.FieldByName('CHEQUERA').AsInteger          := Datos.CHEQUERA;
          TIBXChequesGirados.FieldByName('BANCO').AsInteger             := Datos.BANCO;
          TIBXChequesGirados.FieldByName('CONSECUTIVO').AsInteger       := Datos.CONSECUTIVO;
          TIBXChequesGirados.FieldByName('ABONO_CTA').AsString          := Datos.ABONO_CTA;

          Datos.OBSERVACIONES.Position := 0;
          TIBXChequesGiradosOBSERVACIONES.LoadFromStream(Datos.OBSERVACIONES);
          TIBXChequesGirados.Post;
          TIBXChequesGirados.Transaction.CommitRetaining;
       end;
   end;

   Result := tmp;
end;

procedure TdmChequesGirados.eliminar;
begin
   TIBXChequesGirados.Delete;
   TIBXChequesGirados.Transaction.CommitRetaining;
end;

procedure TdmChequesGirados.activarEstatus(p_forma : integer; p_estatus : string);
begin
   qyIBXEstatusProcesos.Close;
   qyIBXEstatusProcesos.ParamByName('P_FORMA').AsInteger  := p_forma;
   qyIBXEstatusProcesos.ParamByName('P_ESTATUS').AsString := p_estatus;
   qyIBXEstatusProcesos.Open;
end;

procedure TdmChequesGirados.cargarEstatusEjecucion;
begin
   spIBXEstatus.Params.Clear;
   spIBXEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
   spIBXEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
end;

function TdmChequesGirados.ejecucionEstatus(id : integer) : boolean;
var
   autorizar : string;
   ejecutar  : boolean;
   tmp       : boolean;
   frmAutorizar : TfrmAutorizar;
begin
  ejecutar  := true;
  tmp       := false;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  if autorizar = 'Si' then
  begin
     frmAutorizar := TfrmAutorizar.Crear(Application, 2);
     frmAutorizar.ShowModal;
     ejecutar := frmAutorizar.autorizacion;
     frmAutorizar.Free;
  end;

  if ejecutar then
  begin
     spIBXEstatus.ParamByName('P_ID').AsInteger := id;
     spIBXEstatus.ExecProc;
     spIBXEstatus.Transaction.CommitRetaining;
     refreshEncabezado;
     tmp := true;
  end;
  Result := tmp;
end;

procedure TdmChequesGirados.refreshMonedas;
begin
   if dsMonedas.DataSet.State = dsInactive then
      dsMonedas.DataSet.Open
   else
      begin
         dsMonedas.DataSet.Close;
         dsMonedas.DataSet.Open;
      end;
end;

procedure TdmChequesGirados.refreshChequeras;
begin
   if dsChequeras.DataSet.State = dsInactive then
      dsChequeras.DataSet.Open
   else
      begin
         dsChequeras.DataSet.Close;
         dsChequeras.DataSet.Open;
      end;
end;

procedure TdmChequesGirados.refreshEncabezado;
begin
   if dsEncabezado.DataSet.State = dsInactive then
      dsEncabezado.DataSet.Open
   else
      begin
         dsEncabezado.DataSet.Close;
         dsEncabezado.DataSet.Open;
      end;
end;

procedure TdmChequesGirados.refreshPreferencias;
begin
   if dsPreferencias.DataSet.State = dsInactive then
      dsPreferencias.DataSet.Open
   else
      begin
         dsPreferencias.DataSet.Close;
         dsPreferencias.DataSet.Open;
      end;
end;

function TdmChequesGirados.getBANCO : String100;
begin
   Result := dsChequeras.DataSet.FieldByName('NOMBRE').AsString;
end;

function TdmChequesGirados.GetFECHA : TDatetime;
begin
   dsFechaServidor.DataSet.Close;
   dsFechaServidor.DataSet.Open;
   Result := dsFechaServidor.DataSet.FieldByName('R_FECHA').AsDatetime;
end;

procedure TdmChequesGirados.qyIBXEstatusProcesosAfterOpen(
  DataSet: TDataSet);
begin
   if TIBXEstatusProcesosDetalle.State = dsInactive then
      TIBXEstatusProcesosDetalle.Open;
end;

end.
