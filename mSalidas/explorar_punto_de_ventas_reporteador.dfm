inherited frmExplorar_punto_de_ventas_rep: TfrmExplorar_punto_de_ventas_rep
  Left = 307
  Top = 329
  ActiveControl = nil
  Caption = 'Explorar Punto de Ventas (Reporteador)'
  ClientHeight = 563
  ClientWidth = 965
  ExplicitWidth = 981
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 965
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 965
      ExplicitWidth = 124
    end
    inherited ibImprimir: TBitBtn
      Left = 655
      Visible = False
      ExplicitLeft = 655
    end
    inherited ibPantalla: TBitBtn
      Left = 577
      Visible = False
      ExplicitLeft = 577
    end
    inherited ibExportarXLS: TBitBtn
      Left = 157
      ExplicitLeft = 157
    end
    inherited ibExportarHTML: TBitBtn
      Left = 234
      ExplicitLeft = 234
    end
    inherited ibExportarXML: TBitBtn
      Left = 311
      ExplicitLeft = 311
    end
  end
  inherited Panel2: TPanel
    Top = 541
    Width = 965
    ExplicitTop = 340
    ExplicitWidth = 124
  end
  inherited dgExplorar: TcxGrid
    Width = 965
    Height = 452
    ExplicitWidth = 124
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FOLIO_DE_VENTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FOLIO_DE_VENTA'
      end
      object dgExplorarDBTableView1R_SUBTOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_SUBTOTAL'
      end
      object dgExplorarDBTableView1R_IVA: TcxGridDBColumn
        DataBinding.FieldName = 'R_IVA'
      end
      object dgExplorarDBTableView1R_IEPS: TcxGridDBColumn
        DataBinding.FieldName = 'R_IEPS'
      end
      object dgExplorarDBTableView1R_IMPUESTO1: TcxGridDBColumn
        DataBinding.FieldName = 'R_IMPUESTO1'
      end
      object dgExplorarDBTableView1R_IMPUESTO2: TcxGridDBColumn
        DataBinding.FieldName = 'R_IMPUESTO2'
      end
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
      end
      object dgExplorarDBTableView1R_DESCUENTO_GLOBAL_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCUENTO_GLOBAL_PORC'
      end
      object dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_GLOBAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCUENTO_CANTIDAD_GLOBAL'
      end
      object dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_PARCIAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCUENTO_CANTIDAD_PARCIAL'
      end
      object dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_GRANTOTAL'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_CONDICION_COMERCIAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONDICION_COMERCIAL'
      end
      object dgExplorarDBTableView1R_CAMBIO_ENTREGADO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAMBIO_ENTREGADO'
      end
      object dgExplorarDBTableView1R_TOTAL_REF_PAGOS: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL_REF_PAGOS'
      end
      object dgExplorarDBTableView1R_SALDO: TcxGridDBColumn
        DataBinding.FieldName = 'R_SALDO'
      end
      object dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLIENTE'
      end
      object dgExplorarDBTableView1R_NOMBRE_CLIENTE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE_CLIENTE'
      end
      object dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn
        DataBinding.FieldName = 'R_EXTENSION'
      end
      object dgExplorarDBTableView1R_NOMBRE_EXTENSION: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE_EXTENSION'
      end
      object dgExplorarDBTableView1R_MONEDA: TcxGridDBColumn
        DataBinding.FieldName = 'R_MONEDA'
      end
      object dgExplorarDBTableView1R_FOLIO_HISTORICO: TcxGridDBColumn
        DataBinding.FieldName = 'R_FOLIO_HISTORICO'
      end
      object dgExplorarDBTableView1R_LIMITE_CREDITO: TcxGridDBColumn
        DataBinding.FieldName = 'R_LIMITE_CREDITO'
      end
      object dgExplorarDBTableView1R_LIMITE_DISPONIBLE: TcxGridDBColumn
        DataBinding.FieldName = 'R_LIMITE_DISPONIBLE'
      end
      object dgExplorarDBTableView1R_CAJA: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJA'
      end
      object dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJA_NOMBRE'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_CAJERO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJERO'
      end
      object dgExplorarDBTableView1R_CAJERO_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJERO_NOMBRE'
      end
      object dgExplorarDBTableView1R_DV_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_ID'
      end
      object dgExplorarDBTableView1R_DV_PUNTO_DE_VENTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_PUNTO_DE_VENTA'
      end
      object dgExplorarDBTableView1R_DV_MATERIAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_MATERIAL'
      end
      object dgExplorarDBTableView1R_DV_MATERIAL_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_MATERIAL_CLAVE'
      end
      object dgExplorarDBTableView1R_DV_MATERIAL_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_MATERIAL_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_DV_CANTIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_CANTIDAD'
      end
      object dgExplorarDBTableView1R_DV_UNIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_UNIDAD'
      end
      object dgExplorarDBTableView1R_DV_UNIDAD_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_UNIDAD_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_DV_PRECIO_VENTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_PRECIO_VENTA'
      end
      object dgExplorarDBTableView1R_DV_COSTO_COMPRA: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_COSTO_COMPRA'
      end
      object dgExplorarDBTableView1R_DV_VENDEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_VENDEDOR'
      end
      object dgExplorarDBTableView1R_DV_VENDEDOR_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_VENDEDOR_NOMBRE'
      end
      object dgExplorarDBTableView1R_DV_DESCUENTO_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_DESCUENTO_PORC'
      end
      object dgExplorarDBTableView1R_DV_SUBTOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_SUBTOTAL'
      end
      object dgExplorarDBTableView1R_DV_IVA: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IVA'
      end
      object dgExplorarDBTableView1R_DV_IEPS: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IEPS'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO1: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO1'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO2: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO2'
      end
      object dgExplorarDBTableView1R_DV_IVA_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IVA_PORC'
      end
      object dgExplorarDBTableView1R_DV_IEPS_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IEPS_PORC'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO1_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO1_PORC'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO2_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO2_PORC'
      end
      object dgExplorarDBTableView1R_DV_IVA_DP: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IVA_DP'
      end
      object dgExplorarDBTableView1R_DV_IEPS_DP: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IEPS_DP'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO1_DP: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO1_DP'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO2_DP: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO2_DP'
      end
      object dgExplorarDBTableView1R_DV_SUBTOTAL_DP: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_SUBTOTAL_DP'
      end
      object dgExplorarDBTableView1R_DV_IVA_DG: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IVA_DG'
      end
      object dgExplorarDBTableView1R_DV_IEPS_DG: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IEPS_DG'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO1_DG: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO1_DG'
      end
      object dgExplorarDBTableView1R_DV_IMPUESTO2_DG: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_IMPUESTO2_DG'
      end
      object dgExplorarDBTableView1R_DV_SUBTOTAL_DG: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_SUBTOTAL_DG'
      end
      object dgExplorarDBTableView1R_DV_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_DV_ESTATUS'
      end
      object dgExplorarDBTableView1R_C_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_ID'
      end
      object dgExplorarDBTableView1R_C_FOLIO_DE_VENTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_FOLIO_DE_VENTA'
      end
      object dgExplorarDBTableView1R_C_FOLIO_DE_VENTA_DETALLE: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_FOLIO_DE_VENTA_DETALLE'
      end
      object dgExplorarDBTableView1R_C_CAJAS: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_CAJAS'
      end
      object dgExplorarDBTableView1R_C_COBRO: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_COBRO'
      end
      object dgExplorarDBTableView1R_C_NUM_CAJAS: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_NUM_CAJAS'
      end
      object dgExplorarDBTableView1R_C_TIPO_CAJA: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_TIPO_CAJA'
      end
      object dgExplorarDBTableView1R_C_TIPO_CAJA_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_TIPO_CAJA_CLAVE'
      end
      object dgExplorarDBTableView1R_C_TIPO_CAJA_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_TIPO_CAJA_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_C_PRECIO: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_PRECIO'
      end
      object dgExplorarDBTableView1R_C_CALIDADES: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_CALIDADES'
      end
      object dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN'
      end
      object dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_CLAVE'
      end
      object dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_NOMBRE'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 965
    Visible = False
    ExplicitWidth = 124
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT *'
      
        'FROM REPORTEADOR_PUNTO_DE_VENTAS(:P_POSICION, :P_REGISTRO, :P_RE' +
        'GISTROS, :P_A_DONDE)')
    ParamData = <
      item
        DataType = ftString
        Name = 'P_POSICION'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_REGISTRO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_REGISTROS'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_A_DONDE'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_FOLIO_DE_VENTA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_DE_VENTA'
      ReadOnly = True
    end
    object qyExplorarR_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUBTOTAL'
      ReadOnly = True
    end
    object qyExplorarR_IVA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IVA'
      ReadOnly = True
    end
    object qyExplorarR_IEPS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IEPS'
      ReadOnly = True
    end
    object qyExplorarR_IMPUESTO1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO1'
      ReadOnly = True
    end
    object qyExplorarR_IMPUESTO2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO2'
      ReadOnly = True
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL'
      ReadOnly = True
    end
    object qyExplorarR_DESCUENTO_GLOBAL_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_GLOBAL_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_CANTIDAD_GLOBAL'
      ReadOnly = True
    end
    object qyExplorarR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_CANTIDAD_PARCIAL'
      ReadOnly = True
    end
    object qyExplorarR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyExplorarR_CONDICION_COMERCIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONDICION_COMERCIAL'
      ReadOnly = True
    end
    object qyExplorarR_CAMBIO_ENTREGADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAMBIO_ENTREGADO'
      ReadOnly = True
    end
    object qyExplorarR_TOTAL_REF_PAGOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL_REF_PAGOS'
      ReadOnly = True
    end
    object qyExplorarR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
    end
    object qyExplorarR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyExplorarR_NOMBRE_CLIENTE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE_CLIENTE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyExplorarR_NOMBRE_EXTENSION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE_EXTENSION'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyExplorarR_FOLIO_HISTORICO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_HISTORICO'
      ReadOnly = True
    end
    object qyExplorarR_LIMITE_CREDITO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_LIMITE_CREDITO'
      ReadOnly = True
    end
    object qyExplorarR_LIMITE_DISPONIBLE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_LIMITE_DISPONIBLE'
      ReadOnly = True
    end
    object qyExplorarR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyExplorarR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyExplorarR_CAJERO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO'
      ReadOnly = True
    end
    object qyExplorarR_CAJERO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_DV_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_ID'
      ReadOnly = True
    end
    object qyExplorarR_DV_PUNTO_DE_VENTA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_PUNTO_DE_VENTA'
      ReadOnly = True
    end
    object qyExplorarR_DV_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_MATERIAL'
      ReadOnly = True
    end
    object qyExplorarR_DV_MATERIAL_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_MATERIAL_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_DV_MATERIAL_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_MATERIAL_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_DV_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_CANTIDAD'
      ReadOnly = True
    end
    object qyExplorarR_DV_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_UNIDAD'
      ReadOnly = True
    end
    object qyExplorarR_DV_UNIDAD_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_UNIDAD_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyExplorarR_DV_PRECIO_VENTA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_PRECIO_VENTA'
      ReadOnly = True
    end
    object qyExplorarR_DV_COSTO_COMPRA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_COSTO_COMPRA'
      ReadOnly = True
    end
    object qyExplorarR_DV_VENDEDOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_VENDEDOR'
      ReadOnly = True
    end
    object qyExplorarR_DV_VENDEDOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_VENDEDOR_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_DV_DESCUENTO_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_DESCUENTO_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DV_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_SUBTOTAL'
      ReadOnly = True
    end
    object qyExplorarR_DV_IVA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IVA'
      ReadOnly = True
    end
    object qyExplorarR_DV_IEPS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IEPS'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO1'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO2'
      ReadOnly = True
    end
    object qyExplorarR_DV_IVA_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IVA_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DV_IEPS_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IEPS_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO1_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO1_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO2_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO2_PORC'
      ReadOnly = True
    end
    object qyExplorarR_DV_IVA_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IVA_DP'
      ReadOnly = True
    end
    object qyExplorarR_DV_IEPS_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IEPS_DP'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO1_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO1_DP'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO2_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO2_DP'
      ReadOnly = True
    end
    object qyExplorarR_DV_SUBTOTAL_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_SUBTOTAL_DP'
      ReadOnly = True
    end
    object qyExplorarR_DV_IVA_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IVA_DG'
      ReadOnly = True
    end
    object qyExplorarR_DV_IEPS_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IEPS_DG'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO1_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO1_DG'
      ReadOnly = True
    end
    object qyExplorarR_DV_IMPUESTO2_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_IMPUESTO2_DG'
      ReadOnly = True
    end
    object qyExplorarR_DV_SUBTOTAL_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_SUBTOTAL_DG'
      ReadOnly = True
    end
    object qyExplorarR_DV_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DV_ESTATUS'
      ReadOnly = True
    end
    object qyExplorarR_C_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_ID'
      ReadOnly = True
    end
    object qyExplorarR_C_FOLIO_DE_VENTA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_FOLIO_DE_VENTA'
      ReadOnly = True
    end
    object qyExplorarR_C_FOLIO_DE_VENTA_DETALLE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_FOLIO_DE_VENTA_DETALLE'
      ReadOnly = True
    end
    object qyExplorarR_C_CAJAS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_CAJAS'
      ReadOnly = True
      Size = 2
    end
    object qyExplorarR_C_COBRO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_COBRO'
      ReadOnly = True
      Size = 2
    end
    object qyExplorarR_C_NUM_CAJAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_NUM_CAJAS'
      ReadOnly = True
    end
    object qyExplorarR_C_TIPO_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_TIPO_CAJA'
      ReadOnly = True
    end
    object qyExplorarR_C_TIPO_CAJA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_TIPO_CAJA_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_C_TIPO_CAJA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_TIPO_CAJA_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_C_PRECIO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_PRECIO'
      ReadOnly = True
    end
    object qyExplorarR_C_CALIDADES: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_C_CALIDADES'
      ReadOnly = True
    end
    object qyExplorarR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyExplorarR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
  end
end
