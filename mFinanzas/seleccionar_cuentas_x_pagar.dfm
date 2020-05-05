inherited frmSeleccionar_cuentas_x_pagar: TfrmSeleccionar_cuentas_x_pagar
  Left = 56
  Top = 78
  Caption = 'Seleccionar Cuentas por Pagar'
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
      'FROM VER_CUENTAS_X_PAGAR(:P_CAMPO, :P_VALOR)')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'P_CAMPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'P_VALOR'
        ParamType = ptUnknown
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
    object qySeleccionarRN_PROVEEDOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_PROVEEDOR'
      ReadOnly = True
    end
    object qySeleccionarR_PROVEEDOR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qySeleccionarR_PROVEEDOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_NOMBRE'
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
    object qySeleccionarR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
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
    object qySeleccionarR_SALDO_ACTUAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_ACTUAL'
      ReadOnly = True
    end
    object qySeleccionarR_VENCIMIENTOS: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_VENCIMIENTOS'
      ReadOnly = True
    end
    object qySeleccionarRN_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ALMACEN'
      ReadOnly = True
    end
    object qySeleccionarRN_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qySeleccionarRN_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'RN_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
  end
end
