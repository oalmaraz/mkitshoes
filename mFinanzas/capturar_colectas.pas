unit capturar_colectas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, Db, DBCtrls,
  StdCtrls, IBX.IBStoredProc, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery,
  Mask,    jpeg,  ExtCtrls,
   Menus, Buttons,
     Grids,
  DBGrids, System.Variants;

type
  TfrmCapturar_colectas = class(TfrmCapturarMDI)
    qyCondiciones_Comerciales: TIBQuery;
    dsCondiciones_Comerciales: TDataSource;
    Label5: TLabel;
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
    qyBancos: TIBQuery;
    dsBancos: TDataSource;
    qyBancosR_ID: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    TCapturarreferencia_nombre: TStringField;
    spTOTALES_COLECTAS: TIBStoredProc;
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    paCaptura: TPanel;
    dgPartidas: TDBGrid;
    Label2: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label4: TLabel;
    deRef: TDBEdit;
    Label18: TLabel;
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
    dsPartidas: TDataSource;
    qyColectasPartidasR_ID: TIntegerField;
    qyColectasPartidasR_COLECTAS: TIntegerField;
    qyColectasPartidasR_REFERENCIA_PAGO: TIntegerField;
    qyColectasPartidasR_REFERENCIA_NOMBRE: TIBStringField;
    qyColectasPartidasR_CANTIDAD: TIntegerField;
    qyColectasPartidasR_MONTO: TFloatField;
    qyColectasPartidasR_REFERENCIA: TIBStringField;
    qyColectasPartidasR_BANCO: TIntegerField;
    qyColectasPartidasR_BANCO_NOMBRE: TIBStringField;
    qyColectasPartidasR_ESTATUS: TIBStringField;
    spID2: TIBStoredProc;
    spDEL_COLECTAS_DET: TIBStoredProc;
    qyColectasPartidasR_TOTAL: TFloatField;
    spEstatus: TIBStoredProc;
    pmTeclas: TPopupMenu;
    itemF7: TMenuItem;
    itemF8: TMenuItem;
    itemF9: TMenuItem;
    itemF10: TMenuItem;
    itemF11: TMenuItem;
    edAlmacen: TEdit;
    edCaja: TEdit;
    edUsuario: TEdit;
    qyColectasPartidasR_ROWS: TIntegerField;
    buLimpiarBanco: TBitBtn;
    edCantidad: TEdit;
    edMonto: TEdit;
    edReferencia: TEdit;
    laTotal: TLabel;
    Label11: TLabel;
    spA_COLECTA_DETALLE: TIBStoredProc;
    cbCComerciales: TDBLookupComboBox;
    cbBancos: TDBLookupComboBox;
    buAplicar: TBitBtn;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    cbEstatus: TDBLookupComboBox;
    edEstatus: TDBEdit;
    procedure ibNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure itemF7Click(Sender: TObject);
    procedure itemF8Click(Sender: TObject);
    procedure itemF9Click(Sender: TObject);
    procedure itemF10Click(Sender: TObject);
    procedure itemF11Click(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure buLimpiarBancoClick(Sender: TObject);
    procedure edReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure edCantidadChange(Sender: TObject);
    procedure buAplicarClick(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure cbEstatusChange(Sender: TObject);
  private
    { Private declarations }
    awrColectaCC   : integer;
    edicionDetalle : boolean;//<-valida los botones
    
    procedure setAlmacen(valor : integer);
    procedure setAlmacen_(valor : string);
    procedure setCaja(valor : integer);
    procedure setCaja_(valor : string);
    procedure setUsuario(valor : integer);
    procedure setUsuario_(valor : string);
    procedure fijarBotonesDetalle;
  public
    { Public declarations }
  published
     property ALMACEN  : integer write setAlmacen;
     property ALMACEN_ : string write setAlmacen_;
     property CAJA     : integer write setCaja;
     property CAJA_    : string write setCaja_;
     property USUARIO  : integer write setUsuario;
     property USUARIO_ : string write setUsuario_;
  end;

var
  frmCapturar_colectas: TfrmCapturar_colectas;

implementation

uses IBModulo, IBData, reglas_de_negocios, explorar_colectas, autorizacion,
  PRN_0006_Colectas, UfrmAcceso;

{$R *.DFM}

procedure TfrmCapturar_colectas.fijarBotonesDetalle;
var
   st : boolean;
begin
  st := (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Afectado' ) or
        (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Cancelado');

  ibNuevaPartida.Enabled     := not(edicionDetalle) and not(st);
  ibModificarPartida.Enabled := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibEliminarPartida.Enabled  := not(edicionDetalle) and not(st) and not(dsPartidas.DataSet.IsEmpty);
  ibGuardarPartida.Enabled   := edicionDetalle and not(st);
  ibCancelarPartida.Enabled  := edicionDetalle and not(st);

  itemF7.Enabled  := ibNuevaPartida.Enabled;
  itemF8.Enabled  := ibModificarPartida.Enabled;
  itemF9.Enabled  := ibGuardarPartida.Enabled;
  itemF10.Enabled := ibCancelarPartida.Enabled;
  itemF11.Enabled := ibEliminarPartida.Enabled;

  paCaptura.Visible          := edicionDetalle and not(st);
  dgPartidas.Enabled         := not edicionDetalle;
end;

procedure TfrmCapturar_colectas.setUsuario(valor : integer);
begin
   edUsuario.Tag := valor;
end;

procedure TfrmCapturar_colectas.setUsuario_(valor : string);
begin
   edUsuario.Text := valor;
end;

procedure TfrmCapturar_colectas.setCaja(valor : integer);
begin
   edCaja.Tag := valor;
end;

procedure TfrmCapturar_colectas.setCaja_(valor : string);
begin
   edCaja.Text := valor;
end;

procedure TfrmCapturar_colectas.setAlmacen(valor : integer);
begin
   edAlmacen.Tag := valor;
end;

procedure TfrmCapturar_colectas.setAlmacen_(valor : string);
begin
   edAlmacen.Text := valor;
end;

procedure TfrmCapturar_colectas.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA').AsDateTime  := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('CAJA').AsInteger    := edCaja.Tag;
  dsFuente.DataSet.FieldByName('TIPO').AsString     := 'Ventas';
  dsFuente.DataSet.FieldByName('ALMACEN').AsInteger := edAlmacen.Tag;
  dsFuente.DataSet.FieldByName('USUARIO').AsInteger := edUsuario.Tag;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString  := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := 0.00;
  deRef.SetFocus;
end;

procedure TfrmCapturar_colectas.FormCreate(Sender: TObject);
begin
  reglas.refresh_IBQuery(qyCondiciones_Comerciales);
  reglas.refresh_IBQuery(qyBancos);
  inherited;
  awrColectaCC := -1;
end;

procedure TfrmCapturar_colectas.ibGuardarClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_colectas.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
  cbCComerciales.KeyValue := -1;
  edCantidad.Text        := '0';
  edMonto.Text           := '0';
  edReferencia.Clear;
  cbBancos.KeyValue       := -1;

  if awrColectaCC = -1 then
     cbCComerciales.SetFocus
  else
     edCantidad.SetFocus;
end;

procedure TfrmCapturar_colectas.ibModificarClick(Sender: TObject);
begin
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  deRef.SetFocus;
end;

procedure TfrmCapturar_colectas.ibGuardarPartidaClick(Sender: TObject);
var
   detalle : integer;
   banco : integer;
//   cc    : integer;
begin
  inherited;
  if cbCComerciales.KeyValue <> null then
  begin
      banco := 0;
      if cbBancos.KeyValue <> null then
         banco := cbBancos.KeyValue;

      spA_COLECTA_DETALLE.ParamByName('P_ID').AsInteger        := dsFuente.DataSet.FieldByName('ID').AsInteger;
      spA_COLECTA_DETALLE.ParamByName('P_CC').AsInteger        := cbCComerciales.KeyValue;
      spA_COLECTA_DETALLE.ParamByName('P_CANTIDAD').AsFloat    := StrToFloat(edCantidad.Text);
      spA_COLECTA_DETALLE.ParamByName('P_MONTO').AsFloat       := StrToFloat(edMonto.Text);
      spA_COLECTA_DETALLE.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
      spA_COLECTA_DETALLE.ParamByName('P_BANCO').AsInteger     := banco;
      spA_COLECTA_DETALLE.ExecProc;
      spA_COLECTA_DETALLE.Transaction.CommitRetaining;

      awrColectaCC := cbCComerciales.KeyValue;
      detalle      := spA_COLECTA_DETALLE.ParamByName('R_ID').AsInteger;
      reglas.abrir_IBQuery_seek('R_ID', detalle, qyColectasPartidas);

      edCantidad.Setfocus;
  end
  else
  begin
    ShowMessage('Borrado permanente. Falta Forma de Cobro');
  end

end;

procedure TfrmCapturar_colectas.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  buAplicar.Enabled := false;
  
  qyColectasPartidas.Close;
  qyColectasPartidas.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyColectasPartidas.Open;
end;

procedure TfrmCapturar_colectas.ibModificarPartidaClick(Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
  edCantidad.SetFocus;
end;

procedure TfrmCapturar_colectas.ibCancelarPartidaClick(Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_colectas.ibEliminarPartidaClick(Sender: TObject);
begin
  inherited;

  if MessageDlg('Borrado permanente',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
    spDEL_COLECTAS_DET.ParamByName('P_ID').AsInteger := qyColectasPartidas.FieldByName('R_ID').AsInteger;
    spDEL_COLECTAS_DET.ExecProc;
    spDEL_COLECTAS_DET.Transaction.CommitRetaining;
    
    spTOTALES_COLECTAS.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
    spTOTALES_COLECTAS.ExecProc;
    spTOTALES_COLECTAS.Transaction.CommitRetaining;
//    reglas.abrir_IBQuery_seek('R_ID',dsFuente.DataSet.FieldByName('ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
    reglas.refresh_IBQuery(qyColectasPartidas);

    fijarBotonesDetalle;
  end;
end;

procedure TfrmCapturar_colectas.itemF7Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_colectas.itemF8Click(Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_colectas.itemF9Click(Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_colectas.itemF10Click(Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas.itemF11Click(Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_colectas.ibImprimirClick(Sender: TObject);
begin
  inherited;
  frmPRN_0006 := TfrmPRN_0006.Crear(Application, edCaja.Tag, edAlmacen.Tag);
  frmPRN_0006.ShowModal;
  frmPRN_0006.Free;
end;

procedure TfrmCapturar_colectas.buLimpiarBancoClick(Sender: TObject);
begin
  inherited;
  cbBancos.KeyValue := null;
end;

procedure TfrmCapturar_colectas.edReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    ibGuardarPartida.Click;
    ibNuevaPartida.Click;
  end;
end;

procedure TfrmCapturar_colectas.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_colectas.buInicioClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas.buAnteriorClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas.buSiguienteClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas.buFinClick(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;

  if (edicionDetalle) then
    ibCancelarPartida.Click;
end;

procedure TfrmCapturar_colectas.edCantidadChange(Sender: TObject);
var
  lCantidad : Double;
  lMonto : Double;
begin
  inherited;
  lCantidad := StrToFloat(edCantidad.Text);
  lMonto := StrToFloat(edMonto.Text);

  laTotal.Caption := FormatFloat('###,###,##0.00', (lCantidad * lMonto));
end;

procedure TfrmCapturar_colectas.buAplicarClick(Sender: TObject);
var
//   autorizar : string;
   ejecutar  : boolean;
begin
  inherited;
  ejecutar := TRUE;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusAnt;
  dsFuente.DataSet.Post;
  if (awrStatus.autorizacion) and (awrStatus.nivel > reglas.dameUsuarioNivel) then
  begin
     try
        Application.CreateForm(TfrmAcceso, frmAcceso);
        frmAcceso.Nivel  := awrStatus.nivel;
        frmAcceso.Status := awrStatus.estatusSel;
        frmAcceso.ShowModal;
        ejecutar := frmAcceso.Rsp;
     finally
        frmAcceso.Free;
     end;
  end;

  if ejecutar then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := awrStatus.storeproc;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     spEstatus.ParamByName('P_ID').AsInteger := awrStatus.idEjecutar;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;

     awrStatus.estatusSel := '';
     reglas.abrir_IBTabla(TCapturar);
     fijarBotonesDetalle;

     if awrStatus.correo then
     begin
        mensajes;
     end;
  end;

{  ejecutar := TRUE;
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
     if TCapturar.MasterSource <> nil then
        reglas.abrir_IBQuery_seek('R_ID',TIBQuery(TDataSource(TCapturar.MasterSource).DataSet).FieldByName('R_ID').AsInteger,TIBQuery(TDataSource(TCapturar.MasterSource).DataSet));
  end;}
end;

procedure TfrmCapturar_colectas.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyEstatus);
end;

procedure TfrmCapturar_colectas.cbEstatusChange(Sender: TObject);
begin
  inherited;
  if (cbEstatus.Text <> '') and (cbEstatus.Text <> awrStatus.EstatusSel) then
  begin
     awrStatus.estatusSel   := dsEstatus.DataSet.FieldByName('R_ESTATUS').AsString;
     awrStatus.autorizacion := dsEstatus.DataSet.FieldByName('R_AUTORIZACION').AsString = 'Si';
     awrStatus.storeproc    := dsEstatus.DataSet.FieldByName('R_STOREPROC').AsString;
     awrStatus.nivel        := dsEstatus.DataSet.FieldByName('R_NIVEL').AsInteger;
     awrStatus.id           := dsEstatus.DataSet.FieldByName('R_ID').AsInteger;
     awrStatus.correo       := dsEstatus.DataSet.FieldByName('R_CORREO').AsString = 'Si';

{     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
}
     dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusSel;

     buAplicar.Enabled        := TRUE;
     ibGuardar.Enabled        := FALSE;
  end;
end;

end.
