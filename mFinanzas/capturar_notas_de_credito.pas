unit capturar_notas_de_credito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, Menus,  Db,
        StdCtrls,
  IBX.IBStoredProc, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery, Mask, DBCtrls,
     jpeg,  ExtCtrls,
    UfrmFrameMaterial,
  Buttons,
  Grids, DBGrids, System.Variants;

type
  TfrmCapturar_notas_de_credito = class(TfrmCapturarMDI)
    Label2: TLabel;
    deFechaAlta: TDBEdit;
    deClave: TDBEdit;
    Label7: TLabel;
    TAlmacenes: TIBTable;
    TAlmacenesID: TIntegerField;
    TAlmacenesCLAVE: TIBStringField;
    TAlmacenesNOMBRE: TIBStringField;
    TAlmacenesCOMPRA: TIBStringField;
    TAlmacenesVENDE: TIBStringField;
    TAlmacenesTRANSFORMA: TIBStringField;
    TAlmacenesFECHA_ALTA: TDateTimeField;
    TAlmacenesRESPONSABLE: TIntegerField;
    TAlmacenesOBSERVACIONES: TBlobField;
    TAlmacenesSERIE_FACTURA: TIBStringField;
    TAlmacenesCONSECUTIVO: TIntegerField;
    TAlmacenesFECHA_ULT_INV: TDateTimeField;
    TAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    leAlmacenes: TDBLookupComboBox;
    Label22: TLabel;
    Label3: TLabel;
    Label21: TLabel;
    Label12: TLabel;
    leMoneda: TDBLookupComboBox;
    beCXC: TDBEdit;
    Label1: TLabel;
    spEstatus: TIBStoredProc;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    paCaptura: TPanel;
    Label8: TLabel;
    Label20: TLabel;
    Label11: TLabel;
    ceSubTotal: TDBEdit;
    beConcepto: TDBEdit;
    ceDescuentoPorc: TDBEdit;
    dgPartidas: TDBGrid;
    Label19: TLabel;
    ceIVAPorc: TDBEdit;
    ceIEPSPorc: TDBEdit;
    Label17: TLabel;
    ceImpuesto1Porc: TDBEdit;
    laImpuesto1Porc: TLabel;
    ceImpuesto2Porc: TDBEdit;
    laImpuesto2Porc: TLabel;
    deObservaciones: TDBMemo;
    Label5: TLabel;
    Label18: TLabel;
    leEstatus: TDBLookupComboBox;
    beAplicar: TEdit;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarEXTENSION: TIntegerField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarALMACEN: TIntegerField;
    TCapturarIVA_PORC: TFloatField;
    TCapturarIEPS_PORC: TFloatField;
    TCapturarIMPUESTO1_PORC: TFloatField;
    TCapturarIMPUESTO2_PORC: TFloatField;
    TCapturarSUBTOTAL: TFloatField;
    TCapturarIVA: TFloatField;
    TCapturarIEPS: TFloatField;
    TCapturarIMPUESTO1: TFloatField;
    TCapturarIMPUESTO2: TFloatField;
    TCapturarTOTAL: TFloatField;
    TCapturarMONEDA: TIntegerField;
    TCapturarUSUARIO: TIntegerField;
    TCapturarESTATUS: TIBStringField;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ceIVA: TDBEdit;
    ceIEPS: TDBEdit;
    ceImpuesto1: TDBEdit;
    ceImpuesto2: TDBEdit;
    TCapturarcliente_nombre: TStringField;
    TCapturarextension_nombre: TStringField;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    TDetalle: TIBTable;
    dsDetalle: TDataSource;
    dsMonedas: TDataSource;
    TMonedas: TIBTable;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    TCapturarclave_almacen: TStringField;
    TCapturardescripcion_moneda: TStringField;
    TCapturarcxc: TStringField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_NOTA_DE_CREDITO: TIntegerField;
    qyPartidasR_CONCEPTO: TIntegerField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_DESC_PORC: TFloatField;
    qyPartidasR_AUTOMATICO: TIBStringField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    TDetalleID: TIntegerField;
    TDetalleNOTA_DE_CREDITO: TIntegerField;
    TDetalleCONCEPTO: TIntegerField;
    TDetalleDESC_PORC: TFloatField;
    TDetalleAUTOMATICO: TIBStringField;
    TDetalleSUBTOTAL: TFloatField;
    TDetalleIVA: TFloatField;
    TDetalleIEPS: TFloatField;
    TDetalleIMPUESTO1: TFloatField;
    TDetalleIMPUESTO2: TFloatField;
    TDetalleESTATUS: TIBStringField;
    TDetalleDESCRIPCION: TIBStringField;
    qyPartidasR_TOTAL: TFloatField;
    spID2: TIBStoredProc;
    spCALCULA_IMPUESTO_2: TIBStoredProc;
    spCALCULA_IMPUESTO_1: TIBStoredProc;
    spCALCULA_IEPS: TIBStoredProc;
    spCALCULA_IVA: TIBStoredProc;
    spTOTALES_NOTA_DE_CREDITO: TIBStoredProc;
    spDEL_PARTIDA_NOTA_DE_CREDITO: TIBStoredProc;
    TCapturarcxc_saldo_actual: TFloatField;
    Label13: TLabel;
    ibNC: TBitBtn;
    beExtension: TDBEdit;
    TCapturarSERIE_NC: TIBStringField;
    TCapturarCONSECUTIVO: TIntegerField;
    TCapturarCUENTA_POR_COBRAR: TIntegerField;
    TDetalleORIGINAL: TIBStringField;
    TCapturarNC: TIntegerField;
    TCapturarnotacredito: TStringField;
    deSaldo: TDBEdit;
    deFolio: TDBEdit;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    NC1: TMenuItem;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    TCapturarDESCUENTO_GLOBAL_PORC: TFloatField;
    TCapturarDESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    TCapturarDESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    TCapturarGRANTOTAL: TFloatField;
    TDetalleMATERIAL: TIntegerField;
    TDetallePRECIO: TFloatField;
    TDetallePRECIO_SIN_IMPUESTOS: TFloatField;
    TDetalleIVA_PORC: TFloatField;
    TDetalleIEPS_PORC: TFloatField;
    TDetalleIMPUESTO1_PORC: TFloatField;
    TDetalleIMPUESTO2_PORC: TFloatField;
    TDetalleIVA_DP: TFloatField;
    TDetalleIEPS_DP: TFloatField;
    TDetalleIMPUESTO1_DP: TFloatField;
    TDetalleIMPUESTO2_DP: TFloatField;
    TDetalleSUBTOTAL_DP: TFloatField;
    TDetalleIVA_DG: TFloatField;
    TDetalleIEPS_DG: TFloatField;
    TDetalleIMPUESTO1_DG: TFloatField;
    TDetalleIMPUESTO2_DG: TFloatField;
    TDetalleSUBTOTAL_DG: TFloatField;
    TDetalleCANTIDAD: TFloatField;
    qyCalculaImpuestos: TIBQuery;
    qyCalculaImpuestosR_SUBTOTAL: TFloatField;
    qyCalculaImpuestosR_IVA: TFloatField;
    qyCalculaImpuestosR_IEPS: TFloatField;
    qyCalculaImpuestosR_IMPUESTO1: TFloatField;
    qyCalculaImpuestosR_IMPUESTO2: TFloatField;
    qyCalculaImpuestosR_TOTAL: TFloatField;
    cbAutomatico: TDBEdit;
    qyPartidasR_PRECIO: TFloatField;
    qyPartidasR_DESCUENTO_PORC: TFloatField;
    qyPartidasR_DP: TFloatField;
    qyPartidasR_DG: TFloatField;
    qyPartidasR_GT: TFloatField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_MATERIAL_CLAVE: TIBStringField;
    qyPartidasR_MATERIAL_DESCRIPCION: TIBStringField;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    ibAddPFact: TBitBtn;
    ibAddPPed: TBitBtn;
    edCliente: TEdit;
    deCliente: TDBEdit;
    buImpresion: TBitBtn;
    ppImpresion: TPopupMenu;
    itemPreview: TMenuItem;
    laDG: TLabel;
    edDescGlobal: TDBEdit;
    spNCREDITO_DESCUENTOS: TIBStoredProc;
    spNCREDITO_DESCUENTO_GLOBAL: TIBStoredProc;
    spM_NCREDITO_DP_PORC: TIBStoredProc;
    TCapturarRETENCION: TIBStringField;
    TCapturarRETENCION_IVA: TFloatField;
    ibRetencion: TBitBtn;
    ibRetencionISR: TBitBtn;
    qyPartidasR_DG_PORC: TFloatField;
    qyPartidasR_RETENCION_PORC_IVA: TFloatField;
    qyPartidasR_RETENCION_PORC_ISR: TFloatField;
    qyPartidasR_RETENCION_IVA: TFloatField;
    qyPartidasR_RETENCION_ISR: TFloatField;
    cbRetencion: TDBEdit;
    TCapturarRETENCION_ISR: TFloatField;
    TCapturarDEVOLUCION_PRODUCTO: TIBStringField;
    spRETENCION_IVA_NCREDITO: TIBStoredProc;
    spRETENCION_ISR_NCREDITO: TIBStoredProc;
    spRETENCION_IVA_NCRED_DET: TIBStoredProc;
    spRETENCION_ISR_NCRED_DET: TIBStoredProc;
    TCapturarELIMINAR_IVA: TIBStringField;
    TCapturarIVA_DP: TFloatField;
    TCapturarIVA_DG: TFloatField;
    TCapturarXML: TIBStringField;
    itemPreview2: TMenuItem;
    TDetalleDG_PORC: TFloatField;
    TDetalleUNIDAD: TIntegerField;
    TDetalleRETENCION_PORC_IVA: TFloatField;
    TDetalleRETENCION_PORC_ISR: TFloatField;
    TDetalleRETENCION_IVA: TFloatField;
    TDetalleRETENCION_ISR: TFloatField;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure beCXCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dsDetalleDataChange(Sender: TObject; Field: TField);
    procedure beConceptoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure ceDescuentoPorcChange(Sender: TObject);
    procedure leEstatusChange(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure beExtensionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibNCClick(Sender: TObject);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure NC1Click(Sender: TObject);
    procedure beExtensionKeyPress(Sender: TObject; var Key: Char);
    procedure beConceptoKeyPress(Sender: TObject; var Key: Char);
    procedure deFechaAltaEnter(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure beCXCKeyPress(Sender: TObject; var Key: Char);
    procedure ceSubTotalChange(Sender: TObject);
    procedure cbAutomaticoChange(Sender: TObject);
    procedure ibAddPFactClick(Sender: TObject);
    procedure ibAddPPedClick(Sender: TObject);
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure ibImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
    procedure dgPartidasBTN_PORCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibRetencionClick(Sender: TObject);
    procedure ibRetencionISRClick(Sender: TObject);
    procedure dgPartidasRETENCION_IVAButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasRETENCION_ISRButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure itemPreview2Click(Sender: TObject);
  private
    { Private declarations }
    awrActivarDG  : boolean; //activar Descuento Global
    awrActivarDP  : boolean; //activar Descuento Parcial
    awrAlmGral    : integer;
    tmpDescGlobal : double;
    awrCliente    : integer;
    awrExtension  : integer;

    procedure refresh_totales(p_id : integer);
    procedure calculaTotales;
    function ejecucionRetencionIVA : boolean;
    function ejecucionRetencionISR : boolean;
    function ejecucionRetencionDetalleIVA : boolean;
    function ejecucionRetencionDetalleISR : boolean;
  public
    { Public declarations }
    constructor CrearParaPagos(AOwner : TComponent);
  end;

var
  frmCapturar_notas_de_credito: TfrmCapturar_notas_de_credito;

implementation

uses explorar_notas_de_credito, IBModulo, reglas_de_negocios, IBData,
  seleccionar_cliente, seleccionar_extension,
  seleccionar_cuentas_por_cobrar, seleccionar_descuentos, autorizacion,
  seleccionar_notas_de_credito, PRN_0015_NC_TXT, UfrmSeleccionarCXC,
  UfrmSeleccionarExtension, UfrmSeleccionarFacturas,
  UfrmSeleccionarPedidos, UfrmSeleccionarCliente_,
  UfrmSeleccionarCDescuento, UfrmAcceso, UfrmElegirCFNCredito;

{$R *.DFM}

function TfrmCapturar_notas_de_credito.ejecucionRetencionIVA : boolean;
var
   ejecutar  : boolean;
begin
   frmAcceso := TfrmAcceso.Create(Application);
   try
      frmAcceso.UnicoN := 'Todos';
      frmAcceso.Unico  := 0;
      frmAcceso.Nivel  := 5;
      frmAcceso.Status := 'Retencion I.V.A.';
      frmAcceso.ShowModal;
      ejecutar := frmAcceso.Rsp;
   finally
      frmAcceso.Free;
   end;

  if ejecutar then
  begin
      {
     idCaptura.Titulo  := 'Retencion I.V.A.';
     idCaptura.Texto   := 'Porcentaje';
     idCaptura.Entrada := '';
     idCaptura.Execute;
     ejecutar := idCaptura.Respuesta;
     if ejecutar and (idCaptura.Entrada <> '') then
     begin
        spRETENCION_IVA_NCREDITO.ParamByName('P_ID').AsInteger       := dsFuente.DataSet.FieldByName('ID').AsInteger;
        spRETENCION_IVA_NCREDITO.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(idCaptura.Entrada);
        spRETENCION_IVA_NCREDITO.ExecProc;
        spRETENCION_IVA_NCREDITO.Transaction.CommitRetaining;
     end;
     }
  end;
  Result := ejecutar;
end;

function TfrmCapturar_notas_de_credito.ejecucionRetencionISR : boolean;
var
   ejecutar  : boolean;
begin
   frmAcceso := TfrmAcceso.Create(Application);
   try
      frmAcceso.UnicoN := 'Todos';
      frmAcceso.Unico  := 0;
      frmAcceso.Nivel  := 5;
      frmAcceso.Status := 'Retencion I.S.R.';
      frmAcceso.ShowModal;
      ejecutar := frmAcceso.Rsp;
   finally
      frmAcceso.Free;
   end;

  if ejecutar then
  begin
     {
     idCaptura.Titulo  := 'Retencion I.S.R.';
     idCaptura.Texto   := 'Porcentaje';
     idCaptura.Entrada := '';
     idCaptura.Execute;
     ejecutar := idCaptura.Respuesta;
     if ejecutar and (idCaptura.Entrada <> '') then
     begin
        spRETENCION_ISR_NCREDITO.ParamByName('P_ID').AsInteger       := dsFuente.DataSet.FieldByName('ID').AsInteger;
        spRETENCION_ISR_NCREDITO.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(idCaptura.Entrada);
        spRETENCION_ISR_NCREDITO.ExecProc;
        spRETENCION_ISR_NCREDITO.Transaction.CommitRetaining;
     end;
     }
  end;
  Result := ejecutar;
end;

function TfrmCapturar_notas_de_credito.ejecucionRetencionDetalleIVA : boolean;
var
   ejecutar  : boolean;
begin
   frmAcceso := TfrmAcceso.Create(Application);
   try
      frmAcceso.UnicoN := 'Todos';
      frmAcceso.Unico  := 0;
      frmAcceso.Nivel  := 5;
      frmAcceso.Status := 'Retencion Detalle I.V.A.';
      frmAcceso.ShowModal;
      ejecutar := frmAcceso.Rsp;
   finally
      frmAcceso.Free;
   end;

  if ejecutar then
  begin
      {
     idCaptura.Titulo  := 'Retencion Detalle I.V.A.';
     idCaptura.Texto   := 'Porcentaje';
     idCaptura.Entrada := '';
     idCaptura.Execute;
     ejecutar := idCaptura.Respuesta;
     if ejecutar and (idCaptura.Entrada <> '') then
     begin
        spRETENCION_IVA_NCRED_DET.ParamByName('P_ID').AsInteger       := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spRETENCION_IVA_NCRED_DET.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(idCaptura.Entrada);
        spRETENCION_IVA_NCRED_DET.ExecProc;
        spRETENCION_IVA_NCRED_DET.Transaction.CommitRetaining;
     end;
     }
  end;
  Result := ejecutar;
end;

function TfrmCapturar_notas_de_credito.ejecucionRetencionDetalleISR : boolean;
var
   ejecutar  : boolean;
begin
   frmAcceso := TfrmAcceso.Create(Application);
   try
      frmAcceso.UnicoN := 'Todos';
      frmAcceso.Unico  := 0;
      frmAcceso.Nivel  := 5;
      frmAcceso.Status := 'Retencion Detalle I.S.R.';
      frmAcceso.ShowModal;
      ejecutar := frmAcceso.Rsp;
   finally
      frmAcceso.Free;
   end;

  if ejecutar then
  begin
     {
     idCaptura.Titulo  := 'Retencion Detalle I.S.R.';
     idCaptura.Texto   := 'Porcentaje';
     idCaptura.Entrada := '';
     idCaptura.Execute;
     ejecutar := idCaptura.Respuesta;
     if ejecutar and (idCaptura.Entrada <> '') then
     begin
        spRETENCION_ISR_NCRED_DET.ParamByName('P_ID').AsInteger       := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spRETENCION_ISR_NCRED_DET.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(idCaptura.Entrada);
        spRETENCION_ISR_NCRED_DET.ExecProc;
        spRETENCION_ISR_NCRED_DET.Transaction.CommitRetaining;
     end;
     }
  end;
  Result := ejecutar;
end;

procedure TfrmCapturar_notas_de_credito.calculaTotales;
begin
  if (dsDetalle.DataSet.State in [dsInsert, dsEdit]) and (dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString = 'Si') then
  begin
     qyCalculaImpuestos.Close;
     qyCalculaImpuestos.ParamByName('P_ID').AsInteger       := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyCalculaImpuestos.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(ceDescuentoPorc.Text);
     qyCalculaImpuestos.Open;

     dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat  := qyCalculaImpuestos.FieldByName('R_SUBTOTAL').AsFloat;
     dsDetalle.DataSet.FieldByName('IVA').AsFloat       := qyCalculaImpuestos.FieldByName('R_IVA').AsFloat;
     dsDetalle.DataSet.FieldByName('IEPS').AsFloat      := qyCalculaImpuestos.FieldByName('R_IEPS').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat := qyCalculaImpuestos.FieldByName('R_IMPUESTO1').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat := qyCalculaImpuestos.FieldByName('R_IMPUESTO2').AsFloat;
  end;
end;

constructor TfrmCapturar_notas_de_credito.CrearParaPagos(AOwner : TComponent);
begin
   Create(AOwner);
   Self.FormStyle   := fsNormal;
   Self.WindowState := wsMaximized;
   Self.Visible     := false;
end;

procedure TfrmCapturar_notas_de_credito.refresh_totales(p_id : integer);
begin
  spTOTALES_NOTA_DE_CREDITO.ParamByName('P_NOTA_DE_CREDITO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  spTOTALES_NOTA_DE_CREDITO.ExecProc;
  spTOTALES_NOTA_DE_CREDITO.Transaction.CommitRetaining;
  reglas.abrir_IBTabla(TCapturar);
  if p_id = 0 then
     reglas.refresh_IBQuery(qyPartidas)
  else
     reglas.abrir_IBQuery_seek('R_ID',p_id,qyPartidas);
end;

procedure TfrmCapturar_notas_de_credito.ibNuevoClick(Sender: TObject);
begin
  inherited;
  //Moneda base
  dmIBData.TPreferencias.Filter := 'ID = 3';
  if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger <> 0 then
     dsFuente.DataSet.FieldByName('MONEDA').AsInteger := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  //Fecha Servidor   
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime              := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  //I.V.A.
  dmIBData.TPreferencias.Filter := 'ID = 68';
  dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat                   := dmIBData.TPreferencias.FieldByName('VALOR').AsFloat;

  dsFuente.DataSet.FieldByName('ESTATUS').AsString                   := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('USUARIO').AsInteger                  := reglas.dame_usuario;
  dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat             := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat             := 0;
  dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat                   := 0;
  dsFuente.DataSet.FieldByName('IVA').AsFloat                        := 0;
  dsFuente.DataSet.FieldByName('IEPS').AsFloat                       := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('TOTAL').AsFloat                      := 0;
  dsFuente.DataSet.FieldByName('ALMACEN').AsInteger                  := awrAlmGral;
  dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger              := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat      := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat  := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat := 0;
  dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('RETENCION').AsString                 := 'No';
  dsFuente.DataSet.FieldByName('DEVOLUCION_PRODUCTO').AsString       := 'No';
  deClave.SetFocus;
end;

procedure TfrmCapturar_notas_de_credito.ibModificarClick(Sender: TObject);
begin
  estatus       := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  tmpDescGlobal := dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat;
  awrCliente    := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
  awrExtension  := dsFuente.DataSet.FieldByName('EXTENSION').AsInteger;
  inherited;
  if deClave.Enabled then
     deClave.SetFocus;
end;

procedure TfrmCapturar_notas_de_credito.TCapturarCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NOTACREDITO').AsString := DataSet.FieldByName('SERIE_NC').AsString + DataSet.FieldByName('CONSECUTIVO').AsString;
  if DataSet.FieldByName('CUENTA_POR_COBRAR').AsString <> '' then
  begin
     dmIBData.TFiltroCXC.Filter := 'ID = '+DataSet.FieldByName('CUENTA_POR_COBRAR').AsString;
     DataSet.FieldByName('CXC').AsString              := dmIBData.TFiltroCXC.FieldByName('REFERENCIA').AsString +', '+ dmIBData.TFiltroCXC.FieldByName('DOCUMENTO').AsString +'/'+ dmIBData.TFiltroCXC.FieldByName('NUMERO_DE_DOCUMENTOS').AsString;
     DataSet.FieldByName('CXC_SALDO_ACTUAL').AsFloat  := dmIBData.TFiltroCXC.FieldByName('SALDO_ACTUAL').AsFloat;
  end
  else
     begin
        DataSet.FieldByName('CXC').AsString             := '';
        DataSet.FieldByName('CXC_SALDO_ACTUAL').AsFloat := 0.00;
     end;

  DataSet.FieldByName('cliente_nombre').AsString := '';
  if DataSet.FieldByName('CLIENTE').AsString <> '' then
  begin
     dmIBData.TFiltroClientes.Filter := 'ID = '+DataSet.FieldByName('CLIENTE').AsString;

     if dmIBData.TSujetosCliente.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
        DataSet.FieldByName('cliente_nombre').AsString := dmIBData.TSujetosCliente.FieldByName('RAZON_SOCIAL').AsString
     else
        DataSet.FieldByName('cliente_nombre').AsString := dmIBData.TSujetosCliente.FieldByName('NOMBRE').AsString;
  end;

  if DataSet.FieldByName('EXTENSION').AsString <> '' then
  begin
     dmIBData.TFiltroClientesExtensiones.Filter       := 'ID = '+DataSet.FieldByName('EXTENSION').AsString;
     DataSet.FieldByName('EXTENSION_NOMBRE').AsString := dmIBData.TFiltroClientesExtensiones.FieldByName('NOMBRE').AsString;
  end
  else
     DataSet.FieldByName('EXTENSION_NOMBRE').AsString := '';
end;

procedure TfrmCapturar_notas_de_credito.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TPreferencias);

  //Almacen General
  dmIBData.TPreferencias.Filter := 'ID = 130';
  awrAlmGral := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Visualizar en Notas de Credito el boton de pedidos.
  dmIBData.TPreferencias.Filter := 'ID = 316';
  ibAddPPed.Visible := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Activar descuento global
  dmIBData.TPreferencias.Filter := 'ID = 348';
  awrActivarDG := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Activar descuento parcial
  dmIBData.TPreferencias.Filter := 'ID = 349';
  awrActivarDP := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientesExtensiones);
  reglas.abrir_IBTabla(dmIBData.TFiltroCXC);
  inherited;
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
  reglas.refresh_IBQuery(qyPartidas);
  reglas.abrir_IBTabla(TDetalle);
end;

procedure TfrmCapturar_notas_de_credito.dsFuenteDataChange(Sender: TObject;
  Field: TField);
var
   estado : TDataSetState;
   s_a    : boolean;
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     estado                  := TDataSource(sender).DataSet.State;
     s_a                     := dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar';
     deFechaAlta.Enabled     := s_a;
     deClave.Enabled         := s_a;
     leAlmacenes.Enabled     := s_a;
     deObservaciones.Enabled := s_a;
     edCliente.Enabled       := s_a;
     edDescGlobal.Enabled    := s_a and awrActivarDG;
     beCXC.Enabled           := s_a;
     beExtension.Enabled     := s_a;
     ceIvaPorc.Enabled       := s_a;
     ceIEPSPorc.Enabled      := s_a;
     ceImpuesto1Porc.Enabled := s_a;
     ceImpuesto2Porc.Enabled := s_a;
     leMoneda.Enabled        := s_a;
     cbRetencion.Enabled     := s_a;

     paLienzo2.Visible       :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     leEstatus.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse, dsEdit];
     beAplicar.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse];
     ibEliminar.Enabled      := ibEliminar.Enabled and s_a;
     ibAddPFact.Enabled      :=(TDataSource(sender).DataSet.State in [dsBrowse]) and s_a;
     ibAddPPed.Enabled       :=(TDataSource(sender).DataSet.State in [dsBrowse]) and s_a;
     ibNC.Enabled            :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty) and (TDataSource(Sender).DataSet.FieldByName('CUENTA_POR_COBRAR').AsString = '');
     edCliente.Visible       :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and s_a;
     itemPreview.Enabled     :=(estado = dsBrowse ) and not(TDataSource(sender).DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString <> 'Cancelado');

     if edCliente.Visible then
        edCliente.Text := dsFuente.DataSet.FieldByName('cliente_nombre').AsString;
  end;
end;

procedure TfrmCapturar_notas_de_credito.beCXCButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
{var
   pntX : TPoint;
   pntY : TPoint;}
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCXC             := TfrmSeleccionarCXC.Create(Application);
           frmSeleccionarCXC.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCXC.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           if dsFuente.DataSet.FieldByName('EXTENSION').AsString <> '' then
              frmSeleccionarCXC.ID_EXTENSION := dsFuente.DataSet.FieldByName('EXTENSION').AsInteger
           else
              frmSeleccionarCXC.ID_CLIENTE   := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
           if frmSeleccionarCXC.abrirConsulta then
           begin
              frmSeleccionarCXC.ShowModal;
              if frmSeleccionarCXC.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsInteger := frmSeleccionarCXC.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger           := frmSeleccionarCXC.ID_CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := frmSeleccionarCXC.ID_EXTENSION;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsInteger   := frmSeleccionarCXC.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarCXC.ID_CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarCXC.ID_EXTENSION;
              end;
           frmSeleccionarCXC.Free;
           frmSeleccionarCXC := nil;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant  := null;
        end;
  end;

{  case AbsoluteIndex of
    0 : begin
           pntX := paLienzo.ClientToScreen(Point(0,0));
           pntY := sbHijo.ClientToScreen(Point(0,0));
           pntY.y := pntY.y - pntX.y;
           pntY.x := paLienzo.Width;
           frmSeleccionar_cuentas_por_cobrar                   := TfrmSeleccionar_cuentas_por_cobrar.Crear(Application, pntX, pntY, 1);
           frmSeleccionar_cuentas_por_cobrar.dsDestino.DataSet := TCapturar;
           frmSeleccionar_cuentas_por_cobrar.ShowModal;
           frmSeleccionar_cuentas_por_cobrar.Free;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant  := null;
        end;
  end;}
end;

procedure TfrmCapturar_notas_de_credito.dsDetalleDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     ibNuevaPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibModificarPartida.Enabled :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibGuardarPartida.Enabled   :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibCancelarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibEliminarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     paCaptura.Visible          :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ceSubTotal.Enabled         := not(cbAutomatico.Text = 'Si');
     ceIVA.Enabled              := not(cbAutomatico.Text = 'Si');
     ceIEPS.Enabled             := not(cbAutomatico.Text = 'Si');
     ceImpuesto1.Enabled        := not(cbAutomatico.Text = 'Si');
     ceImpuesto2.Enabled        := not(cbAutomatico.Text = 'Si');
  end;
end;

procedure TfrmCapturar_notas_de_credito.beConceptoButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   pntX : TPoint;
   pntY : TPoint;
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCDescuento             := TfrmSeleccionarCDescuento.Create(Application);
           frmSeleccionarCDescuento.WindowState := wsMaximized;
           frmSeleccionarCDescuento.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCDescuento.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCDescuento.CLAVE       := beConcepto.Text;
           if frmSeleccionarCDescuento.abrirConsulta then
           begin
              frmSeleccionarCDescuento.ShowModal;
              if frmSeleccionarCDescuento.ACEPTAR then
              begin
                 dsDetalle.DataSet.FieldByName('CONCEPTO').AsInteger   := frmSeleccionarCDescuento.ID;
                 dsDetalle.DataSet.FieldByName('DESCRIPCION').AsString := frmSeleccionarCDescuento.DESCRIPCION;
                 dsDetalle.DataSet.FieldByName('DESC_PORC').AsFloat    := frmSeleccionarCDescuento.FACTOR;
              end;
           end
           else
              begin
                 dsDetalle.DataSet.FieldByName('CONCEPTO').AsInteger   := frmSeleccionarCDescuento.ID;
                 dsDetalle.DataSet.FieldByName('DESCRIPCION').AsString := frmSeleccionarCDescuento.DESCRIPCION;
                 dsDetalle.DataSet.FieldByName('DESC_PORC').AsFloat    := frmSeleccionarCDescuento.FACTOR;
              end;
           frmSeleccionarCDescuento.Free;

           if dsDetalle.DataSet.FieldByName('CONCEPTO').AsInteger <> 0 then
           begin
              ceDescuentoPorc.SetFocus;
              calculaTotales;
           end;
        end;
    1 : begin
           dsDetalle.DataSet.FieldByName('CONCEPTO').AsVariant   := null;
           dsDetalle.DataSet.FieldByName('DESCRIPCION').AsString := '';
           dsDetalle.DataSet.FieldByName('DESC_PORC').AsFloat    := 0.00;
        end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.ibNuevaPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Insert;
  spID2.ExecProc;
  dsDetalle.DataSet.FieldByName('ID').AsInteger              := spID2.ParamByName('R_ID').AsInteger;
  dsDetalle.DataSet.FieldByName('NOTA_DE_CREDITO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  if dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsString <> '' then
     dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString    := 'Si'
  else
     dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString    := 'No';
  dsDetalle.DataSet.FieldByName('ORIGINAL').AsString         := 'Si';
  dsDetalle.DataSet.FieldByName('DESC_PORC').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat          := 0;
  dsDetalle.DataSet.FieldByName('IVA').AsFloat               := 0;
  dsDetalle.DataSet.FieldByName('IEPS').AsFloat              := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('ESTATUS').AsString          := 'Sin Afectar';
  dsDetalle.DataSet.FieldByName('PRECIO').AsFloat            := 0;
  dsDetalle.DataSet.FieldByName('PRECIO_SIN_IMPUESTOS').AsFloat := 0;
  dsDetalle.DataSet.FieldByName('IVA_PORC').AsFloat          := 0;
  dsDetalle.DataSet.FieldByName('IEPS_PORC').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat    := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat    := 0;
  dsDetalle.DataSet.FieldByName('IVA_DP').AsFloat            := 0;
  dsDetalle.DataSet.FieldByName('IEPS_DP').AsFloat           := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO1_DP').AsFloat      := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO2_DP').AsFloat      := 0;
  dsDetalle.DataSet.FieldByName('SUBTOTAL_DP').AsFloat       := 0;
  dsDetalle.DataSet.FieldByName('IVA_DG').AsFloat            := 0;
  dsDetalle.DataSet.FieldByName('IEPS_DG').AsFloat           := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO1_DG').AsFloat      := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO2_DG').AsFloat      := 0;
  dsDetalle.DataSet.FieldByName('SUBTOTAL_DG').AsFloat       := 0;
  dsDetalle.DataSet.FieldByName('CANTIDAD').AsFloat          := 0;
  beConcepto.SetFocus;
end;

procedure TfrmCapturar_notas_de_credito.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Cancel;
end;

procedure TfrmCapturar_notas_de_credito.ibGuardarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Post;
  TDetalle.Transaction.CommitRetaining;
  refresh_totales(TDetalle.FieldByName('ID').AsInteger);
end;

procedure TfrmCapturar_notas_de_credito.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Edit;
  beConcepto.SetFocus;
end;

procedure TfrmCapturar_notas_de_credito.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Desea eliminar Partida', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
    spDEL_PARTIDA_NOTA_DE_CREDITO.ParamByName('P_ID').AsInteger := qyPartidas.FieldByName('R_ID').AsInteger;
    spDEL_PARTIDA_NOTA_DE_CREDITO.ExecProc;
    spDEL_PARTIDA_NOTA_DE_CREDITO.Transaction.CommitRetaining;
    reglas.abrir_IBTabla(TCapturar);
    reglas.refresh_IBQuery(qyPartidas)
  end;
end;

procedure TfrmCapturar_notas_de_credito.ceDescuentoPorcChange(
  Sender: TObject);
begin
  inherited;
  calculaTotales;
end;

procedure TfrmCapturar_notas_de_credito.leEstatusChange(Sender: TObject);
begin
  inherited;
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
     ibGuardar.Enabled        := FALSE;
  end
  else
     dsFuente.DataSet.FieldByName('ESTATUS').AsString := estatus;
end;

procedure TfrmCapturar_notas_de_credito.beAplicarButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   autorizar : string;
   ejecutar  : boolean; 
begin
  inherited;
  ejecutar := TRUE;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := estatus;
  dsFuente.DataSet.Post;
  if autorizar = 'Si' then
  begin
     frmAutorizacion := TfrmAutorizacion.Crear(Application, 2);
     frmAutorizacion.ShowModal;
     ejecutar := frmAutorizacion.dame_respuesta;
     frmAutorizacion.Free;
  end;
  if ejecutar then
  begin
     spEstatus.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;
     reglas.abrir_IBTabla(dmIBData.TFiltroCXC);
     reglas.abrir_IBTabla(TCapturar);
  end;
end;

procedure TfrmCapturar_notas_de_credito.beExtensionButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
{var
   pntA : TPoint;
   pntB : TPoint;}
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarExtension             := TfrmSeleccionarExtension.Create(Application);
           frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarExtension.CLAVE       := '';
           if frmSeleccionarExtension.abrirConsulta then
           begin
              frmSeleccionarExtension.ShowModal;
              if frmSeleccionarExtension.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
              end;
           frmSeleccionarExtension.Free;
           frmSeleccionarExtension := nil;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
  end;
{  case AbsoluteIndex of
    0 : begin
           pntA   := paLienzo.ClientToScreen(Point(0,0));
           pntB   := sbHijo.ClientToScreen(Point(0,0));
           pntB.x := paLienzo.Width;
           pntB.y := pntB.y - pntA.y;

           frmSeleccionar_extension                   := TfrmSeleccionar_extension.CrearBase(Application, pntA, pntB, 1);
           frmSeleccionar_extension.dsDestino.DataSet := TCapturar;
           frmSeleccionar_extension.ShowModal;
           frmSeleccionar_extension.Free;
           if (dsFuente.DataSet.FieldByName('EXTENSION').AsString <> '') then
           begin
              dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := dmIBData.TFiltroClientesExtensiones.FieldByName('SUJETO_CLIENTE').AsInteger;
           end;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := null;
        end;
  end;}
end;

procedure TfrmCapturar_notas_de_credito.ibNCClick(Sender: TObject);
var
   pntA : TPoint;
   pntB : TPoint;
begin
  inherited;
  pntA   := fpPadre.ClientToScreen(Point(0,0));
  pntB   := dgPartidas.ClientToScreen(Point(0,0));
  pntB.x := paLienzo.Width;
  pntB.y := pntB.y - pntA.y;
  frmSeleccionar_notas_de_credito                      := TfrmSeleccionar_notas_de_credito.crearB(Application, pntA, pntB, 1, dsFuente.DataSet.FieldByName('ID').AsInteger);
  frmSeleccionar_notas_de_credito.dsEncabezado.DataSet := TCapturar;
  frmSeleccionar_notas_de_credito.dsDestino.DataSet    := qyPartidas;
  frmSeleccionar_notas_de_credito.ShowModal;
  frmSeleccionar_notas_de_credito.Release; 
end;

procedure TfrmCapturar_notas_de_credito.NuevaPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_notas_de_credito.ModificarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_notas_de_credito.GuardarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_notas_de_credito.CancelarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_notas_de_credito.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_notas_de_credito.NC1Click(Sender: TObject);
begin
  inherited;
  if ibNC.Enabled then
     ibNC.Click;
end;

procedure TfrmCapturar_notas_de_credito.beExtensionKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
     beExtensionButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_credito.beConceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     beConceptoButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_credito.deFechaAltaEnter(Sender: TObject);
begin
  inherited;
  deFechaAlta.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime));
end;

procedure TfrmCapturar_notas_de_credito.ibGuardarClick(Sender: TObject);
var
   fraccion   : Real;
   entero     : Real;
   statusDS   : TDataSetState;
   lFecha     : TDateTime;
begin
  statusDS := dsFuente.DataSet.State;

  if deFechaAlta.Focused then
     deClave.SetFocus;
  lFecha := StrToDateTime(deFechaAlta.Text);
  entero   := Int(lFecha);
  fraccion := Frac(lFecha);
  if entero > 0 then
  begin
     if fraccion = 0 then
        dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := lFecha + time;
  end;
  inherited;
  if (statusDS = dsEdit) then
  begin
     if not(qyPartidas.IsEmpty) then
     begin
        if ( (awrCliente   <> dsFuente.DataSet.FieldByName('CLIENTE').AsInteger  ) OR
             (awrExtension <> dsFuente.DataSet.FieldByName('EXTENSION').AsInteger) ) then
        begin
           spNCREDITO_DESCUENTOS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spNCREDITO_DESCUENTOS.ExecProc;
           spNCREDITO_DESCUENTOS.Transaction.CommitRetaining;
        end
        else
        if (tmpDescGlobal <> dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat) then
        begin
           spNCREDITO_DESCUENTO_GLOBAL.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spNCREDITO_DESCUENTO_GLOBAL.ExecProc;
           spNCREDITO_DESCUENTO_GLOBAL.Transaction.CommitRetaining;
        end;
        //refrescar la pantalla con los datos
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.beCXCKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
     beCXCButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_credito.ceSubTotalChange(Sender: TObject);
var lSubtotal : Double;
begin
  inherited;                                            
   if not(cbAutomatico.Text = 'Si') and (dsDetalle.DataSet.State in [dsEdit, dsInsert]) then
   begin
      lSubtotal := StrToFloat(ceSubTotal.Text);
      spCALCULA_IVA.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
      spCALCULA_IVA.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      spCALCULA_IVA.ExecProc;

      spCALCULA_IEPS.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
      spCALCULA_IEPS.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      spCALCULA_IEPS.ExecProc;

      spCALCULA_IMPUESTO_1.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
      spCALCULA_IMPUESTO_1.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      spCALCULA_IMPUESTO_1.ExecProc;

      spCALCULA_IMPUESTO_2.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
      spCALCULA_IMPUESTO_2.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      spCALCULA_IMPUESTO_2.ExecProc;

      dsDetalle.DataSet.FieldByName('IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      dsDetalle.DataSet.FieldByName('IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      dsDetalle.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      dsDetalle.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      dsDetalle.DataSet.FieldByName('IVA').AsFloat            := spCALCULA_IVA.ParamByName('R_IVA').AsFloat;
      dsDetalle.DataSet.FieldByName('IEPS').AsFloat           := spCALCULA_IEPS.ParamByName('R_IEPS').AsFloat;
      dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat      := spCALCULA_IMPUESTO_1.ParamByName('R_IMPUESTO_1').AsFloat;
      dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat      := spCALCULA_IMPUESTO_2.ParamByName('R_IMPUESTO_2').AsFloat;
   end;
end;

procedure TfrmCapturar_notas_de_credito.cbAutomaticoChange(
  Sender: TObject);
begin
  inherited;
  if dsDetalle.DataSet.State in [dsEdit, dsInsert] then
  begin
     ceDescuentoPorc.Enabled := cbAutomatico.Text = 'Si';
     ceSubTotal.Enabled      := not(cbAutomatico.Text = 'Si');
     ceIVA.Enabled           := not(cbAutomatico.Text = 'Si');
     ceIEPS.Enabled          := not(cbAutomatico.Text = 'Si');
     ceImpuesto1.Enabled     := not(cbAutomatico.Text = 'Si');
     ceImpuesto2.Enabled     := not(cbAutomatico.Text = 'Si');

     if not(ceDescuentoPorc.Enabled) then
     begin
        dsDetalle.DataSet.FieldByName('DESC_PORC').AsFloat := 0.00;
        dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat  := 0.00;
        dsDetalle.DataSet.FieldByName('IVA').AsFloat       := 0.00;
        dsDetalle.DataSet.FieldByName('IEPS').AsFloat      := 0.00;
        dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat := 0.00;
        dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat := 0.00;
        ceSubTotal.SetFocus;
     end
     else
     begin
        ceDescuentoPorc.SetFocus;
        calculaTotales;
     end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.ibAddPFactClick(Sender: TObject);
begin
  inherited;
  try
     frmSeleccionarFacturas             := TfrmSeleccionarFacturas.Create(Application);
     frmSeleccionarFacturas.DATABASE    := dmIBModulo.ibSistema;
     frmSeleccionarFacturas.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
     frmSeleccionarFacturas.NC          := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmSeleccionarFacturas.Open;
     frmSeleccionarFacturas.ShowModal;
  finally
     frmSeleccionarFacturas.Free;
     frmSeleccionarFacturas := nil;
  end;
  reglas.abrir_IBTabla(TCapturar);
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_notas_de_credito.ibAddPPedClick(Sender: TObject);
begin
  inherited;
  try
     frmSeleccionarPedidos             := TfrmSeleccionarPedidos.Create(Application);
     frmSeleccionarPedidos.DATABASE    := dmIBModulo.ibSistema;
     frmSeleccionarPedidos.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
     frmSeleccionarPedidos.NC          := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmSeleccionarPedidos.Open;
     frmSeleccionarPedidos.ShowModal;
  finally
     frmSeleccionarPedidos.Free;
     frmSeleccionarPedidos := nil;
  end;
  reglas.abrir_IBTabla(TCapturar);
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_notas_de_credito.edClienteButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente_ := TfrmSeleccionarCliente_.Create(Application);
           frmSeleccionarCliente_.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente_.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente_.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente_.abrirConsulta then
           begin
              frmSeleccionarCliente_.ShowModal;
              if frmSeleccionarCliente_.ACEPTAR then
              begin
                 edCliente.Text                                                := frmSeleccionarCliente_.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente_.ID;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente_.DESC_PORC;
                 if frmSeleccionarCliente_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarCliente_.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                                                := frmSeleccionarCliente_.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente_.ID;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente_.DESC_PORC;
                 if frmSeleccionarCliente_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarCliente_.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente_.Free;
           frmSeleccionarCliente_ := nil;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant           := null;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  {
  if Key = #13 then
     edCliente.OnButtonClick(Sender, 0);
     }
end;

procedure TfrmCapturar_notas_de_credito.ibImprimirClick(Sender: TObject);
begin
  inherited;
//  itemImprimir.Click;
  frmCFNCredito := TfrmCFNCredito.Create(Application);
  try
     frmCFNCredito.ID           := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmCFNCredito.ESTATUS      := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
     frmCFNCredito.SIN_IVA      := dsFuente.DataSet.FieldByName('ELIMINAR_IVA').AsString = 'Si';
     frmCFNCredito.ENLAZADAS    := true;
     frmCFNCredito.BTN_CANCELAR := true;
     frmCFNCredito.XML          := dsFuente.DataSet.FieldByName('XML').AsString;
     if dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger = 0 then
        frmCFNCredito.impresion
     else
        frmCFNCredito.preview;
  finally
     frmCFNCredito.Free;
  end;

  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_notas_de_credito.itemPreviewClick(Sender: TObject);
begin
  inherited;
   frmCFNCredito := TfrmCFNCredito.Create(Application);
   try
      frmCFNCredito.ID           := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmCFNCredito.ESTATUS      := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
      frmCFNCredito.SIN_IVA      := dsFuente.DataSet.FieldByName('ELIMINAR_IVA').AsString = 'Si';
      frmCFNCredito.ENLAZADAS    := true;
      frmCFNCredito.BTN_CANCELAR := true;
      frmCFNCredito.XML          := dsFuente.DataSet.FieldByName('XML').AsString;
      frmCFNCredito.preview;
   finally
      frmCFNCredito.Free;
   end;
{
  try
     frmPRN_0015_TXT := TfrmPRN_0015_TXT.CrearA(Application, dsFuente.DataSet.FieldByName('ID').AsInteger);
     frmPRN_0015_TXT.preview;
  finally
     frmPRN_0015_TXT.Free;
  end;}
end;

procedure TfrmCapturar_notas_de_credito.dgPartidasBTN_PORCButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if awrActivarDP then
  begin
     if (dsFuente.DataSet.FieldByName('ESTATUS').AsString       = 'Sin Afectar') and
        (dsPartidas.DataSet.FieldByName('R_MATERIAL').AsString <> ''           ) then
     begin
     {
        idPorcentaje.Entrada := dsPartidas.DataSet.FieldByName('R_DESC_PORC').AsString;
        idPorcentaje.Execute;
        if idPorcentaje.Respuesta and (idPorcentaje.Entrada <> '') then
        begin
           spM_NCREDITO_DP_PORC.ParamByName('P_ID').AsInteger    := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
           spM_NCREDITO_DP_PORC.ParamByName('P_PORC_DP').AsFloat := StrToFloat(idPorcentaje.Entrada);
           spM_NCREDITO_DP_PORC.ExecProc;
           spM_NCREDITO_DP_PORC.Transaction.CommitRetaining;
           //refrescar la pantalla con los datos
           reglas.abrir_IBTabla(TCapturar);
           reglas.refresh_IBQuery(qyPartidas);
           dgPartidas.FullExpand;
        end;
        }
     end
     else
     if (dsPartidas.DataSet.FieldByName('R_MATERIAL').AsString = '') then
     begin
        ShowMessage( 'No se puede cambiar porcentaje de descuento parcial. No esta activada la preferencia (349). ');
     end
     else
     begin
        ShowMessage( 'Mensaje: Estatus = "Sin Afectar"');
     end
  end
  else
     
end;

procedure TfrmCapturar_notas_de_credito.ibRetencionClick(Sender: TObject);
begin
  inherited;
   if ejecucionRetencionIVA then
   begin
      reglas.abrir_IBTabla(TCapturar);
      reglas.refresh_IBQuery(qyPartidas);
      //dgPartidas.FullExpand;
   end;
end;

procedure TfrmCapturar_notas_de_credito.ibRetencionISRClick(
  Sender: TObject);
begin
  inherited;
   if ejecucionRetencionISR then
   begin
      reglas.abrir_IBTabla(TCapturar);
      reglas.refresh_IBQuery(qyPartidas);
      //dgPartidas.FullExpand;
   end;
end;

procedure TfrmCapturar_notas_de_credito.dgPartidasRETENCION_IVAButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') and
     (dsFuente.DataSet.State = dsBrowse                               ) then
  begin
     if ejecucionRetencionDetalleIVA then
     begin
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.dgPartidasRETENCION_ISRButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') and
     (dsFuente.DataSet.State = dsBrowse                               ) then
  begin
     if ejecucionRetencionDetalleISR then
     begin
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
end;

procedure TfrmCapturar_notas_de_credito.itemPreview2Click(Sender: TObject);
begin
  inherited;
   frmCFNCredito := TfrmCFNCredito.Create(Application);
   try
      frmCFNCredito.ID           := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmCFNCredito.ESTATUS      := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
      frmCFNCredito.SIN_IVA      := dsFuente.DataSet.FieldByName('ELIMINAR_IVA').AsString = 'Si';
      frmCFNCredito.ENLAZADAS    := true;
      frmCFNCredito.BTN_CANCELAR := true;
      frmCFNCredito.XML          := dsFuente.DataSet.FieldByName('XML').AsString;
      frmCFNCredito.preview2;
   finally
      frmCFNCredito.Free;
   end;
end;

end.
