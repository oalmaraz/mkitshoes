inherited frmExplorar_cotizaciones: TfrmExplorar_cotizaciones
  Left = 396
  Top = 232
  Caption = 'Explorar Cotizaciones'
  ClientHeight = 547
  ClientWidth = 961
  OnShow = FormShow
  ExplicitWidth = 977
  ExplicitHeight = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 961
    ExplicitWidth = 961
    inherited Panel1: TPanel
      Width = 961
      ExplicitWidth = 961
    end
    inherited ibVer: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibConstructor: TBitBtn
      Width = 66
      Height = 18
      ExplicitWidth = 66
      ExplicitHeight = 18
    end
    inherited ibImprimir: TBitBtn
      Left = 84
      Top = 38
      Width = 49
      Height = 18
      ExplicitLeft = 84
      ExplicitTop = 38
      ExplicitWidth = 49
      ExplicitHeight = 18
    end
    inherited ibPantalla: TBitBtn
      Left = 129
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
      ExplicitLeft = 129
    end
    inherited ibExportarXLS: TBitBtn
      Left = 430
      ExplicitLeft = 430
    end
    inherited ibExportarHTML: TBitBtn
      Left = 507
      ExplicitLeft = 507
    end
    inherited ibExportarXML: TBitBtn
      Left = 584
      ExplicitLeft = 584
    end
    object BitBtn1: TBitBtn
      Left = 252
      Top = 22
      Width = 75
      Height = 34
      Hint = 'Exportar'
      Caption = 'Estadisticos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      OnClick = ibExportarXMLClick
    end
    object Panel3: TPanel
      Left = 333
      Top = 1
      Width = 265
      Height = 55
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 9
      Visible = False
      object Label1: TLabel
        Left = 16
        Top = 4
        Width = 76
        Height = 13
        Caption = 'Fechas     Inicial'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 16
        Top = 30
        Width = 73
        Height = 13
        Caption = '                 Final'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 103
        Top = 4
        Width = 98
        Height = 21
        Date = 42740.639981585650000000
        Time = 42740.639981585650000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 103
        Top = 29
        Width = 98
        Height = 21
        Date = 42740.639981585650000000
        Time = 42740.639981585650000000
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object Button1: TButton
        Left = 214
        Top = 14
        Width = 42
        Height = 25
        Caption = 'Ok'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button1Click
      end
    end
    object Panel4: TPanel
      Left = 603
      Top = -1
      Width = 260
      Height = 57
      TabOrder = 10
      Visible = False
      object rgEstatus: TRadioGroup
        Left = 3
        Top = 3
        Width = 104
        Height = 49
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Items.Strings = (
          'Declinado'
          'Aceptado')
        ParentFont = False
        TabOrder = 0
      end
      object CBNoAutriza: TComboBox
        Left = 122
        Top = 6
        Width = 132
        Height = 21
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'Costo de la norma'
          'Precio alto'
          'Tiempo de entrega'
          'Competencia'
          'Sin motivo'
          'Modificacion datos'
          'Correo'
          'Deposito'
          'Orden de compra'
          'Firmada')
      end
      object Button2: TButton
        Left = 184
        Top = 30
        Width = 75
        Height = 22
        Caption = 'Guardar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 110
        Top = 30
        Width = 75
        Height = 22
        Caption = 'Cerrar'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = Button3Click
      end
    end
  end
  inherited Panel2: TPanel
    Top = 525
    Width = 961
    ExplicitTop = 525
    ExplicitWidth = 961
  end
  inherited dgExplorar: TcxGrid
    Width = 961
    Height = 436
    ExplicitWidth = 961
    ExplicitHeight = 436
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = 'Buscar ....'
      FindPanel.ShowClearButton = False
      FindPanel.ShowFindButton = False
      Filtering.ColumnFilteredItemsList = True
      OptionsView.GroupByBox = False
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONSECUTIVO'
        Width = 100
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
        Width = 300
      end
      object dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_RAZON_SOCIAL'
        Width = 300
      end
      object dgExplorarDBTableView1R_FECHA_VALIDEZ: TcxGridDBColumn
        Caption = 'R_FECHA_ESTATUS'
        DataBinding.FieldName = 'R_FECHA_VALIDEZ'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_GRANTOTAL'
        Width = 90
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
        Width = 65
      end
      object dgExplorarDBTableView1Column1: TcxGridDBColumn
        DataBinding.FieldName = 'R_VENDEDOR'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 961
    ExplicitWidth = 961
    object BitBtn2: TBitBtn
      Left = 704
      Top = 0
      Width = 97
      Height = 25
      Caption = 'Aceptacion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object Button4: TButton
      Left = 560
      Top = 1
      Width = 75
      Height = 25
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = Button4Click
    end
  end
  inherited dsFuente: TDataSource
    OnDataChange = dsFuenteDataChange
  end
  inherited qyExplorar: TIBQuery
    AutoCalcFields = False
    OnCalcFields = qyExplorarCalcFields
    SQL.Strings = (
      
        'SELECT R_ID, r_CONSECUTIVO, r_vendedor,  R_CLAVE, R_FECHA_ALTA, ' +
        'R_NOMBRE, R_RAZON_SOCIAL,  R_FECHA_VALIDEZ,'
      '      R_GRANTOTAL,'
      '      R_ESTATUS,'
      '      R_SEGURO_SUBTOTAL,'
      '      R_SEGURO_IVA,'
      '      R_PROYECTO'
      'FROM ver_cotizaciones'
      'WHERE (1=1)'
      '              ')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'COTIZACIONES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'COTIZACIONES.CLAVE'
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      Origin = 'COTIZACIONES.FECHA_ALTA'
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'COTIZACIONES.NOMBRE'
      Size = 100
    end
    object qyExplorarR_RAZON_SOCIAL: TIBStringField
      FieldName = 'R_RAZON_SOCIAL'
      Origin = 'COTIZACIONES.RAZON_SOCIAL'
      Size = 100
    end
    object qyExplorarR_FECHA_VALIDEZ: TDateTimeField
      FieldName = 'R_FECHA_VALIDEZ'
      Origin = 'COTIZACIONES.FECHA_VALIDEZ'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_GRANTOTAL: TFloatField
      FieldName = 'R_GRANTOTAL'
      Origin = 'COTIZACIONES.GRANTOTAL'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'COTIZACIONES.ESTATUS'
    end
    object qyExplorarR_SEGURO_SUBTOTAL: TFloatField
      FieldName = 'R_SEGURO_SUBTOTAL'
      Origin = 'COTIZACIONES.SEGURO_SUBTOTAL'
    end
    object qyExplorarR_SEGURO_IVA: TFloatField
      FieldName = 'R_SEGURO_IVA'
      Origin = 'COTIZACIONES.SEGURO_IVA'
    end
    object qyExplorarR_PROYECTO: TIBStringField
      FieldName = 'R_PROYECTO'
      Origin = 'COTIZACIONES.PROYECTO'
      Size = 100
    end
    object qyExplorarseguro: TFloatField
      FieldKind = fkCalculated
      FieldName = 'seguro'
      Calculated = True
    end
    object qyExplorarsupertotal: TFloatField
      FieldKind = fkCalculated
      FieldName = 'supertotal'
      Calculated = True
    end
    object qyExplorarR_VENDEDOR: TIntegerField
      FieldName = 'R_VENDEDOR'
      Origin = 'COTIZACIONES.VENDEDOR'
      Required = True
    end
    object qyExplorarR_CONSECUTIVO: TIntegerField
      FieldName = 'R_CONSECUTIVO'
      Origin = 'VER_COTIZACIONES.R_CONSECUTIVO'
    end
  end
  object qyEsVendedor: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM T_ES_VENDEDOR(:P_USUARIO)')
    Left = 61
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object ibGuarda_com_cotizacion: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'update cotizaciones'
      'set estatus                           = :p_estatus,'
      '     causa                               =:p_causa'
      'where id = :p_cotizacion')
    Left = 875
    Top = 3
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'p_estatus'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p_causa'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'p_cotizacion'
        ParamType = ptUnknown
      end>
  end
  object dxComponentPrinter1: TdxComponentPrinter
    CurrentLink = dxComponentPrinter1Link1
    Version = 0
    Left = 704
    Top = 248
    object dxComponentPrinter1Link1: TdxGridReportLink
      Component = dgExplorar
      PageNumberFormat = pnfNumeral
      PrinterPage.DMPaper = 1
      PrinterPage.Footer = 6350
      PrinterPage.GrayShading = True
      PrinterPage.Header = 6350
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.PageSize.X = 215900
      PrinterPage.PageSize.Y = 279400
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      AssignedFormatValues = [fvDate, fvTime, fvPageNumber]
      BuiltInReportLink = True
    end
  end
end
