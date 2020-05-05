inherited frmCapturar_iconos_menu: TfrmCapturar_iconos_menu
  Caption = 'Iconos'
  ClientHeight = 480
  ClientWidth = 807
  ExplicitWidth = 823
  ExplicitHeight = 519
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 807
    Height = 87
    Align = alTop
    ExplicitWidth = 124
    ExplicitHeight = 87
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Icono'
    end
    object Label2: TLabel
      Left = 80
      Top = 8
      Width = 29
      Height = 13
      Caption = 'Indice'
    end
    object geIcono: TDBImage
      Left = 16
      Top = 24
      Width = 57
      Height = 57
      DataField = 'ICONO'
      DataSource = dsFuente
      TabOrder = 0
    end
    object seIndice: TDBEdit
      Left = 80
      Top = 24
      Width = 81
      Height = 21
      DataField = 'INDICE'
      DataSource = dsFuente
      TabOrder = 1
    end
  end
  inherited fpPadre: TPanel
    Width = 807
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 807
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 458
    Width = 807
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  object lvIconos: TListView [3]
    Left = 0
    Top = 147
    Width = 807
    Height = 311
    Align = alClient
    BorderStyle = bsNone
    Columns = <>
    LargeImages = ilIconos
    TabOrder = 7
    ExplicitLeft = 1
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
        Name = 'INDICE'
        DataType = ftInteger
      end
      item
        Name = 'ICONO'
        DataType = ftBlob
        Size = 8
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY80'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'ICONOS_MENU'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarINDICE: TIntegerField [1]
      FieldName = 'INDICE'
    end
    object TCapturarICONO: TBlobField [2]
      FieldName = 'ICONO'
      Size = 8
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
        Value = 'ICONOS'
      end>
  end
  object ilIconos: TImageList
    Left = 256
    Top = 79
  end
end
