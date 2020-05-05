inherited frmCapturar_promociones: TfrmCapturar_promociones
  Left = 227
  Top = 93
  Caption = 'Promociones'
  ClientWidth = 767
  ExplicitWidth = 783
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 767
    ExplicitWidth = 124
    object Label1: TLabel
      Left = 13
      Top = 8
      Width = 27
      Height = 13
      Caption = 'Cla&ve'
      FocusControl = deClave
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
  end
  inherited fpPadre: TPanel
    Width = 767
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 767
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Width = 767
    ExplicitTop = -22
    ExplicitWidth = 124
  end
  inherited TCapturar: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    IndexFieldNames = 'ID'
    MasterFields = 'R_ID'
    MasterSource = frmExplorar_promociones.dsFuente
    TableName = 'PROMOCIONES'
    object TCapturarID: TIntegerField [0]
      FieldName = 'ID'
      Required = True
    end
    object TCapturarCLAVE: TIBStringField [1]
      FieldName = 'CLAVE'
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
        Value = 'PROMOCIONES'
      end>
  end
end
