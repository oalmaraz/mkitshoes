unit capturar_mov_sin_clasificar_movimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, IBX.IBTable, Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids,
  DBGrids, Buttons, ComCtrls, StdCtrls, DBCtrls, jpeg, ExtCtrls;

type
  TfrmCapturar_movSinClasificarMovimientos = class(TForm)
    qyBusqueda: TIBQuery;
    qyBusquedaforma: TIntegerField;
    qyEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    dsBusqueda: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    spEstatus: TIBStoredProc;
    fpPadre: TPanel;
    imBottom: TImage;
    Label1: TLabel;
    Label18: TLabel;
    cbEstatus: TDBLookupComboBox;
    deFecha: TDateTimePicker;
    ibBuscar: TBitBtn;
    ibSalir: TBitBtn;
    beAplicar: TEdit;
    dgVentas: TDBGrid;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_FECHA_ALTA: TDateTimeField;
    qyBusquedaR_CC: TIntegerField;
    qyBusquedaR_CC_NOMBRE: TIBStringField;
    qyBusquedaR_TIPO: TIBStringField;
    qyBusquedaR_REFERENCIA: TIBStringField;
    qyBusquedaR_MONTO: TFloatField;
    qyBusquedaR_MONEDA: TIntegerField;
    qyBusquedaR_MONEDA_CLAVE: TIBStringField;
    qyBusquedaR_MONEDA_DESCRIPCION: TIBStringField;
    qyBusquedaR_AUTORIZO: TIntegerField;
    qyBusquedaR_AUTORIZO_NOMBRE: TIBStringField;
    qyBusquedaR_TABLA_REFERENCIA: TIBStringField;
    qyBusquedaR_ID_REFERENCIA: TIntegerField;
    qyBusquedaR_ESTATUS: TIBStringField;
    qyBusquedaR_SEL: TIBStringField;
    qyBusquedaR_FECHA_APLICACION_REAL: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbEstatusClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibBuscarClick(Sender: TObject);
    procedure dsBusquedaDataChange(Sender: TObject; Field: TField);
    procedure qyBusquedaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_movSinClasificarMovimientos: TfrmCapturar_movSinClasificarMovimientos;

implementation

uses autorizacion, IBData, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_movSinClasificarMovimientos.FormCreate(
  Sender: TObject);
begin
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.FormClose(
  Sender: TObject; var Action: TCloseAction);
var
   i : integer;
begin
   for i := 0 to ComponentCount-1 do
      if Components[i] is TDataSource then
      begin
         if TDataSource(Components[i]).DataSet <> nil then
         begin
            if not(TDataSource(Components[i]).DataSet.State = dsInactive) then
            begin
               if TDataSource(Components[i]).DataSet.State in [dsEdit, dsInsert] then
                  TDataSource(Components[i]).DataSet.Cancel;
               TDataSource(Components[i]).DataSet.Close;
            end;
         end;
      end;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.cbEstatusClick(
  Sender: TObject);
begin
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
  end;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.beAplicarButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   autorizar : string;
   ejecutar  : boolean;
begin
  ejecutar := TRUE;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  if autorizar = 'Si' then
  begin
     frmAutorizacion := TfrmAutorizacion.Crear(Application, 2);
     frmAutorizacion.ShowModal;
     ejecutar := frmAutorizacion.dame_respuesta;
     frmAutorizacion.Free;
  end;
  if ejecutar then
  begin
     spEstatus.ParamByName('P_ID').AsInteger := dsBusqueda.DataSet.FieldByName('R_ID').AsInteger;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;

     reglas.abrir_IBQuery_seek('R_ID',qyBusqueda.FieldByName('R_ID').AsInteger, qyBusqueda);
     reglas.refresh_IBQuery(qyEstatusProcesos);
     cbEstatus.KeyValue := 0;
     beAplicar.Enabled  := false;
  end;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.ibBuscarClick(
  Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.dsBusquedaDataChange(
  Sender: TObject; Field: TField);
begin
  cbEstatus.KeyValue := 0;
  beAplicar.Enabled  := FALSE;
end;

procedure TfrmCapturar_movSinClasificarMovimientos.qyBusquedaCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('FORMA').AsInteger := Self.Tag;
end;

end.
