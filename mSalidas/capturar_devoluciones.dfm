inherited frmCapturar_Devoluciones: TfrmCapturar_Devoluciones
  Left = 414
  Top = 292
  Caption = 'Devoluciones'
  ClientHeight = 411
  ClientWidth = 735
  OldCreateOrder = True
  PopupMenu = pmDevoluciones
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 735
    Height = 181
    Color = clBtnFace
    ExplicitWidth = 735
    ExplicitHeight = 181
    object Label1: TLabel [0]
      Left = 4
      Top = 4
      Width = 22
      Height = 13
      Caption = 'Folio'
    end
    object Label2: TLabel [1]
      Left = 290
      Top = 4
      Width = 21
      Height = 13
      Caption = 'Caja'
    end
    object Label4: TLabel [2]
      Left = 464
      Top = 4
      Width = 41
      Height = 13
      Caption = 'Almacen'
    end
    object Label3: TLabel [3]
      Left = 120
      Top = 4
      Width = 58
      Height = 13
      Caption = 'Fecha Inicio'
    end
    object Label6: TLabel [4]
      Left = 205
      Top = 4
      Width = 47
      Height = 13
      Caption = 'Fecha Fin'
    end
    inherited Panel1: TPanel
      Width = 735
      TabOrder = 10
      ExplicitWidth = 735
    end
    object cbCajas: TDBLookupComboBox
      Left = 290
      Top = 19
      Width = 144
      Height = 21
      KeyField = 'ID'
      ListField = 'NOMBRE'
      ListSource = dsCajas
      TabOrder = 3
    end
    object cbAlmacenes: TDBLookupComboBox
      Left = 464
      Top = 19
      Width = 144
      Height = 21
      KeyField = 'ID'
      ListField = 'NOMBRE'
      ListSource = dsAlmacenes
      TabOrder = 5
    end
    object deFechaInicio: TDateTimePicker
      Left = 120
      Top = 19
      Width = 82
      Height = 21
      Date = 42129.447847754600000000
      Time = 42129.447847754600000000
      TabOrder = 1
    end
    object sbSinCaja: TBitBtn
      Left = 435
      Top = 19
      Width = 21
      Height = 21
      Hint = 'Sin Caja'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95
        DF9588D78845816F63AB7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6EC291409A602A8F9F28698F2580B61C729455BD60FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95DF954AAB603594B451A3BF4A
        B1E253BBE450BCEF1C7CC2155F7871D471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A6E4A6207D7C4691B163CDF845B0E450BCF955C2F440AADF44A8DA1A82CF155F
        7855BD60FFFFFFFFFFFFFFFFFF71D471207D7C206F916AD2F447AFF45AC8F950
        BCF940AAF455C2F44FB4E53AA4D90054AA409A60B8E9B8FFFFFF78C883388F91
        6DD1F166D4F156BAF14BAEF44AAEF154BAFF53BBEB53BBEB4AA3E14093DD3D88
        D2054E966EB683FFFFFF15788A2382AD2E94BF2089BF48B3E953BFF44AB6FF40
        AAE950BCEF3AA4D9407ECB3587CF4577CF0547AF20656091CF9195D28AB1D2A6
        FFFFFFFFFFFF4197AB288BB645B1E44599D9357CC92A65BF4887CF306BC440AA
        DF40AADF0054AA588A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8DACB4C8EA445
        8ED9357CC92A65BF3D92DA50BCF940AAF440AADF0054AA5F8A7FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A76A43181D46DD1FF60CFEA40AAF450BC
        F9258DD90A5A91669C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D
        D2C154AFD44AAEE942ABD83886B7528CBA36598B4AAB60ADDFB1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4BBB49FA79F9B99
        9B3F5663606540FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD1E2C6677D5C7CC1CA3C9BDF3C332798AF8DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95DF958A8F
        8A8A8F8ADBBBBB95BB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = sbSinCajaClick
    end
    object sbSinAlmacen: TBitBtn
      Left = 609
      Top = 19
      Width = 21
      Height = 21
      Hint = 'Sin Almacen'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95
        DF9588D78845816F63AB7CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFF6EC291409A602A8F9F28698F2580B61C729455BD60FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95DF954AAB603594B451A3BF4A
        B1E253BBE450BCEF1C7CC2155F7871D471FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        A6E4A6207D7C4691B163CDF845B0E450BCF955C2F440AADF44A8DA1A82CF155F
        7855BD60FFFFFFFFFFFFFFFFFF71D471207D7C206F916AD2F447AFF45AC8F950
        BCF940AAF455C2F44FB4E53AA4D90054AA409A60B8E9B8FFFFFF78C883388F91
        6DD1F166D4F156BAF14BAEF44AAEF154BAFF53BBEB53BBEB4AA3E14093DD3D88
        D2054E966EB683FFFFFF15788A2382AD2E94BF2089BF48B3E953BFF44AB6FF40
        AAE950BCEF3AA4D9407ECB3587CF4577CF0547AF20656091CF9195D28AB1D2A6
        FFFFFFFFFFFF4197AB288BB645B1E44599D9357CC92A65BF4887CF306BC440AA
        DF40AADF0054AA588A7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA8DACB4C8EA445
        8ED9357CC92A65BF3D92DA50BCF940AAF440AADF0054AA5F8A7FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3A76A43181D46DD1FF60CFEA40AAF450BC
        F9258DD90A5A91669C7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9D
        D2C154AFD44AAEE942ABD83886B7528CBA36598B4AAB60ADDFB1FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB4BBB49FA79F9B99
        9B3F5663606540FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD1E2C6677D5C7CC1CA3C9BDF3C332798AF8DFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95DF958A8F
        8A8A8F8ADBBBBB95BB8AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = sbSinAlmacenClick
    end
    object dgVentas: TDBGrid
      Left = 0
      Top = 51
      Width = 735
      Height = 130
      Align = alBottom
      DataSource = dsBusqueda
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
    object deFechaFin: TDateTimePicker
      Left = 205
      Top = 19
      Width = 82
      Height = 21
      Date = 42129.447858252300000000
      Time = 42129.447858252300000000
      TabOrder = 2
    end
    object buExplorar: TBitBtn
      Left = 640
      Top = 4
      Width = 42
      Height = 45
      Cursor = crHandPoint
      Hint = 'explorar'
      Caption = 'explorar'
      Glyph.Data = {
        F6090000424DF6090000000000003600000028000000200000001A0000000100
        180000000000C0090000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FFC7D0C29BB78B81B3617DB8557DBA557FBB5781BA
        5B83B96086B86691B679A5BC96C8D0C50000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFB5C0AF639C3D6FB73E82C35890C66E95C9779ACA7A96CA
        7793C7718BC56680C15671BA4265A63996AE880000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF8BB66E
        7DB75792BC7AABBCA163984072B8438CC568A0CC82AED295B5D59FB8D7A3B8D7
        A2B4D49EACD293A1CD8593C6727BBE4E64A4380000FF0000FF0000FF0000FF00
        00FFCFC4C3BF908FD0C3C30000FF0000FF0000FF0000FF0000FF0000FF77BB4A
        9ECE7CA0D48170AE454F892880C05697C977A9D08FB8D6A3C1DBAFC4DDB4C3DD
        B4C1DBAFBAD7A6AED3959ECC8288C3626CAD400000FF0000FF0000FFCAC5C5BE
        8C8CE2AAA6FFD8CFCBADAB0000FF0000FF0000FF0000FF0000FF0000FF85C15D
        ABD290BCDAA893C7724D86287ABB4F97C976B6D6A2C5DDB5C3DCB2C8DFBBC8DF
        BAC5DDB6BED9ABB1D39A9FCC848AC4656EAF4379A75C87B76EB8948BEDB7B4FF
        E3DBFFE1D8FFE2DAD0BCBB0000FF0000FF0000FF0000FF0000FF0000FF93C275
        9FCF7EB9D9A59ECF7D5792306BAC4190C76CBFDAADCFE2C3BFDCB0C4DDB5C5DE
        B5C1DCB1BAD7A7ACD2929ACA7C84C15C64A6377BB85290CF6FD9C8A7FAD5D4ED
        C0BBF4CBC5E2C3BDD8D9D90000FF0000FF0000FF0000FF0000FF0000FFB2C8A4
        7FC352B1D59A93CA6F63A1395A963386C25EBEDBACCFE2C3BDD9AAB9D7A5BBD8
        A7B9D6A3B0D499A3CE878FC56D7ABA4D629F348FC46C95CC77D5B49EFDDDDBFF
        EBE3E2B7B2B49F9DE3C5C0C4A1A10000FF0000FF0000FF0000FF0000FF0000FF
        6CAD43BDDCA9A1CE826BB33C4D822B72B347B6D8A0C9E0BBB5D6A0A5D08BA8D1
        8EA6D08BA2CE8698C97A83BF5A6CAD415A993297CC7698C074FDE6E3FCE5E1F5
        CFC9FAD3CDFFE9E7FFEBE4DCA7A2E2E2E30000FF0000FF0000FF0000FF0000FF
        BBCCAF83BE5BCEE3BF8ECA684F8A27609C35AAD38EC3DCB3B0D29893C67397C8
        7899C97A99CA7B94C77379B84F629C3C56952CABD9919BA780FAD8D9FFDAD5FF
        E3E4FFDEDEAEB793D6C2AFF2BEBACCBEBF0000FF0000FF0000FF0000FF0000FF
        0000FF92B27FA1CB85DBEAD17FBB57518F299ACA7BC4DDB5AFD3978DC46A93C6
        7198C9799ECC8298CB786BA8444D842B77AB58B0CE94FAD5D5FFEAF0F1D8D287
        B27A199729008C005D9950FFD4D5BE9E9D0000FF0000FF0000FF0000FF0000FF
        0000FF0000FFAFC7A1BAD8A6BBDEA45291288BBF68D1E4C4BDD9A9ABD091AFD2
        96B1D599B7D7A193C474588D344E842CBCD59FEDDAD1D8D6C667B6701CA83A08
        A32B0EA02A089B242B902DFFDBDAC192900000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FFDBE2D78EB87443831975B24CDFEBD7C9DFB9C1DBB0C3DC
        B1C5DDB5C8E4B6649C3F31680F849D5ABAD0AE65C77F23BB4F1DB84823B4471F
        AB3D19A536119F2C059019F4D3C9D99A98E2E9E80000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFABBEA056952B9CCC7DCDE3BDCBE0BCCCE1
        BDC6E0B46DAA46698F4ECDC6B672DB9931D8703BD06D3BC86735C05C2DBA5325
        B1471FAC3F19A536009618B8BC9DFCC2C3C3B8B90000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFDCDFDB69964E6EA84888BF6281B9
        5B619D3A8DA57FE8E6ECF7D2DB6EE0974BDC8148D47940CD6E39C66432BE5A2B
        B74F24B1451FAA3E01A02480AA72FFDDE0BA95940000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFE4E2EA9AC37E85C05F97CA7794C8
        7282C05AA7C595DFDEE6E1BCC078CA864FE58C4DDA8146D3763FCB6C37C56432
        BE572AB74E24AF4411A933489F4BFFE8EABF87870000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFE7E8E97DB8548BC764AED494BCDAA8B9D9
        A4A8D18B7CC34D90BC78DDC0CA87C48434DF7357E18E4CD97E45D2753ECA6C36
        C36030BC5729B54D1EAE3F23A038F4DCD8D39696DAD6D60000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFA4C2926FBC3B9CCB7CB1D599BAD9A6B9D8
        A3ADD3948FC66A67B439B2AB9AB0D3A915DB5659E49252DF864AD77D43D0743C
        C96836C25E2FBB5425B34915A635D1C6B3F0B6B5C9B9BA0000FF0000FF0000FF
        0000FF0000FF0000FF0000FFEFECF170AF4676BA4893C7709ECC80A4CF87A2CF
        869CCC7D8BC46466B335819B54D3CCBF12E05752E78B59E49150DD864AD67D42
        CE723CC96835C25E2EB95316B03E91B181FFDBDCBC97970000FF0000FF0000FF
        0000FF0000FF0000FF0000FFE1E3E166A43D70B84083C05B89C2628DC4688CC4
        6787C1607CBF5265B037688C3CE8CDCC18E7604FEC8D5FE99955E38C50DB8548
        D67A40D07036C86328BF5511B53F61A55FFFECEFC48A890000FF0000FF0000FF
        0000FF0000FF0000FF0000FFE5E6E6629C3C64AE3291C76D9CCB7C85C15F82C0
        5B7EBF5470B8405CA4316A8F48EFC5CE25E76755F49860F09F52EA9345E48538
        DA7539CB6B4AC36C78BC7DABC59FE7D5CBFFF7F1D59190E4E5E50000FF0000FF
        0000FF0000FF0000FF0000FF0000FF79A65D5BA22DB7DAA0C7E0B8A9D18DA1CE
        839FCE808BC56550942391A884F3C0CF42E0765FF8A472E6A189DFA5AADCB5D7
        DFCEFEE8E5FFE8ECFFE4E8F3DCDEF1D6D4E0C4C2D6C9CA0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FFC6D1C14C8E20BADDA3C9E0BABFDBABBFDB
        ACC3DFB398CB78568D32DEE2DED8C0C2E1E4D5E4EDE1F4F0EEFFEEF0FFDFE3E6
        C9CCD4C8C8DFD4D3EEE5E5EDE8E8F0F0F00000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FFABBE9F71AA4DC7E2B6DBEBCFD9EB
        CDB9DBA35D9538CCD4C90000FFD8CCCBE8DDDEE8D6D7E1D1D1DAD4D4EAECEB00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FFD3DBCF98B6848EB3758DB1
        749CB68CE9EAE80000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF}
      ParentShowHint = False
      ShowHint = False
      Spacing = 3
      TabOrder = 8
      OnClick = buExplorarClick
    end
    object buSalir: TBitBtn
      Left = 685
      Top = 4
      Width = 42
      Height = 45
      Cursor = crHandPoint
      Hint = 'Salir'
      Caption = '&Salir'
      Glyph.Data = {
        BE080000424DBE0800000000000036000000280000001C0000001A0000000100
        18000000000088080000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF3B75
        3E16891B1682184872490000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF2597261BB73B2CC25140D66414A9230F86
        133E713F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF2DA03831CB6433CD6868FE9A40DB7236CE6419B12A0890083773370000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2B9F3B32CC6532CC67
        67FF9B3FD87144DE7546DE7A43DA7322BD3C0C970E29772A0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF2DA03933CC6533CB6766FE9A40DA7344DE7546DE7A
        4AE27E4CE67D4CE48031CC5309A30E2F782F0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2D
        9F3B33CC6534CD6666FF9842DC7344DC7847DF7C4BE37F4CE57E4DE78050EA83
        53ED862AC447118C0C0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF32A34232CC6532CC6763FF9849
        E07943DD7847E27949E47B4EE38150E98251E98554EE8957EF8B39D15A198919
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF38A93B1BB63532C9624FE67F62FC975EF79052EC854AE57C4C
        E48050E88454EC8855EE8758F18A5AF48F29C13F4B894D0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF7FC2
        7F26A22711A92225BC4846DE7A5AF38C65FB975AF48F53EC8552ED8456EF8859
        F38A5AF2925EF2880D910F0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        2D7E291489164794430000FF0000FF0000FF0000FF0000FF0000FF51B25212A3
        1818B33331CC5F4FE98460FA935BF39057EF8B56F38B59F68E5DF5911DB82E00
        00FF0000FF0000FF0000FF0000FF0000FF247F221CB53A30CA612193210000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF8DC78D33A33315AF2C37D0
        695CF4905EF4905AF58C5CF58E60F9923CD55C5095520000FF0000FF0000FF00
        00FF20812117AF2E33CC6533CC651F901E0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF4BAA4916AE2D35CF6861FB965CF4905CF6
        8F60FB904AE3703A913B0000FF0000FF0000FF25812212AD2630CD6533CB6732
        CC67178A150000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF299B262CC5584CE67F62FB945DF69360F99262FC972091230000
        FF0000FF2A7F2A13AE2431CB6635CB6732CC6733CC65079709267629526D5376
        78790000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF18B332
        3DD57166FD965DF69360FA9566FD962193210000FF3F784113AE2433CC6532CC
        6733CC6532CC6733CB6836CA6425BC4117AF260E9210237A2442704172727200
        00FF0000FF0000FF0000FF0000FF0000FF1CB43332CC6763FC9560F89461FA93
        63FD98219321558E5709A31442DA7643DC7533CB6732CC6533CB6733CD6435CF
        6838D26D3AD46D3ED7702BC4501DB7340E9C141B7D19387339626D650000FF00
        00FF577E581AB23337D16A5FF99461F89163FC9564FE9921912309990B2DC758
        43DB7266FE9535CE6732CC6732CD6434CC6937D16838D16A3BD5703ED87141DA
        7344DC7844DE773BD46726BE3F0FA7181385102E712E167F1625C04D47E0795D
        F79260F89463FC9566FF9822922473B67113AE2D33CD684BE58057F08935CC65
        32CC6735CE6737D06938D26B3ED6723FD87142DA7643DD7849E0794BE17D4BE7
        7C4FE88147E17233CD562CC74E4AE27E5EF58E5DF79262FB9463FD9666FE9A20
        95200000FF2FA13026BE4D32CC655CF49043DD7834CD6634CC6837D16C3AD370
        3CD47042D77544DB7445DF7648E2794AE27E4EE7804EE88351EB8656EF8857F0
        895CF38C5DF5915FF99262FC9363FD9868FF982696260000FF0000FF0D9F1730
        C9623CD66F63FD9837D16838D06C37D0693BD46D3ED67240D97243DB7746DF78
        48E17A49E5804FE67F4FE88553EB8757EF8655F28A5BF38F5DF7925FF99262FB
        9464FE9950E6744A9F4A0000FF0000FF73B67119AF2D32CC6749E27B57EF8B36
        CE6A4BE47D63FB975CF58E54ED864CE57E48E07C49E17D4BE57E50E78054EA86
        52EC8556EF8859F18D5BF48D5EF79060F99263FB9766FF9B2DC54378B2780000
        FF0000FF0000FF2EA02E25BF4E32CA665BF18D46E07B29BF4E30C95C43DC794F
        E9805AF38C65FF9A62FC955CF49158F28D54EE8753ED8656EE8A5AF28E5DF68F
        5EF89166FA9664FE975DF88F1AA51E0000FF0000FF0000FF0000FF0000FF0CA1
        152FC96039D16D60FA9110960E39A2391DA41E0CA6191AB33229BF4D3BD76C4E
        E48054EE8762FB9467FD9963FB9761F9955EF89360FA9362FB9465FC9528C039
        6BB56D0000FF0000FF0000FF0000FF0000FF71B67317AF2D32CC6748E37A2293
        210000FF0000FF0000FF0000FF5FB66036A73508A21311AC2521BA412EC85947
        DD794CE98158F28D4FE87B42D76119B3265DB45E0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF2FA12F29BF4E34CD662A9F2C0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF7AC37B54AF5236A73536A73536A93450AF546E
        BD6E0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0FA01520A12061B7630000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF}
      ParentShowHint = False
      ShowHint = False
      Spacing = 3
      TabOrder = 9
      OnClick = buSalirClick
    end
    object edFolio: TEdit
      Left = 4
      Top = 18
      Width = 114
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnKeyPress = edFolioKeyPress
    end
  end
  object fpCaptura: TPanel
    Left = 0
    Top = 181
    Width = 735
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Caption = 'fpCaptura'
    Color = 14933717
    TabOrder = 1
    object buF4: TBitBtn
      Left = 4
      Top = 3
      Width = 42
      Height = 45
      Cursor = crHandPoint
      Hint = 'Devolucion'
      Caption = 'Devol.'
      Enabled = False
      Glyph.Data = {
        F6090000424DF60900000000000036000000280000001F0000001A0000000100
        180000000000C0090000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF3B75
        3E16891B1682184872490000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2597261BB7
        3B2CC25140D66414A9230F86133E713F0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2DA03831CB
        6433CD6868FE9A40DB7236CE6419B12A0890083773370000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2B9F3B32CC
        6532CC6767FF9B3FD87144DE7546DE7A43DA7322BD3C0C970E29772A0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2DA03933CC
        6533CB6766FE9A40DA7344DE7546DE7A4AE27E4CE67D4CE48031CC5309A30E2F
        782F0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF2D9F3B33CC
        6534CD6666FF9842DC7344DC7847DF7C4BE37F4CE57E4DE78050EA8353ED862A
        C447118C0C0000FF0000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF32A34232CC
        6532CC6763FF9849E07943DD7847E27949E47B4EE38150E98251E98554EE8957
        EF8B39D15A1989190000FF0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF38A93B1BB6
        3532C9624FE67F62FC975EF79052EC854AE57C4CE48050E88454EC8855EE8758
        F18A5AF48F29C13F4B894D0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF7FC2
        7F26A22711A92225BC4846DE7A5AF38C65FB975AF48F53EC8552ED8456EF8859
        F38A5AF2925EF2880D910F0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF0000FF2D7E291489164794430000FF0000FF0000FF0000
        FF0000FF0000FF51B25212A31818B33331CC5F4FE98460FA935BF39057EF8B56
        F38B59F68E5DF5911DB82E0000FF0000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF0000FF247F221CB53A30CA612193210000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF8DC78D33A33315AF2C37D0695CF4905EF4905A
        F58C5CF58E60F9923CD55C5095520000FF0000FF0000FF0000000000FF0000FF
        0000FF0000FF20812117AF2E33CC6533CC651F901E0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF4BAA4916AE2D35CF6861FB965C
        F4905CF68F60FB904AE3703A913B0000FF0000FF0000FF0000000000FF0000FF
        0000FF25812212AD2630CD6533CB6732CC67178A150000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF299B262CC5584CE67F62
        FB945DF69360F99262FC972091230000FF0000FF0000FF0000000000FF0000FF
        2A7F2A13AE2431CB6635CB6732CC6733CC65079709267629526D537678790000
        FF0000FF0000FF0000FF80000080000080000080000080000080000080000080
        00008000008000008000008000008000008000008000000000000000FF3F7841
        13AE2433CC6532CC6733CC6532CC6733CB6836CA6425BC4117AF260E9210237A
        244270417272720000FF8000000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF800000000000558E5709A314
        42DA7643DC7533CB6732CC6533CB6733CD6435CF6838D26D3AD46D3ED7702BC4
        501DB7340E9C141B7D198000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000000000000000FF80000000000009990B2DC758
        43DB7266FE9535CE6732CC6732CD6434CC6937D16838D16A3BD5703ED87141DA
        7344DC7844DE773BD4678000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000000000000000FF80000000000073B67113AE2D
        33CD684BE58057F08935CC6532CC6735CE6737D06938D26B3ED6723FD87142DA
        7643DD7849E0794BE17D8000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000000000000000FF8000000000000000FF2FA130
        26BE4D32CC655CF49043DD7834CD6634CC6837D16C3AD3703CD47042D77544DB
        7445DF7648E2794AE27E8000000000FF0000000000000000FF0000FF0000FF00
        00FF0000000000000000000000000000000000FF8000000000000000FF0000FF
        0D9F1730C9623CD66F63FD9837D16838D06C37D0693BD46D3ED67240D97243DB
        7746DF7848E17A49E5808000000000FF00000000000000000000000000000000
        00FF0000000000000000FF0000000000000000FF8000000000000000FF0000FF
        73B67119AF2D32CC6749E27B57EF8B36CE6A4BE47D63FB975CF58E54ED864CE5
        7E48E07C49E17D4BE57E8000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000000000000000000000000000FF8000000000000000FF0000FF
        0000FF2EA02E25BF4E32CA665BF18D46E07B29BF4E30C95C43DC794FE9805AF3
        8C65FF9A62FC955CF4918000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000000000000000000000000000FF8000000000000000FF0000FF
        0000FF0000FF0CA1152FC96039D16D60FA9110960E39A2391DA41E0CA6191AB3
        3229BF4D3BD76C4EE4808000000000FF0000000000000000FF0000FF0000FF00
        00FF0000FF0000FF0000000000000000000000FF8000000000000000FF0000FF
        0000FF0000FF71B67317AF2D32CC6748E37A2293210000FF0000FF0000FF0000
        FF5FB66036A73508A2138000000000FF00000000000000000000000000000000
        00FF0000FF0000FF0000FF0000000000000000FF8000000000000000FF0000FF
        0000FF0000FF0000FF2FA12F29BF4E34CD662A9F2C0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF8000000000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF8000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0FA01520A12061B7630000FF0000FF0000FF0000
        FF0000FF0000FF0000FF80000080000080000080000080000080000080000080
        0000800000800000800000800000800000800000800000000000}
      ParentShowHint = False
      ShowHint = False
      Spacing = 3
      TabOrder = 0
      OnClick = buF4Click
    end
  end
  object dgDatalle: TDBGrid
    Left = 0
    Top = 231
    Width = 735
    Height = 180
    Align = alClient
    DataSource = dsPartidas
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object TCajas: TIBTable
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
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'ALMACEN'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'USUARIO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'TIPO_DE_CAJA'
        DataType = ftString
        Size = 11
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MODULO_FUNCION'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    Filter = 'TIPO_DE_CAJA = "Ventas"'
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY227'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN228'
        Fields = 'ALMACEN'
      end
      item
        Name = 'RDB$FOREIGN229'
        Fields = 'USUARIO'
      end
      item
        Name = 'RDB$FOREIGN255'
        Fields = 'MODULO_FUNCION'
      end>
    IndexFieldNames = 'ID'
    StoreDefs = True
    TableName = 'CAJAS'
    UniDirectional = False
    Left = 368
    Top = 122
    object TCajasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TCajasNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object TCajasALMACEN: TIntegerField
      FieldName = 'ALMACEN'
      Required = True
    end
    object TCajasUSUARIO: TIntegerField
      FieldName = 'USUARIO'
      Required = True
    end
    object TCajasTIPO_DE_CAJA: TIBStringField
      FieldName = 'TIPO_DE_CAJA'
      Size = 11
    end
    object TCajasESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TCajasMODULO_FUNCION: TIntegerField
      FieldName = 'MODULO_FUNCION'
      Required = True
    end
  end
  object dsCajas: TDataSource
    DataSet = TCajas
    Left = 400
    Top = 122
  end
  object dsAlmacenes: TDataSource
    DataSet = qyAlmacenes
    Left = 504
    Top = 111
  end
  object qyAlmacenes: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ALMACENES'
      'WHERE (VENDE = '#39'Si'#39') AND (ESTATUS = '#39'En Operacion'#39')')
    Left = 472
    Top = 111
    object qyAlmacenesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyAlmacenesCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object qyAlmacenesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
    object qyAlmacenesCOMPRA: TIBStringField
      FieldName = 'COMPRA'
      Size = 2
    end
    object qyAlmacenesVENDE: TIBStringField
      FieldName = 'VENDE'
      Size = 2
    end
    object qyAlmacenesTRANSFORMA: TIBStringField
      FieldName = 'TRANSFORMA'
      Size = 2
    end
    object qyAlmacenesFECHA_ALTA: TDateTimeField
      FieldName = 'FECHA_ALTA'
    end
    object qyAlmacenesRESPONSABLE: TIntegerField
      FieldName = 'RESPONSABLE'
      Required = True
    end
    object qyAlmacenesOBSERVACIONES: TBlobField
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object qyAlmacenesSERIE_FACTURA: TIBStringField
      FieldName = 'SERIE_FACTURA'
      Size = 10
    end
    object qyAlmacenesCONSECUTIVO: TIntegerField
      FieldName = 'CONSECUTIVO'
    end
    object qyAlmacenesFECHA_ULT_INV: TDateTimeField
      FieldName = 'FECHA_ULT_INV'
    end
    object qyAlmacenesESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
  end
  object qyBusqueda: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    AfterOpen = qyBusquedaAfterOpen
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM BUSQUEDA_FOLIO_VENTA(:P_FOLIO, :P_FECHA_INICIO, :P_FECHA_FI' +
        'N, :P_CAJA, :P_ALMACEN)'
      'ORDER BY R_FECHA, R_ALMACEN, R_CAJA, R_FOLIO_DE_VENTA')
    Left = 256
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FOLIO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_INICIO'
        ParamType = ptUnknown
        Value = '03/12/2001'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_FIN'
        ParamType = ptUnknown
        Value = '28/07/2003'
      end
      item
        DataType = ftString
        Name = 'P_CAJA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyBusquedaR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyBusquedaR_FOLIO_DE_VENTA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_DE_VENTA'
      ReadOnly = True
    end
    object qyBusquedaR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyBusquedaR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBusquedaR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyBusquedaR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBusquedaR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyBusquedaR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBusquedaR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyBusquedaR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBusquedaR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyBusquedaR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyBusquedaR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
    object qyBusquedaR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
  end
  object dsBusqueda: TDataSource
    DataSet = qyBusqueda
    Left = 288
    Top = 136
  end
  object dsPartidas: TDataSource
    DataSet = qyPartidas
    OnDataChange = dsPartidasDataChange
    Left = 288
    Top = 296
  end
  object qyPartidas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsBusqueda
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PVENTAS_PARTIDAS(:R_ID)')
    Left = 256
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptUnknown
      end>
    object qyPartidasR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyPartidasR_PUNTO_DE_VENTA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PUNTO_DE_VENTA'
      ReadOnly = True
    end
    object qyPartidasR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyPartidasR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyPartidasR_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyPartidasR_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD'
      ReadOnly = True
    end
    object qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION_UNIDAD'
      ReadOnly = True
      Size = 50
    end
    object qyPartidasR_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CANTIDAD'
      ReadOnly = True
      DisplayFormat = '###,###,###,##0.00'
    end
    object qyPartidasR_PRECIO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRECIO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUBTOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_IVA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IVA'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_IMPUESTO1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO1'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_IEPS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IEPS'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_IMPUESTO2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO2'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_DESCUENTO_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_PORC'
      ReadOnly = True
      DisplayFormat = '##0.00 %'
    end
    object qyPartidasR_DP: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DP'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_DG: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DG'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_GT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GT'
      ReadOnly = True
      DisplayFormat = '$ ###,###,###,##0.00'
    end
    object qyPartidasR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyPartidasR_CAJAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJAS'
      ReadOnly = True
    end
    object qyPartidasR_UNIDAD_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyPartidasR_ROWS: TIntegerField
      FieldName = 'R_ROWS'
      Origin = 'PVENTAS_PARTIDAS.R_ROWS'
    end
    object qyPartidasR_IVA_PORC: TFloatField
      FieldName = 'R_IVA_PORC'
      Origin = 'PVENTAS_PARTIDAS.R_IVA_PORC'
    end
    object qyPartidasR_IEPS_PORC: TFloatField
      FieldName = 'R_IEPS_PORC'
      Origin = 'PVENTAS_PARTIDAS.R_IEPS_PORC'
    end
    object qyPartidasR_IMPUESTO1_PORC: TFloatField
      FieldName = 'R_IMPUESTO1_PORC'
      Origin = 'PVENTAS_PARTIDAS.R_IMPUESTO1_PORC'
    end
    object qyPartidasR_IMPUESTO2_PORC: TFloatField
      FieldName = 'R_IMPUESTO2_PORC'
      Origin = 'PVENTAS_PARTIDAS.R_IMPUESTO2_PORC'
    end
    object qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField
      FieldName = 'R_PRECIO_SIN_IMPUESTOS'
      Origin = 'PVENTAS_PARTIDAS.R_PRECIO_SIN_IMPUESTOS'
    end
    object qyPartidasR_MEDIDA: TIntegerField
      FieldName = 'R_MEDIDA'
      Origin = 'PVENTAS_PARTIDAS.R_MEDIDA'
    end
    object qyPartidasR_COLOR: TIntegerField
      FieldName = 'R_COLOR'
      Origin = 'PVENTAS_PARTIDAS.R_COLOR'
    end
    object qyPartidasR_VENDEDOR: TIntegerField
      FieldName = 'R_VENDEDOR'
      Origin = 'PVENTAS_PARTIDAS.R_VENDEDOR'
    end
    object qyPartidasR_VENDEDOR_NOMBRE: TIBStringField
      FieldName = 'R_VENDEDOR_NOMBRE'
      Origin = 'PVENTAS_PARTIDAS.R_VENDEDOR_NOMBRE'
      Size = 100
    end
    object qyPartidasR_HAY_OFERTA: TIBStringField
      FieldName = 'R_HAY_OFERTA'
      Origin = 'PVENTAS_PARTIDAS.R_HAY_OFERTA'
      Size = 2
    end
    object qyPartidasR_OFERTA_PORC: TFloatField
      FieldName = 'R_OFERTA_PORC'
      Origin = 'PVENTAS_PARTIDAS.R_OFERTA_PORC'
    end
    object qyPartidasR_HAY_EXISTENCIA: TIBStringField
      FieldName = 'R_HAY_EXISTENCIA'
      Origin = 'PVENTAS_PARTIDAS.R_HAY_EXISTENCIA'
      Size = 2
    end
    object qyPartidasR_SERIE: TIBStringField
      FieldName = 'R_SERIE'
      Origin = 'PVENTAS_PARTIDAS.R_SERIE'
      Size = 50
    end
  end
  object pmDevoluciones: TPopupMenu
    Left = 224
    Top = 296
    object itemF4: TMenuItem
      Caption = 'Agregar Partida'
      ShortCut = 115
      OnClick = itemF4Click
    end
  end
  object spADD_PARTIDA_DEVOLUCION: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE ADD_PARTIDA_DEVOLUCION(:P_VENTA, :P_PARTIDA)')
    Left = 320
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'P_VENTA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_PARTIDA'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
end
