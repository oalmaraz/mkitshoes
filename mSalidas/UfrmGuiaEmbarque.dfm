object frmGuiaDeEmbarque: TfrmGuiaDeEmbarque
  Left = 441
  Top = 157
  Caption = 'Guia de Emparque'
  ClientHeight = 253
  ClientWidth = 408
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
  object qyEncabezado: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURA_ENCABEZADO(:P_FACTURA)')
    Left = 8
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
      end>
  end
  object dsEncabezado: TDataSource
    DataSet = qyEncabezado
    Left = 40
    Top = 56
  end
  object dsDetalle: TDataSource
    DataSet = qyDetalle
    Left = 40
    Top = 88
  end
  object qyDetalle: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURAS_PARTIDAS2(:P_FACTURA)')
    Left = 8
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
      end>
  end
end
