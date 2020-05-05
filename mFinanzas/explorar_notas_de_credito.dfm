inherited frmExplorar_notas_de_credito: TfrmExplorar_notas_de_credito
  Left = 434
  Top = 144
  Caption = 'Explorar Notas de Credito'
  ClientHeight = 453
  ClientWidth = 866
  ExplicitWidth = 882
  ExplicitHeight = 492
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 866
    ExplicitWidth = 866
    inherited Panel1: TPanel
      Width = 866
      ExplicitWidth = 866
    end
  end
  inherited Panel2: TPanel
    Top = 431
    Width = 866
    ExplicitTop = 431
    ExplicitWidth = 866
  end
  inherited dgExplorar: TcxGrid
    Width = 866
    Height = 342
    ExplicitWidth = 866
    ExplicitHeight = 342
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
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
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
      object dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLIENTE'
      end
      object dgExplorarDBTableView1R_C_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_NOMBRE'
      end
      object dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn
        DataBinding.FieldName = 'R_REFERENCIA'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn
        DataBinding.FieldName = 'R_EXTENSION'
      end
      object dgExplorarDBTableView1R_E_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_E_NOMBRE'
      end
      object dgExplorarDBTableView1R_DEVOLUCION_PRODUCTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_DEVOLUCION_PRODUCTO'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 866
    ExplicitWidth = 866
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT NC.ID R_ID, NC.CLAVE R_CLAVE, A.CLAVE R_ALMACEN_CLAVE, NC' +
        '.GRANTOTAL R_TOTAL, M.CLAVE R_MONEDA_CLAVE, NC.ESTATUS R_ESTATUS' +
        ', NC.CONSECUTIVO R_CONSECUTIVO,'
      '       S.CLAVE R_CLIENTE, S.NOMBRE R_C_NOMBRE, '
      '       CC.REFERENCIA R_REFERENCIA, NC.FECHA_ALTA R_FECHA,'
      '       CE.CLAVE R_EXTENSION, CE.NOMBRE R_E_NOMBRE,'
      '       NC.DEVOLUCION_PRODUCTO R_DEVOLUCION_PRODUCTO'
      
        'FROM (NOTAS_DE_CREDITO NC LEFT JOIN ALMACENES A ON NC.ALMACEN = ' +
        'A.ID)'
      '     LEFT JOIN MONEDAS M ON NC.MONEDA = M.ID'
      '     LEFT JOIN SUJETOS_CLIENTES SC ON NC.CLIENTE = SC.ID'
      '     LEFT JOIN SUJETOS S ON SC.SUJETO = S.ID'
      
        '     LEFT JOIN CUENTAS_POR_COBRAR CC ON NC.CUENTA_POR_COBRAR = C' +
        'C.ID'
      '     LEFT JOIN CLIENTES_EXTENSIONES CE ON NC.EXTENSION = CE.ID'
      'WHERE NC.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'NOTAS_DE_CREDITO.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'NOTAS_DE_CREDITO.CLAVE'
    end
    object qyExplorarR_ALMACEN_CLAVE: TIBStringField
      FieldName = 'R_ALMACEN_CLAVE'
      Origin = 'ALMACENES.CLAVE'
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      Origin = 'NOTAS_DE_CREDITO.GRANTOTAL'
    end
    object qyExplorarR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Origin = 'MONEDAS.CLAVE'
      Size = 10
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'NOTAS_DE_CREDITO.ESTATUS'
    end
    object qyExplorarR_CONSECUTIVO: TIntegerField
      FieldName = 'R_CONSECUTIVO'
      Origin = 'NOTAS_DE_CREDITO.CONSECUTIVO'
    end
    object qyExplorarR_CLIENTE: TIBStringField
      FieldName = 'R_CLIENTE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_C_NOMBRE: TIBStringField
      FieldName = 'R_C_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_REFERENCIA: TIBStringField
      FieldName = 'R_REFERENCIA'
      Origin = 'CUENTAS_POR_COBRAR.REFERENCIA'
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      Origin = 'NOTAS_DE_CREDITO.FECHA_ALTA'
    end
    object qyExplorarR_EXTENSION: TIBStringField
      FieldName = 'R_EXTENSION'
      Origin = 'CLIENTES_EXTENSIONES.CLAVE'
    end
    object qyExplorarR_E_NOMBRE: TIBStringField
      FieldName = 'R_E_NOMBRE'
      Origin = 'CLIENTES_EXTENSIONES.NOMBRE'
      Size = 100
    end
    object qyExplorarR_DEVOLUCION_PRODUCTO: TIBStringField
      FieldName = 'R_DEVOLUCION_PRODUCTO'
      Origin = 'NOTAS_DE_CREDITO.DEVOLUCION_PRODUCTO'
      FixedChar = True
      Size = 2
    end
  end
  object qyConstructor_Detalle: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM CONSTRUCTOR_DETALLE'
      'WHERE CONSTRUCTOR = :P_ID'
      'ORDER BY ID')
    Left = 152
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '0'
      end>
    object qyConstructor_DetalleID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qyConstructor_DetalleCONSTRUCTOR: TIntegerField
      FieldName = 'CONSTRUCTOR'
      Required = True
    end
    object qyConstructor_DetalleUSR_CAMPO: TIBStringField
      FieldName = 'USR_CAMPO'
    end
    object qyConstructor_DetalleUSR_SENTENCIA: TIBStringField
      FieldName = 'USR_SENTENCIA'
    end
    object qyConstructor_DetalleUSR_LOGICA: TIBStringField
      FieldName = 'USR_LOGICA'
      Size = 10
    end
    object qyConstructor_DetalleUSR_VALOR: TIBStringField
      FieldName = 'USR_VALOR'
      Size = 100
    end
    object qyConstructor_DetalleBD_CAMPO: TIBStringField
      FieldName = 'BD_CAMPO'
    end
    object qyConstructor_DetalleBD_SENTENCIA: TIBStringField
      FieldName = 'BD_SENTENCIA'
    end
    object qyConstructor_DetalleBD_LOGICA: TIBStringField
      FieldName = 'BD_LOGICA'
      Size = 10
    end
    object qyConstructor_DetalleBD_VALOR: TIBStringField
      FieldName = 'BD_VALOR'
      Size = 100
    end
  end
  object dsConstructor_Detalle: TDataSource
    DataSet = qyConstructor_Detalle
    Left = 183
    Top = 248
  end
end
