inherited frmExplorar_prepolizas: TfrmExplorar_prepolizas
  Left = 323
  Top = 443
  Caption = 'Explorar Prepolizas'
  ClientHeight = 459
  ClientWidth = 719
  ExplicitWidth = 735
  ExplicitHeight = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 719
    ExplicitWidth = 719
    inherited Panel1: TPanel
      Width = 719
      ExplicitWidth = 719
    end
  end
  inherited Panel2: TPanel
    Top = 437
    Width = 719
    ExplicitTop = 437
    ExplicitWidth = 719
  end
  inherited dgExplorar: TcxGrid
    Width = 719
    Height = 348
    ExplicitWidth = 719
    ExplicitHeight = 348
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
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 719
    ExplicitWidth = 719
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT P.ID R_ID, P.CLAVE R_CLAVE, P.DESCRIPCION R_DESCRIPCION, ' +
        'P.ESTATUS R_ESTATUS'
      'FROM PREPOLIZAS P'
      'WHERE P.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'PREPOLIZAS.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'PREPOLIZAS.CLAVE'
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'PREPOLIZAS.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'PREPOLIZAS.ESTATUS'
    end
  end
end
