inherited frmExplorar_relacion_botones: TfrmExplorar_relacion_botones
  Left = 214
  Top = 206
  Caption = 'Explorar Relacion Forma-Botones'
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
      object dgExplorarDBTableView1R_FORMA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FORMA'
      end
      object dgExplorarDBTableView1R_BOTON: TcxGridDBColumn
        DataBinding.FieldName = 'R_BOTON'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 619
    TabStop = True
    ExplicitWidth = 619
    inherited laCampo: TLabel
      Width = 60
      Caption = 'Forma'
      ExplicitWidth = 60
    end
    inherited edExplorarValor: TEdit
      Left = 89
      Width = 173
      ExplicitLeft = 89
      ExplicitWidth = 173
    end
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT FB.ID R_ID, F.NOMBRE R_FORMA, B.NOMBRE R_BOTON'
      'FROM (FORMAS_BOTONES FB LEFT JOIN FORMAS F ON FB.FORMA_ = F.ID)'
      '           LEFT JOIN BOTONES B ON FB.BOTON = B.ID'
      'WHERE FB.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'FORMAS_BOTONES.ID'
      Required = True
    end
    object qyExplorarR_FORMA: TIBStringField
      FieldName = 'R_FORMA'
      Origin = 'FORMAS.NOMBRE'
      Size = 50
    end
    object qyExplorarR_BOTON: TIBStringField
      FieldName = 'R_BOTON'
      Origin = 'BOTONES.NOMBRE'
      Size = 50
    end
  end
end
