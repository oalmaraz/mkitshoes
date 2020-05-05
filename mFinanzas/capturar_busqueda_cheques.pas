unit capturar_busqueda_cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      Db, IBX.IBCustomDataSet, IBX.IBTable,
  IBX.IBQuery,      DBCtrls,
  StdCtrls, jpeg,  ExtCtrls,  IBX.IBStoredProc, Grids,
  DBGrids, Buttons, ComCtrls, System.Variants;

type
  TfrmCapturar_busqueda_cheques = class(TForm)
    fpPadre: TPanel;
    imBottom: TImage;
    Label1: TLabel;
    Label18: TLabel;
    cbEstatus: TDBLookupComboBox;
    deFecha: TDateTimePicker;
    ibBuscar: TBitBtn;
    ibSalir: TBitBtn;
    beAplicar: TEdit;
    qyEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
    dgVentas: TDBGrid;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_TIPO: TIBStringField;
    qyBusquedaR_REFERENCIA: TIBStringField;
    qyBusquedaR_AUTORIZACION: TIBStringField;
    qyBusquedaR_MONTO: TFloatField;
    qyBusquedaR_CLIENTE: TIntegerField;
    qyBusquedaR_CLIENTE_NOMBRE: TIBStringField;
    qyBusquedaR_EXTENSION: TIntegerField;
    qyBusquedaR_EXTENSION_NOMBRE: TIBStringField;
    qyBusquedaR_FECHA_ALTA: TDateTimeField;
    qyBusquedaR_FECHA_APLICACION: TDateTimeField;
    qyBusquedaR_FECHA_APLICACION_REAL: TDateTimeField;
    qyBusquedaR_BANCO: TIntegerField;
    qyBusquedaR_BANCO_NOMBRE: TIBStringField;
    qyBusquedaR_ID_REFERENCIA: TIntegerField;
    qyBusquedaR_OBSERVACIONES: TBlobField;
    qyBusquedaESTATUS: TIBStringField;
    qyBusquedaforma: TIntegerField;
    spEstatus: TIBStoredProc;
    procedure qyBusquedaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure cbEstatusClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dsBusquedaDataChange(Sender: TObject; Field: TField);
    procedure ibBuscarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_busqueda_cheques: TfrmCapturar_busqueda_cheques;

implementation

uses reglas_de_negocios, autorizacion;

{$R *.DFM}

procedure TfrmCapturar_busqueda_cheques.qyBusquedaCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('FORMA').AsInteger := Self.Tag;
end;

procedure TfrmCapturar_busqueda_cheques.FormCreate(Sender: TObject);
begin
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

procedure TfrmCapturar_busqueda_cheques.cbEstatusClick(Sender: TObject);
begin
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
  end;
end;

procedure TfrmCapturar_busqueda_cheques.beAplicarButtonClick(
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
     cbEstatus.KeyValue := null;
     beAplicar.Enabled  := false;
  end;
end;

procedure TfrmCapturar_busqueda_cheques.dsBusquedaDataChange(
  Sender: TObject; Field: TField);
begin
  cbEstatus.KeyValue := null;
  beAplicar.Enabled  := FALSE;
end;

procedure TfrmCapturar_busqueda_cheques.ibBuscarClick(Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

procedure TfrmCapturar_busqueda_cheques.FormClose(Sender: TObject;
  var Action: TCloseAction);
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

end.
