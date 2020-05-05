inherited frmExplorar_monedas: TfrmExplorar_monedas
  Left = 396
  Top = 174
  Caption = 'Explorar Monedas'
  ClientHeight = 454
  ClientWidth = 769
  ExplicitWidth = 785
  ExplicitHeight = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 769
    ExplicitWidth = 769
    inherited Panel1: TPanel
      Width = 769
      ExplicitWidth = 769
    end
  end
  inherited Panel2: TPanel
    Top = 432
    Width = 769
    ExplicitTop = 432
    ExplicitWidth = 769
  end
  inherited dgExplorar: TcxGrid
    Width = 769
    Height = 343
    ExplicitWidth = 769
    ExplicitHeight = 343
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_PARIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_PARIDAD'
      end
      object dgExplorarDBTableView1R_PARIDAD_FALSA: TcxGridDBColumn
        DataBinding.FieldName = 'R_PARIDAD_FALSA'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 769
    ExplicitWidth = 769
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, CLAVE R_CLAVE, DESCRIPCION R_DESCRIPCION, FECHA_' +
        'ULT_ACT R_FECHA, PARIDAD R_PARIDAD,'
      '              PARIDAD_FALSA R_PARIDAD_FALSA'
      'FROM MONEDAS'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'MONEDAS.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'MONEDAS.CLAVE'
      Size = 10
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'MONEDAS.DESCRIPCION'
      Size = 50
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      Origin = 'MONEDAS.FECHA_ULT_ACT'
    end
    object qyExplorarR_PARIDAD: TFloatField
      FieldName = 'R_PARIDAD'
      Origin = 'MONEDAS.PARIDAD'
    end
    object qyExplorarR_PARIDAD_FALSA: TFloatField
      FieldName = 'R_PARIDAD_FALSA'
      Origin = 'MONEDAS.PARIDAD_FALSA'
    end
  end
end
