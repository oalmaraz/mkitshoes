inherited frmCapturar_tipos_de_salida: TfrmCapturar_tipos_de_salida
  Left = 235
  Top = 218
  Caption = 'Tipos de Salida'
  ClientHeight = 438
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 477
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 771
    Height = 356
    ExplicitWidth = 124
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Descripcio&n'
    end
    object deDescripcion: TDBEdit
      Left = 8
      Top = 24
      Width = 409
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsFuente
      TabOrder = 0
    end
    object cbGenerar: TDBEdit
      Left = 422
      Top = 24
      Width = 129
      Height = 21
      DataField = 'NCARGO_CXP'
      DataSource = dsFuente
      TabOrder = 1
    end
  end
  inherited fpPadre: TPanel
    Width = 771
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 771
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 416
    Width = 771
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_tipos_de_salida.dsFuente
    TableName = 'TIPOS_DE_SALIDA'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarDESCRIPCION: TIBStringField [1]
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object TCapturarNCARGO_CXP: TIBStringField [2]
      FieldName = 'NCARGO_CXP'
      Size = 2
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
        Value = 'TIPO_SALIDA'
      end>
  end
end
