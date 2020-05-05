object frmRPT_CORTE_CAJAS_CXC_CC_DET: TfrmRPT_CORTE_CAJAS_CXC_CC_DET
  Left = 224
  Top = 202
  Caption = 'frmRPT_CORTE_CAJAS_CXC_CC_DET'
  ClientHeight = 541
  ClientWidth = 854
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
  object qyCorteDetalleCC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM GRAL_CORTE_CAJAS_CC_DETALLE(:P_FECHA_DEL, :P_FECHA_AL, :P_C' +
        'AJA, :P_ALMACEN, :P_OPCION)'
      'ORDER BY R_FECHA, R_ALMACEN, R_CAJA, R_FOLIO_PAGO, R_PRIORIDAD')
    Left = 8
    Top = 7
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
        Value = '11'
      end>
    object qyCorteDetalleCCR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_FOLIO_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_PAGO'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDetalleCCR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDetalleCCR_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyCorteDetalleCCR_CC: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CC_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CC_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDetalleCCR_MONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_ESTATUS_DETALLE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS_DETALLE'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CAMBIO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAMBIO'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyCorteDetalleCCR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyCorteDetalleCCR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDetalleCCR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'GRAL_CORTE_CAJAS_CC_DETALLE.R_MONEDA'
    end
    object qyCorteDetalleCCR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'GRAL_CORTE_CAJAS_CC_DETALLE.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyCorteDetalleCCR_MONEDA_DESCRIPCION: TIBStringField
      FieldName = 'R_MONEDA_DESCRIPCION'
      Origin = 'GRAL_CORTE_CAJAS_CC_DETALLE.R_MONEDA_DESCRIPCION'
      Size = 50
    end
    object qyCorteDetalleCCR_TOTAL_MBASE: TFloatField
      FieldName = 'R_TOTAL_MBASE'
      Origin = 'GRAL_CORTE_CAJAS_CC_DETALLE.R_TOTAL_MBASE'
    end
  end
end
