inherited frmCapturar_cheques: TfrmCapturar_cheques
  Tag = 8
  Left = 310
  Top = 157
  Caption = 'Cheques Recibidos'
  ClientHeight = 565
  ClientWidth = 887
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 887
    Height = 132
    Align = alTop
    ExplicitWidth = 887
    ExplicitHeight = 132
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object Label2: TLabel
      Left = 101
      Top = 5
      Width = 82
      Height = 13
      Caption = 'Fecha Aplicacion'
    end
    object Label3: TLabel
      Left = 194
      Top = 5
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 287
      Top = 5
      Width = 52
      Height = 13
      Caption = 'Referencia'
    end
    object Label5: TLabel
      Left = 452
      Top = 5
      Width = 58
      Height = 13
      Caption = 'Autorizacion'
    end
    object Label6: TLabel
      Left = 287
      Top = 47
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    object Label8: TLabel
      Left = 8
      Top = 88
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label10: TLabel
      Left = 8
      Top = 47
      Width = 31
      Height = 13
      Caption = 'Banco'
    end
    object Label11: TLabel
      Left = 288
      Top = 88
      Width = 46
      Height = 13
      Caption = 'Extension'
      Transparent = True
    end
    object Label12: TLabel
      Left = 601
      Top = 5
      Width = 71
      Height = 13
      Caption = 'Observaciones'
    end
    object deTipo: TDBComboBox
      Left = 194
      Top = 20
      Width = 89
      Height = 21
      DataField = 'TIPO'
      DataSource = dsFuente
      Items.Strings = (
        'Ventas'
        'Pagos'
        'Desconocido')
      TabOrder = 2
    end
    object deReferencia: TDBEdit
      Left = 287
      Top = 21
      Width = 161
      Height = 21
      DataField = 'REFERENCIA'
      DataSource = dsFuente
      TabOrder = 3
    end
    object deAutorizacion: TDBEdit
      Left = 452
      Top = 21
      Width = 145
      Height = 21
      DataField = 'AUTORIZACION'
      DataSource = dsFuente
      TabOrder = 4
    end
    object deMonto: TDBEdit
      Left = 287
      Top = 62
      Width = 105
      Height = 21
      DataField = 'MONTO'
      DataSource = dsFuente
      TabOrder = 7
    end
    object deFechaAlta: TDBEdit
      Left = 8
      Top = 20
      Width = 89
      Height = 21
      DataField = 'FECHA_ALTA'
      DataSource = dsFuente
      TabOrder = 0
    end
    object deFechaAplicacion: TDBEdit
      Left = 101
      Top = 20
      Width = 89
      Height = 21
      DataField = 'FECHA_APLICACION'
      DataSource = dsFuente
      TabOrder = 1
    end
    object dmObservaciones: TDBMemo
      Left = 601
      Top = 21
      Width = 170
      Height = 103
      DataField = 'OBSERVACIONES'
      DataSource = dsFuente
      TabOrder = 5
    end
    object cbBancos: TDBLookupComboBox
      Left = 8
      Top = 62
      Width = 275
      Height = 21
      DataField = 'BANCO'
      DataSource = dsFuente
      KeyField = 'R_ID'
      ListField = 'R_NOMBRE'
      ListSource = dsBancos
      TabOrder = 6
    end
    object deCliente: TDBEdit
      Left = 8
      Top = 103
      Width = 275
      Height = 21
      DataField = 'CLIENTE_NOMBRE'
      DataSource = dsFuente
      TabOrder = 8
    end
    object deExtension: TDBEdit
      Left = 288
      Top = 103
      Width = 275
      Height = 21
      DataField = 'EXTENSION_NOMBRE'
      DataSource = dsFuente
      TabOrder = 9
    end
  end
  inherited fpPadre: TPanel
    Width = 887
    ExplicitWidth = 887
    object Label18: TLabel [0]
      Left = 658
      Top = 21
      Width = 35
      Height = 13
      Caption = 'Estatus'
      Transparent = True
    end
    object laPanel: TBitBtn [1]
      Left = 514
      Top = 2
      Width = 143
      Height = 16
      Cursor = crHandPoint
      Caption = 'Mostrar Panel Agrupar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
    end
    inherited Panel1: TPanel
      Width = 887
      ExplicitWidth = 887
    end
    inherited ibNuevo: TBitBtn
      Left = 2
      ExplicitLeft = 2
    end
    inherited ibModificar: TBitBtn
      Left = 79
      ExplicitLeft = 79
    end
    inherited ibGuardar: TBitBtn
      Left = 156
      ExplicitLeft = 156
    end
    object ibPantalla: TBitBtn
      Left = 541
      Top = 23
      Width = 55
      Height = 34
      Hint = 'Cheques'
      Caption = 'Cheques'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = ibPantallaClick
    end
    object ibPrint: TBitBtn
      Left = 598
      Top = 23
      Width = 55
      Height = 34
      Hint = 'Imprimir'
      Caption = 'mov.'
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
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF1C1CF91A1A
        FB0000FF0000FF0000FF0000FF0000FF0000FF0101FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF1111FE4247EF6F87DB719C9A7589
        A86262DB0F0FFF0000FF0605FA3137EC667BD28E8CB96666A21919EA0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0D0DFE3030F2444BD64E65BF5F90A75686A258879F395D
        72304943697C966B6FC086849AD0D8C3BCD0BBB6B5B38D8D8789898D4B4BC303
        03FC0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0202FF4848F94F56D32A38CE2C4B9F36527C4458574E708576A0BA5D83A02940
        5940536B3A44486B706AA1A09ED0CFD0CBC8CAC7C8C7A2A2A290909098988C80
        809F2222E80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF2B2BFC9CA1D55E71A058694A6879325C72344F6046626E717480877576
        77898786A19F9FAAA9A9A9A9A9B8B8B8CECECEAFAFAFC6C6C6AEAEAE9898989A
        9A979797985A5AC40707FB0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0B0BFC1A1AE9484768A7A5927981645C67586E7270858382979594A6A4A3AEAE
        ADA6A6A69494947F7F7F6B6B6B5F5F5F939393CACACABABABAC2C2C2BABABAA2
        A2A29F9FA0A6A69B9090A82C2CE60000FF0000FF0000FF0000FF0202FF9696D2
        C0C0CCA9A99962625C737375929194A5A4A6AEADAEA9A9A9999A998484847070
        706161615A5A5A575757585858575757525252808080BEBEBED1D1D1D1D1D1C4
        C4C4ADADADA7A7A7A9A9A6A6A6A66E6EC60B0BFA0000FF0000FF0101FF9C9CD5
        D9D9C6C6C6C3B3B3B3A7A7A79A9A9A8A8A8A7575756565655B5B5B5757575757
        575858585959595858585757575757575555554D4D4D686868BBBBBBDBDBDBD4
        D4D4CDCDCDB9B9B9AFAFAFAFAFAFB4B4AAA8A8B01717F40000FF0000FF0000FF
        4646EEBBBBD3D9D9CDB3B3B37272725151515454545858585959595959595858
        585757575656565555555454545353535353535252524B4B4B535353A1A1A1DC
        DCDCD9D9D9D3D3D3C5C5C5B8B8B8B6B6B6BCBCB27676CE0000FF0000FF0000FF
        0000FF0808FD6B6BE6CECED2D2D2CA9C9C9C6262624F4F4F5555555656565454
        545353535353535252525151515050504F4F4F4E4E4E4D4D4D4949494444447E
        7E7ED1D1D1DFDFDFD7D7D7CECECEC1C1C1C0C0BB9191CB0000FF0000FF0000FF
        0000FF0000FF0000FF1919FA9494E1D7D7D8C9C9C589898A5454544B4B4B5050
        505050504F4F4F4E4E4E4D4D4D4C4C4C4B4B4B4B4B4B4A4A4A4949494848483F
        3F3F5B5B5BB4B4B4DEDEDEDCDCDDE0E0D8D5D5C95353E50000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF3535F5B7B7DDE5E5D7BCBCBB7575764848
        484747474C4C4C4B4B4B4A4A4A4949494949494848484646464242423E3E3E3C
        3C3C3A3A3A4A4A4AA3A3A3CFCFC75050E71313FC0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0303FE5B5BEECFCFDCE1E1D7ABAB
        AB6262624141404646444545454141413C3C3C3F3F3F4A4A4A6060607E7E7EA2
        A2A2C7C7C7DDDDDDBCBCBC9A9A8A1B1BDB0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF1010FC8585E7DEDE
        DEE2E2D2A2A2955757575757566B6B6A9C9C9CC1C1C1E0E0E0F6F6F6FFFFFFFF
        FFFFFFFFFFFFFFFFE4E4E49A9A924A4AA10000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2424
        F93C3CF61717FD0303FE4B4BE1C7C7BAFCFCFDFFFFFFFFFFFFFCFCFCFAFAFAF9
        F9F9F9F9F9FAFAFAFEFEFEBCBCBB6969760606F80000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0707FC9999AAEAEAE9FAFAFAF7F7F7F7F7F7F7F7F7F7
        F7F7F7F7F7F7F7F7F9F9F9F4F4F4D0D0C12F2FD70000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF4D4DCBE9E9DDF8F8F8F5F5F5F5F5F5F5F5F5F5
        F5F5F5F5F5F5F5F5F4F4F4F8F8F8F6F6F17E7EB40000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0A0AFEE1E1F1F4F4F3F2F2F2F2F2F2F2F2F2F2
        F2F2F2F2F2F2F2F2F2F2F2F3F3F3F6F6F6C1C0BE1010EA0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF8282F8FAFAEFF0F0F0F0F0F0F0F0F0F0
        F0F0F0F0F0F0F0F0F0F0F0F0F0F0F3F3F3E7E6DC504FBC0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF1E1EFDEAEAEEEEEEEEEEEEEEEEEEEEEE
        EEEEEEEEEEEEEEEEEEEEEEEEEEEEEFEFEFF0F0EFA5A4AE0707F80000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FFADADF1F1F1ECECECECEDEDEDEE
        EEEEF1F1EEF4F4EFF7F7EEF9F9ECF8F8E8F5F5E8CDCDBA5E5EAD0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF3E3EFAF5F5EAF7F7E8F2F2E3E9
        E9DEBABADF9999E07171E34B4BE82A2AF01313F70505FC0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF4C4CED3434EB1A1AF309
        09FA0101FE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = ibPrintClick
    end
    object cbEstatus: TDBLookupComboBox
      Left = 658
      Top = 36
      Width = 119
      Height = 21
      TabOrder = 9
    end
    object buAplicar: TBitBtn
      Left = 778
      Top = 36
      Width = 22
      Height = 21
      Enabled = False
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000130B0000130B00000001000000010000F0F0F0000E10
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
        060B0C0C0D0F0B0B0B0B0B0B0B0B0B090A060B0C0C0D0E0B0B0B0B0B0B0B0B00
        04050606060607080B0B0B0B0B0B0B0B0001020202020202030B}
      TabOrder = 6
      OnClick = buAplicarClick
    end
    object buLimpiar: TBitBtn
      Left = 801
      Top = 36
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
      TabOrder = 8
      OnClick = buLimpiarClick
    end
  end
  inherited Panel2: TPanel
    Top = 543
    Width = 887
    ExplicitTop = 543
    ExplicitWidth = 887
  end
  object dgCheques: TDBGrid [3]
    Left = 0
    Top = 192
    Width = 887
    Height = 351
    TabStop = False
    Align = alClient
    DataSource = dsFuente
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dgChequesDblClick
  end
  inherited ibEliminar: TBitBtn
    Left = 310
    ExplicitLeft = 310
  end
  inherited ibCancelar: TBitBtn
    Left = 233
    ExplicitLeft = 233
  end
  inherited ibAyuda: TBitBtn
    Left = 464
    ExplicitLeft = 464
  end
  inherited ibImprimir: TBitBtn
    Left = 387
    ExplicitLeft = 387
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
        Name = 'TIPO'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AUTORIZACION'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'CLIENTE'
        DataType = ftInteger
      end
      item
        Name = 'CLIENTE_NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'EXTENSION'
        DataType = ftInteger
      end
      item
        Name = 'EXTENSION_NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FECHA_ALTA'
        DataType = ftDateTime
      end
      item
        Name = 'FECHA_APLICACION'
        DataType = ftDateTime
      end
      item
        Name = 'BANCO'
        DataType = ftInteger
      end
      item
        Name = 'ID_REFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'OBSERVACIONES'
        DataType = ftBlob
        Size = 8
      end
      item
        Name = 'SEL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 2
      end
      item
        Name = 'FECHA_APLICACION_REAL'
        DataType = ftDateTime
      end
      item
        Name = 'MONEDA'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end>
    Filter = 'ESTATUS = "Por Cobrar"'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY300'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN301'
        Fields = 'CLIENTE'
      end
      item
        Name = 'RDB$FOREIGN302'
        Fields = 'BANCO'
      end
      item
        Name = 'RDB$FOREIGN303'
        Fields = 'EXTENSION'
      end
      item
        Name = 'IDX002'
        Fields = 'FECHA_APLICACION'
      end
      item
        Name = 'RDB$FOREIGN267'
        Fields = 'MONEDA'
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'CHEQUES'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarTIPO: TIBStringField [1]
      FieldName = 'TIPO'
      Size = 11
    end
    object TCapturarREFERENCIA: TIBStringField [2]
      FieldName = 'REFERENCIA'
    end
    object TCapturarAUTORIZACION: TIBStringField [3]
      FieldName = 'AUTORIZACION'
    end
    object TCapturarMONTO: TFloatField [4]
      FieldName = 'MONTO'
      DisplayFormat = '$ ###,###,##0.00'
    end
    object TCapturarCLIENTE: TIntegerField [5]
      FieldName = 'CLIENTE'
    end
    object TCapturarCLIENTE_NOMBRE: TIBStringField [6]
      FieldName = 'CLIENTE_NOMBRE'
      Size = 100
    end
    object TCapturarEXTENSION: TIntegerField [7]
      FieldName = 'EXTENSION'
    end
    object TCapturarEXTENSION_NOMBRE: TIBStringField [8]
      FieldName = 'EXTENSION_NOMBRE'
      Size = 100
    end
    object TCapturarFECHA_ALTA: TDateTimeField [9]
      FieldName = 'FECHA_ALTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TCapturarFECHA_APLICACION: TDateTimeField [10]
      FieldName = 'FECHA_APLICACION'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TCapturarBANCO: TIntegerField [11]
      FieldName = 'BANCO'
    end
    object TCapturarID_REFERENCIA: TIntegerField [12]
      FieldName = 'ID_REFERENCIA'
    end
    object TCapturarOBSERVACIONES: TBlobField [13]
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object TCapturarSEL: TIBStringField [14]
      FieldName = 'SEL'
      Size = 2
    end
    object TCapturarESTATUS: TIBStringField [15]
      FieldName = 'ESTATUS'
    end
    object TCapturar_bancoNombre: TStringField
      FieldKind = fkCalculated
      FieldName = '_bancoNombre'
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
        Value = 'CHEQUES'
      end>
  end
  object qyBancos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM BANCOS')
    Left = 424
    Top = 106
    object qyBancosR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyBancosR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyBancosR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBancosR_CUENTA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CUENTA'
      ReadOnly = True
      Size = 50
    end
  end
  object dsBancos: TDataSource
    DataSet = qyBancos
    Left = 456
    Top = 106
  end
  object spEstatus: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    Left = 119
    Top = 368
  end
  object qyEstatus: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFuente
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VIEW_ESTATUS(8, '#39'Por Cobrar'#39')')
    Left = 282
    Top = 368
  end
  object dsEstatus: TDataSource
    DataSet = qyEstatus
    Left = 314
    Top = 368
  end
end
