inherited frmExplorar_pedimento_importacion: TfrmExplorar_pedimento_importacion
  Left = 261
  Top = 262
  Caption = 'Explorar Pedimento Importacion'
  ClientHeight = 390
  ClientWidth = 743
  ExplicitWidth = 759
  ExplicitHeight = 429
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 743
    ExplicitWidth = 712
    inherited Panel1: TPanel
      Width = 743
      ExplicitWidth = 712
    end
  end
  inherited Panel2: TPanel
    Top = 368
    Width = 743
    ExplicitTop = -22
    ExplicitWidth = 712
  end
  inherited dgExplorar: TcxGrid
    Width = 743
    Height = 279
    ExplicitWidth = 712
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_PEDIMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_PEDIMENTO'
      end
      object dgExplorarDBTableView1R_INCREMENTABLES: TcxGridDBColumn
        DataBinding.FieldName = 'R_INCREMENTABLES'
      end
      object dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_TOTAL'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 743
    ExplicitWidth = 712
    inherited laCampo: TLabel
      Width = 99
      Caption = 'Pedimento'
      ExplicitWidth = 99
    end
    inherited edExplorarValor: TEdit
      Left = 128
      ExplicitLeft = 128
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, FECHA R_FECHA, PEDIMENTO R_PEDIMENTO, INCREMENTA' +
        'BLES R_INCREMENTABLES, TOTAL R_TOTAL'
      'FROM PEDIMENTO_IMPORTACION'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Required = True
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_PEDIMENTO: TIBStringField
      FieldName = 'R_PEDIMENTO'
    end
    object qyExplorarR_INCREMENTABLES: TFloatField
      FieldName = 'R_INCREMENTABLES'
      DisplayFormat = '$ ###,###,###,##0.0000'
    end
    object qyExplorarR_TOTAL: TFloatField
      FieldName = 'R_TOTAL'
      DisplayFormat = '$ ###,###,###,##0.0000'
    end
  end
end
