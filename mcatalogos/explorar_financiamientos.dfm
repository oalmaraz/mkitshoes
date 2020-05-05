inherited frmExplorar_financiamientos: TfrmExplorar_financiamientos
  Left = 280
  Top = 456
  Caption = 'Explorar Financiamientos'
  ClientHeight = 362
  ClientWidth = 657
  ExplicitWidth = 673
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 657
    ExplicitWidth = 657
    inherited Panel1: TPanel
      Width = 657
      ExplicitWidth = 657
    end
  end
  inherited Panel2: TPanel
    Top = 340
    Width = 657
    ExplicitTop = 340
    ExplicitWidth = 657
  end
  inherited dgExplorar: TcxGrid
    Width = 657
    Height = 251
    ExplicitWidth = 657
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_PORCENTAJE: TcxGridDBColumn
        DataBinding.FieldName = 'R_PORCENTAJE'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 657
    ExplicitWidth = 657
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, CLAVE R_CLAVE, DESCRIPCION R_DESCRIPCION, PORCEN' +
        'TAJE R_PORCENTAJE'
      'FROM FINANCIAMIENTOS'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_PORCENTAJE: TFloatField
      FieldName = 'R_PORCENTAJE'
      DisplayFormat = '###,##0.00 %'
    end
  end
end
