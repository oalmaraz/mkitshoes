object frmChequeDevuelto: TfrmChequeDevuelto
  Left = 755
  Top = 353
  Caption = 'Cheque Devuelto'
  ClientHeight = 176
  ClientWidth = 442
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 52
    Height = 13
    Caption = 'Referencia'
  end
  object Label2: TLabel
    Left = 136
    Top = 8
    Width = 30
    Height = 13
    Caption = 'Monto'
  end
  object edReferencia: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    MaxLength = 20
    TabOrder = 0
  end
  object gbNotaDeCargo: TGroupBox
    Left = 8
    Top = 56
    Width = 409
    Height = 73
    Caption = 'Nota de Cargo'
    TabOrder = 1
    object Label5: TLabel
      Left = 173
      Top = 18
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    object Label6: TLabel
      Left = 103
      Top = 18
      Width = 51
      Height = 13
      Caption = 'Porcentaje'
    end
    object cbPorcentaje: TCheckBox
      Left = 8
      Top = 34
      Width = 89
      Height = 17
      TabStop = False
      Caption = '&Porcentaje'
      TabOrder = 0
    end
    object edNCMonto: TEdit
      Left = 173
      Top = 34
      Width = 89
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object edPorcentaje: TEdit
      Left = 103
      Top = 34
      Width = 65
      Height = 21
      TabOrder = 1
      OnChange = edPorcentajeChange
    end
  end
  object ibEjecutar: TBitBtn
    Left = 341
    Top = 8
    Width = 76
    Height = 41
    Caption = '&Ejecutar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
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
    ParentFont = False
    TabOrder = 2
    OnClick = ibEjecutarClick
  end
  object sbEstatus: TPanel
    Left = 0
    Top = 159
    Width = 450
    Height = 22
    TabOrder = 3
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
      TabOrder = 0
      OnClick = ibSalirClick
    end
  end
  object edMonto: TEdit
    Left = 136
    Top = 24
    Width = 137
    Height = 21
    TabOrder = 4
    OnChange = edMontoChange
  end
  object spCHEQUE_DEVUELTO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'CHEQUE_DEVUELTO'
    Left = 344
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID_1'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'R_ID_2'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_CXC_PAGO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_REFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_MONTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'P_AUTO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_NC_PORC'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'P_NC_MONTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_USUARIO'
        ParamType = ptInput
      end>
  end
end