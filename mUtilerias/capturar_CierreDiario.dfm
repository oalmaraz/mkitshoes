inherited frmCapturar_CierreDiario: TfrmCapturar_CierreDiario
  Left = 392
  Top = 280
  Caption = 'Cierre Diario'
  ClientHeight = 524
  ClientWidth = 664
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 2
    Top = 72
    Width = 81
    Height = 13
    Caption = 'Modulos Funcion'
    Transparent = True
  end
  inherited fpPadre: TPanel
    Width = 664
    Height = 65
    ExplicitWidth = 664
    ExplicitHeight = 65
    object laFecha: TLabel [0]
      Left = 232
      Top = 3
      Width = 73
      Height = 13
      Caption = 'Fecha Cierre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Bevel1: TBevel [1]
      Left = 222
      Top = 2
      Width = 5
      Height = 59
      Shape = bsLeftLine
    end
    inherited Panel1: TPanel
      Width = 664
      TabOrder = 5
      ExplicitWidth = 664
    end
    object cbNo: TCheckBox
      Left = 6
      Top = 44
      Width = 105
      Height = 17
      Caption = 'Ini. Diaria (NO)'
      TabOrder = 0
    end
    object cbSi: TCheckBox
      Left = 6
      Top = 26
      Width = 105
      Height = 17
      Caption = 'Ini. Diaria (SI)'
      TabOrder = 1
    end
    object edFecha: TDateTimePicker
      Left = 232
      Top = 24
      Width = 92
      Height = 21
      Date = 42269.575485196800000000
      Time = 42269.575485196800000000
      TabOrder = 2
    end
    object buCierre: TBitBtn
      Left = 331
      Top = 24
      Width = 75
      Height = 34
      Cursor = crHandPoint
      Hint = 'Nuevo'
      Caption = 'Cierre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = fcImageBtn1Click
    end
    object buIniciar: TBitBtn
      Left = 139
      Top = 24
      Width = 75
      Height = 34
      Cursor = crHandPoint
      Hint = 'Nuevo'
      Caption = 'Cierre'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ibNuevoClick
    end
  end
  object dgModulosFuncion: TDBGrid
    Left = 2
    Top = 88
    Width = 285
    Height = 433
    DataSource = dsModulosFuncion
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dgFolios: TDBGrid
    Left = 292
    Top = 160
    Width = 368
    Height = 361
    DataSource = dsModuloFolios
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qyModuloFolios: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsModulosFuncion
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MODULOS_FOLIOS'
      'WHERE R_MF_ID = :ID'
      'ORDER BY R_F_ID')
    Left = 432
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
  end
  object dsModuloFolios: TDataSource
    DataSet = qyModuloFolios
    Left = 464
    Top = 104
  end
  object qyModulosFuncion: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MODULOS_FUNCION')
    Left = 432
    Top = 72
    object qyModulosFuncionID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyModulosFuncionMODULO: TIntegerField
      FieldName = 'MODULO'
      Required = True
    end
    object qyModulosFuncionDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object qyModulosFuncionINICIALIZACION_DIARIA: TIBStringField
      FieldName = 'INICIALIZACION_DIARIA'
      Size = 2
    end
  end
  object dsModulosFuncion: TDataSource
    DataSet = qyModulosFuncion
    Left = 464
    Top = 72
  end
  object spFOLIOS_A_UNO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'FOLIOS_A_UNO'
    Left = 432
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'P_TIPO'
        ParamType = ptInput
        Value = 'Si'
      end>
  end
  object qyFecha: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FECHA_SERVIDOR')
    Left = 496
    Top = 72
  end
  object spCIERRE_DIARIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CIERRE_DIARIO'
    Left = 464
    Top = 136
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'P_FECHA'
        ParamType = ptInput
      end>
  end
end
