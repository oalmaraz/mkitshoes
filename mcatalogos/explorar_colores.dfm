inherited frmExplorar_Colores: TfrmExplorar_Colores
  Left = 354
  Top = 392
  ActiveControl = nil
  Caption = 'Explorar Colores'
  ClientHeight = 410
  ClientWidth = 702
  ExplicitWidth = 718
  ExplicitHeight = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited Panel1: TPanel
      Width = 702
      ExplicitWidth = 702
    end
  end
  inherited Panel2: TPanel
    Top = 388
    Width = 702
    ExplicitTop = 388
    ExplicitWidth = 702
  end
  inherited dgExplorar: TcxGrid
    Width = 702
    Height = 299
    ExplicitWidth = 702
    ExplicitHeight = 299
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1R_ORDEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_ORDEN'
      end
      object dgExplorarDBTableView1R_MOSTRAR: TcxGridDBColumn
        DataBinding.FieldName = 'R_MOSTRAR'
      end
      object dgExplorarDBTableView1R_PROCESOS: TcxGridDBColumn
        DataBinding.FieldName = 'R_PROCESOS'
      end
      object dgExplorarDBTableView1R_PIGMENTOS: TcxGridDBColumn
        DataBinding.FieldName = 'R_PIGMENTOS'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 702
    ExplicitWidth = 702
    inherited laCampo: TLabel
      Width = 73
      Caption = 'Nombre'
      ExplicitWidth = 73
    end
    inherited edExplorarValor: TEdit
      Left = 101
      Width = 132
      ExplicitLeft = 101
      ExplicitWidth = 132
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT ID R_ID, NOMBRE R_NOMBRE, ORDEN R_ORDEN, MOSTRAR_POS R_MO' +
        'STRAR, PROCESOS R_PROCESOS, PIGMENTOS R_PIGMENTOS'
      'FROM COLORES'
      'WHERE ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'COLORES.ID'
      Required = True
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'COLORES.NOMBRE'
      Size = 50
    end
    object qyExplorarR_ORDEN: TIntegerField
      FieldName = 'R_ORDEN'
      Origin = 'COLORES.ORDEN'
    end
    object qyExplorarR_MOSTRAR: TIBStringField
      FieldName = 'R_MOSTRAR'
      Origin = 'COLORES.MOSTRAR_POS'
      FixedChar = True
      Size = 2
    end
    object qyExplorarR_PROCESOS: TIBStringField
      FieldName = 'R_PROCESOS'
      Origin = 'COLORES.PROCESOS'
      FixedChar = True
      Size = 2
    end
    object qyExplorarR_PIGMENTOS: TIBStringField
      FieldName = 'R_PIGMENTOS'
      Origin = 'COLORES.PIGMENTOS'
      FixedChar = True
      Size = 2
    end
  end
end
