inherited frmCapturar_tipos_de_entrada: TfrmCapturar_tipos_de_entrada
  Left = 309
  Top = 66
  Caption = 'Tipos de Entrada'
  ClientHeight = 439
  ClientWidth = 766
  ExplicitWidth = 782
  ExplicitHeight = 478
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 766
    Height = 357
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
      Width = 105
      Height = 21
      DataField = 'NCREDITO'
      DataSource = dsFuente
      TabOrder = 1
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
    Top = 417
    Width = 766
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_tipos_de_entrada.dsFuente
    TableName = 'TIPOS_DE_ENTRADA'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarDESCRIPCION: TIBStringField [1]
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object TCapturarNCREDITO: TIBStringField [2]
      FieldName = 'NCREDITO'
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
        Value = 'TIPO_ENTRADA'
      end>
  end
end
