inherited frmSeleccionar_descuentos: TfrmSeleccionar_descuentos
  Left = 214
  Top = 168
  Caption = 'Seleccionar Descuentos'
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 684
    ExplicitWidth = 684
    inherited Panel1: TPanel
      Width = 684
      ExplicitWidth = 684
    end
    inherited ibTodos: TBitBtn
      Visible = False
    end
  end
  inherited Panel2: TPanel
    Width = 684
    ExplicitWidth = 684
  end
  inherited dgExplorar: TDBGrid
    Width = 684
  end
  inherited qySeleccionar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    SQL.Strings = (
      'SELECT *'
      'FROM VER_DESCUENTO_S (:P_CAMPO, :P_VALOR)')
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
    object qySeleccionarR_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qySeleccionarR_DESCUENTO_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_PORC'
      ReadOnly = True
      DisplayFormat = '#0.00 %'
    end
  end
  inherited spAdd: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
  end
  inherited spDel: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
  end
end
