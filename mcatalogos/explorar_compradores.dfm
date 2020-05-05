inherited frmExplorar_compradores: TfrmExplorar_compradores
  Left = 455
  Top = 298
  Caption = 'Explorar Compradores'
  ClientHeight = 418
  ClientWidth = 662
  ExplicitWidth = 678
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 662
    ExplicitWidth = 662
    inherited Panel1: TPanel
      Width = 662
      ExplicitWidth = 662
    end
  end
  inherited Panel2: TPanel
    Top = 396
    Width = 662
    ExplicitTop = 396
    ExplicitWidth = 662
  end
  inherited dgExplorar: TcxGrid
    Width = 662
    Height = 307
    ExplicitWidth = 662
    ExplicitHeight = 307
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1R_CLASIFICACION: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLASIFICACION'
      end
      object dgExplorarDBTableView1R_TABULADOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_TABULADOR'
      end
      object dgExplorarDBTableView1R_DEPARTAMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_DEPARTAMENTO'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 662
    ExplicitWidth = 662
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT SC.ID R_ID, S.CLAVE R_CLAVE, S.NOMBRE R_NOMBRE, C.DESCRIP' +
        'CION R_CLASIFICACION, T.CLAVE R_TABULADOR, D.CLAVE R_DEPARTAMENT' +
        'O,'
      '       S.FECHA_ALTA R_FECHA_ALTA'
      
        'FROM (SUJETOS_COMPRADORES SC LEFT JOIN SUJETOS S ON SC.SUJETO = ' +
        'S.ID)'
      '     LEFT JOIN CLASIFICACIONES C ON SC.CLASIFICACION = C.ID'
      '     LEFT JOIN TABULADORES T ON SC.TABULADOR = T.ID'
      '     LEFT JOIN DEPARTAMENTOS D ON SC.DEPARTAMENTO = D.ID'
      'WHERE SC.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'SUJETOS_COMPRADORES.ID'
      Required = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldName = 'R_CLAVE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_CLASIFICACION: TIBStringField
      FieldName = 'R_CLASIFICACION'
      Origin = 'CLASIFICACIONES.DESCRIPCION'
      Size = 50
    end
    object qyExplorarR_TABULADOR: TIBStringField
      FieldName = 'R_TABULADOR'
      Origin = 'TABULADORES.CLAVE'
    end
    object qyExplorarR_DEPARTAMENTO: TIBStringField
      FieldName = 'R_DEPARTAMENTO'
      Origin = 'DEPARTAMENTOS.CLAVE'
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      Origin = 'SUJETOS.FECHA_ALTA'
    end
  end
end
