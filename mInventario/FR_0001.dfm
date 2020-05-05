object frmFR_0001: TfrmFR_0001
  Left = 410
  Top = 454
  Caption = 'frmFR_0001'
  ClientHeight = 276
  ClientWidth = 424
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
  object qyMIDiferenciasE: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM T_MI(:P_ID)')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyMIDiferenciasD: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsHospEdoCtaE
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CONTEOS_DIFERENCIAS(:P_ID)')
    Left = 8
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object dsHospEdoCtaE: TDataSource
    DataSet = qyMIDiferenciasE
    Left = 40
    Top = 8
  end
end
