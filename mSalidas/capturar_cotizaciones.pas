unit capturar_cotizaciones;

interface

uses
  UfrmHorizontal, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, Db, IBX.IBQuery,   explorar_cotizaciones_estatus,
  Menus, UfrmFrameMaterial, Grids, DBGrids,
  StdCtrls, DBCtrls,  Buttons, IBX.IBStoredProc, IBX.IBTable,
  IBX.IBCustomDataSet, Mask, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit;

type
  TfrmCapturar_cotizaciones = class(TfrmCapturarMDI)
    Label2: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    deRazonSocial: TDBEdit;
    deTelefono: TDBEdit;
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    leMoneda: TDBLookupComboBox;
    Label12: TLabel;
    leCondicion_Comercial: TDBLookupComboBox;
    Label13: TLabel;
    TCondiciones_Comerciales: TIBTable;
    dsCondiciones_Comerciales: TDataSource;
    TCondiciones_ComercialesID: TIntegerField;
    TCondiciones_ComercialesTIPO: TIBStringField;
    TCondiciones_ComercialesCLAVE: TIBStringField;
    TCondiciones_ComercialesNOMBRE: TIBStringField;
    TCondiciones_ComercialesNUM_PAGOS: TIntegerField;
    TCondiciones_ComercialesINTERVALO_ENTRE_PAGOS: TIntegerField;
    TCondiciones_ComercialesDESPLAZAMIENTO_1_PAGO: TIntegerField;
    TCondiciones_ComercialesDESCUENTO_PORCENTAJE: TFloatField;
    TCondiciones_ComercialesFINANCIAMIENTO: TIntegerField;
    TCondiciones_ComercialesMORATORIO: TIBStringField;
    TMonedas: TIBTable;
    dsMonedas: TDataSource;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    TCapturardescripcion_moneda: TIBStringField;
    dsMateriales_Unidades: TDataSource;
    spDEL_PARTIDA_COTIZACION: TIBStoredProc;
    spCALCULA_IVA: TIBStoredProc;
    spCALCULA_IEPS: TIBStoredProc;
    spCALCULA_IMPUESTO_1: TIBStoredProc;
    spCALCULA_IMPUESTO_2: TIBStoredProc;
    deFechaAlta: TDBEdit;
    spEstatus: TIBStoredProc;
    Label18: TLabel;
    deClave: TDBEdit;
    Label1: TLabel;
    deObservaciones: TDBMemo;
    Label16: TLabel;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_VALIDEZ: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarRAZON_SOCIAL: TIBStringField;
    TCapturarTELEFONO: TIBStringField;
    TCapturarPEDIDO: TIntegerField;
    TCapturarMONEDA: TIntegerField;
    TCapturarCONDICION_COMERCIAL: TIntegerField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarSUBTOTAL: TFloatField;
    TCapturarIVA: TFloatField;
    TCapturarIEPS: TFloatField;
    TCapturarIMPUESTO1: TFloatField;
    TCapturarIMPUESTO2: TFloatField;
    TCapturarTOTAL: TFloatField;
    TCapturarDESCUENTO_GLOBAL_PORC: TFloatField;
    TCapturarDESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    TCapturarDESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    TCapturarGRANTOTAL: TFloatField;
    TCapturarESTATUS: TIBStringField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_COTIZACION: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_PRECIO: TFloatField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_TOTAL: TFloatField;
    qyPartidasR_DESCUENTO_PORC: TFloatField;
    qyPartidasR_DP: TFloatField;
    qyPartidasR_DG: TFloatField;
    qyPartidasR_GT: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    ibNuevaPartida: TBitBtn;
    spTOTALES_COTIZACION: TIBStoredProc;
    spDESCUENTOS: TIBStoredProc;
    spID2: TIBStoredProc;
    dgPartidas: TDBGrid;
    Label15: TLabel;
    ceDescGlobal: TDBEdit;
    ceAnticipo: TDBEdit;
    Label21: TLabel;
    TCapturarANTICIPO: TFloatField;
    TCapturarVENDEDOR: TIntegerField;
    qyMateriales_Unidades: TIBQuery;
    qyMateriales_UnidadesR_ID: TIntegerField;
    qyMateriales_UnidadesR_MATERIAL: TIntegerField;
    qyMateriales_UnidadesR_UNIDAD: TIntegerField;
    qyMateriales_UnidadesR_CLAVE: TIBStringField;
    qyMateriales_UnidadesR_DESCRIPCION: TIBStringField;
    qyMateriales_UnidadesR_FACTOR: TFloatField;
    TCapturarnombre_condicion: TIBStringField;
    deCliente: TDBEdit;
    Label3: TLabel;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    MarcoMateriales1: TMarcoMateriales;
    qyDescuentos: TIBQuery;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    qyPartidasR_ROWS: TIntegerField;
    sbRefreshCondicion: TSpeedButton;
    sbRefreshMonedas: TSpeedButton;
    TCapturarCONSECUTIVO: TIntegerField;
    TCondiciones_ComercialesPUNTO_DE_VENTA: TIBStringField;
    TCondiciones_ComercialesREQUIERE_AUTORIZACION: TIBStringField;
    TCondiciones_ComercialesREQUIERE_FOLIO: TIBStringField;
    TCondiciones_ComercialesPAGOS: TIBStringField;
    TCondiciones_ComercialesREQUIERE_REFERENCIA: TIBStringField;
    TCondiciones_ComercialesREQUIERE_FECHA: TIBStringField;
    TCondiciones_ComercialesREQUIERE_BANCO: TIBStringField;
    TCondiciones_ComercialesPAGOS_CXP: TIBStringField;
    TCondiciones_ComercialesPLANES_DE_PAGO: TIBStringField;
    ibPlanes: TBitBtn;
    spPRESUPUESTO_COTIZACION: TIBStoredProc;
    ppPlanes: TPopupMenu;
    itemPlanes: TMenuItem;
    itemSinPlanes: TMenuItem;
    buImpresion: TBitBtn;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    buAplicar: TBitBtn;
    dxDBEdit1: TDBEdit;
    qyMsg: TIBQuery;
    qyMsgR_SALDO: TFloatField;
    qyMsgR_LIMITE: TFloatField;
    qyMsgR_TOTAL_VENCIDO: TFloatField;
    qyMsgR_ALMACEN_VENCIDO: TFloatField;
    qyMsgR_MSG_LIMITE: TIBStringField;
    qyMsgR_MSG_VENCIDO: TIBStringField;
    TCapturarPAGOS: TIntegerField;
    TCapturarFINANCIAMIENTO: TFloatField;
    TCapturarFINANCIAMIENTO_PORC: TFloatField;
    TCapturarSEGURO_SUBTOTAL: TFloatField;
    TCapturarSEGURO_IVA: TFloatField;
    TCapturarseguro: TFloatField;
    TCapturarsupertotal: TFloatField;
    Label4: TLabel;
    edAlmacen: TEdit;
    spADD_PARTIDA_COTIZACION: TIBStoredProc;
    qyPartidasR_COMENTARIO: TIBStringField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    ibPedido: TBitBtn;
    spA_PEDIDO_DESDE_COTIZACION: TIBStoredProc;
    JvArrowButton1: TBitBtn;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    itemPreview: TMenuItem;
    itemCorta: TMenuItem;
    itemPreviewC: TMenuItem;
    TCapturarPROYECTO: TIBStringField;
    Label8: TLabel;
    edProyecto: TDBEdit;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    btnNOM: TBitBtn;
    BtnContacto: TButton;
    Label10: TLabel;
    BtnDomicilios: TButton;
    Label11: TLabel;
    DBContacto_Nombre: TDBEdit;
    DBDom_Muestreo: TDBEdit;
    TCapturarCONTACTO_ID: TIntegerField;
    TCapturarDOM_MUESTREO_ID: TIntegerField;
    TCapturarCONTACTO: TIBStringField;
    TCapturarDOM_MUESTREO: TIBStringField;
    TCapturarORDEN_COMPRA: TIBStringField;
    cxDBDateEdit1: TcxDBDateEdit;
    TCapturarFECHA_ENTREGA: TDateTimeField;
    TCapturarNOM_DESCRIPCION: TIBStringField;
    TCapturarNOM_ID: TIntegerField;
    Label17: TLabel;
    cxDBDateEdit2: TcxDBDateEdit;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    BitBtn1: TBitBtn;
    DBDomicilio_cliente: TDBEdit;
    Label19: TLabel;
    Busca_domicilio: TIBQuery;
    TCapturarDOMICILIO: TIBStringField;
    Button1: TButton;
    Nom_incompleta: TIBQuery;
    DBid_solicitud: TDBEdit;
    TCapturarID_SOLICITUD: TIntegerField;
    Btnemail: TButton;
    cbEstatus: TDBLookupComboBox;
    edEstatus: TDBEdit;
    ibEstatus: TIBQuery;
    ibcambia_enviado: TIBQuery;
    ibvalida_sol_cot: TIBQuery;
    spCOTIZACIONESS_DESCUENTO_GLOBAL: TIBStoredProc;
    spCOTIZACION_DESCUENTOS: TIBStoredProc;
    TCapturarDIRIGIR_A: TIntegerField;
    DBLookupComboBox1: TDBLookupComboBox;
    IBClientes: TIBQuery;
    DsClientes: TDataSource;
    Label20: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure dsDetalleDataChange(Sender: TObject;
      Field: TField);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure coSUBTOTALDrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure coIVADrawSummaryFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; var AText: String; var AAlignment: TAlignment;
      AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure coIEPSDrawSummaryFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; var AText: String; var AAlignment: TAlignment;
      AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure coIMPUESTO1DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure coIMPUESTO2DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure coTOTALDrawSummaryFooter(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; var AText: String; var AAlignment: TAlignment;
      AFont: TFont; var AColor: TColor; var ADone: Boolean);
    procedure coDESCUENTOPARCIALDrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure coGRANTOTAL2DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure coDESCUENTOGLOBALDrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure deClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TDetalleCalcFields(DataSet: TDataSet);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure deClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibPlanesClick(Sender: TObject);
    procedure itemPlanesClick(Sender: TObject);
    procedure itemSinPlanesClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure buAplicarClick(Sender: TObject);
    procedure dgPartidasRTFUpButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasRTFDownButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure ibPedidoClick(Sender: TObject);
    procedure itemCortaClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
    procedure itemPreviewCClick(Sender: TObject);
    procedure btnNOMClick(Sender: TObject);
    procedure BtnContactoClick(Sender: TObject);
    procedure BtnDomiciliosClick(Sender: TObject);
    procedure EdContactoKeyPress(Sender: TObject; var Key: Char);
    procedure DBContacto_NombreKeyPress(Sender: TObject; var Key: Char);
    procedure DBDom_MuestreoKeyPress(Sender: TObject; var Key: Char);
    procedure ibGuardarClick(Sender: TObject);
    procedure deClienteExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BtnemailClick(Sender: TObject);
    procedure dsEstatusDataChange(Sender: TObject; Field: TField);
    procedure cbEstatusEnter(Sender: TObject);
    procedure cbEstatusExit(Sender: TObject);
    procedure ceDescGlobalKeyPress(Sender: TObject; var Key: Char);
    procedure ceDescGlobalExit(Sender: TObject);
  private
    { Private declarations }
    v_cliente, TopIdx : Integer;
    Key    : Variant;
    WDomicilio, Wcontacto : Integer;
    awrCliente     : INTEGER;
    tmpDescGlobal   : double;
    msg_limite     : boolean;
    msg_vencidos   : boolean;
    edicionDetalle : boolean;//<-valida los botones
    awrLPxDesc     : boolean;//<-Para saber si esta activada la lista de precios por descuentos.
    awrSeguro      : boolean;

    procedure BeforeRecord;
    procedure BeforeUpdate;
    procedure AfterRecord;

    procedure almacenar(vMedida, vColor : variant);
    procedure almacenarCorrida(vMedida, vColor : variant);

    procedure refreshTotales(vCual : integer);
    procedure fijarBotonesDetalle;
    procedure verificarSaldos;
    procedure solo_numeros_y_punto(var k : char; texto : string);
  protected
    awrAlmUsr : integer;
  public
    { Public declarations }
    procedure abre_y_cierra;
  end;

var
  frmCapturar_cotizaciones: TfrmCapturar_cotizaciones;

implementation

uses
  IBModulo, IBData, reglas_de_negocios,
  explorar_cotizaciones, seleccionar_cliente,
  seleccionar_material, UfrmSeleccionarCliente, UfrmPresupuesto, UPRN_0036,
  UfrmAcceso, UfrmRTF, UVincula_NOM, Capturar_contactos, Seleccionar_Domicilios, vincula_Sol_Cot, captura;

{$R *.DFM}

procedure WinExecNoWait32(FileName:String; Visibility : integer);
{Ejectuta el programa y espera a que termine.
Las opciones de visibilidad son las t�picas
en estos casos: SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
                SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
                SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
                SW_SHOWNOACTIVATE, SW_SHOWNORMAL
                Si necesitas m�s informaci�n sobre estas opciones
                busca la funci�n ShowWindow en la ayuda del Api de
                Windows}
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  CreateProcess(nil,
    zAppName,
    nil,
    nil,
    false,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcessInfo);

    if ProcessInfo.hProcess <> 0 then
       WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
end;

procedure TfrmCapturar_cotizaciones.BeforeUpdate;
//var
  //N: TdxTreeListNode;
begin
{
   if MarcoMateriales1.FLAG_ESTADO = stNuevo then
   begin
      Key    := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      TopIdx := 0;
   end
   else
      begin
         N := dgPartidas.FocusedNode;

         if N = nil then
           TopIdx := -1
         else
         begin
           Key    := TdxDBGridNode(N).Id;
           TopIdx := dgPartidas.TopIndex;
         end;
      end;
      }
end;

procedure TfrmCapturar_cotizaciones.BitBtn1Click(Sender: TObject);
begin
  inherited;

  frm_vinculaSolCot := Tfrm_vinculaSolCot.Create(Application);
//   frm_vinculaSolCot.set_cotizacion( dsFuente.DataSet.FieldByName('ID').AsINteger);
  frm_vinculaSolCot.ShowModal;

  if (frm_vinculaSolCot.GetAceptado() = 1 )  then
    begin
      ibvalida_sol_cot.close;
      ibvalida_sol_cot.ParamByName('p_sol_cot').AsInteger:=frm_vinculaSolCot.regresa_solicitud();
      ibvalida_sol_cot.Open;
      if (ibvalida_sol_cot.FieldByName('count').AsInteger<1) then
        begin
          ibNuevo.Click;
          deCliente.text := frm_vinculaSolCot.Regresa_cliente();
          deTelefono.Text:= frm_vinculaSolCot.Regresa_telefono();
          deObservaciones.Text:= frm_vinculaSolCot.regresa_observaciones();
          DBid_solicitud.Text:=IntToStr(frm_vinculaSolCot.regresa_solicitud());
          dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := frm_vinculaSolCot.regresa_id_cliente();
          DBDomicilio_cliente.SetFocus;
        end
      else
        begin
          ShowMessage('La solicitu de cotizacion ya fue asignada en una cotizaci�n ');
        end;
    end;
  frm_vinculaSolCot.free;
end;

procedure TfrmCapturar_cotizaciones.btnNOMClick(Sender: TObject);
begin
//  inherited;
  FrmVincula_NOM := TFrmVincula_NOM.Create(Application);
  FrmVincula_NOM.set_cotizacion( dsFuente.DataSet.FieldByName('ID').AsINteger);
  FrmVincula_NOM.ShowModal;
  if (FrmVincula_NOM.GetAceptado() = 1 )  then
    begin
      qyPartidas.Close;
      qyPartidas.Open;
      DBEdit2.Text:= FrmVincula_NOM.GetnoMBREnOM;
     // ibCancelar.Click;
    end;
  FrmVincula_NOM.Free;
  refreshTotales(0);
end;

procedure TfrmCapturar_cotizaciones.BeforeRecord;
//var
  //N: TdxTreeListNode;
begin
{
  N := dgPartidas.FocusedNode.GetNextNode;
  if N = nil then
    N := dgPartidas.FocusedNode.GetPriorNode;

  if N = nil then
    TopIdx := -1
  else
  begin
    Key := TdxDBGridNode(N).Id;
    TopIdx := dgPartidas.TopIndex;
  end;
  }
end;

procedure TfrmCapturar_cotizaciones.AfterRecord;
//var
  //N: TdxTreeListNode;
begin
{
  if TopIdx <> -1 then
  begin
    dgPartidas.TopIndex := TopIdx;
    N := dgPartidas.FindNodeByKeyValue(Key);
    if N <> nil then
    begin
       N.Focused  := True;
       N.Selected := true;
    end;
  end;
  }
end;

procedure TfrmCapturar_cotizaciones.almacenarCorrida(vMedida, vColor : variant);
begin
   spADD_PARTIDA_COTIZACION.ParamByName('P_ID').AsInteger        := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spADD_PARTIDA_COTIZACION.ParamByName('P_DETALLE').AsInteger   := 0;
   spADD_PARTIDA_COTIZACION.ParamByName('P_MATERIAL').AsInteger  := MarcoMateriales1.edMaterial.Tag;
   spADD_PARTIDA_COTIZACION.ParamByName('P_CANTIDAD').AsFloat    := MarcoMateriales1.edCantidad.Value;
   spADD_PARTIDA_COTIZACION.ParamByName('P_PRECIO').AsFloat      := MarcoMateriales1.edPrecioCosto.Value;
   spADD_PARTIDA_COTIZACION.ParamByName('P_UNIDAD').AsInteger    := MarcoMateriales1.cbUnidades.KeyValue;
   spADD_PARTIDA_COTIZACION.ParamByName('P_MEDIDA').Value        := vMedida;
   spADD_PARTIDA_COTIZACION.ParamByName('P_COLOR').Value         := vColor;
   spADD_PARTIDA_COTIZACION.ParamByName('P_PORC_DP').AsFloat     := MarcoMateriales1.edDescuentoPorc.Value;
   spADD_PARTIDA_COTIZACION.ParamByName('P_COMENTARIO').AsString := MarcoMateriales1.edComentario.Text;
   spADD_PARTIDA_COTIZACION.ExecProc;
   spADD_PARTIDA_COTIZACION.Transaction.CommitRetaining;

   Key    := spADD_PARTIDA_COTIZACION.ParamByName('R_DETALLE').AsInteger;
   TopIdx := 0;
end;

procedure TfrmCapturar_cotizaciones.almacenar(vMedida, vColor : variant);
begin
   Key := 0;
   if MarcoMateriales1.FLAG_ESTADO = stModificar then
      Key := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;

   spADD_PARTIDA_COTIZACION.ParamByName('P_ID').AsInteger        := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spADD_PARTIDA_COTIZACION.ParamByName('P_DETALLE').AsInteger   := Key;
   spADD_PARTIDA_COTIZACION.ParamByName('P_MATERIAL').AsInteger  := MarcoMateriales1.edMaterial.Tag;
   spADD_PARTIDA_COTIZACION.ParamByName('P_CANTIDAD').AsFloat    := (MarcoMateriales1.edCantidad.Value);
   spADD_PARTIDA_COTIZACION.ParamByName('P_PRECIO').AsFloat      := (MarcoMateriales1.edPrecioCosto.Value);
   spADD_PARTIDA_COTIZACION.ParamByName('P_UNIDAD').AsInteger    := MarcoMateriales1.cbUnidades.KeyValue;
   spADD_PARTIDA_COTIZACION.ParamByName('P_MEDIDA').Value        := vMedida;
   spADD_PARTIDA_COTIZACION.ParamByName('P_COLOR').Value         := vColor;
   spADD_PARTIDA_COTIZACION.ParamByName('P_PORC_DP').AsFloat     := (MarcoMateriales1.edDescuentoPorc.Value);
   spADD_PARTIDA_COTIZACION.ParamByName('P_COMENTARIO').AsString := MarcoMateriales1.edComentario.Text;
   spADD_PARTIDA_COTIZACION.ExecProc;
   spADD_PARTIDA_COTIZACION.Transaction.CommitRetaining;

   Key    := spADD_PARTIDA_COTIZACION.ParamByName('R_DETALLE').AsInteger;
   TopIdx := 0;

   reglas.abrir_IBTabla(TCapturar);
   reglas.refresh_IBQuery(qyPartidas);

   AfterRecord;

   edicionDetalle := not edicionDetalle;
   FijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.verificarSaldos;
begin
   if dsFuente.DataSet.FieldByName('CLIENTE').AsInteger <> 0 then
   begin
      if msg_limite or msg_vencidos then
      begin
         qyMsg.Close;
         qyMsg.ParamByName('P_CLIENTE').AsInteger := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
         qyMsg.ParamByName('P_ALMACEN').AsInteger := 0;
         qyMsg.Open;
      end;
      if msg_limite and (qyMsg.FieldByName('R_MSG_LIMITE').AsString = 'SI') then
      begin
         ShowMessage('Su limite es: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_LIMITE').AsFloat)+#13+'Saldo de: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_SALDO').AsFloat));
      end;
      if msg_vencidos and (qyMsg.FieldByName('R_MSG_VENCIDO').AsString = 'SI') then
      begin
         ShowMessage( 'Vencido es: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_TOTAL_VENCIDO').AsFloat)+#13+'Vencido en este almacen: : '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_ALMACEN_VENCIDO').AsFloat));
      end;

{      if (msg_limite   and (qyMsg.FieldByName('R_MSG_LIMITE').AsString  = 'SI')) or
         (msg_vencidos and (qyMsg.FieldByName('R_MSG_VENCIDO').AsString = 'SI')) then
      begin
         if dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar' then
            dsFuente.DataSet.FieldByName('ESTATUS').AsString := 'Autorizar';
      end
      else
         begin
            if dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Autorizar' then
               dsFuente.DataSet.FieldByName('ESTATUS').AsString := 'Sin Afectar';
         end;}
   end;
end;

procedure TfrmCapturar_cotizaciones.refreshTotales(vCual : integer);
begin
   if vCual = 0 then
      BeforeRecord
   else
      BeforeUpdate;

   spTOTALES_COTIZACION.ParamByName('P_COTIZACION').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spTOTALES_COTIZACION.ExecProc;
   spTOTALES_COTIZACION.Transaction.CommitRetaining;
   reglas.abrir_IBTabla(TCapturar);
   reglas.refresh_IBQuery(qyPartidas);

   AfterRecord;
end;

procedure TfrmCapturar_cotizaciones.FormCreate(
  Sender: TObject);
begin
  MarcoMateriales1.MOVIMIENTO := obSalida;
  MarcoMateriales1.inicializar(true);

  reglas.abrir_IBTabla(dmIBData.TFiltroMateriales);
  inherited;
  reglas.abrir_IBTabla(TMonedas);
  reglas.refresh_IBQuery(qyPartidas);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
  reglas.abrir_IBTabla(dmIBData.TFiltroUsuarios);
  reglas.refresh_IBQuery(IBClientes);

  //Presentacion de condiciones comerciales
  dmIBData.TPreferencias.Filter := 'ID = 102';
  if (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'PLANES') then
     TCondiciones_Comerciales.Filtered := true
  else
     TCondiciones_Comerciales.Filtered := false;
  reglas.abrir_IBTabla(TCondiciones_Comerciales);

  //Activar columna Medidas
//  dgPartidasMEDIDAS.Visible := MarcoMateriales1.FLAG_MEDIDAS;
  //Activar columna colores
  //dgPartidasCOLORES.Visible := MarcoMateriales1.FLAG_COLORES;


  //msg limite
  dmIBData.TPreferencias.Filter := 'ID = 71';
  msg_limite := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //msg vencidos
  dmIBData.TPreferencias.Filter := 'ID = 122';
  msg_vencidos := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Lista de Precios x Descuentos
  dmIBData.TPreferencias.Filter := 'ID = 80';
  awrLPxDesc                    := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'PORDESCUENTO';
  MarcoMateriales1.ENABLED_DP   := not(awrLPxDesc);

  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';
  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
//  laGranTotal.Visible  := awrSeguro;
 // edGranTotal.Visible  := awrSeguro;
 // laSeguro.Visible     := awrSeguro;
 // edSeguro.Visible     := awrSeguro;

  //Usuario Almacen
  dmIBData.TFiltroUsuarios.Filter := 'ID = '+ IntToStr(reglas.dame_usuario);
  awrAlmUsr := dmIBData.TFiltroUsuarios.FieldByName('ALMACEN').AsInteger;
  //Almacen Gral
  dmIBData.TFiltroAlmacenes.Filter := 'ID = '+ IntToStr(awrAlmUsr);
  edAlmacen.Text := dmIBData.TFiltroAlmacenes.FieldByName('CLAVE').AsString;

  awrLogica := 'AND';
end;

procedure TfrmCapturar_cotizaciones.dsFuenteDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     buAplicar.Enabled    := false;
     paLienzo2.Visible    :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     ibEliminar.Enabled   := ibEliminar.Enabled and (TDataSource(sender).DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibPlanes.Enabled     := (TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     itemPlanes.Enabled   := (TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     deCliente.Enabled    :=(dsPartidas.DataSet.IsEmpty and (TDataSource(sender).DataSet.State = dsEdit)) or (TDataSource(sender).DataSet.State in [dsInsert,dsBrowse]);
//     ceDescGlobal.Enabled :=((dsPartidas.DataSet.IsEmpty and (TDataSource(sender).DataSet.State = dsEdit)) or (TDataSource(sender).DataSet.State in [dsInsert,dsBrowse])) and not(awrLPxDesc);
     ibPedido.Enabled     :=(TDataSource(sender).DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') OR (TDataSource(sender).DataSet.FieldByName('ESTATUS').AsString = 'Parcialmente Surtido');
  end;
end;

procedure TfrmCapturar_cotizaciones.ibNuevoClick(
  Sender: TObject);
begin
  inherited;
  dmIBData.TPreferencias.Filter := 'ID = 3';
  if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger <> 0 then
     dsFuente.DataSet.FieldByName('MONEDA').AsInteger := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime              := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString                   := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('FECHA_VALIDEZ').AsDateTime           := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('VENDEDOR').AsInteger                 := reglas.dame_usuario;

  dsFuente.DataSet.FieldByName('NOMBRE').AsString                    := '<FALTA>';
  dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat      := 0;
  dsFuente.DataSet.FieldByName('ANTICIPO').AsFloat                   := 0;
  dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat                   := 0;
  dsFuente.DataSet.FieldByName('IVA').AsFloat                        := 0;
  dsFuente.DataSet.FieldByName('IEPS').AsFloat                       := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('TOTAL').AsFloat                      := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat  := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat := 0;
  dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat                  := 0;
  dsFuente.DataSet.FieldByName('CLIENTE').AsInteger                  := -3;
  dsFuente.DataSet.FieldByName('NOMBRE').AsString                    := '<FALTA>';
  dsFuente.DataSet.FieldByName('RAZON_SOCIAL').AsString              := '<FALTA>';
  dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger      := -3;
  dsFuente.DataSet.FieldByName('PAGOS').AsFloat                      := 0;
  dsFuente.DataSet.FieldByName('FINANCIAMIENTO').AsFloat             := 0;
  dsFuente.DataSet.FieldByName('FINANCIAMIENTO_PORC').AsFloat        := 0;
  deClave.SetFocus;
  btnNOM.Visible:=false;
end;

procedure TfrmCapturar_cotizaciones.ibModificarClick(
  Sender: TObject);
begin
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  awrCliente    := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
  tmpDescGlobal := dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat;
  inherited;
  deClave.SetFocus;
end;

procedure TfrmCapturar_cotizaciones.dsDetalleDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
{  if TDataSource(sender).DataSet <> nil then
  begin
     ibNuevaPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibModificarPartida.Enabled :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibGuardarPartida.Enabled   :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibCancelarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibEliminarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     paCaptura.Visible          :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
  end;}
end;

procedure TfrmCapturar_cotizaciones.dsEstatusDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if (cbEstatus.Text <> '') and (cbEstatus.Text <> awrStatus.EstatusSel) then
  begin
     awrStatus.estatusSel   := dsEstatus.DataSet.FieldByName('R_ESTATUS').AsString;
     awrStatus.autorizacion := dsEstatus.DataSet.FieldByName('R_AUTORIZACION').AsString = 'Si';
     awrStatus.storeproc    := dsEstatus.DataSet.FieldByName('R_STOREPROC').AsString;
     awrStatus.nivel        := dsEstatus.DataSet.FieldByName('R_NIVEL').AsInteger;
     awrStatus.id           := dsEstatus.DataSet.FieldByName('R_ID').AsInteger;
     awrStatus.correo       := dsEstatus.DataSet.FieldByName('R_CORREO').AsString = 'Si';

     dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusSel;

     buAplicar.Enabled := true;
     ibGuardar.Enabled := false;
  end;
end;

procedure TfrmCapturar_cotizaciones.ibEliminarPartidaClick(
  Sender: TObject);
var
   i   : integer;
   L   : TList;
   tmp : string;
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     L := TList.Create;
     {
     for i := 0 to dgPartidas.DataSource.DataSet.RecordCount do
         L.Add(dgPartidas.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
     for i := 0 to (L.Count - 1) do
     begin
        tmp := TdxTreeListNode(L.Items[i]).Strings[0];
        spDEL_PARTIDA_COTIZACION.ParamByName('P_ID').AsString := tmp;
        spDEL_PARTIDA_COTIZACION.ExecProc;
        spDEL_PARTIDA_COTIZACION.Transaction.CommitRetaining;
     end;
     L.Free;

     refreshTotales(0);
     }
     spDEL_PARTIDA_COTIZACION.ParamByName('P_ID').AsString :=  dsPartidas.DataSet.FieldByName('R_ID').AsString;
     spDEL_PARTIDA_COTIZACION.ExecProc;
     spDEL_PARTIDA_COTIZACION.Transaction.CommitRetaining;
     refreshTotales(0);
     fijarBotonesDetalle;
     Nom_incompleta.close;
     Nom_incompleta.ParamByName('P_cotizacion').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     Nom_incompleta.Open;
     Nom_incompleta.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_cotizaciones.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.ibGuardarClick(Sender: TObject);
var
   statusDS   : TDataSetState;
begin
  statusDS := dsFuente.DataSet.State;
  inherited;
  FijarBotonesDetalle;
  btnNOM.Visible:=True;
  if (statusDS = dsEdit) then
  begin
     if not(qyPartidas.IsEmpty) then
     begin
        if ( (awrCliente   <> dsFuente.DataSet.FieldByName('CLIENTE').AsInteger)  ) then
        begin
           spCOTIZACION_DESCUENTOS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spCOTIZACION_DESCUENTOS.ExecProc;
           spCOTIZACION_DESCUENTOS.Transaction.CommitRetaining;
        end
        else
        if (tmpDescGlobal <> dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat) then
        begin
           spCOTIZACIONESS_DESCUENTO_GLOBAL.ParamByName('P_COTIZACION').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spCOTIZACIONESS_DESCUENTO_GLOBAL.ExecProc;
           spCOTIZACIONESS_DESCUENTO_GLOBAL.Transaction.CommitRetaining;
        end;
        //refrescar la pantalla con los datos
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
//  refreshTotales(0);
//  inherited;
//  btnNOM.Visible:=True;
end;

procedure TfrmCapturar_cotizaciones.ibGuardarPartidaClick(
  Sender: TObject);
var
   i, j        : integer;
   renglones   : integer;

   v_material  : integer;
   v_precio    : double;
   v_medida    : variant;
   v_color     : variant;
   v_ValMin    : boolean;
begin
  inherited;
  v_ValMin   := true;
  //Verificacion del precio sea mayor o igual al precio minimo
  {
  if not(reglas.validar_precio(MarcoMateriales1.edPrecioCosto.Value, MarcoMateriales1.PRECIOMINIMO, 3)) then
  begin
     v_ValMin := false;
     MarcoMateriales1.edPrecioCosto.Value := MarcoMateriales1.PRECIOMAXIMO;
  end;
  }
  v_material := MarcoMateriales1.edMaterial.Tag;
  v_precio   := MarcoMateriales1.edPrecioCosto.Value;

  if v_ValMin then
  begin
     //proceso normal
     if not(MarcoMateriales1.FLAG_MEDIDAS) or (MarcoMateriales1.FLAG_ESTADO = stModificar) then
     begin
        v_medida := 0;
        v_color  := 0;
        if MarcoMateriales1.FLAG_MEDIDAS then
           v_medida := MarcoMateriales1.cbMedidas.KeyValue;
        if MarcoMateriales1.FLAG_COLORES then
           v_color := MarcoMateriales1.cbColores.KeyValue;

        //proceso comun
        almacenar(v_medida, v_color);
     end
     else
     if MarcoMateriales1.FLAG_MEDIDAS then
     begin
        if MarcoMateriales1.buCapturar.Visible then
        begin
           ibCancelarPartida.Click;

           if MarcoMateriales1.frmHorizontal.colores then
              renglones := MarcoMateriales1.frmHorizontal.renglones
           else
              renglones := 1;

           for i := 1 to renglones do
           begin
              v_color  := 0;

              if MarcoMateriales1.FLAG_COLORES then
                 v_color := MarcoMateriales1.frmHorizontal.color(i);

              for j := 1 to (MarcoMateriales1.frmHorizontal.columnas) do
              begin
                 if MarcoMateriales1.frmHorizontal.cantStr(i,j) <> '' then
                 begin
                    v_medida := MarcoMateriales1.frmHorizontal.medida(j);

                    MarcoMateriales1.edMaterial.Tag      := v_material;
                    MarcoMateriales1.edPrecioCosto.Text  := FloatToStr(v_precio);
                    MarcoMateriales1.edCantidad.Text    := FloatToStr(MarcoMateriales1.frmHorizontal.cantNum(i,j));

                    almacenarCorrida(v_medida, v_color);
                 end;
              end;
           end;
           reglas.abrir_IBTabla(TCapturar);
           reglas.refresh_IBQuery(qyPartidas);
           fijarBotonesDetalle;

           AfterRecord;
        end;
     end;

//           refresh_totales(TDetalle.FieldByName('ID').AsInteger);
  end;
end;

procedure TfrmCapturar_cotizaciones.dgPartidasDblClick(
  Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) and ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.fijarBotonesDetalle;
var
   st : boolean;
begin
  st := (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Afectado' ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Terminado') or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Surtido'  ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado');

  ibNuevaPartida.Enabled     := not edicionDetalle and not(st);
  ibModificarPartida.Enabled := not edicionDetalle and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibEliminarPartida.Enabled  := not edicionDetalle and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibGuardarPartida.Enabled   := edicionDetalle and not(st);
  ibCancelarPartida.Enabled  := edicionDetalle and not(st);
  MarcoMateriales1.Visible   := edicionDetalle and not(st);

  dgPartidas.Enabled         := not edicionDetalle;
//  dgPartidasCantidad.Buttons[0].Visible := not edicionDetalle and not(afectado) and not(dsPartidas.DataSet.IsEmpty);
//  dgPartidasCajas.Buttons[0].Visible    := not edicionDetalle and not(afectado) and not(dsPartidas.DataSet.IsEmpty);
//  dgPartidasPiezas.Buttons[0].Visible   := not edicionDetalle and not(afectado) and not(dsPartidas.DataSet.IsEmpty);
//  dgPartidasKilos.Buttons[0].Visible    := not edicionDetalle and not(afectado) and not(dsPartidas.DataSet.IsEmpty);

{  paExtra.Visible := edicionDetalle and (paCajas.Visible or paKilos.Visible or paPiezas.Visible);
  if paExtra.Visible then
     fpCaptura.Height := fpCaptura.Height + paExtra.Height
  else
     if fpCaptura.Height > fpCaptura.Tag then
        fpCaptura.Height := fpCaptura.Tag;}
end;

procedure TfrmCapturar_cotizaciones.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;

  MarcoMateriales1.datos(awrAlmUsr, dsFuente.DataSet.FieldByName('CLIENTE').AsInteger, 0, dsFuente.DataSet.FieldByName('MONEDA').AsInteger);
  MarcoMateriales1.limpiar;
  //sirve asi, para el caso en que se edite el registro
  //no capturar con boton Capturar.
  MarcoMateriales1.FLAG_ESTADO := stNuevo;

{  dsDetalle.DataSet.Insert;
  spID2.ExecProc;
  dsDetalle.DataSet.FieldByName('ID').AsInteger                 := spID2.ParamByName('R_ID').AsInteger;
  dsDetalle.DataSet.FieldByName('COTIZACION').AsInteger         := dsFuente.DataSet.FieldByName('ID').AsInteger;
  dsDetalle.DataSet.FieldByName('CANTIDAD').AsFloat             := 0.00;
  dsDetalle.DataSet.FieldByName('PRECIO').AsFloat               := 0.00;
  dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat             := 0.00;
  dsDetalle.DataSet.FieldByName('IVA').AsFloat                  := 0.00;
  dsDetalle.DataSet.FieldByName('IEPS').AsFloat                 := 0.00;
  dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat            := 0.00;
  dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat            := 0.00;
  dsDetalle.DataSet.FieldByName('DESCUENTO_PORC').AsFloat       := 0.00;
  dsDetalle.DataSet.FieldByName('IVA_PORC').AsFloat             := 0.00;
  dsDetalle.DataSet.FieldByName('IEPS_PORC').AsFloat            := 0.00;
  dsDetalle.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat       := 0.00;
  dsDetalle.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat       := 0.00;
  dsDetalle.DataSet.FieldByName('PRECIO_SIN_IMPUESTOS').AsFloat := 0.00;
  dsDetalle.DataSet.FieldByName('ESTATUS').AsString             := 'Sin Afectar';}
end;

procedure TfrmCapturar_cotizaciones.coSUBTOTALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coIVADrawSummaryFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IVA').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coIEPSDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IEPS').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coIMPUESTO1DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coIMPUESTO2DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coTOTALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.DBContacto_NombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    begin
      BtnContacto.Click;
    end;

end;

procedure TfrmCapturar_cotizaciones.DBDom_MuestreoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (key=#13) then
    begin
      BtnDomicilios.Click;
    end;

end;

procedure TfrmCapturar_cotizaciones.cbEstatusEnter(Sender: TObject);
begin
  inherited;
  cbEstatus.Width := 140;
end;

procedure TfrmCapturar_cotizaciones.cbEstatusExit(Sender: TObject);
begin
  inherited;
  if (cbEstatus.Text <> '') and (cbEstatus.Text <> awrStatus.EstatusSel) then
  begin
     //  IBAlos.Locate('r_id', strtoint(edit24.text), [loCaseInsensitive]);
     qyEstatus.Locate('r_estatus', cbEstatus.Text , [loCaseInsensitive]);
     awrStatus.estatusSel   := dsEstatus.DataSet.FieldByName('R_ESTATUS').AsString;
     awrStatus.autorizacion := dsEstatus.DataSet.FieldByName('R_AUTORIZACION').AsString = 'Si';
     awrStatus.storeproc    := dsEstatus.DataSet.FieldByName('R_STOREPROC').AsString;
     awrStatus.nivel        := dsEstatus.DataSet.FieldByName('R_NIVEL').AsInteger;
     awrStatus.id           := dsEstatus.DataSet.FieldByName('R_ID').AsInteger;
     awrStatus.correo       := dsEstatus.DataSet.FieldByName('R_CORREO').AsString = 'Si';
     awrStatus.unico        := dsEstatus.DataSet.FieldByName('R_USUARIO').AsInteger;
     awrStatus.unico_n      := dsEstatus.DataSet.FieldByName('R_USUARIO_N').AsString;
     awrStatus.imprimir     := dsEstatus.DataSet.FieldByName('R_IMPRIMIR').AsString = 'Si';

     dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusSel;

     buAplicar.Enabled := true;
     ibGuardar.Enabled := false;
  end;
  cbEstatus.Width := 20;
end;

procedure TfrmCapturar_cotizaciones.ceDescGlobalExit(Sender: TObject);
begin
  inherited;
//    if (ceDescGlobal.Text='') then
//    begin
//      ceDescGlobal.Text:='0';
//    end;
//  if (strtofloat(ceDescGlobal.Text)>99.00) then
//    ceDescGlobal.Text:='0';
end;

procedure TfrmCapturar_cotizaciones.ceDescGlobalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
//  if (ceDescGlobal.Text='') then
//    begin
//      ceDescGlobal.Text:='0';
//    end;
//  solo_numeros_y_punto(Key, ceDescGlobal.Text);
//  if (strtofloat(ceDescGlobal.Text)>99.00) then
//    ceDescGlobal.Text:='0';
end;

procedure TfrmCapturar_cotizaciones.coDESCUENTOPARCIALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coGRANTOTAL2DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.coDESCUENTOGLOBALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat);
end;

procedure TfrmCapturar_cotizaciones.deClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
   case AbsoluteIndex of
     0: begin
           frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE   := deCliente.Text;

           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('NOMBRE').AsString               := frmSeleccionarCliente.NOMBRE__;
                 dsFuente.DataSet.FieldByName('RAZON_SOCIAL').AsString         := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('TELEFONO').AsString             := frmSeleccionarCliente.TELEFONO;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 //deCliente.SetSelection(Length(deCliente.Text),Length(deCliente.Text),false);
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('NOMBRE').AsString               := frmSeleccionarCliente.NOMBRE__;
                 dsFuente.DataSet.FieldByName('RAZON_SOCIAL').AsString         := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('TELEFONO').AsString             := frmSeleccionarCliente.TELEFONO;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 //deCliente.SetSelection(Length(deCliente.Text),Length(deCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
           verificarSaldos;
        end;
     1: begin
           deCliente.Text     := '';
           deRazonSocial.Text := '';

           dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := -3;
        end;
   end;
end;

procedure TfrmCapturar_cotizaciones.deClienteExit(Sender: TObject);
begin
  inherited;
  // ShowMessage(dsFuente.DataSet.fieldByName('Cliente').AsString);
  Busca_domicilio.close;
  Busca_domicilio.ParamByName('P_cliente').asInteger:= dsFuente.DataSet.fieldByName('Cliente').AsInteger;
  Busca_domicilio.Open;
  DBDomicilio_cliente.Text:=Busca_domicilio.fieldByname('Domicilio').asString;


end;

procedure TfrmCapturar_cotizaciones.TDetalleCalcFields(DataSet: TDataSet);
begin
  inherited;
{  if DataSet.FieldByName('MATERIAL').AsString <> '' then
  begin
     dmIBData.TFiltroMateriales.Filter                          := 'ID = '+DataSet.FieldByName('MATERIAL').AsString;
     DataSet.FieldByName('MATERIAL_CLAVE_DESCRIPCION').AsString := dmIBData.TFiltroMateriales.FieldByName('CLAVE').AsString + ', ' + dmIBData.TFiltroMateriales.FieldByName('DESCRIPCION').AsString;
  end
  else
     DataSet.FieldByName('MATERIAL_CLAVE_DESCRIPCION').AsString := '';}
end;

procedure TfrmCapturar_cotizaciones.NuevaPartida1Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.ModificarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.GuardarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.CancelarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.EdContactoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key = #13 then
   begin
     //Button1.Click;
   end;

end;

procedure TfrmCapturar_cotizaciones.EliminarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_cotizaciones.deClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if key = #13 then
   begin
      deClienteButtonClick(Sender, 0);

   end;
end;

procedure TfrmCapturar_cotizaciones.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.buInicioClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.buAnteriorClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.buSiguienteClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.Button1Click(Sender: TObject);
var
   ruta      : string;
   archivo   : string;
   args      : string;
begin
   inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'P 1 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.Open then
         frmFR_0003.imprimir;
   finally
      frmFR_0003.Free;
   end;}
   reglas.abrir_IBTabla(TCapturar);

end;

procedure TfrmCapturar_cotizaciones.BtnContactoClick(Sender: TObject);
begin
  inherited;
  FrmCapturar_contactos := TFrmCapturar_contactos.Create(Application);
  FrmCapturar_contactos.set_Cliente( dsFuente.DataSet.FieldByName('Cliente').AsInteger);
  FrmCapturar_contactos.ShowModal;
  Wcontacto := FrmCapturar_contactos.Resultado();
  dsFuente.DataSet.fieldByName('contacto_id').AsInteger:=FrmCapturar_contactos.Resultado();
//  ShowMessage('Resiltado de Domicilio ' + IntToStr(WDomicilio) );
  dsFuente.DataSet.fieldByName('contacto').AsString:=FrmCapturar_contactos.Resultado2();
  FrmCapturar_contactos.Free;
//  ShowMessage('Resiltado de Contacto ' + IntToStr(Wcontacto) );
end;

procedure TfrmCapturar_cotizaciones.buFinClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_cotizaciones.ibPlanesClick(Sender: TObject);
var
   total,
   grantotal : double;
begin
// inherited;
//  try
//     total := dsFuente.DataSet.fieldByName('SUBTOTAL').AsFloat +
//             dsFuente.DataSet.fieldByName('IVA').AsFloat +
//             dsFuente.DataSet.fieldByName('IEPS').AsFloat +
//             dsFuente.DataSet.fieldByName('IMPUESTO1').AsFloat +
//             dsFuente.DataSet.fieldByName('IMPUESTO2').AsFloat;
//    grantotal := total - (dsFuente.DataSet.fieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat +
//                          dsFuente.DataSet.fieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat +
//                          dsFuente.DataSet.fieldByName('ANTICIPO').AsFloat);
//
//    frmPresupuesto       := TfrmPresupuesto.Create(Application);
//    frmPresupuesto.MONTO := grantotal;
//    frmPresupuesto.ShowModal;
//    if (frmPresupuesto.ACEPTAR) and (frmPresupuesto.PAGOS > 0) and (frmPresupuesto.FINANCIAMIENTO <> 0) then
//    begin
//       spPRESUPUESTO_COTIZACION.ParamByName('P_ID').AsInteger           := dsFuente.DataSet.fieldByName('ID').AsInteger;
//       spPRESUPUESTO_COTIZACION.ParamByName('P_CC').AsInteger           := frmPresupuesto.CCOMERCIAL;
//       spPRESUPUESTO_COTIZACION.ParamByName('P_PAGOS').AsInteger        := frmPresupuesto.PAGOS;
//       spPRESUPUESTO_COTIZACION.ParamByName('P_FINANCIAMIENTO').AsFloat := frmPresupuesto.FINANCIAMIENTO;
//       spPRESUPUESTO_COTIZACION.ExecProc;
//       spPRESUPUESTO_COTIZACION.Transaction.CommitRetaining;
//       reglas.abrir_IBTabla(TCapturar);
//    end
// finally
//    frmPresupuesto.Free;
// end;

end;

procedure TfrmCapturar_cotizaciones.itemPlanesClick(Sender: TObject);
begin
  inherited;
  ibPlanes.Click;
end;

procedure TfrmCapturar_cotizaciones.itemSinPlanesClick(Sender: TObject);
begin
  inherited;
  spPRESUPUESTO_COTIZACION.ParamByName('P_ID').AsInteger           := dsFuente.DataSet.fieldByName('ID').AsInteger;
  spPRESUPUESTO_COTIZACION.ParamByName('P_CC').AsInteger           := dsFuente.DataSet.fieldByName('CONDICION_COMERCIAL').AsInteger;
  spPRESUPUESTO_COTIZACION.ParamByName('P_PAGOS').AsInteger        := 0;
  spPRESUPUESTO_COTIZACION.ParamByName('P_FINANCIAMIENTO').AsFloat := 0.00;
  spPRESUPUESTO_COTIZACION.ExecProc;
  spPRESUPUESTO_COTIZACION.Transaction.CommitRetaining;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cotizaciones.ibImprimirClick(Sender: TObject);
begin
  inherited;
  itemImprimir.Click;
end;

procedure TfrmCapturar_cotizaciones.FormDestroy(Sender: TObject);
begin
  MarcoMateriales1.Destruir;
  inherited;
end;

procedure TfrmCapturar_cotizaciones.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     edicionDetalle := not edicionDetalle;
     fijarBotonesDetalle;

     MarcoMateriales1.limpiar;
     //sirve asi, para el caso en que se edite el registro
     //no capturar con boton Capturar.
     MarcoMateriales1.FLAG_ESTADO := stModificar;
     MarcoMateriales1.boton       := true;
     MarcoMateriales1.findMaterial(dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger,dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger);

     MarcoMateriales1.edMaterial.Text           := dsPartidas.DataSet.FieldByName('R_CLAVE').AsString;
     MarcoMateriales1.edDescripcion.Text        := dsPartidas.DataSet.FieldByName('R_DESCRIPCION').AsString;
     MarcoMateriales1.edMaterial.Tag            := dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger;
     MarcoMateriales1.edCantidad.Value           := dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsFloat;
     MarcoMateriales1.edPrecioCosto.Value       := dsPartidas.DataSet.FieldByName('R_PRECIO').AsFloat;
     MarcoMateriales1.cbUnidades.KeyValue := dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger;
     MarcoMateriales1.edSubTotal.Value          := dsPartidas.DataSet.FieldByName('R_SUBTOTAL').AsFloat;
     MarcoMateriales1.edIVA.Value               := dsPartidas.DataSet.FieldByName('R_IVA').AsFloat;
     MarcoMateriales1.edIEPS.Value              := dsPartidas.DataSet.FieldByName('R_IEPS').AsFloat;
     MarcoMateriales1.edImpuesto1.Value         := dsPartidas.DataSet.FieldByName('R_IMPUESTO1').AsFloat;
     MarcoMateriales1.edImpuesto2.Value         := dsPartidas.DataSet.FieldByName('R_IMPUESTO2').AsFloat;
     MarcoMateriales1.edDescuentoPorc.Value     := dsPartidas.DataSet.FieldByName('R_DESCUENTO_PORC').AsFloat;
     MarcoMateriales1.ivaPorc                   := dsPartidas.DataSet.FieldByName('R_IVA_PORC').AsFloat;
     MarcoMateriales1.iepsPorc                  := dsPartidas.DataSet.FieldByName('R_IEPS_PORC').AsFloat;
     MarcoMateriales1.impuesto1Porc             := dsPartidas.DataSet.FieldByName('R_IMPUESTO1_PORC').AsFloat;
     MarcoMateriales1.impuesto2Porc             := dsPartidas.DataSet.FieldByName('R_IMPUESTO2_PORC').AsFloat;
     MarcoMateriales1.edPU.Value                := dsPartidas.DataSet.FieldByName('R_PRECIO_SIN_IMPUESTOS').AsFloat;
     MarcoMateriales1.edComentario.Text         := dsPartidas.DataSet.FieldByName('R_COMENTARIO').AsString;

     if MarcoMateriales1.cbMedidas.Visible and (dsPartidas.DataSet.FieldByName('R_MEDIDA').AsString <> '') then
        MarcoMateriales1.cbMedidas.KeyValue := dsPartidas.DataSet.FieldByName('R_MEDIDA').AsInteger;
     if MarcoMateriales1.cbColores.Visible and (dsPartidas.DataSet.FieldByName('R_COLOR').AsString <> '') then
        MarcoMateriales1.cbColores.KeyValue := dsPartidas.DataSet.FieldByName('R_COLOR').AsInteger;

     if MarcoMateriales1.edCantidad.Enabled and MarcoMateriales1.edCantidad.Visible then
        MarcoMateriales1.edCantidad.SetFocus;

     MarcoMateriales1.boton := false;
     MarcoMateriales1.datos(awrAlmUsr, dsFuente.DataSet.FieldByName('CLIENTE').AsInteger, 0, dsFuente.DataSet.FieldByName('MONEDA').AsInteger);
  end;
end;

procedure TfrmCapturar_cotizaciones.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyEstatus);
  qyEstatus.Last;
end;

procedure TfrmCapturar_cotizaciones.buAplicarClick(Sender: TObject);
var
   ejecutar  : boolean;
begin
  inherited;
  ejecutar := TRUE;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusAnt;
  dsFuente.DataSet.Post;
  if (awrStatus.autorizacion) and (awrStatus.nivel > reglas.dameUsuarioNivel) then
  begin
     try
        Application.CreateForm(TfrmAcceso, frmAcceso);
        frmAcceso.Nivel  := awrStatus.nivel;
        frmAcceso.Status := awrStatus.estatusSel;
        frmAcceso.ShowModal;
        ejecutar := frmAcceso.Rsp;
     finally
        frmAcceso.Free;
     end;
  end;

  if ejecutar then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := awrStatus.storeproc;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     spEstatus.ParamByName('P_ID').AsInteger := awrStatus.idEjecutar;
//     spEstatus.ExecProc;
//     spEstatus.Transaction.CommitRetaining;
     ibEstatus.sql.Clear;
     ibEstatus.sql.Add('execute procedure ' + awrStatus.storeproc + '(:p_id)' );
     ibEstatus.ParamByName('P_ID').AsInteger := awrStatus.idEjecutar;
     ibEstatus.Open;
     ibEstatus.Transaction.CommitRetaining;
     awrStatus.estatusSel := '';
     reglas.abrir_IBTabla(TCapturar);

     if awrStatus.correo then
     begin
        mensajes;
     end;
  end;
end;

procedure TfrmCapturar_cotizaciones.dgPartidasRTFUpButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   up   : TPoint;
begin
  inherited;
  up := fpPadre.ClientToScreen(Point(0,0));
  try
     frmRTF           := TfrmRTF.Create(Application);
     frmRTF.Top       := up.y;
     frmRTF.Left      := up.x;
     frmRTF.Height    := fpCaptura.Height + paLienzo.Height + fpCaptura.Height + 10;
     frmRTF.Width     := fpPadre.Width;
     frmRTF.Generador := 'COT_DET_RTF';
     frmRTF.TableName := 'COTIZACIONES_DETALLE_RTF';
     frmRTF.Arriba    := 'Si';
     frmRTF.Id        := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     frmRTF.ShowModal;
  finally
     frmRTF.Release;
  end;
end;

procedure TfrmCapturar_cotizaciones.BtnDomiciliosClick(Sender: TObject);
begin
  inherited;
  frmSeleccionar_Domicilios := TfrmSeleccionar_Domicilios.Create(Application);
  frmSeleccionar_Domicilios.set_Cliente( dsFuente.DataSet.FieldByName('Cliente').AsInteger);
  frmSeleccionar_Domicilios.ShowModal;
//  WDomicilio := frmSeleccionar_Domicilios.Resultado();
  dsFuente.DataSet.fieldByName('dom_muestreo_id').AsInteger:=frmSeleccionar_Domicilios.Resultado();
//  ShowMessage('Resiltado de Domicilio ' + IntToStr(WDomicilio) );
  dsFuente.DataSet.fieldByName('dom_muestreo').AsString:=frmSeleccionar_Domicilios.Resultado2();
  frmSeleccionar_Domicilios.Free;
end;

procedure TfrmCapturar_cotizaciones.BtnemailClick(Sender: TObject);
var
   ruta      : string;
   archivo   : string;
   args      : string;
begin
   inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'E 1 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.Open then
         frmFR_0003.imprimir;
   finally
      frmFR_0003.Free;
   end;}
   reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cotizaciones.dgPartidasRTFDownButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   up   : TPoint;
begin
  inherited;
  up := fpPadre.ClientToScreen(Point(0,0));
  try
     frmRTF := TfrmRTF.Create(Application);
     frmRTF.Top       := up.y;
     frmRTF.Left      := up.x;
     frmRTF.Height    := fpCaptura.Height + paLienzo.Height + fpCaptura.Height + 10;
     frmRTF.Width     := fpPadre.Width;
     frmRTF.Generador := 'COT_DET_RTF';
     frmRTF.TableName := 'COTIZACIONES_DETALLE_RTF';
     frmRTF.Arriba    := 'No';
     frmRTF.Id        := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     frmRTF.ShowModal
  finally
     frmRTF.Release;
  end;
end;

procedure TfrmCapturar_cotizaciones.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('seguro').AsFloat + DataSet.FieldByName('GRANTOTAL').AsFloat;
end;

procedure TfrmCapturar_cotizaciones.ibPedidoClick(Sender: TObject);
begin
// inherited;
// spA_PEDIDO_DESDE_COTIZACION.ParamByName('P_ID').AsInteger      := dsFuente.DataSet.FieldByName('ID').AsInteger;
// spA_PEDIDO_DESDE_COTIZACION.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
// spA_PEDIDO_DESDE_COTIZACION.ExecProc;
// spA_PEDIDO_DESDE_COTIZACION.Transaction.CommitRetaining;
//
// ShowMessage( 'Pedido creado con ID = ' + spA_PEDIDO_DESDE_COTIZACION.ParamByName('R_PEDIDO').AsString + ', con CLAVE = ' + dsFuente.DataSet.FieldByName('CLAVE').AsString);

end;

procedure TfrmCapturar_cotizaciones.itemCortaClick(Sender: TObject);
var
   ruta    : string;
   archivo : string;
   args    : string;
begin
  inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'I 2 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.OpenCorta then
         frmFR_0003.imprimir;
   finally
      frmFR_0003.Free;
   end;}
   
   reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cotizaciones.itemImprimirClick(Sender: TObject);
var
   ruta      : string;
   archivo   : string;
   args      : string;
begin
   inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'I 1 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.Open then
         frmFR_0003.imprimir;
   finally
      frmFR_0003.Free;
   end;}
   reglas.abrir_IBTabla(TCapturar);
   if (dsFuente.DataSet.FieldByName('CONSECUTIVO').AsINTEGER >0 )  and (dsFuente.DataSet.FieldByName('estatus').asstring = 'Sin Afectar') then
     begin
       ibcambia_enviado.close;
       ibcambia_enviado.parambyName('p_id').asInteger:=dsFuente.DataSet.FieldByName('id').AsINTEGER;
       ibcambia_enviado.Open;
       ibcambia_enviado.Transaction.CommitRetaining;
      // ShowMessage('Si Cmple ');
     end;
    reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cotizaciones.itemPreviewClick(Sender: TObject);
var
   ruta    : string;
   archivo : string;
   args    : string;
begin
  inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'P 1 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.Open then
         frmFR_0003.Preview;
   finally
      frmFR_0003.Free;
   end;}
end;

procedure TfrmCapturar_cotizaciones.itemPreviewCClick(Sender: TObject);
var
   ruta    : string;
   archivo : string;
   args    : string;
begin
  inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'fr_00001.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'P 2 ' + IntToStr(reglas.dame_usuario) + ' ' + dsFuente.DataSet.FieldByName('ID').AsString;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.OpenCorta then
         frmFR_0003.Preview;
   finally
      frmFR_0003.Free;
   end;}
end;

procedure TfrmCapturar_cotizaciones.abre_y_cierra;
begin
  qyPartidas.Close;
  qyPartidas.Open;
end;

procedure TfrmCapturar_cotizaciones.solo_numeros_y_punto(var k : char; texto : string);
   procedure verificar;
   var
      i : integer;
   begin
      for i := 1 to length(texto) do
         if texto[i] = '.' then
            k := char(nil);
   end;
begin
   if k = '.' then
      verificar;
   case k of
     char(0)..char(7),char(9)..char(12),char(14)..char(45),char(47),char(58)..char(255): k:=char(nil);
   end;
end;


end.
