inherited frmPRN_0003_TXT: TfrmPRN_0003_TXT
  Left = 208
  Top = 115
  ActiveControl = ceConsecutivo
  Caption = 'Re-Impresion'
  ClientHeight = 381
  ClientWidth = 782
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  ExplicitWidth = 798
  ExplicitHeight = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 782
    Height = 50
    Color = clBtnFace
    ExplicitWidth = 782
    ExplicitHeight = 50
    object Label3: TLabel [0]
      Left = 5
      Top = 4
      Width = 30
      Height = 13
      Caption = 'Fecha'
    end
    object Label1: TLabel [1]
      Left = 100
      Top = 4
      Width = 36
      Height = 13
      Caption = 'Factura'
    end
    inherited Panel1: TPanel
      Width = 782
      TabOrder = 5
      ExplicitWidth = 782
    end
    object deFecha: TEdit
      Left = 5
      Top = 19
      Width = 91
      Height = 21
      TabOrder = 0
    end
    object ceConsecutivo: TEdit
      Left = 100
      Top = 19
      Width = 92
      Height = 21
      TabOrder = 1
      OnKeyPress = ceConsecutivoKeyPress
    end
    object buExplorar: TBitBtn
      Left = 193
      Top = 3
      Width = 42
      Height = 45
      Cursor = crHandPoint
      Hint = 'explorar'
      Caption = 'eXplorar'
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
      TabOrder = 2
      OnClick = buExplorarClick
    end
    object buReImprimir: TBitBtn
      Left = 237
      Top = 3
      Width = 42
      Height = 45
      Cursor = crHandPoint
      Hint = 'Imprimir'
      Caption = 'im&Primir'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        0E100000424D0E100000000000003600000028000000340000001A0000000100
        180000000000D80F0000000000000000000000000000000000000000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FFC6BDBDB5ADADC6BDBDADA5A5736B6B6B636394848400
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF1842CE314AC63152BD0000FF
        D6C6BDB5A59CBDADADEFDED6FFF7EFF7E7DECEBDBD7363635A4A4A7363630000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FFC0C0C0C0C0C0C0C0C00000FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF
        0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF184ACE294AC6DEADA5D69C94C684737B6352AD948CDE
        CEBDF7E7D6FFE7DEF7DED6EFD6CEF7E7D6FFEFEFB5A5A56B6363635A5A0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C00000
        FFC0C0C00000FFC0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF0031CE
        1842CE214AC6E7CEC6FFE7DEFFDECEF7AD9CDE847BB59484F7D6C6FFEFDEEFD6
        C6E7CEBDEFD6C6EFD6C6F7D6C6FFFFFFFFFFFFEFDEE79C8C8C8C84840000FF00
        00FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FFC0C0C0
        0000FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FFC0C0C00000FF0000FF0000FF0839CE214ACEDEB5ADF7DED6FF
        EFF7FFFFFFFFEFF7FFD6CEF7B5ADEF9C8CA58C73B5947BDEAD94FFC6B5FFCEBD
        FFCEBDEFD6BDE7DEC6EFD6C6F7F7E7FFFFFFFFF7F7D6BDBD0000FF0000FF0000
        FFC0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0
        C0C00000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFC0C0C00000FF0000FF1042CECEC6BDE7D6CEFFF7EFFFF7EFFFF7EFFFEF
        EFFFE7E7FFD6D6FFBDB5EF9C94AD8473A57B6BA57B6BC69484E7BDADF7CEBDEF
        C6B5EFCEBDFFDECEEFE7D6E7E7DEF7E7E7FFE7EF0000FF0000FFC0C0C0CEC6BD
        0000FF0000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FFC0C0C00000
        FF0000FF0000FFC0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FFC0
        C0C00000FF0839CEE7D6D6FFEFE7FFFFF7FFF7EFFFEFEFFFF7EFFFEFE7FFDED6
        FFDED6FFCEC6FFBDB5E7AD9CC69484A57B6BA58473B59484C6A594E7BDB5FFDE
        D6FFD6CEEFDECEE7E7DEEFE7E70000FF0000FFC0C0C00000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FFC0C0C0C0C0C0
        0000FF0000FF0000FFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FF0000
        FF1042CEFFE7E7FFF7F7FFEFE7F7EFEFF7DEDEFFE7DEFFE7D6FFE7DEFFE7D6FF
        CEC6F7BDB5F7BDADEFBDADD6AD9CB58C84A57B73B58C7BCEA59CE7B5ADE79C94
        CEADA50000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FFC0C0C0C0
        C0C00000FF0000FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF1042CE
        F7DEDEFFEFEFFFE7E7FFEFEFFFE7E7FFDEDEFFD6CEFFE7D6FFE7D6F7D6C6FFCE
        C6F7CEBDF7C6BDEFBDADE7ADA5D69C94AD7B73845A52734A42DE8C84CEA59C00
        00FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF
        C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0
        C00000FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF1042CEEFDED6FF
        E7E7FFE7DEFFDED6FFDED6FFD6D6FFD6D6F7DED6F7E7D6FFD6CEFFCEC6FFCEBD
        FFD6C6FFC6BDFFC6B5FFC6BDD69C8C9C6B5A946B5AE794943152C60000FF0000
        FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FFC0C0C000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0
        C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF1842CEF7DED6FFE7DEFFDE
        D6FFDED6FFCECEFFCECEFFDEDEFFEFE7FFEFDEFFC6B5DE8473DE9484FFC6B5FF
        D6C6FFC6B5FFC6B5FFC6B5F7B5ADE7AD9CE79C943152C60000FF0000FF0000FF
        0000FFC0C0C00000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000
        FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FFC0C0C00000FF0000FF0000FF0000FF1042CEEFD6D6F7D6D6FFDED6FFDECE
        F7CEC6FFD6D6FFEFF7FFEFEFFFDED6F7AD9CBD4A39943929AD5A4AE7A594FFDE
        C6FFDEC6FFCEBDFFC6BDFFBDADE7A59C3152C60000FF0000FF0000FF0000FFC0
        C0C00000FF0000FF0000FF0000FFC0C0C0C0C0C00000FF0000FFC0C0C0C0C0C0
        0000FF0000FFC0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FFC0C0
        C00000FF0000FF0000FF0000FF0031CEEFBDBDFFD6CEFFD6C6EFCEC6FFDEDEFF
        EFF7F7EFF7F7EFEFF7CEC6DE8C73F78C63D67342BD5221AD3918CE6B52FFB5A5
        FFDEC6FFD6C6FFCEC6E7ADA5314AC60000FF0000FF0000FF0000FFC0C0C0EFBD
        BDC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FFC0C0C00000FF0000FF00
        00FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FFC0C0C00000FF
        0000FF0000FF0000FF0000FF1842CEF7CEC6FFE7D6FFEFE7FFFFF7F7FFF7D6D6
        D6E7BDBDFFBDADFFA584F7946BFF8C63EF7B52CE6342B54A31A54229CE7B6BFF
        C6B5FFCEBDE7B5AD214AC60000FF0000FF0000FF0000FF0000FFC0C0C00000FF
        0000FF0000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000
        FF0000FF0000FFC0C0C0C0C0C00000FF0000FF0000FFC0C0C00000FF0000FF00
        00FF0000FF0000FF214ACED6ADA5F7CEBDFFE7D6E7D6CEE7DECEF7DECEFFCEB5
        F7B59CF7AD8CF7B58CFFA584FF9473EF8C63E77352DE5A42B54229B55A4AFFD6
        C6DEADA51042CE0000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF
        0000FF0000FF0000FFC0C0C00000FFC0C0C0C0C0C00000FF0000FF0000FF0000
        FF0000FF1842CEEFC6BDF7CEBDD6AD9CE7AD9CF7AD9CFFBDA5F7C6A5F7CEA5FF
        D6A5EFBD94FFA58CFFB594FFA57BFF946BFF8C6BCE634AC67363FFD6C6294AC6
        0000FF0000FF0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000
        FFC0C0C00000FF0000FF0000FF0000FFC0C0C0C0C0C00000FF0000FF0000FF00
        00FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF
        0839CEF7CEC6E7B5A5F7CEBDF7B5A5EF9484F7A584F7B594F7BD94FFCEA5FFD6
        ADFFCEADFFBD9CFFA584FFAD8CE78C6BD69473FFD6BDFFC6BD1842CE0000FF00
        00FF0000FF0000FF0000FF0000FFC0C0C00000FFC0C0C0C0C0C0C0C0C0C0C0C0
        C0C0C00000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C00000FF0000FFC0C0
        C00000FFC0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF10
        39CEDEAD9CFFDECEFFEFDEFFD6BDEFAD94F7A584FFA584FFB594FFBD9CF7CEAD
        FFCEADFFCEADF7AD8CDEAD8CFFE7CEFFDECE3152C60000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FFC0C0C0C0C0C0C0C0C00000FFC0C0C0C0C0C0C0
        C0C00000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C00000FF0000FF
        C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF294A
        C6F7E7CEF7EFD6F7EFD6FFDEC6FFCEB5F7A58CEF9C7BF7AD8CFFBD9CF7B594FF
        C6ADF7CEADFFEFD6FFEFDECEBDB50031CE0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FFC0C0C0C0C0
        C00000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFCEBDB5C0C0C000
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF294ACEEFEFD6
        FFF7DEFFEFDEFFE7D6FFE7D6FFE7CEF7C6A5E7A584FF9C7BFFBD94EFC6ADFFEF
        D6FFE7D6214ACE0031CE0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FFC0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FFC0C0C0C0C0C00000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF1039CEEFE7E7FFFFFFFF
        F7EFFFEFE7F7E7DEFFEFDEFFEFDED6C6ADC6A5A51842CE1842CE1842CE0839CE
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0031CEEFDED6F7E7DEFFEFE7FFFF
        F7FFF7EFFFEFDEFFEFDECEBDAD1039CE0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C00000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0839CE1042CEF7DED6FFF7EFFFF7EF
        FFF7F7FFF7F7CEBDBD0839CE0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FFC0
        C0C0C0C0C00000FF0000FF0000FF0000FF0000FFC0C0C0C0C0C00000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0839CE0839CEEFDED6FFEFEFFF
        FFF7DECEC61042CE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FFC0C0C0C0C0C00000FF0000FF0000FFC0C0C0C0C0C00000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0839CEEFDED6EFDED6D6C6
        B50031CE0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FFC0C0C00000FF0000FFC0C0C00000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FF0000FF0000FF0000FF0000FF0000FF0000FF0031CE1039CE1042CE0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000
        FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF0000FF00
        00FFC0C0C0C0C0C0C0C0C00000FF0000FF0000FF0000FF0000FF0000FF0000FF
        0000FF0000FF0000FF0000FF0000FF0000FF}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 3
      TabOrder = 3
      OnClick = buReImprimirClick
    end
    object buSalir: TBitBtn
      Left = 281
      Top = 3
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
      TabOrder = 4
      OnClick = buSalirClick
    end
  end
  object dgFacturados: TDBGrid
    Left = 0
    Top = 50
    Width = 782
    Height = 331
    Align = alClient
    DataSource = dsBusquedaVenta
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object qyEmpresa: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_EMPRESA')
    Left = 8
    Top = 144
    object qyEmpresaR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyEmpresaR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEmpresaR_RAZON_SOCIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_RAZON_SOCIAL'
      ReadOnly = True
      Size = 100
    end
    object qyEmpresaR_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TELEFONO'
      ReadOnly = True
    end
    object qyEmpresaR_RFC: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_RFC'
      ReadOnly = True
    end
    object qyEmpresaR_CURP: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CURP'
      ReadOnly = True
    end
    object qyEmpresaR_CIUDAD_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CIUDAD_DESCRIPCION'
      ReadOnly = True
      Size = 304
    end
  end
  object dsEmpresa: TDataSource
    DataSet = qyEmpresa
    Left = 40
    Top = 144
  end
  object qyEncabezado: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURA_ENCABEZADO(:P_FACTURA)')
    Left = 8
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '254'
      end>
  end
  object dsEncabezado: TDataSource
    DataSet = qyEncabezado
    Left = 40
    Top = 176
  end
  object dsDetalle: TDataSource
    DataSet = qyDetalle
    Left = 40
    Top = 208
  end
  object qyDetalle: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURAS_PARTIDAS2(:P_FACTURA)')
    Left = 8
    Top = 208
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_FACTURA'
        ParamType = ptUnknown
      end>
  end
  object spACTUALIZA_FACTURA: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ACTUALIZA_FACTURA'
    Left = 288
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_FACTURA'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_USUARIO'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spMODIFICAR_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'MODIFICAR_FOLIO'
    Left = 192
    Top = 297
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_MODULO'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_SUBCLASE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_CONSECUTIVO'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object qyBusquedaFacturas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM BUSQUEDA_FACTURAS (:P_ALMACEN, :P_FECHA_ALTA, :P_CONSECUTIV' +
        'O)')
    Left = 8
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_ALTA'
        ParamType = ptUnknown
        Value = '03/12/2001'
      end
      item
        DataType = ftString
        Name = 'P_CONSECUTIVO'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyBusquedaFacturasR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyBusquedaFacturasR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyBusquedaFacturasR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyBusquedaFacturasR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyBusquedaFacturasR_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TELEFONO'
      ReadOnly = True
    end
    object qyBusquedaFacturasR_CIUDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CIUDAD'
      ReadOnly = True
      Size = 304
    end
    object qyBusquedaFacturasR_SERIE_FACTURA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SERIE_FACTURA'
      ReadOnly = True
      Size = 10
    end
    object qyBusquedaFacturasR_CONSECUTIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONSECUTIVO'
      ReadOnly = True
    end
    object qyBusquedaFacturasR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyBusquedaFacturasR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
  end
  object dsBusquedaVenta: TDataSource
    DataSet = qyBusquedaFacturas
    OnDataChange = dsBusquedaVentaDataChange
    Left = 40
    Top = 80
  end
  object spP_FACTURA_SINSURTIR: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'P_FACTURA_SINSURTIR'
    Left = 256
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_FACTURA'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object qyDetalleConsolidadaCC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'SELECT R_REFERENCIA_PAGO, R_REFERENCIA_PAGO_NOMBRE, SUM(R_SUBTOT' +
        'AL) R_SUBTOTAL, SUM(R_IVA) R_IVA,  SUM(R_MONTO) R_MONTO'
      'FROM DETALLE_FACTURA(:P_FACTURA)'
      'GROUP BY R_REFERENCIA_PAGO, R_REFERENCIA_PAGO_NOMBRE')
    Left = 8
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '122'
      end>
    object qyDetalleConsolidadaCCR_REFERENCIA_PAGO: TIntegerField
      FieldName = 'R_REFERENCIA_PAGO'
    end
    object qyDetalleConsolidadaCCR_REFERENCIA_PAGO_NOMBRE: TIBStringField
      FieldName = 'R_REFERENCIA_PAGO_NOMBRE'
      Size = 100
    end
    object qyDetalleConsolidadaCCR_SUBTOTAL: TFloatField
      FieldName = 'R_SUBTOTAL'
    end
    object qyDetalleConsolidadaCCR_IVA: TFloatField
      FieldName = 'R_IVA'
    end
    object qyDetalleConsolidadaCCR_MONTO: TFloatField
      FieldName = 'R_MONTO'
    end
  end
  object qyDetalleBlob: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM DETALLE_FACTURA_BLOB(:P_FACTURA)')
    Left = 40
    Top = 304
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '122'
      end>
    object qyDetalleBlobR_REFERENCIAS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIAS'
      ReadOnly = True
      Size = 500
    end
  end
  object qyDetalleConsolidada: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM DETALLE_FACTURA_2(:P_FACTURA)')
    Left = 8
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '8345'
      end>
    object qyDetalleConsolidadaR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyDetalleConsolidadaR_GT: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GT'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_PARTIDAS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PARTIDAS'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CANTIDAD'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CONSECUTIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONSECUTIVO'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CAJAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJAS'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_KILOS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_KILOS'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_PIEZAS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PIEZAS'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CALIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CALIDAD'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_CALIDAD_NOMBRE: TIBStringField
      FieldName = 'R_CALIDAD_NOMBRE'
      Origin = 'DETALLE_FACTURA_2.R_CALIDAD_NOMBRE'
      Size = 100
    end
    object qyDetalleConsolidadaR_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD'
      ReadOnly = True
    end
    object qyDetalleConsolidadaR_UNIDAD_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyDetalleConsolidadaR_PRECIO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRECIO'
      ReadOnly = True
    end
  end
  object spFOLIO_ALMACEN: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'FOLIO_ALMACEN'
    Left = 223
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_CONSECUTIVO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_AFECTAR'
        ParamType = ptInput
        Value = 'No'
      end>
  end
  object qyConsolidadaBlob: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM DETALLE_FACTURA_BLOB_2(:P_FACTURA)')
    Left = 40
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '122'
      end>
    object IBStringField1: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIAS'
      ReadOnly = True
      Size = 500
    end
  end
  object qyContinuacion: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURAS_ENLACE(:P_FACTURA)')
    Left = 72
    Top = 336
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyACTUALIZA_FACTURA: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE ACTUALIZA_FACTURA(:P_FACTURA, :P_ALMACEN, :P_F' +
        'OLIO, :P_USUARIO)')
    Left = 320
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_FOLIO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptUnknown
        Value = '0'
      end>
  end
  object qyVerificarFolio: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VERIFICAR_FOLIO_FACTURA(:P_FACTURA, :P_FOLIO, :P_ALMACEN)')
    Left = 352
    Top = 296
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_FOLIO'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyVerificarFolioR_ACEPTADO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ACEPTADO'
      ReadOnly = True
      Size = 2
    end
  end
  object qyFacturaIntereses: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM DETALLE_FACTURA_INTERESES(:P_FACTURA, :P_TEXTO)')
    Left = 104
    Top = 335
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FACTURA'
        ParamType = ptUnknown
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_TEXTO'
        ParamType = ptUnknown
      end>
  end
  object qyPartidasFacturaM: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM FACTURAS_PARTIDAS_M(:P_ID)')
    Left = 72
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '254'
      end>
  end
  object spACT_FOLIO_FACTURA: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ACT_FOLIO_FACTURA'
    Left = 264
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_FOLIO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO_ACEPTADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_ALMACEN'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FACTURA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_USUARIO'
        ParamType = ptInput
      end>
  end
end
