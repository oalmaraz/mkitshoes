object frmRPT_CORTE_CAJAS_CXC: TfrmRPT_CORTE_CAJAS_CXC
  Left = 423
  Top = 20
  Caption = 'frmRPT_CORTE_CAJAS_CXC'
  ClientHeight = 441
  ClientWidth = 869
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
  object dsCorteDeCajas: TDataSource
    DataSet = qyCorteDeCajasCXC
    Left = 40
    Top = 16
  end
  object qyCorteDeCajasCXC: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      
        'FROM GRAL_CORTE_CAJAS_CXC(:P_FECHA_DEL, :P_FECHA_AL,  :P_CAJA, :' +
        'P_ALMACEN, :P_OPCION)')
    Left = 8
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FECHA_DEL'
        ParamType = ptUnknown
        Value = '03/12/2001'
      end
      item
        DataType = ftString
        Name = 'P_FECHA_AL'
        ParamType = ptUnknown
        Value = '03/12/2001'
      end
      item
        DataType = ftString
        Name = 'P_CAJA'
        ParamType = ptUnknown
        Value = '4'
      end
      item
        DataType = ftString
        Name = 'P_ALMACEN'
        ParamType = ptUnknown
        Value = '2'
      end
      item
        DataType = ftString
        Name = 'P_OPCION'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyCorteDeCajasCXCR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_FOLIO_PAGO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_FOLIO_PAGO'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_FECHA_ALTA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ALTA'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_ALMACEN: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_ALMACEN_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_CLAVE'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_ALMACEN_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ALMACEN_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDeCajasCXCR_CAJERO: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_CAJERO_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJERO_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDeCajasCXCR_CAJA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_CAJA_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CAJA_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDeCajasCXCR_GRANTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'R_GRANTOTAL'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_ESTATUS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ESTATUS'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_PRIORIDAD: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PRIORIDAD'
      ReadOnly = True
      Size = 2
    end
    object qyCorteDeCajasCXCR_CLIENTE: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE'
      ReadOnly = True
    end
    object qyCorteDeCajasCXCR_CLIENTE_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_CLAVE'
      ReadOnly = True
      Size = 50
    end
    object qyCorteDeCajasCXCR_CLIENTE_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLIENTE_NOMBRE'
      ReadOnly = True
      Size = 100
    end
    object qyCorteDeCajasCXCR_MONEDA: TIntegerField
      FieldName = 'R_MONEDA'
      Origin = 'GRAL_CORTE_CAJAS_CXC.R_MONEDA'
    end
    object qyCorteDeCajasCXCR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'GRAL_CORTE_CAJAS_CXC.R_MONEDA_CLAVE'
      Size = 10
    end
    object qyCorteDeCajasCXCR_MONEDA_DESCRIPCION: TIBStringField
      FieldName = 'R_MONEDA_DESCRIPCION'
      Origin = 'GRAL_CORTE_CAJAS_CXC.R_MONEDA_DESCRIPCION'
      Size = 50
    end
    object qyCorteDeCajasCXCR_TOTAL_MBASE: TFloatField
      FieldName = 'R_TOTAL_MBASE'
      Origin = 'GRAL_CORTE_CAJAS_CXC.R_TOTAL_MBASE'
    end
  end
end
