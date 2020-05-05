inherited frmCapturar_anticipos: TfrmCapturar_anticipos
  Tag = 31
  Left = 427
  Top = 75
  Caption = 'Anticipos'
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
      Left = 485
      Top = 217
      ExplicitLeft = 485
      ExplicitTop = 217
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
      FocusControl = beCXC
    end
    object Label3: TLabel [6]
      Left = 8
      Top = 50
      Width = 66
      Height = 13
      Caption = 'C&liente (Enter)'
      Transparent = True
    end
    object Label21: TLabel [7]
      Left = 8
      Top = 90
      Width = 80
      Height = 13
      Caption = 'E&xtension (Enter)'
      FocusControl = beExtension
      Transparent = True
    end
    object Label19: TLabel [8]
      Left = 297
      Top = 50
      Width = 34
      Height = 13
      Caption = 'I.V.A.%'
      Transparent = True
    end
    object Label17: TLabel [9]
      Left = 389
      Top = 50
      Width = 41
      Height = 13
      Caption = 'I.EP.S.%'
      Transparent = True
    end
    object laImpuesto1Porc: TLabel [10]
      Left = 297
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Impuesto 1%'
      Transparent = True
    end
    object laImpuesto2Porc: TLabel [11]
      Left = 389
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Impuesto 2%'
      Transparent = True
    end
    object Label13: TLabel [12]
      Left = 199
      Top = 176
      Width = 60
      Height = 13
      Caption = 'Saldo Actual'
    end
    object Label12: TLabel [13]
      Left = 580
      Top = 134
      Width = 39
      Height = 13
      Caption = '&Moneda'
      Transparent = True
    end
    object Label4: TLabel [14]
      Left = 8
      Top = 134
      Width = 24
      Height = 13
      Caption = 'Total'
    end
    object Label6: TLabel [15]
      Left = 103
      Top = 134
      Width = 46
      Height = 13
      Caption = 'Sub-Total'
    end
    object Label8: TLabel [16]
      Left = 199
      Top = 134
      Width = 26
      Height = 13
      Caption = 'I.V.A.'
    end
    object Label9: TLabel [17]
      Left = 294
      Top = 134
      Width = 36
      Height = 13
      Caption = 'I.E.P.S.'
    end
    object Label10: TLabel [18]
      Left = 389
      Top = 134
      Width = 52
      Height = 13
      Caption = 'Impuesto 1'
    end
    object Label11: TLabel [19]
      Left = 485
      Top = 134
      Width = 52
      Height = 13
      Caption = 'Impuesto 2'
    end
    object laCtaContable: TLabel [20]
      Left = 296
      Top = 176
      Width = 31
      Height = 13
      Caption = 'Banco'
      FocusControl = cbBancos
      Transparent = True
    end
    object Label14: TLabel [21]
      Left = 485
      Top = 176
      Width = 34
      Height = 13
      Caption = 'Cuenta'
      FocusControl = cbBancos
      Transparent = True
    end
    inherited buAplicar: TBitBtn
      Left = 643
      Top = 233
      TabOrder = 28
      ExplicitLeft = 643
      ExplicitTop = 233
    end
    object deCliente: TDBEdit [23]
      Left = 8
      Top = 66
      Width = 283
      Height = 21
      TabStop = False
      Color = clBackground
      DataField = 'cliente_n'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    inherited edHEstatus: TDBEdit
      Left = 501
      Top = 233
      Width = 141
      TabOrder = 27
      ExplicitLeft = 501
      ExplicitTop = 233
      ExplicitWidth = 141
    end
    inherited cbHEstatus: TDBLookupComboBox
      Left = 485
      Top = 233
      TabOrder = 26
      ExplicitLeft = 485
      ExplicitTop = 233
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
      TabOrder = 5
    end
    object beCXC: TDBEdit
      Left = 8
      Top = 192
      Width = 185
      Height = 21
      DataField = 'cxc'
      DataSource = dsFuente
      TabOrder = 20
      OnKeyPress = beCXCKeyPress
    end
    object edCliente: TEdit
      Left = 8
      Top = 66
      Width = 283
      Height = 21
      TabOrder = 7
      Visible = False
      OnKeyPress = edClienteKeyPress
    end
    object beExtension: TDBEdit
      Left = 8
      Top = 108
      Width = 283
      Height = 21
      DataField = 'extension_n'
      DataSource = dsFuente
      TabOrder = 8
      OnKeyPress = beExtensionKeyPress
    end
    object ceIVAPorc: TDBEdit
      Left = 297
      Top = 66
      Width = 90
      Height = 21
      DataField = 'IVA_PORC'
      DataSource = dsFuente
      TabOrder = 9
      OnChange = ceIVAPorcChange
    end
    object ceIEPSPorc: TDBEdit
      Left = 389
      Top = 66
      Width = 90
      Height = 21
      DataField = 'IEPS_PORC'
      DataSource = dsFuente
      TabOrder = 10
      OnChange = ceIEPSPorcChange
    end
    object ceImpuesto1Porc: TDBEdit
      Left = 297
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IMPUESTO1_PORC'
      DataSource = dsFuente
      TabOrder = 11
      OnChange = ceImpuesto1PorcChange
    end
    object ceImpuesto2Porc: TDBEdit
      Left = 389
      Top = 108
      Width = 90
      Height = 21
      DataField = 'IMPUESTO2_PORC'
      DataSource = dsFuente
      TabOrder = 12
      OnChange = ceImpuesto2PorcChange
    end
    object deSaldo: TDBEdit
      Left = 199
      Top = 192
      Width = 90
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'cxc_saldo'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 21
    end
    object edTotal: TDBEdit
      Left = 8
      Top = 150
      Width = 90
      Height = 21
      DataField = 'TOTAL'
      DataSource = dsFuente
      TabOrder = 13
      OnChange = edTotalChange
    end
    object edSubTotal: TDBEdit
      Left = 103
      Top = 150
      Width = 90
      Height = 21
      DataField = 'SUBTOTAL'
      DataSource = dsFuente
      TabOrder = 14
      OnChange = edSubTotalChange
    end
    object edIVA: TDBEdit
      Left = 199
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IVA'
      DataSource = dsFuente
      TabOrder = 15
    end
    object edIEPS: TDBEdit
      Left = 297
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IEPS'
      DataSource = dsFuente
      TabOrder = 16
    end
    object edImpuesto1: TDBEdit
      Left = 389
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IMPUESTO1'
      DataSource = dsFuente
      TabOrder = 17
    end
    object edImpuesto2: TDBEdit
      Left = 485
      Top = 150
      Width = 90
      Height = 21
      DataField = 'IMPUESTO2'
      DataSource = dsFuente
      TabOrder = 18
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
      TabOrder = 19
    end
    object cbRetencion: TDBEdit
      Left = 597
      Top = 0
      Width = 73
      Height = 21
      AutoSize = False
      DataField = 'RETENCION'
      DataSource = dsFuente
      TabOrder = 4
    end
    object cbBancos: TDBLookupComboBox
      Left = 296
      Top = 192
      Width = 138
      Height = 21
      DataField = 'BANCO'
      DataSource = dsFuente
      DropDownWidth = 250
      TabOrder = 22
    end
    object buActBancos: TBitBtn
      Left = 435
      Top = 192
      Width = 22
      Height = 21
      Glyph.Data = {
        26050000424D26050000000000003604000028000000100000000F0000000100
        080000000000F0000000130B0000130B00000001000000000000F0F0F0000E10
        100000000000B2B2B200303030008D9E8F00C4E9CC0028292900A1A1A1005151
        5100748D77009CD5A3008CBE8C0040404000818181006061600037373700AFD7
        B20080B68000415A4000C1C1C100B7E0BD0062756400D0D0D0002020200078AD
        72009BC29E0066A56500569B4F003F793300171A1B0048484700E1E1E1007070
        7000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
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
        00000000000000000000000000000000000000000000000000000B0B0B0E0208
        0B0B0B0B0B0B0B0B0B0B0B0B0B210A07080B0B0B0B0B0B0B0B0B0B0B0B201E15
        07030B0B0B0B0B0B0B0B0B0B0B0B090C1A1E170B0B0B0B0B0B0B0B0B0B0B141F
        061D1E170B0B0B0B0B0B0B0B0B0B0B18110C1D1E170B0B0B0B0B0B0B0B0B0B08
        0F151C1D1E170B0B0B0B040202020202011C1C1C1D1E170B0B0B00181A060C12
        19191B1B1C1D1E170B0B0B171811150C1219190C06061A04000B0B0B14071515
        0C1216020202020204000B0B0B081006110C12130F0B0B0B0B0B0B0B0B0B0F09
        060B0C0C0D0F0B0B0B0B0B0B0B0B0004050606060607080B0B0B0B0B0B0B0B00
        01020202020202030B0B}
      TabOrder = 23
      OnClick = buActBancosClick
    end
    object buLimCtas: TBitBtn
      Left = 458
      Top = 192
      Width = 22
      Height = 21
      Glyph.Data = {
        D6020000424DD6020000000000003600000028000000100000000E0000000100
        180000000000A002000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95DF9588D78845816F63AB7CFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6EC291409A602A
        8F9F28698F2580B61C729455BD60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF95DF954AAB603594B451A3BF4AB1E253BBE450BCEF1C7CC2155F7871D4
        71FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA6E4A6207D7C4691B163CDF845B0E450
        BCF955C2F440AADF44A8DA1A82CF155F7855BD60FFFFFFFFFFFFFFFFFF71D471
        207D7C206F916AD2F447AFF45AC8F950BCF940AAF455C2F44FB4E53AA4D90054
        AA409A60B8E9B8FFFFFF78C883388F916DD1F166D4F156BAF14BAEF44AAEF154
        BAFF53BBEB53BBEB4AA3E14093DD3D88D2054E966EB683FFFFFF15788A2382AD
        2E94BF2089BF48B3E953BFF44AB6FF40AAE950BCEF3AA4D9407ECB3587CF4577
        CF0547AF20656091CF9195D28AB1D2A6FFFFFFFFFFFF4197AB288BB645B1E445
        99D9357CC92A65BF4887CF306BC440AADF40AADF0054AA588A7FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFA8DACB4C8EA4458ED9357CC92A65BF3D92DA50BCF940AA
        F440AADF0054AA5F8A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A
        76A43181D46DD1FF60CFEA40AAF450BCF9258DD90A5A91669C7FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9DD2C154AFD44AAEE942ABD83886B7528C
        BA36598B4AAB60ADDFB1FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFB4BBB49FA79F9B999B3F5663606540FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1E2C6677D5C7CC1
        CA3C9BDF3C332798AF8DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF95DF958A8F8A8A8F8ADBBBBB95BB8A}
      TabOrder = 24
      OnClick = buLimCtasClick
    end
    object deCuenta: TDBEdit
      Left = 485
      Top = 192
      Width = 185
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
      TabOrder = 25
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
        Name = 'CLIENTE'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'EXTENSION'
        DataType = ftInteger
      end
      item
        Name = 'CUENTA_POR_COBRAR'
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
        Name = 'RETENCION'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'RETENCION_IVA'
        DataType = ftFloat
      end
      item
        Name = 'BANCO'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY720'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN721'
        Fields = 'CLIENTE'
      end
      item
        Name = 'RDB$FOREIGN722'
        Fields = 'EXTENSION'
      end
      item
        Name = 'RDB$FOREIGN723'
        Fields = 'CUENTA_POR_COBRAR'
      end
      item
        Name = 'RDB$FOREIGN724'
        Fields = 'ALMACEN'
      end
      item
        Name = 'RDB$FOREIGN725'
        Fields = 'MONEDA'
      end
      item
        Name = 'RDB$FOREIGN726'
        Fields = 'USUARIO'
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_anticipos.dsFuente
    StoreDefs = True
    TableName = 'ANTICIPOS'
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
    object TCapturarCLIENTE: TIntegerField [4]
      FieldName = 'CLIENTE'
    end
    object TCapturarEXTENSION: TIntegerField [5]
      FieldName = 'EXTENSION'
    end
    object TCapturarCUENTA_POR_COBRAR: TIntegerField [6]
      FieldName = 'CUENTA_POR_COBRAR'
    end
    object TCapturarOBSERVACIONES: TBlobField [7]
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object TCapturarALMACEN: TIntegerField [8]
      FieldName = 'ALMACEN'
    end
    object TCapturarIVA_PORC: TFloatField [9]
      FieldName = 'IVA_PORC'
    end
    object TCapturarIEPS_PORC: TFloatField [10]
      FieldName = 'IEPS_PORC'
    end
    object TCapturarIMPUESTO1_PORC: TFloatField [11]
      FieldName = 'IMPUESTO1_PORC'
    end
    object TCapturarIMPUESTO2_PORC: TFloatField [12]
      FieldName = 'IMPUESTO2_PORC'
    end
    object TCapturarSUBTOTAL: TFloatField [13]
      FieldName = 'SUBTOTAL'
    end
    object TCapturarIVA: TFloatField [14]
      FieldName = 'IVA'
    end
    object TCapturarIEPS: TFloatField [15]
      FieldName = 'IEPS'
    end
    object TCapturarIMPUESTO1: TFloatField [16]
      FieldName = 'IMPUESTO1'
    end
    object TCapturarIMPUESTO2: TFloatField [17]
      FieldName = 'IMPUESTO2'
    end
    object TCapturarTOTAL: TFloatField [18]
      FieldName = 'TOTAL'
    end
    object TCapturarMONEDA: TIntegerField [19]
      FieldName = 'MONEDA'
    end
    object TCapturarUSUARIO: TIntegerField [20]
      FieldName = 'USUARIO'
    end
    object TCapturarCONSECUTIVO: TIntegerField [21]
      FieldName = 'CONSECUTIVO'
    end
    object TCapturarID_REFERENCIA: TIntegerField [22]
      FieldName = 'ID_REFERENCIA'
    end
    object TCapturarTABLA_REFERENCIA: TIBStringField [23]
      FieldName = 'TABLA_REFERENCIA'
      Size = 50
    end
    object TCapturarESTATUS: TIBStringField [24]
      FieldName = 'ESTATUS'
    end
    object TCapturarRETENCION: TIBStringField [25]
      FieldName = 'RETENCION'
      FixedChar = True
      Size = 2
    end
    object TCapturarRETENCION_IVA: TFloatField [26]
      FieldName = 'RETENCION_IVA'
    end
    object TCapturarBANCO: TIntegerField [27]
      FieldName = 'BANCO'
    end
    object TCapturaralmacen_n: TStringField
      FieldKind = fkLookup
      FieldName = 'almacen_n'
      LookupDataSet = TAlmacenes
      LookupKeyFields = 'ID'
      LookupResultField = 'NOMBRE'
      KeyFields = 'ALMACEN'
      Size = 100
      Lookup = True
    end
    object TCapturarmoneda_c: TStringField
      FieldKind = fkLookup
      FieldName = 'moneda_c'
      LookupDataSet = TMonedas
      LookupKeyFields = 'ID'
      LookupResultField = 'CLAVE'
      KeyFields = 'MONEDA'
      Size = 10
      Lookup = True
    end
    object TCapturarcliente_n: TStringField
      FieldKind = fkCalculated
      FieldName = 'cliente_n'
      Size = 100
      Calculated = True
    end
    object TCapturarextension_n: TStringField
      FieldKind = fkCalculated
      FieldName = 'extension_n'
      Size = 100
      Calculated = True
    end
    object TCapturarcxc: TStringField
      FieldKind = fkCalculated
      FieldName = 'cxc'
      Size = 30
      Calculated = True
    end
    object TCapturarcxc_saldo: TFloatField
      FieldKind = fkCalculated
      FieldName = 'cxc_saldo'
      Calculated = True
    end
    object TCapturarcuenta: TStringField
      FieldKind = fkCalculated
      FieldName = 'cuenta'
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
        Value = 'ANTICIPOS'
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
      end
      item
        Name = 'PARIDAD_FALSA'
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
      end
      item
        Name = 'CUENTA'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <
      item
        Name = 'RDB$FOREIGN730'
        Fields = 'CUENTA'
      end
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
  object qyBancos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT SB.ID, S.CLAVE, S.NOMBRE, RAZON_SOCIAL, SB.CUENTA, SB.SUC' +
        'URSAL'
      'FROM SUJETOS_BANCOS SB, SUJETOS S'
      'WHERE (SB.SUJETO = S.ID)')
    Left = 344
    Top = 242
    object qyBancosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyBancosCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Size = 50
    end
    object qyBancosNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyBancosRAZON_SOCIAL: TIBStringField
      FieldName = 'RAZON_SOCIAL'
      Size = 100
    end
    object qyBancosCUENTA: TIBStringField
      FieldName = 'CUENTA'
      Size = 50
    end
    object qyBancosSUCURSAL: TIBStringField
      FieldName = 'SUCURSAL'
      Size = 50
    end
    object qyBancosnombre_corto: TStringField
      FieldKind = fkCalculated
      FieldName = 'nombre_corto'
      Size = 25
      Calculated = True
    end
  end
  object dsBancos: TDataSource
    DataSet = qyBancos
    Left = 376
    Top = 242
  end
end
