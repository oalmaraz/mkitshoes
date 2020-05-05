inherited frmExplorar_tipos_de_salida: TfrmExplorar_tipos_de_salida
  Left = 214
  Top = 206
  ActiveControl = nil
  Caption = 'Explorar Tipos de Salida'
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
      object dgExplorarDBTableView1R_NCARGO_CXP: TcxGridDBColumn
        DataBinding.FieldName = 'R_NCARGO_CXP'
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
      Left = 139
      Width = 161
      ExplicitLeft = 139
      ExplicitWidth = 161
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, DESCRIPCION R_DESCRIPCION, NCARGO_CXP R_NCARGO_C' +
        'XP'
      'FROM TIPOS_DE_SALIDA'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'TIPOS_DE_SALIDA.ID'
      Required = True
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'TIPOS_DE_SALIDA.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_NCARGO_CXP: TIBStringField
      FieldName = 'R_NCARGO_CXP'
      Origin = 'TIPOS_DE_SALIDA.NCARGO_CXP'
      FixedChar = True
      Size = 2
    end
  end
end
