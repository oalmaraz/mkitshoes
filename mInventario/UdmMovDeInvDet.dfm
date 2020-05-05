object dmMovimientosDeInventarioDet: TdmMovimientosDeInventarioDet
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object dsMovimientosDeInventarioDet: TDataSource
    DataSet = qyIBXMovimientosDeInventarioDet
    Left = 80
    Top = 128
  end
  object spIBXInsert: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'INSERT_MOV_INV_DETALLE'
    Left = 312
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_MOVIMIENTOS_DE_INVENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MATERIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ID_INVENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PROVEEDOR_CONSOLIDADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_ESTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CAJAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PEDIDO_DETALLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FACTURA_DETALLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_DEVOLUCIONES_CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_DEVOLUCIONES_CAJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MEDIDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_COLOR'
        ParamType = ptInput
      end>
  end
  object spIBXUpdate: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'UPDATE_MOV_INV_DETALLE'
    Left = 224
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MATERIAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_COSTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_UNIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_LOTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_SERIE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ID_INVENTARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PROVEEDOR_CONSOLIDADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_ESTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CAJAS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PEDIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_PEDIDO_DETALLE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FACTURA_DETALLE'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_DEVOLUCIONES_CANTIDAD'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_DEVOLUCIONES_CAJA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MEDIDA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_COLOR'
        ParamType = ptInput
      end>
  end
  object qyIBXMovimientosDeInventarioDet: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MOVIMIENTOS_INVENTARIO_PARTIDAS(:P_MOVIMIENTO)')
    Left = 80
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_MOVIMIENTO'
        ParamType = ptUnknown
      end>
    object qyIBXMovimientosDeInventarioDetR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MOVIMIENTOS_DE_INVENTARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MOVIMIENTOS_DE_INVENTARIO'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MATERIAL_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_CLAVE'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MATERIAL_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyIBXMovimientosDeInventarioDetR_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CANTIDAD'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_COSTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_COSTO'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_UNIDAD_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyIBXMovimientosDeInventarioDetR_UNIDAD_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_LOTE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_LOTE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_SERIE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SERIE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_ID_INVENTARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID_INVENTARIO'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_PROVEEDOR_CONSOLIDADO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_CONSOLIDADO'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_PROVEEDOR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_PROVEEDOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyIBXMovimientosDeInventarioDetR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_CAJAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJAS'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_PEDIDO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PEDIDO'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_PEDIDO_DETALLE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PEDIDO_DETALLE'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_FACTURA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FACTURA'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_FACTURA_DETALLE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FACTURA_DETALLE'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_DEVOLUCIONES_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DEVOLUCIONES_CANTIDAD'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_DEVOLUCIONES_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DEVOLUCIONES_CAJA'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_MONEDA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyIBXMovimientosDeInventarioDetR_MONEDA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyIBXMovimientosDeInventarioDetR_MEDIDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MEDIDA'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_MEDIDA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MEDIDA_DESCRIPCION'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_COLOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_COLOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR_NOMBRE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXMovimientosDeInventarioDetR_ROWS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ROWS'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_ERROR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ERROR'
      ReadOnly = True
      Size = 2
    end
    object qyIBXMovimientosDeInventarioDetR_ID_ERROR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID_ERROR'
      ReadOnly = True
    end
    object qyIBXMovimientosDeInventarioDetR_SUJETO_NOMBRE: TIBStringField
      FieldName = 'R_SUJETO_NOMBRE'
      Origin = 'MOVIMIENTOS_INVENTARIO_PARTIDAS.R_SUJETO_NOMBRE'
      Size = 100
    end
    object qyIBXMovimientosDeInventarioDetR_CODIGO_BARRAS: TIBStringField
      FieldName = 'R_CODIGO_BARRAS'
      Origin = 'MOVIMIENTOS_INVENTARIO_PARTIDAS.R_CODIGO_BARRAS'
    end
    object qyIBXMovimientosDeInventarioDetR_NUM_ETIQUETAS: TIntegerField
      FieldName = 'R_NUM_ETIQUETAS'
      Origin = 'MOVIMIENTOS_INVENTARIO_PARTIDAS.R_NUM_ETIQUETAS'
    end
    object qyIBXMovimientosDeInventarioDetR_MATERIAL_ESTATUS: TIBStringField
      FieldName = 'R_MATERIAL_ESTATUS'
      Origin = 'MOVIMIENTOS_INVENTARIO_PARTIDAS.R_MATERIAL_ESTATUS'
    end
    object qyIBXMovimientosDeInventarioDetR_ETIQUETAS: TIntegerField
      FieldName = 'R_ETIQUETAS'
      Origin = 'MOVIMIENTOS_INVENTARIO_PARTIDAS.R_ETIQUETAS'
    end
  end
  object dsMateriales: TDataSource
    DataSet = qyIBXMateriales
    Left = 392
    Top = 128
  end
  object qyIBXMateriales: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    AfterOpen = qyIBXMaterialesAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MATERIALES'
      'ORDER BY CLAVE')
    Left = 392
    Top = 16
    object qyIBXMaterialesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyIBXMaterialesCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object qyIBXMaterialesDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object qyIBXMaterialesUNIDAD_BASE: TIntegerField
      FieldName = 'UNIDAD_BASE'
    end
    object qyIBXMaterialesLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object qyIBXMaterialesUNIDADES_COMPRADAS: TFloatField
      FieldName = 'UNIDADES_COMPRADAS'
    end
    object qyIBXMaterialesUNIDADES_VENDIDAS: TFloatField
      FieldName = 'UNIDADES_VENDIDAS'
    end
    object qyIBXMaterialesUNIDADES_PRODUCIDAS: TFloatField
      FieldName = 'UNIDADES_PRODUCIDAS'
    end
    object qyIBXMaterialesLARGO: TFloatField
      FieldName = 'LARGO'
    end
    object qyIBXMaterialesANCHO: TFloatField
      FieldName = 'ANCHO'
    end
    object qyIBXMaterialesALTO: TFloatField
      FieldName = 'ALTO'
    end
    object qyIBXMaterialesUNIDAD_LAA: TIntegerField
      FieldName = 'UNIDAD_LAA'
    end
    object qyIBXMaterialesLOTE: TIBStringField
      FieldName = 'LOTE'
      Size = 2
    end
    object qyIBXMaterialesNUM_SERIE: TIBStringField
      FieldName = 'NUM_SERIE'
      Size = 2
    end
    object qyIBXMaterialesCONSOLIDADO: TIBStringField
      FieldName = 'CONSOLIDADO'
      Size = 2
    end
    object qyIBXMaterialesCOSTO_PROMEDIO: TIBStringField
      FieldName = 'COSTO_PROMEDIO'
      Size = 2
    end
    object qyIBXMaterialesCOSTO_PEPS: TIBStringField
      FieldName = 'COSTO_PEPS'
      Size = 2
    end
    object qyIBXMaterialesCOSTO_UEPS: TIBStringField
      FieldName = 'COSTO_UEPS'
      Size = 2
    end
    object qyIBXMaterialesFECHA_CERO_EXIST: TDateTimeField
      FieldName = 'FECHA_CERO_EXIST'
    end
    object qyIBXMaterialesFECHA_ULTIMA_COMPRA: TDateTimeField
      FieldName = 'FECHA_ULTIMA_COMPRA'
    end
    object qyIBXMaterialesCODIGO_BARRAS: TIBStringField
      FieldName = 'CODIGO_BARRAS'
    end
    object qyIBXMaterialesIVA_PORC: TFloatField
      FieldName = 'IVA_PORC'
    end
    object qyIBXMaterialesIEPS_PORC: TFloatField
      FieldName = 'IEPS_PORC'
    end
    object qyIBXMaterialesIMPUESTO_1_PORC: TFloatField
      FieldName = 'IMPUESTO_1_PORC'
    end
    object qyIBXMaterialesIMPUESTO_2_PORC: TFloatField
      FieldName = 'IMPUESTO_2_PORC'
    end
    object qyIBXMaterialesOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object qyIBXMaterialesFOTO: TBlobField
      FieldName = 'FOTO'
      Size = 8
    end
    object qyIBXMaterialesDIAS_DE_VIGENCIA: TIntegerField
      FieldName = 'DIAS_DE_VIGENCIA'
    end
    object qyIBXMaterialesCOSTO_ULT_COMPRA: TFloatField
      FieldName = 'COSTO_ULT_COMPRA'
    end
    object qyIBXMaterialesNUM_ETIQUETAS: TIntegerField
      FieldName = 'NUM_ETIQUETAS'
    end
    object qyIBXMaterialesACTIVO_FIJO: TIBStringField
      FieldName = 'ACTIVO_FIJO'
      Size = 2
    end
    object qyIBXMaterialesCALIDAD: TIntegerField
      FieldName = 'CALIDAD'
    end
  end
  object qyIBXUnidades: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsMateriales
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_UNIDADES_MATERIAL(:ID)')
    Left = 480
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qyIBXUnidadesR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXUnidadesR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyIBXUnidadesR_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD'
      ReadOnly = True
    end
    object qyIBXUnidadesR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyIBXUnidadesR_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXUnidadesR_FACTOR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_FACTOR'
      ReadOnly = True
    end
  end
  object qyIBXProveedores: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_PROVEEDORES')
    Left = 221
    Top = 184
    object qyIBXProveedoresR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXProveedoresR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXProveedoresR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyIBXProveedoresR_RAZON_SOCIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_RAZON_SOCIAL'
      ReadOnly = True
      Size = 100
    end
    object qyIBXProveedoresR_CLASIFICACION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLASIFICACION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXProveedoresR_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TELEFONO'
      ReadOnly = True
    end
  end
  object dsUnidades: TDataSource
    DataSet = qyIBXUnidades
    Left = 480
    Top = 128
  end
  object dsProveedores: TDataSource
    DataSet = qyIBXProveedores
    Left = 221
    Top = 296
  end
  object qyIBXMonedas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MONEDAS')
    Left = 320
    Top = 184
    object qyIBXMonedasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyIBXMonedasCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Size = 10
    end
    object qyIBXMonedasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object qyIBXMonedasFECHA_ULT_ACT: TDateTimeField
      FieldName = 'FECHA_ULT_ACT'
    end
    object qyIBXMonedasPARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object dsMonedas: TDataSource
    DataSet = qyIBXMonedas
    Left = 320
    Top = 296
  end
  object dsPreferencias: TDataSource
    DataSet = TIBXPreferencias
    Left = 80
    Top = 296
  end
  object TIBXPreferencias: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'VALOR'
        DataType = ftString
        Size = 20
      end>
    Filter = 'ID = 0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY110'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'PREFERENCIAS'
    UniDirectional = False
    Left = 80
    Top = 184
    object TIBXPreferenciasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIBXPreferenciasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object TIBXPreferenciasTIPO: TIBStringField
      FieldName = 'TIPO'
      Size = 14
    end
    object TIBXPreferenciasVALOR: TIBStringField
      FieldName = 'VALOR'
    end
  end
  object qyIBXEliminar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM MOVIMIENTOS_DE_INVENTARIO_DET'
      'WHERE ID = :P_ID')
    Left = 408
    Top = 184
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyIBXClientes: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES')
    Left = 480
    Top = 184
    object qyIBXClientesR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXClientesR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyIBXClientesR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyIBXClientesR_RAZON_SOCIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_RAZON_SOCIAL'
      ReadOnly = True
      Size = 100
    end
    object qyIBXClientesR_CLASIFICACION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLASIFICACION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXClientesR_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TELEFONO'
      ReadOnly = True
    end
  end
  object dsClientes: TDataSource
    DataSet = qyIBXClientes
    Left = 480
    Top = 296
  end
  object TManejo_Errores: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MENSAJE'
        DataType = ftString
        Size = 100
      end>
    Filter = 'ID = 0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY32'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'MANEJO_ERRORES'
    UniDirectional = False
    Left = 568
    Top = 184
  end
end
