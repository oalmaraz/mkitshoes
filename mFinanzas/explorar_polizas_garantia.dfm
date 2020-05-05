inherited frmExplorar_polizas_garantia: TfrmExplorar_polizas_garantia
  Left = 281
  Top = 500
  Caption = 'Explorar Polizas Garantia'
  ClientHeight = 575
  ClientWidth = 961
  ExplicitWidth = 977
  ExplicitHeight = 614
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 961
    ExplicitWidth = 693
    inherited Panel1: TPanel
      Width = 961
      ExplicitWidth = 693
    end
  end
  inherited Panel2: TPanel
    Top = 553
    Width = 961
    ExplicitTop = -22
    ExplicitWidth = 693
  end
  inherited dgExplorar: TcxGrid
    Width = 961
    Height = 464
    ExplicitWidth = 693
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_FECHA_FIN: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_FIN'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1R_MONTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_MONTO'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_DIAS: TcxGridDBColumn
        DataBinding.FieldName = 'R_DIAS'
      end
      object dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn
        DataBinding.FieldName = 'R_TELEFONO'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 961
    ExplicitWidth = 693
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, FECHA_ALTA R_FECHA_ALTA, FECHA_FIN R_FECHA_FIN, ' +
        'CLAVE R_CLAVE, NOMBRE R_NOMBRE, MONTO R_MONTO, ESTATUS R_ESTATUS' +
        ', DIAS R_DIAS, TELEFONO R_TELEFONO'
      'FROM POLIZAS'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Required = True
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_FECHA_FIN: TDateTimeField
      FieldName = 'R_FECHA_FIN'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Size = 100
    end
    object qyExplorarR_MONTO: TFloatField
      FieldName = 'R_MONTO'
      DisplayFormat = '$ ###,###,##0.00'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
    end
    object qyExplorarR_DIAS: TIntegerField
      FieldName = 'R_DIAS'
    end
    object qyExplorarR_TELEFONO: TIBStringField
      FieldName = 'R_TELEFONO'
    end
  end
end
