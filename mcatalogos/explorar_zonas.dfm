inherited frmExplorar_zonas: TfrmExplorar_zonas
  Left = 359
  Top = 129
  Caption = 'Explorar Zonas'
  ClientHeight = 351
  ClientWidth = 742
  ExplicitWidth = 758
  ExplicitHeight = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 742
    ExplicitWidth = 742
    inherited Panel1: TPanel
      Width = 742
      ExplicitWidth = 742
    end
  end
  inherited Panel2: TPanel
    Top = 329
    Width = 742
    ExplicitTop = 329
    ExplicitWidth = 742
  end
  inherited dgExplorar: TcxGrid
    Width = 742
    Height = 240
    ExplicitWidth = 742
    ExplicitHeight = 240
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCRIPCION'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 742
    ExplicitWidth = 742
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT ID R_ID, DESCRIPCION R_DESCRIPCION'
      'FROM ZONAS'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'ZONAS.ID'
      Required = True
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'ZONAS.DESCRIPCION'
      Size = 50
    end
  end
end
