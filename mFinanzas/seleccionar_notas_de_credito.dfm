inherited frmSeleccionar_notas_de_credito: TfrmSeleccionar_notas_de_credito
  Left = 305
  Top = 111
  Caption = 'Seleccionar Notas de Credito'
  ClientHeight = 452
  ClientWidth = 848
  ExplicitWidth = 864
  ExplicitHeight = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 848
    inherited Panel1: TPanel
      Width = 848
    end
    inherited ibTodos: TBitBtn
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Top = 430
    Width = 848
  end
  inherited dgExplorar: TDBGrid
    Width = 848
    Height = 375
  end
  inherited qySeleccionar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    SQL.Strings = (
      'SELECT *'
      'FROM VER_NOTAS_DE_CREDITO(:P_CAMPO,:P_VALOR)')
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CAMPO'
        ParamType = ptUnknown
        Value = 'nada'
      end
      item
        DataType = ftString
        Name = 'P_VALOR'
        ParamType = ptUnknown
        Value = 'nada'
      end>
    object qySeleccionarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qySeleccionarR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qySeleccionarR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qySeleccionarR_FECHA_COMPRA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_COMPRA'
      ReadOnly = True
    end
    object qySeleccionarR_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_VENCIMIENTO'
      ReadOnly = True
    end
    object qySeleccionarR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qySeleccionarR_NUMERO_DE_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_NUMERO_DE_DOCUMENTOS'
      ReadOnly = True
    end
    object qySeleccionarR_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_DOCUMENTO'
      ReadOnly = True
    end
    object qySeleccionarR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarR_CLIENTE_RAZON_SOCIAL: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_RAZON_SOCIAL'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarRN_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_EXTENSION'
      ReadOnly = True
    end
    object qySeleccionarRN_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
  end
  inherited spAdd: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ADD_NC_A_NC'
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_NC_ORIGEN'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_NC_DESTINO'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object dsEncabezado: TDataSource
    Left = 520
    Top = 336
  end
end
