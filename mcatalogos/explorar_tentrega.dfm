inherited frmExplorar_tentrega: TfrmExplorar_tentrega
  Left = 344
  Top = 50
  Caption = 'Explorar Tiempos de Entrega'
  ClientHeight = 347
  ClientWidth = 688
  ExplicitWidth = 704
  ExplicitHeight = 386
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 688
    ExplicitWidth = 688
    inherited Panel1: TPanel
      Width = 688
      ExplicitWidth = 688
    end
  end
  inherited Panel2: TPanel
    Top = 325
    Width = 688
    ExplicitTop = 325
    ExplicitWidth = 688
  end
  inherited dgExplorar: TcxGrid
    Width = 688
    Height = 236
    ExplicitWidth = 688
    ExplicitHeight = 236
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_DESCRIPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_DESCRIPCION'
      end
      object dgExplorarDBTableView1R_PESO: TcxGridDBColumn
        DataBinding.FieldName = 'R_PESO'
      end
      object dgExplorarDBTableView1R_TARIFA: TcxGridDBColumn
        DataBinding.FieldName = 'R_TARIFA'
      end
      object dgExplorarDBTableView1R_UNIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_UNIDAD'
      end
      object dgExplorarDBTableView1R_MONEDA: TcxGridDBColumn
        DataBinding.FieldName = 'R_MONEDA'
      end
      object dgExplorarDBTableView1R_TRANSPORTISTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_TRANSPORTISTA'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 688
    ExplicitWidth = 688
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT E.ID R_ID, E.DESCRIPCION R_DESCRIPCION, E.PESO R_PESO, E.' +
        'TARIFA R_TARIFA,'
      '       U.CLAVE R_UNIDAD,'
      '       M.CLAVE R_MONEDA,'
      '       S.NOMBRE R_TRANSPORTISTA'
      'FROM TIEMPOS_DE_ENTREGA E LEFT JOIN MONEDAS M ON E.MONEDA = M.ID'
      
        '                          LEFT JOIN UNIDADES U ON E.UNIDAD = U.I' +
        'D'
      
        '                          LEFT JOIN SUJETOS_TRANSPORTISTAS T ON ' +
        'E.TRANSPORTISTA = T.ID'
      '                          LEFT JOIN SUJETOS S ON T.SUJETO = S.ID'
      'WHERE (E.ID  > 0)')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'TIEMPOS_DE_ENTREGA.ID'
      Required = True
    end
    object qyExplorarR_DESCRIPCION: TIBStringField
      FieldName = 'R_DESCRIPCION'
      Origin = 'TIEMPOS_DE_ENTREGA.DESCRIPCION'
      Size = 50
    end
    object qyExplorarR_PESO: TFloatField
      FieldName = 'R_PESO'
      Origin = 'TIEMPOS_DE_ENTREGA.PESO'
    end
    object qyExplorarR_TARIFA: TFloatField
      FieldName = 'R_TARIFA'
      Origin = 'TIEMPOS_DE_ENTREGA.TARIFA'
    end
    object qyExplorarR_UNIDAD: TIBStringField
      FieldName = 'R_UNIDAD'
      Origin = 'UNIDADES.CLAVE'
      Size = 10
    end
    object qyExplorarR_MONEDA: TIBStringField
      FieldName = 'R_MONEDA'
      Origin = 'MONEDAS.CLAVE'
      Size = 10
    end
    object qyExplorarR_TRANSPORTISTA: TIBStringField
      FieldName = 'R_TRANSPORTISTA'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
  end
end
