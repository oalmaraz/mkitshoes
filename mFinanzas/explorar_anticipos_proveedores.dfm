inherited frmExplorar_anticipos_proveedores: TfrmExplorar_anticipos_proveedores
  Left = 298
  Top = 360
  Caption = 'yyyyy'
  ClientHeight = 444
  ClientWidth = 887
  ExplicitWidth = 903
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 887
    ExplicitWidth = 887
    inherited Panel1: TPanel
      Width = 887
      ExplicitWidth = 887
    end
  end
  inherited Panel2: TPanel
    Top = 422
    Width = 887
    ExplicitTop = 422
    ExplicitWidth = 887
  end
  inherited dgExplorar: TcxGrid
    Width = 887
    Height = 333
    ExplicitWidth = 887
    ExplicitHeight = 333
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_CLAVE'
      end
      object dgExplorarDBTableView1R_MONEDA_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_MONEDA_CLAVE'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONSECUTIVO'
      end
      object dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'R_REFERENCIA'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
      end
      object dgExplorarDBTableView1R_PROVEEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_PROVEEDOR'
      end
      object dgExplorarDBTableView1R_P_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_P_NOMBRE'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 887
    ExplicitWidth = 887
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT NC.ID R_ID, '
      '       NC.CLAVE R_CLAVE, '
      '       A.CLAVE R_ALMACEN_CLAVE, '
      '       M.CLAVE R_MONEDA_CLAVE, '
      '       NC.ESTATUS R_ESTATUS, '
      '       NC.CONSECUTIVO R_CONSECUTIVO,'
      '       S.CLAVE R_PROVEEDOR, '
      '       S.NOMBRE R_P_NOMBRE, '
      '       CP.REFERENCIA R_REFERENCIA, '
      '       NC.FECHA_ALTA R_FECHA,'
      '       NC.TOTAL R_TOTAL'
      
        'FROM (ANTICIPOS_CXP NC LEFT JOIN ALMACENES A ON NC.ALMACEN = A.I' +
        'D)'
      '     LEFT JOIN MONEDAS M ON NC.MONEDA = M.ID'
      '     LEFT JOIN SUJETOS_PROVEEDORES SP ON NC.PROVEEDOR = SP.ID'
      '     LEFT JOIN SUJETOS S ON SP.SUJETO = S.ID'
      '     LEFT JOIN CUENTAS_X_PAGAR CP ON NC.CUENTA_POR_PAGAR = CP.ID'
      'WHERE NC.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'ANTICIPOS_CXP.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'ANTICIPOS_CXP.CLAVE'
    end
    object qyExplorarR_ALMACEN_CLAVE: TIBStringField
      FieldName = 'R_ALMACEN_CLAVE'
      Origin = 'ALMACENES.CLAVE'
    end
    object qyExplorarR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'MONEDAS.CLAVE'
      Size = 10
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'ANTICIPOS_CXP.ESTATUS'
    end
    object qyExplorarR_CONSECUTIVO: TIntegerField
      FieldName = 'R_CONSECUTIVO'
      Origin = 'ANTICIPOS_CXP.CONSECUTIVO'
    end
    object qyExplorarR_REFERENCIA: TIBStringField
      FieldName = 'R_REFERENCIA'
      Origin = 'CUENTAS_X_PAGAR.REFERENCIA'
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      Origin = 'ANTICIPOS_CXP.FECHA_ALTA'
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      Origin = 'ANTICIPOS_CXP.TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object qyExplorarR_PROVEEDOR: TIBStringField
      FieldName = 'R_PROVEEDOR'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_P_NOMBRE: TIBStringField
      FieldName = 'R_P_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
  end
end
