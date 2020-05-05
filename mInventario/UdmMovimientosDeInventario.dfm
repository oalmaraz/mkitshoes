object dmMovimientosDeInventario: TdmMovimientosDeInventario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 790
  object TIBXMovimientosDeInventario: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    OnCalcFields = TIBXMovimientosDeInventarioCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FECHA_HORA'
        DataType = ftDateTime
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SUB_TIPO'
        DataType = ftInteger
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDREFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ALMACEN_ORIGEN'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ALMACEN_DESTINO'
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CLAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FOLIO_ALMACEN_ORIGEN'
        DataType = ftInteger
      end
      item
        Name = 'FOLIO_ALMACEN_DESTINO'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        DataType = ftInteger
      end
      item
        Name = 'LINEA'
        DataType = ftInteger
      end>
    Filter = 'ID = -1'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY256'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN257'
        Fields = 'ALMACEN_ORIGEN'
      end
      item
        Name = 'RDB$FOREIGN2'
        Fields = 'USUARIO'
      end
      item
        Name = 'RDB$FOREIGN363'
        Fields = 'LINEA'
      end>
    StoreDefs = True
    TableName = 'MOVIMIENTOS_DE_INVENTARIO'
    UniDirectional = False
    Left = 72
    Top = 16
    object TIBXMovimientosDeInventarioID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIBXMovimientosDeInventarioFECHA_HORA: TDateTimeField
      FieldName = 'FECHA_HORA'
    end
    object TIBXMovimientosDeInventarioTIPO: TIBStringField
      FieldName = 'TIPO'
    end
    object TIBXMovimientosDeInventarioSUB_TIPO: TIntegerField
      FieldName = 'SUB_TIPO'
    end
    object TIBXMovimientosDeInventarioREFERENCIA: TIBStringField
      FieldName = 'REFERENCIA'
      Size = 50
    end
    object TIBXMovimientosDeInventarioIDREFERENCIA: TIntegerField
      FieldName = 'IDREFERENCIA'
    end
    object TIBXMovimientosDeInventarioALMACEN_ORIGEN: TIntegerField
      FieldName = 'ALMACEN_ORIGEN'
      Required = True
    end
    object TIBXMovimientosDeInventarioALMACEN_DESTINO: TIntegerField
      FieldName = 'ALMACEN_DESTINO'
    end
    object TIBXMovimientosDeInventarioOBSERVACIONES: TIBStringField
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
    object TIBXMovimientosDeInventarioESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TIBXMovimientosDeInventarioCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object TIBXMovimientosDeInventarioFOLIO_ALMACEN_ORIGEN: TIntegerField
      FieldName = 'FOLIO_ALMACEN_ORIGEN'
    end
    object TIBXMovimientosDeInventarioFOLIO_ALMACEN_DESTINO: TIntegerField
      FieldName = 'FOLIO_ALMACEN_DESTINO'
    end
    object TIBXMovimientosDeInventarioUSUARIO: TIntegerField
      FieldName = 'USUARIO'
    end
    object TIBXMovimientosDeInventarioLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object TIBXMovimientosDeInventariolinea_descripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'linea_descripcion'
      Size = 100
      Calculated = True
    end
  end
  object dsMovimientosDeInventario: TDataSource
    DataSet = TIBXMovimientosDeInventario
    Left = 72
    Top = 70
  end
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
    Left = 336
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
    Left = 336
    Top = 70
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
    Top = 167
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
    Top = 223
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
    Left = 220
    Top = 167
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
    Left = 220
    Top = 223
  end
  object qyIBXSubTipo: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM SUB_TIPOS(:P_TIPO)')
    Left = 220
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'P_TIPO'
        ParamType = ptUnknown
        Value = 'Vacio'
      end>
    object qyIBXSubTipoR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXSubTipoR_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyIBXSubTipoR_GENERA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_GENERA'
      ReadOnly = True
      Size = 2
    end
  end
  object dsSubTipo: TDataSource
    DataSet = qyIBXSubTipo
    Left = 220
    Top = 70
  end
  object qyIBXUpdate: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'UPDATE MOVIMIENTOS_DE_INVENTARIO'
      'SET '
      '   FECHA_HORA = :P_FECHA, '
      '   CLAVE = :P_CLAVE,'
      '   TIPO = :P_TIPO, '
      '   ALMACEN_ORIGEN = :P_ALMACEN_ORIGEN, '
      '   ALMACEN_DESTINO =  :P_ALMACEN_DESTINO, '
      '   ESTATUS = :P_ESTATUS, '
      '   OBSERVACIONES = :P_OBSERVACIONES, '
      '   SUB_TIPO = :P_SUB_TIPO,'
      '   USUARIO = :P_USUARIO,'
      '   LINEA = :P_LINEA'
      'WHERE ID = :P_ID;')
    Left = 448
    Top = 16
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_CLAVE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_ALMACEN_ORIGEN'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_ALMACEN_DESTINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_ESTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_OBSERVACIONES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_SUB_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_USUARIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_LINEA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_ID'
        ParamType = ptUnknown
      end>
  end
  object spIBXInsert: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'INSERT_MI'
    Left = 520
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftDateTime
        Name = 'P_FECHA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_CLAVE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_SUB_TIPO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN_ORIGEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN_DESTINO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_OBSERVACIONES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_ESTATUS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_USUARIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_LINEA'
        ParamType = ptInput
      end>
  end
  object spIBXEstatus: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    Left = 520
    Top = 70
  end
  object qyIBXEliminar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'DELETE FROM MOVIMIENTOS_DE_INVENTARIO'
      'WHERE ID = :P_ID')
    Left = 336
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
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
    Left = 424
    Top = 168
    object qyIBXFechaServidorR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
  end
  object dsFechaServidor: TDataSource
    DataSet = qyIBXFechaServidor
    Left = 424
    Top = 223
  end
  object spREAGRUPAR_MI: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'REAGRUPAR_MI'
    Left = 72
    Top = 318
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
  object spCONTEO_AJUSTE_TODAY: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CONTEO_AJUSTE_TODAY'
    Left = 224
    Top = 318
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
end
