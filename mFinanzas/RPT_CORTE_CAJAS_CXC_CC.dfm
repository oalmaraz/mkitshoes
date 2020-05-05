object frmRPT_CORTE_CAJAS_CXC_CC: TfrmRPT_CORTE_CAJAS_CXC_CC
  Left = 607
  Top = 248
  Caption = 'frmRPT_CORTE_CAJAS_CXC_CC'
  ClientHeight = 548
  ClientWidth = 857
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
  object qyCorteCC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM GRAL_CORTE_CAJAS_CC_CXC(:P_FECHA_DEL, :P_FECHA_AL, :P_CAJA,' +
        ' :P_ALMACEN, :P_OPCION)')
    Left = 8
    Top = 8
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
        Value = '8'
      end>
    object qyCorteCCR_MONTO_PAGO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO_PAGO'
      ReadOnly = True
    end
    object qyCorteCCR_CC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC'
      ReadOnly = True
    end
    object qyCorteCCR_CC_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteCCR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyCorteCCR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteCCR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyCorteCCR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyCorteCCR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteCCR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
    object qyCorteCCR_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyCorteCCR_MONTO_COLECTA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO_COLECTA'
      ReadOnly = True
    end
    object qyCorteCCR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
    end
    object qyCorteCCR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'GRAL_CORTE_CAJAS_CC_CXC.R_MONEDA'
    end
    object qyCorteCCR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'GRAL_CORTE_CAJAS_CC_CXC.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyCorteCCR_MONEDA_DESCRIPCION: TIBStringField
      FieldName = 'R_MONEDA_DESCRIPCION'
      Origin = 'GRAL_CORTE_CAJAS_CC_CXC.R_MONEDA_DESCRIPCION'
      Size = 50
    end
    object qyCorteCCR_TOTAL_MBASE: TFloatField
      FieldName = 'R_TOTAL_MBASE'
      Origin = 'GRAL_CORTE_CAJAS_CC_CXC.R_TOTAL_MBASE'
    end
  end
  object qyResumenCC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM GRAL_CORTE_CAJAS_CC_RESUMEN(:P_FECHA_DEL, :P_FECHA_AL, :P_C' +
        'AJA, :P_ALMACEN, :P_OPCION)')
    Left = 40
    Top = 8
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
        Value = '8'
      end>
    object qyResumenCCR_MONTO_PAGO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO_PAGO'
      ReadOnly = True
    end
    object qyResumenCCR_CC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC'
      ReadOnly = True
    end
    object qyResumenCCR_CC_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyResumenCCR_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyResumenCCR_MONTO_COLECTA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO_COLECTA'
      ReadOnly = True
    end
    object qyResumenCCR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
    end
    object qyResumenCCR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'GRAL_CORTE_CAJAS_CC_RESUMEN.R_MONEDA'
    end
    object qyResumenCCR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'GRAL_CORTE_CAJAS_CC_RESUMEN.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyResumenCCR_MONEDA_DESCRIPCION: TIBStringField
      FieldName = 'R_MONEDA_DESCRIPCION'
      Origin = 'GRAL_CORTE_CAJAS_CC_RESUMEN.R_MONEDA_DESCRIPCION'
      Size = 50
    end
  end
end
