object dmChequesGirados: TdmChequesGirados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 533
  Width = 938
  object TIBXChequesGirados: TIBTable
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
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'MONEDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PROVEEDOR'
        DataType = ftInteger
      end
      item
        Name = 'PROVEEDOR_NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FECHA_ALTA'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_APLICACION'
        DataType = ftDateTime
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'FECHA_APLICACION_REAL'
        DataType = ftDateTime
      end
      item
        Name = 'SEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TABLA_REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_REFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'AUTORIZO'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CHEQUERA'
        DataType = ftInteger
      end
      item
        Name = 'BANCO'
        DataType = ftInteger
      end
      item
        Name = 'CONSECUTIVO'
        DataType = ftInteger
      end
      item
        Name = 'ABONO_CTA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    Filter = 'ID = 0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY157'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN209'
        Fields = 'CHEQUERA'
      end
      item
        Name = 'RDB$FOREIGN159'
        Fields = 'MONEDA'
      end
      item
        Name = 'RDB$FOREIGN160'
        Fields = 'PROVEEDOR'
      end
      item
        Name = 'RDB$FOREIGN185'
        Fields = 'USUARIO'
      end
      item
        Name = 'RDB$FOREIGN186'
        Fields = 'AUTORIZO'
      end
      item
        Name = 'RDB$FOREIGN216'
        Fields = 'BANCO'
      end
      item
        Name = 'IDX100'
        Fields = 'FECHA_APLICACION'
      end>
    StoreDefs = True
    TableName = 'CHEQUES_GIRADOS'
    UniDirectional = False
    Left = 72
    Top = 16
    object TIBXChequesGiradosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIBXChequesGiradosREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
    end
    object TIBXChequesGiradosMONTO: TFloatField
      FieldName = 'MONTO'
    end
    object TIBXChequesGiradosMONEDA: TIntegerField
      FieldName = 'MONEDA'
      Required = True
    end
    object TIBXChequesGiradosPROVEEDOR: TIntegerField
      FieldName = 'PROVEEDOR'
    end
    object TIBXChequesGiradosPROVEEDOR_NOMBRE: TIBStringField
      FieldName = 'PROVEEDOR_NOMBRE'
      Size = 100
    end
    object TIBXChequesGiradosFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
    end
    object TIBXChequesGiradosFECHA_APLICACION: TDateTimeField
      FieldName = 'FECHA_APLICACION'
    end
    object TIBXChequesGiradosOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object TIBXChequesGiradosFECHA_APLICACION_REAL: TDateTimeField
      FieldName = 'FECHA_APLICACION_REAL'
    end
    object TIBXChequesGiradosSEL: TIBStringField
      FieldName = 'SEL'
      Size = 2
    end
    object TIBXChequesGiradosTABLA_REFERENCIA: TIBStringField
      FieldName = 'TABLA_REFERENCIA'
      Size = 50
    end
    object TIBXChequesGiradosID_REFERENCIA: TIntegerField
      FieldName = 'ID_REFERENCIA'
    end
    object TIBXChequesGiradosUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Required = True
    end
    object TIBXChequesGiradosAUTORIZO: TIntegerField
      FieldName = 'AUTORIZO'
    end
    object TIBXChequesGiradosESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TIBXChequesGiradosCHEQUERA: TIntegerField
      FieldName = 'CHEQUERA'
    end
    object TIBXChequesGiradosBANCO: TIntegerField
      FieldName = 'BANCO'
    end
    object TIBXChequesGiradosCONSECUTIVO: TIntegerField
      FieldName = 'CONSECUTIVO'
    end
    object TIBXChequesGiradosABONO_CTA: TIBStringField
      FieldName = 'ABONO_CTA'
      FixedChar = True
      Size = 2
    end
  end
  object dsEncabezado: TDataSource
    DataSet = TIBXChequesGirados
    Left = 72
    Top = 67
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
    Left = 296
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
    Left = 296
    Top = 67
  end
  object qyIBXEstatusProcesos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    AfterOpen = qyIBXEstatusProcesosAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ESTATUS_PROCESOS'
      'WHERE (FORMA = :P_FORMA) AND (ESTATUS = :P_ESTATUS)')
    Left = 72
    Top = 165
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FORMA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ESTATUS'
        ParamType = ptUnknown
        Value = 'Sin Afectar'
      end>
    object qyIBXEstatusProcesosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyIBXEstatusProcesosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 50
    end
    object qyIBXEstatusProcesosFORMA: TIntegerField
      FieldName = 'FORMA'
    end
    object qyIBXEstatusProcesosESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
  end
  object dsEstatusProcesos: TDataSource
    DataSet = qyIBXEstatusProcesos
    Left = 72
    Top = 224
  end
  object TIBXEstatusProcesosDetalle: TIBTable
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
        Name = 'PROCESO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AUTORIZACION'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'STOREPROC'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY117'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN118'
        Fields = 'PROCESO'
      end>
    IndexFieldNames = 'PROCESO'
    MasterFields = 'ID'
    MasterSource = dsEstatusProcesos
    StoreDefs = True
    TableName = 'ESTATUS_PROCESOS_DET'
    UniDirectional = False
    Left = 196
    Top = 165
    object TIBXEstatusProcesosDetalleID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIBXEstatusProcesosDetallePROCESO: TIntegerField
      FieldName = 'PROCESO'
      Required = True
    end
    object TIBXEstatusProcesosDetalleESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TIBXEstatusProcesosDetalleAUTORIZACION: TIBStringField
      FieldName = 'AUTORIZACION'
      Size = 2
    end
    object TIBXEstatusProcesosDetalleSTOREPROC: TIBStringField
      FieldName = 'STOREPROC'
      Size = 50
    end
  end
  object dsEstatusProcesosDetalle: TDataSource
    DataSet = TIBXEstatusProcesosDetalle
    Left = 196
    Top = 224
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
    Left = 320
    Top = 165
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
    Left = 320
    Top = 224
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
    Left = 408
    Top = 173
    object qyIBXFechaServidorR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
  end
  object dsFechaServidor: TDataSource
    DataSet = qyIBXFechaServidor
    Left = 408
    Top = 232
  end
  object spID: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ID'
    Left = 484
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'P_QUIEN'
        ParamType = ptInput
        Value = 'CHEQUES_GIRADOS'
      end>
  end
  object spIBXEstatus: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    Left = 484
    Top = 232
  end
  object qyChequeras: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT C.ID, SB.CUENTA, SB.SUCURSAL, S.CLAVE, S.NOMBRE, SB.ID BA' +
        'NCO'
      'FROM CHEQUERAS C, SUJETOS_BANCOS SB, SUJETOS S'
      'WHERE (C.BANCO = SB.ID) AND (SB.SUJETO = S.ID) ')
    Left = 396
    Top = 16
    object qyChequerasCUENTA: TIBStringField
      FieldName = 'CUENTA'
      Size = 50
    end
    object qyChequerasSUCURSAL: TIBStringField
      FieldName = 'SUCURSAL'
      Size = 50
    end
    object qyChequerasCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Size = 50
    end
    object qyChequerasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyChequerasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyChequerasBANCO: TIntegerField
      FieldName = 'BANCO'
      Required = True
    end
  end
  object dsChequeras: TDataSource
    DataSet = qyChequeras
    Left = 396
    Top = 67
  end
  object qyPendientes: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CHEQUES_GIRADOS_DET')
    Left = 72
    Top = 312
    object qyPendientesR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyPendientesR_FECHA_APLICACION: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_APLICACION'
      ReadOnly = True
    end
    object qyPendientesR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyPendientesR_CHEQUERA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CHEQUERA'
      ReadOnly = True
    end
    object qyPendientesR_BANCO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO'
      ReadOnly = True
    end
    object qyPendientesR_BANCO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPendientesR_CUENTA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CUENTA'
      ReadOnly = True
      Size = 50
    end
    object qyPendientesR_SUCURSAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUCURSAL'
      ReadOnly = True
      Size = 50
    end
    object qyPendientesR_MONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyPendientesR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyPendientesR_MONEDA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyPendientesR_MONEDA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyPendientesR_PROVEEDOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR'
      ReadOnly = True
    end
    object qyPendientesR_PROVEEDOR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyPendientesR_PROVEEDOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyPendientesR_SEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SEL'
      ReadOnly = True
      Size = 2
    end
    object qyPendientesR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyPendientesR_CONSECUTIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONSECUTIVO'
      ReadOnly = True
    end
    object qyPendientesR_COLOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_COLOR'
      ReadOnly = True
      Size = 6
    end
  end
  object dsPendientes: TDataSource
    DataSet = qyPendientes
    Left = 72
    Top = 360
  end
  object spSELECCIONAR_CHEQUEGIRADO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'SELECCIONAR_CHEQUEGIRADO'
    Left = 484
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
end
