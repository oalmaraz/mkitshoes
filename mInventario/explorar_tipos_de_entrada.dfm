inherited frmExplorar_tipos_de_entrada: TfrmExplorar_tipos_de_entrada
  Left = 214
  Top = 206
  ActiveControl = nil
  Caption = 'Explorar Tipos de Entrada'
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
      object dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_NCREDITO: TcxGridDBColumn
        DataBinding.FieldName = 'R_NCREDITO'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
    inherited laCampo: TLabel
      Width = 112
      Caption = 'Descripcion'
      ExplicitWidth = 112
    end
    inherited edExplorarValor: TEdit
      Left = 137
      Width = 152
      ExplicitLeft = 137
      ExplicitWidth = 152
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT ID R_ID, DESCRIPCION R_DESCRIPCION, NCREDITO R_NCREDITO'
      'FROM TIPOS_DE_ENTRADA'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'TIPOS_DE_ENTRADA.ID'
      Required = True
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'TIPOS_DE_ENTRADA.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_NCREDITO: TIBStringField
      FieldName = 'R_NCREDITO'
      Origin = 'TIPOS_DE_ENTRADA.NCREDITO'
      FixedChar = True
      Size = 2
    end
  end
end
