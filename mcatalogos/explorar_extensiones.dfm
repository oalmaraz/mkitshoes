inherited frmExplorar_extensiones: TfrmExplorar_extensiones
  Left = 395
  Top = 179
  Caption = 'Explorar Extensiones'
  ClientHeight = 356
  ClientWidth = 674
  ExplicitWidth = 690
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 674
    ExplicitWidth = 674
    inherited Panel1: TPanel
      Width = 674
      ExplicitWidth = 674
    end
  end
  inherited Panel2: TPanel
    Top = 334
    Width = 674
    ExplicitTop = 334
    ExplicitWidth = 674
  end
  inherited dgExplorar: TcxGrid
    Width = 674
    Height = 245
    ExplicitWidth = 674
    ExplicitHeight = 245
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn
        DataBinding.FieldName = 'R_EXTENSION'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_E_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_E_CLAVE'
      end
      object dgExplorarDBTableView1R_E_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_E_NOMBRE'
      end
      object dgExplorarDBTableView1R_E_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_E_ESTATUS'
      end
      object dgExplorarDBTableView1R_C_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_CLAVE'
      end
      object dgExplorarDBTableView1R_C_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_C_NOMBRE'
      end
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 674
    ExplicitWidth = 674
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT CE.ID R_EXTENSION, CE.SUJETO_CLIENTE R_ID, CE.FECHA_ALTA ' +
        'R_FECHA_ALTA, CE.CLAVE R_E_CLAVE, CE.NOMBRE R_E_NOMBRE, CE.ESTAT' +
        'US R_E_ESTATUS,'
      '       S.CLAVE R_C_CLAVE, S.NOMBRE R_C_NOMBRE'
      
        'FROM (CLIENTES_EXTENSIONES CE LEFT JOIN SUJETOS_CLIENTES SC ON C' +
        'E.SUJETO_CLIENTE = SC.ID)'
      '     LEFT JOIN SUJETOS S ON SC.SUJETO = S.ID'
      'WHERE CE.ID = 0')
    object qyExplorarR_EXTENSION: TIntegerField
      FieldName = 'R_EXTENSION'
      Origin = 'CLIENTES_EXTENSIONES.ID'
      Required = True
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      Origin = 'CLIENTES_EXTENSIONES.FECHA_ALTA'
    end
    object qyExplorarR_E_CLAVE: TIBStringField
      FieldName = 'R_E_CLAVE'
      Origin = 'CLIENTES_EXTENSIONES.CLAVE'
    end
    object qyExplorarR_E_NOMBRE: TIBStringField
      FieldName = 'R_E_NOMBRE'
      Origin = 'CLIENTES_EXTENSIONES.NOMBRE'
      Size = 100
    end
    object qyExplorarR_E_ESTATUS: TIBStringField
      FieldName = 'R_E_ESTATUS'
      Origin = 'CLIENTES_EXTENSIONES.ESTATUS'
    end
    object qyExplorarR_C_CLAVE: TIBStringField
      FieldName = 'R_C_CLAVE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_C_NOMBRE: TIBStringField
      FieldName = 'R_C_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'CLIENTES_EXTENSIONES.SUJETO_CLIENTE'
      Required = True
    end
  end
end
