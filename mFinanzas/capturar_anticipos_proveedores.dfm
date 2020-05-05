inherited frmCapturar_anticipos_proveedores: TfrmCapturar_anticipos_proveedores
  Tag = 33
  Left = 473
  Top = 180
  Caption = 'Anticipos Proveedores'
  ClientHeight = 453
  ClientWidth = 686
  ExplicitWidth = 702
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 686
    Height = 371
    ExplicitWidth = 686
    ExplicitHeight = 371
    inherited laHEstatus: TLabel
      Left = 495
      Top = 176
      ExplicitLeft = 495
      ExplicitTop = 176
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 8
      Width = 51
      Height = 13
      Caption = '&Fecha Alta'
      FocusControl = deFechaAlta
      Transparent = True
    end
    object Label7: TLabel [2]
      Left = 165
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Cla&ve'
      FocusControl = deClave
      Transparent = True
    end
    object Label22: TLabel [3]
      Left = 297
      Top = 8
      Width = 41
      Height = 13
      Caption = '&Almacen'
      FocusControl = cbAlmacenes
      Transparent = True
    end
    object Label5: TLabel [4]
      Left = 495
      Top = 8
      Width = 71
      Height = 13
      Caption = 'O&bservaciones'
      FocusControl = deObservaciones
      Transparent = True
    end
    object Label1: TLabel [5]
      Left = 8
      Top = 176
      Width = 86
      Height = 13
      Caption = '&Referencia (Enter)'
      FocusControl = beCXP
    end
    object Label3: TLabel [6]
      Left = 8
      Top = 50
      Width = 83
      Height = 13
      Caption = '&Proveedor (Enter)'
      Transparent = True
    end
    object Label19: TLabel [7]
      Left = 8
      Top = 90
      Width = 34
      Height = 13
      Caption = 'I.V.A.%'
      Transparent = True
    end
    object Label17: TLabel [8]
      Left = 103
      Top = 90
      Width = 41
      Height = 13
      Caption = 'I.EP.S.%'
      Transparent = True
    end
    object laImpuesto1Porc: TLabel [9]
      Left = 199
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Impuesto 1%'
      Transparent = True
    end
    object laImpuesto2Porc: TLabel [10]
      Left = 294
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Impuesto 2%'
      Transparent = True
    end
    object Label13: TLabel [11]
      Left = 199
      Top = 176
      Width = 60
      Height = 13
      Caption = 'Saldo Actual'
    end
    object Label12: TLabel [12]
      Left = 580
      Top = 134
      Width = 39
      Height = 13
      Caption = '&Moneda'
      Transparent = True
    end
    object Label4: TLabel [13]
      Left = 8
      Top = 134
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label6: TLabel [14]
      Left = 103
      Top = 134
      Width = 46
      Height = 13
      Caption = 'Sub-Total'
    end
    object Label8: TLabel [15]
      Left = 199
      Top = 134
      Width = 26
      Height = 13
      Caption = 'I.V.A.'
    end
    object Label9: TLabel [16]
      Left = 294
      Top = 134
      Width = 36
      Height = 13
      Caption = 'I.E.P.S.'
    end
    object Label10: TLabel [17]
      Left = 389
      Top = 134
      Width = 52
      Height = 13
      Caption = 'Impuesto 1'
    end
    object Label11: TLabel [18]
      Left = 485
      Top = 134
      Width = 52
      Height = 13
      Caption = 'Impuesto 2'
    end
    inherited buAplicar: TBitBtn
      Left = 642
      Top = 192
      TabOrder = 22
      ExplicitLeft = 642
      ExplicitTop = 192
    end
    object deProveedor: TDBEdit [20]
      Left = 8
      Top = 66
      Width = 376
      Height = 21
      TabStop = False
      Color = clBackground
      DataField = 'proveedor_n'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    inherited edHEstatus: TDBEdit
      Left = 511
      Top = 192
      Width = 130
      TabOrder = 21
      ExplicitLeft = 511
      ExplicitTop = 192
      ExplicitWidth = 130
    end
    inherited cbHEstatus: TDBLookupComboBox
      Left = 495
      Top = 192
      TabOrder = 20
      ExplicitLeft = 495
      ExplicitTop = 192
    end
    object deFolio: TDBEdit
      Left = 64
      Top = 2
      Width = 97
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'CONSECUTIVO'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object deFechaAlta: TDBEdit
      Left = 8
      Top = 24
      Width = 153
      Height = 21
      DataField = 'FECHA_ALTA'
      DataSource = dsFuente
      TabOrder = 1
    end
    object deClave: TDBEdit
      Left = 165
      Top = 24
      Width = 126
      Height = 21
      DataField = 'CLAVE'
      DataSource = dsFuente
      TabOrder = 2
    end
    object deObservaciones: TDBMemo
      Left = 495
      Top = 24
      Width = 175
      Height = 103
      DataField = 'OBSERVACIONES'
      DataSource = dsFuente
      TabOrder = 4
    end
    object beCXP: TDBEdit
      Left = 8
      Top = 192
      Width = 185
      Height = 21
      DataField = 'cxp'
      DataSource = dsFuente
      TabOrder = 18
      OnKeyPress = beCXPKeyPress
    end
    object edProveedor: TEdit
      Left = 8
      Top = 66
      Width = 376
      Height = 21
      TabOrder = 6
      Visible = False
      OnKeyPress = edProveedorKeyPress
    end
    object ceIVAPorc: TDBEdit
      Left = 8
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IVA_PORC'
      DataSource = dsFuente
      TabOrder = 7
      OnChange = ceIVAPorcChange
    end
    object ceIEPSPorc: TDBEdit
      Left = 103
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IEPS_PORC'
      DataSource = dsFuente
      TabOrder = 8
      OnChange = ceIEPSPorcChange
    end
    object ceImpuesto1Porc: TDBEdit
      Left = 199
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IMPUESTO1_PORC'
      DataSource = dsFuente
      TabOrder = 9
      OnChange = ceImpuesto1PorcChange
    end
    object ceImpuesto2Porc: TDBEdit
      Left = 294
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IMPUESTO2_PORC'
      DataSource = dsFuente
      TabOrder = 10
      OnChange = ceImpuesto2PorcChange
    end
    object deSaldo: TDBEdit
      Left = 199
      Top = 192
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cxp_saldo'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 19
    end
    object edTotal: TDBEdit
      Left = 8
      Top = 150
      Width = 90
      Height = 21
      DataField = 'TOTAL'
      DataSource = dsFuente
      TabOrder = 11
      OnChange = edTotalChange
    end
    object edSubTotal: TDBEdit
      Left = 103
      Top = 150
      Width = 90
      Height = 21
      DataField = 'SUBTOTAL'
      DataSource = dsFuente
      TabOrder = 12
      OnChange = edSubTotalChange
    end
    object edIVA: TDBEdit
      Left = 199
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IVA'
      DataSource = dsFuente
      TabOrder = 13
    end
    object edIEPS: TDBEdit
      Left = 294
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IEPS'
      DataSource = dsFuente
      TabOrder = 14
    end
    object edImpuesto1: TDBEdit
      Left = 389
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IMPUESTO1'
      DataSource = dsFuente
      TabOrder = 15
    end
    object edImpuesto2: TDBEdit
      Left = 485
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IMPUESTO2'
      DataSource = dsFuente
      TabOrder = 16
    end
    object cbAlmacenes: TDBLookupComboBox
      Left = 297
      Top = 24
      Width = 182
      Height = 21
      DataField = 'ALMACEN'
      DataSource = dsFuente
      DropDownWidth = 250
      TabOrder = 3
    end
    object cbMonedas: TDBLookupComboBox
      Left = 580
      Top = 150
      Width = 90
      Height = 21
      DataField = 'MONEDA'
      DataSource = dsFuente
      DropDownWidth = 250
      TabOrder = 17
    end
  end
  inherited fpPadre: TPanel
    Width = 686
    ExplicitWidth = 686
    object buImpresion: TBitBtn [0]
      Left = 388
      Top = 26
      Width = 89
      Height = 29
      TabOrder = 5
    end
    inherited Panel1: TPanel
      Width = 686
      ExplicitWidth = 686
    end
  end
  inherited Panel2: TPanel
    Top = 431
    Width = 686
    ExplicitTop = 431
    ExplicitWidth = 686
  end
  inherited ibAyuda: TBitBtn
    Left = 479
    ExplicitLeft = 479
  end
  inherited ibImprimir: TBitBtn
    OnClick = ibImprimirClick
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
        Name = 'CLAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FECHA_ALTA'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_CANCELACION'
        DataType = ftDateTime
      end
      item
        Name = 'PROVEEDOR'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CUENTA_POR_PAGAR'
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'ALMACEN'
        DataType = ftInteger
      end
      item
        Name = 'IVA_PORC'
        DataType = ftFloat
      end
      item
        Name = 'IEPS_PORC'
        DataType = ftFloat
      end
      item
        Name = 'IMPUESTO1_PORC'
        DataType = ftFloat
      end
      item
        Name = 'IMPUESTO2_PORC'
        DataType = ftFloat
      end
      item
        Name = 'SUBTOTAL'
        DataType = ftFloat
      end
      item
        Name = 'IVA'
        DataType = ftFloat
      end
      item
        Name = 'IEPS'
        DataType = ftFloat
      end
      item
        Name = 'IMPUESTO1'
        DataType = ftFloat
      end
      item
        Name = 'IMPUESTO2'
        DataType = ftFloat
      end
      item
        Name = 'TOTAL'
        DataType = ftFloat
      end
      item
        Name = 'MONEDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CONSECUTIVO'
        DataType = ftInteger
      end
      item
        Name = 'ID_REFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'TABLA_REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY742'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN743'
        Fields = 'PROVEEDOR'
      end
      item
        Name = 'RDB$FOREIGN744'
        Fields = 'CUENTA_POR_PAGAR'
      end
      item
        Name = 'RDB$FOREIGN745'
        Fields = 'ALMACEN'
      end
      item
        Name = 'RDB$FOREIGN746'
        Fields = 'MONEDA'
      end
      item
        Name = 'RDB$FOREIGN747'
        Fields = 'USUARIO'
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_anticipos_proveedores.dsFuente
    StoreDefs = True
    TableName = 'ANTICIPOS_CXP'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
    end
    object TCapturarCLAVE: TIBStringField [1]
      FieldName = 'CLAVE'
    end
    object TCapturarFECHA_ALTA: TDateTimeField [2]
      FieldName = 'FECHA_ALTA'
    end
    object TCapturarFECHA_CANCELACION: TDateTimeField [3]
      FieldName = 'FECHA_CANCELACION'
    end
    object TCapturarPROVEEDOR: TIntegerField [4]
      FieldName = 'PROVEEDOR'
    end
    object TCapturarCUENTA_POR_PAGAR: TIntegerField [5]
      FieldName = 'CUENTA_POR_PAGAR'
    end
    object TCapturarOBSERVACIONES: TBlobField [6]
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object TCapturarALMACEN: TIntegerField [7]
      FieldName = 'ALMACEN'
    end
    object TCapturarIVA_PORC: TFloatField [8]
      FieldName = 'IVA_PORC'
    end
    object TCapturarIEPS_PORC: TFloatField [9]
      FieldName = 'IEPS_PORC'
    end
    object TCapturarIMPUESTO1_PORC: TFloatField [10]
      FieldName = 'IMPUESTO1_PORC'
    end
    object TCapturarIMPUESTO2_PORC: TFloatField [11]
      FieldName = 'IMPUESTO2_PORC'
    end
    object TCapturarSUBTOTAL: TFloatField [12]
      FieldName = 'SUBTOTAL'
    end
    object TCapturarIVA: TFloatField [13]
      FieldName = 'IVA'
    end
    object TCapturarIEPS: TFloatField [14]
      FieldName = 'IEPS'
    end
    object TCapturarIMPUESTO1: TFloatField [15]
      FieldName = 'IMPUESTO1'
    end
    object TCapturarIMPUESTO2: TFloatField [16]
      FieldName = 'IMPUESTO2'
    end
    object TCapturarTOTAL: TFloatField [17]
      FieldName = 'TOTAL'
    end
    object TCapturarMONEDA: TIntegerField [18]
      FieldName = 'MONEDA'
    end
    object TCapturarUSUARIO: TIntegerField [19]
      FieldName = 'USUARIO'
    end
    object TCapturarCONSECUTIVO: TIntegerField [20]
      FieldName = 'CONSECUTIVO'
    end
    object TCapturarID_REFERENCIA: TIntegerField [21]
      FieldName = 'ID_REFERENCIA'
    end
    object TCapturarTABLA_REFERENCIA: TIBStringField [22]
      FieldName = 'TABLA_REFERENCIA'
      Size = 50
    end
    object TCapturarESTATUS: TIBStringField [23]
      FieldName = 'ESTATUS'
    end
    object TCapturarproveedor_n: TStringField [24]
      FieldKind = fkCalculated
      FieldName = 'proveedor_n'
      Size = 100
      Calculated = True
    end
    object TCapturarcxp_saldo: TFloatField [25]
      FieldKind = fkCalculated
      FieldName = 'cxp_saldo'
      Calculated = True
    end
    object TCapturarcxp: TStringField [26]
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'cxp'
      Size = 30
      Calculated = True
    end
    object TCapturarmoneda_c: TStringField [27]
      FieldKind = fkLookup
      FieldName = 'moneda_c'
      LookupDataSet = TMonedas
      LookupKeyFields = 'ID'
      LookupResultField = 'CLAVE'
      KeyFields = 'MONEDA'
      Size = 10
      Lookup = True
    end
    object TCapturaralmacen_n: TStringField [28]
      FieldKind = fkLookup
      FieldName = 'almacen_n'
      LookupDataSet = TAlmacenes
      LookupKeyFields = 'ID'
      LookupResultField = 'NOMBRE'
      KeyFields = 'ALMACEN'
      Size = 100
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
        Value = 'ANTICIPOS_CXP'
      end>
  end
  object dsMonedas: TDataSource
    DataSet = TMonedas
    Left = 432
    Top = 367
  end
  object TMonedas: TIBTable
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
        Name = 'CLAVE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DESCRIPCION'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'FECHA_ULT_ACT'
        DataType = ftDateTime
      end
      item
        Name = 'PARIDAD'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY10'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'MONEDAS'
    UniDirectional = False
    Left = 400
    Top = 367
    object TMonedasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TMonedasCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Size = 10
    end
    object TMonedasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
    object TMonedasFECHA_ULT_ACT: TDateTimeField
      FieldName = 'FECHA_ULT_ACT'
    end
    object TMonedasPARIDAD: TFloatField
      FieldName = 'PARIDAD'
    end
  end
  object dsAlmacenes: TDataSource
    DataSet = TAlmacenes
    Left = 495
    Top = 367
  end
  object TAlmacenes: TIBTable
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
        Name = 'CLAVE'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'COMPRA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'VENDE'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'TRANSFORMA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FECHA_ALTA'
        DataType = ftDateTime
      end
      item
        Name = 'RESPONSABLE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'SERIE_FACTURA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CONSECUTIVO'
        DataType = ftInteger
      end
      item
        Name = 'FECHA_ULT_INV'
        DataType = ftDateTime
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SERIE_NC'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SERIE_NVENTA'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'SERIE_NCARGO'
        DataType = ftString
        Size = 10
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY73'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN74'
        Fields = 'RESPONSABLE'
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'ALMACENES'
    UniDirectional = False
    Left = 464
    Top = 367
    object TAlmacenesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TAlmacenesCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object TAlmacenesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object TAlmacenesCOMPRA: TIBStringField
      FieldName = 'COMPRA'
      Size = 2
    end
    object TAlmacenesVENDE: TIBStringField
      FieldName = 'VENDE'
      Size = 2
    end
    object TAlmacenesTRANSFORMA: TIBStringField
      FieldName = 'TRANSFORMA'
      Size = 2
    end
    object TAlmacenesFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
      DisplayFormat = 'dd/mmm/yyyy'
    end
    object TAlmacenesRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Required = True
    end
    object TAlmacenesOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object TAlmacenesSERIE_FACTURA: TIBStringField
      FieldName = 'SERIE_FACTURA'
      Size = 10
    end
    object TAlmacenesCONSECUTIVO: TIntegerField
      FieldName = 'CONSECUTIVO'
    end
    object TAlmacenesFECHA_ULT_INV: TDateTimeField
      FieldName = 'FECHA_ULT_INV'
    end
    object TAlmacenesESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
  end
  object qyImpuestosT: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM CALCULA_IMPUESTOS_T(:P_SUBTOTAL, :P_IVA_PORC, :P_IEPS_PORC,' +
        ' :P_IMPUESTO1_PORC, :P_IMPUESTO2_PORC)')
    Left = 336
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'P_SUBTOTAL'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IVA_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IEPS_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IMPUESTO1_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IMPUESTO2_PORC'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyImpuestosST: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM CALCULA_IMPUESTOS_ST(:P_TOTAL, :P_IVA_PORC, :P_IEPS_PORC, :' +
        'P_IMPUESTO1_PORC, :P_IMPUESTO2_PORC)')
    Left = 368
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'P_TOTAL'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IVA_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IEPS_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IMPUESTO1_PORC'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_IMPUESTO2_PORC'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyCuantos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT ID'
      'FROM ANTICIPOS'
      
        'WHERE (ID_REFERENCIA = :P_ID) AND (TABLA_REFERENCIA = '#39'ANTICIPOS' +
        #39')')
    Left = 568
    Top = 367
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyCuantosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ANTICIPOS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object ppImpresion: TPopupMenu
    OwnerDraw = True
    Left = 577
    Top = 24
    object itemImprimir: TMenuItem
      Caption = 'Imprimir Anticipo'
      ImageIndex = 0
      OnClick = itemImprimirClick
    end
    object itemPreview: TMenuItem
      Caption = 'Preview Anticipo'
      OnClick = itemPreviewClick
    end
  end
end
