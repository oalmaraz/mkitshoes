inherited frmPRN_0024_Manual_lista_precios: TfrmPRN_0024_Manual_lista_precios
  Left = 390
  Top = 273
  Caption = 'PRN_0024'
  ClientHeight = 543
  ClientWidth = 790
  OldCreateOrder = True
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 790
    ExplicitWidth = 790
    inherited Panel1: TPanel
      Width = 790
      ExplicitWidth = 790
    end
  end
  object qyManual: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM PRN_MANUAL_LISTA_PRECIOS(:P_FECHA)')
    Left = 24
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA'
        ParamType = ptUnknown
        Value = '04/09/2003'
      end>
    object qyManualR_FECHA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA'
      ReadOnly = True
    end
    object qyManualR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyManualR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyManualR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyManualR_EXTENSION: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION'
      ReadOnly = True
    end
    object qyManualR_EXTENSION_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_CLAVE'
      ReadOnly = True
    end
    object qyManualR_EXTENSION_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_EXTENSION_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyManualR_ULTIMA_COMPRA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_ULTIMA_COMPRA'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_1: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_1'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_2: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_2'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_3: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_3'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_4: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_4'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_5: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_5'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_6: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_6'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_7: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_7'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_8: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_8'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_9: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_9'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_10: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_10'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_11: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_11'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_12: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_12'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_13: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_13'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_14: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_14'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_15: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_15'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_16: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_16'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_17: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_17'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_18: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_18'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_19: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_19'
      ReadOnly = True
    end
    object qyManualR_MATERIAL_PRECIO_20: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_PRECIO_20'
      ReadOnly = True
    end
  end
  object qyMateriales: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM REPORTE_MANUAL_LISTA_PRECIOS')
    Left = 24
    Top = 112
    object qyMaterialesR_MATERIAL: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL'
      ReadOnly = True
    end
    object qyMaterialesR_MATERIAL_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_CLAVE'
      ReadOnly = True
    end
    object qyMaterialesR_MATERIAL_DESCRIPCION: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_MATERIAL_DESCRIPCION'
      ReadOnly = True
      Size = 100
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
    Left = 24
    Top = 48
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
    object qyEmpresausuario: TStringField
      FieldKind = fkCalculated
      FieldName = 'usuario'
      Size = 100
      Calculated = True
    end
  end
end
