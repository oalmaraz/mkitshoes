inherited frmExplorar_colectas: TfrmExplorar_colectas
  Left = 404
  Top = 329
  ActiveControl = nil
  Caption = 'Explorar Colectas'
  ClientHeight = 386
  ClientWidth = 743
  ExplicitWidth = 759
  ExplicitHeight = 425
  PixelsPerInch = 96
  TextHeight = 13
  inherited paExplorarBusqueda: TPanel [0]
    Width = 743
    Height = 48
    ExplicitWidth = 743
    ExplicitHeight = 48
    inherited laCampo: TLabel
      Width = 146
      Height = 48
      Caption = 'R_REFERENCIA'
      Visible = False
      ExplicitWidth = 146
    end
    object Shape7: TShape [1]
      Left = 552
      Top = 4
      Width = 68
      Height = 18
      Brush.Color = 3523308
      Pen.Color = 11764252
      Shape = stRoundRect
    end
    object Shape1: TShape [2]
      Left = 6
      Top = 25
      Width = 83
      Height = 18
      Brush.Color = 14789952
      Pen.Color = 11764252
      Shape = stRoundRect
    end
    object Shape3: TShape [3]
      Left = 6
      Top = 4
      Width = 83
      Height = 18
      Brush.Color = 14789952
      Pen.Color = 11764252
      Shape = stRoundRect
    end
    object Label24: TLabel [4]
      Left = 29
      Top = 6
      Width = 36
      Height = 13
      Caption = 'Usuario'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = True
    end
    object Shape17: TShape [5]
      Left = 91
      Top = 33
      Width = 14
      Height = 3
      Brush.Color = 11106843
      Pen.Color = 14789952
    end
    object Shape4: TShape [6]
      Left = 91
      Top = 12
      Width = 14
      Height = 3
      Brush.Color = 11106843
      Pen.Color = 14789952
    end
    object Shape9: TShape [7]
      Left = 369
      Top = 4
      Width = 68
      Height = 18
      Brush.Color = 3523308
      Pen.Color = 11764252
      Shape = stRoundRect
    end
    object Shape10: TShape [8]
      Left = 439
      Top = 12
      Width = 14
      Height = 3
      Brush.Color = 11106843
      Pen.Color = 14789952
    end
    object Shape8: TShape [9]
      Left = 622
      Top = 12
      Width = 14
      Height = 3
      Brush.Color = 11106843
      Pen.Color = 14789952
    end
    object hlEstatus: TBitBtn [10]
      Left = 27
      Top = 27
      Width = 41
      Height = 13
      Cursor = crHandPoint
      Caption = 'Almacen'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
      OnClick = hlEstatusClick
    end
    object JvHotLink1: TBitBtn [11]
      Left = 576
      Top = 6
      Width = 21
      Height = 13
      Cursor = crHandPoint
      Caption = 'Caja'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnClick = JvHotLink1Click
    end
    object JvHotLink2: TBitBtn [12]
      Left = 388
      Top = 6
      Width = 30
      Height = 13
      Cursor = crHandPoint
      Caption = 'Fecha'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
      OnClick = JvHotLink2Click
    end
    inherited edExplorarValor: TEdit
      Left = 302
      Top = 27
      Width = 90
      Visible = False
      ExplicitLeft = 302
      ExplicitTop = 27
      ExplicitWidth = 90
    end
    inherited edExplorarDel: TDateTimePicker
      Left = 302
      Top = 27
      TabOrder = 8
      ExplicitLeft = 302
      ExplicitTop = 27
    end
    inherited edExplorarAl: TDateTimePicker
      TabOrder = 9
    end
    inherited buExpHoy: TBitBtn
      TabOrder = 10
    end
    object deUsuario: TDBEdit
      Left = 106
      Top = 3
      Width = 260
      Height = 21
      TabStop = False
      Color = 15788249
      DataField = 'R_NOMBRE_USUARIO'
      DataSource = dsVer_Datos_Cajero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object deAlmacen: TDBEdit
      Left = 106
      Top = 24
      Width = 135
      Height = 21
      TabStop = False
      Color = 15788249
      DataField = 'R_ALMACEN_CLAVE'
      DataSource = dsVer_Datos_Cajero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object edFecha: TEdit
      Left = 456
      Top = 3
      Width = 90
      Height = 21
      TabStop = False
      Color = 15788249
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      Text = '03/12/2001'
    end
    object deCaja: TDBEdit
      Left = 637
      Top = 3
      Width = 110
      Height = 21
      TabStop = False
      Color = 15788249
      DataField = 'R_NOMBRE'
      DataSource = dsVer_Datos_Cajero
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object cbAlmacenes: TDBLookupComboBox
      Left = 106
      Top = 24
      Width = 135
      Height = 21
      DropDownWidth = 250
      TabOrder = 7
      TabStop = False
      Visible = False
    end
    object cbCajas: TDBLookupComboBox
      Left = 637
      Top = 3
      Width = 110
      Height = 21
      DropDownWidth = 200
      TabOrder = 5
      TabStop = False
      Visible = False
    end
    object cbFecha: TDateTimePicker
      Left = 384
      Top = 27
      Width = 90
      Height = 21
      Date = 42265.470171736100000000
      Time = 42265.470171736100000000
      TabOrder = 3
      TabStop = False
      Visible = False
      OnChange = cbFechaChange
    end
  end
  inherited dgExplorar: TcxGrid [1]
    Top = 110
    Width = 743
    Height = 254
    ExplicitTop = 110
    ExplicitWidth = 743
    ExplicitHeight = 254
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJA_NOMBRE'
      end
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
      end
      object dgExplorarDBTableView1R_USUARIO_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_USUARIO_NOMBRE'
      end
      object dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'R_REFERENCIA'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_CLAVE'
      end
      object dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_NOMBRE'
      end
    end
  end
  inherited fpPadre: TPanel [2]
    Width = 743
    ExplicitWidth = 743
    inherited Panel1: TPanel
      Width = 743
      ExplicitWidth = 743
    end
    inherited ibVer: TBitBtn
      Left = 2
      ExplicitLeft = 2
    end
    inherited ibConstructor: TBitBtn
      Left = 79
      ExplicitLeft = 79
    end
    inherited ibImprimir: TBitBtn
      Left = 156
      ExplicitLeft = 156
    end
  end
  inherited Panel2: TPanel [3]
    Top = 364
    Width = 743
    ExplicitTop = 364
    ExplicitWidth = 743
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT C.ID R_ID, C.FECHA R_FECHA, CA.NOMBRE R_CAJA_NOMBRE, C.TO' +
        'TAL R_TOTAL, S.NOMBRE R_USUARIO_NOMBRE, C.REFERENCIA R_REFERENCI' +
        'A, C.ESTATUS R_ESTATUS, A.CLAVE R_ALMACEN_CLAVE, A.NOMBRE R_ALMA' +
        'CEN_NOMBRE'
      'FROM (COLECTAS C LEFT JOIN CAJAS CA ON C.CAJA = CA.ID)'
      '     LEFT JOIN SUJETOS_USUARIOS SU ON SU.ID = C.USUARIO'
      '     LEFT JOIN SUJETOS S ON S.ID = SU.SUJETO'
      '     LEFT JOIN ALMACENES A ON A.ID = C.ALMACEN'
      'WHERE (C.TIPO = "Ventas") AND'
      '      (F_FECHA(C.FECHA) BETWEEN :P_INICIAL AND :P_FINAL) AND'
      '      (C.ALMACEN = :P_ALMACEN) AND'
      '      (C.CAJA = :P_CAJA)'
      'AND C.ID = 0')
    ParamData = <
      item
        DataType = ftString
        Name = 'P_INICIAL'
        ParamType = ptUnknown
        Value = '13/12/2005'
      end
      item
        DataType = ftString
        Name = 'P_FINAL'
        ParamType = ptUnknown
        Value = '14/12/2005'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'P_CAJA'
        ParamType = ptUnknown
        Value = '3'
      end>
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Required = True
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_CAJA_NOMBRE: TIBStringField
      FieldName = 'R_CAJA_NOMBRE'
      Size = 100
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyExplorarR_USUARIO_NOMBRE: TIBStringField
      FieldName = 'R_USUARIO_NOMBRE'
      Size = 100
    end
    object qyExplorarR_REFERENCIA: TIBStringField
      FieldName = 'R_REFERENCIA'
      Size = 50
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
    end
    object qyExplorarR_ALMACEN_CLAVE: TIBStringField
      FieldName = 'R_ALMACEN_CLAVE'
    end
    object qyExplorarR_ALMACEN_NOMBRE: TIBStringField
      FieldName = 'R_ALMACEN_NOMBRE'
      Size = 100
    end
  end
  object qyVer_Datos_Cajero: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_DATOS_CAJERO(:P_USUARIO, "Ventas")')
    Left = 224
    Top = 308
    ParamData = <
      item
        DataType = ftString
        Name = 'P_USUARIO'
        ParamType = ptUnknown
        Value = '1'
      end>
    object qyVer_Datos_CajeroR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyVer_Datos_CajeroR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_OBSERVACIONES'
      ReadOnly = True
      Size = 8
    end
    object qyVer_Datos_CajeroR_USUARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE_USUARIO'
      ReadOnly = True
      Size = 100
    end
    object qyVer_Datos_CajeroR_BAJA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BAJA'
      ReadOnly = True
      Size = 2
    end
    object qyVer_Datos_CajeroR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_REGISTROS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_REGISTROS'
      ReadOnly = True
    end
    object qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MODULO_FUNCION'
      ReadOnly = True
    end
  end
  object dsVer_Datos_Cajero: TDataSource
    DataSet = qyVer_Datos_Cajero
    Left = 256
    Top = 308
  end
end
