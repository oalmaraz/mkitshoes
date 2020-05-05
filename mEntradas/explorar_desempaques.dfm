inherited frmExplorar_desempaques: TfrmExplorar_desempaques
  Left = 305
  Top = 365
  Caption = 'Explorar Desempaques'
  ClientHeight = 469
  ClientWidth = 977
  ExplicitWidth = 993
  ExplicitHeight = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 977
    ExplicitWidth = 977
    inherited Panel1: TPanel
      Width = 977
      ExplicitWidth = 977
    end
  end
  inherited Panel2: TPanel
    Top = 447
    Width = 977
    ExplicitTop = 447
    ExplicitWidth = 977
  end
  inherited dgExplorar: TcxGrid
    Width = 977
    Height = 358
    ExplicitWidth = 977
    ExplicitHeight = 358
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_ORDEN_COMPRA: TcxGridDBColumn
        DataBinding.FieldName = 'R_ORDEN_COMPRA'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_FECHA_RECEPCION: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_RECEPCION'
      end
      object dgExplorarDBTableView1R_CONDUCTOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONDUCTOR'
      end
      object dgExplorarDBTableView1R_PLACAS: TcxGridDBColumn
        DataBinding.FieldName = 'R_PLACAS'
      end
      object dgExplorarDBTableView1R_FACTURA_PROVEEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_FACTURA_PROVEEDOR'
      end
      object dgExplorarDBTableView1R_ID_OC: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID_OC'
      end
      object dgExplorarDBTableView1R_FOLIO_OC: TcxGridDBColumn
        DataBinding.FieldName = 'R_FOLIO_OC'
      end
      object dgExplorarDBTableView1R_PROVEEDOR_C: TcxGridDBColumn
        DataBinding.FieldName = 'R_PROVEEDOR_C'
      end
      object dgExplorarDBTableView1R_PROVEEDOR_N: TcxGridDBColumn
        DataBinding.FieldName = 'R_PROVEEDOR_N'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
      object dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CONSECUTIVO'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 977
    ExplicitWidth = 977
    inherited laCampo: TLabel
      Width = 88
      Caption = 'R_CLAVE'
      ExplicitWidth = 88
    end
    inherited edExplorarValor: TEdit
      Left = 118
      ExplicitLeft = 118
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT D.ID R_ID, D.ORDEN_COMPRA R_ORDEN_COMPRA, OC.CLAVE R_CLAV' +
        'E, D.FECHA_RECEPCION R_FECHA_RECEPCION, D.FACTURA_PROVEEDOR R_FA' +
        'CTURA_PROVEEDOR, D.CONDUCTOR R_CONDUCTOR, D.PLACAS R_PLACAS, OC.' +
        'ID R_ID_OC, OC.CONSECUTIVO R_FOLIO_OC,'
      'S.CLAVE R_PROVEEDOR_C, S.NOMBRE R_PROVEEDOR_N,'
      'D.ESTATUS R_ESTATUS,'
      'D.CONSECUTIVO R_CONSECUTIVO'
      
        'FROM DESEMPAQUES D, ORDENES_DE_COMPRAS OC, SUJETOS_PROVEEDORES P' +
        ', SUJETOS S'
      
        'WHERE (D.ORDEN_COMPRA = OC.ID) AND (OC.PROVEEDOR = P.ID) AND (P.' +
        'SUJETO = S.ID) '
      'AND D.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_ORDEN_COMPRA: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ORDEN_COMPRA'
      ReadOnly = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_FECHA_RECEPCION: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_RECEPCION'
      ReadOnly = True
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qyExplorarR_CONDUCTOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CONDUCTOR'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_PLACAS: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_PLACAS'
      ReadOnly = True
      Size = 10
    end
    object qyExplorarR_FACTURA_PROVEEDOR: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_FACTURA_PROVEEDOR'
      ReadOnly = True
      Size = 10
    end
    object qyExplorarR_ID_OC: TIntegerField
      FieldName = 'R_ID_OC'
      Origin = 'ORDENES_DE_COMPRAS.ID'
      DisplayFormat = '###,###,##0'
    end
    object qyExplorarR_FOLIO_OC: TIntegerField
      FieldName = 'R_FOLIO_OC'
      Origin = 'ORDENES_DE_COMPRAS.CONSECUTIVO'
      DisplayFormat = '###,###,##0'
    end
    object qyExplorarR_PROVEEDOR_C: TIBStringField
      FieldName = 'R_PROVEEDOR_C'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_PROVEEDOR_N: TIBStringField
      FieldName = 'R_PROVEEDOR_N'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'DESEMPAQUES.ESTATUS'
    end
    object qyExplorarR_CONSECUTIVO: TIntegerField
      FieldName = 'R_CONSECUTIVO'
      Origin = 'DESEMPAQUES.CONSECUTIVO'
    end
  end
end
