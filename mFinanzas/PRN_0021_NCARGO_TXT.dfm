inherited frmPRN_0021_TXT: TfrmPRN_0021_TXT
  Left = 356
  Top = 222
  Caption = 'PRN_0021'
  ClientHeight = 257
  ClientWidth = 365
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 365
    ExplicitWidth = 365
    inherited Panel1: TPanel
      Width = 365
      ExplicitWidth = 365
    end
  end
  object spACTUALIZA_NOTA_DE_CARGO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ACTUALIZA_NOTA_DE_CARGO'
    Left = 104
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object spMODIFICAR_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'MODIFICAR_FOLIO'
    Left = 72
    Top = 80
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
  object spAUTO_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'AUTO_FOLIO'
    Left = 40
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_FOLIO'
        ParamType = ptOutput
      end
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
        DataType = ftString
        Name = 'P_AFECTAR'
        ParamType = ptInput
        Value = 'No'
      end>
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
  object dsEncabezado: TDataSource
    DataSet = qyEncabezadoNCargo
    Left = 40
    Top = 176
  end
  object qyEncabezadoNCargo: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    OnCalcFields = qyEncabezadoNCargoCalcFields
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM NOTAS_DE_CARGO_ENCABEZADO(:P_ID)')
    Left = 8
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '17'
      end>
    object qyEncabezadoNCargoR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_TIPO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TIPO'
      ReadOnly = True
      Size = 14
    end
    object qyEncabezadoNCargoR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_FECHA_CANCELACION: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_CANCELACION'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_PROVEEDOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEncabezadoNCargoR_EXTENSION_PROVEEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_PROVEEDOR'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_SUJETO_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_SUJETO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEncabezadoNCargoR_SUJETO_TELEFONO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_TELEFONO'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_SUJETO_FAX: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_FAX'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_SUJETO_RFC: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_RFC'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_SUJETO_CALLE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_CALLE'
      ReadOnly = True
      Size = 100
    end
    object qyEncabezadoNCargoR_SUJETO_ENTRE_CALLE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_ENTRE_CALLE'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_SUJETO_Y_CALLE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_Y_CALLE'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_SUJETO_NUM_EXT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_NUM_EXT'
      ReadOnly = True
      Size = 10
    end
    object qyEncabezadoNCargoR_SUJETO_NUM_INT: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_NUM_INT'
      ReadOnly = True
      Size = 10
    end
    object qyEncabezadoNCargoR_SUJETO_COLONIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_COLONIA'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_SUJETO_CP: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_CP'
      ReadOnly = True
      Size = 10
    end
    object qyEncabezadoNCargoR_SUJETO_CIUDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUJETO_CIUDAD'
      ReadOnly = True
      Size = 304
    end
    object qyEncabezadoNCargoR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IVA_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IVA_PORC'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IEPS_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IEPS_PORC'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IMPUESTO1_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO1_PORC'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IMPUESTO2_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO2_PORC'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUBTOTAL'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IVA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IVA'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IEPS: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IEPS'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IMPUESTO1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO1'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_IMPUESTO2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPUESTO2'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_MONEDA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyEncabezadoNCargoR_MONEDA_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_USUARIO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_USUARIO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEncabezadoNCargoR_AUTORIZO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_AUTORIZO'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_AUTORIZO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_AUTORIZO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyEncabezadoNCargoR_SERIE_NC: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_SERIE_NC'
      ReadOnly = True
      Size = 10
    end
    object qyEncabezadoNCargoR_CONSECUTIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONSECUTIVO'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_ID_REFERENCIA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID_REFERENCIA'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_TABLA_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_TABLA_REFERENCIA'
      ReadOnly = True
      Size = 50
    end
    object qyEncabezadoNCargoR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_NUMERO_DE_DOCS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NUMERO_DE_DOCS'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DOCUMENTO'
      ReadOnly = True
    end
    object qyEncabezadoNCargoR_OBSERVACIONES: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_OBSERVACIONES'
      ReadOnly = True
      Size = 8
    end
    object qyEncabezadoNCargocantidadconletra: TStringField
      FieldKind = fkCalculated
      FieldName = 'cantidadconletra'
      Size = 80
      Calculated = True
    end
  end
  object qyDetalleNCargo: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM NOTAS_DE_CARGO_PARTIDAS(:P_ID)')
    Left = 8
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '17'
      end>
  end
  object dsDetalle: TDataSource
    DataSet = qyDetalleNCargo
    Left = 40
    Top = 208
  end
end
