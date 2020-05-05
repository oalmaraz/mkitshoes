inherited frmExplorar_Usuarios: TfrmExplorar_Usuarios
  Left = 506
  Top = 35
  Caption = 'Explorar Usuarios'
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
    inherited ibVer: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibConstructor: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibImprimir: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibPantalla: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibExportarXLS: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibExportarHTML: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
    end
    inherited ibExportarXML: TBitBtn
      Font.Charset = ANSI_CHARSET
      Font.Name = 'Tahoma'
      ParentFont = False
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
    Font.Charset = ANSI_CHARSET
    Font.Name = 'Tahoma'
    ParentFont = False
    ExplicitWidth = 619
    ExplicitHeight = 251
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        Caption = 'ID'
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'CLAVE'
        Width = 150
      end
      object dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn
        Caption = 'USUARIO'
        DataBinding.FieldName = 'R_USUARIO'
      end
      object dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn
        Caption = 'NOMBRE'
        DataBinding.FieldName = 'R_NOMBRE'
      end
      object dgExplorarDBTableView1TEL_PRINCIPAL: TcxGridDBColumn
        DataBinding.FieldName = 'TEL_PRINCIPAL'
        Width = 100
      end
      object dgExplorarDBTableView1R_BAJA: TcxGridDBColumn
        Caption = 'BAJA'
        DataBinding.FieldName = 'R_BAJA'
      end
      object dgExplorarDBTableView1R_NIVEL: TcxGridDBColumn
        Caption = 'NIVEL'
        DataBinding.FieldName = 'R_NIVEL'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    ExplicitWidth = 619
    inherited laCampo: TLabel
      Width = 72
      Caption = 'Usuario'
      ExplicitWidth = 72
    end
    inherited edExplorarValor: TEdit
      Left = 97
      ExplicitLeft = 97
    end
    inherited edExplorarDel: TDateTimePicker
      Left = 97
      ExplicitLeft = 97
    end
    inherited edExplorarAl: TDateTimePicker
      Left = 180
      ExplicitLeft = 180
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      
        'SELECT SU.ID R_ID, SU.USUARIO R_USUARIO, S.NOMBRE R_NOMBRE, SU.B' +
        'AJA R_BAJA,'
      
        '       S.FECHA_ALTA R_FECHA, SU.NIVEL R_NIVEL, s.clave, s.tel_pr' +
        'incipal'
      'FROM SUJETOS_USUARIOS SU LEFT JOIN SUJETOS S ON SU.SUJETO = S.ID'
      'WHERE SU.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'SUJETOS_USUARIOS.ID'
      Required = True
    end
    object qyExplorarR_USUARIO: TIBStringField
      FieldName = 'R_USUARIO'
      Origin = 'SUJETOS_USUARIOS.USUARIO'
    end
    object qyExplorarR_NOMBRE: TIBStringField
      FieldName = 'R_NOMBRE'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_BAJA: TIBStringField
      FieldName = 'R_BAJA'
      Origin = 'SUJETOS_USUARIOS.BAJA'
      FixedChar = True
      Size = 2
    end
    object qyExplorarR_NIVEL: TIntegerField
      FieldName = 'R_NIVEL'
      Origin = 'SUJETOS_USUARIOS.NIVEL'
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      Origin = 'SUJETOS.FECHA_ALTA'
    end
    object qyExplorarCLAVE: TIBStringField
      FieldName = 'CLAVE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarTEL_PRINCIPAL: TIBStringField
      FieldName = 'TEL_PRINCIPAL'
      Origin = 'SUJETOS.TEL_PRINCIPAL'
    end
  end
end
