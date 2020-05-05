inherited frmExplorar_tabuladores: TfrmExplorar_tabuladores
  Left = 214
  Top = 206
  ActiveControl = nil
  Caption = 'Explorar Tabuladores'
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
      object dgExplorarDBTableView1R_LIMITE_INF: TcxGridDBColumn
        DataBinding.FieldName = 'R_LIMITE_INF'
      end
      object dgExplorarDBTableView1R_LIMITE_SUP: TcxGridDBColumn
        DataBinding.FieldName = 'R_LIMITE_SUP'
      end
      object dgExplorarDBTableView1R_BASE_MONTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_BASE_MONTO'
      end
      object dgExplorarDBTableView1R_PORCENTAJE: TcxGridDBColumn
        DataBinding.FieldName = 'R_PORCENTAJE'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, CLAVE R_CLAVE, LIMITE_INF R_LIMITE_INF, LIMITE_S' +
        'UP R_LIMITE_SUP, BASE_MONTO R_BASE_MONTO, PORCENTAJE R_PORCENTAJ' +
        'E'
      'FROM TABULADORES'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'TABULADORES.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'TABULADORES.CLAVE'
    end
    object qyExplorarR_LIMITE_INF: TFloatField
      FieldName = 'R_LIMITE_INF'
      Origin = 'TABULADORES.LIMITE_INF'
    end
    object qyExplorarR_LIMITE_SUP: TFloatField
      FieldName = 'R_LIMITE_SUP'
      Origin = 'TABULADORES.LIMITE_SUP'
    end
    object qyExplorarR_BASE_MONTO: TFloatField
      FieldName = 'R_BASE_MONTO'
      Origin = 'TABULADORES.BASE_MONTO'
    end
    object qyExplorarR_PORCENTAJE: TFloatField
      FieldName = 'R_PORCENTAJE'
      Origin = 'TABULADORES.PORCENTAJE'
    end
  end
end
