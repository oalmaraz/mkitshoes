inherited frmCapturar_clasificaciones: TfrmCapturar_clasificaciones
  Left = 676
  Top = 252
  Caption = 'Clasificaciones'
  ClientHeight = 461
  ClientWidth = 810
  ExplicitWidth = 826
  ExplicitHeight = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 810
    Height = 379
    ExplicitWidth = 124
    object Label12: TLabel
      Left = 8
      Top = 7
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'n'
      Transparent = True
    end
    object deDescripcion: TDBEdit
      Left = 8
      Top = 23
      Width = 361
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsFuente
      TabOrder = 0
    end
  end
  inherited fpPadre: TPanel
    Width = 810
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 810
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 439
    Width = 810
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_clasificaciones.dsFuente
    TableName = 'CLASIFICACIONES'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarDESCRIPCION: TIBStringField [1]
      FieldName = 'DESCRIPCION'
      Size = 50
    end
  end
  inherited spID: TIBStoredProc
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_ID'
        ParamType = ptOutput
      end
      item
        DataType = ftString
        Name = 'P_QUIEN'
        ParamType = ptInput
        Value = 'CLASIFICACIONES'
      end>
  end
end
