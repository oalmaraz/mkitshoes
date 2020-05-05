object frmRPT_CORTE_CAJAS_CXC_DET: TfrmRPT_CORTE_CAJAS_CXC_DET
  Left = 177
  Top = 273
  Caption = 'frmRPT_CORTE_CAJAS_CXC_DET'
  ClientHeight = 441
  ClientWidth = 870
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dsDetalle: TDataSource
    DataSet = qyDetalleCXC
    Left = 40
    Top = 5
  end
  object qyDetalleCXC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM GRAL_CORTE_CAJAS_DETALLE_CXC(:P_FECHA_DEL, :P_FECHA_AL, :P_' +
        'CAJA, :P_ALMACEN, :P_OPCION)')
    Left = 8
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA_DEL'
        ParamType = ptUnknown
        Value = '02/07/2003'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_AL'
        ParamType = ptUnknown
        Value = '02/07/2003'
      end
      item
        DataType = ftString
        Name = 'P_CAJA'
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
        Name = 'P_OPCION'
        ParamType = ptUnknown
        Value = '3'
      end>
    object qyDetalleCXCR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyDetalleCXCR_FOLIO_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_PAGO'
      ReadOnly = True
    end
    object qyDetalleCXCR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyDetalleCXCR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyDetalleCXCR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyDetalleCXCR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleCXCR_CAJERO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO'
      ReadOnly = True
    end
    object qyDetalleCXCR_CAJERO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleCXCR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyDetalleCXCR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleCXCR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
    end
    object qyDetalleCXCR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyDetalleCXCR_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyDetalleCXCR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyDetalleCXCR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
    end
    object qyDetalleCXCR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleCXCR_DET_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_ID'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_CUENTA_POR_COBRAR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_CUENTA_POR_COBRAR'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_FECHA_DOCUMENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_FECHA_DOCUMENTO'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_FECHA_VENCIMIENTO'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_IMPORTE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_IMPORTE'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_IMPORTE_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_IMPORTE_INICIAL'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_SUERTE_PRINCIPAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_SUERTE_PRINCIPAL'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_FINANCIAMIENTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_FINANCIAMIENTO'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_MORATORIOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_MORATORIOS'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_GASTOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_GASTOS'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_OTROS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_OTROS'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_NUMERO_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_NUMERO_DOCUMENTOS'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_DOCUMENTO'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_ETAPA_COBRANZA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_ETAPA_COBRANZA'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_ESTATUS'
      ReadOnly = True
    end
    object qyDetalleCXCR_DET_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DET_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyDetalleCXCR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyDetalleCXCR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyDetalleCXCR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleCXCR_GRANTOTAL_DETALLE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL_DETALLE'
      ReadOnly = True
    end
    object qyDetalleCXCR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyDetalleCXCR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'GRAL_CORTE_CAJAS_DETALLE_CXC.R_MONEDA'
    end
    object qyDetalleCXCR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'GRAL_CORTE_CAJAS_DETALLE_CXC.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyDetalleCXCR_MONEDA_DESCRIPCION: TIBStringField
      FieldName = 'R_MONEDA_DESCRIPCION'
      Origin = 'GRAL_CORTE_CAJAS_DETALLE_CXC.R_MONEDA_DESCRIPCION'
      Size = 50
    end
    object qyDetalleCXCR_TOTAL_MBASE: TFloatField
      FieldName = 'R_TOTAL_MBASE'
      Origin = 'GRAL_CORTE_CAJAS_DETALLE_CXC.R_TOTAL_MBASE'
    end
  end
end
