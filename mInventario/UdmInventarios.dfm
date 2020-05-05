object dmInventarios: TdmInventarios
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 479
  Width = 741
  object qyIBXAlmacenes: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ALMACENES'
      'ORDER BY NOMBRE')
    Left = 248
    Top = 16
    object qyIBXAlmacenesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyIBXAlmacenesCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object qyIBXAlmacenesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyIBXAlmacenesCOMPRA: TIBStringField
      FieldName = 'COMPRA'
      Size = 2
    end
    object qyIBXAlmacenesVENDE: TIBStringField
      FieldName = 'VENDE'
      Size = 2
    end
    object qyIBXAlmacenesTRANSFORMA: TIBStringField
      FieldName = 'TRANSFORMA'
      Size = 2
    end
    object qyIBXAlmacenesFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
    end
    object qyIBXAlmacenesRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Required = True
    end
    object qyIBXAlmacenesOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object qyIBXAlmacenesSERIE_FACTURA: TIBStringField
      FieldName = 'SERIE_FACTURA'
      Size = 10
    end
    object qyIBXAlmacenesCONSECUTIVO: TIntegerField
      FieldName = 'CONSECUTIVO'
    end
    object qyIBXAlmacenesFECHA_ULT_INV: TDateTimeField
      FieldName = 'FECHA_ULT_INV'
    end
    object qyIBXAlmacenesESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object qyIBXAlmacenesSERIE_NC: TIBStringField
      FieldName = 'SERIE_NC'
      Size = 10
    end
    object qyIBXAlmacenesSERIE_NVENTA: TIBStringField
      FieldName = 'SERIE_NVENTA'
      Size = 10
    end
    object qyIBXAlmacenesSERIE_NCARGO: TIBStringField
      FieldName = 'SERIE_NCARGO'
      Size = 10
    end
  end
  object dsAlmacenes: TDataSource
    DataSet = qyIBXAlmacenes
    Left = 248
    Top = 115
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
    Filter = 'ID = -17'
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
    Left = 424
    Top = 16
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
  object dsPreferencias: TDataSource
    DataSet = TIBXPreferencias
    Left = 424
    Top = 107
  end
  object TIBXMonedas: TIBTable
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
        Name = 'CLAVE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FECHA_ULT_ACT'
        DataType = ftDateTime
      end
      item
        Name = 'PARIDAD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY10'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'MONEDAS'
    UniDirectional = False
    Left = 336
    Top = 16
    object TIBXMonedasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIBXMonedasCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Size = 10
    end
    object TIBXMonedasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object TIBXMonedasFECHA_ULT_ACT: TDateTimeField
      FieldName = 'FECHA_ULT_ACT'
    end
    object TIBXMonedasPARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object dsMonedas: TDataSource
    DataSet = TIBXMonedas
    Left = 336
    Top = 115
  end
  object qyIBXInventario: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT I.ID R_ID,'
      '             A.CLAVE R_ALMACEN,'
      '             A.NOMBRE R_ALMACEN_NOMBRE,'
      '             I.UBICACION,'
      '             M.CLAVE R_MATERIAL,'
      '             M.DESCRIPCION R_MATERIAL_DESCRIPCION, '
      '             L.DESCRIPCION R_LINEA,'
      '             I.CANTIDAD R_CANTIDAD,'
      '             I.LOTE R_LOTE,'
      '             I.SERIE R_SERIE,'
      '             I.NOTA_ENTRADA,'
      '             I.FECHA_COMPRA,'
      '             I.FECHA_CADUCIDAD,'
      '             I.PEDIMENTO,'
      '             I.PEDIMENTO_FECHA,'
      '             I.ADUANA,'
      '             I.NACIONAL,'
      '             I.IMPORTADO,'
      '             U.DESCRIPCION R_UNIDAD,'
      '             MO.DESCRIPCION R_MONEDA,'
      '             I.COSTO_PROMEDIO,'
      '             I.COSTO_PEPS,'
      '             I.COSTO_UEPS,'
      '             I.CONTEO1,'
      '             I.CONTEO2,'
      '             I.CONTEO3,'
      '             I.ACTIVO_FIJO R_ACTIVO_FIJO,'
      '             I.DEPRECIACION_PORC,'
      '             I.CANTIDAD_APARTADA,'
      '             ME.DESCRIPCION R_MEDIDA,'
      '             C.NOMBRE R_COLOR,'
      '             I.ESTATUS R_ESTATUS'
      'FROM (INVENTARIO I LEFT JOIN ALMACENES A ON I.ALMACEN = A.ID)'
      '           LEFT JOIN MATERIALES M ON I.MATERIAL = M.ID '
      '           LEFT JOIN UNIDADES U ON I.UNIDAD = U.ID '
      '           LEFT JOIN MONEDAS MO ON I.MONEDA = MO.ID '
      '           LEFT JOIN MEDIDAS ME ON I.MEDIDA = ME.ID'
      '           LEFT JOIN COLORES C ON I.COLOR = C.ID'
      '           LEFT JOIN LINEAS L ON M.LINEA = L.ID '
      'WHERE I.ID = 0')
    Left = 48
    Top = 8
  end
  object dsInventario: TDataSource
    Left = 48
    Top = 128
  end
  object qyLineas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM HIJOS_LINEAS(:P_LINEA)'
      '')
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_LINEA'
        ParamType = ptUnknown
      end>
    object qyLineasR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'HIJOS_LINEAS.R_ID'
    end
    object qyLineasR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'HIJOS_LINEAS.R_DESCRIPCION'
      Size = 100
    end
  end
end
