unit UdmEstadoDeCuentas;

interface

uses
  UTipos, URecords, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBModulo, Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBStoredProc, IBX.IBTable;

type
  TdmEstadoDeCuentas = class(TDataModule)
    qyEstadoDeCuentaEnc: TIBQuery;
    dsEstadoDeCuentaEnc: TDataSource;
    qyIBXFechaServidor: TIBQuery;
    qyIBXFechaServidorR_FECHA: TDateTimeField;
    dsFechaServidor: TDataSource;
    qyEstadoDeCuentaEncR_SALDO_CLIENTE: TFloatField;
    qyEstadoDeCuentaEncR_SALDO_EXTENSION: TFloatField;
    qyEstadoDeCuentaEncR_SALDO_TOTAL: TFloatField;
    qyEstadoDeCuentaEncR_TOTAL_VENCIDO: TFloatField;
    qyEstadoDeCuentaEncR_SALDO_ALMACEN_VENCIDO: TFloatField;
    qyEstadoDeCuentaEncR_FECHA_ULT_COMPRA: TDateTimeField;
    qyEstadoDeCuentaEncR_FECHA_ULT_PAGO: TDateTimeField;
    qyEstadoDeCuentaEncR_LIMITE_CREDITO: TFloatField;
    qyEstadoDeCuentaEncR_FIRMA: TBlobField;
    qyEstadoDeCuentaEncR_FOTO: TBlobField;
    qyEstadoDeCuentaEncR_CLAVE: TIBStringField;
    qyEstadoDeCuentaEncR_NOMBRE: TIBStringField;
    qyEstadoDeCuentaEncR_TELEFONO: TIBStringField;
    qyVer_Datos_Cajero: TIBQuery;
    qyVer_Datos_CajeroR_ID: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN: TIntegerField;
    qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField;
    qyVer_Datos_CajeroR_USUARIO: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField;
    qyVer_Datos_CajeroR_BAJA: TIBStringField;
    qyVer_Datos_CajeroR_ESTATUS: TIBStringField;
    qyVer_Datos_CajeroR_REGISTROS: TIntegerField;
    qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField;
    qyVer_Datos_CajeroR_EMPRESA_NOMBRE: TIBStringField;
    qyVer_Datos_CajeroR_FECHA_SERVIDOR: TDateTimeField;
    qyVer_Datos_CajeroR_NIVEL: TIntegerField;
    qyVer_Datos_CajeroR_ALMACEN_NOMBRE: TIBStringField;
    dsVer_Datos_Cajero: TDataSource;
    qyUsuario: TIBQuery;
    qyUsuarioNOMBRE: TIBStringField;
    dsUsuario: TDataSource;
    qyPorCobrar: TIBQuery;
    qyCobrado: TIBQuery;
    qyTodos: TIBQuery;
    dsDetalle: TDataSource;
    qyPorCobrarR_ID: TIntegerField;
    qyPorCobrarR_REFERENCIA: TIBStringField;
    qyPorCobrarR_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qyPorCobrarR_DOCUMENTO: TIntegerField;
    qyPorCobrarR_CLIENTE: TIntegerField;
    qyPorCobrarR_CLIENTE_CLAVE: TIBStringField;
    qyPorCobrarR_CLIENTE_NOMBRE: TIBStringField;
    qyPorCobrarR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField;
    qyPorCobrarR_REF_PAGO_NOMBRE: TIBStringField;
    qyPorCobrarR_FECHA: TDateTimeField;
    qyPorCobrarR_FECHA_VENCIMIENTO: TDateTimeField;
    qyPorCobrarR_ALMACEN: TIntegerField;
    qyPorCobrarR_ALMACEN_NOMBRE: TIBStringField;
    qyPorCobrarR_IMPORTE_INICIAL: TFloatField;
    qyPorCobrarR_SALDO_ACTUAL: TFloatField;
    qyPorCobrarR_FINANCIAMIENTO: TFloatField;
    qyPorCobrarR_GASTOS: TFloatField;
    qyPorCobrarR_ETAPA_COBRANZA: TIntegerField;
    qyPorCobrarR_MORATORIOS: TFloatField;
    qyPorCobrarR_FECHA_ULM_ACT: TDateTimeField;
    qyPorCobrarR_ESTATUS: TIBStringField;
    qyPorCobrarR_EXTENSION: TIntegerField;
    qyPorCobrarR_EXTENSION_CLAVE: TIBStringField;
    qyPorCobrarR_EXTENSION_NOMBRE: TIBStringField;
    qyPorCobrarR_OTROS: TFloatField;
    qyPorCobrarR_SEL: TIBStringField;
    qyPorCobrarR_VENCIMIENTOS: TIntegerField;
    qyPorCobrarR_PAGO_MODIFICADO: TFloatField;
    qyPorCobrarR_COLOR: TIBStringField;
    qyPorCobrarR_NCREDITO_SINAFECTAR: TFloatField;
    qyPorCobrarR_NCREDITO_AFECTADAS: TFloatField;
    qyPorCobrarR_NCREDITO_SINAFECTAR_COUNT: TIntegerField;
    qyPorCobrarR_NCREDITO_AFECTADAS_COUNT: TIntegerField;
    qyPorCobrarR_NCREDITO_SINAFECTAR_ACUM: TFloatField;
    qyPorCobrarR_NCREDITO_AFECTADAS_ACUM: TFloatField;
    qyPorCobrarR_NCARGO_SINAFECTAR: TFloatField;
    qyPorCobrarR_NCARGO_AFECTADAS: TFloatField;
    qyPorCobrarR_NCARGO_SINAFECTAR_COUNT: TIntegerField;
    qyPorCobrarR_NCARGO_AFECTADAS_COUNT: TIntegerField;
    qyPorCobrarR_NCARGO_SINAFECTAR_ACUM: TFloatField;
    qyPorCobrarR_NCARGO_AFECTADAS_ACUM: TFloatField;
    qyPorCobrarR_PAGO_MODIFICADO_ACUM: TFloatField;
    qyPorCobrarR_SALDO: TFloatField;
    qyCobradoR_ID: TIntegerField;
    qyCobradoR_REFERENCIA: TIBStringField;
    qyCobradoR_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qyCobradoR_DOCUMENTO: TIntegerField;
    qyCobradoR_CLIENTE: TIntegerField;
    qyCobradoR_CLIENTE_CLAVE: TIBStringField;
    qyCobradoR_CLIENTE_NOMBRE: TIBStringField;
    qyCobradoR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField;
    qyCobradoR_REF_PAGO_NOMBRE: TIBStringField;
    qyCobradoR_FECHA: TDateTimeField;
    qyCobradoR_FECHA_VENCIMIENTO: TDateTimeField;
    qyCobradoR_ALMACEN: TIntegerField;
    qyCobradoR_ALMACEN_NOMBRE: TIBStringField;
    qyCobradoR_IMPORTE_INICIAL: TFloatField;
    qyCobradoR_SALDO_ACTUAL: TFloatField;
    qyCobradoR_FINANCIAMIENTO: TFloatField;
    qyCobradoR_GASTOS: TFloatField;
    qyCobradoR_ETAPA_COBRANZA: TIntegerField;
    qyCobradoR_MORATORIOS: TFloatField;
    qyCobradoR_FECHA_ULM_ACT: TDateTimeField;
    qyCobradoR_ESTATUS: TIBStringField;
    qyCobradoR_EXTENSION: TIntegerField;
    qyCobradoR_EXTENSION_CLAVE: TIBStringField;
    qyCobradoR_EXTENSION_NOMBRE: TIBStringField;
    qyCobradoR_OTROS: TFloatField;
    qyCobradoR_SEL: TIBStringField;
    qyCobradoR_VENCIMIENTOS: TIntegerField;
    qyCobradoR_PAGO_MODIFICADO: TFloatField;
    qyCobradoR_COLOR: TIBStringField;
    qyCobradoR_NCREDITO_SINAFECTAR: TFloatField;
    qyCobradoR_NCREDITO_AFECTADAS: TFloatField;
    qyCobradoR_NCREDITO_SINAFECTAR_COUNT: TIntegerField;
    qyCobradoR_NCREDITO_AFECTADAS_COUNT: TIntegerField;
    qyCobradoR_NCREDITO_SINAFECTAR_ACUM: TFloatField;
    qyCobradoR_NCREDITO_AFECTADAS_ACUM: TFloatField;
    qyCobradoR_NCARGO_SINAFECTAR: TFloatField;
    qyCobradoR_NCARGO_AFECTADAS: TFloatField;
    qyCobradoR_NCARGO_SINAFECTAR_COUNT: TIntegerField;
    qyCobradoR_NCARGO_AFECTADAS_COUNT: TIntegerField;
    qyCobradoR_NCARGO_SINAFECTAR_ACUM: TFloatField;
    qyCobradoR_NCARGO_AFECTADAS_ACUM: TFloatField;
    qyCobradoR_PAGO_MODIFICADO_ACUM: TFloatField;
    qyCobradoR_SALDO: TFloatField;
    qyTodosR_ID: TIntegerField;
    qyTodosR_REFERENCIA: TIBStringField;
    qyTodosR_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qyTodosR_DOCUMENTO: TIntegerField;
    qyTodosR_CLIENTE: TIntegerField;
    qyTodosR_CLIENTE_CLAVE: TIBStringField;
    qyTodosR_CLIENTE_NOMBRE: TIBStringField;
    qyTodosR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField;
    qyTodosR_REF_PAGO_NOMBRE: TIBStringField;
    qyTodosR_FECHA: TDateTimeField;
    qyTodosR_FECHA_VENCIMIENTO: TDateTimeField;
    qyTodosR_ALMACEN: TIntegerField;
    qyTodosR_ALMACEN_NOMBRE: TIBStringField;
    qyTodosR_IMPORTE_INICIAL: TFloatField;
    qyTodosR_SALDO_ACTUAL: TFloatField;
    qyTodosR_FINANCIAMIENTO: TFloatField;
    qyTodosR_GASTOS: TFloatField;
    qyTodosR_ETAPA_COBRANZA: TIntegerField;
    qyTodosR_MORATORIOS: TFloatField;
    qyTodosR_FECHA_ULM_ACT: TDateTimeField;
    qyTodosR_ESTATUS: TIBStringField;
    qyTodosR_EXTENSION: TIntegerField;
    qyTodosR_EXTENSION_CLAVE: TIBStringField;
    qyTodosR_EXTENSION_NOMBRE: TIBStringField;
    qyTodosR_OTROS: TFloatField;
    qyTodosR_SEL: TIBStringField;
    qyTodosR_VENCIMIENTOS: TIntegerField;
    qyTodosR_PAGO_MODIFICADO: TFloatField;
    qyTodosR_COLOR: TIBStringField;
    qyTodosR_NCREDITO_SINAFECTAR: TFloatField;
    qyTodosR_NCREDITO_AFECTADAS: TFloatField;
    qyTodosR_NCREDITO_SINAFECTAR_COUNT: TIntegerField;
    qyTodosR_NCREDITO_AFECTADAS_COUNT: TIntegerField;
    qyTodosR_NCREDITO_SINAFECTAR_ACUM: TFloatField;
    qyTodosR_NCREDITO_AFECTADAS_ACUM: TFloatField;
    qyTodosR_NCARGO_SINAFECTAR: TFloatField;
    qyTodosR_NCARGO_AFECTADAS: TFloatField;
    qyTodosR_NCARGO_SINAFECTAR_COUNT: TIntegerField;
    qyTodosR_NCARGO_AFECTADAS_COUNT: TIntegerField;
    qyTodosR_NCARGO_SINAFECTAR_ACUM: TFloatField;
    qyTodosR_NCARGO_AFECTADAS_ACUM: TFloatField;
    qyTodosR_PAGO_MODIFICADO_ACUM: TFloatField;
    qyTodosR_SALDO: TFloatField;
    spSELECCION_AUTOMATICA: TIBStoredProc;
    TIBXPreferencias: TIBTable;
    TIBXPreferenciasID: TIntegerField;
    TIBXPreferenciasNOMBRE: TIBStringField;
    TIBXPreferenciasTIPO: TIBStringField;
    TIBXPreferenciasVALOR: TIBStringField;
    dsPreferencias: TDataSource;
    spSELECCION_VENCIDOS: TIBStoredProc;
    spSELECCIONAR_PAGO: TIBStoredProc;
    spQUITAR_SELECCION: TIBStoredProc;
    spCOLUMNA_MODIFICADO: TIBStoredProc;
    spCREA_NC_ACUMULADO: TIBStoredProc;
    spCREAR_CXC_MANUAL: TIBStoredProc;
    spCREAR_CXC_AUTOMATICA: TIBStoredProc;
    spCREAR_CXC_MODIFICADO: TIBStoredProc;
    spP_PAGOS_CANCELAR2: TIBStoredProc;
    spMODIFICAR_CXC_PAGO: TIBStoredProc;
    qyPorCobrarR_DESC_PORC_GLOBAL: TFloatField;
    qyCobradoR_DESC_PORC_GLOBAL: TFloatField;
    qyTodosR_DESC_PORC_GLOBAL: TFloatField;
    spSELECCION_MANUAL: TIBStoredProc;
    spSELECCION_MODIFICADO: TIBStoredProc;
    spCancelar: TIBStoredProc;
    spCXC_SALDOS_MINIMOS: TIBStoredProc;
    qyPorCobrarR_MONEDA: TIntegerField;
    qyPorCobrarR_MONEDA_CLAVE: TIBStringField;
    qyCobradoR_MONEDA: TIntegerField;
    qyCobradoR_MONEDA_CLAVE: TIBStringField;
    qyTodosR_MONEDA: TIntegerField;
    qyTodosR_MONEDA_CLAVE: TIBStringField;
    qyPorCobrarR_ETAPA_COBRANZA_C: TIBStringField;
    qyCobradoR_ETAPA_COBRANZA_C: TIBStringField;
    qyTodosR_ETAPA_COBRANZA_C: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    awrDiferentes : boolean;
    function GetFECHA : TDatetime;
    procedure refreshPreferencias;
  public
    { Public declarations }
    procedure LoadDatosCaja(var Datos : _EstadoDeCuentas);
    procedure LoadDatoUsuario(var Datos : _EstadoDeCuentas);
    procedure Usuario(valor : integer);
    procedure DatosCaja(valor : integer);
    procedure Cliente(var Datos : _EstadoDeCuentas);
    procedure Detalle(var Datos : _EstadoDeCuentas);
    procedure EjecutarAutomatico(var Datos : _EstadoDeCuentas);
    procedure EjecutarManual(var Datos : _EstadoDeCuentas);
    procedure EjecutarVencido(var Datos : _EstadoDeCuentas);
    procedure EjecutarModificado(var Datos : _EstadoDeCuentas);
    procedure EjecutarSeleccionado;
    procedure EjecutarSaldoMinimo;
    procedure iniciarParametrosDetalle(var Datos : _EstadoDeCuentas);
    procedure CancelarTipoPago(valor : integer);
    procedure CancelarCXC;
    procedure pagoModificado(valor : string);
    function crearTipoPago(valor : string; var Datos : _EstadoDeCuentas) : integer;
  published
    property FECHA   : TDatetime read GetFECHA;
    property DIFERENTES : Boolean read awrDiferentes write awrDiferentes;
  end;

{var
  dmEstadoDeCuentas: TdmEstadoDeCuentas;}

implementation

{$R *.DFM}

procedure TdmEstadoDeCuentas.CancelarCXC;
begin
   spCancelar.ParamByName('P_ID').AsInteger := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
   spCancelar.ExecProc;
   spCancelar.Transaction.CommitRetaining;
end;

procedure TdmEstadoDeCuentas.pagoModificado(valor : string);
begin
   spMODIFICAR_CXC_PAGO.ParamByName('P_ID').AsInteger     := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
   spMODIFICAR_CXC_PAGO.ParamByName('P_IMPORTE').AsString := valor;
   spMODIFICAR_CXC_PAGO.ExecProc;
   spMODIFICAR_CXC_PAGO.Transaction.CommitRetaining;
   dsDetalle.DataSet.Close;
   dsDetalle.DataSet.Open;
end;

procedure TdmEstadoDeCuentas.CancelarTipoPago(valor : integer);
begin
{         if pago = tpSeleccionado then//Cancelar Nota de credito acumulado
         begin
            spP_NC_SIN_AFECTAR3.ParamByName('P_ID').AsInteger := spCREA_NC_ACUMULADO.ParamByName('R_ID').AsInteger;
            spP_NC_SIN_AFECTAR3.ExecProc;
            spP_NC_SIN_AFECTAR3.Transaction.CommitRetaining;}
         //Cancelar la forma de pago
   spP_PAGOS_CANCELAR2.ParamByName('P_ID').AsInteger := valor;
   spP_PAGOS_CANCELAR2.ExecProc;
   spP_PAGOS_CANCELAR2.Transaction.CommitRetaining;
end;

function TdmEstadoDeCuentas.crearTipoPago(valor : string; var Datos : _EstadoDeCuentas) : integer;
var
   tmp : integer;
begin
   tmp := 0;
{   //crear nota de credito (acumulada) y aplicarla
   TIBXPreferencias.Filter := 'ID = 49';//Crear N.Credito(acumulada) y aplicar en CXC
   if UpperCase(TIBXPreferencias.FieldByName('VALOR').AsString) = 'SI' then
   begin
//->      idClaveNC.Entrada := '';
//->      idClaveNC.Execute;
      spCREA_NC_ACUMULADO.ParamByName('P_CLIENTE').AsInteger    := Datos.CLIENTE;
      spCREA_NC_ACUMULADO.ParamByName('P_CAJERO').AsInteger     := Datos.USUARIO;
//->      spCREA_NC_ACUMULADO.ParamByName('P_REFERENCIA').AsString  := idClaveNC.Entrada;
      spCREA_NC_ACUMULADO.ExecProc;
      spCREA_NC_ACUMULADO.Transaction.CommitRetaining;
//->      meNC.Mensaje2 := 'id nc ' + spCREA_NC_ACUMULADO.ParamByName('R_ID').AsString;
//->      meNC.Execute;
   end;}


   if (valor = 'MANUAL') then
   begin
      spCREAR_CXC_MANUAL.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
      spCREAR_CXC_MANUAL.ParamByName('P_CAJERO').AsInteger  := Datos.USUARIO;
      spCREAR_CXC_MANUAL.ParamByName('P_MONEDA').AsInteger  := Datos.MONEDA;
      spCREAR_CXC_MANUAL.ExecProc;
      spCREAR_CXC_MANUAL.Transaction.CommitRetaining;
      tmp := spCREAR_CXC_MANUAL.ParamByName('R_CXC_PAGO').AsInteger;
   end
   else
      if valor = 'AUTOMATICO' then
      begin
         spCREAR_CXC_AUTOMATICA.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
         spCREAR_CXC_AUTOMATICA.ParamByName('P_CAJERO').AsInteger  := Datos.USUARIO;
         spCREAR_CXC_AUTOMATICA.ParamByName('P_MONEDA').AsInteger  := Datos.MONEDA;
         spCREAR_CXC_AUTOMATICA.ParamByName('P_TOTAL').AsFloat     := Datos.IMPORTE_A_PAGAR;
         spCREAR_CXC_AUTOMATICA.ParamByName('P_RESTO').AsFloat     := Datos.RESTO;
         spCREAR_CXC_AUTOMATICA.ExecProc;
         spCREAR_CXC_AUTOMATICA.Transaction.CommitRetaining;
         tmp := spCREAR_CXC_AUTOMATICA.ParamByName('R_CXC_PAGO').AsInteger;
      end
      else
         if valor = 'MODIFICADO' then
         begin
            //crear pago seleccionado
            spCREAR_CXC_MODIFICADO.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
            spCREAR_CXC_MODIFICADO.ParamByName('P_CAJERO').AsInteger  := Datos.USUARIO;
            spCREAR_CXC_MODIFICADO.ParamByName('P_MONEDA').AsInteger  := Datos.MONEDA;
            spCREAR_CXC_MODIFICADO.ExecProc;
            spCREAR_CXC_MODIFICADO.Transaction.CommitRetaining;
            tmp  := spCREAR_CXC_MODIFICADO.ParamByName('R_CXC_PAGO').AsInteger;
         end;
   Result := tmp;
end;

procedure TdmEstadoDeCuentas.EjecutarSaldoMinimo;
begin
   spCXC_SALDOS_MINIMOS.ExecProc;
   spCXC_SALDOS_MINIMOS.Transaction.CommitRetaining;
   dsDetalle.DataSet.Close;
   dsDetalle.DataSet.Open;
end;

procedure TdmEstadoDeCuentas.EjecutarSeleccionado;
begin
   spSELECCIONAR_PAGO.ParamByName('P_ID').AsInteger := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
   spSELECCIONAR_PAGO.ExecProc;
   spSELECCIONAR_PAGO.Transaction.CommitRetaining;
   dsDetalle.DataSet.Close;
   dsDetalle.DataSet.Open;
end;

procedure TdmEstadoDeCuentas.refreshPreferencias;
begin
   if dsPreferencias.DataSet.State = dsInactive then
      dsPreferencias.DataSet.Open
   else
      begin
         dsPreferencias.DataSet.Close;
         dsPreferencias.DataSet.Open;
      end;
end;

procedure TdmEstadoDeCuentas.EjecutarAutomatico(var Datos : _EstadoDeCuentas);
begin
  spSELECCION_AUTOMATICA.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
  spSELECCION_AUTOMATICA.ParamByName('P_CANTIDAD').AsFloat  := Datos.IMPORTE_A_PAGAR;
  spSELECCION_AUTOMATICA.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
  spSELECCION_AUTOMATICA.ExecProc;
  spSELECCION_AUTOMATICA.Transaction.CommitRetaining;
  Datos.RESTO := spSELECCION_AUTOMATICA.ParamByName('R_RESTO').AsFloat;
  Detalle(Datos);
end;

procedure TdmEstadoDeCuentas.EjecutarManual(var Datos : _EstadoDeCuentas);
begin
   spSELECCION_MANUAL.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
   spSELECCION_MANUAL.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
   spSELECCION_MANUAL.ExecProc;
   Datos.IMPORTE_A_PAGAR := spSELECCION_MANUAL.ParamByName('R_TOTAL').AsFloat;
   Datos.RESTO           := 0.00;
end;

procedure TdmEstadoDeCuentas.EjecutarVencido(var Datos : _EstadoDeCuentas);
begin
   spSELECCION_VENCIDOS.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
   spSELECCION_VENCIDOS.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
   spSELECCION_VENCIDOS.ExecProc;
   spSELECCION_VENCIDOS.Transaction.CommitRetaining;
   Datos.IMPORTE_A_PAGAR := spSELECCION_VENCIDOS.ParamByName('R_TOTAL_VENCIDO').AsFloat;
   Datos.RESTO           := 0.00;
   Detalle(Datos);
end;

procedure TdmEstadoDeCuentas.EjecutarModificado(var Datos : _EstadoDeCuentas);
begin
   spSELECCION_MODIFICADO.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
   spSELECCION_MODIFICADO.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
   spSELECCION_MODIFICADO.ExecProc;
   Datos.IMPORTE_A_PAGAR := spSELECCION_MODIFICADO.ParamByName('R_TOTAL').AsFloat;
   Datos.RESTO           := 0.00;
end;

procedure TdmEstadoDeCuentas.iniciarParametrosDetalle(var Datos : _EstadoDeCuentas);
begin
   //quitar seleccion, si hay previamente.
   TIBXPreferencias.Filter := 'ID = 38';//Quitar seleccion en cxc
   if UpperCase(TIBXPreferencias.FieldByName('VALOR').AsString) = 'SI' then
   begin
      spQUITAR_SELECCION.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
      spQUITAR_SELECCION.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
      spQUITAR_SELECCION.ExecProc;
      spQUITAR_SELECCION.Transaction.CommitRetaining;
   end;
   //pasar saldo a pago modificado
   spCOLUMNA_MODIFICADO.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
   spCOLUMNA_MODIFICADO.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
   spCOLUMNA_MODIFICADO.ExecProc;
   spCOLUMNA_MODIFICADO.Transaction.CommitRetaining;
end;

procedure TdmEstadoDeCuentas.Cliente(var Datos : _EstadoDeCuentas);
begin
   //encabezado
   qyEstadoDeCuentaEnc.Close;
   qyEstadoDeCuentaEnc.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
   qyEstadoDeCuentaEnc.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
   qyEstadoDeCuentaEnc.Open;
   Datos.FECHA_ULT_COMPRA := qyEstadoDeCuentaEnc.FieldByName('R_FECHA_ULT_COMPRA').AsDatetime;
   Datos.FECHA_ULT_PAGO   := qyEstadoDeCuentaEnc.FieldByName('R_FECHA_ULT_PAGO').AsDateTime;
   Datos.LIMITE_CREDITO   := qyEstadoDeCuentaEnc.FieldByName('R_LIMITE_CREDITO').AsFloat;
   Datos.SALDO_CLIENTE    := qyEstadoDeCuentaEnc.FieldByName('R_SALDO_CLIENTE').AsFloat;
   Datos.SALDO_EXTENSION  := qyEstadoDeCuentaEnc.FieldByName('R_SALDO_EXTENSION').AsFloat;
   Datos.SALDO_T_VENCIDO  := qyEstadoDeCuentaEnc.FieldByName('R_TOTAL_VENCIDO').AsFloat;
   Datos.SALDO_VENCIDO    := qyEstadoDeCuentaEnc.FieldByName('R_SALDO_ALMACEN_VENCIDO').AsFloat;
   Datos.SALDO_TOTAL      := qyEstadoDeCuentaEnc.FieldByName('R_SALDO_TOTAL').AsFloat;
   Datos.TELEFONO         := qyEstadoDeCuentaEnc.FieldByName('R_TELEFONO').AsString;

   Datos.FOTO.Clear;
   TBlobField(qyEstadoDeCuentaEnc.FieldByName('R_FOTO')).SaveToStream(Datos.FOTO);
   Datos.FIRMA.Clear;
   TBlobField(qyEstadoDeCuentaEnc.FieldByName('R_FIRMA')).SaveToStream(Datos.FIRMA);
   Detalle(Datos);
end;

procedure TdmEstadoDeCuentas.Detalle(var Datos : _EstadoDeCuentas);
begin
   //detalle
   if Datos.ESTATUS = 'Por Cobrar' then
   begin
      dsDetalle.DataSet := qyPorCobrar;
      qyPorCobrar.Close;
      qyPorCobrar.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
      qyPorCobrar.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
      qyPorCobrar.ParamByName('P_TODOS').AsString    := Datos.TODOS;
      qyPorCobrar.Open;
   end
   else
   if Datos.ESTATUS = 'Cobrado' then
   begin
      dsDetalle.DataSet := qyCobrado;
      qyCobrado.Close;
      qyCobrado.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
      qyCobrado.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
      qyCobrado.ParamByName('P_TODOS').AsString    := Datos.TODOS;
      qyCobrado.Open;
   end
   else
   if Datos.ESTATUS = 'Ambos' then
   begin
      dsDetalle.DataSet := qyTodos;
      qyTodos.Close;
      qyTodos.ParamByName('P_CLIENTE').AsInteger := Datos.CLIENTE;
      qyTodos.ParamByName('P_ALMACEN').AsInteger := Datos.ALMACEN;
      qyTodos.ParamByName('P_TODOS').AsString    := Datos.TODOS;
      qyTodos.Open;
   end;
end;

procedure TdmEstadoDeCuentas.LoadDatoUsuario(var Datos : _EstadoDeCuentas);
begin
   if not(dsUsuario.DataSet.IsEmpty) then
   begin
      Datos.USUARIO_NOMBRE := dsUsuario.DataSet.FieldByName('NOMBRE').AsString;
   end
   else
      begin
         Datos.USUARIO_NOMBRE := '<FALTA>';
      end;
end;

procedure TdmEstadoDeCuentas.LoadDatosCaja(var Datos : _EstadoDeCuentas);
begin
   if not(dsVer_Datos_Cajero.DataSet.IsEmpty) then
   begin
      Datos.ALMACEN        := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN').AsInteger;
      Datos.ALMACEN_NOMBRE := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN_NOMBRE').AsString;
      Datos.CAJA           := dsVer_Datos_Cajero.DataSet.FieldByName('R_ID').AsInteger;
      Datos.CAJA_NOMBRE    := dsVer_Datos_Cajero.DataSet.FieldByName('R_NOMBRE').AsString;
      Datos.CAJAS          := dsVer_Datos_Cajero.DataSet.FieldByName('R_REGISTROS').AsInteger;
   end
   else
      begin
         Datos.ALMACEN        := 0;
         Datos.ALMACEN_NOMBRE := '<FALTA>';
         Datos.CAJA           := 0;
         Datos.CAJA_NOMBRE    := '<FALTA>';
         Datos.CAJAS          := 0;
      end;
end;

procedure TdmEstadoDeCuentas.Usuario(valor : integer);
begin
   qyUsuario.Close;
   qyUsuario.ParamByName('P_USUARIO').AsInteger := valor;
   qyUsuario.Open;
end;

procedure TdmEstadoDeCuentas.DatosCaja(valor : integer);
begin
   qyVer_Datos_Cajero.Close;
   qyVer_Datos_Cajero.ParamByName('P_USUARIO').AsInteger := valor;
   qyVer_Datos_Cajero.Open;
end;

function TdmEstadoDeCuentas.GetFECHA : TDatetime;
begin
   dsFechaServidor.DataSet.Close;
   dsFechaServidor.DataSet.Open;
   Result := dsFechaServidor.DataSet.FieldByName('R_FECHA').AsDatetime;
end;

procedure TdmEstadoDeCuentas.DataModuleCreate(Sender: TObject);
begin
   refreshPreferencias;
   //Permitir pagar cuentas por cobrar de diferentes almacenes
   dsPreferencias.DataSet.Filter := 'ID = 51';
   DIFERENTES := UpperCase(dsPreferencias.DataSet.FieldByName('VALOR').AsString) = 'SI';
end;

end.
