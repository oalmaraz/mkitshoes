inherited frmExplorar_requisiciones: TfrmExplorar_requisiciones
  Left = 163
  Top = 339
  Caption = 'Explorar requisiciones'
  ClientHeight = 362
  ClientWidth = 619
  ExplicitWidth = 635
  ExplicitHeight = 401
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 619
    ExplicitWidth = 619
    inherited Panel1: TPanel
      Width = 619
      ExplicitWidth = 619
    end
  end
  inherited Panel2: TPanel
    Top = 340
    Width = 619
    ExplicitTop = 340
    ExplicitWidth = 619
  end
  inherited dgExplorar: TcxGrid
    Width = 619
    Height = 251
    ExplicitWidth = 619
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE'
      end
      object dgExplorarDBTableView1R_DEPARTAMENTO: TcxGridDBColumn
        DataBinding.FieldName = 'R_DEPARTAMENTO'
      end
      object dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn
        DataBinding.FieldName = 'R_USUARIO'
      end
      object dgExplorarDBTableView1R_FECHA_ENTREGA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ENTREGA'
      end
      object dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA_ALTA'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT R.ID R_ID, R.CLAVE R_CLAVE, D.DESCRIPCION R_DEPARTAMENTO,' +
        ' S.NOMBRE R_USUARIO, R.FECHA_ENTREGA R_FECHA_ENTREGA,'
      'R.FECHA_ALTA R_FECHA_ALTA,'
      'R.ESTATUS R_ESTATUS'
      
        'FROM (REQUISICIONES R LEFT JOIN DEPARTAMENTOS D ON R.DEPARTAMENT' +
        'O = D.ID)'
      '           LEFT JOIN SUJETOS_USUARIOS SU ON R.USUARIO = SU.ID'
      '           LEFT JOIN SUJETOS S ON SU.SUJETO = S.ID'
      'WHERE R.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldKind = fkInternalCalc
      FieldName = 'R_ID'
      ReadOnly = True
    end
    object qyExplorarR_CLAVE: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_CLAVE'
      ReadOnly = True
    end
    object qyExplorarR_DEPARTAMENTO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_DEPARTAMENTO'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_USUARIO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_USUARIO'
      ReadOnly = True
      Size = 100
    end
    object qyExplorarR_FECHA_ENTREGA: TDateTimeField
      FieldKind = fkInternalCalc
      FieldName = 'R_FECHA_ENTREGA'
      ReadOnly = True
      DisplayFormat = 'dd/mmm/yyyy'
    end
    object qyExplorarR_FECHA_ALTA: TDateTimeField
      FieldName = 'R_FECHA_ALTA'
      Origin = 'REQUISICIONES.FECHA_ALTA'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'REQUISICIONES.ESTATUS'
    end
  end
end
