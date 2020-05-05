inherited frmCapturar_cxc_mensajes: TfrmCapturar_cxc_mensajes
  Left = 518
  Top = 224
  Caption = 'Mensajes'
  ClientHeight = 495
  ClientWidth = 655
  PopupMenu = ppCerrar
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 655
    Height = 114
    Align = alTop
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Mensaje'
    end
    object Label2: TLabel
      Left = 551
      Top = 8
      Width = 83
      Height = 13
      Caption = 'Promesa de pago'
    end
    object meMensaje: TDBMemo
      Left = 8
      Top = 23
      Width = 537
      Height = 86
      DataField = 'MENSAJE'
      DataSource = dsFuente
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object dePromesa: TDBEdit
      Left = 551
      Top = 23
      Width = 97
      Height = 21
      DataField = 'PROMESA_PAGO'
      DataSource = dsFuente
      TabOrder = 1
    end
  end
  inherited fpPadre: TPanel
    Width = 655
    inherited Panel1: TPanel
      Width = 655
    end
  end
  inherited Panel2: TPanel
    Top = 473
    Width = 655
  end
  object dgMensajes: TDBGrid [3]
    Left = 0
    Top = 174
    Width = 655
    Height = 299
    Align = alClient
    DataSource = dsFuente
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  inherited ibImprimir: TBitBtn
    Caption = 'im&primir'
    OnClick = ibImprimirClick
  end
  inherited qyBotones: TIBQuery
    Top = 336
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
        Name = 'CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MENSAJE'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'FECHA'
        DataType = ftDateTime
      end
      item
        Name = 'PROMESA_PAGO'
        DataType = ftDateTime
      end
      item
        Name = 'TIPO'
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'VER_CLIENTE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end>
    Filter = 'CLIENTE = 0'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY139'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN140'
        Fields = 'CLIENTE'
      end
      item
        Name = 'IDX006'
        DescFields = 'FECHA'
        Fields = 'FECHA'
        Options = [ixDescending]
      end
      item
        Name = 'RDB$FOREIGN641'
        Fields = 'TIPO'
      end
      item
        Name = 'RDB$FOREIGN642'
        Fields = 'USUARIO'
      end>
    IndexFieldNames = 'FECHA'
    StoreDefs = True
    TableName = 'CUENTAS_POR_COBRAR_MENSAJES'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarCLIENTE: TIntegerField [1]
      FieldName = 'CLIENTE'
      Required = True
    end
    object TCapturarMENSAJE: TBlobField [2]
      FieldName = 'MENSAJE'
      BlobType = ftBlob
      Size = 8
    end
    object TCapturarFECHA: TDateTimeField [3]
      FieldName = 'FECHA'
    end
    object TCapturarPROMESA_PAGO: TDateTimeField [4]
      FieldName = 'PROMESA_PAGO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/0000;1;_'
    end
    object TCapturarTIPO: TIntegerField [5]
      FieldName = 'TIPO'
    end
    object TCapturarUSUARIO: TIntegerField [6]
      FieldName = 'USUARIO'
    end
    object TCapturarESTATUS: TIBStringField [7]
      FieldName = 'ESTATUS'
    end
    object TCapturarVER_CLIENTE: TIBStringField [8]
      FieldName = 'VER_CLIENTE'
      FixedChar = True
      Size = 2
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
        Value = 'CXC_MENSAJES'
      end>
  end
  object spFECHA_SERVIDOR: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'FECHA_SERVIDOR'
    Left = 120
    Top = 368
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'R_FECHA'
        ParamType = ptOutput
      end>
  end
  object ppCerrar: TPopupMenu
    Left = 496
    Top = 119
    object Cerrar1: TMenuItem
      Caption = 'Cerrar'
      ShortCut = 115
      OnClick = Cerrar1Click
    end
  end
end
