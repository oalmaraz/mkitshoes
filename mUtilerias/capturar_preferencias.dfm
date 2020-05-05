inherited frmCapturar_preferencias: TfrmCapturar_preferencias
  Left = 192
  Top = 65
  Caption = 'Preferencias'
  ClientHeight = 606
  ClientWidth = 787
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 787
    Height = 51
    Align = alTop
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 9
      Height = 13
      Caption = 'Id'
      Transparent = True
    end
    object Label2: TLabel
      Left = 104
      Top = 8
      Width = 37
      Height = 13
      Caption = 'Nombre'
      Transparent = True
    end
    object Label3: TLabel
      Left = 415
      Top = 8
      Width = 21
      Height = 13
      Caption = 'Tipo'
      Transparent = True
    end
    object Label4: TLabel
      Left = 524
      Top = 8
      Width = 24
      Height = 13
      Caption = 'Valor'
      Transparent = True
    end
    object deNombre: TDBEdit
      Left = 104
      Top = 24
      Width = 305
      Height = 21
      DataField = 'NOMBRE'
      DataSource = dsFuente
      TabOrder = 1
    end
    object meTipo: TDBComboBox
      Left = 415
      Top = 24
      Width = 104
      Height = 21
      DataField = 'TIPO'
      DataSource = dsFuente
      ItemHeight = 13
      Items.Strings = (
        'Sin Clasificar'
        'Cadena'
        'Entero'
        'Flotante'
        'Boolean')
      TabOrder = 2
    end
    object deValor: TDBEdit
      Left = 524
      Top = 24
      Width = 121
      Height = 21
      DataField = 'VALOR'
      DataSource = dsFuente
      TabOrder = 3
    end
    object ceId: TDBEdit
      Left = 8
      Top = 24
      Width = 90
      Height = 21
      DataField = 'ID'
      DataSource = dsFuente
      TabOrder = 0
    end
  end
  inherited fpPadre: TPanel
    Width = 787
    inherited Panel1: TPanel
      Width = 787
    end
  end
  inherited Panel2: TPanel
    Top = 584
    Width = 787
  end
  object dgExplorar: TDBGrid [3]
    Left = 0
    Top = 111
    Width = 787
    Height = 473
    Align = alClient
    Color = clInfoBk
    DataSource = dsFuente
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'VALOR'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY110'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'PREFERENCIAS'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarNOMBRE: TIBStringField [1]
      FieldName = 'NOMBRE'
      Size = 100
    end
    object TCapturarTIPO: TIBStringField [2]
      FieldName = 'TIPO'
      Size = 14
    end
    object TCapturarVALOR: TIBStringField [3]
      FieldName = 'VALOR'
    end
  end
  inherited spID: TIBStoredProc
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'P_QUIEN'
        ParamType = ptInput
        Value = 'PREFERENCIAS'
      end>
  end
end
