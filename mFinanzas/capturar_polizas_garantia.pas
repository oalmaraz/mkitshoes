unit capturar_polizas_garantia;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls,    jpeg,
   ExtCtrls,   Menus, Buttons, Grids, DBGrids;

type
  TfrmCapturar_polizas_garantia = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_FIN: TDateTimeField;
    TCapturarFOLIO: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarOBSERVACION: TBlobField;
    TCapturarDESCUENTO: TFloatField;
    TCapturarMONTO: TFloatField;
    TCapturarESTATUS: TIBStringField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    TCapturarDIAS: TIntegerField;
    Label2: TLabel;
    deFolio: TDBEdit;
    deFechaAlta: TDBEdit;
    deFVencimiento: TDBEdit;
    Label15: TLabel;
    deClave: TDBEdit;
    Label7: TLabel;
    Label5: TLabel;
    deObservaciones: TDBMemo;
    beAplicar: TEdit;
    Label3: TLabel;
    deCliente: TDBEdit;
    deTelefono: TDBEdit;
    Label6: TLabel;
    Label24: TLabel;
    deMonto: TDBEdit;
    Label1: TLabel;
    deDescuento: TDBEdit;
    Label4: TLabel;
    deDias: TDBEdit;
    TCapturarTELEFONO: TIBStringField;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    spEstatus: TIBStoredProc;
    Label18: TLabel;
    cbEstatus: TDBLookupComboBox;
    TCapturarLICENCIAS: TIntegerField;
    deLicencias: TDBEdit;
    Label8: TLabel;
    paPartidas: TPanel;
    Label86: TLabel;
    fcImager9: TImage;
    edReferencia: TEdit;
    buF7P: TBitBtn;
    buF8P: TBitBtn;
    buF9P: TBitBtn;
    buF10P: TBitBtn;
    buF11P: TBitBtn;
    dgPartidas: TDBGrid;
    Label9: TLabel;
    cbTipo: TDBComboBox;
    edGen1: TEdit;
    Label11: TLabel;
    edGen2: TEdit;
    Label12: TLabel;
    edGen3: TEdit;
    Label13: TLabel;
    edGen4: TEdit;
    Label10: TLabel;
    Label14: TLabel;
    edAct1: TEdit;
    Label16: TLabel;
    edAct2: TEdit;
    Label17: TLabel;
    edAct3: TEdit;
    Label19: TLabel;
    edAct4: TEdit;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_MAQUINA: TIBStringField;
    qyPartidasR_LICENCIA: TIBStringField;
    qyPartidasR_REFERENCIA: TIBStringField;
    qyPartidasR_ESTATUS: TIBStringField;
    ppItems: TPopupMenu;
    itemF7: TMenuItem;
    itemF8: TMenuItem;
    itemF9: TMenuItem;
    itemF10: TMenuItem;
    itemF11: TMenuItem;
    paEnc: TPanel;
    TCapturarTIPO: TIBStringField;
    spA_POLIZAS_LICENCIAS: TIBStoredProc;
    Label20: TLabel;
    spM_POLIZAS_LICENCIAS: TIBStoredProc;
    cbStatus: TDBComboBox;
    procedure ibNuevoClick(Sender: TObject);
    procedure deDiasChange(Sender: TObject);
    procedure deClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure deClienteKeyPress(Sender: TObject; var Key: Char);
    procedure ibModificarClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure cbEstatusChange(Sender: TObject);
    procedure deFVencimientoChange(Sender: TObject);
    procedure deFechaAltaEnter(Sender: TObject);
    procedure deFVencimientoEnter(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure buF7PClick(Sender: TObject);
    procedure buF8PClick(Sender: TObject);
    procedure buF9PClick(Sender: TObject);
    procedure buF10PClick(Sender: TObject);
    procedure buF11PClick(Sender: TObject);
  private
    { Private declarations }
    estatus : string;
    edicion : boolean;
    procedure fijarBotones;overload;
    procedure fijarBotones(valor : boolean);overload;
  public
    { Public declarations }
  end;

var
  frmCapturar_polizas_garantia: TfrmCapturar_polizas_garantia;

implementation

uses IBModulo, explorar_polizas_garantia, IBData, UfrmSeleccionarCliente,
  autorizacion, reglas_de_negocios, UPRN_0038;

{$R *.DFM}

procedure TfrmCapturar_polizas_garantia.fijarBotones;
begin
   buF7P.Enabled     := not edicion;
   buF8P.Enabled     := not edicion and not(dsPartidas.DataSet.IsEmpty);
   buF9P.Enabled     := edicion;
   buF10P.Enabled    := edicion;
   buF11P.Enabled    := not edicion and not(dsPartidas.DataSet.IsEmpty);
   dgPartidas.Enabled := not edicion;

   itemF7.Enabled  := buF7P.Enabled;
   itemF8.Enabled  := buF8P.Enabled;
   itemF9.Enabled  := buF9P.Enabled;
   itemF10.Enabled := buF10P.Enabled;
   itemF11.Enabled := buF11P.Enabled;

   if edicion then
      paPartidas.Height := 150
   else
      paPartidas.Height := 52;
end;

procedure TfrmCapturar_polizas_garantia.fijarBotones(valor : boolean);
begin
   edicion := valor;
   fijarBotones;
end;

procedure TfrmCapturar_polizas_garantia.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('FECHA_FIN').AsDateTime  := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString      := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('FOLIO').AsInteger       := 0;
  dsFuente.DataSet.FieldByName('DIAS').AsInteger        := 0;
  dsFuente.DataSet.FieldByName('MONTO').AsFloat         := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO').AsFloat     := 0;
  dsFuente.DataSet.FieldByName('CLIENTE').AsInteger     := -3;
  dsFuente.DataSet.FieldByName('NOMBRE').AsString       := '<FALTA>';
  dsFuente.DataSet.FieldByName('TIPO').AsString         := 'Concurrente';
  dsFuente.DataSet.FieldByName('LICENCIAS').AsInteger   := 0;
  deDias.SetFocus;
end;

procedure TfrmCapturar_polizas_garantia.deDiasChange(Sender: TObject);
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
  begin
     dsFuente.DataSet.FieldByName('FECHA_FIN').AsDateTime := StrToDateTime(deFechaAlta.Text) + StrToFloat(deDias.Text);
  end;
end;

procedure TfrmCapturar_polizas_garantia.deClienteButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
   procedure repetido;
   begin
      deCliente.Text := frmSeleccionarCliente.NOMBRE;
      //deCliente.SetSelection(Length(deCliente.Text),Length(deCliente.Text),false);
      //complemento
      dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := frmSeleccionarCliente.ID;
      dsFuente.DataSet.FieldByName('NOMBRE').AsString   := frmSeleccionarCliente.NOMBRE;
      dsFuente.DataSet.FieldByName('TELEFONO').AsString := frmSeleccionarCliente.TELEFONO;
   end;
begin
  inherited;
   case AbsoluteIndex of
     0: begin
           frmSeleccionarCliente             := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := TCapturar.Database;
           frmSeleccionarCliente.TRANSACTION := TCapturar.Transaction;
           frmSeleccionarCliente.CLAVE       := deCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 repetido;
              end;
           end
           else
              begin
                repetido;
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
        end;
     1: begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant            := -3;
           dsFuente.DataSet.FieldByName('NOMBRE').AsString              := '';
           dsFuente.DataSet.FieldByName('TELEFONO').AsString            := '';
        end;
   end;
end;

procedure TfrmCapturar_polizas_garantia.deClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     deClienteButtonClick(Sender, 0);
end;

procedure TfrmCapturar_polizas_garantia.ibModificarClick(Sender: TObject);
begin
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  deDias.SetFocus;
end;

procedure TfrmCapturar_polizas_garantia.beAplicarButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
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
  end;
end;

procedure TfrmCapturar_polizas_garantia.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
end;

procedure TfrmCapturar_polizas_garantia.cbEstatusChange(Sender: TObject);
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

procedure TfrmCapturar_polizas_garantia.deFVencimientoChange(
  Sender: TObject);
var
   tmp  : Extended;
   entI : integer;
   entC : string;
   lFechaVencimiento, lFechaAlta : TDateTime;
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
  begin
     lFechaVencimiento :=  StrToDateTime(deFVencimiento.Text);
     lFechaAlta        :=  StrToDateTime(deFechaAlta.Text);
     tmp  := lFechaVencimiento - lFechaAlta;
     entC := FormatFloat('########0',tmp);
     entI := StrToInt(entC);
     dsFuente.DataSet.FieldByName('DIAS').AsInteger := entI;
  end;
end;

procedure TfrmCapturar_polizas_garantia.deFechaAltaEnter(Sender: TObject);
begin
  inherited;
  deFechaAlta.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime));
end;

procedure TfrmCapturar_polizas_garantia.deFVencimientoEnter(
  Sender: TObject);
begin
  inherited;
  deFVencimiento.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_FIN').AsDateTime));
end;

procedure TfrmCapturar_polizas_garantia.ibGuardarClick(Sender: TObject);
var
   fraccion   : Real;
   entero     : Real;
   lFechaAlta, lFechaVencimiento : TDateTime;
begin
   lFechaAlta := StrToDateTime(deFechaAlta.Text);
   entero   := Int(lFechaAlta);
   fraccion := Frac(lFechaAlta);
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := lFechaAlta + time;
   end;
   lFechaVencimiento :=  StrToDateTime(deFVencimiento.Text);
   entero   := Int(lFechaVencimiento);
   fraccion := Frac(lFechaVencimiento);
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_FIN').AsDateTime := lFechaVencimiento + time;
   end;
  inherited;
end;

procedure TfrmCapturar_polizas_garantia.ibImprimirClick(Sender: TObject);
begin
  inherited;
   PRN_0038       := TPRN_0038.Create(Application);
   PRN_0038.ID    := dsFuente.DataSet.FieldByName('ID').AsInteger;
   PRN_0038.PEDIR := true;
   PRN_0038.LoadReporte;
   PRN_0038.imprimir;
   PRN_0038.Destroy;
   //refresh a los datos despues de la impresion
   reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_polizas_garantia.TCapturarAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_polizas_garantia.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buInicioClick(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buAnteriorClick(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buSiguienteClick(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buFinClick(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buF7PClick(Sender: TObject);
begin
  inherited;
  paPartidas.Tag := 0;

  edGen1.Clear;
  edGen2.Clear;
  edGen3.Clear;
  edGen4.Clear;
  cbStatus.Text    := 'En Operacion';
  cbStatus.Enabled := false;
  edAct1.Clear;
  edAct2.Clear;
  edAct3.Clear;
  edAct4.Clear;
  edReferencia.Clear;

  edGen1.SetFocus;

  fijarBotones(true);
end;

procedure TfrmCapturar_polizas_garantia.buF8PClick(Sender: TObject);
begin
  inherited;
  paPartidas.Tag    := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
  edGen1.Text       := copy(dsPartidas.DataSet.FieldByName('R_MAQUINA').AsString,1, 4);
  edGen2.Text       := copy(dsPartidas.DataSet.FieldByName('R_MAQUINA').AsString,5, 4);
  edGen3.Text       := copy(dsPartidas.DataSet.FieldByName('R_MAQUINA').AsString,9, 4);
  edGen4.Text       := copy(dsPartidas.DataSet.FieldByName('R_MAQUINA').AsString,13,4);
  cbStatus.Text     := dsPartidas.DataSet.FieldByName('R_ESTATUS').AsString;
  cbStatus.Enabled  := true;
  edAct1.Text       := copy(dsPartidas.DataSet.FieldByName('R_LICENCIA').AsString,1, 4);
  edAct2.Text       := copy(dsPartidas.DataSet.FieldByName('R_LICENCIA').AsString,5, 4);
  edAct3.Text       := copy(dsPartidas.DataSet.FieldByName('R_LICENCIA').AsString,9, 4);
  edAct4.Text       := copy(dsPartidas.DataSet.FieldByName('R_LICENCIA').AsString,13,4);
  edReferencia.Text := dsPartidas.DataSet.FieldByName('R_REFERENCIA').AsString;

  edGen1.SetFocus;
  fijarBotones(true);
end;

procedure TfrmCapturar_polizas_garantia.buF9PClick(Sender: TObject);
var
   seek : integer;
begin
  inherited;
   if paPartidas.Tag = 0 then //nuevo registro
   begin
      spA_POLIZAS_LICENCIAS.ParamByName('P_LINK').AsInteger      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      spA_POLIZAS_LICENCIAS.ParamByName('P_MAQUINA').AsString    := edGen1.Text + edGen2.Text + edGen3.Text + edGen4.Text;
      spA_POLIZAS_LICENCIAS.ParamByName('P_LICENCIA').AsString   := edAct1.Text + edAct2.Text + edAct3.Text + edAct4.Text;
      spA_POLIZAS_LICENCIAS.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
      spA_POLIZAS_LICENCIAS.ExecProc;
      spA_POLIZAS_LICENCIAS.Transaction.CommitRetaining;
      seek := spA_POLIZAS_LICENCIAS.ParamByName('R_ID').AsInteger;
   end
   else
      begin
         spM_POLIZAS_LICENCIAS.ParamByName('P_ID').AsInteger        := paPartidas.Tag;
         spM_POLIZAS_LICENCIAS.ParamByName('P_MAQUINA').AsString    := edGen1.Text + edGen2.Text + edGen3.Text + edGen4.Text;
         spM_POLIZAS_LICENCIAS.ParamByName('P_LICENCIA').AsString   := edAct1.Text + edAct2.Text + edAct3.Text + edAct4.Text;
         spM_POLIZAS_LICENCIAS.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
         spM_POLIZAS_LICENCIAS.ParamByName('P_ESTATUS').AsString    := cbStatus.Text;
         spM_POLIZAS_LICENCIAS.ExecProc;
         spM_POLIZAS_LICENCIAS.Transaction.CommitRetaining;
         seek := spA_POLIZAS_LICENCIAS.ParamByName('R_ID').AsInteger;
      end;

   reglas.abrir_IBQuery_seek('R_ID', seek, qyPartidas);
   fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buF10PClick(Sender: TObject);
begin
  inherited;
  fijarBotones(false);
end;

procedure TfrmCapturar_polizas_garantia.buF11PClick(Sender: TObject);
begin
  inherited;
{  meErrorEliminar.Execute;
  if meErrorEliminar.Respuesta then
  begin
     qyDelPresentacion.ParamByName('P_ID').AsInteger := dsPartidasPresentaciones.DataSet.FieldByName('R_ID').AsInteger;
     qyDelPresentacion.ExecSQL;
     qyDelPresentacion.Transaction.CommitRetaining;

     reglas.refresh_IBQuery(qyPartidasPresentaciones);
     fijarBotonesP(false);
  end;}
end;

end.
