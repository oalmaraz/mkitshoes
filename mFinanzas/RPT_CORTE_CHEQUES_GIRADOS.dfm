object frmRPT_CORTE_CHEQUES_GIRADOS: TfrmRPT_CORTE_CHEQUES_GIRADOS
  Left = 244
  Top = 183
  Caption = 'frmRPT_CORTE_CHEQUES_GIRADOS'
  ClientHeight = 548
  ClientWidth = 1020
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qyCheques: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM VER_CHEQUES_GIRADOS(:P_FECHA_DEL, :P_FECHA_AL,  :P_ESTATUS,' +
        '  :P_BANCO, :P_MONEDA, :P_POR_APLICACION)')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA_DEL'
        ParamType = ptUnknown
        Value = '01/01/2004'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_AL'
        ParamType = ptUnknown
        Value = '17/05/2004'
      end
      item
        DataType = ftString
        Name = 'P_ESTATUS'
        ParamType = ptUnknown
        Value = '4'
      end
      item
        DataType = ftString
        Name = 'P_BANCO'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftString
        Name = 'P_MONEDA'
        ParamType = ptUnknown
        Value = '-1'
      end
      item
        DataType = ftString
        Name = 'P_POR_APLICACION'
        ParamType = ptUnknown
        Value = 'No'
      end>
    object qyChequesR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyChequesR_REFERENCIA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_REFERENCIA'
      ReadOnly = True
    end
    object qyChequesR_MONTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONTO'
      ReadOnly = True
    end
    object qyChequesR_MONEDA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA'
      ReadOnly = True
    end
    object qyChequesR_MONEDA_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MONEDA_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyChequesR_PROVEEDOR: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR'
      ReadOnly = True
    end
    object qyChequesR_PROVEEDOR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PROVEEDOR_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyChequesR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyChequesR_FECHA_APLICACION: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_APLICACION'
      ReadOnly = True
    end
    object qyChequesR_FECHA_APLICACION_REAL: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_APLICACION_REAL'
      ReadOnly = True
    end
    object qyChequesR_BANCO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO'
      ReadOnly = True
    end
    object qyChequesR_BANCO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyChequesR_OBSERVACIONES: TBlobField
      FieldKind = fkInternalCalc
      FieldName = 'R_OBSERVACIONES'
      ReadOnly = True
      Size = 8
    end
    object qyChequesR_AUTORIZO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_AUTORIZO'
      ReadOnly = True
    end
    object qyChequesR_AUTORIZO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_AUTORIZO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyChequesR_CONSECUTIVO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONSECUTIVO'
      ReadOnly = True
    end
    object qyChequesR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyChequesR_PAGADO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PAGADO'
      ReadOnly = True
    end
    object qyChequesR_PENDIENTE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PENDIENTE'
      ReadOnly = True
    end
    object qyChequesR_BANCO_CUENTA: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_BANCO_CUENTA'
      ReadOnly = True
      Size = 50
    end
  end
end
