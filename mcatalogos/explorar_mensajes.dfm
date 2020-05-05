inherited frmExplorar_mensajes: TfrmExplorar_mensajes
  Left = 356
  Top = 85
  Caption = 'Explorar Mensajes'
  ClientHeight = 526
  ClientWidth = 788
  ExplicitWidth = 804
  ExplicitHeight = 565
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 788
    ExplicitWidth = 788
    inherited Panel1: TPanel
      Width = 788
      ExplicitWidth = 788
    end
  end
  inherited Panel2: TPanel
    Top = 504
    Width = 788
    ExplicitTop = 504
    ExplicitWidth = 788
  end
  inherited dgExplorar: TcxGrid
    Width = 788
    Height = 415
    ExplicitWidth = 788
    ExplicitHeight = 415
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_MENSAJE: TcxGridDBColumn
        DataBinding.FieldName = 'R_MENSAJE'
      end
      object dgExplorarDBTableView1R_EXTRA: TcxGridDBColumn
        DataBinding.FieldName = 'R_EXTRA'
      end
      object dgExplorarDBTableView1R_ESPECIFICAR_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESPECIFICAR_FECHA'
      end
      object dgExplorarDBTableView1R_EN_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_EN_FECHA'
      end
      object dgExplorarDBTableView1R_MODULO: TcxGridDBColumn
        DataBinding.FieldName = 'R_MODULO'
      end
      object dgExplorarDBTableView1R_MOMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_MOMENTO'
      end
      object dgExplorarDBTableView1R_PARA: TcxGridDBColumn
        DataBinding.FieldName = 'R_PARA'
      end
      object dgExplorarDBTableView1R_QUIEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_QUIEN'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1nombre: TcxGridDBColumn
        DataBinding.FieldName = 'nombre'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 788
    ExplicitWidth = 788
  end
  inherited dsFuente: TDataSource
    Left = 102
    Top = 384
  end
  inherited qyExplorar: TIBQuery
    OnCalcFields = qyExplorarCalcFields
    SQL.Strings = (
      'SELECT ID R_ID, '
      '       MENSAJE R_MENSAJE, '
      '       EXTRA R_EXTRA,'
      '       ESPECIFICAR_FECHA R_ESPECIFICAR_FECHA,'
      '       EN_FECHA R_EN_FECHA,'
      '       MODULO R_MODULO,'
      '       MOMENTO R_MOMENTO,'
      '       PARA R_PARA,'
      '       QUIEN R_QUIEN,'
      '       ESTATUS R_ESTATUS'
      'FROM MENSAJES'
      'WHERE (PRIVADO = '#39'No'#39')'
      'AND (ID = 0)')
    Left = 133
    Top = 384
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'MENSAJES.ID'
      Required = True
    end
    object qyExplorarR_MENSAJE: TBlobField
      FieldName = 'R_MENSAJE'
      Origin = 'MENSAJES.MENSAJE'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qyExplorarR_EXTRA: TBlobField
      FieldName = 'R_EXTRA'
      Origin = 'MENSAJES.EXTRA'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object qyExplorarR_ESPECIFICAR_FECHA: TIBStringField
      FieldName = 'R_ESPECIFICAR_FECHA'
      Origin = 'MENSAJES.ESPECIFICAR_FECHA'
      FixedChar = True
      Size = 2
    end
    object qyExplorarR_EN_FECHA: TDateTimeField
      FieldName = 'R_EN_FECHA'
      Origin = 'MENSAJES.EN_FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_MODULO: TIBStringField
      FieldName = 'R_MODULO'
      Origin = 'MENSAJES.MODULO'
      Size = 50
    end
    object qyExplorarR_MOMENTO: TIBStringField
      FieldName = 'R_MOMENTO'
      Origin = 'MENSAJES.MOMENTO'
      Size = 50
    end
    object qyExplorarR_PARA: TIBStringField
      FieldName = 'R_PARA'
      Origin = 'MENSAJES.PARA'
    end
    object qyExplorarR_QUIEN: TIntegerField
      FieldName = 'R_QUIEN'
      Origin = 'MENSAJES.QUIEN'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'MENSAJES.ESTATUS'
    end
    object qyExplorarnombre: TStringField
      FieldKind = fkCalculated
      FieldName = 'nombre'
      Size = 150
      Calculated = True
    end
  end
  inherited qyBotones: TIBQuery
    Left = 133
    Top = 352
  end
  inherited ppImprimir: TPopupMenu
    Left = 644
    Top = 23
  end
  inherited ppExpDias: TPopupMenu
    Left = 676
    Top = 23
  end
end
