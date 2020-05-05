inherited frmSeleccionar_cuentas_por_cobrar: TfrmSeleccionar_cuentas_por_cobrar
  Left = 610
  Top = 127
  Caption = 'Seleccionar Cuentas por Cobrar'
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    inherited ibTodos: TBitBtn
      Visible = False
    end
  end
  inherited qySeleccionar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    SQL.Strings = (
      'SELECT *'
      'FROM VER_ESTADO_DE_CUENTA(:P_CAMPO, :P_VALOR)')
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CAMPO'
        ParamType = ptUnknown
        Value = 'ninguno'
      end
      item
        DataType = ftString
        Name = 'P_VALOR'
        ParamType = ptUnknown
        Value = 'ninguno'
      end>
    object qySeleccionarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qySeleccionarR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qySeleccionarRN_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_CLIENTE'
      ReadOnly = True
    end
    object qySeleccionarR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qySeleccionarRN_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_EXTENSION'
      ReadOnly = True
    end
    object qySeleccionarRN_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qySeleccionarRN_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarRN_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ALMACEN'
      ReadOnly = True
    end
    object qySeleccionarR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarRN_NUMERO_DE_DOCUMENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_NUMERO_DE_DOCUMENTOS'
      ReadOnly = True
    end
    object qySeleccionarRN_DOCUMENTO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_DOCUMENTO'
      ReadOnly = True
    end
    object qySeleccionarR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
    object qySeleccionarR_FECHA_VENCIMIENTO: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_VENCIMIENTO'
      ReadOnly = True
    end
    object qySeleccionarR_IMPORTE_INICIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_IMPORTE_INICIAL'
      ReadOnly = True
    end
    object qySeleccionarRN_SALDO_ACTUAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'RN_SALDO_ACTUAL'
      ReadOnly = True
    end
    object qySeleccionarR_VENCIMIENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_VENCIMIENTOS'
      ReadOnly = True
    end
  end
end
