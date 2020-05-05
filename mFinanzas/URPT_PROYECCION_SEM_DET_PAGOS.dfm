object RPT_PROYECCION_SEM_DET_PAGOS: TRPT_PROYECCION_SEM_DET_PAGOS
  Left = 365
  Top = 444
  Caption = 'RPT_PROYECCION_SEM_DET_PAGOS'
  ClientHeight = 468
  ClientWidth = 1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object qyReporte: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PROYECCION_PAGOS_S_CXP_DET(:P_FECHA, :P_PROVEEDOR)'
      
        'ORDER BY R_MONEDA, R_PROVEEDOR_CLAVE, R_FECHA_VENCIMIENTO, R_REF' +
        'ERENCIA')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA'
        ParamType = ptUnknown
        Value = '26/04/2009'
      end
      item
        DataType = ftString
        Name = 'P_PROVEEDOR'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyEtiquetas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM TL_TEXTO_SEMANA(:P_FECHA)')
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA'
        ParamType = ptUnknown
        Value = '26/04/2006'
      end>
    object qyEtiquetasR_ETIQ_0_A_6: TIBStringField
      FieldName = 'R_ETIQ_0_A_6'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_0_A_6'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_7_A_13: TIBStringField
      FieldName = 'R_ETIQ_7_A_13'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_7_A_13'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_14_A_20: TIBStringField
      FieldName = 'R_ETIQ_14_A_20'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_14_A_20'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_21_A_27: TIBStringField
      FieldName = 'R_ETIQ_21_A_27'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_21_A_27'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_28_A_34: TIBStringField
      FieldName = 'R_ETIQ_28_A_34'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_28_A_34'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_35_A_41: TIBStringField
      FieldName = 'R_ETIQ_35_A_41'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_35_A_41'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_42_A_48: TIBStringField
      FieldName = 'R_ETIQ_42_A_48'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_42_A_48'
      Size = 40
    end
    object qyEtiquetasR_ETIQ_49_A_55: TIBStringField
      FieldName = 'R_ETIQ_49_A_55'
      Origin = 'TL_TEXTO_SEMANA.R_ETIQ_49_A_55'
      Size = 40
    end
  end
  object qyResumen: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT SUM(R_0_A_6) R_0_A_6,'
      '               SUM(R_7_A_13) R_7_A_13,'
      '               SUM(R_14_A_20) R_14_A_20,'
      '               SUM(R_21_A_27) R_21_A_27,'
      '               SUM(R_28_A_34) R_28_A_34,'
      '               SUM(R_35_A_41) R_35_A_41,'
      '               SUM(R_42_A_48) R_42_A_48,'
      '               SUM(R_49_A_55) R_49_A_55,'
      '               SUM(R_VENCIDO) R_VENCIDO,'
      '               R_MONEDA,'
      '               R_MONEDA_C,'
      '               R_MONEDA_D,'
      
        '               SUM(R_0_A_6 + R_7_A_13 + R_14_A_20 + R_21_A_27 + ' +
        'R_28_A_34 + R_35_A_41 + R_42_A_48 + R_49_A_55 + R_VENCIDO) R_TOT' +
        'ALES'
      'FROM PROYECCION_PAGOS_S_CXP_DET(:P_FECHA, :P_PROVEEDOR)'
      'GROUP BY R_MONEDA, R_MONEDA_C, R_MONEDA_D')
    Left = 8
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA'
        ParamType = ptUnknown
        Value = '26/04/2009'
      end
      item
        DataType = ftString
        Name = 'P_PROVEEDOR'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyResumenR_0_A_6: TFloatField
      FieldName = 'R_0_A_6'
      ProviderFlags = []
    end
    object qyResumenR_7_A_13: TFloatField
      FieldName = 'R_7_A_13'
      ProviderFlags = []
    end
    object qyResumenR_14_A_20: TFloatField
      FieldName = 'R_14_A_20'
      ProviderFlags = []
    end
    object qyResumenR_21_A_27: TFloatField
      FieldName = 'R_21_A_27'
      ProviderFlags = []
    end
    object qyResumenR_28_A_34: TFloatField
      FieldName = 'R_28_A_34'
      ProviderFlags = []
    end
    object qyResumenR_35_A_41: TFloatField
      FieldName = 'R_35_A_41'
      ProviderFlags = []
    end
    object qyResumenR_42_A_48: TFloatField
      FieldName = 'R_42_A_48'
      ProviderFlags = []
    end
    object qyResumenR_49_A_55: TFloatField
      FieldName = 'R_49_A_55'
      ProviderFlags = []
    end
    object qyResumenR_TOTALES: TFloatField
      FieldName = 'R_TOTALES'
      ProviderFlags = []
    end
    object qyResumenR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      ProviderFlags = []
    end
    object qyResumenR_MONEDA_C: TIBStringField
      FieldName = 'R_MONEDA_C'
      ProviderFlags = []
      Size = 10
    end
    object qyResumenR_MONEDA_D: TIBStringField
      FieldName = 'R_MONEDA_D'
      ProviderFlags = []
      Size = 50
    end
    object qyResumenR_VENCIDO: TFloatField
      FieldName = 'R_VENCIDO'
      ProviderFlags = []
    end
  end
end
