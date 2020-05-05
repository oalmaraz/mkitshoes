object dmEstadoDeCuentas: TdmEstadoDeCuentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object qyEstadoDeCuentaEnc: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ESTADOS_DE_CUENTA_ENC(:P_CLIENTE, :P_ALMACEN)')
    Left = 48
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyEstadoDeCuentaEncR_SALDO_CLIENTE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_CLIENTE'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_SALDO_EXTENSION: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_EXTENSION'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_SALDO_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_TOTAL'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_TOTAL_VENCIDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL_VENCIDO'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_SALDO_ALMACEN_VENCIDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_ALMACEN_VENCIDO'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_FECHA_ULT_COMPRA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULT_COMPRA'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_FECHA_ULT_PAGO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULT_PAGO'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_LIMITE_CREDITO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_LIMITE_CREDITO'
      ReadOnly = True
    end
    object qyEstadoDeCuentaEncR_FIRMA: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_FIRMA'
      ReadOnly = True
      Size = 8
    end
    object qyEstadoDeCuentaEncR_FOTO: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOTO'
      ReadOnly = True
      Size = 8
    end
    object qyEstadoDeCuentaEncR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyEstadoDeCuentaEncR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEstadoDeCuentaEncR_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TELEFONO'
      ReadOnly = True
    end
  end
  object dsEstadoDeCuentaEnc: TDataSource
    DataSet = qyEstadoDeCuentaEnc
    Left = 48
    Top = 64
  end
  object qyIBXFechaServidor: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FECHA_SERVIDOR')
    Left = 48
    Top = 125
    object qyIBXFechaServidorR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
  end
  object dsFechaServidor: TDataSource
    DataSet = qyIBXFechaServidor
    Left = 48
    Top = 184
  end
  object qyVer_Datos_Cajero: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_DATOS_CAJERO(:P_USUARIO, "Pagos")')
    Left = 184
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qyVer_Datos_CajeroR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyVer_Datos_CajeroR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_OBSERVACIONES'
      ReadOnly = True
      Size = 8
    end
    object qyVer_Datos_CajeroR_USUARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE_USUARIO'
      ReadOnly = True
      Size = 100
    end
    object qyVer_Datos_CajeroR_BAJA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BAJA'
      ReadOnly = True
      Size = 2
    end
    object qyVer_Datos_CajeroR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_REGISTROS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_REGISTROS'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MODULO_FUNCION'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_EMPRESA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EMPRESA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyVer_Datos_CajeroR_FECHA_SERVIDOR: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_SERVIDOR'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_NIVEL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NIVEL'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
  end
  object dsVer_Datos_Cajero: TDataSource
    DataSet = qyVer_Datos_Cajero
    Left = 184
    Top = 64
  end
  object qyUsuario: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT S.NOMBRE'
      'FROM SUJETOS_USUARIOS SU, SUJETOS S'
      'WHERE (SU.ID = :P_USUARIO) AND (SU.SUJETO = S.ID)')
    Left = 296
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyUsuarioNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
  end
  object dsUsuario: TDataSource
    DataSet = qyUsuario
    Left = 296
    Top = 56
  end
  object qyPorCobrar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ESTADOS_DE_CUENTA_DET(:P_CLIENTE, :P_ALMACEN, :P_TODOS)')
    Left = 48
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_TODOS'
        ParamType = ptUnknown
        Value = 'No'
      end>
    object qyPorCobrarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyPorCobrarR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyPorCobrarR_NUMERO_DE_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NUMERO_DE_DOCUMENTOS'
      ReadOnly = True
    end
    object qyPorCobrarR_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DOCUMENTO'
      ReadOnly = True
    end
    object qyPorCobrarR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyPorCobrarR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyPorCobrarR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPorCobrarR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PUNTO_DE_VENTA_REF_PAGO'
      ReadOnly = True
    end
    object qyPorCobrarR_REF_PAGO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REF_PAGO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPorCobrarR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyPorCobrarR_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_VENCIMIENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyPorCobrarR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyPorCobrarR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPorCobrarR_IMPORTE_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPORTE_INICIAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_SALDO_ACTUAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_ACTUAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_FINANCIAMIENTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_FINANCIAMIENTO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_GASTOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GASTOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_ETAPA_COBRANZA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ETAPA_COBRANZA'
      ReadOnly = True
    end
    object qyPorCobrarR_MORATORIOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MORATORIOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_FECHA_ULM_ACT: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULM_ACT'
      ReadOnly = True
    end
    object qyPorCobrarR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyPorCobrarR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyPorCobrarR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyPorCobrarR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPorCobrarR_OTROS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_OTROS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_SEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SEL'
      ReadOnly = True
      Size = 2
    end
    object qyPorCobrarR_VENCIMIENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_VENCIMIENTOS'
      ReadOnly = True
    end
    object qyPorCobrarR_PAGO_MODIFICADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_COLOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR'
      ReadOnly = True
      Size = 6
    end
    object qyPorCobrarR_NCREDITO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_NCREDITO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_NCREDITO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyPorCobrarR_NCREDITO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyPorCobrarR_NCREDITO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyPorCobrarR_NCREDITO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyPorCobrarR_NCARGO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_NCARGO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_NCARGO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyPorCobrarR_NCARGO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyPorCobrarR_NCARGO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyPorCobrarR_NCARGO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyPorCobrarR_PAGO_MODIFICADO_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO_ACUM'
      ReadOnly = True
    end
    object qyPorCobrarR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPorCobrarR_DESC_PORC_GLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESC_PORC_GLOBAL'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object qyPorCobrarR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'ESTADOS_DE_CUENTA_DET.R_MONEDA'
    end
    object qyPorCobrarR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'ESTADOS_DE_CUENTA_DET.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyPorCobrarR_ETAPA_COBRANZA_C: TIBStringField
      FieldName = 'R_ETAPA_COBRANZA_C'
      Origin = 'ESTADOS_DE_CUENTA_DET.R_ETAPA_COBRANZA_C'
    end
  end
  object qyCobrado: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM ESTADOS_DE_CUENTA_DET_COBRADO(:P_CLIENTE, :P_ALMACEN, :P_TO' +
        'DOS)')
    Left = 144
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'P_TODOS'
        ParamType = ptUnknown
        Value = 'No'
      end>
    object qyCobradoR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyCobradoR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyCobradoR_NUMERO_DE_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NUMERO_DE_DOCUMENTOS'
      ReadOnly = True
    end
    object qyCobradoR_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DOCUMENTO'
      ReadOnly = True
    end
    object qyCobradoR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyCobradoR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyCobradoR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCobradoR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PUNTO_DE_VENTA_REF_PAGO'
      ReadOnly = True
    end
    object qyCobradoR_REF_PAGO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REF_PAGO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCobradoR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobradoR_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_VENCIMIENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyCobradoR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyCobradoR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCobradoR_IMPORTE_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPORTE_INICIAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_SALDO_ACTUAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_ACTUAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_FINANCIAMIENTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_FINANCIAMIENTO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_GASTOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GASTOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_ETAPA_COBRANZA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ETAPA_COBRANZA'
      ReadOnly = True
    end
    object qyCobradoR_MORATORIOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MORATORIOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_FECHA_ULM_ACT: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULM_ACT'
      ReadOnly = True
    end
    object qyCobradoR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyCobradoR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyCobradoR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyCobradoR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCobradoR_OTROS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_OTROS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_SEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SEL'
      ReadOnly = True
      Size = 2
    end
    object qyCobradoR_VENCIMIENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_VENCIMIENTOS'
      ReadOnly = True
    end
    object qyCobradoR_PAGO_MODIFICADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_COLOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR'
      ReadOnly = True
      Size = 6
    end
    object qyCobradoR_NCREDITO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_NCREDITO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_NCREDITO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyCobradoR_NCREDITO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyCobradoR_NCREDITO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyCobradoR_NCREDITO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyCobradoR_NCARGO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_NCARGO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_NCARGO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyCobradoR_NCARGO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyCobradoR_NCARGO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyCobradoR_NCARGO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyCobradoR_PAGO_MODIFICADO_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO_ACUM'
      ReadOnly = True
    end
    object qyCobradoR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyCobradoR_DESC_PORC_GLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESC_PORC_GLOBAL'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object qyCobradoR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'ESTADOS_DE_CUENTA_DET_COBRADO.R_MONEDA'
    end
    object qyCobradoR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'ESTADOS_DE_CUENTA_DET_COBRADO.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyCobradoR_ETAPA_COBRANZA_C: TIBStringField
      FieldName = 'R_ETAPA_COBRANZA_C'
      Origin = 'ESTADOS_DE_CUENTA_DET_COBRADO.R_ETAPA_COBRANZA_C'
    end
  end
  object qyTodos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM ESTADOS_DE_CUENTA_DET_DIF_CANCELADO(:P_CLIENTE, :P_ALMACEN,' +
        ' :P_TODOS)')
    Left = 232
    Top = 240
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_TODOS'
        ParamType = ptUnknown
        Value = 'No'
      end>
    object qyTodosR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyTodosR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyTodosR_NUMERO_DE_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NUMERO_DE_DOCUMENTOS'
      ReadOnly = True
    end
    object qyTodosR_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DOCUMENTO'
      ReadOnly = True
    end
    object qyTodosR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyTodosR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyTodosR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyTodosR_PUNTO_DE_VENTA_REF_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PUNTO_DE_VENTA_REF_PAGO'
      ReadOnly = True
    end
    object qyTodosR_REF_PAGO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REF_PAGO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyTodosR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyTodosR_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_VENCIMIENTO'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyTodosR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyTodosR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyTodosR_IMPORTE_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPORTE_INICIAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_SALDO_ACTUAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_ACTUAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_FINANCIAMIENTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_FINANCIAMIENTO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_GASTOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GASTOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_ETAPA_COBRANZA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ETAPA_COBRANZA'
      ReadOnly = True
    end
    object qyTodosR_MORATORIOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MORATORIOS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_FECHA_ULM_ACT: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULM_ACT'
      ReadOnly = True
    end
    object qyTodosR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyTodosR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyTodosR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyTodosR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyTodosR_OTROS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_OTROS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_SEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SEL'
      ReadOnly = True
      Size = 2
    end
    object qyTodosR_VENCIMIENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_VENCIMIENTOS'
      ReadOnly = True
    end
    object qyTodosR_PAGO_MODIFICADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_COLOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR'
      ReadOnly = True
      Size = 6
    end
    object qyTodosR_NCREDITO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_NCREDITO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_NCREDITO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyTodosR_NCREDITO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyTodosR_NCREDITO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyTodosR_NCREDITO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCREDITO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyTodosR_NCARGO_SINAFECTAR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_NCARGO_AFECTADAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_NCARGO_SINAFECTAR_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_COUNT'
      ReadOnly = True
    end
    object qyTodosR_NCARGO_AFECTADAS_COUNT: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_COUNT'
      ReadOnly = True
    end
    object qyTodosR_NCARGO_SINAFECTAR_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_SINAFECTAR_ACUM'
      ReadOnly = True
    end
    object qyTodosR_NCARGO_AFECTADAS_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_NCARGO_AFECTADAS_ACUM'
      ReadOnly = True
    end
    object qyTodosR_PAGO_MODIFICADO_ACUM: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGO_MODIFICADO_ACUM'
      ReadOnly = True
    end
    object qyTodosR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyTodosR_DESC_PORC_GLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESC_PORC_GLOBAL'
      ReadOnly = True
      DisplayFormat = '##0.00'
    end
    object qyTodosR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'ESTADOS_DE_CUENTA_DET_DIF_CANCELADO.R_MONEDA'
    end
    object qyTodosR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'ESTADOS_DE_CUENTA_DET_DIF_CANCELADO.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyTodosR_ETAPA_COBRANZA_C: TIBStringField
      FieldName = 'R_ETAPA_COBRANZA_C'
      Origin = 'ESTADOS_DE_CUENTA_DET_DIF_CANCE.R_ETAPA_COBRANZA_C'
    end
  end
  object dsDetalle: TDataSource
    Left = 144
    Top = 296
  end
  object spSELECCION_AUTOMATICA: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCION_AUTOMATICA'
    Left = 416
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'R_RESTO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'P_CANTIDAD'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
        Value = '0'
      end>
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
    Filter = 'ID = -3'
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
    Left = 320
    Top = 240
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
    Left = 320
    Top = 296
  end
  object spSELECCION_VENCIDOS: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCION_VENCIDOS'
    Left = 416
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'R_TOTAL_VENCIDO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spSELECCIONAR_PAGO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCIONAR_PAGO'
    Left = 416
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spQUITAR_SELECCION: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'QUITAR_SELECCION_'
    Left = 416
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
      end>
  end
  object spCOLUMNA_MODIFICADO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'COLUMNA_MODIFICADO'
    Left = 416
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
      end>
  end
  object spCREA_NC_ACUMULADO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CREA_NC_ACUMULADO'
    Left = 560
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_CAJERO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_REFERENCIA'
        ParamType = ptInput
        Value = 'ninguna'
      end>
  end
  object spCREAR_CXC_MANUAL: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CREAR_CXC_MANUAL'
    Left = 560
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_CXC_PAGO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'R_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CAJERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end>
  end
  object spCREAR_CXC_AUTOMATICA: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CREAR_CXC_AUTOMATICA'
    Left = 560
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_CXC_PAGO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CAJERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_TOTAL'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_RESTO'
        ParamType = ptInput
      end>
  end
  object spCREAR_CXC_MODIFICADO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CREAR_CXC_MODIFICADO'
    Left = 560
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_CXC_PAGO'
        ParamType = ptOutput
      end
      item
        DataType = ftFloat
        Name = 'R_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_CAJERO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end>
  end
  object spP_PAGOS_CANCELAR2: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'P_PAGOS_CANCELAR2'
    Left = 560
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spMODIFICAR_CXC_PAGO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'MODIFICAR_CXC_PAGO'
    Left = 560
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'P_IMPORTE'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spSELECCION_MANUAL: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCION_MANUAL'
    Left = 416
    Top = 152
    ParamData = <
      item
        DataType = ftFloat
        Name = 'R_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
      end>
  end
  object spSELECCION_MODIFICADO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCION_MODIFICADO'
    Left = 416
    Top = 104
    ParamData = <
      item
        DataType = ftFloat
        Name = 'R_TOTAL'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CLIENTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
      end>
  end
  object spCancelar: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'P_CXC_CANCELAR'
    Left = 560
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
  object spCXC_SALDOS_MINIMOS: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CXC_SALDOS_MINIMOS'
    Left = 416
    Top = 352
  end
end
