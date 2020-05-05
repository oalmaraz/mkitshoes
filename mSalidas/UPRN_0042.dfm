object PRN_0042: TPRN_0042
  Left = 748
  Top = 179
  Caption = 'PRN_0042'
  ClientHeight = 173
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qyPagare: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PAGARE(:P_ID, :P_CCL_TOTAL, :P_CCL_PAGOS)')
    Left = 16
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '238'
      end
      item
        DataType = ftString
        Name = 'P_CCL_TOTAL'
        ParamType = ptUnknown
        Value = 'cantidad con letra'
      end
      item
        DataType = ftString
        Name = 'P_CCL_PAGOS'
        ParamType = ptUnknown
        Value = 'CANTIDAD CON LETRA'
      end>
  end
  object qyPagareCantidades: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PAGARE_CANTIDADES(:P_ID)')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
      end>
  end
end
