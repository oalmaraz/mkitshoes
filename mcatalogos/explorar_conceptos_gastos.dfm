inherited frmExplorar_Conceptos_Gastos: TfrmExplorar_Conceptos_Gastos
  Left = 466
  Top = 293
  Caption = 'Explorar Conceptos Gastos'
  ClientHeight = 428
  ClientWidth = 783
  ExplicitWidth = 799
  ExplicitHeight = 467
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 783
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 783
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 406
    Width = 783
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited dgExplorar: TcxGrid
    Width = 783
    Height = 317
    ExplicitWidth = 124
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CONCEPTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONCEPTO'
      end
      object dgExplorarDBTableView1R_PORC: TcxGridDBColumn
        DataBinding.FieldName = 'R_PORC'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 783
    ExplicitWidth = 124
    inherited laCampo: TLabel
      Width = 90
      Caption = 'Concepto'
      ExplicitWidth = 90
    end
    inherited edExplorarValor: TEdit
      Left = 113
      ExplicitLeft = 113
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT ID R_ID, CONCEPTO R_CONCEPTO, PORC R_PORC'
      'FROM CONCEPTOS_GASTOS'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'CONCEPTOS_GASTOS.ID'
      Required = True
    end
    object qyExplorarR_CONCEPTO: TIBStringField
      FieldName = 'R_CONCEPTO'
      Origin = 'CONCEPTOS_GASTOS.CONCEPTO'
      Size = 100
    end
    object qyExplorarR_PORC: TFloatField
      FieldName = 'R_PORC'
      Origin = 'CONCEPTOS_GASTOS.PORC'
      DisplayFormat = '##0.## %'
    end
  end
end
