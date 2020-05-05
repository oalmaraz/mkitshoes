object dmDetalleDeLaVenta: TdmDetalleDeLaVenta
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 479
  Width = 741
  object qyIBXDetalle: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CXC_QUE_COMPRE(:P_CXC)')
    Left = 32
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'P_CXC'
        ParamType = ptUnknown
      end>
    object qyIBXDetalleR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyIBXDetalleR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyIBXDetalleR_MATERIAL_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_CLAVE'
      ReadOnly = True
    end
    object qyIBXDetalleR_MATERIAL_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_DESCRIPCION'
      ReadOnly = True
      Size = 100
    end
    object qyIBXDetalleR_CANTIDAD: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_CANTIDAD'
      ReadOnly = True
    end
    object qyIBXDetalleR_UNIDAD: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD'
      ReadOnly = True
    end
    object qyIBXDetalleR_UNIDAD_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_CLAVE'
      ReadOnly = True
      Size = 10
    end
    object qyIBXDetalleR_UNIDAD_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_UNIDAD_DESCRIPCION'
      ReadOnly = True
      Size = 50
    end
    object qyIBXDetalleR_PRECIO_VENTA: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRECIO_VENTA'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_DESCUENTO_PORC: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_PORC'
      ReadOnly = True
      DisplayFormat = '##0.00 %'
    end
    object qyIBXDetalleR_SUBTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_SUBTOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_DESCUENTO_PARCIAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_PARCIAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_DESCUENTO_GLOBAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_DESCUENTO_GLOBAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_TOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_TOTAL'
      ReadOnly = True
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_DG_PORC: TFloatField
      FieldName = 'R_DG_PORC'
      Origin = 'CXC_QUE_COMPRE.R_DG_PORC'
      DisplayFormat = '##0.00 %'
    end
    object qyIBXDetalleR_IVA: TFloatField
      FieldName = 'R_IVA'
      Origin = 'CXC_QUE_COMPRE.R_IVA'
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyIBXDetalleR_GT: TFloatField
      FieldName = 'R_GT'
      Origin = 'CXC_QUE_COMPRE.R_GT'
      DisplayFormat = '$ ###,###,##0.00'
    end
  end
  object dsDetalle: TDataSource
    DataSet = qyIBXDetalle
    Left = 32
    Top = 120
  end
end
