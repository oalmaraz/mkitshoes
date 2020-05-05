inherited frmCapturar_mensajes: TfrmCapturar_mensajes
  Left = 340
  Top = 94
  Caption = 'Mensajes'
  ClientHeight = 577
  ClientWidth = 797
  ExplicitWidth = 813
  ExplicitHeight = 616
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 797
    Height = 495
    ExplicitWidth = 797
    ExplicitHeight = 495
    object laObservaciones: TLabel
      Left = 7
      Top = 10
      Width = 40
      Height = 13
      Caption = 'Mensaje'
      FocusControl = edMensaje
      Transparent = True
    end
    object Label1: TLabel
      Left = 7
      Top = 101
      Width = 24
      Height = 13
      Caption = 'Extra'
      FocusControl = edExtra
      Transparent = True
    end
    object Label9: TLabel
      Left = 131
      Top = 233
      Width = 44
      Height = 13
      Caption = 'Momento'
      FocusControl = cbMomento
      Transparent = True
    end
    object Label2: TLabel
      Left = 7
      Top = 233
      Width = 35
      Height = 13
      Caption = 'Modulo'
      FocusControl = cbModulo
      Transparent = True
    end
    object Label3: TLabel
      Left = 7
      Top = 273
      Width = 22
      Height = 13
      Caption = 'Para'
      FocusControl = cbPara
      Transparent = True
    end
    object laNombre: TLabel
      Left = 131
      Top = 273
      Width = 32
      Height = 13
      Caption = 'Cliente'
      Transparent = True
      Visible = False
    end
    object laTelefono: TLabel
      Left = 367
      Top = 273
      Width = 42
      Height = 13
      Caption = 'Telefono'
      Transparent = True
      Visible = False
    end
    object Label4: TLabel
      Left = 7
      Top = 314
      Width = 35
      Height = 13
      Caption = 'Estatus'
      FocusControl = cbEstatus
      Transparent = True
    end
    object edNombre: TDBEdit
      Left = 131
      Top = 289
      Width = 232
      Height = 21
      TabStop = False
      Color = clBackground
      DataField = 'nombre'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      Visible = False
    end
    object edMensaje: TDBMemo
      Left = 8
      Top = 26
      Width = 769
      Height = 70
      DataField = 'MENSAJE'
      DataSource = dsFuente
      TabOrder = 0
    end
    object edExtra: TDBMemo
      Left = 7
      Top = 117
      Width = 769
      Height = 70
      DataField = 'EXTRA'
      DataSource = dsFuente
      TabOrder = 1
    end
    object cbFecha: TDBCheckBox
      Left = 7
      Top = 196
      Width = 112
      Height = 21
      Caption = 'Especificar Fecha'
      DataField = 'ESPECIFICAR_FECHA'
      DataSource = dsFuente
      TabOrder = 2
      ValueChecked = 'Si'
      ValueUnchecked = 'No'
    end
    object edFecha: TDBEdit
      Left = 131
      Top = 196
      Width = 161
      Height = 21
      DataField = 'EN_FECHA'
      DataSource = dsFuente
      TabOrder = 3
      Visible = False
    end
    object cbMomento: TDBEdit
      Left = 131
      Top = 249
      Width = 116
      Height = 21
      DataField = 'MOMENTO'
      DataSource = dsFuente
      MaxLength = 20
      TabOrder = 4
    end
    object cbModulo: TDBEdit
      Left = 7
      Top = 249
      Width = 120
      Height = 21
      DataField = 'MODULO'
      DataSource = dsFuente
      MaxLength = 20
      TabOrder = 5
      OnChange = cbModuloChange
    end
    object cbPara: TDBEdit
      Left = 7
      Top = 289
      Width = 120
      Height = 21
      DataField = 'PARA'
      DataSource = dsFuente
      TabOrder = 6
      OnChange = cbParaChange
    end
    object edCliente: TEdit
      Left = 131
      Top = 286
      Width = 232
      Height = 21
      TabOrder = 7
      Visible = False
      OnKeyPress = edClienteKeyPress
    end
    object edTelefono: TDBEdit
      Left = 367
      Top = 289
      Width = 107
      Height = 21
      TabStop = False
      Color = clBackground
      DataField = 'telefono'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
      Visible = False
    end
    object cbUsuarios: TDBLookupComboBox
      Left = 131
      Top = 289
      Width = 232
      Height = 21
      DataField = 'QUIEN'
      DataSource = dsFuente
      TabOrder = 8
      Visible = False
    end
    object cbEstatus: TDBEdit
      Left = 7
      Top = 330
      Width = 120
      Height = 21
      DataField = 'ESTATUS'
      DataSource = dsFuente
      TabOrder = 11
      OnChange = cbParaChange
    end
  end
  inherited fpPadre: TPanel
    Width = 797
    ExplicitWidth = 797
    inherited Panel1: TPanel
      Width = 797
      ExplicitWidth = 797
    end
  end
  inherited Panel2: TPanel
    Top = 555
    Width = 797
    ExplicitTop = 555
    ExplicitWidth = 797
  end
  inherited dsFuente: TDataSource
    Left = 640
    Top = 344
  end
  inherited qyBotones: TIBQuery
    Left = 661
    Top = 264
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'MENSAJE'
        DataType = ftBlob
      end
      item
        Name = 'EXTRA'
        DataType = ftBlob
      end
      item
        Name = 'ESPECIFICAR_FECHA'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'EN_FECHA'
        DataType = ftDateTime
      end
      item
        Name = 'MODULO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'MOMENTO'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'PARA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'QUIEN'
        DataType = ftInteger
      end
      item
        Name = 'PRIVADO'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY650'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_mensajes.dsFuente
    StoreDefs = True
    TableName = 'MENSAJES'
    Left = 608
    Top = 344
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarMENSAJE: TBlobField [1]
      FieldName = 'MENSAJE'
      Size = 8
    end
    object TCapturarEXTRA: TBlobField [2]
      FieldName = 'EXTRA'
      Size = 8
    end
    object TCapturarESPECIFICAR_FECHA: TIBStringField [3]
      FieldName = 'ESPECIFICAR_FECHA'
      FixedChar = True
      Size = 2
    end
    object TCapturarEN_FECHA: TDateTimeField [4]
      FieldName = 'EN_FECHA'
      DisplayFormat = 'dd/mmm/yyyy hh:nn:ss am/pm'
      EditMask = '!99/99/0000;1;_'
    end
    object TCapturarMODULO: TIBStringField [5]
      FieldName = 'MODULO'
      Size = 50
    end
    object TCapturarMOMENTO: TIBStringField [6]
      FieldName = 'MOMENTO'
      Size = 50
    end
    object TCapturarPARA: TIBStringField [7]
      FieldName = 'PARA'
    end
    object TCapturarQUIEN: TIntegerField [8]
      FieldName = 'QUIEN'
    end
    object TCapturarPRIVADO: TIBStringField [9]
      FieldName = 'PRIVADO'
      FixedChar = True
      Size = 2
    end
    object TCapturarESTATUS: TIBStringField [10]
      FieldName = 'ESTATUS'
    end
    object TCapturarnombre: TStringField
      FieldKind = fkCalculated
      FieldName = 'nombre'
      Size = 100
      Calculated = True
    end
    object TCapturartelefono: TStringField
      FieldKind = fkCalculated
      FieldName = 'telefono'
      Calculated = True
    end
  end
  inherited spID: TIBStoredProc
    Left = 672
    Top = 344
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
        Value = 'MSJS'
      end>
  end
  object qyUsuarios: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT U.ID, S.CLAVE, S.NOMBRE'
      'FROM SUJETOS_USUARIOS U, SUJETOS S'
      'WHERE (U.SUJETO = S.ID) AND (U.ID > 0)'
      'ORDER BY S.NOMBRE')
    Left = 608
    Top = 383
    object qyUsuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'SUJETOS_USUARIOS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyUsuariosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyUsuariosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
  end
  object dsUsuarios: TDataSource
    DataSet = qyUsuarios
    Left = 640
    Top = 383
  end
end
