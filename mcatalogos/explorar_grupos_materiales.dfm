inherited frmExplorar_Grupos_Materiales: TfrmExplorar_Grupos_Materiales
  Left = 460
  Top = 512
  ActiveControl = nil
  Caption = 'Explorar Grupos Materiales'
  ClientHeight = 362
  ClientWidth = 656
  ExplicitWidth = 672
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 656
    ExplicitWidth = 656
    inherited Panel1: TPanel
      Width = 656
      ExplicitWidth = 656
    end
  end
  inherited Panel2: TPanel
    Top = 340
    Width = 656
    ExplicitTop = 340
    ExplicitWidth = 656
  end
  inherited dgExplorar: TcxGrid
    Width = 656
    Height = 251
    ExplicitWidth = 656
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 656
    ExplicitWidth = 656
    inherited laCampo: TLabel
      Width = 73
      Caption = 'Nombre'
      ExplicitWidth = 73
    end
    inherited edExplorarValor: TEdit
      Left = 102
      Width = 163
      ExplicitLeft = 102
      ExplicitWidth = 163
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT ID R_ID, NOMBRE R_NOMBRE'
      'FROM GRUPOS_MATERIALES'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_NOMBRE'
      ReadOnly = True
      Size = 50
    end
  end
end
