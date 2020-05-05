inherited frmCapturar_prepolizas: TfrmCapturar_prepolizas
  Left = 473
  Top = 282
  Caption = 'Pre-Polizas'
  ClientHeight = 442
  ClientWidth = 775
  ExplicitWidth = 791
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 775
    Height = 58
    Align = alTop
    ExplicitWidth = 774
    ExplicitHeight = 58
    object Label7: TLabel
      Left = 8
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Cla&ve'
      FocusControl = edClave
      Transparent = True
    end
    object Label1: TLabel
      Left = 138
      Top = 6
      Width = 56
      Height = 13
      Caption = 'Descripcion'
      FocusControl = edDescripcion
      Transparent = True
    end
    object Label33: TLabel
      Left = 512
      Top = 6
      Width = 35
      Height = 13
      Caption = 'E&status'
      FocusControl = cbEstatus
      Transparent = True
    end
    object edClave: TDBEdit
      Left = 8
      Top = 22
      Width = 126
      Height = 21
      CharCase = ecUpperCase
      DataField = 'CLAVE'
      DataSource = dsFuente
      TabOrder = 0
    end
    object edDescripcion: TDBEdit
      Left = 138
      Top = 22
      Width = 370
      Height = 21
      CharCase = ecUpperCase
      DataField = 'DESCRIPCION'
      DataSource = dsFuente
      TabOrder = 1
    end
    object cbEstatus: TDBEdit
      Left = 512
      Top = 22
      Width = 116
      Height = 21
      DataField = 'ESTATUS'
      DataSource = dsFuente
      TabOrder = 2
    end
  end
  inherited fpPadre: TPanel
    Width = 775
    ExplicitWidth = 774
    inherited Panel1: TPanel
      Width = 775
      ExplicitWidth = 774
    end
  end
  inherited Panel2: TPanel
    Top = 420
    Width = 775
    ExplicitTop = -22
    ExplicitWidth = 774
  end
  object dgPartidas: TDBGrid [3]
    Left = 0
    Top = 176
    Width = 775
    Height = 244
    Align = alClient
    Color = clInfoBk
    DataSource = dsPartidas
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object paItems: TPanel [4]
    Tag = 60
    Left = 0
    Top = 118
    Width = 775
    Height = 58
    Align = alTop
    BevelOuter = bvNone
    Color = 14933717
    TabOrder = 8
    ExplicitWidth = 774
    object ibNuevaPartida: TBitBtn
      Left = 4
      Top = 20
      Width = 75
      Height = 34
      Cursor = crHandPoint
      Hint = 'Nuevo'
      Caption = 'F7 Nuevo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000120B0000120B000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0203FE1921F80000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF2440EC2D50F90000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0C38F32749FB0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF3C3BFF2426FE3776EC2445
        FB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0505FFE5E5FAFFFFFFEBF1F74C97
        EB2749FA0C0BFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF4C4CFBFFFFF7FDFDFCFFFFFDEEF4
        F860C4E57DB5F5ACA9FB5150FE1515FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFC3C3F5FDFDF9FBFBFBFAFAFAFFFD
        FBEDF2F555B9E49AE2F2FFFFF7E7E7F8C0C1F86E6EFB2424FE0202FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF2C2CFDEBEBF4FBFBFBFCFCFCFCFCFCFBFB
        FBFFFEFBECF2F554B9E592DAF1FFFAF6FBF9F5FFFFF4FFFFF3D2D2F68C8CF93F
        3FFC0B0BFF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFA1A1F8FEFEF8FBFBFBF7F7F7F8F8F8FBFB
        FBFCFCFCFFFFFDEEF4F855B9E692DAF1FFF9F6F6F4F4F2F3F3F4F4F2FAFAF1FF
        FFF1E2E2F2A7A7F55858FA1A1AFE0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF1818FEE9E9F5FCFCFCFBFBFBF8F8F8F6F6F6F4F4
        F4F5F5F5F7F7F7FFFDFBEEF4F856BAE695DCF3FFFDFAF9F8F8F5F5F5F2F2F2F1
        F1F1F1F1F0F6F6F0FEFEF0EFEFEF4949FA0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF7C7CFAFFFFF8FDFDFDFAFAFAF5F5F5F7F7F8FBFB
        FCF9F9FAF7F7F7F5F5F5FAF7F5ECEFF253B7E394DCF3FFFFFCFEFCFCFAFAFAF8
        F8F8F4F4F4F2F2F2EFEFEFFDFDEE4D4DFA0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0808FFE0E0F6FDFDFBFBFBFBF6F6F6F9F9F9F8F8F7ECEB
        E6F5F6F8FAFCFFFCFDFFFBFBFCFFFCFAE8EFF254B8E594DCF3FFFBF8FCFBFAFC
        FCFCFCFCFCFBFBFBF8F8F8FEFEF44E4EFB0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF5E5EFCFFFFF8FCFCFCFAFAFAF8F8F8FBFCFED9D0B8B7A0
        61C3B182D1C6A8E1DCCEEEEDEBF7F8FBFFFFFFF0F6FC56BAE790D8EFFDF7F4F6
        F5F4F6F6F6F9F9F9FCFCFBE1E1FC1919FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFCDCDF8FEFEFBFDFDFDF8F8F8F7F8F9EDEBE5BFA96DBCA1
        57BB9F55B79C53B79E59BBA66CC6B68BD4CBB1EBE3D7E3E8EC56BCEC98E1FBFF
        FDFAFAF9F8F6F6F6FFFFFA8484FD0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF3939FDFFFFF9FEFEFEFAFAFAF7F7F8FAFAFACCBD93BFA55DC0A7
        61BFA660BFA55EBEA45CBDA25ABA9F55B89D54B79F5DC4AD74BFB49042A1BF95
        DEF8FCF6F2FFFFFFDEDFFF0A0AFF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFB1B1FAFFFFFCFDFDFDF9F9F9FCFDFFDBD2BAC2AA66C5AD69C4AB
        68C4AB67C3AA66C2A864C0A762C0A660BFA55FBFA55DBDA259C0A154B39D5C45
        A2BB88CEE0DDCCA0938DCE0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF1F1FFEE5E5FAFDFDFDFCFCFCFBFBFDE5E1D7C7B278CAB371C9B271C8B1
        70C7B06EC6AE6CC6AD6AC5AC69C4AB67C3AA66C2A964C1A862C0A762C5A75CB6
        9F5D45A3BD81C1C1BFA058AC9465887681110FEF0000FF0000FF0000FF0000FF
        0000FF8D8DFCFFFFFCFEFEFEFAFBFCEEEDE9CEBC8BCFB879CFB87ACDB778CCB6
        77CCB575CBB473CAB272C9B170C8B06EC7AF6DC6AE6BC6AD6AC5AC68C3AB67C8
        AA62B9A36248A7C285C4C3CEB15CC6AA5F0807F90000FF0000FF0000FF0000FF
        0D0DFFE3E3FBFFFFFEFEFEFFF5F5F3D3C59DD4BE81D4BF84D3BE82D2BC80D1BB
        7FD0BA7DCFB97BCEB879CDB678CCB576CBB474CAB372C9B271C8B06FC7AF6DC7
        AF6DCCAE67BDA9694C9CB76CA6A5322DDB0000FF0000FF0000FF0000FF0000FF
        6A6AFDFFFFFCFFFFFFFAFAFAD6CAA9D8C38ADAC68ED9C58CD8C48AD7C289D6C1
        87D4BF84D3BE83D3BD81D2BC7FD1BB7DCFB97CCEB87ACDB778CDB677CCB575CC
        B576CAB271CEB36FC7AC67375DB60715F90000FF0000FF0000FF0000FF0202FF
        D5D5FCFFFFFFFDFDFED9CFB4DCC993E0CD98DFCC96DECA94DCC992DBC890DAC6
        8ED9C58DD8C48BD7C389D6C187D5BF85D4BF83D3BE82D2BC80D1BB7ED0BA7DD0
        B97CCFB87AD2BB75C6AF810808FA0000FF0000FF0000FF0000FF0000FF3C3CFF
        FFFFFEFEFEFFDFD6BEE0CE9BE6D4A1E4D29FE3D19DE1CF9CE0CE9AE0CD98DFCC
        96DECB95DDCA93DBC891DBC78FDAC68ED9C58CD8C38AD6C288D5C186D6C186D4
        BF82D5BF81DAC37D1B19EF0000FF0000FF0000FF0000FF0000FF0000FF5555FF
        FFFFFFE2DAC2E4D3A3EBDBAAE8D8A8E8D7A6E7D6A4E6D5A3E5D4A2E4D3A0E3D1
        9EE2D09CE1CF9BE0CE99E0CD97DECC95DDCA93DCC992DBC890DBC790DAC58DD8
        C58BE4CE83524AD40000FF0000FF0000FF0000FF0000FF0000FF0000FF5656FD
        F4ECC4E8D8AAF0E0B3EEDDB0EDDDAFECDCADEBDBACEADAAAE9D9A9E8D8A7E8D7
        A5E7D6A4E6D4A2E5D3A0E4D29FE2D09DE2CF9BE1CE9AE0CD98E0CD98DDCA94E9
        D58E9084BB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF3937EE
        F1E3B2FFF3B9FFF1B5FAEBB5F3E4B5F0E1B4EFDFB2EEDEB1EDDEB0EDDDAEECDC
        ADEBDBABEAD9A9E9D8A7E8D7A6E7D6A5E6D5A3E5D4A1E5D3A1E3D19EEDDA99C6
        B6AA0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0403FE2220F7635EE6BCB1CEF2E4BDFFF2B8FFF2B6FAEBB6F3E4B6F0E1B4EFE0
        B3EEDFB1EEDEB0EDDDAFECDDADECDBABEADAAAEAD9A9E9D8A8F1DFA2D8C8AC04
        04FE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0404FE2423F66A64E4C3B7CDF4E6BDFFF3B7FFF2
        B6FAEBB7F3E4B6F1E2B5EFE0B3EFDFB2EEDFB1EEDEB1F5E4ABE6D6B10808FC00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0505FE2625F56E68
        E4C6BBCBF6E8BDFFF4B8FFF2B7FAEBB7F4E4B7F9EAB4ECDDB80F0EFA0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0606FE2B29F5736EE3CDC3CAFBEEBDEFE1BE1110FB0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0909FD0606FE0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ibNuevaPartidaClick
    end
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_prepolizas.dsFuente
    TableName = 'PREPOLIZAS'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
    end
    object TCapturarCLAVE: TIBStringField [1]
      FieldName = 'CLAVE'
    end
    object TCapturarDESCRIPCION: TIBStringField [2]
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object TCapturarESTATUS: TIBStringField [3]
      FieldName = 'ESTATUS'
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
        Value = 'PREPOLIZAS'
      end>
  end
  object qyPartidas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFuente
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM TL_PARTIDAS_PREPOLIZAS(:ID)')
    Left = 294
    Top = 366
    ParamData = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptUnknown
      end>
    object qyPartidasR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_ID'
    end
    object qyPartidasR_PREPOLIZA: TIntegerField
      FieldName = 'R_PREPOLIZA'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_PREPOLIZA'
    end
    object qyPartidasR_CUENTA_CONTABLE: TIntegerField
      FieldName = 'R_CUENTA_CONTABLE'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_CUENTA_CONTABLE'
    end
    object qyPartidasR_CUENTA_CONTABLE_C: TIBStringField
      FieldName = 'R_CUENTA_CONTABLE_C'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_CUENTA_CONTABLE_C'
    end
    object qyPartidasR_CUENTA_CONTABLE_N: TIBStringField
      FieldName = 'R_CUENTA_CONTABLE_N'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_CUENTA_CONTABLE_N'
      Size = 100
    end
    object qyPartidasR_CARGO_ABONO: TIBStringField
      FieldName = 'R_CARGO_ABONO'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_CARGO_ABONO'
      Size = 1
    end
    object qyPartidasR_TIPO_A_D: TIBStringField
      FieldName = 'R_TIPO_A_D'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_TIPO_A_D'
      Size = 1
    end
    object qyPartidasR_PORCENTAJE: TFloatField
      FieldName = 'R_PORCENTAJE'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_PORCENTAJE'
      DisplayFormat = '##0.00 %'
    end
    object qyPartidasR_TRAER_PROVEEDOR: TIBStringField
      FieldName = 'R_TRAER_PROVEEDOR'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_TRAER_PROVEEDOR'
      Size = 2
    end
    object qyPartidasR_ORDEN: TIntegerField
      FieldName = 'R_ORDEN'
      Origin = 'TL_PARTIDAS_PREPOLIZAS.R_ORDEN'
    end
  end
  object dsPartidas: TDataSource
    DataSet = qyPartidas
    Left = 326
    Top = 366
  end
  object spE_PREPOLIZA_DET: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'E_PREPOLIZA_DET'
    Left = 376
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end>
  end
end
