inherited frmExplorar_movimientos_de_inventario: TfrmExplorar_movimientos_de_inventario
  Left = 385
  Top = 397
  Caption = ''
  ClientHeight = 449
  ClientWidth = 751
  ExplicitWidth = 767
  ExplicitHeight = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 751
    ExplicitWidth = 751
    inherited Panel1: TPanel
      Width = 751
      ExplicitWidth = 751
    end
  end
  inherited Panel2: TPanel
    Top = 427
    Width = 751
    ExplicitTop = 427
    ExplicitWidth = 751
  end
  inherited dgExplorar: TcxGrid
    Width = 751
    Height = 338
    ExplicitWidth = 751
    ExplicitHeight = 338
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
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_ALMACEN_ORIGEN_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ALMACEN_ORIGEN_CLAVE'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_OBSERVACIONES: TcxGridDBColumn
        DataBinding.FieldName = 'R_OBSERVACIONES'
      end
      object dgExplorarDBTableView1R_FOLIO_ORIGEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_FOLIO_ORIGEN'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 751
    ExplicitWidth = 751
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT MI.ID R_ID, MI.CLAVE R_CLAVE, MI.TIPO R_TIPO, MI.FECHA_HO' +
        'RA R_FECHA_ALTA, A.CLAVE R_ALMACEN_ORIGEN_CLAVE, MI.ESTATUS R_ES' +
        'TATUS, MI.OBSERVACIONES R_OBSERVACIONES, MI.FOLIO_ALMACEN_ORIGEN' +
        ' R_FOLIO_ORIGEN'
      
        'FROM MOVIMIENTOS_DE_INVENTARIO MI LEFT JOIN ALMACENES A ON MI.AL' +
        'MACEN_ORIGEN = A.ID'
      'WHERE MI.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.CLAVE'
    end
    object qyExplorarR_TIPO: TIBStringField
      FieldName = 'R_TIPO'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.TIPO'
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.FECHA_HORA'
    end
    object qyExplorarR_ALMACEN_ORIGEN_CLAVE: TIBStringField
      FieldName = 'R_ALMACEN_ORIGEN_CLAVE'
      Origin = 'ALMACENES.CLAVE'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.ESTATUS'
    end
    object qyExplorarR_OBSERVACIONES: TIBStringField
      FieldName = 'R_OBSERVACIONES'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.OBSERVACIONES'
      Size = 100
    end
    object qyExplorarR_FOLIO_ORIGEN: TIntegerField
      FieldName = 'R_FOLIO_ORIGEN'
      Origin = 'MOVIMIENTOS_DE_INVENTARIO.FOLIO_ALMACEN_ORIGEN'
    end
  end
end
