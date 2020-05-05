inherited frmExplorar_lista_precios: TfrmExplorar_lista_precios
  Left = 261
  Top = 72
  Caption = 'Explorar Lista de Precios'
  ClientHeight = 462
  ClientWidth = 889
  ExplicitWidth = 905
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 889
    ExplicitWidth = 889
    object Shape2: TShape [0]
      Left = 368
      Top = 1
      Width = 96
      Height = 17
      Brush.Color = 12615680
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape1: TShape [1]
      Left = 209
      Top = 1
      Width = 52
      Height = 17
      Brush.Color = 12615680
      Pen.Color = clWhite
      Shape = stRoundRect
    end
    object Shape17: TShape [2]
      Left = 263
      Top = 8
      Width = 9
      Height = 3
      Brush.Color = 11106843
      Pen.Color = clWhite
    end
    object Label1: TLabel [3]
      Left = 213
      Top = 2
      Width = 44
      Height = 15
      Caption = '&Moneda'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel [4]
      Left = 372
      Top = 2
      Width = 89
      Height = 15
      Caption = 'Lista de Precios'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = True
    end
    object Shape3: TShape [5]
      Left = 466
      Top = 8
      Width = 9
      Height = 3
      Brush.Color = 11106843
      Pen.Color = clWhite
    end
    inherited Panel1: TPanel
      Width = 889
      TabOrder = 11
      ExplicitWidth = 889
    end
    inherited ibVer: TBitBtn
      TabOrder = 2
    end
    inherited ibConstructor: TBitBtn
      TabOrder = 3
    end
    inherited ibImprimir: TBitBtn
      TabOrder = 4
    end
    inherited ibPantalla: TBitBtn
      Left = 249
      TabOrder = 5
      ExplicitLeft = 249
    end
    inherited ibExportarXLS: TBitBtn
      TabOrder = 6
    end
    inherited ibExportarHTML: TBitBtn
      TabOrder = 7
    end
    inherited ibExportarXML: TBitBtn
      TabOrder = 8
    end
    object ibIncremento: TBitBtn
      Left = 556
      Top = 23
      Width = 75
      Height = 34
      Cursor = crHandPoint
      Caption = 'Incremento Gral. %'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
      OnClick = ibIncrementoClick
    end
    object ibDecremento: TBitBtn
      Left = 633
      Top = 23
      Width = 75
      Height = 34
      Cursor = crHandPoint
      Caption = 'Decremento Gral. %'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      OnClick = ibDecrementoClick
    end
    object cbMonedas: TDBLookupComboBox
      Left = 276
      Top = -1
      Width = 88
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'CLAVE'
      ListSource = dmIBData.dsMonedas
      ParentFont = False
      TabOrder = 0
      TabStop = False
    end
    object cbNLP: TDBLookupComboBox
      Left = 483
      Top = -4
      Width = 257
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyField = 'ID'
      ListField = 'DESCRIPCION'
      ListSource = dsNLP
      ParentFont = False
      TabOrder = 1
      TabStop = False
    end
  end
  inherited dgExplorar: TcxGrid [1]
    Top = 145
    Width = 889
    Height = 295
    ExplicitTop = 145
    ExplicitWidth = 889
    ExplicitHeight = 295
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_MATERIAL_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_MATERIAL_ID'
      end
      object dgExplorarDBTableView1R_MATERIAL_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_MATERIAL_CLAVE'
      end
      object dgExplorarDBTableView1R_MATERIAL_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_MATERIAL_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_PRECIO_MINIMO: TcxGridDBColumn
        DataBinding.FieldName = 'R_PRECIO_MINIMO'
      end
      object dgExplorarDBTableView1R_PRECIO_MAXIMO: TcxGridDBColumn
        DataBinding.FieldName = 'R_PRECIO_MAXIMO'
      end
      object dgExplorarDBTableView1R_COSTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_COSTO'
      end
      object dgExplorarDBTableView1R_FUCOMPRA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FUCOMPRA'
      end
      object dgExplorarDBTableView1R_X_CAJA: TcxGridDBColumn
        DataBinding.FieldName = 'R_X_CAJA'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_CBARRAS: TcxGridDBColumn
        DataBinding.FieldName = 'R_CBARRAS'
      end
    end
  end
  inherited Panel2: TPanel [2]
    Top = 440
    Width = 889
    ExplicitTop = 440
    ExplicitWidth = 889
  end
  inherited paExplorarBusqueda: TPanel
    Width = 889
    ExplicitWidth = 889
    object laMaximo: TDBText [1]
      Left = 813
      Top = 5
      Width = 54
      Height = 16
      AutoSize = True
      DataField = 'R_PRECIO_MAXIMO'
      DataSource = dsFuente
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object laClave: TDBText [2]
      Left = 645
      Top = 5
      Width = 77
      Height = 16
      Alignment = taRightJustify
      DataField = 'R_MATERIAL_CLAVE'
      DataSource = dsFuente
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    inherited buExpHoy: TBitBtn
      Left = 403
      TabOrder = 7
      ExplicitLeft = 403
    end
    object rbMin: TRadioButton
      Left = 480
      Top = 5
      Width = 41
      Height = 17
      Caption = 'Min'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = rbMinClick
    end
    object rbMax: TRadioButton
      Left = 522
      Top = 5
      Width = 41
      Height = 17
      Caption = 'Max'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnClick = rbMaxClick
    end
    object rbAmbos: TRadioButton
      Left = 568
      Top = 5
      Width = 63
      Height = 17
      Caption = 'Ambos'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = True
      OnClick = rbAmbosClick
    end
    object edPrecio: TEdit
      Left = 725
      Top = 1
      Width = 82
      Height = 24
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnKeyPress = edPrecioKeyPress
    end
  end
  object dgExistencias: TDBGrid [4]
    Left = 0
    Top = 89
    Width = 889
    Height = 56
    TabStop = False
    Align = alTop
    Color = clInfoBk
    DataSource = dsExistencias
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dgExplorarDblClick
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT LP.ID R_ID, '
      '              M.ID R_MATERIAL_ID, '
      '              M.CLAVE R_MATERIAL_CLAVE, '
      '              M.DESCRIPCION R_MATERIAL_DESCRIPCION, '
      '              LP.FECHA R_FECHA, '
      '              LP.PRECIO_MINIMO R_PRECIO_MINIMO, '
      '              LP.PRECIO_MAXIMO R_PRECIO_MAXIMO, '
      '              M.COSTO_ULT_COMPRA R_COSTO, '
      '              M.FECHA_ULTIMA_COMPRA R_FUCOMPRA, '
      '              M.UNIDADES_X_CAJA R_X_CAJA, '
      '              LP.ESTATUS R_ESTATUS,'
      '              M.CODIGO_BARRAS R_CBARRAS'
      'FROM LISTA_PRECIOS LP, MATERIALES M'
      
        'WHERE (LP.MATERIAL = M.ID) AND (LP.NOMBRE_LISTA_PRECIO = :P_NLP)' +
        ' '
      'AND (LP.ID = 0)')
    ParamData = <
      item
        DataType = ftString
        Name = 'P_NLP'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_MATERIAL_ID: TIntegerField
      FieldName = 'R_MATERIAL_ID'
      Origin = 'MATERIALES.ID'
      Required = True
    end
    object qyExplorarR_MATERIAL_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_MATERIAL_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_PRECIO_MINIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRECIO_MINIMO'
      ReadOnly = True
      DisplayFormat = '########0.00'
    end
    object qyExplorarR_PRECIO_MAXIMO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRECIO_MAXIMO'
      ReadOnly = True
      DisplayFormat = '########0.00'
    end
    object qyExplorarR_COSTO: TFloatField
      FieldName = 'R_COSTO'
      DisplayFormat = '########0.0000'
    end
    object qyExplorarR_FUCOMPRA: TDateTimeField
      FieldName = 'R_FUCOMPRA'
    end
    object qyExplorarR_X_CAJA: TIntegerField
      FieldName = 'R_X_CAJA'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'LISTA_PRECIOS.ESTATUS'
    end
    object qyExplorarR_CBARRAS: TIBStringField
      FieldName = 'R_CBARRAS'
      Origin = 'MATERIALES.CODIGO_BARRAS'
    end
  end
  inherited ppImprimir: TPopupMenu
    Left = 372
    Top = 207
  end
  inherited ppExpDias: TPopupMenu
    Left = 404
    Top = 207
  end
  object spLP_INCREMENTO_GRAL: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'LP_INCREMENTO_GRAL'
    Left = 256
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_PORCENTAJE'
        ParamType = ptInput
      end>
  end
  object spLP_DECREMENTO_GRAL: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'LP_DECREMENTO_GRAL'
    Left = 288
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'P_PORCENTAJE'
        ParamType = ptInput
      end>
  end
  object qyEncabezadosAlmacenes: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ALMACEN_EXISTENCIA_ENCABEZADOS')
    Left = 61
    Top = 280
    object qyEncabezadosAlmacenesR_ALMACEN1: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN1'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN2: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN2'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN3: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN3'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN4: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN4'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN5: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN5'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN6: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN6'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN7: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN7'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN8: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN8'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN9: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN9'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN10: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN10'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN1_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN1_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN2_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN2_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN3_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN3_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN4_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN4_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN5_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN5_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN6_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN6_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN7_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN7_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN8_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN8_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN9_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN9_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_ALMACEN10_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN10_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadosAlmacenesR_CUANTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CUANTOS'
      ReadOnly = True
    end
  end
  object qyExistencias: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFuente
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM EXISTENCIA_ALMACENES(:R_MATERIAL_ID, :P_MONEDA)')
    Left = 355
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_MATERIAL_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'P_MONEDA'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyExistenciasR_MATERIAL: TIntegerField
      FieldName = 'R_MATERIAL'
      Origin = 'ALMACEN_EXISTENCIAS.R_MATERIAL'
    end
    object qyExistenciasR_CANTIDAD1: TFloatField
      FieldName = 'R_CANTIDAD1'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD1'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD2: TFloatField
      FieldName = 'R_CANTIDAD2'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD2'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD3: TFloatField
      FieldName = 'R_CANTIDAD3'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD3'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD4: TFloatField
      FieldName = 'R_CANTIDAD4'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD4'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD5: TFloatField
      FieldName = 'R_CANTIDAD5'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD5'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD6: TFloatField
      FieldName = 'R_CANTIDAD6'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD6'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD7: TFloatField
      FieldName = 'R_CANTIDAD7'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD7'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD8: TFloatField
      FieldName = 'R_CANTIDAD8'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD8'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD9: TFloatField
      FieldName = 'R_CANTIDAD9'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD9'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_CANTIDAD10: TFloatField
      FieldName = 'R_CANTIDAD10'
      Origin = 'ALMACEN_EXISTENCIAS.R_CANTIDAD10'
      DisplayFormat = '###,###,##0.0000'
    end
    object qyExistenciasR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      Origin = 'ALMACEN_EXISTENCIAS.R_TOTAL'
      DisplayFormat = '###,###,##0.0000'
    end
  end
  object dsExistencias: TDataSource
    DataSet = qyExistencias
    Left = 400
    Top = 112
  end
  object spNLP_MONEDA: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'NLP_MONEDA'
    Left = 152
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_MONEDA'
        ParamType = ptInput
      end>
  end
  object qyNLP: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dmIBData.dsMonedas
    ParamCheck = True
    SQL.Strings = (
      'SELECT N.ID, N.DESCRIPCION'
      'FROM NOMBRE_LISTA_PRECIOS N'
      'WHERE (N.MONEDA = :ID)'
      'ORDER BY N.ID')
    Left = 440
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qyNLPID: TIntegerField
      FieldName = 'ID'
      Origin = 'NOMBRE_LISTA_PRECIOS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyNLPDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Origin = 'NOMBRE_LISTA_PRECIOS.DESCRIPCION'
      Size = 100
    end
  end
  object dsNLP: TDataSource
    DataSet = qyNLP
    Left = 472
    Top = 208
  end
  object spM_PRECIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'M_PRECIO'
    Left = 184
    Top = 248
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_PRECIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_QUIEN'
        ParamType = ptInput
      end>
  end
end
