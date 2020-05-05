inherited frmPRN_0015_TXT: TfrmPRN_0015_TXT
  Left = 954
  Top = 481
  Caption = 'PRN_0015'
  ClientHeight = 253
  ClientWidth = 231
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 231
    ExplicitWidth = 231
    inherited Panel1: TPanel
      Width = 231
      ExplicitWidth = 231
    end
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
  object spAUTO_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'AUTO_FOLIO'
    Left = 8
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
  object qyEncabezadoNC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM NOTAS_DE_CREDITO_ENCABEZADO(:P_ID)')
    Left = 8
    Top = 176
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '106'
      end>
  end
  object dsEncabezado: TDataSource
    DataSet = qyEncabezadoNC
    Left = 40
    Top = 176
  end
  object dsDetalle: TDataSource
    DataSet = qyDetalleNC
    Left = 40
    Top = 208
  end
  object qyDetalleNC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM NOTAS_DE_CREDITO_PARTIDAS(:P_ID)')
    Left = 8
    Top = 208
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '106'
      end>
  end
  object spMODIFICAR_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'MODIFICAR_FOLIO'
    Left = 40
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
  object spACTUALIZA_NOTA_DE_CREDITO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ACTUALIZA_NOTA_DE_CREDITO'
    Left = 72
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
end
