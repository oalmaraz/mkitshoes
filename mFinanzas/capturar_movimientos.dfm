inherited frmCapturar_movimientos: TfrmCapturar_movimientos
  Tag = 16
  Left = 360
  Top = 184
  Caption = 'Movimientos Sin Clasificar'
  ClientHeight = 433
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Height = 90
    Align = alTop
    ExplicitWidth = 124
    ExplicitHeight = 90
    object Label1: TLabel
      Left = 8
      Top = 5
      Width = 51
      Height = 13
      Caption = 'Fecha Alta'
    end
    object Label10: TLabel
      Left = 230
      Top = 5
      Width = 96
      Height = 13
      Caption = 'Condicion Comercial'
    end
    object Label2: TLabel
      Left = 126
      Top = 5
      Width = 21
      Height = 13
      Caption = 'Tipo'
    end
    object Label4: TLabel
      Left = 8
      Top = 45
      Width = 52
      Height = 13
      Caption = 'Referencia'
    end
    object Label6: TLabel
      Left = 126
      Top = 45
      Width = 30
      Height = 13
      Caption = 'Monto'
    end
    object Label3: TLabel
      Left = 230
      Top = 45
      Width = 39
      Height = 13
      Caption = 'Moneda'
    end
    object Label5: TLabel
      Left = 399
      Top = 45
      Width = 67
      Height = 13
      Caption = 'Id. Referencia'
    end
    object Label7: TLabel
      Left = 487
      Top = 45
      Width = 82
      Height = 13
      Caption = 'Tabla Referencia'
    end
    object deFechaAlta: TDBEdit
      Left = 8
      Top = 20
      Width = 113
      Height = 21
      DataField = 'FECHA_ALTA'
      DataSource = dsFuente
      TabOrder = 0
    end
    object cbCondicionComerciales: TDBLookupComboBox
      Left = 230
      Top = 20
      Width = 164
      Height = 21
      DataField = 'CONDICION_COMERCIAL'
      DataSource = dsFuente
      KeyField = 'ID'
      ListField = 'NOMBRE'
      ListSource = dsCComerciales
      TabOrder = 2
    end
    object cbTipo: TDBComboBox
      Left = 126
      Top = 20
      Width = 99
      Height = 21
      DataField = 'TIPO'
      DataSource = dsFuente
      Items.Strings = (
        'Cargo'
        'Abono'
        'Sin Clasificar')
      TabOrder = 1
    end
    object deReferencia: TDBEdit
      Left = 8
      Top = 60
      Width = 113
      Height = 21
      DataField = 'REFERENCIA'
      DataSource = dsFuente
      TabOrder = 3
    end
    object deMonto: TDBEdit
      Left = 126
      Top = 60
      Width = 99
      Height = 21
      DataField = 'MONTO'
      DataSource = dsFuente
      TabOrder = 4
    end
    object cbMonedas: TDBLookupComboBox
      Left = 230
      Top = 60
      Width = 164
      Height = 21
      DataField = 'MONEDA'
      DataSource = dsFuente
      KeyField = 'ID'
      ListField = 'DESCRIPCION'
      ListSource = dsMonedas
      TabOrder = 5
    end
    object deIDReferencia: TDBEdit
      Left = 399
      Top = 60
      Width = 82
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'ID_REFERENCIA'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
    object deTablaReferencia: TDBEdit
      Left = 487
      Top = 60
      Width = 152
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'TABLA_REFERENCIA'
      DataSource = dsFuente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
    end
  end
  inherited fpPadre: TPanel
    ExplicitWidth = 124
    object Label18: TLabel [0]
      Left = 514
      Top = 21
      Width = 35
      Height = 13
      Caption = 'Estatus'
      Transparent = True
    end
    object Label8: TLabel [1]
      Left = 397
      Top = 21
      Width = 46
      Height = 13
      Caption = 'Chequera'
      Transparent = True
    end
    inherited Panel1: TPanel
      ExplicitWidth = 124
    end
    inherited ibNuevo: TBitBtn
      Left = 2
      Width = 42
      Font.Color = clBlue
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 2
      ExplicitWidth = 42
    end
    inherited ibModificar: TBitBtn
      Left = 46
      Width = 42
      Caption = 'modific.'
      Font.Color = clBlue
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 46
      ExplicitWidth = 42
    end
    inherited ibGuardar: TBitBtn
      Left = 90
      Width = 42
      Font.Color = clBlue
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitLeft = 90
      ExplicitWidth = 42
    end
    object cbEstatus: TDBLookupComboBox
      Left = 514
      Top = 36
      Width = 97
      Height = 21
      KeyField = 'ESTATUS'
      ListField = 'ESTATUS'
      ListSource = dsEstatusProcesosDetalle
      TabOrder = 5
      OnClick = cbEstatusClick
    end
    object beAplicar: TEdit
      Left = 614
      Top = 36
      Width = 30
      Height = 21
      Hint = 'Aplicar, cambio de estatus'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      Text = 'beAplicar'
    end
    object ibPantalla: TBitBtn
      Left = 221
      Top = 23
      Width = 42
      Height = 34
      Caption = 'mov.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000530B0000530B00000000000000000000FFFFFFFFFFFF
        6F686F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F101010A0A0A0A0A7A0A0A0
        A0A0A0A09F9F9F9F9F9F9F989F9F989F9090908087807F787F7070701F1F1F00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F4F4F4F4F484F4F484F4047404040404040403F3F3FC0C0C0BFBFBFBFBF
        BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B7B0B0B0B0B0B0B0B0B0B04F484F9F
        989F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5050504F4F4F4F484F4F484F404740403F40404040C0C0C0C0C0C0BFBF
        BFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B0B0B0B0B0606060B0
        B7B07F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5050504F4F4F4F4F4F4F484F4F484F404740404040C0C0C0C0C0C0C0C0
        C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B0B0707070CF
        C8CF9F9F9FAFA8AF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5057505050505050504F4F4F4F484F4F484F404740C0C7C0C0C0C0C0C0
        C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0808780E0
        E0E0C0C7C0BFBFBFAFA8AF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F505750505750504F50504F50504F504F484F4F484FC0C7C0C0C7C0C0C0
        C0C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFB8BFBFB8BFBFB8BFB0B7B09F989FFF
        FFC0FFFFC0F0F7F0E0E7E0D0D0D0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F575F505750505750505050505050504F504F484FCFC8CFC0C7C0C0C7
        C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFBFBFA0
        A0A0A0A0A0A0A0A09097908F888F707070000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F5F5F5F575F5057505057505050505050504F4F4FCFC8CFCFC8CFC0C7
        C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFB0
        B7B0B0B7B0B0B0B0B0B0B0B0B0B0B0B0B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F5F5F5F5F5F5F575F505750505750504F50505050CFC8CFCFC8CFCFC8
        CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBF
        B8BFB0B7B0B0B7B0B0B0B0B0B0B0B0B0B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6060605F5F5F5F5F5F5F575F505750505750505050CFCFCFCFC8CFCFC8
        CFCFC8CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBF
        B8BFBFB8BFB0B7B0B0B7B0B0B0B0B0B0B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6067605F5F5F5F5F5F5F5F5F5F585F505750505750CFCFCFCFCFCFCFC8
        CFCFC8CFCFC8CFC0C7C0C0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBF
        B8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B0B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6067606067606060606060605F5F5F5F585F505750D0D0D0CFCFCFCFCF
        CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BFBFBFBF
        BFBFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F6F6F6067606067606060605F5F5F5F5F5FFFFFC0D0D0D0D0D0D0CFCF
        CFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BF
        BFBFC0C0C0BFB8BFBFB8BFBFB8BFB0B7B0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F6F6F6F6F6F6067606067606060605F5F5F5F5F5FD0D0D0D0D0D0D0D0
        D0CFCFCFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C0C0C0C0C0C0
        C0C0C0C0C0C0C0C0BFB8BFBFB8BFBFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F686F6F6F6F909082E6E7B1FFFFC0E3E3AF828274D0D7D0D0D0D0D0D0
        D0D0D0D0CFCFCFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C0C0C0
        C0C0C0C0C0C0C0C0C0C0C0BFB8BFBFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F6F6F6F686FE8E8B3A5A58D6067609EA285E6E6B1D0D7D0D0D7D0D0D0
        D0D0D0D0D0D0D0CFCFCFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0
        C0C0C0C0C0C0C0C0C0C0C0C0C0C0BFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F7070706F6F6FFDFDBF6F6F6F6F6F6F606760FDFDBED0D7D0D0D7D0D0D7
        D0CFCFCFCFCFCFCFCFCFCECECECECECECEC7CECEC7CECEC7CECEC7CEBFC6BFBF
        C6BFBFBFBFBFBFBFBFBFBFBFBFBFC0C0C0000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F7070706F6F6FD4D4A8A7A38E6F6F6FA9A990D0D2A3DFD8DFCFD6CFCED5
        CECDD4CDCCCCCCCBCBCBCBCBCBC9C9C9C9C9C9C9C3C9C9C3C9C9C3C9C9C3C9BB
        C2BBBBC2BBBBBBBBBCBCBCBDBDBDBEBEBE000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9FFFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FFFFC0DED7DEDCD5DCC9D0
        C9C5CCC5C1C8C1C0C0C0BFBFBFBFBFBFBEBEBEBEBEBEBEB8BEBEB8BEBEB8BEB8
        B8B8B0B7B0B1B7B1B2B2B2B6B6B6BABABA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F707770707770FFFFC06F6F6F6F6F6F6F686F6F6F6FDDD6DDD8D1D8D0CA
        D0B8BFB8B1B7B1ACB2ACAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA4AAAAA4AAAA
        A4AAAAA4AA9FA59FA3A9A3AAAAAAB3B3B3000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9FB7B39BFFFFC0FFFFC0FFFFC0FFFFC0FFFFC0DFDEAEDCDCDCD4CDD4C6BF
        C6B2ACB2999E999196918F948F8E8E8E8E8E8E8E8E8E8D8D8D8D8D8D8D888D8D
        888D8E898E8C8C8C8D928D999E99AAAAAA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F7F787F7F787FFFFFC0707770707070737371DDDDADDADADACFCFCF0000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000008D928DA3A9A3000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F7F7F7F7F787F7F787F7077707077706F6F6F6F6F6FDBDBDBCECECE0000
        00D8E9EC99A8ACFFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FFFFC0FF
        FFC0FFFFC0FFFFC0000000908C909FA59F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F808080808080938D89E5E3B3FFFFC0E4E5B18A8A7FDADADACECECE0000
        00FFFFC099A8ACFFFFC0D8E9ECD8E9ECFFFFC0D8E9ECFFFFC0D8E9ECD8E9ECD8
        E9ECD8E9ECFFFFC00000008E898EAAA4AA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F808080808080E5E5B3B3AF997F787FAAAE90E2E3B0DADADACECECE0000
        00D8E9EC99A8ACFFFFC0FFFFC0FFFFC0FFFFC0D8E9ECFFFFC0FFFFC0FFFFC0FF
        FFC0FFFFC0FFFFC00000008D888DAAA4AA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F808780808080FFFFC07F7F7F7F787F7F787FFFFFC0DAE1DACECECE0000
        00FFFFC099A8ACFFFFC0D8E9ECD8E9ECFFFFC0D8E9ECFFFFC0D8E9ECD8E9ECD8
        E9ECFFFFC0FFFFC00000008D888DAAA4AA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F808780808780E5E5B3B3B39A7F7F7FB3AF99E5E3B3DAE1DACED4CE0000
        00D8E9EC99A8ACFFFFC0FFFFC0FFFFC0FFFFC0D8E9ECFFFFC0FFFFC0FFFFC0FF
        FFC0FFFFC0FFFFC00000008D8D8DAAA4AA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F8F888F80878093998AE5E5B3FFFFC0E5E5B3938D89E8E2E8CED4CE0000
        00FFFFC099A8ACFFFFC0D8E9ECD8E9ECFFFFC0D8E9ECFFFFC0D8E9ECD8E9ECD8
        E9ECD8E9ECFFFFC00000008E8E8EAAAAAA000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9E9E9EE9E3E9DCD6DC0000
        00D8E9EC99A8ACFFFFC0FFFFC0FFFFC0FFFFC0D8E9ECFFFFC0FFFFC0FFFFC0FF
        FFC0FFFFC0FFFFC0000000919191ABABABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        0099A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99A8AC99
        A8AC99A8AC99A8AC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        00D8E9EC99A8ACFFFFC0D8E9ECD8E9ECD8E9ECD8E9ECFFFFC0D8E9ECD8E9ECD8
        E9ECD8E9ECD8E9EC000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      OnClick = ibPantallaClick
    end
    object ibPrint: TBitBtn
      Left = 308
      Top = 23
      Width = 42
      Height = 34
      Hint = 'Imprimir'
      Caption = 'mov.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        360C0000424D360C000000000000360000002800000020000000200000000100
        180000000000000C0000230B0000230B00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF0000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000000000000000FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        6F686F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F1010105F5F5F6F686F6F6F
        6F7077707F7F7F8F888F8F888F8F888F8080807F7F7F7F787F7070701F1F1F00
        0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F4F4F4F4F484F4F484F4047404040404040403F3F3FC0C0C0BFBFBFBFBF
        BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B7B0B0B0B0B0B0B0B0B0B04F484F9F
        989F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5050505050504F484F4F484F404740404040404040C0C0C0C0C0C0BFBF
        BFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B0B0B0B0B0606060B0
        B7B07F7F7F000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5050505050504F4F4F4F484F4F484F404740404040C0C0C0C0C0C0C0C0
        C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0B0B0B0707070CF
        C8CF9F9F9FAFA8AF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5057505050505050505050504F484F4F484F404740C0C7C0C0C0C0C0C0
        C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFB8BFB0B7B0B0B7B0808780E0
        E0E0C0C7C0BFBFBFAFA8AF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5057505057505050505050504F4F4F4F484F4F484FC0C7C0C0C7C0C0C0
        C0C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFB8BFBFB8BFBFB8BFB0B7B09F989FFF
        FFFFFFF8FFF0F7F0E0E7E0D0D0D0000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F585F5057505057505050505050504F4F4F4F484FCFC8CFC0C7C0C0C7
        C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFBFBFBFB8BFBFB8BFBFB8BFBFBFBFA0
        A0A0A0A0A0A0A0A09097908F888F707070000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F5F5F5F585F5057505057505050505050504F4F4FCFC8CFCFC8CFC0C7
        C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBFB8BFB0
        B7B0B0B7B0B0B0B0B0B0B0B0B0B0808780000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F5F5F5F5F5F5F5F585F505750505750505050505050CFC8CFCFC8CFCFC8
        CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBFB8BFBF
        B8BFB0B7B0B0B7B0B0B0B0B0B0B09F989F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6060605F5F5F5F5F5F5F585F505750505750505050CFCFCFCFC8CFCFC8
        CFCFC8CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBFB8BFBF
        B8BFBFB8BFB0B7B0B0B7B0B0B0B09F989F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6060606060605F5F5F5F5F5F5F585F505750505750CFCFCFCFCFCFCFC8
        CFCFC8CFCFC8CFC0C7C0C0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BFBFBFBFBFBFBF
        B8BFBFB8BFBFB8BFB0B7B0B0B7B09F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6067606060606060606060605F5F5F5F585F505750D0D0D0CFCFCFCFCF
        CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BFBFBFBF
        BFBFBFB8BFBFB8BFBFB8BFB0B7B09F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6067606067606060606060606D6D64999A725F585FD0D0D0D0D0D0CFCF
        CFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C0C0C0C0C0C0C0C0BF
        BFBFBFBFBFBFB8BFBFB8BFBFB8BF9F9F9F000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F686F60676060676060606082826BE8E98C5F5F5FD0D0D0D0D0D0D0D0
        D0CFCFCFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CFC0C7C0C0C7C0C0C7C0C0C0C0C0
        C0C0C0C0C0C0C0C0BFB8BFBFB8BFBFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F6F686F6F686F6067606067606060606060605F5F5FD0D7D0D0D0D0D0D0
        D0D0D0D0CFCFCFCFCFCFCFC8CFCFC8CFCFC8CFCFC8CF86868686868686868686
        8686868686868686868686BFB8BFBFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        ACAC9DA4A47CA4A07CA4A07C9A9F739A9F739A9A735F5F5FD0D7D0D0D0D0D0D0
        D0D0D0D0CFCFCFCFCFCFCFCFCFCFC8CF8686867373735555554E4E4E817B7B55
        4F4F434343454545606060949494BFB8BF000000FFFFFFFFFFFFFFFFFFFFFFFF
        BDBE9BEAEB8EEAEB8FEAEA8EEAEA8EE8EA8DE8EA8D606060D0D7D0D0D7D0D0D0
        D0D0D0D0D0D0D0CFCFCFD0D0D07A7A7A505050575757B4B4B4E5E5E5B6B3B3A6
        86869E8B8BB2B2B2F1F1F1A6A6A6646464000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F7070707070706F6F6F6F686F6F686F606760606760DFD8DFD0D7D0D0D7
        D0D0D0D0D0D0D0D0D0D0D0D0D0717171B1B1B1E9E9E9BCBCBC8C8C8C6D6D6D5F
        5F5F939393ACACACE8E8E8F1F1F1EEEEEE9B9B9BFFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F707770909178A4A47CA4A47CA4A07CA4A07C9A9F73E7E2CADFD8DFD0D7
        D0D0D7D0D0D0D0D0D0D0D0D0D07A7A7A6464648989898E8E8E949494A6A6A6B2
        B2B29797977E7E7E959595D8D8D8F2F2F2FAFAFAB5B5B5FFFFFFFFFFFFFFFFFF
        9F9F9F707770B8BC82FAFB92EAEB8EF5F691F3F491EAEA8EF2F0ADDFD8DFDFD8
        DFD0D7D0D0D7D0D0D0D0D0D0D07C7C7C5858587AAA8ABFBFBF9F9F9F83838380
        80808D8D8DABABABC9C9C99B9B9BA0A0A0D8D8D8B5B5B5FFFFFFFFFFFFFFFFFF
        9F9F9F7F787FC5C885A0A57C7070707C7C72E6E78D716A6FDFDFDFDFD8DFDFD8
        DFDFD8DFD0D7D0D0D7D0D0D0D08282825757576784718989899D9D9DBEBEBECF
        CFCFE0E0E0D8D8D8D8D8D8D8D8D8D9D9D9A6A6A6767676FFFFFFFFFFFFFFFFFF
        9F9F9F7F787FD9D78DBABE8381877497977AF8F992777771DFDFDFDFDFDFDFD8
        DFDFD8DFDFD8DFD0D7D0D0D7D0868686717171CCCCCCD4D4D4CCCCCCC0C0C0C2
        C2C2CECECED5D5D5C9C9C9D2D2D2D8D8D8E1E1E19E9E9EFFFFFFFFFFFFFFFFFF
        9F9F9F7F7F7F9C9784F2F391FCFD93FAFB92B6B6816F6F6FE0E0E0DFDFDFDFDF
        DFDFD8DFDFD8DFDFD8DFD0D7D0D0D7D0888888BEBEBEBFBFBFD9D9D9EAEAEAED
        EDEDF0F0F0CFCFCFA5A5A5AAAAAAC2C2C2D5D5D5B5B5B5FFFFFFFFFFFFFFFFFF
        9F9F9F808080808080807A7F8E8881787F72707770707070E0E0E0E0E0E0DFDF
        DFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0D0D7D0868686B3B3B3BDBDBDBDBDBDB6
        B6B6AEAEAEBABABAB2B2B2ECECECC9C9C9B5B5B5FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F959583CFD08CB2B2889E99849E9984858B75707770E0E0E0E0E0E0E0E0
        E0DFDFDFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0D0D7D0868686858585E7E7E7E5
        E1DFEFDCD5FBD7CEFFD2C7FFD4C5C4BBBB000000FFFFFFFFFFFFFFFFFFFFFFFF
        A6A69EE7E990F6F792F0F191ECED91F8F992F8F992787F72E0E7E0E0E0E0E0E0
        E0E0E0E0DFDFDFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0D0D7D08686867A6361FF
        D4AFFFD6B3FFDCB8FFDCB8FFDCB8D5BFB9000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F808780BCC0899797848080807F7F7FE6E690847E80E0E7E0E0E7E0E0E0
        E0E0E0E0E0E0E0DFDFDFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0D0D7D0736767F9
        DDC4FFE5CBFFE5CBFFE5CBFFE5CBCBABA1000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F8F888F8087808087808080808080808080807F787FEFE8EFE0E7E0E0E7
        E0E0E0E0E0E0E0E0E0E0DFDFDFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0929292DB
        C1B5FFEDDCFFEDDCFFEDDCFFEDDCDFC3B7000000FFFFFFFFFFFFFFFFFFFFFFFF
        9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9F9FEFE8EFE0E7E0E0E7
        E0E0E7E0E0E0E0E0E0E0DFDFDFDFDFDFDFDFDFDFD8DFDFD8DFDFD8DFD0D7D0B0
        A19DFFF7EEFFF7EEFFF7EEFFF7EEFFF7EECEBAB9FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE6
        D8D7E6D8D7E6D8D7E6D8D7E6D8D7E6D8D7E6D8D7FFFFFFFFFFFF}
      Layout = blGlyphRight
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = ibPrintClick
    end
    object dxDBExtLookupEdit1: TDBLookupComboBox
      Left = 397
      Top = 36
      Width = 114
      Height = 21
      DataField = 'R_CUENTA_DE_CHEQUES'
      DataSource = dsChequeras
      TabOrder = 8
    end
  end
  inherited Panel2: TPanel
    Top = 411
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  object dgMovimientos: TDBGrid [3]
    Left = 0
    Top = 150
    Width = 762
    Height = 261
    TabStop = False
    Align = alClient
    DataSource = dsFuente
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = dgMovimientosDblClick
  end
  inherited ibEliminar: TBitBtn
    Left = 177
    Width = 42
    Font.Color = clBlue
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 177
    ExplicitWidth = 42
  end
  inherited ibCancelar: TBitBtn
    Left = 133
    Width = 42
    Caption = 'canc.'
    Font.Color = clBlue
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 133
    ExplicitWidth = 42
  end
  inherited ibAyuda: TBitBtn
    Left = 352
    Width = 42
    Font.Color = clBlue
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitLeft = 352
    ExplicitWidth = 42
  end
  inherited ibImprimir: TBitBtn
    Left = 265
    Width = 42
    Font.Color = clBlue
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = ibImprimirClick
    ExplicitLeft = 265
    ExplicitWidth = 42
  end
  inherited qyBotones: TIBQuery
    Left = 24
    Top = 336
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
        Name = 'FECHA_ALTA'
        DataType = ftDateTime
      end
      item
        Name = 'CONDICION_COMERCIAL'
        DataType = ftInteger
      end
      item
        Name = 'TIPO'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'REFERENCIA'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'MONTO'
        DataType = ftFloat
      end
      item
        Name = 'MONEDA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'AUTORIZO'
        DataType = ftInteger
      end
      item
        Name = 'TABLA_REFERENCIA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'ID_REFERENCIA'
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'SEL'
        DataType = ftString
        Size = 2
      end>
    Filter = 'Estatus = '#39'Sin Afectar'#39
    Filtered = True
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY187'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN188'
        Fields = 'CONDICION_COMERCIAL'
      end
      item
        Name = 'RDB$FOREIGN189'
        Fields = 'MONEDA'
      end
      item
        Name = 'RDB$FOREIGN190'
        Fields = 'AUTORIZO'
      end>
    StoreDefs = True
    TableName = 'MOVIMIENTOS_SIN_CLASIFICAR'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarFECHA_ALTA: TDateTimeField [1]
      FieldName = 'FECHA_ALTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object TCapturarCONDICION_COMERCIAL: TIntegerField [2]
      FieldName = 'CONDICION_COMERCIAL'
    end
    object TCapturarTIPO: TIBStringField [3]
      FieldName = 'TIPO'
      Size = 14
    end
    object TCapturarREFERENCIA: TIBStringField [4]
      FieldName = 'REFERENCIA'
    end
    object TCapturarMONTO: TFloatField [5]
      FieldName = 'MONTO'
      DisplayFormat = '$ ###,###,##0.00'
    end
    object TCapturarMONEDA: TIntegerField [6]
      FieldName = 'MONEDA'
      Required = True
    end
    object TCapturarAUTORIZO: TIntegerField [7]
      FieldName = 'AUTORIZO'
    end
    object TCapturarTABLA_REFERENCIA: TIBStringField [8]
      FieldName = 'TABLA_REFERENCIA'
      Size = 50
    end
    object TCapturarID_REFERENCIA: TIntegerField [9]
      FieldName = 'ID_REFERENCIA'
    end
    object TCapturarESTATUS: TIBStringField [10]
      FieldName = 'ESTATUS'
    end
    object TCapturarSEL: TIBStringField [11]
      FieldName = 'SEL'
      Size = 2
    end
    object TCapturarmoneda_descripcion: TStringField
      FieldKind = fkCalculated
      FieldName = 'moneda_descripcion'
      Size = 50
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
        Value = 'MOV_SC'
      end>
  end
  object dsEstatusProcesosDetalle: TDataSource
    DataSet = TEstatusProcesosDetalle
    Left = 376
    Top = 368
  end
  object TEstatusProcesosDetalle: TIBTable
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
        Name = 'PROCESO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AUTORIZACION'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'STOREPROC'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY117'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN118'
        Fields = 'PROCESO'
      end>
    IndexFieldNames = 'PROCESO'
    MasterFields = 'ID'
    MasterSource = dsEstatusProcesos
    StoreDefs = True
    TableName = 'ESTATUS_PROCESOS_DET'
    UniDirectional = False
    Left = 344
    Top = 368
    object TEstatusProcesosDetalleID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TEstatusProcesosDetallePROCESO: TIntegerField
      FieldName = 'PROCESO'
      Required = True
    end
    object TEstatusProcesosDetalleESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TEstatusProcesosDetalleAUTORIZACION: TIBStringField
      FieldName = 'AUTORIZACION'
      Size = 2
    end
    object TEstatusProcesosDetalleSTOREPROC: TIBStringField
      FieldName = 'STOREPROC'
      Size = 50
    end
  end
  object dsEstatusProcesos: TDataSource
    DataSet = qyEstatusProcesos
    Left = 312
    Top = 368
  end
  object qyEstatusProcesos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFuente
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ESTATUS_PROCESOS'
      'WHERE (FORMA = :FORMA) AND (ESTATUS = :ESTATUS)')
    Left = 280
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'forma'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'ESTATUS'
        ParamType = ptUnknown
      end>
  end
  object qyChequeras: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_CHEQUERAS'
      '')
    Left = 456
    Top = 48
    object qyChequerasR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyChequerasR_BANCO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO'
      ReadOnly = True
    end
    object qyChequerasR_BANCO_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyChequerasR_BANCO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyChequerasR_CUENTA_DE_CHEQUES: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CUENTA_DE_CHEQUES'
      ReadOnly = True
    end
    object qyChequerasR_FECHA_ULT_CHEQUE_IMP: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ULT_CHEQUE_IMP'
      ReadOnly = True
    end
    object qyChequerasR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
    end
    object qyChequerasR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyChequerasR_MONEDA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyChequerasR_MONEDA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyChequerasR_FOLIO_CHEQUE_INICIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_CHEQUE_INICIAL'
      ReadOnly = True
    end
    object qyChequerasR_REPORTE_CHEQUES: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REPORTE_CHEQUES'
      ReadOnly = True
      Size = 100
    end
    object qyChequerasR_REPORTE_DEPOSITOS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REPORTE_DEPOSITOS'
      ReadOnly = True
      Size = 100
    end
    object qyChequerasR_IMPRESORANOM: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPRESORANOM'
      ReadOnly = True
      Size = 50
    end
    object qyChequerasR_IMPRESORAVAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPRESORAVAL'
      ReadOnly = True
      Size = 10
    end
    object qyChequerasR_ESCMODEL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESCMODEL'
      ReadOnly = True
      Size = 50
    end
  end
  object dsChequeras: TDataSource
    DataSet = qyChequeras
    Left = 488
    Top = 48
  end
  object qyMonedas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM MONEDAS'
      'ORDER BY ID')
    Left = 280
    Top = 103
    object qyMonedasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyMonedasDESCRIPCION: TIBStringField
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  object dsMonedas: TDataSource
    DataSet = qyMonedas
    Left = 312
    Top = 103
  end
  object qyCComerciales: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CONDICIONES_COMERCIALES'
      'ORDER BY ID')
    Left = 280
    Top = 63
    object qyCComercialesID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyCComercialesCLAVE: TIBStringField
      FieldName = 'CLAVE'
    end
    object qyCComercialesNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
      Size = 100
    end
  end
  object dsCComerciales: TDataSource
    DataSet = qyCComerciales
    Left = 312
    Top = 63
  end
  object spEstatus: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    Left = 119
    Top = 368
  end
  object qySumas: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT SUM(MONTO) TOTAL, COUNT(ID) CountRec'
      'FROM MOVIMIENTOS_SIN_CLASIFICAR'
      'WHERE ESTATUS = "Sin Afectar"')
    Left = 91
    Top = 336
  end
end
