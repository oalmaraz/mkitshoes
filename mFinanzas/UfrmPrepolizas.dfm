object frmPrepolizas: TfrmPrepolizas
  Left = 390
  Top = 240
  ActiveControl = cbCtasContables
  Caption = 'Pre-Poliza'
  ClientHeight = 325
  ClientWidth = 279
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object laCtaContable: TLabel
    Left = 8
    Top = 15
    Width = 79
    Height = 13
    Caption = 'Cuenta Contable'
    FocusControl = cbCtasContables
    Transparent = True
  end
  object Label2: TLabel
    Left = 111
    Top = 75
    Width = 106
    Height = 13
    Caption = 'C = Cargo, A = Abono.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 111
    Top = 131
    Width = 117
    Height = 13
    Caption = 'A = Antes, D = Despues.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
  end
  object Label4: TLabel
    Left = 197
    Top = 15
    Width = 51
    Height = 13
    Caption = 'Porcentaje'
    Transparent = True
  end
  object Label7: TLabel
    Left = 8
    Top = 225
    Width = 29
    Height = 13
    Caption = 'Orden'
    Transparent = True
  end
  object cbCtasContables: TDBLookupComboBox
    Left = 8
    Top = 30
    Width = 137
    Height = 21
    DropDownWidth = 250
    TabOrder = 0
  end
  object buActCtas: TBitBtn
    Left = 146
    Top = 30
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
    TabOrder = 1
    OnClick = buActCtasClick
  end
  object buLimCtas: TBitBtn
    Left = 169
    Top = 30
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
    TabOrder = 2
    OnClick = buLimCtasClick
  end
  object edPorcentaje: TEdit
    Left = 197
    Top = 30
    Width = 68
    Height = 21
    TabOrder = 3
  end
  object paBotones: TPanel
    Left = 0
    Top = 286
    Width = 279
    Height = 39
    Align = alBottom
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    ExplicitTop = 291
    ExplicitWidth = 287
    object buGuardar: TBitBtn
      Left = 113
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = buGuardarClick
    end
    object buCancelar: TBitBtn
      Left = 193
      Top = 8
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = buCancelarClick
    end
  end
  object edOrden: TEdit
    Left = 8
    Top = 240
    Width = 65
    Height = 21
    TabOrder = 8
  end
  object rgTipo: TRadioGroup
    Left = 8
    Top = 57
    Width = 97
    Height = 49
    Caption = 'Tipo'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'C'
      'A')
    TabOrder = 5
  end
  object rgImpuestos: TRadioGroup
    Left = 8
    Top = 113
    Width = 97
    Height = 49
    Caption = 'Aplicar Impuestos'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'A'
      'D')
    TabOrder = 6
  end
  object rgProveedores: TRadioGroup
    Left = 8
    Top = 169
    Width = 97
    Height = 49
    Caption = 'Buscar Proveedor'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'No'
      'Si')
    TabOrder = 7
  end
  object qyCuentas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CUENTAS_CONTABLES'
      'ORDER BY CUENTA')
    Left = 118
    Top = 13
  end
  object dsCuentas: TDataSource
    DataSet = qyCuentas
    Left = 150
    Top = 13
  end
  object spA_PREPOLIZA_DET: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'A_PREPOLIZA_DET'
    Left = 128
    Top = 176
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
      end
      item
        DataType = ftInteger
        Name = 'P_CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_CARGO_ABONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TIPO_A_D'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_PORCENTAJE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TRAER_PROVEEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ORDEN'
        ParamType = ptInput
      end>
  end
  object spM_PREPOLIZA_DET: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'M_PREPOLIZA_DET'
    Left = 192
    Top = 176
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
      end
      item
        DataType = ftInteger
        Name = 'P_CC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_CARGO_ABONO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TIPO_A_D'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_PORCENTAJE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_TRAER_PROVEEDOR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ORDEN'
        ParamType = ptInput
      end>
  end
end
