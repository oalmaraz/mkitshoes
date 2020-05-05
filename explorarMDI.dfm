inherited frmExplorarMDI: TfrmExplorarMDI
  ActiveControl = nil
  Caption = 'Explorar '
  ClientHeight = 343
  ClientWidth = 737
  FormStyle = fsMDIChild
  Position = poDefault
  Visible = True
  WindowState = wsMaximized
  ExplicitWidth = 753
  ExplicitHeight = 382
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 737
    ExplicitWidth = 737
    inherited Panel1: TPanel
      Width = 737
      ExplicitWidth = 737
    end
    inherited ibConstructor: TBitBtn
      Visible = False
    end
    inherited ibImprimir: TBitBtn
      Visible = False
    end
    inherited ibPantalla: TBitBtn
      Left = 238
      Width = 96
      ExplicitLeft = 238
      ExplicitWidth = 96
    end
    inherited ibExportarXLS: TBitBtn
      Left = 340
      Visible = False
      ExplicitLeft = 340
    end
    inherited ibExportarHTML: TBitBtn
      Left = 417
      Visible = False
      ExplicitLeft = 417
    end
    inherited ibExportarXML: TBitBtn
      Left = 494
      Visible = False
      ExplicitLeft = 494
    end
  end
  inherited Panel2: TPanel
    Top = 321
    Width = 737
    ExplicitTop = 321
    ExplicitWidth = 737
  end
  inherited dgExplorar: TcxGrid
    Width = 737
    Height = 232
    ExplicitWidth = 737
    ExplicitHeight = 232
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      FindPanel.DisplayMode = fpdmAlways
      FindPanel.InfoText = 'Buscar ...'
      FindPanel.ShowClearButton = False
      FindPanel.ShowFindButton = False
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 737
    ExplicitWidth = 737
    inherited laCampo: TLabel
      Visible = False
    end
    inherited edExplorarValor: TEdit
      Left = 66
      Top = 6
      Visible = False
      ExplicitLeft = 66
      ExplicitTop = 6
    end
    inherited edExplorarDel: TDateTimePicker
      Left = 251
      Top = 6
      ExplicitLeft = 251
      ExplicitTop = 6
    end
    inherited edExplorarAl: TDateTimePicker
      Left = 267
      Top = 6
      ExplicitLeft = 267
      ExplicitTop = 6
    end
  end
end
