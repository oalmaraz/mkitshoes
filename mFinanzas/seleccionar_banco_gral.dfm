inherited frmSeleccionar_bancos_gral: TfrmSeleccionar_bancos_gral
  Left = 364
  Top = 137
  Caption = 'Seleccionar Bancos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited qySeleccionar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    SQL.Strings = (
      'SELECT *'
      'FROM BANCOS')
    object qySeleccionarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qySeleccionarR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qySeleccionarR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarR_CUENTA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CUENTA'
      ReadOnly = True
      Size = 50
    end
  end
end
