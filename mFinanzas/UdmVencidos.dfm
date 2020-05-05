object dmVencidos: TdmVencidos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 480
  Width = 696
  object qyIBXVencido: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ALMACENES_SALDOS_VENCIDOS(:P_CLIENTE)')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CLIENTE'
        ParamType = ptUnknown
      end>
    object qyIBXVencidoR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXVencidoR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyIBXVencidoR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyIBXVencidoR_SALDO_VENCIDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO_VENCIDO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXVencidoR_SALDO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SALDO'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
  end
  object dsVencido: TDataSource
    DataSet = qyIBXVencido
    Left = 32
    Top = 80
  end
end
