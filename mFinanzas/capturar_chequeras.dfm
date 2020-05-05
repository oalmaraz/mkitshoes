inherited frmCapturar_chequeras: TfrmCapturar_chequeras
  Left = 466
  Top = 192
  Caption = 'Chequeras'
  ClientHeight = 432
  ClientWidth = 749
  ExplicitWidth = 765
  ExplicitHeight = 471
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 749
    Height = 350
    ExplicitWidth = 749
    ExplicitHeight = 350
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Caption = '&Banco'
      FocusControl = beBanco
    end
    object Label4: TLabel
      Left = 8
      Top = 133
      Width = 142
      Height = 13
      Caption = 'Fecha Ultimo Cheque Impreso'
    end
    object Label5: TLabel
      Left = 373
      Top = 88
      Width = 83
      Height = 13
      Caption = '&Folio Cheq. Inicial'
      FocusControl = deFolio
    end
    object Label6: TLabel
      Left = 8
      Top = 171
      Width = 27
      Height = 13
      Caption = 'Saldo'
    end
    object Label7: TLabel
      Left = 8
      Top = 48
      Width = 131
      Height = 13
      Caption = 'Reporte Impresion Che&ques'
      FocusControl = deCheques
    end
    object Label8: TLabel
      Left = 237
      Top = 48
      Width = 117
      Height = 13
      Caption = 'Reporte Impresion &Poliza'
      FocusControl = dePoliza
    end
    object Label9: TLabel
      Left = 8
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Im&presora'
      FocusControl = cbImpresoras
    end
    object Label10: TLabel
      Left = 237
      Top = 88
      Width = 104
      Height = 13
      Caption = 'Caractere&s de escape'
      FocusControl = cbCaracteres
    end
    object Label1: TLabel
      Left = 237
      Top = 8
      Width = 34
      Height = 13
      Caption = 'Cuenta'
      FocusControl = beBanco
    end
    object Label11: TLabel
      Left = 467
      Top = 8
      Width = 41
      Height = 13
      Caption = 'Sucursal'
      FocusControl = beBanco
    end
    object Label12: TLabel
      Left = 177
      Top = 171
      Width = 39
      Height = 13
      Caption = 'Moneda'
      FocusControl = beBanco
    end
    object Label2: TLabel
      Left = 467
      Top = 48
      Width = 136
      Height = 13
      Caption = '&Reporte Impresion Depositos'
      FocusControl = deDepositos
    end
    object deFolio: TDBEdit
      Left = 373
      Top = 104
      Width = 89
      Height = 21
      DataField = 'FOLIO_CHEQUE_INICIAL'
      DataSource = dsFuente
      TabOrder = 8
    end
    object deCheques: TDBEdit
      Left = 8
      Top = 64
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REPORTE_CHEQUES'
      DataSource = dsFuente
      TabOrder = 3
    end
    object dePoliza: TDBEdit
      Left = 237
      Top = 64
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REPORTE_POLIZA'
      DataSource = dsFuente
      TabOrder = 4
    end
    object beBanco: TDBEdit
      Left = 8
      Top = 24
      Width = 225
      Height = 21
      DataField = 'bNombre'
      DataSource = dsFuente
      TabOrder = 0
      OnKeyPress = beBancoKeyPress
    end
    object cbImpresoras: TDBComboBox
      Left = 8
      Top = 104
      Width = 225
      Height = 21
      DataField = 'IMPRESORANOM'
      DataSource = dsFuente
      TabOrder = 6
      OnChange = cbImpresorasChange
    end
    object cbCaracteres: TDBComboBox
      Left = 237
      Top = 104
      Width = 131
      Height = 21
      DataField = 'ESCMODEL'
      DataSource = dsFuente
      Items.Strings = (
        'Epson printers'
        'HP printers'
        'okidata printers')
      TabOrder = 7
    end
    object deFecha: TDBEdit
      Left = 8
      Top = 148
      Width = 161
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'FECHA_ULT_CHEQUE_IMP'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
    end
    object deSaldo: TDBEdit
      Left = 8
      Top = 187
      Width = 161
      Height = 21
      TabStop = False
      DataField = 'SALDO'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    object deCuenta: TDBEdit
      Left = 237
      Top = 24
      Width = 225
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cuenta'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object deSucursal: TDBEdit
      Left = 467
      Top = 24
      Width = 225
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'sucursal'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object deMoneda: TDBEdit
      Left = 177
      Top = 187
      Width = 129
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'mDescripcion'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
    end
    object deDepositos: TDBEdit
      Left = 467
      Top = 64
      Width = 225
      Height = 21
      CharCase = ecUpperCase
      DataField = 'REPORTE_DEPOSITOS'
      DataSource = dsFuente
      TabOrder = 5
    end
  end
  inherited fpPadre: TPanel
    Width = 749
    ExplicitWidth = 749
    inherited Panel1: TPanel
      Width = 749
      ExplicitWidth = 749
    end
  end
  inherited Panel2: TPanel
    Top = 410
    Width = 749
    ExplicitTop = 410
    ExplicitWidth = 749
  end
  inherited qyBotones: TIBQuery
    Left = 277
    Top = 368
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
        Name = 'BANCO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'FECHA_ULT_CHEQUE_IMP'
        DataType = ftDateTime
      end
      item
        Name = 'SALDO'
        DataType = ftFloat
      end
      item
        Name = 'FOLIO_CHEQUE_INICIAL'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'REPORTE_CHEQUES'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'REPORTE_DEPOSITOS'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IMPRESORANOM'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IMPRESORAVAL'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ESCMODEL'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'REPORTE_POLIZA'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY154'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN155'
        Fields = 'BANCO'
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_chequeras.dsFuente
    StoreDefs = True
    TableName = 'CHEQUERAS'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarBANCO: TIntegerField [1]
      FieldName = 'BANCO'
      Required = True
    end
    object TCapturarFECHA_ULT_CHEQUE_IMP: TDateTimeField [2]
      FieldName = 'FECHA_ULT_CHEQUE_IMP'
      DisplayFormat = 'dd/mm/yyyy am/pm'
    end
    object TCapturarSALDO: TFloatField [3]
      FieldName = 'SALDO'
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object TCapturarFOLIO_CHEQUE_INICIAL: TIBStringField [4]
      FieldName = 'FOLIO_CHEQUE_INICIAL'
    end
    object TCapturarREPORTE_CHEQUES: TIBStringField [5]
      FieldName = 'REPORTE_CHEQUES'
      Size = 100
    end
    object TCapturarREPORTE_DEPOSITOS: TIBStringField [6]
      FieldName = 'REPORTE_DEPOSITOS'
      Size = 100
    end
    object TCapturarIMPRESORANOM: TIBStringField [7]
      FieldName = 'IMPRESORANOM'
      Size = 50
    end
    object TCapturarIMPRESORAVAL: TIBStringField [8]
      FieldName = 'IMPRESORAVAL'
      Size = 10
    end
    object TCapturarESCMODEL: TIBStringField [9]
      FieldName = 'ESCMODEL'
      Size = 50
    end
    object TCapturarREPORTE_POLIZA: TIBStringField [10]
      FieldName = 'REPORTE_POLIZA'
      Size = 100
    end
    object TCapturarcuenta: TStringField
      FieldKind = fkCalculated
      FieldName = 'cuenta'
      Size = 50
      Calculated = True
    end
    object TCapturarsucursal: TStringField
      FieldKind = fkCalculated
      FieldName = 'sucursal'
      Size = 50
      Calculated = True
    end
    object TCapturarmDescripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'mDescripcion'
      Size = 100
      Calculated = True
    end
    object TCapturarbNombre: TStringField
      FieldKind = fkCalculated
      FieldName = 'bNombre'
      Size = 100
      Calculated = True
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
        Value = 'CHEQUERAS'
      end>
  end
end
