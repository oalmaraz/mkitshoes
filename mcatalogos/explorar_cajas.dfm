inherited frmExplorar_cajas: TfrmExplorar_cajas
  Left = 378
  Top = 143
  Caption = 'Explorar Cajas'
  ClientHeight = 373
  ClientWidth = 623
  ExplicitWidth = 639
  ExplicitHeight = 412
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 623
    ExplicitWidth = 623
    inherited Panel1: TPanel
      Width = 623
      ExplicitWidth = 623
    end
    inherited ibPantalla: TBitBtn
      Left = 244
      Top = 25
      ExplicitLeft = 244
      ExplicitTop = 25
    end
  end
  inherited Panel2: TPanel
    Top = 351
    Width = 623
    ExplicitTop = 351
    ExplicitWidth = 623
  end
  inherited dgExplorar: TcxGrid
    Width = 623
    Height = 262
    ExplicitWidth = 623
    ExplicitHeight = 262
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1R_CLAVE_ALMACEN: TcxGridDBColumn
        DataBinding.FieldName = 'R_CLAVE_ALMACEN'
      end
      object dgExplorarDBTableView1R_NOMBRE_USUARIO: TcxGridDBColumn
        DataBinding.FieldName = 'R_NOMBRE_USUARIO'
      end
      object dgExplorarDBTableView1R_TIPO_DE_CAJA: TcxGridDBColumn
        DataBinding.FieldName = 'R_TIPO_DE_CAJA'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 623
    ExplicitWidth = 623
    inherited laCampo: TLabel
      Width = 119
      Caption = 'Nombre Caja'
      ExplicitWidth = 119
    end
    inherited edExplorarValor: TEdit
      Left = 140
      Width = 143
      ExplicitLeft = 140
      ExplicitWidth = 143
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT C.ID R_ID, C.NOMBRE R_NOMBRE, A.CLAVE R_CLAVE_ALMACEN, S.' +
        'NOMBRE R_NOMBRE_USUARIO, C.TIPO_DE_CAJA R_TIPO_DE_CAJA, C.ESTATU' +
        'S R_ESTATUS'
      'FROM (CAJAS C LEFT JOIN ALMACENES A ON C.ALMACEN = A.ID)'
      '     LEFT JOIN SUJETOS_USUARIOS SU ON C.USUARIO = SU.ID'
      '     LEFT JOIN SUJETOS S ON SU.SUJETO = S.ID'
      'WHERE C.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'CAJAS.ID'
      Required = True
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'CAJAS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_CLAVE_ALMACEN: TIBStringField
      FieldName = 'R_CLAVE_ALMACEN'
      Origin = 'ALMACENES.CLAVE'
    end
    object qyExplorarR_NOMBRE_USUARIO: TIBStringField
      FieldName = 'R_NOMBRE_USUARIO'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_TIPO_DE_CAJA: TIBStringField
      FieldName = 'R_TIPO_DE_CAJA'
      Origin = 'CAJAS.TIPO_DE_CAJA'
      Size = 11
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'CAJAS.ESTATUS'
    end
  end
end
