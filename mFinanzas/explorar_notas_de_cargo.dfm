inherited frmExplorar_notas_de_cargo: TfrmExplorar_notas_de_cargo
  Left = 204
  Top = 222
  Caption = 'Explorar Notas de Cargo'
  ClientHeight = 362
  ClientWidth = 619
  ExplicitWidth = 635
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 619
    ExplicitWidth = 619
    inherited Panel1: TPanel
      Width = 619
      ExplicitWidth = 619
    end
  end
  inherited Panel2: TPanel
    Top = 340
    Width = 619
    ExplicitTop = 340
    ExplicitWidth = 619
  end
  inherited dgExplorar: TcxGrid
    Width = 619
    Height = 251
    ExplicitWidth = 619
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_TIPO: TcxGridDBColumn
        DataBinding.FieldName = 'R_TIPO'
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
      object dgExplorarDBTableView1R_FOLIO: TcxGridDBColumn
        DataBinding.FieldName = 'R_FOLIO'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT NC.ID R_ID, NC.CLAVE R_CLAVE, NC.NOMBRE R_NOMBRE, NC.TIPO' +
        ' R_TIPO, A.CLAVE R_ALMACEN_CLAVE, NC.TOTAL R_TOTAL, M.CLAVE R_MO' +
        'NEDA_CLAVE, NC.ESTATUS R_ESTATUS, NC.CONSECUTIVO R_FOLIO, NC.FEC' +
        'HA_ALTA R_FECHA'
      'FROM (NOTAS_DE_CARGO NC LEFT JOIN MONEDAS M ON NC.MONEDA = M.ID)'
      '           LEFT JOIN ALMACENES A ON NC.ALMACEN = A.ID'
      'WHERE NC.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
    end
    object qyExplorarR_TIPO: TIBStringField
      FieldName = 'R_TIPO'
      Size = 14
    end
    object qyExplorarR_ALMACEN_CLAVE: TIBStringField
      FieldName = 'R_ALMACEN_CLAVE'
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      DisplayFormat = '###,###,##0.00'
    end
    object qyExplorarR_MONEDA_CLAVE: TIBStringField
      FieldName = 'R_MONEDA_CLAVE'
      Size = 10
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
    end
    object qyExplorarR_FOLIO: TIntegerField
      FieldName = 'R_FOLIO'
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Size = 100
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
  end
end
