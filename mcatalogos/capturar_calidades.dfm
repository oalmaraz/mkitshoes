inherited frmCapturar_calidades: TfrmCapturar_calidades
  Left = 333
  Top = 162
  Caption = 'Calidades'
  ClientHeight = 392
  ClientWidth = 747
  ExplicitWidth = 763
  ExplicitHeight = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 747
    Height = 310
    ExplicitWidth = 124
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'N&ombre'
      FocusControl = deNombre
      Transparent = True
    end
    object deNombre: TDBEdit
      Left = 8
      Top = 24
      Width = 497
      Height = 21
      DataField = 'NOMBRE'
      DataSource = dsFuente
      TabOrder = 0
    end
  end
  inherited fpPadre: TPanel
    Width = 747
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 747
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 370
    Width = 747
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NOMBRE'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY107'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_Calidades.dsFuente
    StoreDefs = True
    TableName = 'CALIDADES'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarNOMBRE: TIBStringField [1]
      FieldName = 'NOMBRE'
      Size = 100
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
        Value = 'CALIDADES'
      end>
  end
end
