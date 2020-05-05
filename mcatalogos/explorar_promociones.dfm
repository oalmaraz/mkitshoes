inherited frmExplorar_promociones: TfrmExplorar_promociones
  Left = 214
  Top = 206
  Caption = 'Explorar Promociones'
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
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
  end
  inherited qyExplorar: TIBQuery
    Active = True
    SQL.Strings = (
      'SELECT ID R_ID, CLAVE R_CLAVE'
      'FROM PROMOCIONES'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'PROMOCIONES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'PROMOCIONES.CLAVE'
    end
  end
end
