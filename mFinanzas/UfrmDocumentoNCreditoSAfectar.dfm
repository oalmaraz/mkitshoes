object frmDocumentoNCreditoSAfectar: TfrmDocumentoNCreditoSAfectar
  Left = 331
  Top = 335
  Caption = 'Notas de Credito Sin Afectar'
  ClientHeight = 252
  ClientWidth = 582
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object dgPartidas: TDBGrid
    Left = 0
    Top = 0
    Width = 582
    Height = 252
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object fcStatusBar1: TPanel
    Left = 0
    Top = 235
    Width = 590
    Height = 22
    TabOrder = 0
    object buInicio: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
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
      TabOrder = 0
    end
    object buAnterior: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
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
      TabOrder = 1
    end
    object buSiguiente: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
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
      TabOrder = 2
    end
    object buFin: TBitBtn
      Left = 1
      Top = 3
      Width = 28
      Height = 18
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
      TabOrder = 3
    end
    object ibSalir: TBitBtn
      Left = 1
      Top = 3
      Width = 38
      Height = 18
      Hint = 'Salir'
      Caption = '&Salir'
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = ibSalirClick
    end
  end
end
