unit capturar_reportes_extras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Db, IBX.IBQuery, IBX.IBCustomDataSet, IBX.IBTable, Buttons,
  DBCtrls, ComCtrls, jpeg, ExtCtrls, System.Variants;

type
  TfrmCapturar_reportes_extras = class(TForm)
    TCajas: TIBTable;
    TCajasID: TIntegerField;
    TCajasNOMBRE: TIBStringField;
    TCajasALMACEN: TIntegerField;
    TCajasUSUARIO: TIntegerField;
    TCajasTIPO_DE_CAJA: TIBStringField;
    TCajasESTATUS: TIBStringField;
    TCajasMODULO_FUNCION: TIntegerField;
    dsCajas: TDataSource;
    qyAlmacenes: TIBQuery;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    qyDetalleCC: TIBQuery;
    qyDetalleCCR_ID: TIntegerField;
    qyDetalleCCR_FOLIO_DE_VENTA: TIntegerField;
    qyDetalleCCR_CAJA: TIntegerField;
    qyDetalleCCR_CAJA_NOMBRE: TIBStringField;
    qyDetalleCCR_CLIENTE: TIntegerField;
    qyDetalleCCR_CLIENTE_NOMBRE: TIBStringField;
    qyDetalleCCR_EXTENSION: TIntegerField;
    qyDetalleCCR_EXTENSION_NOMBRE: TIBStringField;
    qyDetalleCCR_FECHA: TDateTimeField;
    qyDetalleCCR_GRANTOTAL: TFloatField;
    qyDetalleCCR_CAMBIO: TFloatField;
    qyDetalleCCR_ID_DETALLE: TIntegerField;
    qyDetalleCCR_PUNTO_DE_VENTA: TIntegerField;
    qyDetalleCCR_MATERIAL: TIntegerField;
    qyDetalleCCR_MATERIAL_NOMBRE: TIBStringField;
    qyDetalleCCR_CANTIDAD: TFloatField;
    qyDetalleCCR_UNIDAD: TIntegerField;
    qyDetalleCCR_UNIDAD_DESCRIPCION: TIBStringField;
    qyDetalleCCR_PRECIO_VENTA: TFloatField;
    qyDetalleCCR_VENDEDOR: TIntegerField;
    qyDetalleCCR_VENDEDOR_NOMBRE: TIBStringField;
    qyDetalleCCR_SUBTOTAL: TFloatField;
    qyDetalleCCR_TOTAL: TFloatField;
    qyDetalleCCR_GRANTOTAL_DETALLE: TFloatField;
    qyDetalleCCR_ESTATUS: TIBStringField;
    qyDetalleCCR_UNIDAD_CLAVE: TIBStringField;
    qyDetalleCCR_CAJAS: TIntegerField;
    qyDetalleCCR_QUE: TIBStringField;
    qyDetalleCCR_QUE_CLAVE: TIBStringField;
    qyDetalleCCR_TOTAL_CAJAS: TFloatField;
    qyDetalleGrupo: TIBQuery;
    qyDetalleGrupoR_CAJA_NOMBRE: TIBStringField;
    qyDetalleGrupoR_CANTIDAD: TFloatField;
    qyDetalleGrupoR_UNIDAD_CLAVE: TIBStringField;
    qyDetalleGrupoR_MATERIAL_NOMBRE: TIBStringField;
    qyDetalleGrupoR_CAJAS: TIntegerField;
    qyDetalleGrupoR_TIPO_CAJA_CLAVE: TIBStringField;
    qyDetalleGrupoR_TIPO_CAJA_DESCRIPCION: TIBStringField;
    fpPadre: TPanel;
    imBottom: TImage;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    deFecha: TDateTimePicker;
    cbCajas: TDBLookupComboBox;
    sbSinCaja: TBitBtn;
    sbSinAlmacen: TBitBtn;
    cbAlmacenes: TDBLookupComboBox;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    cbExtras: TCheckListBox;
    qyCorteCajaResumen: TIBQuery;
    qyCorteCajaResumenR_MONTO_VENTA: TFloatField;
    qyCorteCajaResumenR_REFERENCIA_PAGO: TIntegerField;
    qyCorteCajaResumenR_REFERENCIA_NOMBRE: TIBStringField;
    qyCorteCajaResumenR_MONTO_COLECTA: TFloatField;
    qyCorteCajaResumenR_SALDO: TFloatField;
    qyCorteCajaResumenR_ORIGEN: TIBStringField;
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
    ibAutorizar: TBitBtn;
    Label4: TLabel;
    Label5: TLabel;
    laNivel: TLabel;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresausuario: TStringField;
    ibDesign: TBitBtn;
    qyEncabezadoNC: TIBQuery;
    qyDetalleNC: TIBQuery;
    qyDetalleBlob: TIBQuery;
    qyDetalleBlobR_REFERENCIAS: TIBStringField;
    qyDetalleConsolidada: TIBQuery;
    qyDetalleConsolidadaR_MATERIAL: TIntegerField;
    qyDetalleConsolidadaR_CLAVE: TIBStringField;
    qyDetalleConsolidadaR_DESCRIPCION: TIBStringField;
    qyDetalleConsolidadaR_GT: TFloatField;
    qyDetalleConsolidadaR_PARTIDAS: TIntegerField;
    qyDetalleConsolidadaR_CANTIDAD: TFloatField;
    qyConsolidadaBlob: TIBQuery;
    IBStringField1: TIBStringField;
    qyDetalleConsolidadaR_CONSECUTIVO: TIntegerField;
    qyDetalleConsolidadaR_CAJAS: TFloatField;
    qyDetalleConsolidadaR_KILOS: TFloatField;
    qyDetalleConsolidadaR_PIEZAS: TFloatField;
    qyDetalleConsolidadaR_CALIDAD: TIntegerField;
    qyDetalleConsolidadaR_UNIDAD: TIntegerField;
    qyDetalleConsolidadaR_UNIDAD_DESCRIPCION: TIBStringField;
    qyDetalleConsolidadaR_PRECIO: TFloatField;
    qyNombreListaPrecios: TIBQuery;
    qyNombreListaPreciosID: TIntegerField;
    qyNombreListaPreciosDESCRIPCION: TIBStringField;
    qyNombreListaPreciosVIGENCIA_DIAS: TIntegerField;
    qyNombreListaPreciosfecha: TDateField;
    qyNombreListaPreciosfecha_actual: TDateField;
    qyListaPreciosPartidas: TIBQuery;
    qyListaPreciosPartidasR_MATERIAL_CLAVE: TIBStringField;
    qyListaPreciosPartidasR_MATERIAL_DESCRIPCION: TIBStringField;
    qyListaPreciosPartidasR_MATERIAL_UNIDAD_DESC: TIBStringField;
    qyListaPreciosPartidasR_PRECIO_MINIMO: TFloatField;
    qyListaPreciosPartidasR_PRECIO_MAXIMO: TFloatField;
    qyEncabezadoOC: TIBQuery;
    qyPartidasOC: TIBQuery;
    qyGEFacturas: TIBQuery;
    qyEncabezadoPV: TIBQuery;
    qyEncabezadoPVR_ID: TIntegerField;
    qyEncabezadoPVR_FOLIO_DE_VENTA: TIntegerField;
    qyEncabezadoPVR_ALMACEN: TIntegerField;
    qyEncabezadoPVR_CAJERO: TIntegerField;
    qyEncabezadoPVR_CONDICION_COMERCIAL: TIntegerField;
    qyEncabezadoPVR_CLIENTE: TIntegerField;
    qyEncabezadoPVR_EXTENSION: TIntegerField;
    qyEncabezadoPVR_FECHA_ALTA: TDateTimeField;
    qyEncabezadoPVR_CAJA: TIntegerField;
    qyEncabezadoPVR_SUBTOTAL: TFloatField;
    qyEncabezadoPVR_IVA: TFloatField;
    qyEncabezadoPVR_IEPS: TFloatField;
    qyEncabezadoPVR_IMPUESTO1: TFloatField;
    qyEncabezadoPVR_IMPUESTO2: TFloatField;
    qyEncabezadoPVR_TOTAL: TFloatField;
    qyEncabezadoPVR_DESCUENTO_GLOBAL_PORC: TFloatField;
    qyEncabezadoPVR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    qyEncabezadoPVR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    qyEncabezadoPVR_GRANTOTAL: TFloatField;
    qyEncabezadoPVR_MONEDA: TFloatField;
    qyEncabezadoPVR_CAMBIO_ENTREGADO: TFloatField;
    qyEncabezadoPVR_FOLIO_HISTORICO: TIntegerField;
    qyEncabezadoPVR_FOLIO_DEVOLUCION: TIntegerField;
    qyEncabezadoPVR_ESTATUS: TIBStringField;
    qyEncabezadoPVR_TOTAL_REF_PAGOS: TFloatField;
    qyEncabezadoPVR_ALMACEN_CLAVE: TIBStringField;
    qyEncabezadoPVR_ALMACEN_NOMBRE: TIBStringField;
    qyEncabezadoPVR_ALMACEN_OBSERVACIONES: TBlobField;
    qyEncabezadoPVR_CAJERO_CLAVE: TIBStringField;
    qyEncabezadoPVR_CAJERO_NOMBRE: TIBStringField;
    qyEncabezadoPVR_CONDICION_CLAVE: TIBStringField;
    qyEncabezadoPVR_CONDICION_NOMBRE: TIBStringField;
    qyEncabezadoPVR_CLIENTE_NOMBRE: TIBStringField;
    qyEncabezadoPVR_CLIENTE_DOMICILIO: TIBStringField;
    qyEncabezadoPVR_CLIENTE_CIUDAD: TIBStringField;
    qyEncabezadoPVR_CLIENTE_CLAVE: TIBStringField;
    qyEncabezadoPVR_CLIENTE_RFC: TIBStringField;
    qyEncabezadoPVR_EXTENSION_NOMBRE: TIBStringField;
    qyEncabezadoPVR_CAJA_NOMBRE: TIBStringField;
    qyEncabezadoPVR_MONEDA_CLAVE: TIBStringField;
    qyEncabezadoPVR_MONEDA_DESCRIPCION: TIBStringField;
    qyEncabezadoPVR_ALMACEN_SERIE: TIBStringField;
    qyEncabezadoPVR_CAJAS: TIntegerField;
    qyEncabezadoPVR_TOTAL_CAJAS: TFloatField;
    qyEncabezadoPVR_FECHA_VENCIMIENTO: TDateTimeField;
    qyEncabezadoPVR_PRIORIDAD: TIBStringField;
    qyEncabezadoPVR_SERIE_NV: TIBStringField;
    qyEncabezadoPVR_CONSECUTIVO: TIntegerField;
    qyEncabezadoPVR_DOCUMENTOS: TIBStringField;
    qyEncabezadoPVR_DESCRIPCION: TIBStringField;
    qyEncabezadoPVR_ETIQ_TOTAL: TIBStringField;
    qyEncabezadoPVR_ETIQ_CC_UNO: TIBStringField;
    qyEncabezadoPVR_ETIQ_CC_DOS: TIBStringField;
    qyEncabezadoPVR_ETIQ_CC_TRES: TIBStringField;
    qyEncabezadoPVR_CC_MONTO_UNO: TFloatField;
    qyEncabezadoPVR_CC_MONTO_DOS: TFloatField;
    qyEncabezadoPVR_CC_MONTO_TRES: TFloatField;
    qyEncabezadoPVR_ARTICULOS: TIntegerField;
    qyEncabezadoPVR_ETIQ_LINEA: TIBStringField;
    qyEncabezadoPVR_ES_R: TIBStringField;
    qyDetallePV: TIBQuery;
    qyMIEnc: TIBQuery;
    qyMIDet: TIBQuery;
    qyGEPedidos: TIBQuery;
    qyCVEnc: TIBQuery;
    qyCVDet: TIBQuery;
    qyNEEnc: TIBQuery;
    qyNEDet: TIBQuery;
    qyDetalleConsolidadaCC: TIBQuery;
    qyDetalleConsolidadaCCR_REFERENCIA_PAGO: TIntegerField;
    qyDetalleConsolidadaCCR_REFERENCIA_PAGO_NOMBRE: TIBStringField;
    qyDetalleConsolidadaCCR_SUBTOTAL: TFloatField;
    qyDetalleConsolidadaCCR_IVA: TFloatField;
    qyDetalleConsolidadaCCR_MONTO: TFloatField;
    qyEncabezadoNV: TIBQuery;
    qyEncabezadoNVR_ID: TIntegerField;
    qyEncabezadoNVR_FOLIO_DE_VENTA: TIntegerField;
    qyEncabezadoNVR_ALMACEN: TIntegerField;
    qyEncabezadoNVR_CAJERO: TIntegerField;
    qyEncabezadoNVR_CONDICION_COMERCIAL: TIntegerField;
    qyEncabezadoNVR_CLIENTE: TIntegerField;
    qyEncabezadoNVR_EXTENSION: TIntegerField;
    qyEncabezadoNVR_FECHA_ALTA: TDateTimeField;
    qyEncabezadoNVR_CAJA: TIntegerField;
    qyEncabezadoNVR_SUBTOTAL: TFloatField;
    qyEncabezadoNVR_IVA: TFloatField;
    qyEncabezadoNVR_IEPS: TFloatField;
    qyEncabezadoNVR_IMPUESTO1: TFloatField;
    qyEncabezadoNVR_IMPUESTO2: TFloatField;
    qyEncabezadoNVR_TOTAL: TFloatField;
    qyEncabezadoNVR_DESCUENTO_GLOBAL_PORC: TFloatField;
    qyEncabezadoNVR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    qyEncabezadoNVR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    qyEncabezadoNVR_GRANTOTAL: TFloatField;
    qyEncabezadoNVR_MONEDA: TFloatField;
    qyEncabezadoNVR_CAMBIO_ENTREGADO: TFloatField;
    qyEncabezadoNVR_FOLIO_HISTORICO: TIntegerField;
    qyEncabezadoNVR_FOLIO_DEVOLUCION: TIntegerField;
    qyEncabezadoNVR_ESTATUS: TIBStringField;
    qyEncabezadoNVR_TOTAL_REF_PAGOS: TFloatField;
    qyEncabezadoNVR_ALMACEN_CLAVE: TIBStringField;
    qyEncabezadoNVR_ALMACEN_NOMBRE: TIBStringField;
    qyEncabezadoNVR_CAJERO_NOMBRE: TIBStringField;
    qyEncabezadoNVR_CONDICION_CLAVE: TIBStringField;
    qyEncabezadoNVR_CONDICION_NOMBRE: TIBStringField;
    qyEncabezadoNVR_CLIENTE_NOMBRE: TIBStringField;
    qyEncabezadoNVR_EXTENSION_NOMBRE: TIBStringField;
    qyEncabezadoNVR_CAJA_NOMBRE: TIBStringField;
    qyEncabezadoNVR_MONEDA_CLAVE: TIBStringField;
    qyEncabezadoNVR_MONEDA_DESCRIPCION: TIBStringField;
    qyEncabezadoNVR_CLIENTE_CIUDAD: TIBStringField;
    qyEncabezadoNVR_ALMACEN_SERIE: TIBStringField;
    qyEncabezadoNVR_ALMACEN_OBSERVACIONES: TBlobField;
    qyEncabezadoNVR_CAJERO_CLAVE: TIBStringField;
    qyEncabezadoNVR_CAJAS: TIntegerField;
    qyEncabezadoNVR_TOTAL_CAJAS: TFloatField;
    qyEncabezadoNVR_CLIENTE_DOMICILIO: TIBStringField;
    qyEncabezadoNVR_CLIENTE_CLAVE: TIBStringField;
    qyEncabezadoNVR_CLIENTE_RFC: TIBStringField;
    qyEncabezadoNVR_FECHA_VENCIMIENTO: TDateTimeField;
    qyEncabezadoNVR_PRIORIDAD: TIBStringField;
    qyEncabezadoNVR_SERIE_NV: TIBStringField;
    qyEncabezadoNVR_CONSECUTIVO: TIntegerField;
    qyEncabezadoNVcantidadconletra: TStringField;
    qyEncabezadoNVtotal: TFloatField;
    qyDetPVtas: TIBQuery;
    qyDetPVtasR_ID: TIntegerField;
    qyDetPVtasR_PUNTO_DE_VENTA: TIntegerField;
    qyDetPVtasR_MATERIAL: TIntegerField;
    qyDetPVtasR_CANTIDAD: TFloatField;
    qyDetPVtasR_UNIDAD: TIntegerField;
    qyDetPVtasR_PRECIO_VENTA: TFloatField;
    qyDetPVtasR_COSTO_COMPRA: TFloatField;
    qyDetPVtasR_VENDEDOR: TIntegerField;
    qyDetPVtasR_DESCUENTO_PORC: TFloatField;
    qyDetPVtasR_SUBTOTAL: TFloatField;
    qyDetPVtasR_IVA: TFloatField;
    qyDetPVtasR_IEPS: TFloatField;
    qyDetPVtasR_IMPUESTO1: TFloatField;
    qyDetPVtasR_IMPUESTO2: TFloatField;
    qyDetPVtasR_IVA_PORC: TFloatField;
    qyDetPVtasR_IEPS_PORC: TFloatField;
    qyDetPVtasR_IMPUESTO1_PORC: TFloatField;
    qyDetPVtasR_IMPUESTO2_PORC: TFloatField;
    qyDetPVtasR_IVA_DP: TFloatField;
    qyDetPVtasR_IEPS_DP: TFloatField;
    qyDetPVtasR_IMPUESTO1_DP: TFloatField;
    qyDetPVtasR_IMPUESTO2_DP: TFloatField;
    qyDetPVtasR_SUBTOTAL_DP: TFloatField;
    qyDetPVtasR_IVA_DG: TFloatField;
    qyDetPVtasR_IEPS_DG: TFloatField;
    qyDetPVtasR_IMPUESTO1_DG: TFloatField;
    qyDetPVtasR_IMPUESTO2_DG: TFloatField;
    qyDetPVtasR_SUBTOTAL_DG: TFloatField;
    qyDetPVtasR_ESTATUS: TIBStringField;
    qyDetPVtasR_TOTAL: TFloatField;
    qyDetPVtasR_DP: TFloatField;
    qyDetPVtasR_DG: TFloatField;
    qyDetPVtasR_GT: TFloatField;
    qyDetPVtasR_MATERIAL_CLAVE: TIBStringField;
    qyDetPVtasR_MATERIAL_DESCRIPCION: TIBStringField;
    qyDetPVtasR_MATERIAL_CODIGO_BARRAS: TIBStringField;
    qyDetPVtasR_UNIDAD_CLAVE: TIBStringField;
    qyDetPVtasR_UNIDAD_DESCRIPCION: TIBStringField;
    qyDetPVtasR_VENDEDOR_NOMBRE: TIBStringField;
    qyDetPVtasR_CAJAS: TIntegerField;
    qyEncabezadoCG: TIBQuery;
    qyEncReq: TIBQuery;
    qyEncReqR_EMPRESA_CLAVE: TIBStringField;
    qyEncReqR_EMPRESA_NOMBRE: TIBStringField;
    qyEncReqR_EMPRESA_RAZON_SOCIAL: TIBStringField;
    qyEncReqR_EMPRESA_FACTURAR: TIBStringField;
    qyEncReqR_EMPRESA_RFC: TIBStringField;
    qyEncReqR_EMPRESA_CURP: TIBStringField;
    qyEncReqR_EMPRESA_TELEFONO1: TIBStringField;
    qyEncReqR_EMPRESA_TELEFONO2: TIBStringField;
    qyEncReqR_EMPRESA_CALLE: TIBStringField;
    qyEncReqR_EMPRESA_ENTRE_CALLE: TIBStringField;
    qyEncReqR_EMPRESA_Y_CALLE: TIBStringField;
    qyEncReqR_EMPRESA_NUM_EXT: TIBStringField;
    qyEncReqR_EMPRESA_NUM_INT: TIBStringField;
    qyEncReqR_EMPRESA_LETRA: TIBStringField;
    qyEncReqR_EMPRESA_CP: TIBStringField;
    qyEncReqR_EMPRESA_COLONIA: TIBStringField;
    qyEncReqR_EMPRESA_CIUDAD: TIBStringField;
    qyEncReqR_ID: TIntegerField;
    qyEncReqR_CLAVE: TIBStringField;
    qyEncReqR_DEPARTAMENTO: TIntegerField;
    qyEncReqR_DEPARTAMENTO_CLAVE: TIBStringField;
    qyEncReqR_DEPARTAMENTO_DESCRIPCION: TIBStringField;
    qyEncReqR_USUARIO: TIntegerField;
    qyEncReqR_USUARIO_NOMBRE: TIBStringField;
    qyEncReqR_PRESUPUESTADO: TIBStringField;
    qyEncReqR_PRIORIDAD: TIBStringField;
    qyEncReqR_FECHA_ENTREGA: TDateTimeField;
    qyEncReqR_ORDEN_COMPRA: TIntegerField;
    qyEncReqR_FECHA_ALTA: TDateTimeField;
    qyEncReqR_ESTATUS: TIBStringField;
    qyDetReq: TIBQuery;
    qyDetReqR_ID: TIntegerField;
    qyDetReqR_REQUISICION: TIntegerField;
    qyDetReqR_MATERIAL: TIntegerField;
    qyDetReqR_CLAVE: TIBStringField;
    qyDetReqR_DESCRIPCION: TIBStringField;
    qyDetReqR_UNIDAD: TIntegerField;
    qyDetReqR_DESCRIPCION_UNIDAD: TIBStringField;
    qyDetReqR_CANTIDAD: TFloatField;
    qyDetReqR_ESTATUS: TIBStringField;
    qyPartidasCupon: TIBQuery;
    qyDetPI: TIBQuery;
    qyEncPI: TIBQuery;
    qyPagareCantidades: TIBQuery;
    qyDetME: TIBQuery;
    qyEncME: TIBQuery;
    qyPartidas_OC_L: TIBQuery;
    qyEncabezadoPedidos: TIBQuery;
    qyPartidasPedidos: TIBQuery;
    qyPartidasPedidosM: TIBQuery;
    qyEncabezado: TIBQuery;
    qyDetalle: TIBQuery;
    qyPartidasFacturaM: TIBQuery;
    qyEncODS: TIBQuery;
    qyPartODS: TIBQuery;
    qyFallasODS: TIBQuery;
    dsPartODS: TDataSource;
    qyRefODS: TIBQuery;
    dsFallasODS: TDataSource;
    dsEncODS: TDataSource;
    qyCXCPagos: TIBQuery;
    qyCXCPagosDet: TIBQuery;
    qyDetReqCot: TIBQuery;
    qyEncReqCot: TIBQuery;
    qyPP_Unir: TIBQuery;
    qyPP_Enc: TIBQuery;
    qyProyectos: TIBQuery;
    qyPP_Det: TIBQuery;
    qyPP_SubDet: TIBQuery;
    qyEncabezadoPVR_CANTIDAD_CON_LETRA: TIBStringField;
    qyEncabezadoPVR_ME_CODIGO: TIBStringField;
    qyEncabezadoPVR_ME_OTORGADOS: TFloatField;
    qyEncabezadoPVR_ME_TOTAL: TFloatField;
    qyPolizaCtas: TIBQuery;
    qyDetalleConsolidadaR_CALIDAD_NOMBRE: TIBStringField;
    qyEncabezadoPVR_CLIENTE_EMAIL: TIBStringField;
    qyEncHospPVta: TIBQuery;
    qyEncHospPVtaVuelta: TIBQuery;
    qyEncHospPVtaH: TIBQuery;
    qyEncHospPVtaHVuelta: TIBQuery;
    qyEncHospPVtaQx: TIBQuery;
    qyEncHospPVtaQxVuelta: TIBQuery;
    qyEncHospAbonos: TIBQuery;
    qyEncPVtas: TIBQuery;
    qyEncPVtasR_EMPRESA_CLAVE: TIBStringField;
    qyEncPVtasR_EMPRESA_NOMBRE: TIBStringField;
    qyEncPVtasR_EMPRESA_RAZON_SOCIAL: TIBStringField;
    qyEncPVtasR_EMPRESA_FACTURAR: TIBStringField;
    qyEncPVtasR_EMPRESA_RFC: TIBStringField;
    qyEncPVtasR_EMPRESA_CURP: TIBStringField;
    qyEncPVtasR_EMPRESA_TELEFONO1: TIBStringField;
    qyEncPVtasR_EMPRESA_TELEFONO2: TIBStringField;
    qyEncPVtasR_EMPRESA_CALLE: TIBStringField;
    qyEncPVtasR_EMPRESA_ENTRE_CALLE: TIBStringField;
    qyEncPVtasR_EMPRESA_Y_CALLE: TIBStringField;
    qyEncPVtasR_EMPRESA_NUM_EXT: TIBStringField;
    qyEncPVtasR_EMPRESA_NUM_INT: TIBStringField;
    qyEncPVtasR_EMPRESA_LETRA: TIBStringField;
    qyEncPVtasR_EMPRESA_CP: TIBStringField;
    qyEncPVtasR_EMPRESA_COLONIA: TIBStringField;
    qyEncPVtasR_EMPRESA_CIUDAD: TIBStringField;
    qyEncPVtasR_ID: TIntegerField;
    qyEncPVtasR_FOLIO_DE_VENTA: TIntegerField;
    qyEncPVtasR_ALMACEN: TIntegerField;
    qyEncPVtasR_ALMACEN_CLAVE: TIBStringField;
    qyEncPVtasR_ALMACEN_NOMBRE: TIBStringField;
    qyEncPVtasR_ALMACEN_SERIE: TIBStringField;
    qyEncPVtasR_ALMACEN_OBSERVACIONES: TBlobField;
    qyEncPVtasR_CAJERO: TIntegerField;
    qyEncPVtasR_CAJERO_NOMBRE: TIBStringField;
    qyEncPVtasR_CC: TIntegerField;
    qyEncPVtasR_CLIENTE: TIntegerField;
    qyEncPVtasR_CLIENTE_CLAVE: TIBStringField;
    qyEncPVtasR_CLIENTE_NOMBRE: TIBStringField;
    qyEncPVtasR_CLIENTE_TELEFONO: TIBStringField;
    qyEncPVtasR_CLIENTE_DOMICILIO: TIBStringField;
    qyEncPVtasR_CLIENTE_CIUDAD: TIBStringField;
    qyEncPVtasR_CLIENTE_CIUDAD_CODIGO: TIBStringField;
    qyEncPVtasR_EXTENSION: TIntegerField;
    qyEncPVtasR_EXTENSION_CLAVE: TIBStringField;
    qyEncPVtasR_EXTENSION_NOMBRE: TIBStringField;
    qyEncPVtasR_EXTENSION_DIRECCION: TIBStringField;
    qyEncPVtasR_EXTENSION_CIUDAD: TIBStringField;
    qyEncPVtasR_EXTENSION_CIUDAD_CODIGO: TIBStringField;
    qyEncPVtasR_FECHA_ALTA: TDateTimeField;
    qyEncPVtasR_CAJA: TIntegerField;
    qyEncPVtasR_SUBTOTAL: TFloatField;
    qyEncPVtasR_IVA: TFloatField;
    qyEncPVtasR_IEPS: TFloatField;
    qyEncPVtasR_IMPUESTO1: TFloatField;
    qyEncPVtasR_IMPUESTO2: TFloatField;
    qyEncPVtasR_TOTAL: TFloatField;
    qyEncPVtasR_DESC_GLOBAL_PORC: TFloatField;
    qyEncPVtasR_DESC_GLOBAL_CANT: TFloatField;
    qyEncPVtasR_DESC_PARCIAL_CANT: TFloatField;
    qyEncPVtasR_GRANTOTAL: TFloatField;
    qyEncPVtasR_MONEDA: TIntegerField;
    qyEncPVtasR_CAMBIO_ENTREGADO: TFloatField;
    qyEncPVtasR_FOLIO_HISTORICO: TIntegerField;
    qyEncPVtasR_ESTATUS: TIBStringField;
    qyEncPVtasR_TOTAL_REF_PAGOS: TFloatField;
    qyEncPVtasR_PRIORIDAD: TIBStringField;
    qyEncPVtasR_SERIE_NV: TIBStringField;
    qyEncPVtasR_CONSECUTIVO: TIntegerField;
    qyEncPVtasR_CERRADO: TIBStringField;
    qyEncPVtasR_CANTIDAD_CON_LETRAS: TIBStringField;
    qyEncPVtasR_SUBTOTAL_2: TFloatField;
    qyEncPVtasR_CAJAS: TIntegerField;
    qyEncPVtasR_CAJAS_TOTAL: TFloatField;
    qyEncPVtasR_VALE1_NUM_CC: TIntegerField;
    qyEncPVtasR_VALE1_NUM_CNOC: TIntegerField;
    qyEncPVtasR_VALE1_MATERIAL: TIBStringField;
    qyEncPVtasR_VALE1_PRECIO: TFloatField;
    qyEncPVtasR_VALE1_TOTAL: TFloatField;
    qyEncPVtasR_VALE2_NUM_CC: TIntegerField;
    qyEncPVtasR_VALE2_NUM_CNOC: TIntegerField;
    qyEncPVtasR_VALE2_MATERIAL: TIBStringField;
    qyEncPVtasR_VALE2_PRECIO: TFloatField;
    qyEncPVtasR_VALE2_TOTAL: TFloatField;
    qyEncPVtasR_VALE3_NUM_CC: TIntegerField;
    qyEncPVtasR_VALE3_NUM_CNOC: TIntegerField;
    qyEncPVtasR_VALE3_MATERIAL: TIBStringField;
    qyEncPVtasR_VALE3_PRECIO: TFloatField;
    qyEncPVtasR_VALE3_TOTAL: TFloatField;
    qyEncPVtasR_VALE_T_NUM_CC: TIntegerField;
    qyEncPVtasR_VALE_T_NUM_CNOC: TIntegerField;
    qyEncPVtasR_VALE_T_MATERIAL: TIBStringField;
    qyEncPVtasR_VALE_T_TOTAL: TFloatField;
    qyEncPVtasR_EXTENSION_SEXO: TIBStringField;
    qyEncPVtasR_EXTENSION_F_NAC: TDateTimeField;
    qyEncPVtasR_EXTENSION_L_NAC: TIntegerField;
    qyEncPVtasR_EXTENSION_OCUPACION: TIBStringField;
    qyEncPVtasR_EXTENSION_E_CIVIL: TIBStringField;
    qyEncPVtasR_EXTENSION_EDAD: TIntegerField;
    qyEncPVtasR_EXTENSION_TELEFONO: TIBStringField;
    qyEncPVtasR_HOSP_MEDICO: TIntegerField;
    qyEncPVtasR_HOSP_TIPO_CE: TIBStringField;
    qyEncPVtasR_HOSP_TIPO_HOSP: TIBStringField;
    qyEncPVtasR_HOSP_MEDICO_C: TIBStringField;
    qyEncPVtasR_HOSP_MEDICO_N: TIBStringField;
    qyEncPVtasR_HOSP_OBSERVACIONES: TBlobField;
    qyEncPVtasR_HOSP_DIAGNOSTICO: TIntegerField;
    qyEncPVtasR_HOSP_DIAGNOSTICO_C: TIBStringField;
    qyEncPVtasR_HOSP_DIAGNOSTICO_D: TIBStringField;
    qyEncPVtasR_HOSP_CIRUGIA: TIntegerField;
    qyEncPVtasR_HOSP_CIRUGIA_C: TIBStringField;
    qyEncPVtasR_HOSP_CIRUGIA_N: TIBStringField;
    qyEncPVtasR_HOSP_ACEPTO_HOSP: TIBStringField;
    qyEncPVtasR_HOSP_ACEPTO_TQX: TIBStringField;
    qyEncabezadoPVR_HOSP_OBSERVACIONES: TBlobField;
    qyEncabezadoPVR_HOSP_FOLIO: TIntegerField;
    qyEncPVtasR_CAJERO_C: TIBStringField;
    qyEncPVtasR_HOSP_FOLIO: TIntegerField;
    qyEncDesempaque: TIBQuery;
    qyPartDesempaque: TIBQuery;
    qyCREnc: TIBQuery;
    qyCRDet: TIBQuery;
    qyEncabezadoNCargo: TIBQuery;
    qyEncabezadoNCargoR_ID: TIntegerField;
    qyEncabezadoNCargoR_TIPO: TIBStringField;
    qyEncabezadoNCargoR_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_FECHA_ALTA: TDateTimeField;
    qyEncabezadoNCargoR_FECHA_CANCELACION: TDateTimeField;
    qyEncabezadoNCargoR_PROVEEDOR: TIntegerField;
    qyEncabezadoNCargoR_CLIENTE: TIntegerField;
    qyEncabezadoNCargoR_EXTENSION: TIntegerField;
    qyEncabezadoNCargoR_EXTENSION_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_EXTENSION_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_EXTENSION_PROVEEDOR: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_TELEFONO: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_FAX: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_RFC: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_ENTRE_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_Y_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NUM_EXT: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NUM_INT: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_COLONIA: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CP: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CIUDAD: TIBStringField;
    qyEncabezadoNCargoR_ALMACEN: TIntegerField;
    qyEncabezadoNCargoR_ALMACEN_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_IVA_PORC: TFloatField;
    qyEncabezadoNCargoR_IEPS_PORC: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO1_PORC: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO2_PORC: TFloatField;
    qyEncabezadoNCargoR_SUBTOTAL: TFloatField;
    qyEncabezadoNCargoR_IVA: TFloatField;
    qyEncabezadoNCargoR_IEPS: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO1: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO2: TFloatField;
    qyEncabezadoNCargoR_TOTAL: TFloatField;
    qyEncabezadoNCargoR_MONEDA: TIntegerField;
    qyEncabezadoNCargoR_MONEDA_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_MONEDA_DESCRIPCION: TIBStringField;
    qyEncabezadoNCargoR_USUARIO: TIntegerField;
    qyEncabezadoNCargoR_USUARIO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_AUTORIZO: TIntegerField;
    qyEncabezadoNCargoR_AUTORIZO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_SERIE_NC: TIBStringField;
    qyEncabezadoNCargoR_CONSECUTIVO: TIntegerField;
    qyEncabezadoNCargoR_ID_REFERENCIA: TIntegerField;
    qyEncabezadoNCargoR_TABLA_REFERENCIA: TIBStringField;
    qyEncabezadoNCargoR_ESTATUS: TIBStringField;
    qyEncabezadoNCargoR_REFERENCIA: TIBStringField;
    qyEncabezadoNCargoR_NUMERO_DE_DOCS: TIntegerField;
    qyEncabezadoNCargoR_DOCUMENTO: TIntegerField;
    qyEncabezadoNCargoR_OBSERVACIONES: TBlobField;
    qyEncabezadoNCargocantidadconletra: TStringField;
    qyDetalleNCargo: TIBQuery;
    qyAnticiposEnc: TIBQuery;
    qyChqsGirados: TIBQuery;
    qyEncabezadoPVR_FOLIO_ALMACEN: TIntegerField;
    qyEncabezadoPVR_FOLIO_GENERAL: TIntegerField;
    qyCorte: TIBQuery;
    qyColecta: TIBQuery;
    qy20MasVendidos: TIBQuery;
    qy20MasVendidosR_MATERIAL: TIntegerField;
    qy20MasVendidosR_MATERIAL_C: TIBStringField;
    qy20MasVendidosR_MATERIAL_D: TIBStringField;
    qy20MasVendidosR_UNIDAD: TIntegerField;
    qy20MasVendidosR_UNIDAD_C: TIBStringField;
    qy20MasVendidosR_UNIDAD_D: TIBStringField;
    qy20MasVendidosR_CANTIDAD: TFloatField;
    qy20MasVendidosR_INVENTARIO: TFloatField;
    qy20MasVendidosR_DESC_CORTA: TIBStringField;
    qyParametros: TIBQuery;
    qyMovimientos: TIBQuery;
    qyPOSFinanciero: TIBQuery;
    qyPOSFinancieroCC: TIBQuery;
    qyPOSHoras: TIBQuery;
    qyPOSCanc: TIBQuery;
    procedure ibImprimirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibCerrarClick(Sender: TObject);
    procedure ibAutorizarClick(Sender: TObject);
    procedure sbSinCajaClick(Sender: TObject);
    procedure sbSinAlmacenClick(Sender: TObject);
    procedure cbExtrasClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyEmpresaCalcFields(DataSet: TDataSet);
    procedure qyDetalleCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
     procedure InitTemplatesList;
     function hayReporte : boolean;
     function dameReporte : string;
     function dameIndexReporte : integer;
     function esGrafico : boolean;
  public
    { Public declarations }
  end;

var
  frmCapturar_reportes_extras: TfrmCapturar_reportes_extras;

implementation

uses reglas_de_negocios, autorizacion, IBModulo;

{$R *.DFM}

procedure TfrmCapturar_reportes_extras.InitTemplatesList;
var
  SearchRec : TSearchRec;
begin
   cbExtras.Clear;
   if FindFirst(ExtractFilePath(ParamStr(0))+'\reportes\*.prt', faAnyFile, SearchRec) = 0 then
      cbExtras.Items.Add(SearchRec.Name);
   while FindNext(SearchRec) = 0 do
      cbExtras.Items.Add(SearchRec.Name);
   FindClose(SearchRec);

   if cbExtras.Items.Count > 0 then
   begin
      cbExtras.ItemIndex  := 0;
      cbExtras.Checked[0] := true;
   end;
end;

procedure TfrmCapturar_reportes_extras.ibImprimirClick(Sender: TObject);
   procedure abrirCorteCajaDetalle(p_caja : integer);
   begin
      qyDetalleCC.Close;
      qyDetalleCC.ParamByName('P_CAJA').AsInteger    := p_caja;
      qyDetalleCC.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
      qyDetalleCC.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
      qyDetalleCC.Open;

      qyDetalleGrupo.Close;
      qyDetalleGrupo.ParamByName('P_CAJA').AsInteger    := p_caja;
      qyDetalleGrupo.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
      qyDetalleGrupo.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
      qyDetalleGrupo.Open;
   end;

   procedure abrirCorteCajaResumen(p_caja : integer);
   begin
      qyCorteCajaResumen.Close;
      qyCorteCajaResumen.ParamByName('P_CAJA').AsInteger    := p_caja;
      qyCorteCajaResumen.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
      qyCorteCajaResumen.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
      qyCorteCajaResumen.Open;
   end;
var
   caja     : integer;
   reporte  : string;
begin
  if(cbAlmacenes.Text <> '')then
  begin
     caja := 0;
     if cbCajas.Text <> '' then
        caja := cbCajas.KeyValue;

     if hayReporte then
     begin
           reporte := dameReporte;
           if reporte = 'CORTECAJADETALLE.PRT' then
           begin
              abrirCorteCajaDetalle(caja);
           end
           else
           if reporte = 'CORTECAJARESUMEN.PRT' then
           begin
              abrirCorteCajaResumen(caja);
           end;
           //si no se encuentra el reporte este solamente puede ser para diseño
           //reReporte.LoadTemplateFromFile(ExtractFilePath(ParamStr(0))+'\Reportes\'+dameReporte,false);
           //cbExtras.Items.Objects[dameIndexReporte] := reReporte;

           //reReporte.PrepareReport;
           //reReporte.PreviewPreparedReport(false);
     end
     else
        ShowMessage('Falta seleccionar algun reporte de la lista.');
  end
  else
     ShowMessage('Para poder desplegar este reporte, seleccione el almacen.');
end;

procedure TfrmCapturar_reportes_extras.FormCreate(Sender: TObject);
begin
  qyVer_Datos_Cajero.Close;
  qyVer_Datos_Cajero.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyVer_Datos_Cajero.Open;

  deFecha.Date         := qyVer_Datos_Cajero.FieldByName('R_FECHA_SERVIDOR').AsDateTime;
  cbCajas.KeyValue     := qyVer_Datos_Cajero.FieldByName('R_ID').AsInteger;
  cbAlmacenes.KeyValue := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;

  if (qyVer_Datos_Cajero.FieldByName('R_NIVEL').AsInteger) < 3 then
  begin
     deFecha.Enabled      := false;
     cbCajas.Enabled      := false;
     cbAlmacenes.Enabled  := false;
     sbSinCaja.Enabled    := false;
     sbSinAlmacen.Enabled := false;
     ibDesign.Enabled     := false;
  end;

  InitTemplatesList;
  reglas.abrir_IBTabla(TCajas);
  reglas.refresh_IBQuery(qyAlmacenes);
  reglas.refresh_IBQuery(qyEmpresa);
end;

procedure TfrmCapturar_reportes_extras.ibCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmCapturar_reportes_extras.ibAutorizarClick(Sender: TObject);
var
   ejecutar : boolean;
begin
   frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
   frmAutorizacion.ShowModal;
   ejecutar := frmAutorizacion.dame_respuesta;
   frmAutorizacion.Free;
   if ejecutar then
   begin
     deFecha.Enabled      := true;
     cbCajas.Enabled      := true;
     cbAlmacenes.Enabled  := true;
     sbSinCaja.Enabled    := true;
     sbSinAlmacen.Enabled := true;
     ibDesign.Enabled     := true;
   end;
end;

procedure TfrmCapturar_reportes_extras.sbSinCajaClick(Sender: TObject);
begin
  cbCajas.KeyValue := Null;
end;

procedure TfrmCapturar_reportes_extras.sbSinAlmacenClick(Sender: TObject);
begin
  cbAlmacenes.KeyValue := Null;
end;

function TfrmCapturar_reportes_extras.dameIndexReporte : integer;
var
   i         : integer;
   condicion : boolean;
   resp      : integer;
begin
   resp := 0;
   for i := 0 to (cbExtras.Items.Count - 1) do
   begin
      condicion := cbExtras.Checked[i];
      if condicion then
      begin
         resp := i;
         break;
      end;
   end;
   result := resp;
end;

function TfrmCapturar_reportes_extras.hayReporte : boolean;
var
   i         : integer;
   hay       : boolean;
   condicion : boolean;
begin
   hay       := false;
   for i := 0 to (cbExtras.Items.Count - 1) do
   begin
      condicion := cbExtras.Checked[i];
      if condicion then
      begin
         hay := true;
         break;
      end;
   end;
   result := hay;
end;

function TfrmCapturar_reportes_extras.dameReporte : string;
var
   i         : integer;
   cual      : string;
   condicion : boolean;
begin
   cual      := '';
   for i := 0 to (cbExtras.Items.Count - 1) do
   begin
      condicion := cbExtras.Checked[i];
      if condicion then
      begin
         cual := UpperCase(cbExtras.Items.Strings[i]);
         break;
      end;
   end;
   result := cual;
end;

procedure TfrmCapturar_reportes_extras.cbExtrasClick(Sender: TObject);
var
   i : integer;
begin
   for i := 0 to (cbExtras.Items.Count - 1) do
   begin
      cbExtras.Checked[i] := false;
   end;
   cbExtras.Checked[cbExtras.ItemIndex] := true;
end;

procedure TfrmCapturar_reportes_extras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmCapturar_reportes_extras.qyEmpresaCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('USUARIO').AsString := reglas.dameUsuario;
end;

function TfrmCapturar_reportes_extras.esGrafico : boolean;
var
   nombre : string;
   tmp    : string;
   resp   : boolean;
begin
   resp := false;
   nombre := dameReporte;
   tmp    := UpperCase(copy(nombre,1,3));
   if tmp = 'WIN' then
      resp := true;
   result := resp;
end;

procedure TfrmCapturar_reportes_extras.qyDetalleCalcFields(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('DESCRIPCION').AsString := reglas.convertirOEM(DataSet.FieldByName('R_DESCRIPCION').AsString);
end;

end.
