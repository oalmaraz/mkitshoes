unit capturar_busqueda_pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, jpeg,
  ExtCtrls, IBX.IBTable, IBX.IBStoredProc, Db, IBX.IBCustomDataSet,
  IBX.IBQuery, Buttons, Grids, DBGrids, ComCtrls, System.Variants;

type
  TfrmCapturar_busqueda_pagos = class(TForm)
    qyBusqueda: TIBQuery;
    qyBusquedaR_ID: TIntegerField;
    qyBusquedaR_FECHA: TDateTimeField;
    qyBusquedaR_CAJA: TIntegerField;
    qyBusquedaR_CAJA_NOMBRE: TIBStringField;
    qyBusquedaR_CAJERO: TIntegerField;
    qyBusquedaR_CAJERO_NOMBRE: TIBStringField;
    qyBusquedaR_FOLIO: TIntegerField;
    qyBusquedaR_GRANTOTAL: TFloatField;
    qyBusquedaR_CAMBIO: TFloatField;
    qyBusquedaESTATUS: TIBStringField;
    qyBusquedaforma: TIntegerField;
    dsBusqueda: TDataSource;
    spCANCELAR_VENTA: TIBStoredProc;
    spPUNTO_DE_VENTAS_CAMBIAR_ESTATUS: TIBStoredProc;
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
    beAplicar: TEdit;
    sbSinAlmacen: TBitBtn;
    dgVentas: TDBGrid;
    qyCajerosR_ID: TIntegerField;
    qyCajerosR_USUARIO: TIntegerField;
    qyCajerosR_USUARIO_C: TIBStringField;
    qyCajerosR_USUARIO_N: TIBStringField;
    procedure sbSinAlmacenClick(Sender: TObject);
    procedure ibBuscarClick(Sender: TObject);
    procedure cbEstatusClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure qyBusquedaCalcFields(DataSet: TDataSet);
    procedure dsBusquedaDataChange(Sender: TObject; Field: TField);
    procedure cbCajerosClick(Sender: TObject);
  private
    { Private declarations }
    awrUsuario : integer;
    procedure setCAJA(valor : integer);
    procedure setUSUARIO(valor : integer);
  public
    { Public declarations }
    procedure LoadData;
  published
    property CAJA    : integer write setCAJA;
    property USUARIO : integer read awrUsuario write setUSUARIO;
  end;

var
  frmCapturar_busqueda_pagos: TfrmCapturar_busqueda_pagos;

implementation

uses reglas_de_negocios, UfrmAutorizar;

{$R *.DFM}

procedure TfrmCapturar_busqueda_pagos.LoadData;
begin
   qyBusqueda.Close;
   qyBusqueda.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',deFecha.Date);
   qyBusqueda.ParamByName('P_CAJA').AsInteger   := cbCajas.KeyValue;
   qyBusqueda.ParamByName('P_CAJERO').AsInteger := USUARIO;
   qyBusqueda.Open;
end;

procedure TfrmCapturar_busqueda_pagos.setCAJA(valor : integer);
begin
   if valor <> 0 then
      cbCajas.KeyValue := valor
   else
      cbCajas.KeyValue := null;
end;

procedure TfrmCapturar_busqueda_pagos.setUSUARIO(valor : integer);
begin
   awrUsuario         := valor;
   cbCajeros.KeyValue := awrUsuario;
end;

procedure TfrmCapturar_busqueda_pagos.sbSinAlmacenClick(Sender: TObject);
begin
  cbCajeros.KeyValue := Null;
  USUARIO            := 0;
end;

procedure TfrmCapturar_busqueda_pagos.ibBuscarClick(Sender: TObject);
var
   ejecutar  : boolean;
   autorizar : TfrmAutorizar;
begin
   ejecutar := true;
   if reglas.dameUsuarioNivel < 2 then
   begin
      autorizar := TfrmAutorizar.Crear(Application, 2);
      autorizar.ShowModal;
      ejecutar := autorizar.autorizacion;
      autorizar.Free;
   end;

  if ejecutar then
  begin
     qyBusqueda.Close;
     qyBusqueda.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',deFecha.Date);
     qyBusqueda.ParamByName('P_CAJA').AsInteger   := cbCajas.KeyValue;
     qyBusqueda.ParamByName('P_CAJERO').AsInteger := USUARIO;
     qyBusqueda.Open;
  end;
end;

procedure TfrmCapturar_busqueda_pagos.cbEstatusClick(Sender: TObject);
begin
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
  end;
end;

procedure TfrmCapturar_busqueda_pagos.beAplicarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   autorizacion : string;
   ejecutar     : boolean;
   autorizar    : TfrmAutorizar;
begin
  ejecutar     := TRUE;
  autorizacion := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  if autorizacion = 'Si' then
  begin
     autorizar := TfrmAutorizar.Crear(Application, 2);
     autorizar.ShowModal;
     ejecutar := autorizar.autorizacion;
     autorizar.Free;
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

procedure TfrmCapturar_busqueda_pagos.FormCreate(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyEstatusProcesos);
   reglas.abrir_IBTabla(TEstatusProcesosDetalle);
   reglas.abrir_IBTabla(TCajas);
   reglas.abrir_IBQuery(qyCajeros);

   CAJA    := 0;
   USUARIO := 0;
   deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
end;

procedure TfrmCapturar_busqueda_pagos.qyBusquedaCalcFields(DataSet: TDataSet);
begin
   DataSet.FieldByName('FORMA').AsInteger := Self.Tag;
end;

procedure TfrmCapturar_busqueda_pagos.dsBusquedaDataChange(Sender: TObject;
  Field: TField);
begin
  cbEstatus.KeyValue := null;
  beAplicar.Enabled  := FALSE;
end;

procedure TfrmCapturar_busqueda_pagos.cbCajerosClick(Sender: TObject);
begin
   if cbCajeros.Text <> '' then
      USUARIO := cbCajeros.KeyValue
   else
      USUARIO := 0;
end;

end.
