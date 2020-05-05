inherited frmCapturar_procesos: TfrmCapturar_procesos
  Top = 41
  Caption = 'Capturar Procesos'
  ClientHeight = 504
  ClientWidth = 773
  ExplicitWidth = 789
  ExplicitHeight = 543
  PixelsPerInch = 96
  TextHeight = 13
  inherited paLienzo: TPanel
    Width = 773
    Height = 422
    ExplicitWidth = 124
    ExplicitHeight = 422
  end
  inherited fpPadre: TPanel
    Width = 773
    ExplicitWidth = 124
    inherited Panel1: TPanel
      Width = 773
      ExplicitWidth = 124
    end
  end
  inherited Panel2: TPanel
    Top = 482
    Width = 773
    ExplicitTop = 482
    ExplicitWidth = 124
  end
  object qyEstatusProcesos: TIBQuery
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    DataSource = dsFuente
    ParamCheck = True
    SQL.Strings = (
      'SELECT *'
      'FROM ESTATUS_PROCESOS'
      'WHERE (FORMA = :FORMA) AND (ESTATUS = :ESTATUS)')
    Left = 288
    Top = 367
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ESTATUS'
        ParamType = ptUnknown
      end>
  end
  object dsEstatusProcesos: TDataSource
    DataSet = qyEstatusProcesos
    Left = 320
    Top = 367
  end
  object TEstatusProcesosDetalle: TIBTable
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PROCESO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESTATUS'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'AUTORIZACION'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'STOREPROC'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'RDB$PRIMARY117'
        Fields = 'ID'
        Options = [ixPrimary, ixUnique]
      end
      item
        Name = 'RDB$FOREIGN118'
        Fields = 'PROCESO'
      end>
    IndexFieldNames = 'PROCESO'
    MasterFields = 'ID'
    MasterSource = dsEstatusProcesos
    StoreDefs = True
    TableName = 'ESTATUS_PROCESOS_DET'
    UniDirectional = False
    Left = 352
    Top = 367
    object TEstatusProcesosDetalleID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object TEstatusProcesosDetallePROCESO: TIntegerField
      FieldName = 'PROCESO'
      Required = True
    end
    object TEstatusProcesosDetalleESTATUS: TIBStringField
      FieldName = 'ESTATUS'
    end
    object TEstatusProcesosDetalleAUTORIZACION: TIBStringField
      FieldName = 'AUTORIZACION'
      Size = 2
    end
    object TEstatusProcesosDetalleSTOREPROC: TIBStringField
      FieldName = 'STOREPROC'
      Size = 50
    end
  end
  object dsEstatusProcesosDetalle: TDataSource
    DataSet = TEstatusProcesosDetalle
    Left = 384
    Top = 367
  end
  object spEstatus: TIBStoredProc
    Database = dmIBModulo.ibSistema
    Transaction = dmIBModulo.ibSistemaTransaccion
    Left = 416
    Top = 367
  end
end
