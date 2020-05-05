unit capturar_cheques_girados_movimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBStoredProc, IBX.IBQuery,  Grids,
  DBGrids, Buttons, ComCtrls, StdCtrls, DBCtrls, jpeg, ExtCtrls, System.Variants;

type
  TfrmCapturar_ChequesGiradosMovimientos = class(TForm)
    qyBusqueda: TIBQuery;
    qyBusquedaforma: TIntegerField;
    dsBusqueda: TDataSource;
    spEstatus: TIBStoredProc;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_REFERENCIA: TIBStringField;
    qyBusquedaR_MONTO: TFloatField;
    qyBusquedaR_MONEDA: TIntegerField;
    qyBusquedaR_MONEDA_CLAVE: TIBStringField;
    qyBusquedaR_PROVEEDOR: TIntegerField;
    qyBusquedaR_PROVEEDOR_NOMBRE: TIBStringField;
    qyBusquedaR_FECHA_ALTA: TDateTimeField;
    qyBusquedaR_FECHA_APLICACION: TDateTimeField;
    qyBusquedaR_FECHA_APLICACION_REAL: TDateTimeField;
    qyBusquedaR_BANCO: TIntegerField;
    qyBusquedaR_BANCO_NOMBRE: TIBStringField;
    qyBusquedaR_OBSERVACIONES: TBlobField;
    qyBusquedaR_AUTORIZO: TIntegerField;
    qyBusquedaR_AUTORIZO_NOMBRE: TIBStringField;
    qyBusquedaR_ESTATUS: TIBStringField;
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
    spP_CHEQUES_OUT_QUIEN: TIBStoredProc;
    procedure qyBusquedaCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbEstatusClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dsBusquedaDataChange(Sender: TObject; Field: TField);
    procedure ibBuscarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_ChequesGiradosMovimientos: TfrmCapturar_ChequesGiradosMovimientos;

implementation

uses autorizacion, reglas_de_negocios, IBModulo, IBData;

{$R *.DFM}

procedure TfrmCapturar_ChequesGiradosMovimientos.qyBusquedaCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('FORMA').AsInteger := Self.Tag;
end;

procedure TfrmCapturar_ChequesGiradosMovimientos.FormCreate(
  Sender: TObject);
begin
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

procedure TfrmCapturar_ChequesGiradosMovimientos.FormClose(Sender: TObject;
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

procedure TfrmCapturar_ChequesGiradosMovimientos.cbEstatusClick(
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

procedure TfrmCapturar_ChequesGiradosMovimientos.beAplicarButtonClick(
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

     spP_CHEQUES_OUT_QUIEN.ParamByName('P_ID').AsInteger    := dsBusqueda.DataSet.FieldByName('R_ID').AsInteger;
     spP_CHEQUES_OUT_QUIEN.ParamByName('P_QUIEN').AsInteger := dmIBData.TFiltroUsuariosAutorizacion.FieldByName('ID').AsInteger;
     spP_CHEQUES_OUT_QUIEN.ExecProc;
     spP_CHEQUES_OUT_QUIEN.Transaction.CommitRetaining;


     reglas.abrir_IBQuery_seek('R_ID',qyBusqueda.FieldByName('R_ID').AsInteger, qyBusqueda);
     reglas.refresh_IBQuery(qyEstatusProcesos);
     cbEstatus.KeyValue := null;
     beAplicar.Enabled  := false;
  end;
end;

procedure TfrmCapturar_ChequesGiradosMovimientos.dsBusquedaDataChange(
  Sender: TObject; Field: TField);
begin
  cbEstatus.KeyValue := null;
  beAplicar.Enabled  := FALSE;
end;

procedure TfrmCapturar_ChequesGiradosMovimientos.ibBuscarClick(
  Sender: TObject);
begin
  qyBusqueda.Close;
  qyBusqueda.ParamByName('P_FECHA').AsDate := deFecha.Date;
  qyBusqueda.Open;
end;

end.
