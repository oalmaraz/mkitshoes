inherited frmCapturar_tipo_de_ctas: TfrmCapturar_tipo_de_ctas
  Left = 236
  Top = 91
  Caption = 'Tipo de Cuentas'
  ClientWidth = 766
  ExplicitWidth = 782
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 766
    ExplicitWidth = 124
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 37
      Height = 13
      Caption = '&Nombre'
      FocusControl = deNombre
    end
    object deNombre: TDBEdit
      Left = 12
      Top = 32
      Width = 337
      Height = 21
      DataField = 'NOMBRE'
      DataSource = dsFuente
      TabOrder = 0
    end
  end
  inherited fpPadre: TPanel
    Width = 766
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 766
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Width = 766
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
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY11'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end>
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_tipo_de_ctas.dsFuente
    StoreDefs = True
    TableName = 'TIPO_DE_CUENTAS'
    object TCapturarID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TCapturarNOMBRE: TIBStringField
      FieldName = 'NOMBRE'
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
        Value = 'TIPO_DE_CTAS'
      end>
  end
end
