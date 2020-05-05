unit capturar_pedidos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, Db,  Grids, DBGrids,   ImgList,
   Menus, UfrmFrameMaterial, jpeg, ExtCtrls, DBCtrls, StdCtrls,
  Buttons, ComCtrls, IBX.IBStoredProc, IBX.IBTable, IBX.IBCustomDataSet, IBX.IBQuery, Mask,
  System.ImageList, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxDBEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxButtonEdit;

type
  TawrFTP = record
     Servidor : string;
     Destino  : string; 
     Usuario  : string;
     Clave    : string;
     Puerto   : string; 
  end;

  TfrmCapturar_pedidos = class(TfrmCapturarMDI)
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
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
    spDEL_PARTIDA_PEDIDO: TIBStoredProc;
    spEstatus: TIBStoredProc;
    spTOTALES_PEDIDO: TIBStoredProc;
    qyMateriales_Unidades: TIBQuery;
    qyMateriales_UnidadesR_ID: TIntegerField;
    qyMateriales_UnidadesR_MATERIAL: TIntegerField;
    qyMateriales_UnidadesR_UNIDAD: TIntegerField;
    qyMateriales_UnidadesR_CLAVE: TIBStringField;
    qyMateriales_UnidadesR_DESCRIPCION: TIBStringField;
    qyMateriales_UnidadesR_FACTOR: TFloatField;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_VALIDEZ: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarCONDICION_COMERCIAL: TIntegerField;
    TCapturarANTICIPO: TFloatField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarFECHA_ENTREGA: TDateTimeField;
    TCapturarFECHA_ENTREGA_REAL: TDateTimeField;
    TCapturarPRIORIDAD: TIBStringField;
    TCapturarALMACEN: TIntegerField;
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
    TCapturarMONEDA: TIntegerField;
    TCapturarVENDEDOR: TIntegerField;
    TCapturarESTATUS: TIBStringField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_CANTIDAD_ENTREGADA: TFloatField;
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
    TCapturarnombre_condicion: TIBStringField;
    qyPartidasR_COTIZACION: TIntegerField;
    qyPartidasR_CLAVE_COTIZACION: TIBStringField;
    TCapturarextension_nombre: TStringField;
    TCapturarCAMBIO_ENTREGADO: TFloatField;
    TCapturarEXTENSION: TIntegerField;
    TCapturarPUNTO_DE_VENTA: TIntegerField;
    TCapturarcliente_nombre: TStringField;
    TCapturarcliente_telefono: TStringField;
    TCapturarFACTURA: TIntegerField;
    TCapturarORIGEN: TIBStringField;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    Cot1: TMenuItem;
    qyMateriales_Medidas: TIBQuery;
    qyMateriales_MedidasR_ID: TIntegerField;
    qyMateriales_MedidasR_ID_MEDIDA: TIntegerField;
    qyMateriales_MedidasR_DESCRIPCION: TIBStringField;
    qyMateriales_MedidasR_CODIGO_BARRAS: TIBStringField;
    dsMateriales_Medidas: TDataSource;
    dsColores: TDataSource;
    qyColores: TIBQuery;
    qyColoresID: TIntegerField;
    qyColoresNOMBRE: TIBStringField;
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
    dsMateriales: TDataSource;
    qyPrecio_X: TIBQuery;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    ibCopiar: TBitBtn;
    spCOPIAR_PEDIDO: TIBStoredProc;
    qyPartidasR_CAJAS: TIntegerField;
    spMODIFICAR_CAJAS_PEDIDO: TIBStoredProc;
    TCapturarCONSECUTIVO: TIntegerField;
    TCapturarQUIEN_REMISIONO: TIntegerField;
    qyPartidasR_ROWS: TIntegerField;
    spPEDIDOS_DESCUENTO_GLOBAL: TIBStoredProc;
    ibFactura: TBitBtn;
    spCREAR_FACTURA: TIBStoredProc;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    buImpresion: TBitBtn;
    ImageList1: TImageList;
    qyPartidasR_MATERIAL_CBARRAS: TIBStringField;
    qyPartidasR_MATERIAL_OBSERVACIONES: TBlobField;
    qyPartidasR_MATERIAL_FOTO: TBlobField;
    qyPartidasR_PZAS_X_CAJA: TIntegerField;
    qyPartidasR_COMENTARIO: TIBStringField;
    qyMsg: TIBQuery;
    qyMsgR_SALDO: TFloatField;
    qyMsgR_LIMITE: TFloatField;
    qyMsgR_TOTAL_VENCIDO: TFloatField;
    qyMsgR_ALMACEN_VENCIDO: TFloatField;
    qyMsgR_MSG_LIMITE: TIBStringField;
    qyMsgR_MSG_VENCIDO: TIBStringField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    itemMedidas: TMenuItem;
    itemPreview: TMenuItem;
    itemPreviewM: TMenuItem;
    spESTOY_EN_EVENTO: TIBStoredProc;
    pcPedidos: TPageControl;
    tsDatos: TTabSheet;
    tsPresentaciones: TTabSheet;
    laObservaciones: TLabel;
    deObservaciones: TDBMemo;
    sbRefreshAlmacenes: TSpeedButton;
    Label22: TLabel;
    ceAnticipo: TDBEdit;
    Label24: TLabel;
    deClave: TDBEdit;
    Label7: TLabel;
    deFolio: TDBEdit;
    Label2: TLabel;
    deFechaAlta: TcxDBDateEdit;
    Label3: TLabel;
    edCliente: TcxButtonEdit;
    Label6: TLabel;
    meTelefono: TDBEdit;
    Label23: TLabel;
    ceDescGlobal: TDBEdit;
    cbPrioridad: TDBCheckBox;
    Label4: TLabel;
    Label15: TLabel;
    deFEntrega: TcxDBDateEdit;
    Label1: TLabel;
    deFechaValidez: TcxDBDateEdit;
    Label21: TLabel;
    deFEntregaReal: TcxDBDateEdit;
    cbCC: TDBLookupComboBox;
    Label13: TLabel;
    sbRefreshCondicion: TSpeedButton;
    leMoneda: TDBLookupComboBox;
    sbRefreshMonedas: TSpeedButton;
    Label12: TLabel;
    Label18: TLabel;
    deCliente: TDBEdit;
    Bevel1: TBevel;
    paPresentaciones: TPanel;
    laCliente: TLabel;
    Label86: TLabel;
    fcImager9: TImage;
    edPresentacion: TEdit;
    edComentario: TEdit;
    buF7P: TBitBtn;
    buF8P: TBitBtn;
    buF9P: TBitBtn;
    buF10P: TBitBtn;
    buF11P: TBitBtn;
    dgPresentaciones: TDBGrid;
    ppFPresentaciones: TPopupMenu;
    itemF7P: TMenuItem;
    itemF8P: TMenuItem;
    itemF9P: TMenuItem;
    itemF10P: TMenuItem;
    itemF11P: TMenuItem;
    dsPartidasPresentaciones: TDataSource;
    qyPartidasPresentaciones: TIBQuery;
    qyPartidasPresentacionesR_ID: TIntegerField;
    qyPartidasPresentacionesR_PEDIDO: TIntegerField;
    qyPartidasPresentacionesR_PRESENTACION: TIntegerField;
    qyPartidasPresentacionesR_PRESENTACION_DESCRIPCION: TIBStringField;
    qyPartidasPresentacionesR_ROWS: TIntegerField;
    spADD_PEDIDO_PRESENTACION: TIBStoredProc;
    qyDelPresentacion: TIBQuery;
    edExtension: TEdit;
    deExtension: TDBEdit;
    N1: TMenuItem;
    itemAnexo: TMenuItem;
    spADD_PARTIDA_PEDIDO: TIBStoredProc;
    spQUITAR_IMPUESTOS_PEDIDO: TIBStoredProc;
    spAUMENTAR_IMPUESTOS_PEDIDO: TIBStoredProc;
    cbAlmacenes: TDBLookupComboBox;
    deAlmacen: TDBEdit;
    TCapturaralmacen_clave: TStringField;
    spCALCULA_PSI: TIBStoredProc;
    qyPartidasR_CLIENTE_MAT_C: TIBStringField;
    qyPartidasR_CLIENTE_MAT_D: TIBStringField;
    qyPartidasR_F_PROM_ENT: TDateTimeField;
    qyPartidasR_PNC: TFloatField;
    cbEstatus: TDBLookupComboBox;
    edEstatus: TDBEdit;
    buAplicar: TBitBtn;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    qyLP_NC: TIBQuery;
    qyLP_NCR_PRECIO_MINIMO: TFloatField;
    qyLP_NCR_PRECIO_MAXIMO: TFloatField;
    N2: TMenuItem;
    itemEnviar: TMenuItem;
    TCapturarPAGOS: TIntegerField;
    TCapturarFINANCIAMIENTO: TFloatField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    qyTEntrega: TIBQuery;
    dsTEntrega: TDataSource;
    laTEntrega: TLabel;
    cbTEntrega: TDBLookupComboBox;
    sbActualizarTE: TSpeedButton;
    sbLimpiarTE: TSpeedButton;
    deTarifa: TDBEdit;
    laTarifa: TLabel;
    TCapturarZONAS_TE: TIntegerField;
    TCapturarTE_TARIFA: TFloatField;
    TCapturarzona: TIntegerField;
    qyTEntregaR_ID: TIntegerField;
    qyTEntregaR_DESCRIPCION: TIBStringField;
    qyTEntregaR_FLETE: TFloatField;
    qyTEntregaR_SEGURO: TFloatField;
    qyTEntregaR_OTRO: TFloatField;
    qyTEntregaR_EXCEDENTE: TFloatField;
    qyTEntregaR_TARIFA: TFloatField;
    qyTEntregaR_TRANSPORTISTA: TIntegerField;
    qyTEntregaR_TRANSPORTISTA_C: TIBStringField;
    qyTEntregaR_TRANSPORTISTA_N: TIBStringField;
    qyTEntregaR_PAQ_KILOS: TIntegerField;
    TCapturarTE_FLETE: TFloatField;
    TCapturarTE_SEGURO: TFloatField;
    TCapturarTE_OTRO: TFloatField;
    TCapturarTE_EXCEDENTE: TFloatField;
    TCapturarTE_KILOS: TIntegerField;
    TCapturarSEGURO_SUBTOTAL: TFloatField;
    TCapturarSEGURO_IVA: TFloatField;
    TCapturarseguro: TFloatField;
    TCapturarsupertotal: TFloatField;
    paLienzo2: TPanel;
    paItems: TPanel;
    paExtra: TPanel;
    paPNC: TPanel;
    laPrecioNC: TLabel;
    laUPNC: TLabel;
    edPUNC: TEdit;
    edPrecioNC: TEdit;
    paInsuficiencias: TPanel;
    fcImager1: TImage;
    buInsuficiencias: TBitBtn;
    ibNuevaPartida: TBitBtn;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibCotizaciones: TBitBtn;
    ibListaEmpaque: TBitBtn;
    ibGuia: TBitBtn;
    MarcoMateriales1: TMarcoMateriales;
    dgPartidas: TDBGrid;
    spPEDIDO_DESCUENTOS: TIBStoredProc;
    buKit: TBitBtn;
    spADD_REQ_REQCOT: TIBStoredProc;
    spADD_COTIZACION_A_PEDIDO: TIBStoredProc;
    qyPartidasR_CANTIDAD_PENDIENTE: TFloatField;
    qyPartidasR_SERIE: TIBStringField;
    qyPartidasR_NUM_SERIE: TIBStringField;
    qyPartidasR_COSTO_ULT_COMPRA: TFloatField;
    qyPartidasR_DG_PORC: TFloatField;
    spP_PEDIDO_PARTIDA_TERMINADO: TIBStoredProc;
    spP_PEDIDO_PARTIDA_PSURTIDO: TIBStoredProc;
    spM_F_PROM_ENT_PEDIDO: TIBStoredProc;
    Label8: TLabel;
    edOC: TDBEdit;
    TCapturarCLIENTE_OC: TIBStringField;
    qyInsuficientes: TIBQuery;
    qyInsuficientesR_ROW: TIntegerField;
    qyInsuficientesR_MATERIAL: TIntegerField;
    qyInsuficientesR_MATERIAL_CB: TIBStringField;
    qyInsuficientesR_MATERIAL_C: TIBStringField;
    qyInsuficientesR_MATERIAL_D: TIBStringField;
    qyInsuficientesR_CANTIDAD: TFloatField;
    qyInsuficientesR_INVENTARIO: TFloatField;
    qyInsuficientesR_UNIDAD: TIntegerField;
    qyInsuficientesR_UNIDAD_C: TIBStringField;
    qyInsuficientesR_UNIDAD_D: TIBStringField;
    qyInsuficientesR_MATERIAL_S: TIBStringField;
    qyPartidasPresentacionesR_COMENTARIO: TIBStringField;
    itemNuevaPartida: TMenuItem;
    itemEliminarPartida: TMenuItem;
    spprueba: TIBStoredProc;
    ibEstatus: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
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
    procedure ibCotizacionesClick(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure Cot1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure sbRefreshCondicionClick(Sender: TObject);
    procedure sbRefreshAlmacenesClick(Sender: TObject);
    procedure sbRefreshMonedasClick(Sender: TObject);
    procedure sbRefreshUnidadesClick(Sender: TObject);
    procedure ibCopiarClick(Sender: TObject);
    procedure dgPartidasCAJASButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ibListaEmpaqueClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure deFechaAltaEnter(Sender: TObject);
    procedure deFEntregaEnter(Sender: TObject);
    procedure deFEntregaRealEnter(Sender: TObject);
    procedure deFechaValidezEnter(Sender: TObject);
    procedure ibGuiaClick(Sender: TObject);
    procedure ibFacturaClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure ibImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
    procedure itemMedidasClick(Sender: TObject);
    procedure itemPreviewMClick(Sender: TObject);
    procedure pcPedidosChange(Sender: TObject);
    procedure buF7PClick(Sender: TObject);
    procedure buF8PClick(Sender: TObject);
    procedure buF9PClick(Sender: TObject);
    procedure buF10PClick(Sender: TObject);
    procedure buF11PClick(Sender: TObject);
    procedure edPresentacionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edPresentacionKeyPress(Sender: TObject; var Key: Char);
    procedure itemF7PClick(Sender: TObject);
    procedure itemF8PClick(Sender: TObject);
    procedure itemF9PClick(Sender: TObject);
    procedure itemF10PClick(Sender: TObject);
    procedure itemF11PClick(Sender: TObject);
    procedure edExtensionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edExtensionKeyPress(Sender: TObject; var Key: Char);
    procedure Anexo1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buQuitarClick(Sender: TObject);
    procedure buAumentarClick(Sender: TObject);
    procedure edPrecioNCChange(Sender: TObject);
    procedure MarcoMateriales1edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cbEstatusChange(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure buAplicarClick(Sender: TObject);
    procedure itemEnviarClick(Sender: TObject);
    procedure ftpPedidoPacketSent(Sender: TObject);
    procedure sbActualizarTEClick(Sender: TObject);
    procedure sbLimpiarTEClick(Sender: TObject);
    procedure cbTEntregaChange(Sender: TObject);
    procedure buInsuficienciasClick(Sender: TObject);
    procedure buKitClick(Sender: TObject);
    procedure dgPartidasTERMINADOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasFEButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure itemNuevaPartidaClick(Sender: TObject);
    procedure itemEliminarPartidaClick(Sender: TObject);
    procedure cbEstatusExit(Sender: TObject);
    procedure cbEstatusEnter(Sender: TObject);
  private
    { Private declarations }
    TopIdx : Integer;
    Key    : Variant;

    msg_limite      : boolean;
    msg_vencidos    : boolean;
    estoy_evento    : boolean;
    awrCalcular     : boolean;
    awrActZonas     : boolean;
    evento          : integer;
    edicionDetalle  : boolean;//<-valida los botones
    tmpDescGlobal   : double;
    edicionP        : boolean;
    awrPNC          : boolean;
    awrPNC_Minimo   : double;
    awrPNC_Maximo   : double;
    awrFTP          : TawrFTP;
    awrAlmGral      : integer;
    awrSeguro       : boolean;
    awrCliente      : integer;
    awrExtension    : integer;
    awrActivarFA    : boolean; //activar Fecha de Alta
    awrActivarCC    : boolean; //activar Condicion Comercial
    awrActivarDG    : boolean; //activar Descuento Global
    awrActivarDP    : boolean; //activar Descuento Parcial
    
    procedure fijarBotonesP;overload;
    procedure fijarBotonesP(valor : boolean);overload;

    procedure refreshTotales(vCual : integer);
    procedure fijarBotonesDetalle;
    procedure verificarSaldos;
    procedure verfificarFechas;
    procedure BeforeRecord;
    procedure BeforeUpdate;
    procedure AfterRecord;
    procedure almacenar(vMedida, vColor, vFecha : variant);
    procedure almacenarCorrida(vMedida, vColor, vFecha : variant);
    function revisarRutaEnvio : Boolean;
    function revisarDBFEnvio : Boolean;
  public
    { Public declarations }
  protected
     tituloSeleccionarCotizacion : String;
  end;

var
  frmCapturar_pedidos: TfrmCapturar_pedidos;

implementation

uses
  iniFiles, UfrmAltaRapidaMateriales, IBModulo, IBData, reglas_de_negocios,
  explorar_pedidos, seleccionar_cotizaciones,
  seleccionar_cliente, seleccionar_extension, seleccionar_material,
  PRN_0026, PRN_0027, PRN_0030, UfrmSeleccionarCliente, UfrmSeleccionarExtension,
  URPT_PEDIDO_PARTIDAS, ufrmSeleccionarPresentaciones, UfrmAcceso, UfrmFTP,
  UfrmInsuficienciasPedido, UfrmKit, UfrmSeleccionarCotizacion;

{$R *.DFM}

function TfrmCapturar_pedidos.revisarDBFEnvio : Boolean;
var
   tmp       : Boolean;
   ruta      : string;
   SearchRec : TSearchRec;
begin
   tmp  := true;
   ruta := ExtractFilePath(ParamStr(0))+'ftp\E_VENDEDOR_PEDIDO.DBF';
   if FindFirst(ruta, faAnyFile, SearchRec) <> 0 then
   begin
      tmp := false;
      showmessage('Falta archivo: '+ruta);
   end;

   ruta := ExtractFilePath(ParamStr(0))+'ftp\D_VENDEDOR_PEDIDO.DBF';
   if FindFirst(ruta, faAnyFile, SearchRec) <> 0 then
   begin
      tmp := false;
      showmessage('Falta archivo: '+ruta);
   end;

   result := tmp;
end;

function TfrmCapturar_pedidos.revisarRutaEnvio : Boolean;
var
   iniFile : TIniFile;
   ruta    : string;
   tmp     : Boolean;
begin
   tmp  := false;
   ruta := ExtractFilePath(ParamStr(0))+'ftp\awrFTP.INI';
   //ver si existe el archivo de configuracion
   iniFile         := TIniFile.Create(ruta);
   awrFTP.Servidor := iniFile.ReadString('FTP','Servidor','');
   iniFile.Free;
   if awrFTP.Servidor = '' then
   begin
      try
         frmFTP := TfrmFTP.Create(Application);
         frmFTP.ShowModal;
      finally
         frmFTP.Release;
      end;
   end
   else
      begin
         iniFile         := TIniFile.Create(ruta);
         awrFTP.Servidor := iniFile.ReadString('FTP','Servidor','');
         awrFTP.Destino  := iniFile.ReadString('FTP','Destino','');
         awrFTP.Usuario  := iniFile.ReadString('FTP','Usuario','');
         awrFTP.Clave    := iniFile.ReadString('FTP','Clave','');
         awrFTP.Puerto   := iniFile.ReadString('FTP','Puerto','');
         iniFile.Free;
         awrFTP.Clave    := reglas.espejo(awrFTP.Clave);
         awrFTP.Clave    := reglas.desencriptar(awrFTP.Clave);
         tmp := true;
      end;

   if tmp then
   begin
   {
      ftpPedido.Host     := awrFTP.Servidor;
      ftpPedido.UserID   := awrFTP.Usuario;
      ftpPedido.Password := awrFTP.Clave;
      ftpPedido.Port     := StrToInt(awrFTP.Puerto);
      }
   end;

   result := tmp;
end;

procedure TfrmCapturar_pedidos.BeforeUpdate;
//var
  //N: TdxTreeListNode;
begin
   if MarcoMateriales1.FLAG_ESTADO = stNuevo then
   begin
      Key    := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      TopIdx := 0;
   end
   else
      begin
         {
         N := dgPartidas.FocusedNode;

         if N = nil then
           TopIdx := -1
         else
         begin
           Key    := TdxDBGridNode(N).Id;
           TopIdx := dgPartidas.TopIndex;
         end;
         }
      end;
end;

procedure TfrmCapturar_pedidos.BeforeRecord;
//var
  //N: Tdx
  //TreeListNode;
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

procedure TfrmCapturar_pedidos.AfterRecord;
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

procedure TfrmCapturar_pedidos.almacenarCorrida(vMedida, vColor, vFecha : variant);
begin
   spADD_PARTIDA_PEDIDO.ParamByName('P_ID').AsInteger        := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spADD_PARTIDA_PEDIDO.ParamByName('P_DETALLE').AsInteger   := 0;
   spADD_PARTIDA_PEDIDO.ParamByName('P_MATERIAL').AsInteger  := MarcoMateriales1.edMaterial.Tag;
   spADD_PARTIDA_PEDIDO.ParamByName('P_CANTIDAD').AsFloat    := StrToFloat(MarcoMateriales1.edCantidad.Text);
   spADD_PARTIDA_PEDIDO.ParamByName('P_PRECIO').AsFloat      := StrToFloat(MarcoMateriales1.edPrecioCosto.Text);
   spADD_PARTIDA_PEDIDO.ParamByName('P_UNIDAD').AsInteger    := MarcoMateriales1.cbUnidades.KeyValue;
   spADD_PARTIDA_PEDIDO.ParamByName('P_MEDIDA').Value        := vMedida;
   spADD_PARTIDA_PEDIDO.ParamByName('P_COLOR').Value         := vColor;
   spADD_PARTIDA_PEDIDO.ParamByName('P_PORC_DP').AsFloat     :=  StrToFloat(MarcoMateriales1.edDescuentoPorc.Text);
   spADD_PARTIDA_PEDIDO.ParamByName('P_COMENTARIO').AsString := MarcoMateriales1.edComentario.Text;
   spADD_PARTIDA_PEDIDO.ParamByName('P_F_PROM_ENT').Value    := vFecha;
   spADD_PARTIDA_PEDIDO.ParamByName('P_PNC').AsFloat         :=  StrToFloat(edPrecioNC.Text);
   spADD_PARTIDA_PEDIDO.ExecProc;
   spADD_PARTIDA_PEDIDO.Transaction.CommitRetaining;

   Key    := spADD_PARTIDA_PEDIDO.ParamByName('R_DETALLE').AsInteger;
   TopIdx := 0;
end;

procedure TfrmCapturar_pedidos.almacenar(vMedida, vColor, vFecha : variant);
begin
   Key := 0;
   if MarcoMateriales1.FLAG_ESTADO = stModificar then
      Key := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;

   spADD_PARTIDA_PEDIDO.ParamByName('P_ID').AsInteger        := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spADD_PARTIDA_PEDIDO.ParamByName('P_DETALLE').AsInteger   := Key;
   spADD_PARTIDA_PEDIDO.ParamByName('P_MATERIAL').AsInteger  := MarcoMateriales1.edMaterial.Tag;
   spADD_PARTIDA_PEDIDO.ParamByName('P_CANTIDAD').AsFloat    := MarcoMateriales1.edCantidad.value;
   spADD_PARTIDA_PEDIDO.ParamByName('P_PRECIO').AsFloat      := MarcoMateriales1.edPrecioCosto.value;
   spADD_PARTIDA_PEDIDO.ParamByName('P_UNIDAD').AsInteger    := MarcoMateriales1.cbUnidades.KeyValue;
   spADD_PARTIDA_PEDIDO.ParamByName('P_MEDIDA').Value        := vMedida;
   spADD_PARTIDA_PEDIDO.ParamByName('P_COLOR').Value         := vColor;
   spADD_PARTIDA_PEDIDO.ParamByName('P_PORC_DP').AsFloat     := MarcoMateriales1.edDescuentoPorc.value;
   spADD_PARTIDA_PEDIDO.ParamByName('P_COMENTARIO').AsString := MarcoMateriales1.edComentario.Text;
   spADD_PARTIDA_PEDIDO.ParamByName('P_F_PROM_ENT').Value    := vFecha;
   spADD_PARTIDA_PEDIDO.ParamByName('P_PNC').AsFloat         := 0 ;//edPrecioNC.value;
   spADD_PARTIDA_PEDIDO.ExecProc;
   spADD_PARTIDA_PEDIDO.Transaction.CommitRetaining;

   Key    := spADD_PARTIDA_PEDIDO.ParamByName('R_DETALLE').AsInteger;
   TopIdx := 0;

   reglas.abrir_IBTabla(TCapturar);
   reglas.refresh_IBQuery(qyPartidas);
   //dgPartidas.FullExpand;

   AfterRecord;

   edicionDetalle := not edicionDetalle;
   FijarBotonesDetalle;
end;

procedure TfrmCapturar_pedidos.fijarBotonesP(valor : boolean);
begin
   edicionP := valor;
   fijarBotonesP;
end;

procedure TfrmCapturar_pedidos.fijarBotonesP;
begin
   buF7P.Enabled     := not edicionP;
   buF8P.Enabled     := not edicionP and not(dsPartidasPresentaciones.DataSet.IsEmpty);
   buF9P.Enabled     := edicionP;
   buF10P.Enabled    := edicionP;
   buF11P.Enabled    := not edicionP and not(dsPartidasPresentaciones.DataSet.IsEmpty);
   dgPresentaciones.Enabled := not edicionP;

   itemF7P.Enabled  := buF7P.Enabled;
   itemF8P.Enabled  := buF8P.Enabled;
   itemF9P.Enabled  := buF9P.Enabled;
   itemF10P.Enabled := buF10P.Enabled;
   itemF11P.Enabled := buF11P.Enabled;

   if edicionP then
      paPresentaciones.Height := 92
   else
      paPresentaciones.Height := 52;
end;

procedure TfrmCapturar_pedidos.verfificarFechas;
var
   fraccion   : Real;
   entero     : Real;
begin
   //validacion fecha alta
   if deFechaAlta.Focused and deClave.Enabled and deClave.Visible then
      deClave.SetFocus;
   entero   := Int((deFechaAlta.date));
   fraccion := Frac((deFechaAlta.date));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := (deFechaAlta.date) + time;
   end;
   //validacion fecha entrega
   if deFEntrega.Focused and deClave.Enabled and deClave.Visible then
      deClave.SetFocus;
   entero   := Int((deFEntrega.date));
   fraccion := Frac((deFEntrega.date));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_ENTREGA').AsDateTime := (deFEntrega.date) + time;
   end;
   //validacion fecha entrega real
   if deFEntregaReal.Focused and deClave.Enabled and deClave.Visible then
      deClave.SetFocus;
   entero   := Int((deFEntregaReal.date));
   fraccion := Frac((deFEntregaReal.date));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_ENTREGA_REAL').AsDateTime := (deFEntregaReal.date) + time;
   end;
   //validacion fecha validez
   if deFechaValidez.Focused and deClave.Enabled and deClave.Visible then
      deClave.SetFocus;
   entero   := Int((deFechaValidez.date));
   fraccion := Frac((deFechaValidez.date));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_VALIDEZ').AsDateTime := (deFechaValidez.date) + time;
   end;
end;

procedure TfrmCapturar_pedidos.verificarSaldos;
begin
   if dsFuente.DataSet.FieldByName('CLIENTE').AsInteger <> 0 then
   begin
      if msg_limite or msg_vencidos then
      begin
         qyMsg.Close;
         qyMsg.ParamByName('P_CLIENTE').AsInteger := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
         qyMsg.ParamByName('P_ALMACEN').AsInteger := dsFuente.DataSet.FieldByName('ALMACEN').AsInteger;
         qyMsg.Open;
      end;

      //MENSAJE LIMITE DE CREDITO
      if msg_limite and (qyMsg.FieldByName('R_MSG_LIMITE').AsString = 'SI') then
      begin
         ShowMessage('Su limite es: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_LIMITE').AsFloat)+#13+'Saldo de: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_SALDO').AsFloat));
      end;
      //MENSAJE DOCUMENTOS VENCIDOS
      if msg_vencidos and (qyMsg.FieldByName('R_MSG_VENCIDO').AsString = 'SI') then
      begin
         ShowMessage('Vencido es: '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_TOTAL_VENCIDO').AsFloat)+#13+'Vencido en este almacen: : '+FormatFloat('$ ###,###,##0.00',qyMsg.FieldByName('R_ALMACEN_VENCIDO').AsFloat));
      end;

      if (msg_limite   and (qyMsg.FieldByName('R_MSG_LIMITE').AsString  = 'SI')) or
         (msg_vencidos and (qyMsg.FieldByName('R_MSG_VENCIDO').AsString = 'SI')) then
      begin
         if dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar' then
            dsFuente.DataSet.FieldByName('ESTATUS').AsString := 'Autorizar';
      end
      else
         begin
            if dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Autorizar' then
               dsFuente.DataSet.FieldByName('ESTATUS').AsString := 'Sin Afectar';
         end;
   end;
end;

procedure TfrmCapturar_pedidos.fijarBotonesDetalle;
var
   st : boolean;
begin
  st := (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Afectado'  ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado' ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Terminado' ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Surtido'   ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Interno'   ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Validacion') or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Liberado'  );

  ibNuevaPartida.Enabled     := not(edicionDetalle) and not(st);
  ibModificarPartida.Enabled := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibEliminarPartida.Enabled  := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibGuardarPartida.Enabled   := edicionDetalle and not(st);
  ibCancelarPartida.Enabled  := edicionDetalle and not(st);
  ibCotizaciones.Enabled     := not(edicionDetalle) and not(st);
  //buAumentar.Enabled         := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  //buQuitar.Enabled           := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  MarcoMateriales1.Visible   := edicionDetalle and not(st);

  dgPartidas.Enabled         := not edicionDetalle;

  //calcular impuestos
  MarcoMateriales1.FLAG_CALCULAR := (dsFuente.DataSet.FieldByName('PRIORIDAD').AsString = 'No') or (awrCalcular);

  //Activar Panel Extra
  paExtra.Visible := edicionDetalle and (paPNC.Visible);
  if paExtra.Visible then
     paItems.Height := paItems.Height + paExtra.Height
  else
     if paItems.Height > paItems.Tag then
        paItems.Height := paItems.Tag;

  //dgPartidas.FullExpand;
end;

procedure TfrmCapturar_pedidos.refreshTotales(vCual : integer);
begin
   if vCual = 0 then
      BeforeRecord
   else
      BeforeUpdate;

   spTOTALES_PEDIDO.ParamByName('P_PEDIDO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
   spTOTALES_PEDIDO.ExecProc;
   spTOTALES_PEDIDO.Transaction.CommitRetaining;
   reglas.abrir_IBTabla(TCapturar);
   reglas.refresh_IBQuery(qyPartidas);
   //dgPartidas.FullExpand;

   AfterRecord;
end;

procedure TfrmCapturar_pedidos.FormCreate(
  Sender: TObject);
begin
  tituloSeleccionarCotizacion := 'Cotizacion(es)';
  MarcoMateriales1.MOVIMIENTO := obSalida;
  MarcoMateriales1.inicializar(true);
  MarcoMateriales1.laComentario.Visible := true;
  MarcoMateriales1.edComentario.Visible := true;

  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientesExtensiones);
  reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
  reglas.refresh_IBQuery(dmIBData.qyAlmacenes);

  inherited;
  reglas.refresh_IBQuery(qyPartidas);
  //dgPartidas.FullExpand;

  reglas.abrir_IBTabla(dmIBData.TPreferencias);

  //Calcular impuestos en pedidos
  dmIBData.TPreferencias.Filter := 'ID = 126';
  awrCalcular := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //msg limite
  dmIBData.TPreferencias.Filter := 'ID = 71';
  msg_limite := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //msg vencidos
  dmIBData.TPreferencias.Filter := 'ID = 122';
  msg_vencidos := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //activar campo cajas en grid.
  dmIBData.TPreferencias.Filter := 'ID = 76';
  if UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI' then
  begin
     dmIBData.TPreferencias.Filter := 'ID = 77';
//     laCajas.Caption         := dmIBData.TPreferencias.FieldByName('VALOR').AsString;
     //dgPartidasCajas.Caption := reglas.solo_alfabeto(dmIBData.TPreferencias.FieldByName('VALOR').AsString);
     //dgPartidasCajas.Visible := true;
//     paCajas.Visible         := true;
  end
  else
     begin
        //dgPartidasCajas.Visible := false;
//        paCajas.Visible         := false;
     end;
  //Activar columna Medidas
  //dgPartidasMEDIDASVisible := MarcoMateriales1.FLAG_MEDIDAS;
  //Activar columna colores
  //dgPartidasCOLORES.Visible := MarcoMateriales1.FLAG_COLORES;
  //Estoy en evento
  spESTOY_EN_EVENTO.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  spESTOY_EN_EVENTO.ExecProc;
  estoy_evento := spESTOY_EN_EVENTO.ParamByName('R_ESTOY').AsString = 'SI';
  evento       := spESTOY_EN_EVENTO.ParamByName('R_EVENTO').AsInteger;

  //Pedidos, activar PNC (Precio Nota de Credito).
  dmIBData.TPreferencias.Filter := 'ID = 135';
  awrPNC                := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  paPNC.Visible         := awrPNC;
  //dgPartidasPNC.Visible := awrPNC;

  //Almacen General
  dmIBData.TPreferencias.Filter := 'ID = 130';
  awrAlmGral := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  //Activar Zonas en Pedidos
  dmIBData.TPreferencias.Filter := 'ID = 148';
  awrActZonas := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  laTEntrega.Visible     := awrActZonas;
  cbTEntrega.Visible     := awrActZonas;
  sbActualizarTE.Visible := awrActZonas;
  sbLimpiarTE.Visible    := awrActZonas;
  laTarifa.Visible       := awrActZonas;
  deTarifa.Visible       := awrActZonas;
  if awrActZonas then
     reglas.refresh_IBQuery(qyTEntrega);

{  //Lista de Precios x Descuentos
  dmIBData.TPreferencias.Filter := 'ID = 80';
  awrLPxDesc                    := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'PORDESCUENTO';
  MarcoMateriales1.ENABLED_DP   := not(awrLPxDesc);}

  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';
  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //laGranTotal.Visible  := awrSeguro;
  //edGranTotal.Visible  := awrSeguro;
  //laSeguro.Visible     := awrSeguro;
 // edSeguro.Visible     := awrSeguro;

  //Pedidos: Activar botones de calculos de impuestos.
  dmIBData.TPreferencias.Filter := 'ID = 306';
  //buQuitar.Visible   := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //buAumentar.Visible := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //activar Fecha de Alta
  dmIBData.TPreferencias.Filter := 'ID = 328';
  awrActivarFA := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //activar Condicion Comercial
  dmIBData.TPreferencias.Filter := 'ID = 330';
  awrActivarCC := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //activar Descuento Global
  dmIBData.TPreferencias.Filter := 'ID = 332';
  awrActivarDG := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //activar Descuento Parcial
  dmIBData.TPreferencias.Filter := 'ID = 334';
  awrActivarDP := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  MarcoMateriales1.ENABLED_DP := awrActivarDP;

  //Activar Precio
  dmIBData.TPreferencias.Filter := 'ID = 346';
  MarcoMateriales1.edPrecioCosto.Enabled := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmCapturar_pedidos.dsFuenteDataChange(
  Sender: TObject; Field: TField);
var
   estatus : string;
   estado  : TDataSetState;
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     estado                      := TDataSource(sender).DataSet.State;
     estatus                     := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
     tsDatos.Enabled             := TDataSource(sender).DataSet.State in [dsInsert, dsEdit];
     tsPresentaciones.TabVisible :=(TDataSource(sender).DataSet.State in [dsBrowse, dsEdit]) and not(TDataSource(sender).DataSet.IsEmpty);

     buAplicar.Enabled     := false;
     paLienzo2.Visible     :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     ibEliminar.Enabled    := ibEliminar.Enabled and (estatus = 'Sin Afectar');
     ibFactura.Enabled     := (estatus = 'Parcialmente Surtido') or (estatus = 'Sin Afectar') and (dsFuente.DataSet.FieldByName('PRIORIDAD').AsString = 'No');
     buKit.Enabled         := (estatus = 'Parcialmente Surtido') or (estatus = 'Sin Afectar') and (dsFuente.DataSet.FieldByName('PRIORIDAD').AsString = 'No');
     ibCopiar.Enabled      :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     deFechaAlta.Enabled   :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and (estatus = 'Sin Afectar') and awrActivarFA;
     ceDescGlobal.Enabled  :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and (estatus = 'Sin Afectar') and awrActivarDG;
     cbCC.Enabled          :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and (estatus = 'Sin Afectar') and awrActivarCC;
     edCliente.Visible     :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and (estatus = 'Sin Afectar');
     edExtension.Visible   :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and (estatus = 'Sin Afectar');
     ibImprimir.Enabled    :=(estado = dsBrowse) and not(TDataSource(sender).DataSet.IsEmpty) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') OR (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Liberado'));

     cbPrioridad.ReadOnly  :=(estatus = 'Afectado') or (estatus = 'Interno');

     itemImprimir.Enabled  := ibImprimir.Enabled;
     itemMedidas.Enabled   := ibImprimir.Enabled;
//     itemAnexo.Enabled     := ibImprimir.Enabled;
     itemPreview.Enabled   := (estado = dsBrowse) and not(TDataSource(sender).DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString <> 'Cancelado');
     itemPreviewM.Enabled  := itemPreview.Enabled;

     if edCliente.Visible then
        edCliente.Text   := dsFuente.DataSet.FieldByName('cliente_nombre').AsString;
     if edExtension.Visible then
        edExtension.Text := dsFuente.DataSet.FieldByName('extension_nombre').AsString;


  end;
end;

procedure TfrmCapturar_pedidos.ibNuevoClick(
  Sender: TObject);
begin
  inherited;
  pcPedidos.ActivePageIndex     := 0;

  dmIBData.TPreferencias.Filter := 'ID = 3';
  if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger <> 0 then
     dsFuente.DataSet.FieldByName('MONEDA').AsInteger := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime              := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString                   := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('FECHA_VALIDEZ').AsDateTime           := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('VENDEDOR').AsInteger                 := reglas.dame_usuario;
  dsFuente.DataSet.FieldByName('FECHA_ENTREGA').AsDateTime           := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('FECHA_ENTREGA_REAL').AsDateTime      := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('PRIORIDAD').AsString                 := 'No';
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
  dsFuente.DataSet.FieldByName('PAGOS').AsFloat                      := 0;
  dsFuente.DataSet.FieldByName('FINANCIAMIENTO').AsFloat             := 0;
  dsFuente.DataSet.FieldByName('TE_FLETE').AsFloat                   := 0.00;
  dsFuente.DataSet.FieldByName('TE_SEGURO').AsFloat                  := 0.00;
  dsFuente.DataSet.FieldByName('TE_OTRO').AsFloat                    := 0.00;
  dsFuente.DataSet.FieldByName('TE_EXCEDENTE').AsFloat               := 0.00;
  dsFuente.DataSet.FieldByName('TE_TARIFA').AsFloat                  := 0.00;
  dsFuente.DataSet.FieldByName('TE_KILOS').AsInteger                 := 0;
  dsFuente.DataSet.FieldByName('ALMACEN').AsInteger                  := awrAlmGral;
  dsFuente.DataSet.FieldByName('CLIENTE').AsInteger                  := -3;
  if estoy_evento then
     dsFuente.DataSet.FieldByName('ORIGEN').AsString := 'Evento'
  else
     dsFuente.DataSet.FieldByName('ORIGEN').AsString := 'VACIO';

  if deClave.Enabled and deClave.Visible then
     deClave.SetFocus;
end;

procedure TfrmCapturar_pedidos.ibModificarClick(
  Sender: TObject);
begin
  estatus       := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  tmpDescGlobal := dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat;
  awrCliente    := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
  awrExtension  := dsFuente.DataSet.FieldByName('EXTENSION').AsInteger;
  inherited;

  if deClave.Enabled and deClave.Visible then
     deClave.SetFocus;

end;

procedure TfrmCapturar_pedidos.ibEliminarPartidaClick(
  Sender: TObject);
var
   i : integer;
   L : TList;
   tmp : string;
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     L := TList.Create;
     {
     for i := 0 to dgPartidas.DataSource.DataSet.RecordCount - 1 do
         L.Add(dgPartidas.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
     for i := 0 to (L.Count - 1) do
     begin
        tmp := TdxTreeListNode(L.Items[i]).Strings[0];
        spDEL_PARTIDA_PEDIDO.ParamByName('P_ID').AsString := tmp;
        spDEL_PARTIDA_PEDIDO.ExecProc;
        spDEL_PARTIDA_PEDIDO.Transaction.CommitRetaining;
     end;
     }
     L.Free;

     refreshTotales(0);

     fijarBotonesDetalle;
  end;
end;

procedure TfrmCapturar_pedidos.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_pedidos.ibGuardarPartidaClick(
  Sender: TObject);
var
   i, j       : integer;
   renglones  : integer;

   v_material : integer;
   v_precio   : double;
   v_medida   : variant;
   v_color    : variant;
   v_fecha    : variant;
   v_ValMin   : boolean;
begin
  inherited;
  v_ValMin   := true;
  //Verificacion del precio sea mayor o igual al precio minimo
  if not(reglas.validar_precio((MarcoMateriales1.edPrecioCosto.value), MarcoMateriales1.PRECIOMINIMO, 3)) then
  begin
     v_ValMin := false;
     MarcoMateriales1.edPrecioCosto.Text := FloatToStr(MarcoMateriales1.PRECIOMAXIMO);
  end;

//  if not(reglas.validar_precio(StrToFloat(edPrecioNC.Text), awrPNC_Minimo, 3)) and awrPNC then
//  begin
//     v_ValMin         := false;
//     edPrecioNC.Text := FloatToStr(awrPNC_Maximo);
//  end;

  v_material := MarcoMateriales1.edMaterial.Tag;
  v_precio   := MarcoMateriales1.edPrecioCosto.value;

  if v_ValMin then
  begin
     //proceso normal
     if not(MarcoMateriales1.FLAG_MEDIDAS) or (MarcoMateriales1.FLAG_ESTADO = stModificar) then
     begin
        v_medida := 0;
        v_color  := 0;
        v_fecha  := 0;
        if MarcoMateriales1.FLAG_MEDIDAS then
           v_medida := MarcoMateriales1.cbMedidas.KeyValue;
        if MarcoMateriales1.FLAG_COLORES then
           v_color := MarcoMateriales1.cbColores.KeyValue;

        //proceso comun
        almacenar(v_medida, v_color, v_fecha);
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
              v_fecha  := 0;

              if MarcoMateriales1.FLAG_COLORES then
                 v_color := MarcoMateriales1.frmHorizontal.color(i);

              if MarcoMateriales1.frmHorizontal.fecha(i) <> '' then
                 v_fecha := MarcoMateriales1.frmHorizontal.fecha(i);

              for j := 1 to (MarcoMateriales1.frmHorizontal.columnas) do
              begin
                 if MarcoMateriales1.frmHorizontal.cantStr(i,j) <> '' then
                 begin
                    v_medida := MarcoMateriales1.frmHorizontal.medida(j);

                    MarcoMateriales1.edMaterial.Tag      := v_material;
                    MarcoMateriales1.edPrecioCosto.Text :=  FloatToStr(v_precio);
                    MarcoMateriales1.edCantidad.Text    :=  FloatToStr(MarcoMateriales1.frmHorizontal.cantNum(i,j));

                    almacenarCorrida(v_medida, v_color, v_fecha);
                 end;
              end;
           end;
           reglas.abrir_IBTabla(TCapturar);
           reglas.refresh_IBQuery(qyPartidas);
           //dgPartidas.FullExpand;
           fijarBotonesDetalle;

           AfterRecord;
        end;
     end;
  end;
end;

procedure TfrmCapturar_pedidos.ibModificarPartidaClick(
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
     MarcoMateriales1.edCantidad.Text          := dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsString;
     MarcoMateriales1.edPrecioCosto.Text       := dsPartidas.DataSet.FieldByName('R_PRECIO').AsString;
     MarcoMateriales1.cbUnidades.KeyValue := dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger;
     MarcoMateriales1.edSubTotal.Text          := dsPartidas.DataSet.FieldByName('R_SUBTOTAL').AsString;
     MarcoMateriales1.edIVA.Text               := dsPartidas.DataSet.FieldByName('R_IVA').AsString;
     MarcoMateriales1.edIEPS.Text              := dsPartidas.DataSet.FieldByName('R_IEPS').AsString;
     MarcoMateriales1.edImpuesto1.Text         := dsPartidas.DataSet.FieldByName('R_IMPUESTO1').AsString;
     MarcoMateriales1.edImpuesto2.Text         := dsPartidas.DataSet.FieldByName('R_IMPUESTO2').AsString;
     MarcoMateriales1.edDescuentoPorc.Text     := dsPartidas.DataSet.FieldByName('R_DESCUENTO_PORC').AsString;
     MarcoMateriales1.ivaPorc                   := dsPartidas.DataSet.FieldByName('R_IVA_PORC').AsFloat;
     MarcoMateriales1.iepsPorc                  := dsPartidas.DataSet.FieldByName('R_IEPS_PORC').AsFloat;
     MarcoMateriales1.impuesto1Porc             := dsPartidas.DataSet.FieldByName('R_IMPUESTO1_PORC').AsFloat;
     MarcoMateriales1.impuesto2Porc             := dsPartidas.DataSet.FieldByName('R_IMPUESTO2_PORC').AsFloat;
     MarcoMateriales1.edPU.Text                := dsPartidas.DataSet.FieldByName('R_PRECIO_SIN_IMPUESTOS').AsString;
     MarcoMateriales1.edComentario.Text         := dsPartidas.DataSet.FieldByName('R_COMENTARIO').AsString;
     edPrecioNC.Text                           := dsPartidas.DataSet.FieldByName('R_PNC').AsString;

     if MarcoMateriales1.cbMedidas.Visible and (dsPartidas.DataSet.FieldByName('R_MEDIDA').AsString <> '') then
        MarcoMateriales1.cbMedidas.KeyValue := dsPartidas.DataSet.FieldByName('R_MEDIDA').AsInteger;
     if MarcoMateriales1.cbColores.Visible and (dsPartidas.DataSet.FieldByName('R_COLOR').AsString <> '') then
        MarcoMateriales1.cbColores.KeyValue := dsPartidas.DataSet.FieldByName('R_COLOR').AsInteger;

     if MarcoMateriales1.edCantidad.Enabled and MarcoMateriales1.edCantidad.Visible then
        MarcoMateriales1.edCantidad.SetFocus;
     MarcoMateriales1.boton := false;
     MarcoMateriales1.datos(dsFuente.DataSet.FieldByName('ALMACEN').AsInteger,dsFuente.DataSet.FieldByName('CLIENTE').AsInteger,dsFuente.DataSet.FieldByName('EXTENSION').AsInteger, dsFuente.DataSet.FieldByName('MONEDA').AsInteger);
  end;
end;

procedure TfrmCapturar_pedidos.dgPartidasDblClick(
  Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) and ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_pedidos.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;

  MarcoMateriales1.datos(dsFuente.DataSet.FieldByName('ALMACEN').AsInteger,dsFuente.DataSet.FieldByName('CLIENTE').AsInteger,dsFuente.DataSet.FieldByName('EXTENSION').AsInteger,dsFuente.DataSet.FieldByName('MONEDA').AsInteger);
  MarcoMateriales1.limpiar;
  //sirve asi, para el caso en que se edite el registro
  //no capturar con boton Capturar.
  MarcoMateriales1.FLAG_ESTADO := stNuevo;
  //limpiar panel extra
  edPrecioNC.Clear;
  edPUNC.Clear;
end;

procedure TfrmCapturar_pedidos.coSUBTOTALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat);
end;

procedure TfrmCapturar_pedidos.coIVADrawSummaryFooter(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IVA').AsFloat);
end;

procedure TfrmCapturar_pedidos.coIEPSDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IEPS').AsFloat);
end;

procedure TfrmCapturar_pedidos.coIMPUESTO1DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat);
end;

procedure TfrmCapturar_pedidos.coIMPUESTO2DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat);
end;

procedure TfrmCapturar_pedidos.coTOTALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmCapturar_pedidos.coDESCUENTOPARCIALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat);
end;

procedure TfrmCapturar_pedidos.coGRANTOTAL2DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat);
end;

procedure TfrmCapturar_pedidos.coDESCUENTOGLOBALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat);
end;

procedure TfrmCapturar_pedidos.ibCotizacionesClick(Sender: TObject);
begin
   inherited;
   frmSeleccionarCotizacion                      := TfrmSeleccionarCotizacion.Create(Application);
   frmSeleccionarCotizacion.Caption              := 'Seleccionar ' + tituloSeleccionarCotizacion;
   frmSeleccionarCotizacion.paEncabezado.Caption := tituloSeleccionarCotizacion;
   frmSeleccionarCotizacion.DATABASE             := dmIBModulo.ibSistema;
   frmSeleccionarCotizacion.TRANSACTION          := dmIBModulo.ibSistemaTransaccion;
   frmSeleccionarCotizacion.CLIENTE              := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
   frmSeleccionarCotizacion.Open;
   frmSeleccionarCotizacion.ShowModal;
   if frmSeleccionarCotizacion.ACEPTAR then
   begin
      spADD_COTIZACION_A_PEDIDO.ParamByName('P_PEDIDO').AsInteger     := dsFuente.DataSet.FieldByName('ID').AsInteger;
      spADD_COTIZACION_A_PEDIDO.ParamByName('P_COTIZACION').AsInteger := frmSeleccionarCotizacion.COTIZACION;
      spADD_COTIZACION_A_PEDIDO.ExecProc;
      spADD_COTIZACION_A_PEDIDO.Transaction.CommitRetaining;

      reglas.refresh_IBQuery(qyPartidas);
      //dgPartidas.FullExpand;
      reglas.abrir_IBTabla(TCapturar);

      //dgPartidas.FullExpand;
   end;
   frmSeleccionarCotizacion.Release;
   frmSeleccionarCotizacion := nil;
end;

procedure TfrmCapturar_pedidos.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  //almacen
  DataSet.FieldByName('almacen_clave').AsString := '';
  if DataSet.FieldByName('ALMACEN').AsString <> '' then
  begin
     dmIBData.TFiltroAlmacenes.Filter := 'ID = '+DataSet.FieldByName('ALMACEN').AsString;
     DataSet.FieldByName('almacen_clave').AsString := dmIBData.TFiltroAlmacenes.FieldByName('CLAVE').AsString;
  end;

  //cliente nombre
  DataSet.FieldByName('zona').AsInteger            := 0;
  DataSet.FieldByName('CLIENTE_NOMBRE').AsString   := '';
  DataSet.FieldByName('CLIENTE_TELEFONO').AsString := '';
  if DataSet.FieldByName('CLIENTE').AsString <> '' then
  begin
     dmIBData.TFiltroClientes.Filter                := 'ID = '+DataSet.FieldByName('CLIENTE').AsString;
     if dmIBData.TSujetosCliente.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
        DataSet.FieldByName('CLIENTE_NOMBRE').AsString := dmIBData.TSujetosCliente.FieldByName('RAZON_SOCIAL').AsString
     else
        DataSet.FieldByName('CLIENTE_NOMBRE').AsString := dmIBData.TSujetosCliente.FieldByName('NOMBRE').AsString;
     DataSet.FieldByName('CLIENTE_TELEFONO').AsString  := dmIBData.TSujetosCliente.FieldByName('TEL_PRINCIPAL').AsString;
     DataSet.FieldByName('zona').AsInteger := dmIBData.TDomicilioCliente.FieldByName('ZONA_').AsInteger;
  end;

  if DataSet.FieldByName('EXTENSION').AsString <> '' then
  begin
     dmIBData.TFiltroClientesExtensiones.Filter       := 'ID = '+DataSet.FieldByName('EXTENSION').AsString;
     DataSet.FieldByName('EXTENSION_NOMBRE').AsString := dmIBData.TFiltroClientesExtensiones.FieldByName('NOMBRE').AsString;
  end
  else
     DataSet.FieldByName('EXTENSION_NOMBRE').AsString := '';

  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('seguro').AsFloat + DataSet.FieldByName('GRANTOTAL').AsFloat;
end;

procedure TfrmCapturar_pedidos.NuevaPartida1Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_pedidos.ModificarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_pedidos.GuardarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_pedidos.CancelarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_pedidos.EliminarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_pedidos.Cot1Click(Sender: TObject);
begin
  inherited;
  if ibCotizaciones.Enabled then
     ibCotizaciones.Click;
end;

procedure TfrmCapturar_pedidos.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
  fijarBotonesP(false);
end;

procedure TfrmCapturar_pedidos.buInicioClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
  fijarBotonesP(false);

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_pedidos.buAnteriorClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
  fijarBotonesP(false);

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_pedidos.buSiguienteClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
  fijarBotonesP(false);

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_pedidos.buFinClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
  fijarBotonesP(false);

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_pedidos.sbRefreshCondicionClick(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TCondiciones_Comerciales);
end;

procedure TfrmCapturar_pedidos.sbRefreshAlmacenesClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(dmIBData.qyAlmacenes);
end;

procedure TfrmCapturar_pedidos.sbRefreshMonedasClick(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TMonedas);
end;

procedure TfrmCapturar_pedidos.sbRefreshUnidadesClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyMateriales_Unidades);
end;

procedure TfrmCapturar_pedidos.ibCopiarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Copiar documento ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spCOPIAR_PEDIDO.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spCOPIAR_PEDIDO.ExecProc;
     spCOPIAR_PEDIDO.Transaction.CommitRetaining;
     ShowMessage('Nuevo pedido con id = ' + spCOPIAR_PEDIDO.ParamByName('R_ID').AsString  + ' CLAVE ' + dsFuente.DataSet.FieldByName('CLAVE').AsString);
  end;
end;

procedure TfrmCapturar_pedidos.dgPartidasCAJASButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   index      : integer;
   indexRec   : integer;
begin
  inherited;
  {
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     idCajas.Titulo  := dsPartidas.DataSet.FieldByName('R_DESCRIPCION').AsString;
     idCajas.Entrada := FormatFloat('########0',dsPartidas.DataSet.FieldByName('R_CAJAS').AsInteger);
     idCajas.Execute;
     if idCajas.Respuesta and (idCajas.Entrada <> '') then
     begin
        //index    := dgPartidas.TopIndex;
        indexRec := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;

        spMODIFICAR_CAJAS_PEDIDO.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spMODIFICAR_CAJAS_PEDIDO.ParamByName('P_CUANTAS').AsString  := idCajas.Entrada;
        spMODIFICAR_CAJAS_PEDIDO.ExecProc;
        spMODIFICAR_CAJAS_PEDIDO.Transaction.CommitRetaining;
        if (unidadCajas = dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger) then
        begin
           spMODIFICAR_CANTIDAD_FACTURA.ParamByName('P_PARTIDA').AsInteger  := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
           spMODIFICAR_CANTIDAD_FACTURA.ParamByName('P_CANTIDAD').AsFloat   := StrToFloat(idCajas.Entrada);
           spMODIFICAR_CANTIDAD_FACTURA.ExecProc;
           spMODIFICAR_CANTIDAD_FACTURA.Transaction.CommitRetaining;
           //actualizar total de factura.
           spTOTALES_FACTURA.ParamByName('P_FACTURA').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spTOTALES_FACTURA.ExecProc;
           spTOTALES_FACTURA.Transaction.CommitRetaining;
           reglas.abrir_IBTabla(TCapturar);
        end;
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
        //busqueda del registro modificado
        dgPartidas.DataSource.DataSet.First;
        while not(dgPartidas.DataSource.DataSet.EOF) do
        begin
           if indexRec = qyPartidas.FieldByName('R_ID').AsInteger then
           begin
              break;
           end;
           dgPartidas.DataSource.DataSet.Next;
        end;
        //dgPartidas.TopIndex := index;
     end;
     dgPartidas.DataSource.DataSet.Next;
  end;
  }
end;

procedure TfrmCapturar_pedidos.dgPartidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  with TdxDBGrid(Sender) do
    if (Key = VK_RETURN) and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)]is TdxDBGridButtonColumn) then
    begin
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasCajas) then
          dgPartidasCajasButtonClick(nil, 0)
    end;
    }
end;

procedure TfrmCapturar_pedidos.ibListaEmpaqueClick(Sender: TObject);
begin
  inherited;
  frmPRN_0027 := TfrmPRN_0027.CrearA(Application, dsFuente.DataSet.FieldByName('ID').AsInteger, true);
  frmPRN_0027.imprimir;
  frmPRN_0027.Free;
end;

procedure TfrmCapturar_pedidos.ibGuardarClick(Sender: TObject);
var
   statusDS   : TDataSetState;
begin
  statusDS := dsFuente.DataSet.State;
  verfificarFechas;
  inherited;
  FijarBotonesDetalle;
  if (statusDS = dsEdit) then
  begin
     if not(qyPartidas.IsEmpty) then
     begin
        if ( (awrCliente   <> dsFuente.DataSet.FieldByName('CLIENTE').AsInteger) OR
             (awrExtension <> dsFuente.DataSet.FieldByName('EXTENSION').AsInteger) ) then
        begin
           spPEDIDO_DESCUENTOS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spPEDIDO_DESCUENTOS.ExecProc;
           spPEDIDO_DESCUENTOS.Transaction.CommitRetaining;
        end
        else
        if (tmpDescGlobal <> dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat) then
        begin
           spPEDIDOS_DESCUENTO_GLOBAL.ParamByName('P_PEDIDO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
           spPEDIDOS_DESCUENTO_GLOBAL.ExecProc;
           spPEDIDOS_DESCUENTO_GLOBAL.Transaction.CommitRetaining;
        end;
        //refrescar la pantalla con los datos
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
end;

procedure TfrmCapturar_pedidos.deFechaAltaEnter(Sender: TObject);
begin
  inherited;
  deFechaAlta.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime));
end;

procedure TfrmCapturar_pedidos.deFEntregaEnter(Sender: TObject);
begin
  inherited;
  deFEntrega.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_ENTREGA').AsDateTime));
end;

procedure TfrmCapturar_pedidos.deFEntregaRealEnter(Sender: TObject);
begin
  inherited;
  deFEntregaReal.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_ENTREGA_REAL').AsDateTime));
end;

procedure TfrmCapturar_pedidos.deFechaValidezEnter(Sender: TObject);
begin
  inherited;
  deFechaValidez.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_VALIDEZ').AsDateTime));
end;

procedure TfrmCapturar_pedidos.ibGuiaClick(Sender: TObject);
begin
  inherited;
  frmPRN_0030 := TfrmPRN_0030.crear(Application,dsFuente.DataSet.FieldByName('ID').AsInteger, dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat);
  frmPRN_0030.ShowModal;
  frmPRN_0030.Free;
end;

procedure TfrmCapturar_pedidos.ibFacturaClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Crear factura ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spCREAR_FACTURA.ParamByName('P_ID').AsInteger      := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spCREAR_FACTURA.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
     spCREAR_FACTURA.ExecProc;
     spCREAR_FACTURA.Transaction.CommitRetaining;
     ShowMessage( 'Numero de facturas agregadas (' + spCREAR_FACTURA.ParamByName('R_FACTURAS').AsString + '), con clave (' + dsFuente.DataSet.FieldByName('CLAVE').AsString + ')');
  end;
end;

procedure TfrmCapturar_pedidos.itemImprimirClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0026    := TfrmPRN_0026.Create(Application);
     frmPRN_0026.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
     if estoy_evento then
     begin
        frmPRN_0026.EVENTO := evento;
        if frmPRN_0026.OpenE then
           frmPRN_0026.imprimirE;
     end
     else
        if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Apartado') and (dsFuente.DataSet.FieldByName('Prioridad').AsString = 'Si') then
        begin
           if frmPRN_0026.OpenAP then
              frmPRN_0026.imprimirP;
        end
        else
        if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Apartado') then
        begin
           if frmPRN_0026.OpenA then
              frmPRN_0026.imprimir;
        end
        else
        if dsFuente.DataSet.FieldByName('Prioridad').AsString = 'Si' then
        begin
           if frmPRN_0026.OpenP then
              frmPRN_0026.imprimirP;
        end
        else
           begin
              if frmPRN_0026.OpenN then
                 frmPRN_0026.imprimir;
           end;
  finally
     frmPRN_0026.Free;
  end;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_pedidos.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 edCliente.Text                                                := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger              := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                                                := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger              := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := 0;
           verificarSaldos;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant   := 0;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := 0;
        end;
  end;
end;

procedure TfrmCapturar_pedidos.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
    // edCliente.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_pedidos.ibImprimirClick(Sender: TObject);
begin
  inherited;
  if MarcoMateriales1.FLAG_MEDIDAS then
     itemMedidas.Click
  else
     itemImprimir.Click;
end;

procedure TfrmCapturar_pedidos.itemPreviewClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0026    := TfrmPRN_0026.Create(Application);
     frmPRN_0026.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;

     if estoy_evento then
     begin
        frmPRN_0026.EVENTO := evento;
        if frmPRN_0026.OpenE then
           frmPRN_0026.preview;
     end
     else
        if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Apartado') then
        begin
           if frmPRN_0026.OpenA then
              frmPRN_0026.preview;
        end
        else
        if (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Apartado') and (dsFuente.DataSet.FieldByName('Prioridad').AsString = 'Si') then
        begin
           if frmPRN_0026.OpenAP then
              frmPRN_0026.preview;
        end
        else
        if dsFuente.DataSet.FieldByName('Prioridad').AsString = 'Si' then
        begin
           if frmPRN_0026.OpenP then
              frmPRN_0026.preview;
        end
        else
           begin
              if frmPRN_0026.OpenN then
                 frmPRN_0026.preview;
           end;
  finally
     frmPRN_0026.Free;
  end;
end;

procedure TfrmCapturar_pedidos.itemMedidasClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0026    := TfrmPRN_0026.Create(Application);
     frmPRN_0026.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
     if estoy_evento then
     begin
        frmPRN_0026.EVENTO := evento;
        if frmPRN_0026.OpenEM then
           frmPRN_0026.imprimirE;
     end
     else
        if dsFuente.DataSet.FieldByName('Prioridad').AsString = 'Si' then
        begin
           if frmPRN_0026.OpenMP then//Medida Prioridad
              frmPRN_0026.imprimirP;
        end
        else
           begin
              if frmPRN_0026.OpenMN then//Medida Normal
                 frmPRN_0026.imprimir;
           end;
  finally
     frmPRN_0026.Free;
  end;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_pedidos.itemPreviewMClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0026    := TfrmPRN_0026.Create(Application);
     frmPRN_0026.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
     if frmPRN_0026.OpenMN then
        frmPRN_0026.preview;
  finally
     frmPRN_0026.Free;
  end;
end;

procedure TfrmCapturar_pedidos.pcPedidosChange(Sender: TObject);
begin
  inherited;
//  frmCapturar_pedidos.PopupMenu := pmTeclas;
  Self.PopupMenu := pmTeclas;

  case pcPedidos.ActivePageIndex of
     1 : begin //Cejilla Presentaciones
            Self.PopupMenu := ppFPresentaciones;
//            frmCapturar_pedidos.PopupMenu := ppFPresentaciones;

            if not(qyPartidasPresentaciones.Active) then
               reglas.refresh_IBQuery(qyPartidasPresentaciones);
         end;
  end;
end;

procedure TfrmCapturar_pedidos.buF7PClick(Sender: TObject);
begin
  inherited;
  paPresentaciones.Tag := 0;

  edComentario.Clear;

  edPresentacion.Tag  := 0;
  edPresentacion.Clear;

  if edPresentacion.Enabled and edPresentacion.Visible then
     edPresentacion.SetFocus;

  fijarBotonesP(true);
end;

procedure TfrmCapturar_pedidos.buF8PClick(Sender: TObject);
begin
  inherited;
  paPresentaciones.Tag := dsPartidasPresentaciones.DataSet.FieldByName('R_ID').AsInteger;
  edPresentacion.Tag   := dsPartidasPresentaciones.DataSet.FieldByName('R_PRESENTACION').AsInteger;
  edPresentacion.Text  := dsPartidasPresentaciones.DataSet.FieldByName('R_PRESENTACION_DESCRIPCION').AsString;
  edComentario.Text    := dsPartidasPresentaciones.DataSet.FieldByName('R_COMENTARIO').AsString;

  if edPresentacion.Enabled and edPresentacion.Visible then
     edPresentacion.SetFocus;
     
  fijarBotonesP(true);
end;

procedure TfrmCapturar_pedidos.buF9PClick(Sender: TObject);
begin
  inherited;
  spADD_PEDIDO_PRESENTACION.ParamByName('P_ID').AsInteger           := paPresentaciones.Tag;
  spADD_PEDIDO_PRESENTACION.ParamByName('P_PEDIDO').AsInteger       := dsFuente.DataSet.FieldByName('ID').AsInteger;
  spADD_PEDIDO_PRESENTACION.ParamByName('P_PRESENTACION').AsInteger := edPresentacion.Tag;
  spADD_PEDIDO_PRESENTACION.ParamByName('P_COMENTARIO').AsString    := edComentario.Text;
  spADD_PEDIDO_PRESENTACION.ExecProc;
  spADD_PEDIDO_PRESENTACION.Transaction.CommitRetaining;

  reglas.abrir_IBQuery_seek('R_ID',spADD_PEDIDO_PRESENTACION.ParamByName('R_ID').AsInteger, qyPartidasPresentaciones);
  fijarBotonesP(false);
end;

procedure TfrmCapturar_pedidos.buF10PClick(Sender: TObject);
begin
  inherited;
  fijarBotonesP(false);
end;

procedure TfrmCapturar_pedidos.buF11PClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Desea eliminar Registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     qyDelPresentacion.ParamByName('P_ID').AsInteger := dsPartidasPresentaciones.DataSet.FieldByName('R_ID').AsInteger;
     qyDelPresentacion.ExecSQL;
     qyDelPresentacion.Transaction.CommitRetaining;

     reglas.refresh_IBQuery(qyPartidasPresentaciones);
     fijarBotonesP(false);
  end;
end;

procedure TfrmCapturar_pedidos.edPresentacionButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarPresentaciones             := TfrmSeleccionarPresentaciones.Create(Application);
           frmSeleccionarPresentaciones.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarPresentaciones.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarPresentaciones.DESCRIPCION := edPresentacion.Text;
           if frmSeleccionarPresentaciones.abrirConsulta then
           begin
              frmSeleccionarPresentaciones.ShowModal;
              if frmSeleccionarPresentaciones.ACEPTAR then
              begin
                 edPresentacion.Tag  := frmSeleccionarPresentaciones.ID;
                 edPresentacion.Text := frmSeleccionarPresentaciones.DESCRIPCION;
              end;
           end
           else
              begin
                 edPresentacion.Tag  := frmSeleccionarPresentaciones.ID;
                 edPresentacion.Text := frmSeleccionarPresentaciones.DESCRIPCION;
              end;
           frmSeleccionarPresentaciones.Free;
           frmSeleccionarPresentaciones := nil;
           if (edPresentacion.Tag <> 0) and edComentario.Enabled and edComentario.Visible then
              edComentario.SetFocus;
        end;
    1 : begin
           edPresentacion.Clear;
           edPresentacion.Tag := 0;
        end;
  end;
end;

procedure TfrmCapturar_pedidos.edPresentacionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
     //edPresentacion.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_pedidos.itemF7PClick(Sender: TObject);
begin
  inherited;
  buF7P.Click;
end;

procedure TfrmCapturar_pedidos.itemF8PClick(Sender: TObject);
begin
  inherited;
  buF8P.Click;
end;

procedure TfrmCapturar_pedidos.itemF9PClick(Sender: TObject);
begin
  inherited;
  buF9P.Click;
end;

procedure TfrmCapturar_pedidos.itemF10PClick(Sender: TObject);
begin
  inherited;
  buF10P.Click;
end;

procedure TfrmCapturar_pedidos.itemF11PClick(Sender: TObject);
begin
  inherited;
  buF11P.Click;
end;

procedure TfrmCapturar_pedidos.edExtensionButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarExtension             := TfrmSeleccionarExtension.Create(Application);
           frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarExtension.CLAVE       := edExtension.Text;
           if frmSeleccionarExtension.abrirConsulta then
           begin
              frmSeleccionarExtension.ShowModal;
              if frmSeleccionarExtension.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger           := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarExtension.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarExtension.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarExtension.MONEDA;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger           := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarExtension.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarExtension.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarExtension.MONEDA;
              end;
           frmSeleccionarExtension.Free;
           frmSeleccionarExtension := nil;
           verificarSaldos;
        end;
    1 : begin
           //edCliente.OnButtonClick(sender, 1);
        end;
  end;
end;

procedure TfrmCapturar_pedidos.edExtensionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
    // edExtension.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_pedidos.Anexo1Click(Sender: TObject);
begin
  inherited;
  RPT_PEDIDO_PARTIDAS := TRPT_PEDIDO_PARTIDAS.Create(Application);
  RPT_PEDIDO_PARTIDAS.PEDIDO := dsFuente.DataSet.FieldByName('CLAVE').AsString;
  RPT_PEDIDO_PARTIDAS.ID     := dsFuente.DataSet.FieldByName('ID').AsInteger;
  RPT_PEDIDO_PARTIDAS.Preview;
  RPT_PEDIDO_PARTIDAS.Free;
end;

procedure TfrmCapturar_pedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  MarcoMateriales1.Destruir;
end;

procedure TfrmCapturar_pedidos.buQuitarClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('� Quitar impuestos ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spQUITAR_IMPUESTOS_PEDIDO.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spQUITAR_IMPUESTOS_PEDIDO.ExecProc;
     spQUITAR_IMPUESTOS_PEDIDO.Transaction.CommitRetaining;

     BeforeUpdate;
     reglas.abrir_IBTabla(TCapturar);
     reglas.refresh_IBQuery(qyPartidas);
     //dgPartidas.FullExpand;
     AfterRecord;
  end;
end;

procedure TfrmCapturar_pedidos.buAumentarClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('� Aumentar impuestos ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spAUMENTAR_IMPUESTOS_PEDIDO.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spAUMENTAR_IMPUESTOS_PEDIDO.ExecProc;
     spAUMENTAR_IMPUESTOS_PEDIDO.Transaction.CommitRetaining;

     BeforeUpdate;
     reglas.abrir_IBTabla(TCapturar);
     reglas.refresh_IBQuery(qyPartidas);
     //dgPartidas.FullExpand;
     AfterRecord;
  end;
end;

procedure TfrmCapturar_pedidos.edPrecioNCChange(Sender: TObject);
begin
  inherited;
  if (MarcoMateriales1.edMaterial.Tag <> 0) then
  begin
     spCALCULA_PSI.ParamByName('P_MATERIAL').AsInteger := MarcoMateriales1.edMaterial.Tag;
     spCALCULA_PSI.ParamByName('P_PRECIO').AsFloat     := StrToFloat(edPrecioNC.Text);
     spCALCULA_PSI.ExecProc;

     edPUNC.Text := spCALCULA_PSI.ParamByName('R_PRECIO').AsString;
  end;
end;

procedure TfrmCapturar_pedidos.MarcoMateriales1edMaterialButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  MarcoMateriales1.edMaterialButtonClick(Sender, AbsoluteIndex);
  case AbsoluteIndex of
    0: begin
          if (MarcoMateriales1.edMaterial.Tag <> 0) and awrPNC then
          begin
             qyLP_NC.Close;
             qyLP_NC.ParamByName('P_MATERIAL').AsInteger  := MarcoMateriales1.edMaterial.Tag;
             qyLP_NC.ParamByName('P_CLIENTE').AsInteger   := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
             qyLP_NC.ParamByName('P_EXTENSION').AsInteger := dsFuente.DataSet.FieldByName('EXTENSION').AsInteger;
             qyLP_NC.Open;

             awrPNC_Minimo := qyLP_NC.FieldByName('R_PRECIO_MINIMO').AsFloat;
             awrPNC_Maximo := qyLP_NC.FieldByName('R_PRECIO_MAXIMO').AsFloat;

             edPrecioNC.Text := FloatToStr(awrPNC_Maximo);
          end;
       end;
    1: begin
          edPrecioNC.Clear;
          edPUNC.Clear;
       end;
  end;
end;

procedure TfrmCapturar_pedidos.cbEstatusChange(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmCapturar_pedidos.cbEstatusEnter(Sender: TObject);
begin
  inherited;
  cbEstatus.Width := 140;

end;

procedure TfrmCapturar_pedidos.cbEstatusExit(Sender: TObject);
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

procedure TfrmCapturar_pedidos.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyEstatus);
  qyEstatus.Last;
end;

procedure TfrmCapturar_pedidos.buAplicarClick(Sender: TObject);
var
   ejecutar : boolean;
begin
  inherited;
  verfificarFechas;

  ejecutar := TRUE;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusAnt;
  dsFuente.DataSet.Post;
  if ((awrStatus.autorizacion) and (awrStatus.nivel > reglas.dameUsuarioNivel)) or (awrStatus.unico <> 0) then
  begin
     try
        Application.CreateForm(TfrmAcceso, frmAcceso);
        frmAcceso.UnicoN := awrStatus.unico_n;
        frmAcceso.Unico  := awrStatus.unico;
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
     if awrStatus.imprimir then
     begin
        qyInsuficientes.Close;
        qyInsuficientes.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
        qyInsuficientes.Open;

        if qyInsuficientes.IsEmpty then
           ibImprimir.Click;
     end;
//     spPrueba.ExecProc;

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
     if(TCapturar.State = dsEdit  ) then
     begin
       ShowMessage('edicion');
     end;

     TCapturar.close;
     reglas.abrir_IBTabla(TCapturar);
     fijarBotonesDetalle;

     if awrStatus.correo then
     begin
        mensajes;
     end;
  end;
end;

procedure TfrmCapturar_pedidos.itemEnviarClick(Sender: TObject);
var
    enc  : string;
    det  : string;
    cEnc : string;
    cDet : string;
    arc  : string;
    enviarE : boolean;
    enviarD : boolean;
begin
  inherited;
  {
  if revisarRutaEnvio then
  begin
     if revisarDBFEnvio then
     begin

        if not(dbFTP.Connected) then
        begin
           dbFTP.DatabaseName := ExtractFilePath(ParamStr(0))+'ftp';
           dbFTP.Connected    := true;
        end;

        arc  := '_'+IntToStr(reglas.dame_usuario)+'_'+dsFuente.DataSet.FieldByName('ID').AsString+'.DBF';
        enc  := ExtractFilePath(ParamStr(0))+'ftp\E_VENDEDOR_PEDIDO.DBF';
        det  := ExtractFilePath(ParamStr(0))+'ftp\D_VENDEDOR_PEDIDO.DBF';
        cEnc := ExtractFilePath(ParamStr(0))+'ftp\E'+arc;
        cDet := ExtractFilePath(ParamStr(0))+'ftp\D'+arc;

        //*************Configurar tablas ftp***************//
        ftpENC.TableName   := 'E'+arc;
        ftpITEMS.TableName := 'D'+arc;

        //ENCABEZDO
        enviarE := true;
        if (CopyFile(PCHAR(enc), PCHAR(cEnc), false) = false) then
        begin
           enviarE := false;
           showmessage('Fallo copia de archivo de datos encabezado')
        end
        else
           begin
              //********** GRABAR INFORMACION **********//
              ftpENC.EmptyTable;
              ftpENC.Open;
              ftpENC.Insert;
              ftpENC.FieldByName('ID').AsInteger          := dsFuente.DataSet.FieldByName('ID').AsInteger;
              ftpENC.FieldByName('CLAVE').AsString        := dsFuente.DataSet.FieldByName('CLAVE').AsString;
              ftpENC.FieldByName('FECHA_ALTA').AsDatetime := dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDatetime;
              ftpENC.FieldByName('FECHA_CANC').AsVariant  := dsFuente.DataSet.FieldByName('FECHA_CANCELACION').AsVariant;
              ftpENC.FieldByName('CLIENTE').AsInteger     := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
              ftpENC.FieldByName('EXTENSION').AsVariant   := dsFuente.DataSet.FieldByName('EXTENSION').AsVariant;
              ftpENC.FieldByName('CONDICION_').AsInteger  := dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger;
              ftpENC.FieldByName('ANTICIPO').AsFloat      := dsFuente.DataSet.FieldByName('ANTICIPO').AsFloat;
              ftpENC.FieldByName('OBSERVACIO').AsString   := dsFuente.DataSet.FieldByName('OBSERVACIONES').AsString;
              ftpENC.FieldByName('PRIORIDAD').AsString    := dsFuente.DataSet.FieldByName('PRIORIDAD').AsString;
              ftpENC.FieldByName('ALMACEN').AsInteger     := dsFuente.DataSet.FieldByName('ALMACEN').AsInteger;
              ftpENC.FieldByName('SUBTOTAL').AsFloat      := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
              ftpENC.FieldByName('IVA').AsFloat           := dsFuente.DataSet.FieldByName('IVA').AsFloat;
              ftpENC.FieldByName('IEPS').AsFloat          := dsFuente.DataSet.FieldByName('IEPS').AsFloat;
              ftpENC.FieldByName('IMPUESTO1').AsFloat     := dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat;
              ftpENC.FieldByName('IMPUESTO2').AsFloat     := dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat;
              ftpENC.FieldByName('TOTAL').AsFloat         := dsFuente.DataSet.FieldByName('TOTAL').AsFloat;
              ftpENC.FieldByName('DESCUENTO1').AsFloat    := dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat;
              ftpENC.FieldByName('DESCUENTO2').AsFloat    := dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_GLOBAL').AsFloat;
              ftpENC.FieldByName('DESCUENTO3').AsFloat    := dsFuente.DataSet.FieldByName('DESCUENTO_CANTIDAD_PARCIAL').AsFloat;
              ftpENC.FieldByName('GRANTOTAL').AsFloat     := dsFuente.DataSet.FieldByName('GRANTOTAL').AsFloat;
              ftpENC.FieldByName('MONEDA').AsInteger      := dsFuente.DataSet.FieldByName('MONEDA').AsInteger;
              ftpENC.FieldByName('QUIEN_FACT').AsInteger  := dsFuente.DataSet.FieldByName('QUIEN_REMISIONO').AsInteger;
              ftpENC.FieldByName('CAMBIO_ENT').AsFloat    := dsFuente.DataSet.FieldByName('CAMBIO_ENTREGADO').AsFloat;
              ftpENC.FieldByName('PUNTO_DE_V').AsVariant  := dsFuente.DataSet.FieldByName('PUNTO_DE_VENTA').AsVariant;
              ftpENC.FieldByName('ORIGEN').AsString       := dsFuente.DataSet.FieldByName('ORIGEN').AsString;
              ftpENC.FieldByName('CONSECUTIV').AsInteger  := dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger;
              ftpENC.FieldByName('QUIEN_FACT').AsInteger  := dsFuente.DataSet.FieldByName('VENDEDOR').AsInteger;
//              ftpENC.FieldByName('PAGOS').AsInteger       := dsFuente.DataSet.FieldByName('PAGOS').AsInteger;
              ftpENC.FieldByName('FINANCIAMI').AsFloat    := dsFuente.DataSet.FieldByName('FINANCIAMIENTO').AsFloat;
              ftpENC.FieldByName('ID_REFEREN').AsInteger  := dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsInteger;
              ftpENC.FieldByName('TABLA_REFE').AsString   := dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString;
              ftpENC.FieldByName('ESTATUS').AsString      := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
              ftpENC.Post;
              ftpENC.Close;
           end;

        //DETALLE
        enviarD := true;
        if (CopyFile(PCHAR(det), PCHAR(cDet), false) = false) then
        begin
           enviarD := false;
           showmessage('Fallo copia de archivo de datos detalle')
        end
        else
           begin
              //********** GRABAR INFORMACION **********//
              ftpITEMS.EmptyTable;
              ftpITEMS.Open;
              dsPartidas.DataSet.First;
              while not(dsPartidas.DataSet.Eof) do
              begin
                 ftpITEMS.Insert;
                 ftpITEMS.FieldByName('ID').AsInteger         := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
                 ftpITEMS.FieldByName('PEDIDO').AsInteger     := dsPartidas.DataSet.FieldByName('R_PEDIDO').AsInteger;
                 ftpITEMS.FieldByName('MATERIAL').AsInteger   := dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger;
                 ftpITEMS.FieldByName('CANTIDAD').AsFloat     := dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsFloat;
                 ftpITEMS.FieldByName('UNIDAD').AsInteger     := dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger;
                 ftpITEMS.FieldByName('PRECIO').AsFloat       := dsPartidas.DataSet.FieldByName('R_PRECIO').AsFloat;
                 ftpITEMS.FieldByName('DESCUENTO_').AsFloat   := dsPartidas.DataSet.FieldByName('R_DESCUENTO_PORC').AsFloat;
                 ftpITEMS.FieldByName('SUBTOTAL').AsFloat     := dsPartidas.DataSet.FieldByName('R_SUBTOTAL').AsFloat;
                 ftpITEMS.FieldByName('IVA').AsFloat          := dsPartidas.DataSet.FieldByName('R_IVA').AsFloat;
                 ftpITEMS.FieldByName('IEPS').AsFloat         := dsPartidas.DataSet.FieldByName('R_IEPS').AsFloat;
                 ftpITEMS.FieldByName('IMPUESTO1').AsFloat    := dsPartidas.DataSet.FieldByName('R_IMPUESTO1').AsFloat;
                 ftpITEMS.FieldByName('IMPUESTO2').AsFloat    := dsPartidas.DataSet.FieldByName('R_IMPUESTO2').AsFloat;
                 ftpITEMS.FieldByName('IVA_PORC').AsFloat     := dsPartidas.DataSet.FieldByName('R_IVA_PORC').AsFloat;
                 ftpITEMS.FieldByName('IEPS_PORC').AsFloat    := dsPartidas.DataSet.FieldByName('R_IEPS_PORC').AsFloat;
                 ftpITEMS.FieldByName('IMP1_POR').AsFloat     := dsPartidas.DataSet.FieldByName('R_IMPUESTO1_PORC').AsFloat;
                 ftpITEMS.FieldByName('IMP2_POR').AsFloat     := dsPartidas.DataSet.FieldByName('R_IMPUESTO2_PORC').AsFloat;
                 ftpITEMS.FieldByName('PRECIO_SIN').AsFloat   := dsPartidas.DataSet.FieldByName('R_PRECIO_SIN_IMPUESTOS').AsFloat;
                 ftpITEMS.FieldByName('MEDIDA').AsInteger     := dsPartidas.DataSet.FieldByName('R_MEDIDA').AsInteger;
                 ftpITEMS.FieldByName('COLOR').AsInteger      := dsPartidas.DataSet.FieldByName('R_COLOR').AsInteger;
                 ftpITEMS.FieldByName('PNC').AsFloat          := dsPartidas.DataSet.FieldByName('R_PNC').AsFloat;
                 ftpITEMS.FieldByName('ESTATUS').AsString     := dsPartidas.DataSet.FieldByName('R_ESTATUS').AsString;
                 ftpITEMS.Post;
                 dsPartidas.DataSet.Next;
              end;
              ftpITEMS.Close;
           end;
        dbFTP.Connected := false;

        //********* enviar archivos servidor *********//
        if enviarE then
        begin
           try ftpPedido.Connect; except
              try ftpPedido.Connect; except end;
           end;

           try
              ftpPedido.Upload(cEnc, awrFTP.Destino+'E'+arc);
           except
              showmessage('fallo conexion encabezado');
           end;
        end;

        if enviarD then
        begin
           try ftpPedido.Connect; except
              try ftpPedido.Connect; except end;
           end;

           try
              ftpPedido.Upload(cDet, awrFTP.Destino+'D'+arc);
           except
              showmessage('fallo conexion detalle');
           end;
        end;

//        ftpPedido.Disconnect;
     end;
  end;
  }
end;

procedure TfrmCapturar_pedidos.ftpPedidoPacketSent(Sender: TObject);
begin
  inherited;
  //sbHijo.Panels[8].Text := 'Enviando '+IntToStr(ftpPedido.BytesSent)+' bytes of '+IntToStr(ftpPedido.BytesTotal)+' total';
end;

procedure TfrmCapturar_pedidos.sbActualizarTEClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyTEntrega);
end;

procedure TfrmCapturar_pedidos.sbLimpiarTEClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('ZONAS_TE').AsVariant := 0;
  dsFuente.DataSet.FieldByName('TE_TARIFA').AsFloat  := 0.00;
end;

procedure TfrmCapturar_pedidos.cbTEntregaChange(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('TE_FLETE').AsFloat     := dsTEntrega.DataSet.FieldByName('R_FLETE').AsFloat;
  dsFuente.DataSet.FieldByName('TE_SEGURO').AsFloat    := dsTEntrega.DataSet.FieldByName('R_SEGURO').AsFloat;
  dsFuente.DataSet.FieldByName('TE_OTRO').AsFloat      := dsTEntrega.DataSet.FieldByName('R_OTRO').AsFloat;
  dsFuente.DataSet.FieldByName('TE_EXCEDENTE').AsFloat := dsTEntrega.DataSet.FieldByName('R_EXCEDENTE').AsFloat;
  dsFuente.DataSet.FieldByName('TE_TARIFA').AsFloat    := dsTEntrega.DataSet.FieldByName('R_TARIFA').AsFloat;
  dsFuente.DataSet.FieldByName('TE_KILOS').AsInteger   := dsTEntrega.DataSet.FieldByName('R_PAQ_KILOS').AsInteger;
end;

procedure TfrmCapturar_pedidos.buInsuficienciasClick(Sender: TObject);
begin
  inherited;
  try
     frmInsuficienciasPedido    := TfrmInsuficienciasPedido.Create(Application);
     frmInsuficienciasPedido.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmInsuficienciasPedido.ShowModal;
  finally
     frmInsuficienciasPedido.Release;
  end;
end;

procedure TfrmCapturar_pedidos.buKitClick(Sender: TObject);
var
   result : TModalResult;
begin
  inherited;
  result := mrNone;
  try
     frmKit        := TfrmKit.Create(application);
     frmKit.PEDIDO := dsFuente.DataSet.FieldByName('ID').AsInteger;
     result        := frmKit.ShowModal;
   finally
     frmKit.Release;

     if (result = mrOk) then
     begin
        reglas.abrir_IBTabla(TCapturar);
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
   end;
end;

procedure TfrmCapturar_pedidos.dgPartidasTERMINADOButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsPartidas.DataSet.FieldByName('R_ESTATUS').AsString = 'Parcialmente Surtido' then
  begin
     if MessageDlg('�Esta seguro de TERMINAR partida?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
     begin
        spP_PEDIDO_PARTIDA_TERMINADO.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spP_PEDIDO_PARTIDA_TERMINADO.ExecProc;
        spP_PEDIDO_PARTIDA_TERMINADO.Transaction.CommitRetaining;

        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end
  else
  if (dsPartidas.DataSet.FieldByName('R_ESTATUS').AsString = 'Terminado') and
     (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Parcialmente Surtido') then
  begin
     if MessageDlg('�Esta seguro de colocar la partida en PARCIALMENTE SURTIDO?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
     begin
        spP_PEDIDO_PARTIDA_PSURTIDO.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spP_PEDIDO_PARTIDA_PSURTIDO.ExecProc;
        spP_PEDIDO_PARTIDA_PSURTIDO.Transaction.CommitRetaining;

        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end
  else
  begin
    ShowMessage('La partida no se encuentra parcialmente surtida. No es posible cambiar a Terminado.');
  end;
end;

procedure TfrmCapturar_pedidos.dgPartidasFEButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar' then
  begin
     {
     dlgFecha.DateValue := dsPartidas.DataSet.FieldByName('R_F_PROM_ENT').AsDateTime;
     if dlgFecha.Execute then
     begin
        spM_F_PROM_ENT_PEDIDO.ParamByName('P_ID').AsInteger   := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spM_F_PROM_ENT_PEDIDO.ParamByName('P_FECHA').AsString := FormatDateTime('mm/dd/yyyy', dlgFecha.DateValue);
        spM_F_PROM_ENT_PEDIDO.ExecProc;
        spM_F_PROM_ENT_PEDIDO.Transaction.CommitRetaining;

        reglas.refresh_IBQuery(qyPartidas);
        dgPartidas.FullExpand;
     end;
     }
  end
  else
  begin
    ShowMessage('El estatus no es valido para poder asigna fecha de entrega.');
  end
end;

procedure TfrmCapturar_pedidos.itemNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_pedidos.itemEliminarPartidaClick(Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;
end.
