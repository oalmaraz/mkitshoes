object frmMInventarioLoad: TfrmMInventarioLoad
  Left = 539
  Top = 230
  Width = 467
  Height = 504
  Caption = 'Carga'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object fcStatusBar1: TPanel
    Left = 0
    Top = 448
    Width = 459
    Height = 22
    Align = alBottom
    TabOrder = 0
    object buInicio: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
      TabOrder = 0
      Glyph.Data = {
        9A020000424D9A02000000000000360000002800000016000000090000000100
        18000000000064020000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000
        00848284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284000000FFFFFFC6
        D0F4848284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284848284FFFFFF
        0000000000848284FFFFFFFFFFFFFFFFFFFFFFFF848284000000000000000000
        FFFFFFC6D0F4848284FFFFFFFFFFFFFFFFFFFFFFFF848284848284C6D0F48482
        84FFFFFF0000000000848284FFFFFFFFFFFF8482840000000000000000000000
        00000000FFFFFFC6D0F4848284FFFFFFFFFFFF848284848284C6D0F4C6D0F4C6
        D0F4848284FFFFFF000000000084828484828400000000000000000000000000
        0000000000000000FFFFFFC6D0F4848284848284848284C6D0F4C6D0F4C6D0F4
        C6D0F4C6D0F4848284FFFFFF0000000000848284FFFFFFFFFFFF848284000000
        000000000000000000000000FFFFFFC6D0F4848284FFFFFFFFFFFFC6D0F4C6D0
        F4C6D0F4C6D0F4C6D0F4848284FFFFFF0000000000848284FFFFFFFFFFFFFFFF
        FFFFFFFF848284000000000000000000FFFFFFC6D0F4848284FFFFFFFFFFFFFF
        FFFFFFFFFFC6D0F4C6D0F4C6D0F4848284FFFFFF0000000000848284FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF848284000000FFFFFFC6D0F4848284FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D0F4848284FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      NumGlyphs = 2
    end
    object buAnterior: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
      TabOrder = 1
      Glyph.Data = {
        2E020000424D2E02000000000000360000002800000012000000090000000100
        180000000000F8010000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF848284000040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF84
        8284848284FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF84828400004000004000
        0040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284848284C6D0F4848284FFFFFF
        0000FFFFFFFFFFFF848284000040000040000040000040000040FFFFFFFFFFFF
        FFFFFF848284848284C6D0F4C6D0F4C6D0F4848284FFFFFF0000848284000040
        000040000040000040000040000040000040FFFFFF848284848284C6D0F4C6D0
        F4C6D0F4C6D0F4C6D0F4848284FFFFFF0000FFFFFFFFFFFF8482840000400000
        40000040000040000040FFFFFFFFFFFFFFFFFFC6D0F4C6D0F4C6D0F4C6D0F4C6
        D0F4848284FFFFFF0000FFFFFFFFFFFFFFFFFFFFFFFF84828400004000004000
        0040FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D0F4C6D0F4C6D0F4848284FFFFFF
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284000040FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC6D0F4848284FFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      NumGlyphs = 2
    end
    object buSiguiente: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
      TabOrder = 2
      Glyph.Data = {
        2E020000424D2E02000000000000360000002800000012000000090000000100
        180000000000F8010000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000040848284FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284C6D0F4FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF0000FFFFFF000040000040000040848284FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF848284C6D0F4C6D0F4C6D0F4FFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFF000040000040000040000040000040848284FFFFFFFFFFFFFFFFFF
        848284C6D0F4C6D0F4C6D0F4C6D0F4C6D0F4FFFFFFFFFFFF0000FFFFFF000040
        000040000040000040000040000040000040848284FFFFFF848284C6D0F4C6D0
        F4C6D0F4C6D0F4C6D0F48482848482840000FFFFFF0000400000400000400000
        40000040848284FFFFFFFFFFFFFFFFFF848284C6D0F4C6D0F4C6D0F484828484
        8284FFFFFFFFFFFF0000FFFFFF000040000040000040848284FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFF848284C6D0F4848284848284FFFFFFFFFFFFFFFFFFFFFFFF
        0000FFFFFF000040848284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        848284848284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      NumGlyphs = 2
    end
    object buFin: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
      TabOrder = 3
      Glyph.Data = {
        9A020000424D9A02000000000000360000002800000016000000090000000100
        18000000000064020000C21E0000C21E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFF
        FF000000848284FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284000000FF
        FFFF848284C6D0F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284C6D0F4
        0000FFFFFF000000000000000000848284FFFFFFFFFFFFFFFFFFFFFFFF848284
        000000FFFFFF848284C6D0F4C6D0F4C6D0F4FFFFFFFFFFFFFFFFFFFFFFFF8482
        84C6D0F40000FFFFFF000000000000000000000000000000848284FFFFFFFFFF
        FF848284000000FFFFFF848284C6D0F4C6D0F4C6D0F4C6D0F4C6D0F4FFFFFFFF
        FFFF848284C6D0F40000FFFFFF00000000000000000000000000000000000000
        0000848284848284000000FFFFFF848284C6D0F4C6D0F4C6D0F4C6D0F4C6D0F4
        848284848284848284C6D0F40000FFFFFF000000000000000000000000000000
        848284FFFFFFFFFFFF848284000000FFFFFF848284C6D0F4C6D0F4C6D0F48482
        84848284FFFFFFFFFFFF848284C6D0F40000FFFFFF0000000000000000008482
        84FFFFFFFFFFFFFFFFFFFFFFFF848284000000FFFFFF848284C6D0F484828484
        8284FFFFFFFFFFFFFFFFFFFFFFFF848284C6D0F40000FFFFFF000000848284FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284000000FFFFFF848284848284
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF848284C6D0F40000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000}
      NumGlyphs = 2
    end
    object ibSalir: TBitBtn
      Left = 1
      Top = 3
      Width = 38
      Height = 18
      Hint = 'Salir'
      Caption = '&Salir'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ibSalirClick
      Glyph.Data = {
        5E060000424D5E06000000000000360400002800000017000000170000000100
        08000000000028020000C21E0000C21E00000001000000000000FFFFFF00F3FA
        FF00F2F4FD00EEF1FC00EAEDFC00E4E9FC00DDE4FB00D9DEFA00D4DCFA00B9C4
        F500B5C1F500ACBBF400A2B8F600A4B3F2009FB3F4009AACF20096A8F10092A5
        F00091A3EF008FA9F4008AA5F3008EA1EF008B9FEF00859AEE008196ED007C93
        ED00788DEC00758DEB006E90F000658BF1006F88EB006B84EA006681EA005D81
        EE00647DE9005E79E8005A75E8005B75E7005772E8005571E700516EE7004D75
        EC00496CE8004C6AE6004967E5004569E7004463E5004D67D100405FE400445F
        CB004A61BC00445CB9003D6BEC003C64E6003361E9003B5DE300345AE4003256
        E2002C5CE9002D5AE6002D53E2002658E8002553E6002A4FE100244CE2003052
        DC002D51DC002750DC002A4EDB00234DDD002046DF002949CB002748CD002244
        CA002142C7001A51EA001750EA001B4DE400124BE900164AE4001245E1000D46
        E8000B41E4001F4DDF001D44DD001C41CB003F56B000063CE200183ED500143D
        DE00153CD6001A3DC600143DCF001437C5000F3BD0000E37DB000A32D1000337
        DF000032D7000E39CD000937CF000E32C3000432CF00012FCD00002BC5001A36
        A9001433AA001532A700102FA800112EA4000F30AB000025B2000A2CAB000C2A
        A3000629AC000225AA000021A200000000000000000000000000000000000000
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
        00000000000000000000000000000000000000000000FFFFFF00000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000003371716D6D6D6C707072737373560000000000000000003165
        5B554A495555555C636366676F5600000000000000005F543C393738383B3C3E
        4D4F525767730000000000000000594038372E230E010113344B515266730000
        00000000000054392E2B00020B35350C02004E51647200000000000000004637
        2B1F03192B35353A1C02364F5E70000000000000000040372B0B0D2B2B00003A
        3D0E144D5C700000000000000000392B2600282B2B00003C3E3E024D556A0000
        00000000000039282400282B2C00003C3E400140496A00000000000000003723
        22090D2B2C00003C400F103F4869000000000000000037221F18041A2C30373C
        20032B3C476900000000000000002E1F1F1F00040D2E371003003C3C47690000
        0000000000002B19171B20190A00000D222E3739496B00000000000000002716
        15181E1F22232327272B2E37496B00000000000000001B19171B1F2222242428
        282B37395B320000000000000000001B282B2E37373737393C3C40542F000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000}
      Layout = blGlyphRight
    end
  end
  object paEncabezado: TPanel
    Left = 0
    Top = 0
    Width = 459
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Archivo:'
    Color = 13354440
    TabOrder = 1
    object ibCargar: TBitBtn
      Left = 4
      Top = 21
      Width = 68
      Height = 34
      Hint = 'Cargar archivo'
      Caption = 'cargar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = ibCargarClick
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001B0000001A0000000100
        180000000000880800001B4E00001B4E000000000000000000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C00000C00000000000C00000C00000C00000C00000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C000
        00000000C00000C00000C00000C00000C00000C00000C0D9BAB6DCBDB4E9CEC0
        EACCBEEACCBCEACABAEAC9B8E9C8B6EAC7B3EAC5B2EAC4B0E9C3ADEAC2ABEAC0
        A9EABFA7EABEA5E3B098CFA7A00000C00000C00000000000C00000C00000C000
        00C00000C00000C00000C0D1ABA5F9F1E9FEF3E3FEF3E1FEF2DFFEF1DEFDF0DA
        FCEAD2FCE9D0FCE8CDFBE7CBFCE7CAFEECD0FEEBCEFEEACCFEEACAFDE3C3D3A5
        9A0000C00000C00000000000C00000C00000C00000C00000C00000C00000C0D0
        AAA5F9F2EAFEF5E6FEF4E4FEF3E2FEF2E0FDEEDAF9E1C8F9E0C4F9DEC1F8DCBE
        F9DEC0FEEDD2FEEDD1FEECCFFEEBCDFEE5C6D2A69B0000C00000C00000000000
        C00000C00000C00000C00000C00000C00000C0D0ABA5FAF2EBFEF6E9FDF2E3FD
        F1DFFDEFDDFDEEDBFDEDD9FDECD6FCEBD4FCEAD1FCE9CFFCE8CDFDE7CAFCE6C8
        FEE9CCFEE6CBD3A79C0000C00000C00000000000C00000C00000C00000C00000
        C00000C00000C0D0ABA5FAF3EDFEF7ECFCEBDAFAE7D2FAE3CBF9DDC1F9D8B8F9
        D2AFF6CEA9B7987EC5B09BF8D8B6F7D5B2F7D4AFFAE2C3FEE8CED2A79D0000C0
        0000C00000000000C00000C00000C00000C00000C00000C00000C0D0AAA5F9F3
        EEFEF8EEFDF1E2FDE7D0FDDDBDFDD8B5FCD5B2E7D1C1A6B6DB98A7C3F8E7D0FC
        EAD1FCE9CFFCE8CCFDEBD1FEEAD1D2A89E0000C00000C00000000000C00000C0
        0000C00000C00000C00000C00000C0D0ABA4F9EEE6FEECDAFBDABEFAD4B3FAD1
        AFECCAADB4B9CE7EA5E29BBAE8DEDADAF7DABCF7D9B8F7D7B5F6D5B1FBE4C8FE
        ECD5D3A89F0000C00000C00000000000C00000C00000C00000C00000C00000C0
        0000C0D3ABA1F9E6D7FDEAD8FDE4CEFCE1C8E0D4C6469AD983ACE4B4CAECD2E0
        F2F9EBDAFCECD7FCEBD5FCEAD3FCE9D0FDEDD6FEEDD8D2A9A10000C00000C000
        00000000C00000C00000C00000C00000C00000C00000C0D6AEA4FAE9DCFDEDDD
        FCE0C7E3CFBE308DD1029EF459C5FAD2EAFCE3DFDAF8DEC3F8DCBFF8DABDF7D8
        B9F7D7B5FBE6CCFEEEDBD2AAA20000C00000C00000000000C00000C00000C000
        00C00000C00000C00000C0D9B2A7FAEDE2FEF5EBE3E8EA3496DE019EF50DB8FE
        24D2FD8AD1E9FAF0E3FDF0E1FDEFDEFDEEDCFCEED9FDEDD8FDF0DCFEF0DED3AB
        A30000C00000C00000000000C00000C00000C00000C00000C00000C00000C0DB
        B8ACFBF6F4E3EEF73595DD019DF40CB6FE29D3FC83D2EAF7E3CFFAE2CBF9E1C8
        F8DFC5F8DDC1F8DCBEF8DABBFBE9D2FEF2E1D3ACA30000C00000C00000000000
        C00000C00000C00000C00000C00000C00000C0DDBCB0E6EBF13494DF009CF40A
        B4FE2AD4FC84D5EFF8F4ECFDF5EAFDF4E8FDF3E6FDF1E4FDF1E1FCF0DFFCEFDD
        FEF2E2FEF3E4D3ACA50000C00000C00000000000C00000C00000C00000C00000
        C00000C00000C0CAB6B3348FD8009DF50AB4FE2DD7FD86D4ECF5E4D3F9E4CEF8
        E1CAF8DFC7F8DDC3F7DCC0F7DABCF7D8B9F7D6B5FAE7D0FDF2E1D2ACA40000C0
        0000C00000000000C00000C00000C00000C00000C00000C00000C0358FD7009C
        F409B3FE2FD5FC86D9F3FAF8F4FDF8F2FDF7F1FDF6EEFDF4EBFDF4E9FDF2E6FC
        F1E4FCF0E1FBEDDBFBEEDBFAEFDAD1ACA30000C00000C00000000000C00000C0
        0000C00000C00000C00000C03691DD019CF408B1FE31D7FD86D9F0F6E8DAF9E8
        D6FAE7D4F9E5D1F9E3CDF9E1CAF8DFC7F9DDC3F7DABEF6D8B8F5D5B2F7E3C7F8
        ECD4D2ACA30000C00000C00000000000C00000C00000C00000C00000C03891DC
        009DF408B0FE31D7FE8FE3FCFAF8F6FDF8F3FDF7F2FDF7F0FDF6F0FCF6EEFCF5
        ECFCF5EDFEFAF5FBF6EBFAF3E2F9EFDAF6EAD1EFDDC4D1AAA20000C00000C000
        00000000C00000C00000C00000C03B92DD009CF309B0FE34D6FD8BE3FBFBFDFE
        FCF1E6FBEBDCFBE9DAFAE8D7FAE6D4F9E5D1F8E4CEF9E7D3FCF8F1ECDAD0F0E2
        D9EEDFD3EEDCCEE0C3B9DDC0BA0000C00000C00000000000C00000C00000C039
        8FDA009BF308ADFE38D9FE84CBD7F7F8F8FEFEFEFEFCF9FDFBF8FEFAF7FEFAF6
        FEFAF6FEF9F5FDF9F4FBF7EEFAF7ECF2E5DDFEFAF4FDEBCDE8C09BDBBAAF0000
        C00000C00000C00000000000C0DEDEDE3B3C3C0A82C509AEFE3AD7FD94E8FDEC
        D2BEFCFAF7FEFEFEFBEEE2FAE8D7F9E7D4F9E5D1F9E3CEF8E1CBF8DFC6F8E0C9
        F9F4E5F1E5DAFDEFD5EAC199E0C1B30000C00000C00000C00000C00000000000
        C048537F5353537A929D5FC8E492E7FB0000C0F2D7C1FCFAF8FEFEFEFEFEFEFF
        FFFFFFFFFFFFFFFEFEFEFEFEFEFDFCFAF4FAF6EAF7F0DEF4E8DEEDCDAEE3C5B7
        0000C00000C00000C00000C00000C00000006688F21460DE969CA6E2E2E3E3E3
        E40000C00000C0F6DBC4FCF8F4FDFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFE
        FEFCFCFBF5FCF8EFF2E5D4ECD5C7E6C8B90000C00000C00000C00000C00000C0
        0000C00000008DA7F95996FDB5CDF8C9CFED0000C00000C00000C00000C0F6DA
        BFF5DBC2F4D9C2F3D8C1F2D6C0F0D5BFEFD3BEEDD1BDECCFBBEACCB7E7C6B2EB
        D2C20000C00000C00000C00000C00000C00000C00000C00000000000C0BBCBFD
        C4CFFE0000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C00000C00000000000C00000C00000C00000C00000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C000
        0000}
      Layout = blGlyphRight
    end
    object ibCancelar: TBitBtn
      Left = 74
      Top = 21
      Width = 68
      Height = 34
      Hint = 'Cancelar'
      Caption = '&cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = ibCancelarClick
      Glyph.Data = {
        12060000424D1206000000000000360000002800000014000000190000000100
        180000000000DC050000204E0000204E000000000000000000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C0CAA098D1
        A89FD2A79ED1A79DD1A69CD1A69BD1A59AD1A499D1A498D1A397D1A396D1A295
        D2A294D1A193D2A092CE9B8E0000C00000C00000C0BBA7BB5256BF5F60C0E3D9
        DAFEF0DEFFEFDCF4E5D67770BA4146BCB4ABCDFFEAD0FEE9CEFEE8CCFEE7CAFE
        E5C7FEE4C5FEDDBECE9B8D0000C00000C0555AC3184BF80E3FF33844C2E4DADB
        F4E8DC5656BA0229E70131FA1225C7FEEED5FEEED3FEEDD2FEECD0FEEBCEFEEA
        CCFEE8C8D2A2930000C00000C0585CC12355F9134BFC0F3FF53842C15356BA02
        2AE80133FD0133FB1526C6FEEFD8FEEED6FEEED4FEEDD2FEECD1FFECCFFEE9CB
        D2A3940000C00000C0B8A3B93A4AC81F54F9134CFD0D40F50733EA0438FD0232
        FD0F29D2C1B7CDFEF0DBFEF0D9FEEFD8FEEFD5FEEDD3FEEDD1FEEACED2A39700
        00C00000C0DCC1BDC9C1D83948C72055FB124CFD0D45FD093FFD0F2CD7C1B9D2
        FEF2E0FEF1DEFEF1DCFEF0DAFEEFD8FEEFD6FEEED4FEEBD1D2A4980000C00000
        C0DCC1BDF4EAE67275C91B4DEE1853FC134CFD0E42F83F4CC4EFE5DFFEF4E2FE
        F3E1FEF2DFFEF1DDFEF0DAFEEFD9FEEFD7FEEDD3D2A5990000C00000C0DDC3BE
        8587CD2554E82661FD1E5AFD1B52FC154CFE0F40F4434BC0F0E7E0FEF4E3FEF3
        E1FEF2E0FEF1DEFEF1DCFEF0DAFEEED7D3A69B0000C00000C08E84BC2F61E831
        70FD2B68FC2344D72B3DC71E53FA154CFE0F3FF26166C6FEF5E6FEF4E4FEF3E2
        FEF2E0FEF1DEFEF1DCFEEFDAD2A79C0000C00000C0817CC14C87FD3675FD2A4F
        D8C3C1E1C9C5DF2E3FC61E53F9144DFD0C27CCFEF6E9FEF5E7FEF5E5FEF4E3FE
        F3E1FEF2E0FEF1DDD2A89D0000C00000C08F83BA5F6FD34158D1C2C2E5FEFBF7
        FEFBF5CAC6DF2F3EC22845D96D71C9FEF7EBFEF6E9FEF5E8FEF5E6FEF4E4FEF3
        E2FEF2E0D2A99F0000C00000C0E5CCC3F6EFECFEFEFEFEFEFCFEFDFAFFFCF8FE
        FBF6FEFAF4FEF9F2FEF9F0FEF8EEFEF7EDFEF7EAFEF6E9FEF5E7FEF4E5FFF3E2
        D2AAA00000C00000C0E7CEC5F7F0EDFFFFFFFEFEFEFEFEFDFEFDFBFEFCF9FEFC
        F7FEFBF5FEFAF3FEF9F1FEF8EFFEF8EEFEF7EBFEF6E9FEF5E7FEF4E4D2AAA100
        00C00000C0E9D1C7F8F1EEFFFFFFFFFFFFFEFEFEFEFEFEFEFDFCFEFCFAFEFCF7
        FEFBF6FEFAF3FEF9F2FEF9F0FEF8EEFEF7EAFDF4E5FCF1DFD1AA9F0000C00000
        C0EBD3C8F8F1EEFFFFFFFFFEFFFFFFFFFFFFFFFEFEFEFEFEFCFFFDFAFFFCF8FE
        FBF6FEFAF3FEFAF1FEF8EEFDF4E7FBF1DFFAEFD9D1A99E0000C00000C0ECD6CA
        F9F2EEFFFFFFFFFEFFFFFFFFFFFFFFFFFFFFFEFEFEFEFEFCFEFDFAFEFDF8FEFB
        F6FEF9F1FCF5E9FAF2E0F9EFD9F8ECD2CFA99D0000C00000C0EFD8CBF9F3EFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFEFEFDFEFDFBFDFBF5F9F3E7
        F9F0E0F7EED9F3E3CBEDDAC2CFA69C0000C00000C0F0DBCCFAF4EFFFFFFFFFFF
        FFFFFFFFFFFFFFFEFEFEFEFEFEFFFFFEFEFEFEFDFEFAFCF8F1EEDED4F0E4DEF0
        E0D6F2E2D6E1C6BADCBFB70000C00000C0F2DDCFFBF5F0FFFFFFFFFFFFFFFFFF
        FFFFFFFEFEFEFEFEFEFEFEFEFEFEFDFDFBF5FAF7ECF3E8DEFEFAF5FEECCCEAC2
        98DBB8AC0000C00000C00000C0F4DFD0FCF5F0FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFEFFFFFEFEFEFEFEFCFAFBF8EFF9F4E6F3E6DBFEF1DCEBC49CDEBCAE0000C0
        0000C00000C00000C0F6E2D1FCF5F1FEFEFEFEFEFEFFFFFFFFFFFFFFFFFEFEFE
        FDFEFEFDFDFBF6FAF6EBF7F2E0F3E5D9EFD2B8E2C1B10000C00000C00000C000
        00C00000C0F7E4D1FCF4ECFEFEFEFEFEFEFFFFFFFFFFFEFFFFFEFFFFFEFEFEFD
        FDFBF7FBF9F0F5E9DAEDD6C9E4C5B50000C00000C00000C00000C00000C00000
        C00000C0F5D8BDF5DCC5F5DBC4F4D9C4F2D8C2F1D6C1F0D4C0EED3BFEDD1BEEC
        CFBCE7C7B3EACDBC0000C00000C00000C00000C00000C00000C00000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C0}
      Layout = blGlyphRight
    end
    object ibLimpiar: TBitBtn
      Left = 144
      Top = 21
      Width = 68
      Height = 34
      Hint = 'Limpiar'
      Caption = 'limpiar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = ibLimpiarClick
      Glyph.Data = {
        1E060000424D1E06000000000000360000002800000018000000150000000100
        180000000000E8050000420B0000420B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FF8FBF8F8FB88F80B88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        60CF6060CF6060CF6060CF60003060307F6060CF60FFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF60CF6060CF6060CF6000679F0030600030603098CF004F9F60CF6060CF60
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF60CF6060CF6000679F00306000306060CFFF9FFFFF3098CF3098CF1F
        7FCF00306060CF6060CF60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFF60CF6060CF6060CF6000306060CFFF9FFFFF3098CF60CFFF3098
        CF60CFFF60CFFF3098CF0067CF00306060CF6060CF60FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF60CF6000679F0030604FB0E060CFFF3098CF
        60CFFF60CFFF60CFFF3098CF3098CF4FB0E03098CF0067CF00306060CF6060CF
        60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF60CF6060CF6060CF600030609FFFFF9F
        FFFF60CFFF60CFFF3098CF3098FF60CFFF60CFFF60CFFF4FB0E03098CF3098CF
        0067CF00306060CF60FFFFFFFFFFFFFFFFFFFFFFFF60CF6060CF6000679F0030
        603098CF60CFFF3098CF3098FF60CFFF60CFFF60CFFF3098FF3098CF60CFFF4F
        B0E060CFFF3098CF0067CF00306060CF6060CF60FFFFFFFFFFFFB0E7B060CF60
        004F7F4FB0E07FE7FF60CFE04FB0E05FBFFF4FB0FF4FB0E04FB0FF4FB0FF4FB0
        E060CFFF4FB0E05FBFF03098E060CFFF4F7FCF004FB000306060CF60FFFFFFFF
        FFFF60CF600030609FFFFF9FFFFF60CFFF60CFFF60CFFF4FB0FF3098CF3098FF
        60CFFF60CFFF60CFFF3098CF60CFFF3098CF6067CF00309F60CFFF3098CF0067
        CF00306060CF60FFFFFF00679F00679F00679F00679F00679F00679F3098CF60
        CFFF60CFFF60CFFF3098FF3098CF60CFFF3098CF3098CF304FB060CFFF3098CF
        6067CF00309F00309F00306060CF6080B88060CF606098309FCF9FCFFFCFCFFF
        CF9FCF9F00679F00679F3098CF60CFFF60CFFF3098CF3098CF6067CF00309F4F
        B0E06067CF00309F3098CF60CFFF3098CF0067CF00306080B88FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFCFFFCFB0E7B000679F00679F3098CF6067CF0030
        9F60CFFF3098CF304FB03098CF60CFFF3098CF60CFFF3098CF0067CF0030608F
        B88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCF9FCF9F
        00309F60CFFF3098CF6067CF00309F4FB0E03098FF60CFFF3098FF60CFFF3098
        CF0067CF0030608FB88FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFCFFFCF9FCF9F00309F00309F3098FF9FFFFF60CFE060CFFF3098FF
        60CFFF3098FF3098CF0067CF0030608FB88FFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFFFCF00679F60CFFF9FFFFF3098FF60
        CFE060CFFF3098CF60CFFF3098CF0067CF00306060CF6080B88FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB0E7B04F98
        9F3098FF4FB0CF3FA7CF1F7FCF3F6F8F3F6FA07F7F9F30304F60CF6060CF60FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFCFCF404740FFFFFFBFB8BFAFA8AF1010
        1060303060CF60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9FCF9F404740
        7077704047403098CF60303060CF60FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFF6098307077709FFFFF60CFFF3098FF1010106030308FC08FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF60CF6060CF60404740707770404740FFCFCF60303060
        CF60}
      Layout = blGlyphRight
    end
    object ibReAgrupar: TBitBtn
      Left = 284
      Top = 21
      Width = 52
      Height = 34
      Hint = 'Volver agrupar facturas enlazadas.'
      Caption = 'Re Agrupar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnClick = ibReAgruparClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000130B0000130B000000000000000000000000C00000C0
        0000C00000C00000C00000C0C1BAB9C1BAB9C1BAB9C1BAB9C1BAB9C1BAB9C1BA
        B9C1BAB9C1BAB9C1BAB90000C00000C00000C00000C00000C00000C0E6E1E1F8
        F7F7F5F3F3F3F1F1F2F0F0F2EFEFF0EDEEEEEBEBEDEAEAC1BAB90000C00000C0
        0000C00000C00000C00000C0E6E1E1FAF9F9F5F3F3F3F1F1F3F1F1F2F0F0F1EE
        EEEEEBEBEDEAEAC1BAB90000C00000C00000C00000C00000C00000C0E6E1E1FB
        FAFAF5F3F3F3F1F1F3F1F1F2EFEFF1EEEEEEEBEBEDEAEAC1BAB9A39B96A39B96
        A39B96A39B96A39B96A39B96A39B96A39B96A39B96A39B96F2F0F0F2EFEFF0ED
        EEEDEAEAEDEAEAC1BAB9D0CAC6F3F2F1EDEAE9EAE7E6E9E6E5E7E4E2E5E2E0E1
        DDDBDFDBD8A39B96F2F0F0EFECECEEEBEBECE8E8EBE7E7C1BAB9D0CAC6F7F6F5
        EDEAE9EBE8E7EAE7E6E8E5E3E5E2E0E0DCDADFDBD9A39B96F6F4F4EFECECEDEA
        EAEBE7E7E9E5E5C1BAB9D0CAC6F8F7F7EDEAE9EAE7E6E9E6E5E7E4E2E5E2E0E1
        DDDBDFDBD8A39B96F8F7F7F5F3F3F1EEEEE7E2E2E6E1E1C1BAB9D0CAC6F8F7F7
        EEEBEAEAE7E6E9E6E5E6E3E1E5E2E0E0DCDADEDAD7A39B96F8F7F7F3F1F1F1EE
        EEE8E4E4E3DDDDC1BAB9D0CAC6F7F6F6F4F3F2EFEDECE9E6E4E1DDDBE0DCDADC
        D8D5DAD5D2A39B96F6F5F5F2F0F0C1BAB9C1BAB9C1BAB9C1BAB9D0CAC6FAF9F9
        F5F4F3F2F0EFEFEDECE2DEDCDEDAD7D9D4D1D7D2CFA39B96F6F5F5F2F0F0E6E1
        E1E7E2E2C1BAB90000C0D0CAC6FBFAFAF8F7F7F5F4F3F3F2F1EDEAE9E6E3E1D2
        CCC9D1CBC7A39B96E6E1E1E6E1E1E6E1E1C1BAB90000C00000C0D0CAC6FCFCFC
        F8F7F7F4F3F2F2F0EFEBE8E7E6E3E1D6D0CDCBC4C0A39B960000C00000C00000
        C00000C00000C00000C0D0CAC6FCFCFCF8F7F7F3F2F1F1EFEEE9E6E5A39B96A3
        9B96A39B96A39B960000C00000C00000C00000C00000C00000C0D0CAC6FCFCFC
        F8F7F7F3F1F0F0EEEDE7E4E2D0CAC6D3CDCAA39B960000C00000C00000C00000
        C00000C00000C00000C0D0CAC6D0CAC6D0CAC6D0CAC6D0CAC6D0CAC6D0CAC6A3
        9B960000C00000C00000C00000C00000C00000C00000C00000C0}
      Layout = blGlyphRight
    end
    object ibGuardar: TBitBtn
      Left = 214
      Top = 21
      Width = 68
      Height = 34
      Hint = 'Guardar archivo'
      Caption = 'guar&dar errores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = ibGuardarClick
      Glyph.Data = {
        56080000424D560800000000000036000000280000001A0000001A0000000100
        18000000000020080000204E0000204E000000000000000000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000
        C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C000000000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C00000C0BFABAC946F6FA58887AB9090A98F8EA98D8DA78C8B
        A6898AA58888A48686906B6A9065658F6565B39C9C0000C000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C0BEA9AA9C7878B08C
        8DDCCFD0CDBBBBCCBBBBE5DEDEE5DDDEE2D8D9DFD4D4DACFCFA583839F706E9C
        6C6A9C7B7B0000C000000000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C0A78787BD9E9FB39090D7C8C9AC8686AC8988E4DCDDE9E2E2
        E6DDDDE2D8D8DDD3D3A78585A374729F716F9C7B7C0000C000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C0B89D9DC2A4A4B594
        94D8CCCCB08B8CB18D8DE8E1E1EDE6E7E8E2E3E5DDDDE0D7D7A98888A57877A3
        74739D7B7B0000C000000000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C0B99F9FC5A8A8B89898DDD1D1B19090B39393EDE6E6F0EAEB
        ECE6E7E8E2E2E4DCDCAB8B8CA77C7BA578789D7C7C0000C000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C0BBA1A1C8ACACBC9C
        9CE9E1E1F0EDEDEFEAEAF6F3F3F4EFF0F0EAEBEBE5E6E7DFE0AD8E8EAA8080A8
        7C7D9D7C7D0000C000000000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C07E8F6C879774818F6C7C8D6A8A95788F947C8E927A969380
        B49A9AB29798B19494A88384AC8485AB81809D7C7C0000C000000000C00000C0
        0000C00000C00000C00000C00000C00000C00000C0609E5B4CB45B33B74F34B7
        4F33B44C38B8503ABB543FBD55319132C8C5B5E2D2CCE2D0CAE1CFC9BFA3A0AD
        85859D7D7D0000C000000000C00000C00000C0C4A094A56857AC7868AB7867AA
        7867AA7766686B3D63AA695DDF8848E17A4EE78154EC885AF38D5EF7903FAD4B
        E0E6D3FEF6EEFEF5ECFDF4EACDB6B1B089889D7D7D0000C000000000C00000C0
        C0998DB16A59CF877FE7DAD9E3D3D1E2D2D1E3D8D8BCA6A5657E5452AD6046DD
        794AE27E50E88456EE895BF58D3EAD4ADFE7D6FEF7EFFEF6EDFEF5ECCFB8B4B4
        8E8E9E7D7C0000C000000000C0CAABA0B17161E6A097D68F88DCB3B0DB8F87D1
        948FEAE3E4BBAEAB3875312DB95441D97547DF7B4DE58152EB8558F28A3CAC49
        E0E8D8FEF8F3FEF6EFFEF6EED0B9B5B691929E7D7E0000C000000000C0B78A7C
        DFADA5EAA89FD6928BDFB4B2E5998FD3958DE1E1DC4D944E27B44D37D16A3ED6
        7243DB7749E17D4FE78255EE873BAA48E0E8D9FDF9F5FEF8F3FEF6F0CFBAB7B8
        95969E7D7E0000C000000000C0B78A7CDFB2A9EAACA3D8958EE0B8B5E59C93CB
        9086559B5721AE422FC96034CD673AD36D40D97345DE7859E68751EA833BA948
        E0EADBFEF9F6FEF9F4FEF8F1D0BBB8BB99999F7E7E0000C000000000C0B78A7C
        E1B6AEEBB1A8D89A93F1E2E1E7CAC7A8AB8F65AE6C3AC8612CC65A30CA6336CF
        693AD26C2197355CA5616DE89436A543E0EBDFFEFCFBFEFBF9FEFAF8E0D1CFCA
        AFAE9F7F7F0000C000000000C0B78B7CE2BAB3EDB5ADDFA39CE7CAC9E7C8C6D8
        BEB65B84468ECC983BC9642EC85E31C9621D912F636E48606C455B9F5C40903E
        9A8C82AB8F8FAC9090AB8F8FA98B8CA08080C0ACAC0000C000000000C0B78B7C
        E2BEB7E4B1ABE3B9B5E3B8B2E2B6B0E2B4AED6B0A56195578DCC993CC9661E97
        338E996ED4847AC26E5F89835EA4C6A10000C00000C00000C00000C00000C000
        00C00000C00000C000000000C0B78B7CE3C1BBE8C2BFFEFEFDFDFDFBFEFCF9FE
        FAF6FEF9F4F1F1E66AA4655A9F5BA5C399FBF0E6DD988FC87162C4A2960000C0
        0000C00000C00000C00000C00000C00000C00000C00000C000000000C0B88B7D
        E5C5BEE8C4C1FDFEFEFEFDFDFEFCFBFEFBF8FEF9F5FDF9F2F6F3EAE5E8D8FDF5
        EDFDF2EADF9C93C87465C4A2950000C00000C00000C00000C00000C00000C000
        00C00000C00000C000000000C0B88B7DE6C9C3E8C6C3FEFEFEFDFEFEFDFEFDFE
        FCFBFEFBF8FEF9F6FDF8F4FDF7F2FEF6EFFDF4EBE09F97C97869C5A2960000C0
        0000C00000C00000C00000C00000C00000C00000C00000C000000000C0B78B7D
        E7CDC8E9C8C6FFFFFFFFFFFFFEFEFEFEFDFDFEFCFBFEFBF7FEF9F5FEF9F4FDF7
        F0FDF5ECE0A299CA7A6CC6A2960000C00000C00000C00000C00000C00000C000
        00C00000C00000C000000000C0B98E80E8D0CBEACBC8FFFFFFFFFFFFFFFFFFFE
        FEFEFEFEFEFEFCFBFEFBF8FDF9F6FDF8F4FDF5EFE2A49DCB7E70C6A2960000C0
        0000C00000C00000C00000C00000C00000C00000C00000C000000000C0BF988A
        EAD9D5ECD1D0FEFEFEFEFEFEFFFFFFFFFFFFFFFEFEFFFDFDFEFCFBFEFBF8FEFA
        F6FDF7F1E4ABA5CB8376C6A2960000C00000C00000C00000C00000C00000C000
        00C00000C00000C000000000C0CCAEA4C0998CC6A297C39F94C19C8FC29C91C2
        9C91C29C91C29C91C29D90C29C8FC29C90C19C8FBE8A7DA96958D0B4AB0000C0
        0000C00000C00000C00000C00000C00000C00000C00000C000000000C00000C0
        E2D0CBDBC5BED7C0B9D5BDB5D6BCB4D6BCB4D6BCB4D6BCB4D6BCB4D6BCB4D6BC
        B4D5BCB4D6BCB4DECAC30000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C000000000C00000C00000C00000C00000C00000C00000C000
        00C00000C00000C00000C00000C00000C00000C00000C00000C00000C00000C0
        0000C00000C00000C00000C00000C00000C00000C00000C00000}
      Layout = blGlyphRight
    end
  end
  object sgDatos: TStringGrid
    Left = 0
    Top = 57
    Width = 459
    Height = 391
    Align = alClient
    ColCount = 4
    DefaultColWidth = 24
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    TabOrder = 2
    ColWidths = (
      122
      24
      242
      48)
  end
  object odCargar: TOpenDialog
    Filter = 
      'All (*.txt;*.sql;*.rop)|*.txt;*.sql;*.rop;*.dat|Archivo de texto' +
      ' (*.txt)|*.txt|Archivo Script (*.sql)|*.sql|Archivo del lector (' +
      '*.rop)|*.rop|Archivo de datos (*.dat)|*.dat'
    Left = 48
    Top = 125
  end
end