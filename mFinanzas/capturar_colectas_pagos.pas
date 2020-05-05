unit capturar_colectas_pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
  Menus, Buttons, Grids, DBGrids, System.Variants;

type
  TfrmCapturar_colectas_pagos = class(TfrmCapturarMDI)
    dsDatosCajero: TDataSource;
    dsAlmacenes: TDataSource;
    dsEncabezado: TDataSource;
    qyCondiciones_Comerciales: TIBQuery;
    qyCondiciones_ComercialesID: TIntegerField;
    qyCondiciones_ComercialesTIPO: TIBStringField;
    qyCondiciones_ComercialesCLAVE: TIBStringField;
    qyCondiciones_ComercialesNOMBRE: TIBStringField;
    qyCondiciones_ComercialesNUM_PAGOS: TIntegerField;
    qyCondiciones_ComercialesINTERVALO_ENTRE_PAGOS: TIntegerField;
    qyCondiciones_ComercialesDESPLAZAMIENTO_1_PAGO: TIntegerField;
    qyCondiciones_ComercialesDESCUENTO_PORCENTAJE: TFloatField;
    qyCondiciones_ComercialesFINANCIAMIENTO: TIntegerField;
    qyCondiciones_ComercialesMORATORIO: TIBStringField;
    qyCondiciones_ComercialesPUNTO_DE_VENTA: TIBStringField;
    qyCondiciones_ComercialesREQUIERE_AUTORIZACION: TIBStringField;
    qyCondiciones_ComercialesREQUIERE_FOLIO: TIBStringField;
    dsCondiciones_Comerciales: TDataSource;
    dsBancos: TDataSource;
    qyBancos: TIBQuery;
    qyBancosR_ID: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    qyEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    spTOTALES_COLECTAS: TIBStoredProc;
    spID2: TIBStoredProc;
    spDEL_COLECTAS_DET: TIBStoredProc;
    Label2: TLabel;
    dtCaja: TDBText;
    Label3: TLabel;
    dtUsuario: TDBText;
    Label1: TLabel;
    dtAlmacen: TDBText;
    beAplicar: TEdit;
    leEstatus: TDBLookupComboBox;
    Label18: TLabel;
    deRef: TDBEdit;
    Label4: TLabel;
    laError1: TLabel;
    laError2: TLabel;
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    paCaptura: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dtTotal: TDBText;
    cbFormas_de_Cobro: TDBLookupComboBox;
    ceCantidad: TDBEdit;
    ceMonto: TDBEdit;
    deReferencia: TDBEdit;
    cbBancos: TDBLookupComboBox;
    dgPartidas: TDBGrid;
    TCapturarID: TIntegerField;
    TCapturarFECHA: TDateTimeField;
    TCapturarCAJA: TIntegerField;
    TCapturarTIPO: TIBStringField;
    TCapturarALMACEN: TIntegerField;
    TCapturarUSUARIO: TIntegerField;
    TCapturarREFERENCIA: TIBStringField;
    TCapturarTOTAL: TFloatField;
    TCapturarESTATUS: TIBStringField;
    qyColectasPartidas: TIBQuery;
    qyColectasPartidasR_ID: TIntegerField;
    qyColectasPartidasR_COLECTAS: TIntegerField;
    qyColectasPartidasR_REFERENCIA_PAGO: TIntegerField;
    qyColectasPartidasR_REFERENCIA_NOMBRE: TIBStringField;
    qyColectasPartidasR_CANTIDAD: TIntegerField;
    qyColectasPartidasR_MONTO: TFloatField;
    qyColectasPartidasR_TOTAL: TFloatField;
    qyColectasPartidasR_REFERENCIA: TIBStringField;
    qyColectasPartidasR_BANCO: TIntegerField;
    qyColectasPartidasR_BANCO_NOMBRE: TIBStringField;
    qyColectasPartidasR_ESTATUS: TIBStringField;
    dsPartidas: TDataSource;
    TColectasDetalle: TIBTable;
    TColectasDetalleID: TIntegerField;
    TColectasDetalleCOLECTAS: TIntegerField;
    TColectasDetalleREFERENCIA_PAGO: TIntegerField;
    TColectasDetalleCANTIDAD: TIntegerField;
    TColectasDetalleMONTO: TFloatField;
    TColectasDetalleREFERENCIA: TIBStringField;
    TColectasDetalleBANCO: TIntegerField;
    TColectasDetalleESTATUS: TIBStringField;
    TColectasDetallereferencia_nombre: TStringField;
    TColectasDetalletotal: TFloatField;
    dsColectasDetalle: TDataSource;
    spEstatus: TIBStoredProc;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure dsEncabezadoDataChange(Sender: TObject; Field: TField);
    procedure dsColectasDetalleDataChange(Sender: TObject; Field: TField);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure coGRANTOTALDrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure TColectasDetalleCalcFields(DataSet: TDataSet);
    procedure deReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure leEstatusChange(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_colectas_pagos: TfrmCapturar_colectas_pagos;

implementation

uses IBModulo, explorar_colectas_pagos, IBData, autorizacion,
  reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_colectas_pagos.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(TColectasDetalle);
  reglas.abrir_IBTabla(dmIBData.TFiltroCondicionesComerciales);
  inherited;
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
end;

procedure TfrmCapturar_colectas_pagos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsDatosCajero.DataSet := nil;
  dsAlmacenes.DataSet   := nil;
  dsEncabezado.DataSet  := nil;
  inherited;
end;

procedure TfrmCapturar_colectas_pagos.ibNuevoClick(Sender: TObject);
var
   caja : variant;
begin
  inherited;
  if dsDatosCajero.DataSet.IsEmpty then
     caja := null
  else
     caja := dsDatosCajero.DataSet.FieldByName('R_ID').AsInteger;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA').AsDateTime  := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('CAJA').AsVariant    := caja;
  dsFuente.DataSet.FieldByName('TIPO').AsString     := 'Pagos';
  dsFuente.DataSet.FieldByName('ALMACEN').AsInteger := dsAlmacenes.DataSet.FieldByName('ID').AsInteger;
  dsFuente.DataSet.FieldByName('USUARIO').AsInteger := reglas.dame_usuario;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString  := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := 0.00;
  deRef.SetFocus;
end;

procedure TfrmCapturar_colectas_pagos.ibModificarClick(Sender: TObject);
begin
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  deRef.SetFocus;
end;

procedure TfrmCapturar_colectas_pagos.ibGuardarClick(Sender: TObject);
begin
//  inherited;
  dsFuente.DataSet.Post;
  TCapturar.Transaction.CommitRetaining;
  reglas.abrir_IBQuery_seek('R_ID',dsFuente.DataSet.FieldByName('ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
end;

procedure TfrmCapturar_colectas_pagos.dsEncabezadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsEncabezado.DataSet.FieldByName('R_ALMACEN').AsString <> '' then
  begin
     dmIBData.TFiltroAlmacenes.Filter              := 'ID ='+dsEncabezado.DataSet.FieldByName('R_ALMACEN').AsString;
     if dmIBData.TFiltroAlmacenes.FieldByName('VENDE').AsString = 'No' then
        laError1.Visible := True
     else
        laError1.Visible := False;

     if dmIBData.TFiltroAlmacenes.FieldByName('ESTATUS').AsString = 'Fuera de Operacion' then
        laError2.Visible := True
     else
        laError2.Visible := False;
  end
  else
     begin
        laError1.Visible := False;
        laError2.Visible := False;
     end;
end;

procedure TfrmCapturar_colectas_pagos.dsColectasDetalleDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     ibNuevaPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibModificarPartida.Enabled :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibGuardarPartida.Enabled   :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibCancelarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibEliminarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     paCaptura.Visible          :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
  end;
end;

procedure TfrmCapturar_colectas_pagos.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  qyColectasPartidas.Close;
  qyColectasPartidas.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyColectasPartidas.Open;
end;

procedure TfrmCapturar_colectas_pagos.coGRANTOTALDrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsEncabezado.DataSet.FieldByName('R_TOTAL').AsFloat);
end;

procedure TfrmCapturar_colectas_pagos.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsColectasDetalle.DataSet.Cancel;
end;

procedure TfrmCapturar_colectas_pagos.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('Desea Eliminar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
    spDEL_COLECTAS_DET.ParamByName('P_ID').AsInteger := qyColectasPartidas.FieldByName('R_ID').AsInteger;
    spDEL_COLECTAS_DET.ExecProc;
    spDEL_COLECTAS_DET.Transaction.CommitRetaining;
    
    spTOTALES_COLECTAS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
    spTOTALES_COLECTAS.ExecProc;
    spTOTALES_COLECTAS.Transaction.CommitRetaining;
    reglas.abrir_IBQuery_seek('R_ID',dsFuente.DataSet.FieldByName('ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
    reglas.refresh_IBQuery(qyColectasPartidas);
  end;
end;

procedure TfrmCapturar_colectas_pagos.TColectasDetalleCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('REFERENCIA_PAGO').AsString <> '' then
  begin
     dmIBData.TFiltroCondicionesComerciales.Filter := 'ID = '+DataSet.FieldByName('REFERENCIA_PAGO').AsString;
     DataSet.FieldByName('REFERENCIA_NOMBRE').AsString := dmIBData.TFiltroCondicionesComerciales.FieldByName('NOMBRE').AsString;
  end
  else
     DataSet.FieldByName('REFERENCIA_NOMBRE').AsString := '';

  DataSet.FieldByName('TOTAL').AsFloat := DataSet.FieldByName('CANTIDAD').AsInteger * DataSet.FieldByName('MONTO').AsFloat;
end;

procedure TfrmCapturar_colectas_pagos.deReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    ibGuardarPartida.Click;
    ibNuevaPartida.Click;
  end;
end;

procedure TfrmCapturar_colectas_pagos.beAplicarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   autorizar : string;
   ejecutar  : boolean;
begin
  inherited;
  ejecutar := TRUE;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := estatus;
  dsFuente.DataSet.Post;
  if autorizar = 'Si' then
  begin
     frmAutorizacion := TfrmAutorizacion.Crear(Application, 2);
     frmAutorizacion.ShowModal;
     ejecutar := frmAutorizacion.dame_respuesta;
     frmAutorizacion.Free;
  end;
  if ejecutar then
  begin
     spEstatus.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;
     reglas.abrir_IBTabla(TCapturar);
     reglas.abrir_IBQuery_seek('R_ID',TIBQuery(TDataSource(TCapturar.MasterSource).DataSet).FieldByName('R_ID').AsInteger,TIBQuery(TDataSource(TCapturar.MasterSource).DataSet));
  end;
end;

procedure TfrmCapturar_colectas_pagos.leEstatusChange(Sender: TObject);
begin
  inherited;
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     beAplicar.Enabled        := TRUE;
     ibGuardar.Enabled        := FALSE;
  end
  else
     dsFuente.DataSet.FieldByName('ESTATUS').AsString := estatus;
end;

procedure TfrmCapturar_colectas_pagos.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  dsColectasDetalle.DataSet.Insert;
  reglas.refresh_IBQuery(qyCondiciones_Comerciales);
  reglas.refresh_IBQuery(qyBancos);
  spID2.ExecProc;
  dsColectasDetalle.DataSet.FieldByName('ID').AsInteger       := spID2.ParamByName('R_ID').AsInteger;
  dsColectasDetalle.DataSet.FieldByName('COLECTAS').AsInteger := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
  dsColectasDetalle.DataSet.FieldByName('CANTIDAD').AsInteger := 0;
  dsColectasDetalle.DataSet.FieldByName('MONTO').AsFloat      := 0.00;
  dsColectasDetalle.DataSet.FieldByName('ESTATUS').AsString   := 'Sin Afectar';
  cbFormas_de_Cobro.SetFocus;
end;

procedure TfrmCapturar_colectas_pagos.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsColectasDetalle.DataSet.Edit;
  reglas.refresh_IBQuery(qyCondiciones_Comerciales);
  reglas.refresh_IBQuery(qyBancos);
  ceCantidad.SetFocus;
end;

procedure TfrmCapturar_colectas_pagos.ibGuardarPartidaClick(
  Sender: TObject);
var
   detalle : integer;
begin
  inherited;
  detalle := dsColectasDetalle.DataSet.FieldByName('ID').AsInteger;
  dsColectasDetalle.DataSet.Post;
  TColectasDetalle.Transaction.CommitRetaining;
  spTOTALES_COLECTAS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  spTOTALES_COLECTAS.ExecProc;
  spTOTALES_COLECTAS.Transaction.CommitRetaining;
  reglas.abrir_IBQuery_seek('R_ID',dsFuente.DataSet.FieldByName('ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
  reglas.abrir_IBQuery_seek('R_ID',detalle,qyColectasPartidas);
end;

procedure TfrmCapturar_colectas_pagos.NuevaPartida1Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_colectas_pagos.ModificarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_colectas_pagos.GuardarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_colectas_pagos.CancelarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas_pagos.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

end.
