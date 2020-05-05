inherited frmCapturar_departamentos: TfrmCapturar_departamentos
  Left = 270
  Top = 131
  Caption = 'Departamentos'
  ClientHeight = 416
  ClientWidth = 832
  ExplicitWidth = 848
  ExplicitHeight = 455
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 832
    Height = 334
    ExplicitWidth = 832
    ExplicitHeight = 334
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Cla&ve'
      FocusControl = deClave
      Transparent = True
    end
    object Label2: TLabel
      Left = 172
      Top = 8
      Width = 56
      Height = 13
      Caption = 'Descripci'#243'&n'
      FocusControl = deDescripcion
      Transparent = True
    end
    object deClave: TDBEdit
      Left = 13
      Top = 24
      Width = 153
      Height = 21
      DataField = 'CLAVE'
      DataSource = dsFuente
      TabOrder = 0
    end
    object deDescripcion: TDBEdit
      Left = 172
      Top = 24
      Width = 433
      Height = 21
      DataField = 'DESCRIPCION'
      DataSource = dsFuente
      TabOrder = 1
    end
  end
  inherited fpPadre: TPanel
    Width = 832
    ExplicitWidth = 832
    inherited Panel1: TPanel
      Width = 832
      ExplicitWidth = 832
    end
  end
  inherited Panel2: TPanel
    Top = 394
    Width = 832
    ExplicitTop = 394
    ExplicitWidth = 832
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_departamentos.dsFuente
    TableName = 'DEPARTAMENTOS'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarCLAVE: TIBStringField [1]
      FieldName = 'CLAVE'
    end
    object TCapturarDESCRIPCION: TIBStringField [2]
      FieldName = 'DESCRIPCION'
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
        Value = 'DEPARTAMENTOS'
      end>
  end
end
