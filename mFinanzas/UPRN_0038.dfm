object PRN_0038: TPRN_0038
  Left = 458
  Top = 275
  Caption = 'PRN_0038'
  ClientHeight = 228
  ClientWidth = 305
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object qyPGARANTIA: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM POLIZAS'
      'WHERE ID = :P_ID')
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
        Value = '53'
      end>
  end
  object qyVerificarFolio: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM VERIFICAR_FOLIO_POLIZA_G(:P_ID, :P_FOLIO)')
    Left = 72
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'P_FOLIO'
        ParamType = ptUnknown
      end>
    object qyVerificarFolioR_ACEPTADO: TIBStringField
      FieldKind = fkInternalCalc
      FieldName = 'R_ACEPTADO'
      ReadOnly = True
      Size = 2
    end
  end
  object spAUTO_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'AUTO_FOLIO'
    Left = 104
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'R_FOLIO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'P_MODULO'
        ParamType = ptInput
        Value = '20'
      end
      item
        DataType = ftInteger
        Name = 'P_SUBCLASE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftString
        Name = 'P_AFECTAR'
        ParamType = ptInput
      end>
  end
  object spMODIFICAR_FOLIO: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'MODIFICAR_FOLIO'
    Left = 136
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_MODULO'
        ParamType = ptInput
        Value = '20'
      end
      item
        DataType = ftInteger
        Name = 'P_SUBCLASE'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftInteger
        Name = 'P_CONSECUTIVO'
        ParamType = ptInput
      end>
  end
  object spACTUALIZA_MI_ORIGEN: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    StoredProcName = 'ACTUALIZA_MI_ORIGEN'
    Left = 40
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'P_FOLIO'
        ParamType = ptInput
      end>
  end
  object qyActulizar: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'UPDATE NOTAS_DE_ENTRADA'
      'SET CONSECUTIVO = :P_FOLIO'
      'WHERE ID = :P_ID;')
    Left = 72
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'P_FOLIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'P_ID'
        ParamType = ptUnknown
      end>
  end
end
