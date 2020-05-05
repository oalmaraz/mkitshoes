inherited frmExplorar_grupos_colores: TfrmExplorar_grupos_colores
  Left = 304
  Top = 444
  Caption = 'Explorar Grupos Colores'
  ClientHeight = 396
  ClientWidth = 717
  ExplicitWidth = 733
  ExplicitHeight = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 717
    ExplicitWidth = 704
    inherited Panel1: TPanel
      Width = 717
      ExplicitWidth = 704
    end
  end
  inherited Panel2: TPanel
    Top = 374
    Width = 717
    ExplicitTop = -22
    ExplicitWidth = 704
  end
  inherited dgExplorar: TcxGrid
    Width = 717
    Height = 285
    ExplicitWidth = 704
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
    Width = 717
    ExplicitWidth = 704
    inherited laCampo: TLabel
      Width = 73
      Caption = 'Nombre'
      ExplicitWidth = 73
    end
    inherited edExplorarValor: TEdit
      Left = 102
      ExplicitLeft = 102
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT ID R_ID, NOMBRE R_NOMBRE'
      'FROM GRUPO_COLORES'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'GRUPO_COLORES.ID'
      Required = True
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'GRUPO_COLORES.NOMBRE'
      Size = 100
    end
  end
end
