inherited frmExplorar_colectas_pagos: TfrmExplorar_colectas_pagos
  Left = 366
  Top = 254
  ActiveControl = nil
  Caption = 'Explorar Coletas Pagos'
  ClientHeight = 373
  ClientWidth = 842
  ExplicitWidth = 858
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 842
    ExplicitWidth = 842
    object laAlmacen: TLabel [0]
      Left = 558
      Top = 20
      Width = 41
      Height = 13
      Caption = 'Almacen'
      Transparent = True
    end
    object Label1: TLabel [1]
      Left = 683
      Top = 20
      Width = 30
      Height = 13
      Caption = 'Fecha'
      Transparent = True
    end
    inherited Panel1: TPanel
      Width = 842
      TabOrder = 9
      ExplicitWidth = 842
    end
    inherited ibVer: TBitBtn
      Left = 2
      TabOrder = 0
      ExplicitLeft = 2
    end
    inherited ibConstructor: TBitBtn
      Left = 79
      TabOrder = 1
      Visible = False
      ExplicitLeft = 79
    end
    inherited ibImprimir: TBitBtn
      Left = 156
      TabOrder = 2
      ExplicitLeft = 156
    end
    inherited ibPantalla: TBitBtn
      Left = 247
      TabOrder = 3
      ExplicitLeft = 247
    end
    inherited ibExportarXLS: TBitBtn
      Left = 324
      TabOrder = 4
      ExplicitLeft = 324
    end
    inherited ibExportarHTML: TBitBtn
      Left = 401
      TabOrder = 5
      ExplicitLeft = 401
    end
    inherited ibExportarXML: TBitBtn
      Left = 478
      TabOrder = 8
      ExplicitLeft = 478
    end
    object cbAlmacenes: TDBLookupComboBox
      Left = 558
      Top = 36
      Width = 123
      Height = 21
      KeyField = 'ID'
      ListField = 'NOMBRE'
      ListSource = dsAlmacenes
      TabOrder = 6
      OnClick = cbAlmacenesClick
    end
    object deFecha: TDateTimePicker
      Left = 683
      Top = 36
      Width = 93
      Height = 21
      Date = 42265.519146226800000000
      Time = 42265.519146226800000000
      TabOrder = 7
    end
  end
  inherited Panel2: TPanel
    Top = 351
    Width = 842
    ExplicitTop = 351
    ExplicitWidth = 842
  end
  inherited dgExplorar: TcxGrid
    Width = 842
    Height = 262
    ExplicitWidth = 842
    ExplicitHeight = 262
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_CAJA: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJA'
      end
      object dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CAJA_NOMBRE'
      end
      object dgExplorarDBTableView1R_TIPO: TcxGridDBColumn
        DataBinding.FieldName = 'R_TIPO'
      end
      object dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN'
      end
      object dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_NOMBRE'
      end
      object dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn
        DataBinding.FieldName = 'R_USUARIO'
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
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 842
    Visible = False
    ExplicitWidth = 842
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT *'
      'FROM VER_COLECTAS(:P_CAJA, :P_TIPO, :P_FECHA, :P_ALMACEN)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_CAJA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_TIPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_FECHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
      end>
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
      DisplayFormat = 'dd/mmm/yyyy'
    end
    object qyExplorarR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyExplorarR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_TIPO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TIPO'
      ReadOnly = True
      Size = 11
    end
    object qyExplorarR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyExplorarR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_USUARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO'
      ReadOnly = True
    end
    object qyExplorarR_USUARIO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
      Size = 50
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
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
      '')
    Left = 496
    Top = 15
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
  object dsAlmacenes: TDataSource
    DataSet = qyAlmacenes
    Left = 528
    Top = 15
  end
  object dsVer_Datos_Cajero: TDataSource
    DataSet = qyVer_Datos_Cajero
    Left = 114
    Top = 320
  end
  object qyVer_Datos_Cajero: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VER_DATOS_CAJERO(:P_USUARIO, "Pagos")')
    Left = 83
    Top = 320
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
end
