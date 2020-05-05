object PRN_0041: TPRN_0041
  Left = 781
  Top = 139
  Caption = 'PRN_0041'
  ClientHeight = 177
  ClientWidth = 214
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
  object qyPartidasCupon: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PARTIDAS_CUPON_PAGO(:P_ID)')
    Left = 16
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '27'
      end>
  end
end
