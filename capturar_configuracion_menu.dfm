inherited frmCapturar_configuracion_menu: TfrmCapturar_configuracion_menu
  Left = 485
  Top = 162
  Caption = 'Capturar configuracion menu'
  ClientHeight = 444
  ClientWidth = 783
  ExplicitWidth = 799
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 783
    Height = 98
    Align = alTop
    ExplicitWidth = 783
    ExplicitHeight = 98
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 76
      Height = 13
      Caption = 'Nombre Externo'
      Transparent = True
    end
    object Label2: TLabel
      Left = 255
      Top = 8
      Width = 71
      Height = 13
      Caption = 'Nombre Objeto'
      Transparent = True
    end
    object Label3: TLabel
      Left = 401
      Top = 8
      Width = 73
      Height = 13
      Caption = 'Nombre Interno'
      Transparent = True
    end
    object Label4: TLabel
      Left = 401
      Top = 49
      Width = 73
      Height = 13
      Caption = 'Acceso Directo'
      Transparent = True
    end
    object Label5: TLabel
      Left = 336
      Top = 49
      Width = 29
      Height = 13
      Caption = 'Orden'
      Transparent = True
    end
    object Label6: TLabel
      Left = 525
      Top = 49
      Width = 35
      Height = 13
      Caption = 'Imagen'
      Transparent = True
    end
    object Label7: TLabel
      Left = 8
      Top = 49
      Width = 68
      Height = 13
      Caption = 'Tipo de Forma'
      Transparent = True
    end
    object Label8: TLabel
      Left = 252
      Top = 49
      Width = 58
      Height = 13
      Caption = 'Identificador'
      Transparent = True
    end
    object sbSiguiente: TSpeedButton
      Left = 311
      Top = 65
      Width = 24
      Height = 21
      Hint = 'Sugerir identificador'
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000130B0000130B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FE7F95F1B7C5
        F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        F3F5FE3956E9153AE6ADBCF6FCFCFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFABB6F50627E3082CE48FA1F3FCFCFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FAFE4F6AEC0020E20629E48A
        A0F3FCFCFFFFFFFFFFFFFFF9FAFE96B1F5A5C0F7FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6CD
        F91133E50638E50A33E5859EF3FCFCFFFFFFFFBCC7F80D35E51644E7E0E6FCFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFEFEFF7488F00D36E50F63EB0A33E56A85EFEBEEFD4067EB1876
        EE1158E97094F1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E7FC2243E71665EC1788F00E3AE6
        3B5AEA1547E720AEF61B98F31A49E8E0E6FCFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF97A5F30C
        30E41B98F31B96F20C3EE6187DEF24BFF823BBF71262EB567FEFFEFEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFF1F3FD3755E9124EE922B6F720AFF623BBF724BFF824BFF81EA4F414
        46E7CAD6FAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB8C1F70C2FE41780EF24BFF824BFF81FAB
        F51EA6F523BDF81367EC5079EEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FAFE536CEC0E3CE6
        1FAAF520AEF60E42E70831E5157EEF1EA3F41448E7B6C8F8FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFD0D6FA1335E51365EB136AEC1336E56783EF0A33E5157EEF1577EE3864EB
        F9FAFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFEFEFF8495F10427E30427E38295F1FBFCFF859EF30A
        33E5116CED1045E7AFC3F7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE4E7FC2C4BE82C4BE8E4E7
        FCFFFFFFFCFCFF859EF30B34E50A4AE83864EBF9FAFEFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        DFE3FBDFE3FBFFFFFFFFFFFFFFFFFFF9FAFE687EEE0629E40328E394AFF5FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F4FE667BEE
        0122E22250E8F0F3FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFF2F4FE667BEE0627E38FAAF4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F4FE677CEE5B77EDF8F9FEFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6F7FEF3F5
        FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
    end
    object deNombreExterno: TDBEdit
      Left = 8
      Top = 24
      Width = 241
      Height = 21
      DataField = 'NOMBRE_EXTERNO'
      DataSource = dsFuente
      TabOrder = 0
    end
    object deNombreObjeto: TDBEdit
      Left = 255
      Top = 24
      Width = 140
      Height = 21
      DataField = 'NAME'
      DataSource = dsFuente
      TabOrder = 1
    end
    object peAccesoDirecto: TDBComboBox
      Left = 401
      Top = 65
      Width = 121
      Height = 21
      DataField = 'SHORTCUT'
      DataSource = dsFuente
      Items.Strings = (
        '(None)'
        'Ctrl+A'
        'Ctrl+B'
        'Ctrl+C'
        'Ctrl+D'
        'Ctrl+E'
        'Ctrl+F'
        'Ctrl+G'
        'Ctrl+H'
        'Ctrl+I'
        'Ctrl+J'
        'Ctrl+K'
        'Ctrl+L'
        'Ctrl+M'
        'Ctrl+N'
        'Ctrl+O'
        'Ctrl+P'
        'Ctrl+Q'
        'Ctrl+R'
        'Ctrl+S'
        'Ctrl+T'
        'Ctrl+U'
        'Ctrl+V'
        'Ctrl+W'
        'Ctrl+X'
        'Ctrl+Y'
        'Ctrl+Z'
        'Ctrl+Alt+A'
        'Ctrl+Alt+B'
        'Ctrl+Alt+C'
        'Ctrl+Alt+D'
        'Ctrl+Alt+E'
        'Ctrl+Alt+F'
        'Ctrl+Alt+G'
        'Ctrl+Alt+H'
        'Ctrl+Alt+I'
        'Ctrl+Alt+J'
        'Ctrl+Alt+K'
        'Ctrl+Alt+L'
        'Ctrl+Alt+M'
        'Ctrl+Alt+N'
        'Ctrl+Alt+O'
        'Ctrl+Alt+P'
        'Ctrl+Alt+Q'
        'Ctrl+Alt+R'
        'Ctrl+Alt+S'
        'Ctrl+Alt+T'
        'Ctrl+Alt+U'
        'Ctrl+Alt+V'
        'Ctrl+Alt+W'
        'Ctrl+Alt+X'
        'Ctrl+Alt+Y'
        'Ctrl+Alt+Z'
        'F1'
        'F2'
        'F3'
        'F4'
        'F5'
        'F6'
        'F7'
        'F8'
        'F9'
        'F10'
        'F11'
        'F12'
        'Ctrl+F1'
        'Ctrl+F2'
        'Ctrl+F3'
        'Ctrl+F4'
        'Ctrl+F5'
        'Ctrl+F6'
        'Ctrl+F7'
        'Ctrl+F8'
        'Ctrl+F9'
        'Ctrl+F10'
        'Ctrl+F11'
        'Ctrl+F12'
        'Shift+F1'
        'Shift+F2'
        'Shift+F3'
        'Shift+F4'
        'Shift+F5'
        'Shift+F6'
        'Shift+F7'
        'Shift+F8'
        'Shift+F9'
        'Shift+F10'
        'Shift+F11'
        'Shift+F12'
        'Shift+Ctrl+F1'
        'Shift+Ctrl+F2'
        'Shift+Ctrl+F3'
        'Shift+Ctrl+F4'
        'Shift+Ctrl+F5'
        'Shift+Ctrl+F6'
        'Shift+Ctrl+F7'
        'Shift+Ctrl+F8'
        'Shift+Ctrl+F9'
        'Shift+Ctrl+F10'
        'Shift+Ctrl+F11'
        'Shift+Ctrl+F12'
        'Ins'
        'Shift+Ins'
        'Ctrl+Ins'
        'Del'
        'Shift+Del'
        'Ctrl+Del'
        'Alt+BkSp'
        'Shift+Alt+BkSp')
      TabOrder = 6
    end
    object deNombreInterno: TDBEdit
      Left = 401
      Top = 24
      Width = 176
      Height = 21
      DataField = 'NOMBRE_INTERNO'
      DataSource = dsFuente
      TabOrder = 2
    end
    object seOrden: TDBEdit
      Left = 336
      Top = 65
      Width = 59
      Height = 21
      DataField = 'ORDEN'
      DataSource = dsFuente
      TabOrder = 5
    end
    object seImagen: TDBEdit
      Left = 525
      Top = 65
      Width = 52
      Height = 21
      DataField = 'IMAGEN'
      DataSource = dsFuente
      TabOrder = 7
    end
    object geIcono: TDBImage
      Left = 583
      Top = 24
      Width = 62
      Height = 62
      DataField = 'ICONO'
      DataSource = dsIconos_Menu
      ReadOnly = True
      TabOrder = 8
    end
    object leTipoForma: TDBLookupComboBox
      Left = 8
      Top = 65
      Width = 241
      Height = 21
      DataField = 'descripcion_forma'
      DataSource = dsFuente
      TabOrder = 3
    end
    object seIdentificador: TDBEdit
      Left = 252
      Top = 65
      Width = 59
      Height = 21
      DataField = 'IDENTIFICADOR'
      DataSource = dsFuente
      TabOrder = 4
    end
  end
  inherited fpPadre: TPanel
    Width = 783
    ExplicitWidth = 783
    inherited Panel1: TPanel
      Width = 783
      ExplicitWidth = 783
    end
  end
  inherited Panel2: TPanel
    Top = 422
    Width = 783
    ExplicitTop = 422
    ExplicitWidth = 783
    inherited buInicio: TBitBtn
      OnClick = buInicioClick
    end
    inherited buAnterior: TBitBtn
      OnClick = buAnteriorClick
    end
    inherited buFin: TBitBtn
      OnClick = buFinClick
    end
    inherited buSiguiente: TBitBtn
      OnClick = buSiguienteClick
    end
  end
  object tlArbolMenu: TDBGrid [3]
    Left = 0
    Top = 158
    Width = 783
    Height = 264
    Align = alClient
    DataSource = dsFuente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnEndDrag = tlArbolMenuEndDrag
  end
  inherited ibEliminar: TBitBtn
    TabOrder = 4
  end
  inherited ibCancelar: TBitBtn
    TabOrder = 5
  end
  inherited ibAyuda: TBitBtn
    TabOrder = 6
  end
  inherited ibImprimir: TBitBtn
    TabOrder = 7
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
        Name = 'LINK'
        DataType = ftInteger
      end
      item
        Name = 'ORDEN'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE_EXTERNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMBRE_INTERNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHORTCUT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IMAGEN'
        DataType = ftInteger
      end
      item
        Name = 'TIPO_FORMA'
        DataType = ftInteger
      end
      item
        Name = 'IDENTIFICADOR'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN117'
        Fields = 'TIPO_FORMA'
      end>
    StoreDefs = True
    TableName = 'MENUS'
    object TCapturarID: TIntegerField
      FieldName = 'ID'
    end
    object TCapturarLINK: TIntegerField
      FieldName = 'LINK'
    end
    object TCapturarORDEN: TIntegerField
      FieldName = 'ORDEN'
    end
    object TCapturarNOMBRE_EXTERNO: TIBStringField
      FieldName = 'NOMBRE_EXTERNO'
      Size = 50
    end
    object TCapturarNOMBRE_INTERNO: TIBStringField
      FieldName = 'NOMBRE_INTERNO'
      Size = 50
    end
    object TCapturarNAME: TIBStringField
      FieldName = 'NAME'
    end
    object TCapturarSHORTCUT: TIBStringField
      FieldName = 'SHORTCUT'
      Size = 50
    end
    object TCapturarIMAGEN: TIntegerField
      FieldName = 'IMAGEN'
    end
    object TCapturarTIPO_FORMA: TIntegerField
      FieldName = 'TIPO_FORMA'
    end
    object TCapturarIDENTIFICADOR: TIntegerField
      FieldName = 'IDENTIFICADOR'
    end
    object TCapturardescripcion_forma: TIBStringField
      FieldKind = fkLookup
      FieldName = 'descripcion_forma'
      LookupDataSet = TFormas
      LookupKeyFields = 'ID'
      LookupResultField = 'NOMBRE'
      KeyFields = 'TIPO_FORMA'
      Size = 50
      Lookup = True
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
        Value = 'MENUS'
      end>
  end
  object dsMenus: TDataSource
    DataSet = TMenus
    Left = 456
    Top = 168
  end
  object TMenus: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'LINK'
        DataType = ftInteger
      end
      item
        Name = 'ORDEN'
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE_EXTERNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOMBRE_INTERNO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SHORTCUT'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IMAGEN'
        DataType = ftInteger
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY1'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'MENUS'
    UniDirectional = False
    Left = 488
    Top = 168
  end
  object ilMenuArbol: TImageList
    DrawingStyle = dsTransparent
    ShareImages = True
    Left = 520
    Top = 168
    Bitmap = {
      494C010104000900080010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000187B9C00187B
      9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B
      9C00187B9C00187B9C00187B9C00000000000000000000000000187B9C00187B
      9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B9C00187B
      9C00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000188CB500188CB500188C
      B500188CB500188CB500188CB500188CB500188CB500188CB500188CB500188C
      B500188CB500188CB500188CB500187B9C00000000001894C6001894C6001894
      C6001894C6001894C6001894C6001894C6001894C6001894C6001894C6001894
      C600187B9C000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400C6C6C60084848400000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000319CBD0063CEFF00188CB5009CFF
      FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6
      FF0039B5DE009CF7FF00188CB500187B9C00189CC600189CC6009CFFFF006BD6
      FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6FF006BD6
      FF00299CBD000873A50000000000000000000000000000000000000000008484
      840084848400FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484000000
      00000000000000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD0063CEFF00188CB5009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BDE
      FF0042B5DE009CFFFF00188CB500187B9C00189CC600189CC6007BE7F7009CFF
      FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BE7FF007BDE
      FF0042B5DE000873A5000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C60084848400848484008484
      84000000000000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD0063CEFF00188CB5009CFF
      FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084E7FF0084EF
      FF004AB5DE00A5F7FF00188CB500187B9C00189CC60021A5CE0039BDD6009CFF
      FF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084EFFF0084E7
      FF0042BDEF000873A5000000000000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484008484
      84008484840000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD0063CEFF00188CB5009CFF
      FF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF0094FFFF008CF7
      FF0052BDE7009CFFFF00188CB500187B9C00189CC60042B5E70021A5CE00A5FF
      FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7FF0094F7
      FF0052BDE7005ABDCE000873A50000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484008484
      84008484840000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD006BD6FF00188CB5009CFF
      FF009CFFFF009CFFFF009CFFFF00A5F7FF009CFFFF009CFFFF009CFFFF009CFF
      FF0063CEFF009CFFFF00188CB500187B9C00189CC6006BD6FF00189CC6008CF7
      F7009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFFFF009CFF
      FF005AC6FF0094FFFF000873A50000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84008484840000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD007BDEFF00188CB5000000
      0000F7FFFF00F7FFFF00F7FFFF00F7FFFF00F7FFFF0000000000000000000000
      000084D6F700F7FFFF00188CB500187B9C00189CC60084D6FF00189CC6006BBD
      DE000000000000000000F7FFFF00000000000000000000000000000000000000
      000084E7FF00000000000873A50000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84008484840000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD0084EFFF0084E7FF00188C
      B500188CB500188CB500188CB500188CB500188CB500188CB500188CB500188C
      B500188CB500188CB500188CB50000000000189CC60084EFFF004AC6E700189C
      C600189CC600189CC600189CC600189CC600189CC600189CC600189CC600189C
      C600189CC600189CC6000873A50000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      84008484840000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD009CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00000000000000000000000000000000000000
      0000107BA500000000000000000000000000189CC6009CF7FF008CF7FF008CF7
      FF008CF7FF008CF7FF008CF7FF00000000000000000000000000000000000000
      0000189CC600187B9C0000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C6008484840084848400000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC60000000000319CBD00000000009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000188CB500188CB500188CB500188CB500188C
      B500107BA500000000000000000000000000189CC600000000009CFFFF009CFF
      FF009CFFFF009CFFFF0000000000189CC600189CC600189CC600189CC600189C
      C600189CC6000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      84000000000000000000000000000000000084848400FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFFC600FFFF
      C600FFFFC600FFFFC600FFFFC6000000000000000000319CBD00000000000000
      000000000000F7FFFF00319CBD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000021A5CE00000000000000
      00000000000000000000189CC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000008484840000000000000000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000000000000000000000000000000000000000000000000000319CBD00319C
      BD00319CBD00319CBD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000021A5CE0021A5
      CE0021A5CE0021A5CE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFC600000000008400
      0000840000008400000084000000840000008400000084000000840000000000
      0000FFFFC60000000000FFFFC600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840084848400424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      C001C00FFF3FFFFF80008007F81F000000000003E00F000000000003C0070000
      00000003C003000000000001C003000000000001C003000010700DF5C0030000
      00010001C003000001F701F3E003000042074207F00F0000B9FFBDFFF83F0000
      C3FFC3FFFCFF0000FFFFFFFFFFFF000000000000000000000000000000000000
      000000000000}
  end
  object ilIconos: TImageList
    Height = 32
    Width = 32
    Left = 328
    Top = 295
  end
  object TIconos_Menu: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
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
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY80'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'INDICE'
    MasterFields = 'IMAGEN'
    MasterSource = dsFuente
    StoreDefs = True
    TableName = 'ICONOS_MENU'
    UniDirectional = False
    Left = 24
    Top = 336
    object TIconos_MenuID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TIconos_MenuINDICE: TIntegerField
      FieldName = 'INDICE'
    end
    object TIconos_MenuICONO: TBlobField
      FieldName = 'ICONO'
    end
  end
  object dsIconos_Menu: TDataSource
    DataSet = TIconos_Menu
    Left = 56
    Top = 336
  end
  object TFormas: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY81'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    StoreDefs = True
    TableName = 'FORMAS'
    UniDirectional = False
    Left = 128
    Top = 111
  end
  object dsFormas: TDataSource
    DataSet = TFormas
    Left = 160
    Top = 111
  end
end
