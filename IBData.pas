unit IBData;

interface                                                     

uses      
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBQuery, IBX.IBSQL, IBX.IBUpdateSQL, IBX.IBStoredProc;

type
  TdmIBData = class(TDataModule)
    taPreferencias: TIBTable;
    taPreferenciasID: TIntegerField;
    taPreferenciasLICENCIAS: TIntegerField;
    taPreferenciasSERVER_ACTIVO: TIBStringField;
    taPreferenciasAUTORUN: TIBStringField;
    taPreferenciasOCULTAR: TIBStringField;
    taPreferenciasVERSION: TIBStringField;
    dsPreferencias: TDataSource;
    taPreferenciasEMPRESA: TIBStringField;
    taPreferenciasNOMBRE: TIBStringField;
    taPreferenciasCREADO: TDateTimeField;
    taPreferenciasACTUALIZADO: TDateTimeField;
    taPreferenciasHECHO_POR: TIBStringField;
    taPreferenciasACRONIMO: TIBStringField;
    TFiltroUsuarios: TIBTable;
    qyMenuSupervisorMenu: TIBQuery;
    qyMenuSupervisorArbol: TIBQuery;
    dsMenuSupervisorMenu: TDataSource;
    dsMenuSupervisorArbol: TDataSource;
    TFiltroEmpresas: TIBTable;
    TFiltroEmpresasID: TIntegerField;
    TFiltroEmpresasNOMBRE: TIBStringField;
    TFiltroEmpresasNOMBRE_AWR: TIBStringField;
    spFECHA_SERVIDOR: TIBStoredProc;
    qyMenuUsuario: TIBQuery;
    qyMenuUsuarioArbol: TIBQuery;
    dsMenuUsuario: TDataSource;
    dsMenuUsuarioArbol: TDataSource;
    TFiltroUsuariosID: TIntegerField;
    TFiltroUsuariosSUJETO: TIntegerField;
    TFiltroUsuariosUSUARIO: TIBStringField;
    TFiltroUsuariosBAJA: TIBStringField;
    TSujetos: TIBTable;
    dsFiltroUsuarios: TDataSource;
    TFiltroUnidades: TIBTable;
    TFiltroMateriales: TIBTable;
    TFiltroMaterialesID: TIntegerField;
    TFiltroMaterialesCLAVE: TIBStringField;
    TFiltroMaterialesDESCRIPCION: TIBStringField;
    TFiltroMaterialesUNIDAD_BASE: TIntegerField;
    TFiltroMaterialesLINEA: TIntegerField;
    TFiltroMaterialesUNIDADES_COMPRADAS: TFloatField;
    TFiltroMaterialesUNIDADES_VENDIDAS: TFloatField;
    TFiltroMaterialesUNIDADES_PRODUCIDAS: TFloatField;
    TFiltroMaterialesLARGO: TFloatField;
    TFiltroMaterialesANCHO: TFloatField;
    TFiltroMaterialesALTO: TFloatField;
    TFiltroMaterialesUNIDAD_LAA: TIntegerField;
    TFiltroMaterialesLOTE: TIBStringField;
    TFiltroMaterialesNUM_SERIE: TIBStringField;
    TFiltroMaterialesCONSOLIDADO: TIBStringField;
    TFiltroMaterialesCOSTO_PROMEDIO: TIBStringField;
    TFiltroMaterialesCOSTO_PEPS: TIBStringField;
    TFiltroMaterialesCOSTO_UEPS: TIBStringField;
    TFiltroMaterialesFECHA_CERO_EXIST: TDateTimeField;
    TFiltroMaterialesFECHA_ULTIMA_COMPRA: TDateTimeField;
    TFiltroMaterialesCODIGO_BARRAS: TIBStringField;
    TFiltroMaterialesIVA_PORC: TFloatField;
    TFiltroMaterialesIEPS_PORC: TFloatField;
    TFiltroMaterialesIMPUESTO_1_PORC: TFloatField;
    TFiltroMaterialesIMPUESTO_2_PORC: TFloatField;
    TFiltroMaterialesOBSERVACIONES: TBlobField;
    TFiltroMaterialesFOTO: TBlobField;
    TFiltroMaterialesDIAS_DE_VIGENCIA: TIntegerField;
    TFiltroUsuariosAutorizacion: TIBTable;
    TFiltroUsuariosAutorizacionID: TIntegerField;
    TFiltroUsuariosAutorizacionSUJETO: TIntegerField;
    TFiltroUsuariosAutorizacionUSUARIO: TIBStringField;
    TFiltroUsuariosAutorizacionBAJA: TIBStringField;
    dsFiltroUsuariosAutorizacion: TDataSource;
    TFiltroUsuariosAutorizacionNIVEL: TIntegerField;
    TSujetosAutorizacion: TIBTable;
    TSujetosAutorizacionID: TIntegerField;
    TSujetosAutorizacionCLAVE: TIBStringField;
    TSujetosAutorizacionNOMBRE: TIBStringField;
    TSujetosAutorizacionRAZON_SOCIAL: TIBStringField;
    TSujetosAutorizacionRFC: TIBStringField;
    TSujetosAutorizacionCURP: TIBStringField;
    TSujetosAutorizacionDOMICILIO: TIntegerField;
    TSujetosAutorizacionTELEFONOS: TIntegerField;
    TSujetosAutorizacionCONTACTOS: TIntegerField;
    TSujetosAutorizacionFECHA_ALTA: TDateTimeField;
    TSujetosAutorizacionFACTURAR_A: TIBStringField;
    TSujetosAutorizacionE_MAIL: TIBStringField;
    TSujetosAutorizacionWWWW: TIBStringField;
    TSujetosAutorizacionOBSERVACIONES: TBlobField;
    TSujetosAutorizacionSEXO: TIBStringField;
    TSujetosAutorizacionFOTO: TBlobField;
    TPreferencias: TIBTable;
    TFiltroRequisiciones: TIBTable;
    TFiltroRequisicionesID: TIntegerField;
    TFiltroRequisicionesCLAVE: TIBStringField;
    TFiltroRequisicionesDEPARTAMENTO: TIntegerField;
    TFiltroRequisicionesUSUARIO: TIntegerField;
    TFiltroRequisicionesPRESUPUESTADO: TIBStringField;
    TFiltroRequisicionesPRIORIDAD: TIBStringField;
    TFiltroRequisicionesFECHA_ENTREGA: TDateTimeField;
    TFiltroRequisicionesORDEN_COMPRA: TIntegerField;
    TFiltroRequisicionesESTATUS: TIBStringField;
    TFiltroRequisicionesFECHA_ALTA: TDateTimeField;
    TFiltroMonedas: TIBTable;
    TFiltroBotones: TIBTable;
    TFiltroBotonesID: TIntegerField;
    TFiltroBotonesNOMBRE: TIBStringField;
    TFiltroAlmacenes: TIBTable;
    TFiltroVistaUsuarios: TIBTable;
    TFiltroVistaUsuariosID: TIntegerField;
    TFiltroVistaUsuariosNOMBRE: TIBStringField;
    TFiltroVistaUsuariosBAJA: TIBStringField;
    TFiltroOrdenesDeCompras: TIBTable;
    TFiltroOrdenesDeComprasID: TIntegerField;
    TFiltroOrdenesDeComprasCLAVE: TIBStringField;
    TFiltroOrdenesDeComprasFECHA_ALTA: TDateTimeField;
    TFiltroOrdenesDeComprasPROVEEDOR: TIntegerField;
    TFiltroOrdenesDeComprasCONDICION_COMERCIAL: TIntegerField;
    TFiltroOrdenesDeComprasANTICIPO: TFloatField;
    TFiltroOrdenesDeComprasFECHA_ENTREGA: TDateTimeField;
    TFiltroOrdenesDeComprasFECHA_ENTREGA_REAL: TDateTimeField;
    TFiltroOrdenesDeComprasDEPARTAMENTO: TIntegerField;
    TFiltroOrdenesDeComprasPRIORIDAD: TIBStringField;
    TFiltroOrdenesDeComprasALMACEN: TIntegerField;
    TFiltroOrdenesDeComprasSUBTOTAL: TFloatField;
    TFiltroOrdenesDeComprasIVA: TFloatField;
    TFiltroOrdenesDeComprasIEPS: TFloatField;
    TFiltroOrdenesDeComprasIMPUESTO1: TFloatField;
    TFiltroOrdenesDeComprasIMPUESTO2: TFloatField;
    TFiltroOrdenesDeComprasTOTAL: TFloatField;
    TFiltroOrdenesDeComprasDESCUENTO_GLOBAL_PORC: TFloatField;
    TFiltroOrdenesDeComprasDESCUENTO_CANTIDAD: TFloatField;
    TFiltroOrdenesDeComprasMONEDA: TIntegerField;
    TFiltroOrdenesDeComprasCOMPRADOR: TIntegerField;
    TFiltroOrdenesDeComprasFECHA_CANCELACION: TDateTimeField;
    TFiltroOrdenesDeComprasESTATUS: TIBStringField;
    TFiltroOrdenesDeComprasDESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    TFiltroOrdenesDeComprasGRAN_TOTAL: TFloatField;
    dsFiltroEmpresas: TDataSource;
    TFiltroCondicionesComerciales: TIBTable;
    TFiltroCondicionesComercialesID: TIntegerField;
    TFiltroCondicionesComercialesTIPO: TIBStringField;
    TFiltroCondicionesComercialesCLAVE: TIBStringField;
    TFiltroCondicionesComercialesNOMBRE: TIBStringField;
    TFiltroCondicionesComercialesNUM_PAGOS: TIntegerField;
    TFiltroCondicionesComercialesINTERVALO_ENTRE_PAGOS: TIntegerField;
    TFiltroCondicionesComercialesDESPLAZAMIENTO_1_PAGO: TIntegerField;
    TFiltroCondicionesComercialesDESCUENTO_PORCENTAJE: TFloatField;
    TFiltroCondicionesComercialesFINANCIAMIENTO: TIntegerField;
    TFiltroCondicionesComercialesMORATORIO: TIBStringField;
    TFiltroCondicionesComercialesPUNTO_DE_VENTA: TIBStringField;
    TFiltroCondicionesComercialesREQUIERE_AUTORIZACION: TIBStringField;
    TFiltroCondicionesComercialesREQUIERE_FOLIO: TIBStringField;
    TFiltroMaterialesUnidades: TIBTable;
    TFiltroMaterialesUnidadesID: TIntegerField;
    TFiltroMaterialesUnidadesMATERIAL: TIntegerField;
    TFiltroMaterialesUnidadesUNIDAD: TIntegerField;
    TFiltroMaterialesUnidadesFACTOR: TFloatField;
    TSujetosID: TIntegerField;
    TSujetosCLAVE: TIBStringField;
    TSujetosNOMBRE: TIBStringField;
    TSujetosRAZON_SOCIAL: TIBStringField;
    TSujetosRFC: TIBStringField;
    TSujetosCURP: TIBStringField;
    TSujetosDOMICILIO: TIntegerField;
    TSujetosTELEFONOS: TIntegerField;
    TSujetosCONTACTOS: TIntegerField;
    TSujetosFECHA_ALTA: TDateTimeField;
    TSujetosFACTURAR_A: TIBStringField;
    TSujetosE_MAIL: TIBStringField;
    TSujetosWWWW: TIBStringField;
    TSujetosOBSERVACIONES: TBlobField;
    TSujetosSEXO: TIBStringField;
    TSujetosFOTO: TBlobField;
    TFiltroClientes: TIBTable;
    TSujetosCliente: TIBTable;
    dsFiltroClientes: TDataSource;
    TFiltroClientesExtensiones: TIBTable;
    TFiltroClientesExtensionesID: TIntegerField;
    TFiltroClientesExtensionesSUJETO_CLIENTE: TIntegerField;
    TFiltroClientesExtensionesFECHA_ALTA: TDateTimeField;
    TFiltroClientesExtensionesCLAVE: TIBStringField;
    TFiltroClientesExtensionesNOMBRE: TIBStringField;
    TFiltroClientesExtensionesFOTO: TBlobField;
    TFiltroClientesExtensionesFIRMA: TBlobField;
    TFiltroClientesExtensionesLIMITE_CREDITO: TFloatField;
    TFiltroClientesExtensionesESTATUS: TIBStringField;
    TFiltroClientesExtensionesDOMICILIO: TIBStringField;
    TFiltroClientesID: TIntegerField;
    TFiltroClientesSUJETO: TIntegerField;
    TFiltroClientesLIMITE_CREDITO: TFloatField;
    TFiltroClientesMONEDA: TIntegerField;
    TFiltroClientesACUMULADO_COMPRAS: TFloatField;
    TFiltroClientesACUMULADO_PAGOS: TFloatField;
    TFiltroClientesNUM_PAGOS_EXTEMPORANEOS: TIntegerField;
    TFiltroClientesVENDEDOR: TIntegerField;
    TFiltroClientesFORMAS_DE_PAGO: TIntegerField;
    TFiltroClientesSERIE_FACTURA: TIBStringField;
    TFiltroClientesTRANSPORTISTA: TIntegerField;
    TFiltroClientesAPLICAR_PRECIO_MAYOREO: TIBStringField;
    TFiltroClientesCLASIFICACION: TIntegerField;
    TFiltroClientesDIAS_DE_RETARDO: TIntegerField;
    TFiltroClientesREMITENTE: TIntegerField;
    TFiltroClientesINCLUIR_EN_DECLARACION: TIBStringField;
    TFiltroClientesPRIORIDAD: TIBStringField;
    TFiltroClientesCONGELAR_VENTA: TIBStringField;
    TFiltroClientesPROMOCION: TIntegerField;
    TFiltroClientesDIA_FACTURA_REVISION: TIBStringField;
    TFiltroClientesDFR_HORA_DE: TDateTimeField;
    TFiltroClientesDFR_HORA_A: TDateTimeField;
    TFiltroClientesDIA_ENTREGA_CHEQUES: TIBStringField;
    TFiltroClientesDEC_HORA_DE: TDateTimeField;
    TFiltroClientesDEC_HORA_A: TDateTimeField;
    TFiltroClientesFIRMA: TBlobField;
    TFiltroClientesESTATUS: TIBStringField;
    TSujetosClienteID: TIntegerField;
    TSujetosClienteCLAVE: TIBStringField;
    TSujetosClienteNOMBRE: TIBStringField;
    TSujetosClienteRAZON_SOCIAL: TIBStringField;
    TSujetosClienteRFC: TIBStringField;
    TSujetosClienteCURP: TIBStringField;
    TSujetosClienteDOMICILIO: TIntegerField;
    TSujetosClienteTELEFONOS: TIntegerField;
    TSujetosClienteCONTACTOS: TIntegerField;
    TSujetosClienteFECHA_ALTA: TDateTimeField;
    TSujetosClienteFACTURAR_A: TIBStringField;
    TSujetosClienteE_MAIL: TIBStringField;
    TSujetosClienteWWWW: TIBStringField;
    TSujetosClienteOBSERVACIONES: TBlobField;
    TSujetosClienteSEXO: TIBStringField;
    TSujetosClienteFOTO: TBlobField;
    TFiltroCajas: TIBTable;
    TFiltroCajasID: TIntegerField;
    TFiltroCajasNOMBRE: TIBStringField;
    TFiltroCajasALMACEN: TIntegerField;
    TFiltroCajasUSUARIO: TIntegerField;
    TFiltroCajasTIPO_DE_CAJA: TIBStringField;
    TFiltroCajasESTATUS: TIBStringField;
    TFiltroCajasMODULO_FUNCION: TIntegerField;
    TFiltroBancos: TIBTable;
    TSujetosBanco: TIBTable;
    dsFiltroBancos: TDataSource;
    TFiltroBancosID: TIntegerField;
    TFiltroBancosSUJETO: TIntegerField;
    TFiltroBancosSUCURSAL: TIBStringField;
    TFiltroBancosCUENTA: TIBStringField;
    TFiltroBancosMONEDA: TIntegerField;
    TFiltroBancosTIPO_CTA: TIntegerField;
    TSujetosBancoID: TIntegerField;
    TSujetosBancoCLAVE: TIBStringField;
    TSujetosBancoNOMBRE: TIBStringField;
    TSujetosBancoRAZON_SOCIAL: TIBStringField;
    TSujetosBancoRFC: TIBStringField;
    TSujetosBancoCURP: TIBStringField;
    TSujetosBancoDOMICILIO: TIntegerField;
    TSujetosBancoTELEFONOS: TIntegerField;
    TSujetosBancoCONTACTOS: TIntegerField;
    TSujetosBancoFECHA_ALTA: TDateTimeField;
    TSujetosBancoFACTURAR_A: TIBStringField;
    TSujetosBancoE_MAIL: TIBStringField;
    TSujetosBancoWWWW: TIBStringField;
    TSujetosBancoOBSERVACIONES: TBlobField;
    TSujetosBancoSEXO: TIBStringField;
    TSujetosBancoFOTO: TBlobField;
    taPreferenciasFECHA: TDateTimeField;
    TFiltroSujetos: TIBTable;
    dsFiltroSujetos: TDataSource;
    TFiltroSujetosClientes: TIBTable;
    TFiltroExtensiones: TIBTable;
    TFiltroCXC: TIBTable;
    TFiltroSujetosP: TIBTable;
    TFiltroSujetosProveedores: TIBTable;
    dsFiltroSujetosP: TDataSource;
    TFiltroChequeras: TIBTable;
    TFiltroCXP: TIBTable;
    TFiltroProveedores: TIBTable;
    dsFiltroProveedores: TDataSource;
    TSujetosProveedor: TIBTable;
    TFiltroProveedoresID: TIntegerField;
    TFiltroProveedoresSUJETO: TIntegerField;
    TFiltroProveedoresDESCUENTO_PORC: TFloatField;
    TFiltroProveedoresFORMAS_DE_PAGO: TIntegerField;
    TFiltroProveedoresCOMPRA_MINIMA: TFloatField;
    TFiltroProveedoresACUMULADO_COMPRA: TFloatField;
    TFiltroProveedoresPRIORIDAD: TIBStringField;
    TFiltroProveedoresCLASIFICACION: TIntegerField;
    TFiltroProveedoresINCLUIR_EN_DECLARACION: TIBStringField;
    TFiltroProveedoresMONEDA: TIntegerField;
    TFiltroProveedoresDIAS_DE_RETARDO: TIntegerField;
    TFiltroProveedoresRECIBIR_POR: TIntegerField;
    TFiltroProveedoresCONGELAR_PAGO: TIBStringField;
    TFiltroProveedoresDIA_FACTURA_REVISION: TIBStringField;
    TFiltroProveedoresDFR_HORA_DE: TDateTimeField;
    TFiltroProveedoresDFR_HORA_A: TDateTimeField;
    TFiltroProveedoresDIA_ENTREGA_CHEQUES: TIBStringField;
    TFiltroProveedoresDEC_HORA_DE: TDateTimeField;
    TFiltroProveedoresDEC_HORA_A: TDateTimeField;
    TSujetosProveedorID: TIntegerField;
    TSujetosProveedorCLAVE: TIBStringField;
    TSujetosProveedorNOMBRE: TIBStringField;
    TSujetosProveedorRAZON_SOCIAL: TIBStringField;
    TSujetosProveedorRFC: TIBStringField;
    TSujetosProveedorCURP: TIBStringField;
    TSujetosProveedorDOMICILIO: TIntegerField;
    TSujetosProveedorTELEFONOS: TIntegerField;
    TSujetosProveedorCONTACTOS: TIntegerField;
    TSujetosProveedorFECHA_ALTA: TDateTimeField;
    TSujetosProveedorFACTURAR_A: TIBStringField;
    TSujetosProveedorE_MAIL: TIBStringField;
    TSujetosProveedorWWWW: TIBStringField;
    TSujetosProveedorOBSERVACIONES: TBlobField;
    TSujetosProveedorSEXO: TIBStringField;
    TSujetosProveedorFOTO: TBlobField;
    TFiltroCXCID: TIntegerField;
    TFiltroCXCREFERENCIA: TIBStringField;
    TFiltroCXCNUMERO_DE_DOCUMENTOS: TIntegerField;
    TFiltroCXCDOCUMENTO: TIntegerField;
    TFiltroCXCCLIENTE: TIntegerField;
    TFiltroCXCPUNTO_DE_VENTA_REF_PAGO: TIntegerField;
    TFiltroCXCFECHA: TDateTimeField;
    TFiltroCXCFECHA_VENCIMIENTO: TDateTimeField;
    TFiltroCXCALMACEN: TIntegerField;
    TFiltroCXCIMPORTE_INICIAL: TFloatField;
    TFiltroCXCSALDO_ACTUAL: TFloatField;
    TFiltroCXCFINANCIAMIENTO: TFloatField;
    TFiltroCXCGASTOS: TFloatField;
    TFiltroCXCETAPA_COBRANZA: TIntegerField;
    TFiltroCXCMORATORIOS: TFloatField;
    TFiltroCXCOTROS: TFloatField;
    TFiltroCXCFECHA_ULM_ACT: TDateTimeField;
    TFiltroCXCEXTENSION: TIntegerField;
    TFiltroCXCSEL: TIBStringField;
    TFiltroCXCESTATUS: TIBStringField;
    TFiltroCXCID_REFERENCIA: TIntegerField;
    TFiltroCXCTABLA_REFERENCIA: TIBStringField;
    TFiltroCXCPAGO_MODIFICADO: TFloatField;
    TFiltroCXPID: TIntegerField;
    TFiltroCXPFECHA_ALTA: TDateTimeField;
    TFiltroCXPPROVEEDOR: TIntegerField;
    TFiltroCXPCONDICION_COMERCIAL: TIntegerField;
    TFiltroCXPNOTA_ENTRADA: TIntegerField;
    TFiltroCXPFECHA_VENCIMIENTO: TDateTimeField;
    TFiltroCXPSUBTOTAL: TFloatField;
    TFiltroCXPIVA: TFloatField;
    TFiltroCXPIEPS: TFloatField;
    TFiltroCXPIMPUESTO1: TFloatField;
    TFiltroCXPIMPUESTO2: TFloatField;
    TFiltroCXPDESCUENTOS: TFloatField;
    TFiltroCXPTOTAL: TFloatField;
    TFiltroCXPSALDO_ACTUAL: TFloatField;
    TFiltroCXPESTATUS: TIBStringField;
    TFiltroCXPREFERENCIA: TIBStringField;
    TFiltroCXPNUMERO_DE_DOCUMENTOS: TIntegerField;
    TFiltroCXPDOCUMENTO: TIntegerField;
    TFiltroCXPID_REFERENCIA: TIntegerField;
    TFiltroCXPTABLA_REFERENCIA: TIBStringField;
    TFiltroCXPSEL: TIBStringField;
    TFiltroCXPPAGO_MODIFICADO: TFloatField;
    TFiltroUsuariosNIVEL: TIntegerField;
    TFiltroEmpresa: TIBTable;
    TFiltroEmpresaID: TIntegerField;
    TFiltroEmpresaSUJETO: TIntegerField;
    TFiltroEmpresaID_INFORMAR: TIntegerField;
    TFiltroEmpresaESTATUS: TIBStringField;
    TFiltroEmpresaTILEMODE: TIBStringField;
    TSujetosEmpresa: TIBTable;
    dsFiltroEmpresa: TDataSource;
    TSujetosEmpresaID: TIntegerField;
    TSujetosEmpresaCLAVE: TIBStringField;
    TSujetosEmpresaNOMBRE: TIBStringField;
    TSujetosEmpresaRAZON_SOCIAL: TIBStringField;
    TSujetosEmpresaRFC: TIBStringField;
    TSujetosEmpresaCURP: TIBStringField;
    TSujetosEmpresaDOMICILIO: TIntegerField;
    TSujetosEmpresaTELEFONOS: TIntegerField;
    TSujetosEmpresaCONTACTOS: TIntegerField;
    TSujetosEmpresaFECHA_ALTA: TDateTimeField;
    TSujetosEmpresaFACTURAR_A: TIBStringField;
    TSujetosEmpresaE_MAIL: TIBStringField;
    TSujetosEmpresaWWWW: TIBStringField;
    TSujetosEmpresaOBSERVACIONES: TBlobField;
    TSujetosEmpresaSEXO: TIBStringField;
    TSujetosEmpresaFOTO: TBlobField;
    dsSujetosEmpresa: TDataSource;
    TFiltroCondicionesComercialesPAGOS: TIBStringField;
    TFiltroCondicionesComercialesREQUIERE_REFERENCIA: TIBStringField;
    TFiltroCondicionesComercialesREQUIERE_FECHA: TIBStringField;
    TFiltroCondicionesComercialesREQUIERE_BANCO: TIBStringField;
    TFiltroNEntrada: TIBTable;
    TFiltroNEntradaID: TIntegerField;
    TFiltroNEntradaCLAVE: TIBStringField;
    TFiltroNEntradaFACTURA_PROVEEDOR: TIBStringField;
    TFiltroNEntradaORDEN_COMPRA: TIntegerField;
    TFiltroNEntradaDESEMPAQUE: TIntegerField;
    TFiltroNEntradaFECHA_ALTA: TDateTimeField;
    TFiltroNEntradaALMACEN: TIntegerField;
    TFiltroNEntradaTOTAL: TFloatField;
    TFiltroNEntradaIVA: TFloatField;
    TFiltroNEntradaIEPS: TFloatField;
    TFiltroNEntradaIMPUESTO1: TFloatField;
    TFiltroNEntradaIMPUESTO2: TFloatField;
    TFiltroNEntradaMONEDA: TIntegerField;
    TFiltroNEntradaESTATUS: TIBStringField;
    TFiltroNEntradaSUBTOTAL: TFloatField;
    TFiltroNEntradaGRANTOTAL: TFloatField;
    TFiltroNEntradaDESCUENTO_GLOBAL: TFloatField;
    TFiltroNEntradaDESCUENTO_PARCIAL: TFloatField;
    TFiltroNEntradaRETENCION: TFloatField;
    TFiltroNEntradaBONIFICACION_XTRA: TFloatField;
    TFiltroNEntradaID_REFERENCIA: TIntegerField;
    TFiltroNEntradaTABLA_REFERENCIA: TIBStringField;
    TFiltroNEntradaDESCUENTO_XTRA: TFloatField;
    TFiltroNEntradaPROVEEDOR: TIntegerField;
    TFiltroNEntradaOBSERVACIONES: TBlobField;
    TFiltroNEntradaCONSECUTIVO: TIntegerField;
    TFiltroNEntradaCONDICION_COMERCIAL: TIntegerField;
    TSujetosClienteTEL_PRINCIPAL: TIBStringField;
    TFiltroLineas: TIBTable;
    TFiltroLineasID: TIntegerField;
    TFiltroLineasLINK: TIntegerField;
    TFiltroLineasDESCRIPCION: TIBStringField;
    TFiltroLineasESTATUS: TIBStringField;
    TFiltroLineasORDEN: TIntegerField;
    TFiltroLineasMEDIDA: TIntegerField;
    TFiltroLineasGRUPO_COLORES: TIntegerField;
    TFiltroProveedoresTIPO_NACIONALIDAD: TIBStringField;
    TSujetosProveedorTEL_PRINCIPAL: TIBStringField;
    TFiltroRemitentes: TIBTable;
    dsFiltroRemitentes: TDataSource;
    TSujetosRemitentes: TIBTable;
    IntegerField8: TIntegerField;
    IBStringField7: TIBStringField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    DateTimeField5: TDateTimeField;
    IBStringField12: TIBStringField;
    IBStringField13: TIBStringField;
    IBStringField14: TIBStringField;
    BlobField1: TBlobField;
    IBStringField15: TIBStringField;
    BlobField2: TBlobField;
    IBStringField16: TIBStringField;
    dsFiltroAlmacenes: TDataSource;
    spFECHA_SERVIDOR_SH: TIBStoredProc;
    TFiltroCajas2: TIBTable;
    dsFiltroCajas2: TDataSource;
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
    qyAlmacenesSERIE_NC: TIBStringField;
    qyAlmacenesSERIE_NVENTA: TIBStringField;
    qyAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    qyMonedas: TIBQuery;
    dsMonedas: TDataSource;
    qyMonedasID: TIntegerField;
    qyMonedasCLAVE: TIBStringField;
    qyMonedasDESCRIPCION: TIBStringField;
    qyMonedasFECHA_ULT_ACT: TDateTimeField;
    qyMonedasPARIDAD: TFloatField;
    qyEspecialidades: TIBQuery;
    dsEspecialidades: TDataSource;
    qyEspecialidadesID: TIntegerField;
    qyEspecialidadesNOMBRE: TIBStringField;
    qyCComerciales: TIBQuery;
    dsCComerciales: TDataSource;
    qyCComercialesID: TIntegerField;
    qyCComercialesTIPO: TIBStringField;
    qyCComercialesCLAVE: TIBStringField;
    qyCComercialesNOMBRE: TIBStringField;
    qyCComercialesNUM_PAGOS: TIntegerField;
    qyCComercialesINTERVALO_ENTRE_PAGOS: TIntegerField;
    qyCComercialesDESPLAZAMIENTO_1_PAGO: TIntegerField;
    qyCComercialesDESCUENTO_PORCENTAJE: TFloatField;
    qyCComercialesFINANCIAMIENTO: TIntegerField;
    qyCComercialesMORATORIO: TIBStringField;
    qyCComercialesPUNTO_DE_VENTA: TIBStringField;
    qyCComercialesREQUIERE_AUTORIZACION: TIBStringField;
    qyCComercialesREQUIERE_FOLIO: TIBStringField;
    qyCComercialesPAGOS: TIBStringField;
    qyCComercialesREQUIERE_REFERENCIA: TIBStringField;
    qyCComercialesREQUIERE_FECHA: TIBStringField;
    qyCComercialesREQUIERE_BANCO: TIBStringField;
    qyCComercialesPAGOS_CXP: TIBStringField;
    qyCComercialesPLANES_DE_PAGO: TIBStringField;
    qyCComercialesACTIVAR_ALMACEN: TIBStringField;
    qyFiltroBancos: TIBQuery;
    qyFiltroBancosID: TIntegerField;
    qyFiltroBancosCLAVE: TIBStringField;
    qyFiltroBancosNOMBRE: TIBStringField;
    TFiltroAlmacenesID: TIntegerField;
    TFiltroAlmacenesCLAVE: TIBStringField;
    TFiltroAlmacenesNOMBRE: TIBStringField;
    TFiltroAlmacenesCOMPRA: TIBStringField;
    TFiltroAlmacenesVENDE: TIBStringField;
    TFiltroAlmacenesTRANSFORMA: TIBStringField;
    TFiltroAlmacenesFECHA_ALTA: TDateTimeField;
    TFiltroAlmacenesRESPONSABLE: TIntegerField;
    TFiltroAlmacenesOBSERVACIONES: TBlobField;
    TFiltroAlmacenesSERIE_FACTURA: TIBStringField;
    TFiltroAlmacenesCONSECUTIVO: TIntegerField;
    TFiltroAlmacenesFECHA_ULT_INV: TDateTimeField;
    TFiltroAlmacenesESTATUS: TIBStringField;
    TFiltroAlmacenesSERIE_NC: TIBStringField;
    TFiltroAlmacenesSERIE_NVENTA: TIBStringField;
    TFiltroAlmacenesSERIE_NCARGO: TIBStringField;
    TPImpresos: TIBTable;
    TPImpresosID: TIntegerField;
    TPImpresosLINK: TIntegerField;
    TPImpresosDESCRIPCION: TIBStringField;
    TPImpresosORDEN: TIntegerField;
    TPImpresosMATERIAL: TIntegerField;
    TPImpresosFACTOR: TFloatField;
    TPImpresosRELACION: TIntegerField;
    TPImpresosESTATUS: TIBStringField;
    qyUnidades: TIBQuery;
    dsUnidades: TDataSource;
    qyUnidadesID: TIntegerField;
    qyUnidadesCLAVE: TIBStringField;
    qyUnidadesDESCRIPCION: TIBStringField;
    qyTransportistas: TIBQuery;
    dsTransportistas: TDataSource;
    qyTransportistasID: TIntegerField;
    qyTransportistasNOMBRE: TIBStringField;
    TSujetosClienteCUENTA: TIntegerField;
    TDomicilioCliente: TIBTable;
    dsSujetosCliente: TDataSource;
    TFiltroOrdenesDeComprasOBSERVACIONES: TBlobField;
    TFiltroOrdenesDeComprasCONSECUTIVO: TIntegerField;
    TFiltroUsuariosPSECRETA: TIBStringField;
    TFiltroClientesCREDITO_DISPONIBLE: TFloatField;
    TFiltroClientesDESCUENTO_PORC: TFloatField;
    TFiltroClientesDP_PORC: TFloatField;
    TFiltroUsuariosAutorizacionPSECRETA: TIBStringField;
    TFiltroUsuariosALMACEN: TIntegerField;
    TSujetosCUENTA: TIntegerField;
    TSujetosTEL_PRINCIPAL: TIBStringField;
    TFiltroTelefonosTipos: TIBTable;
    TFiltroTelefonosTiposID: TIntegerField;
    TFiltroTelefonosTiposTIPO: TIBStringField;
    procedure TFiltroBancosBeforeOpen(DataSet: TDataSet);
    procedure TFiltroClientesBeforeOpen(DataSet: TDataSet);
    procedure TFiltroSujetosBeforeOpen(DataSet: TDataSet);
    procedure TFiltroSujetosPBeforeOpen(DataSet: TDataSet);
    procedure TFiltroProveedoresBeforeOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure TFiltroEmpresaBeforeOpen(DataSet: TDataSet);
    procedure TFiltroUsuariosAfterOpen(DataSet: TDataSet);
    procedure TFiltroRemitentesBeforeOpen(DataSet: TDataSet);
    procedure TSujetosClienteBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmIBData: TdmIBData;
  
implementation

uses reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TdmIBData.TFiltroBancosBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetosBanco);
end;

procedure TdmIBData.TFiltroClientesBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetosCliente);
end;

procedure TdmIBData.TFiltroSujetosBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TFiltroSujetosClientes);
end;

procedure TdmIBData.TFiltroSujetosPBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TFiltroSujetosProveedores);
end;

procedure TdmIBData.TFiltroProveedoresBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetosProveedor);
end;

procedure TdmIBData.DataModuleCreate(Sender: TObject);
begin
   reglas := TReglas.Create;
end;

procedure TdmIBData.DataModuleDestroy(Sender: TObject);
begin
   reglas.Free;
end;

procedure TdmIBData.TFiltroEmpresaBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetosEmpresa);
end;

procedure TdmIBData.TFiltroUsuariosAfterOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetos);
end;

procedure TdmIBData.TFiltroRemitentesBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TSujetosRemitentes);
end;

procedure TdmIBData.TSujetosClienteBeforeOpen(DataSet: TDataSet);
begin
   reglas.abrir_IBTabla(TDomicilioCliente);
end;

end.
