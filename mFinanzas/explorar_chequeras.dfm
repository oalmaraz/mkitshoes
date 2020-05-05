inherited frmExplorar_chequeras: TfrmExplorar_chequeras
  Left = 359
  Top = 373
  ActiveControl = nil
  Caption = 'Explorar Chequeras'
  ClientHeight = 373
  ClientWidth = 659
  ExplicitWidth = 675
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 659
    ExplicitWidth = 659
    inherited Panel1: TPanel
      Width = 659
      ExplicitWidth = 659
    end
  end
  inherited Panel2: TPanel
    Top = 351
    Width = 659
    ExplicitTop = 351
    ExplicitWidth = 659
  end
  inherited dgExplorar: TcxGrid
    Width = 659
    Height = 262
    ExplicitWidth = 659
    ExplicitHeight = 262
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_CUENTA: TcxGridDBColumn
        DataBinding.FieldName = 'R_CUENTA'
      end
      object dgExplorarDBTableView1R_SUCURSAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_SUCURSAL'
      end
      object dgExplorarDBTableView1R_BANCO_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_BANCO_NOMBRE'
      end
      object dgExplorarDBTableView1R_SALDO: TcxGridDBColumn
        DataBinding.FieldName = 'R_SALDO'
      end
      object dgExplorarDBTableView1R_F_ULT_CHEQUE_I: TcxGridDBColumn
        DataBinding.FieldName = 'R_F_ULT_CHEQUE_I'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 659
    ExplicitWidth = 659
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT C.ID R_ID, SB.CUENTA R_CUENTA, SB.SUCURSAL R_SUCURSAL, S.' +
        'NOMBRE R_BANCO_NOMBRE, C.SALDO R_SALDO,'
      '       C.FECHA_ULT_CHEQUE_IMP R_F_ULT_CHEQUE_I'
      
        'FROM (CHEQUERAS C LEFT JOIN SUJETOS_BANCOS SB ON C.BANCO = SB.ID' +
        ')'
      '     LEFT JOIN SUJETOS S ON SB.SUJETO = S.ID'
      'WHERE C.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'CHEQUERAS.ID'
      Required = True
    end
    object qyExplorarR_CUENTA: TIBStringField
      FieldName = 'R_CUENTA'
      Origin = 'SUJETOS_BANCOS.CUENTA'
      Size = 50
    end
    object qyExplorarR_SUCURSAL: TIBStringField
      FieldName = 'R_SUCURSAL'
      Origin = 'SUJETOS_BANCOS.SUCURSAL'
      Size = 50
    end
    object qyExplorarR_BANCO_NOMBRE: TIBStringField
      FieldName = 'R_BANCO_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_SALDO: TFloatField
      FieldName = 'R_SALDO'
      Origin = 'CHEQUERAS.SALDO'
    end
    object qyExplorarR_F_ULT_CHEQUE_I: TDateTimeField
      FieldName = 'R_F_ULT_CHEQUE_I'
      Origin = 'CHEQUERAS.FECHA_ULT_CHEQUE_IMP'
    end
  end
end
