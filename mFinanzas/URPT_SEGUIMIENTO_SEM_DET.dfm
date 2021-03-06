object RPT_SEGUIMIENTO_SEM_DET: TRPT_SEGUIMIENTO_SEM_DET
  Left = 353
  Top = 355
  Caption = 'RPT_SEGUIMIENTO_SEM_DET'
  ClientHeight = 492
  ClientWidth = 1104
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
      'FROM SEGUIMIENTO_C_S_CXC_DET(:P_FECHA, :P_CLIENTE)'
      
        'ORDER BY R_CLIENTE_NOMBRE, R_EXTENSION_NOMBRE,  R_MONEDA, R_REFE' +
        'RENCIA')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA'
        ParamType = ptUnknown
        Value = '24/04/2009'
      end
      item
        DataType = ftString
        Name = 'P_CLIENTE'
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
        Value = '24/04/2009'
      end>
    object qyEtiquetasR_ETIQ_0_A_6: TIBStringField
      FieldName = 'R_ETIQ_0_A_6'
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
      '               R_MONEDA,'
      '               R_MONEDA_C,'
      '               R_MONEDA_D'
      'FROM SEGUIMIENTO_C_S_CXC_DET(:P_FECHA, :P_CLIENTE)'
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
        DataType = ftUnknown
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
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
  end
end
