unit capturar_cxp_movimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,

     DBCtrls, StdCtrls, jpeg,
  ExtCtrls,  IBX.IBStoredProc, Db, IBX.IBQuery, IBX.IBCustomDataSet,
  IBX.IBTable, Buttons, ComCtrls, Grids, DBGrids;

type
  TfrmCapturar_cxp_movimientos = class(TForm)
    TCajas: TIBTable;
    TCajasID: TIntegerField;
    TCajasNOMBRE: TIBStringField;
    TCajasALMACEN: TIntegerField;
    TCajasUSUARIO: TIntegerField;
    TCajasTIPO_DE_CAJA: TIBStringField;
    TCajasESTATUS: TIBStringField;
    TCajasMODULO_FUNCION: TIntegerField;
    dsCajas: TDataSource;
    qyCajeros: TIBQuery;
    dsCajeros: TDataSource;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    qyBusqueda: TIBQuery;
    qyBusquedaforma: TIntegerField;
    dsBusqueda: TDataSource;
    spCANCELAR_VENTA: TIBStoredProc;
    spPUNTO_DE_VENTAS_CAMBIAR_ESTATUS: TIBStoredProc;
    spEstatus: TIBStoredProc;
    fpPadre: TPanel;
    imBottom: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label18: TLabel;
    cbEstatus: TDBLookupComboBox;
    deFecha: TDateTimePicker;
    cbCajas: TDBLookupComboBox;
    cbCajeros: TDBLookupComboBox;
    ibBuscar: TBitBtn;
    ibSalir: TBitBtn;
    beAplicar: TBitBtn;
    sbSinAlmacen: TBitBtn;
    dgVentas: TDBGrid;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_FECHA: TDateTimeField;
    qyBusquedaR_CAJA: TIntegerField;
    qyBusquedaR_CAJA_NOMBRE: TIBStringField;
    qyBusquedaR_USUARIO: TIntegerField;
    qyBusquedaR_USUARIO_NOMBRE: TIBStringField;
    qyBusquedaR_FOLIO: TIntegerField;
    qyBusquedaR_GRANTOTAL: TFloatField;
    qyBusquedaR_ESTATUS: TIBStringField;
    TEstatusProcesosDetalleNIVEL: TIntegerField;
    TEstatusProcesosDetalleVER: TIBStringField;
    TEstatusProcesosDetalleCORREO: TIBStringField;
    TEstatusProcesosDetalleASUNTO: TIBStringField;
    qyCajerosR_ID: TIntegerField;
    qyCajerosR_USUARIO: TIntegerField;
    qyCajerosR_USUARIO_C: TIBStringField;
    qyCajerosR_USUARIO_N: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyBusquedaCalcFields(DataSet: TDataSet);
    procedure sbSinAlmacenClick(Sender: TObject);
    procedure ibBuscarClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cbEstatusClick(Sender: TObject);
    procedure dsBusquedaDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    awrUsuario : integer;
    procedure setCAJA(valor : integer);
    procedure setUSUARIO(valor : integer);
  published
    property CAJA    : integer write setCAJA;
    property USUARIO : integer read awrUsuario write setUSUARIO;
  end;

var
  frmCapturar_cxp_movimientos: TfrmCapturar_cxp_movimientos;

implementation

uses autorizacion, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_cxp_movimientos.setCAJA(valor : integer);
begin
   if valor <> 0 then
      cbCajas.KeyValue := valor
   else
      cbCajas.KeyValue := 0;
end;

procedure TfrmCapturar_cxp_movimientos.setUSUARIO(valor : integer);
begin
   awrUsuario := valor;
   cbCajeros.KeyValue := awrUsuario;
end;

procedure TfrmCapturar_cxp_movimientos.FormCreate(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyEstatusProcesos);
   reglas.abrir_IBTabla(TEstatusProcesosDetalle);
   reglas.abrir_IBTabla(TCajas);
   reglas.abrir_IBQuery(qyCajeros);

   CAJA    := 0;
   USUARIO := 0;
   deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
end;

procedure TfrmCapturar_cxp_movimientos.FormClose(Sender: TObject;
  var Action: TCloseAction);
{var
   i : integer;}
begin
{   for i := 0 to ComponentCount-1 do
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
      end;}
end;

procedure TfrmCapturar_cxp_movimientos.qyBusquedaCalcFields(
  DataSet: TDataSet);
begin
   DataSet.FieldByName('FORMA').AsInteger := Self.Tag;
end;

procedure TfrmCapturar_cxp_movimientos.sbSinAlmacenClick(Sender: TObject);
begin
  cbCajeros.KeyValue := 0;
end;

procedure TfrmCapturar_cxp_movimientos.ibBuscarClick(Sender: TObject);
var
   usuario : integer;
var
   ejecutar : boolean;
begin
  frmAutorizacion := TfrmAutorizacion.Crear(Application, 2);
  frmAutorizacion.ShowModal;
  ejecutar := frmAutorizacion.dame_respuesta;
  frmAutorizacion.Free;
  if ejecutar then
  begin
     if cbCajeros.Text <> '' then
        usuario := cbCajeros.KeyValue
     else
        usuario := 0;

     qyBusqueda.Close;
     qyBusqueda.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
     qyBusqueda.ParamByName('P_CAJA').AsInteger    := cbCajas.KeyValue;
     qyBusqueda.ParamByName('P_USUARIO').AsInteger := USUARIO;
     qyBusqueda.Open;
  end;
end;

procedure TfrmCapturar_cxp_movimientos.beAplicarButtonClick(
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

procedure TfrmCapturar_cxp_movimientos.cbEstatusClick(Sender: TObject);
begin
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
  end;
end;

procedure TfrmCapturar_cxp_movimientos.dsBusquedaDataChange(
  Sender: TObject; Field: TField);
begin
  cbEstatus.KeyValue := 0;
  beAplicar.Enabled  := FALSE;
end;

procedure TfrmCapturar_cxp_movimientos.FormShow(Sender: TObject);
begin
   qyBusqueda.Close;
   qyBusqueda.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
   qyBusqueda.ParamByName('P_CAJA').AsInteger    := cbCajas.KeyValue;
   qyBusqueda.ParamByName('P_USUARIO').AsInteger := USUARIO;
   qyBusqueda.Open;
end;

end.
