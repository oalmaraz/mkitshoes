inherited frmCapturar_SeguimientoCobranza: TfrmCapturar_SeguimientoCobranza
  Left = 452
  Top = 211
  ActiveControl = ceMayorA
  Caption = 'Seguimiento Cobranza'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Height = 73
    ExplicitHeight = 73
    object Label1: TLabel [0]
      Left = 8
      Top = 19
      Width = 97
      Height = 26
      Caption = 'Dias de Vencimiento Mayor a'
      Transparent = True
      WordWrap = True
    end
    object Label2: TLabel [1]
      Left = 230
      Top = 31
      Width = 46
      Height = 13
      Caption = 'Columnas'
    end
    object Label3: TLabel [2]
      Left = 119
      Top = 19
      Width = 97
      Height = 26
      Caption = 'Dias de Vencimiento Menor que'
      Transparent = True
      WordWrap = True
    end
    inherited Panel1: TPanel
      TabOrder = 6
    end
    object ceMayorA: TEdit
      Left = 8
      Top = 46
      Width = 105
      Height = 21
      TabOrder = 0
    end
    object seColumnas: TEdit
      Left = 230
      Top = 46
      Width = 64
      Height = 21
      TabOrder = 2
      OnChange = seColumnasChange
    end
    object ceMenorQue: TEdit
      Left = 119
      Top = 46
      Width = 105
      Height = 21
      TabOrder = 1
    end
    object ibBusqueda: TBitBtn
      Left = 298
      Top = 29
      Width = 75
      Height = 38
      Cursor = crHandPoint
      Caption = '&Buscar'
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
        0000FF3032B32121B90000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        2829AD60606162615F31339F0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF131695
        3333344B4B4B606060605F6433369C0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0E1059
        19190C3232334A4A4A6060605E5E6233359C0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0101FE
        11136119190D3232334848485F5F5F60606431339E0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0101FE11136117160B30303049494A606060605F6431339E0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0101FE10126117160B303030494949606060605F6431339E0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0101FE10126117160B3030304949496060606464591011E30000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0101FE10126117160B3030304949496363531112E50000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0101FE1012611818022E2E1F5E60566C6CD10000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FE0A0BD40F10D87576C4BFBFA21818
        F00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF3030F5C3C3
        CB1010F30000FF0000FF0000FF0000FF0000FF0404FE1818FC2A2AF92525FB13
        13FC0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2727
        FACBCBC81111F30000FF0000FF1919F87F7FEABCBCDAD6D6C9D1D1C0D2D2C2D7
        D7CBB1B1E06364EF0B0BFC0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF2727FAA9A9CF4949C67D7DD0CDCDDAD8D7CBDAD5CDE5DED5EBE3D7EBE1D4E4
        D9CCD9D1C4DCD9C7C6C7DA3D3DF00000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF7878E6DADBC7DFDFD9E2DFD9F9F2E9FFF8EDFFF6E9FEF3E5FEF2E2FF
        F1DFFFEFDBF4E5CFE1D6C7DCDCD54F4FE80000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF8D8DD2E3E3DEEDE9E3FFF8EEFDF5EAFCF2E6FCF1E3FBEFE0FBEEDCFB
        ECD8FAEAD5FCE9D2FBE7CDE9DBC8DCDCD53232ED0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF1010F7C5C5D5EFEBE5FFF7EDFDF4EAFCF2E6FCF1E3FBEFE0FBEEDCFBECD8FA
        EAD5FAE8D2F9E7CFF9E5CAF9E1C3ECDFCCBABCD30404FC0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF6363DBF2F0E3FBF3EAFDF5EAFCF2E6FCF1E3FBEFE0FBEEDCFBECD8FAEAD5FA
        E9D4FAE9D4FAEAD4FAE9D3FAE5C9F4DBBCEFEAD54849E20000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0101
        FEAEAED2F6F1E9FDF4E9FCF2E6FCF1E3FBEFE0FBEDDCFBECD8FAEAD5FAE9D4FA
        E9D4FAEAD4FAEAD5FAECD9FBEEDCF9E2C3F2E2CA999BD20000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0D0D
        F8DDDDD2F8F1E7FDF3E7FCF1E3FBEFE0FBEEDCFBECD8FAEAD5FAE9D4FAE9D4FA
        EAD4FAEAD6FAEBD8FBEEDBFBF0E0FCEFDDF3DEC27474E30404FD0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF1B1B
        F0E5E5D5F9F0E5FDF2E4FBEFE0FBEEDCFBECD8FAEAD5FAE9D4FAE9D4FAEAD4FA
        EAD5FAEBD8FBEDDBFBEFDFFCF1E4FEF6EBF5E3CAA6A4DC0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF1717
        F2E4E2D3F9EFE2FCF0E0FBEDDCFBECD8FAEAD5FAE9D4FAE9D4FAEAD4FAEAD5FA
        EBD8FBEDDBFBEFDFFCF1E4FCF4E9FFF9F2F6E7D47C7AE40505FD0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0A0B
        F8C7C7D0F8EEDFFCEEDDFBECD8FAEAD5FAE9D4FAE9D4FAEAD4FAEAD6FAEBD8FB
        EEDBFBEFDFFCF1E4FCF4E9FDF7EEFFFBF6F6EADAA2A1D80000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF9B9BCFF5ECDDFCECD8FAEAD5FAE9D3FAE9D4FAEAD4FAEAD5FBEBD8FBEDDBFB
        EFDFFCF1E4FCF4E9FDF7EEFEF9F4FFFCF7F4EADA6464E20000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF4444E4EFEBD5F8E8D3FBE8D2FAE7D0FAEAD4FAEAD5FAEBD8FBEDDBFBEFDFFC
        F1E4FCF4E9FDF7EEFEF9F3FFFEFCFAF4ECDDD8D81414F70000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0303FDB4B5D1EFE4D1FBE6CDF9E5CBFAE9D4FAECD9FBEDDBFBEFDFFCF1E4FC
        F4E9FDF7EEFEF9F3FFFDF9FFFEFCEEE6D89C9BDB0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF2B2BEFDCDBD2ECDCC7FAE3C5FAE6CBFBEEDDFBF0E1FCF1E4FCF4E9FD
        F7EEFEF9F3FFFEFCFFFFFDEBE2D8C7C5D60808FC0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF4344EADBDAD3E4D6BFF3DABAFCE7CAFFF2E2FFF7EEFFFAF3FF
        FEF9FFFFFCF8F3EBE2D9CCC4C2D71A1AF80000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF2D2DF3BCBCDBE1DBC3DDCCB0E3CEB1EAD7BFEBDCC9E4
        D8C9DBD1C0CBC5C69A9AE00909FD0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0404FE4D4DF29F9FE57271E5A4A1CF7D7AD9A1
        9FD56A6AEA1818FB0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0202FF0000FF0505FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      OnClick = ibBusquedaClick
    end
    object ibCerrar: TBitBtn
      Left = 452
      Top = 29
      Width = 75
      Height = 38
      Cursor = crHandPoint
      Caption = 'Salir'
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
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0A0AFC3535
        ED6666E19392D29796D39999D38988D65D5DE42D2DF00908FC0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF2B2AF18585D7C4C3CCDFDF
        CDE0DFD2DEDDD7DEDED8DEDDD8DEDED6DFDFD1DFDECCC1C0CD7B7ADB2020F400
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF1414F78E8DD3CECDCADBDAD1DBDBD9E1E0
        DFE5E5E4E8E8E7E9E9E7E9E9E8E8E7E7E5E5E4E0E0DFDBDBD8DCDBD0CDCDC981
        81D60C0CFA0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF3C3CE8C0C0C4D7D6CCD9D9D8E3E2E2E6E6E3E2E1
        D9DAD8CCD1CFC3CCCABFCCCAC0D2D1C4DBD9CEE3E2DBE6E6E4E2E1E1D9D8D7D7
        D6CBBCBCC42A2AEF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF4C4CE1CCCBC1D2D2CEDDDCDCE2E2DED5D3C7B5B3B0898A
        A86465A84C4EAB4042AD4143AD4E50AB6869A88F8FA9BAB8B3D8D6CAE3E2E0DB
        DBDAD3D2CDC2C1C22E2EEC0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF3737E7C8C7BDD0CFCDDDDCDBDBD9CFB1B0AE6567A92427B2050A
        BC0108C90110D70118E20117E1010ED50107C7070CBB2B2DB26F70A9B9B8B2DD
        DCD3DCDBDAD0CFCBC1C0BD2323F00000FF0000FF0000FF0000FF0000FF0000FF
        0000FF1A1AF1B1B0BECDCCC8D9D9D7D4D3C78C8CAD2427B30103BA0117CD0434
        E30346F0014EF60154F90153F9014EF50345EF0331E10113CB0104B92F31B299
        99AED8D7CCD8D8D6CDCCC6A8A7C12020ED0000FF0000FF0000FF0000FF0000FF
        0C0CF7B1B0A8C8C7C3D4D3D2D7D6CA7E80B30A0DB3010DBF0330DE013BEC013A
        EC0E46EB2B5AEC3E67ED3D66ED2959EC0C45EB013AEC013BEB032DDB0109BD12
        16B48E90B4DAD9CED2D1D1CAC9C2A9A8A90505FC0000FF0000FF0000FF0000FF
        3333E6C5C4B0CBCAC8DBDAD09597BC080BB20113C50132E60136EA3C65EE9DB1
        F6E5EAFCFFFFFFFFFFFFFFFFFFFFFFFFE1E7FC95ABF53560ED0135EB0130E401
        0EC21215B4A8A8BFDADAD1C9C8C7C3C2AF1E1EF10000FF0000FF0000FF0000FF
        6A69CFC5C4B9D2D1CDC7C7CB2227B5010CC60130E81044EB9BB0F6FFFFFFFFFF
        FFD4DDFB9BAFF67E97F47F98F49EB1F6D9E1FBFFFFFFFFFFFF8FA7F50A3FEB01
        2DE60107C3343AB8D2D1CDCFCECCC6C5B65151DA0000FF0000FF0000FF0000FF
        9392BEC5C4BEDDDBD07A7CC50101C0012CE6164AECC6D2FAFFFFFFBCCAF94066
        EF0538EB012EEA012DEA012EEA012EEA073AEB466CEFC6D2FAFFFFFFBBCAF910
        45EB0127E30101BF9193C9DADACFC4C3BB8181C60000FF0000FF0000FF0808FC
        ABAAB4C6C5C1D7D6D32F33C40118DC053CEAB6C6F8FFFFFF88A1F50334EA0130
        EA0538EB0739EB0130EB0133EB083AEB0538EB012FEA0637EA97ACF6FFFFFFA7
        BAF70238E90110D9474BC7DCDBD2C5C4BE9291C00000FF0000FF0000FF0808FB
        BBB9ACCBC9C1C0C0D50B1BD1012BE75F83F1FFFFFFA2B5F70130EA0436EB0839
        EB0739EC0637EC4F71F2345BF00534EC0839EC0839EB0236EB0133EAB1C1F8FF
        FFFF4E77F00125E51C2AD0CECDD5C8C6BF9E9DBB0202FE0000FF0000FF0707FC
        AAA9B4CECBC1AEB0D90122DD043BE9CDD8FAF3F5FD1D4CEC0134EA083AEB0839
        EC0435EC1643EEF9FAFEB6C3F9012EEC0838EC0839EC083AEB0132EA2957EDFA
        FBFEBAC9F90134E90B2ADCBFC1D8CAC9BD9190C00000FF0000FF0000FF0000FF
        9190BFCDCABDABB3DF012DE62255ECFFFFFFACBDF80130E9073AEB0739EB0838
        EC0434EC1A45EEF5F7FEB9C5F9012FED0837ED0839EC0739EB063AEB0133E9BE
        CBF9F7F9FE144AEB0735E6BDC2DCCAC7B97F7FC80000FF0000FF0000FF0000FF
        6766D5CDCAB5A4B2DC0133EA3C67EDFFFFFF7F99F4012FE9073AEB0739EB0838
        EC0434EC1A44EEF4F6FDB7C3F9012EED0837ED0838EC0739EB073AEB012FE993
        A9F6FFFFFF2B5AEC043DEBB6BED7CBC8B24C4BE00000FF0000FF0000FF0000FF
        2323F1CECAAE9DAACF0136EA3965EDFFFFFF829CF4012EE9073AEB0739EB0838
        EC0434EC1A44EEF4F6FDB7C3F9012EED0837ED0838EC0739EB073AEB012FE996
        ACF6FFFFFF2858EC053FE9AFB6CBC1BFB21313F80000FF0000FF0000FF0000FF
        0000FF9896C3B0B7C20842E81A4EEBFBFCFEB8C6F90131E9063AEB0739EB0839
        EC0434EC1945EEF4F6FEB7C4F9012FEC0838EC0839EC0739EB0539EB0135EAC9
        D4FAF1F4FD0D44EB184DE6C0C1BD7A78CF0000FF0000FF0000FF0000FF0000FF
        0000FF1E1EF4C6C3B52F5EE10131EABDCBF8FAFBFE2C58ED0132EA083AEB0739
        EB0435EC1945EEF4F6FDB7C4F90130EC0838EC0739EB083AEB0130E93A64EFFF
        FFFFABBDF7012DEA466DDCC9C5B50F0FFA0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF5F5CDF5D6CD8002CEB4A72EEFFFFFFBBC9F90637EA0134EA073A
        EB0336EB1846EDF4F6FEB7C4F90131EB0739EB073AEB0133EA0D3DEBCAD5FAFF
        FFFF3B66ED0032EA7581D04341E90000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF6B6BDC172AF0002DEA99B0F6FFFFFFAABCF81341EB012F
        E90236EB1847EDF4F6FEB7C4F90132EB0639EB012EE91A47ECB7C6F9FFFFFF89
        A3F4002BEA2438EB4E4DE70000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF3135F00917F7073AE9A6B9F7FFFFFFDCE4FC5C7C
        F10234EA1647ECF4F6FEB7C5F80131E90639EB6583F2E5EBFDFFFFFF98AEF603
        37E80E1DF52C2EF20000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF090AFD040CFB000BFA7493F3F5F7FEE5EA
        FD093CEA1546ECF9FBFEBCC9F9012FE91446EBF2F5FEEFF3FE698AF2000AFA04
        0CFB0708FD0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0307FD0109FB0A18F92C5B
        EC0138E90E42EBD8E0FB98ADF60133E9033AE92F5DED0816F90108FB0205FE00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0205FD0208
        FB020CFA000BFA1447E80B41E7020CFA020CFA0208FC0204FE0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0101FF0000FF0000FF0101FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      ModalResult = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      OnClick = ibCerrarClick
    end
    object ibImprimir: TBitBtn
      Left = 375
      Top = 29
      Width = 75
      Height = 38
      Cursor = crHandPoint
      Hint = 'Imprimir'
      Caption = 'im&primir'
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
      TabOrder = 5
    end
  end
  object dgSeguimiento: TDBGrid
    Left = 0
    Top = 73
    Width = 568
    Height = 112
    Align = alClient
    DataSource = dsSeguimiento
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qySeguimiento: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM SEGUIMIENTO_COBRANZA(:P_MAYOR_A, :P_MENOR_QUE, :P_COLUMNAS)')
    Left = 104
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'P_MAYOR_A'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_MENOR_QUE'
        ParamType = ptUnknown
        Value = '10'
      end
      item
        DataType = ftString
        Name = 'P_COLUMNAS'
        ParamType = ptUnknown
        Value = '100'
      end>
  end
  object dsSeguimiento: TDataSource
    DataSet = qySeguimiento
    Left = 136
    Top = 128
  end
end
