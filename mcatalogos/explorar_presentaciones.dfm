inherited frmExplorar_presentaciones: TfrmExplorar_presentaciones
  Caption = 'Explorar Presentaciones'
  ClientHeight = 563
  ClientWidth = 880
  ExplicitWidth = 896
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 880
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 880
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 541
    Width = 880
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited dgExplorar: TcxGrid
    Width = 880
    Height = 452
    ExplicitWidth = 124
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
    Width = 880
    ExplicitWidth = 124
    inherited laCampo: TLabel
      Width = 112
      Caption = 'Descripcion'
      ExplicitWidth = 112
    end
    inherited edExplorarValor: TEdit
      Left = 138
      ExplicitLeft = 138
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT P.ID R_ID, P.DESCRIPCION R_DESCRIPCION'
      'FROM PRESENTACIONES P'
      'WHERE P.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'PRESENTACIONES.ID'
      Required = True
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'PRESENTACIONES.DESCRIPCION'
      Size = 50
    end
  end
end
