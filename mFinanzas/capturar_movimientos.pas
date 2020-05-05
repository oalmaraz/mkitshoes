unit capturar_movimientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
   Grids, DBGrids,  Buttons, System.Variants;

type
  TfrmCapturar_movimientos = class(TfrmCapturarMDI)
    dgMovimientos: TDBGrid;
    Label1: TLabel;
    deFechaAlta: TDBEdit;
    Label10: TLabel;
    cbCondicionComerciales: TDBLookupComboBox;
    cbTipo: TDBComboBox;
    Label2: TLabel;
    Label4: TLabel;
    deReferencia: TDBEdit;
    deMonto: TDBEdit;
    Label6: TLabel;
    Label3: TLabel;
    cbMonedas: TDBLookupComboBox;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    Label18: TLabel;
    cbEstatus: TDBLookupComboBox;
    beAplicar: TEdit;
    TCapturarID: TIntegerField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarCONDICION_COMERCIAL: TIntegerField;
    TCapturarTIPO: TIBStringField;
    TCapturarREFERENCIA: TIBStringField;
    TCapturarMONTO: TFloatField;
    TCapturarMONEDA: TIntegerField;
    TCapturarAUTORIZO: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarESTATUS: TIBStringField;
    deIDReferencia: TDBEdit;
    deTablaReferencia: TDBEdit;
    Label5: TLabel;
    Label7: TLabel;
    ibPantalla: TBitBtn;
    ibPrint: TBitBtn;
    Label8: TLabel;
    qyChequeras: TIBQuery;
    dsChequeras: TDataSource;
    qyMonedas: TIBQuery;
    dsMonedas: TDataSource;
    qyMonedasID: TIntegerField;
    qyMonedasDESCRIPCION: TIBStringField;
    qyCComerciales: TIBQuery;
    dsCComerciales: TDataSource;
    qyCComercialesID: TIntegerField;
    qyCComercialesCLAVE: TIBStringField;
    qyCComercialesNOMBRE: TIBStringField;
    TCapturarSEL: TIBStringField;
    qyChequerasR_ID: TIntegerField;
    qyChequerasR_BANCO: TIntegerField;
    qyChequerasR_BANCO_CLAVE: TIBStringField;
    qyChequerasR_BANCO_NOMBRE: TIBStringField;
    qyChequerasR_CUENTA_DE_CHEQUES: TIBStringField;
    qyChequerasR_FECHA_ULT_CHEQUE_IMP: TDateTimeField;
    qyChequerasR_SALDO: TFloatField;
    qyChequerasR_MONEDA: TIntegerField;
    qyChequerasR_MONEDA_CLAVE: TIBStringField;
    qyChequerasR_MONEDA_DESCRIPCION: TIBStringField;
    qyChequerasR_FOLIO_CHEQUE_INICIAL: TIBStringField;
    qyChequerasR_REPORTE_CHEQUES: TIBStringField;
    qyChequerasR_REPORTE_DEPOSITOS: TIBStringField;
    qyChequerasR_IMPRESORANOM: TIBStringField;
    qyChequerasR_IMPRESORAVAL: TIBStringField;
    qyChequerasR_ESCMODEL: TIBStringField;
    dxDBExtLookupEdit1: TDBLookupComboBox;
    TCapturarmoneda_descripcion: TStringField;
    spEstatus: TIBStoredProc;
    qySumas: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure dgMovimientosDblClick(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure cbEstatusClick(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibPantallaClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure dgMovimientosColumn4DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure dgMovimientosColumn1DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure ibPrintClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_movimientos: TfrmCapturar_movimientos;

implementation

uses IBModulo, reglas_de_negocios, IBData, autorizacion,
  capturar_mov_sin_clasificar_movimientos, PRN_0020_MOV_SC;

{$R *.DFM}

procedure TfrmCapturar_movimientos.FormCreate(Sender: TObject);
begin
//  reglas.abrir_IBTabla(dmIBData.TFiltroBancos);
  reglas.abrir_IBTabla(dmIBData.TFiltroMonedas);
//  reglas.abrir_IBTabla(dmIBData.TFiltroChequeras);
//  reglas.refresh_IBQuery(qyBancos);
  reglas.refresh_IBQuery(qyChequeras);
  reglas.refresh_IBQuery(qyMonedas);
  reglas.refresh_IBQuery(qyCComerciales);
  reglas.refresh_IBQuery(qySumas);
  inherited;
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
end;

procedure TfrmCapturar_movimientos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := reglas.dame_fecha;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString      := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('TIPO').AsString         := 'Sin Clasificar';
  dsFuente.DataSet.FieldByName('SEL').AsString          := 'No';
  dsFuente.DataSet.FieldByName('MONTO').AsFloat         := 0.00;
  cbTipo.SetFocus;
end;

procedure TfrmCapturar_movimientos.ibModificarClick(Sender: TObject);
begin
  inherited;
  cbTipo.SetFocus;
end;

procedure TfrmCapturar_movimientos.dgMovimientosDblClick(Sender: TObject);
begin
  inherited;
  if not(dsFuente.DataSet.IsEmpty) then
  begin
     try
        dsFuente.DataSet.DisableControls;
        dsFuente.DataSet.Edit;
        if dsFuente.DataSet.FieldByName('SEL').AsString = 'Si' then
           dsFuente.DataSet.FieldByName('SEL').AsString := 'No'
        else
           dsFuente.DataSet.FieldByName('SEL').AsString := 'Si';
        dsFuente.DataSet.Post;
     finally
        dsFuente.DataSet.EnableControls;
     end;
  end;
end;


procedure TfrmCapturar_movimientos.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  //descripcion de la moneda
  if DataSet.FieldByName('MONEDA').AsString <> '' then
  begin
     dmIBData.TFiltroMonedas.Filter := 'ID = '+DataSet.FieldByName('MONEDA').AsString;
     DataSet.FieldByName('MONEDA_DESCRIPCION').AsString := dmIBData.TFiltroMonedas.FieldByName('DESCRIPCION').AsString;
  end
  else
     DataSet.FieldByName('MONEDA_DESCRIPCION').AsString := '';
end;

procedure TfrmCapturar_movimientos.cbEstatusClick(Sender: TObject);
begin
  inherited;
  if dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString <> '' then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := dsEstatusProcesosDetalle.DataSet.FieldByName('STOREPROC').AsString;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     spEstatus.Params.CreateParam(ftInteger,'P_CHEQUERA',ptInput);
     beAplicar.Enabled        := TRUE;
  end;
end;

procedure TfrmCapturar_movimientos.beAplicarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   autorizar : string;
   ejecutar  : boolean;
   autorizo  : integer;
begin
  inherited;
  if dsFuente.DataSet.State in [dsEdit, dsInsert] then
     dsFuente.DataSet.Post;
  ejecutar := TRUE;
  autorizar := dsEstatusProcesosDetalle.DataSet.FieldByName('AUTORIZACION').AsString;
  if autorizar = 'Si' then
  begin
     frmAutorizacion := TfrmAutorizacion.Crear(Application, 2);
     frmAutorizacion.ShowModal;
     ejecutar := frmAutorizacion.dame_respuesta;
     frmAutorizacion.Free;
     autorizo := dmIBData.TFiltroUsuariosAutorizacion.FieldByName('ID').AsInteger;
  end
  else
     autorizo := reglas.dame_usuario;
  if ejecutar then
  begin
     spEstatus.ParamByName('P_ID').AsInteger       := autorizo;
     spEstatus.ParamByName('P_CHEQUERA').AsInteger := dsChequeras.DataSet.FieldByName('R_ID').AsInteger;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;
     reglas.abrir_IBTabla(TCapturar);
     cbEstatus.KeyValue := null;
     beAplicar.Enabled  := false;
  end;
end;

procedure TfrmCapturar_movimientos.ibPantallaClick(Sender: TObject);
begin
  inherited;
  frmCapturar_movSinClasificarMovimientos := TfrmCapturar_movSinClasificarMovimientos.Create(Application);
  frmCapturar_movSinClasificarMovimientos.ShowModal;
  frmCapturar_movSinClasificarMovimientos.Free;
  reglas.abrir_IBTabla(TCapturar);                
  reglas.refresh_IBQuery(qySumas);
end;

procedure TfrmCapturar_movimientos.ibImprimirClick(Sender: TObject);
begin
  inherited;
  {
  cpPrint := TdxComponentPrinter.Create(Application);
  cpPrint.OnBeforePreview := BeforePreview;
  cpPrint.AddLink(dgMovimientos);
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Name  := 'Arial';
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Size  := 14;
//  cpPrint.CurrentLink := cpImpresion.ReportLink[0];

  cpPrint.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Add(fpPadre.Title);
  cpPrint.ReportLink[0].ShrinkToPageWidth := true;
  cpPrint.Preview(True, nil);
  cpPrint.Free;
  dgMovimientos.OptionsDB := [edgoCancelOnExit,edgoCanDelete,edgoCanInsert,edgoCanNavigation,edgoConfirmDelete,edgoUseBookmarks];
  }
end;

procedure TfrmCapturar_movimientos.dgMovimientosColumn4DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := 'Sum = '+FormatFloat('$ ###,###,##0.00',qySumas.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmCapturar_movimientos.dgMovimientosColumn1DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := 'Rec = '+FormatFloat('###,###,##0',qySumas.FieldByName('COUNTREC').AsFloat);
end;

procedure TfrmCapturar_movimientos.ibPrintClick(Sender: TObject);
begin
  inherited;
  frmPRN_0020 := TfrmPRN_0020.Create(Application);
  frmPRN_0020.ShowModal;
  frmPRN_0020.Free;
end;

procedure TfrmCapturar_movimientos.buInicioClick(Sender: TObject);
begin
  inherited;
  dgMovimientos.dataSource.DataSet.First;
end;

procedure TfrmCapturar_movimientos.buAnteriorClick(Sender: TObject);
begin
  inherited;
  dgMovimientos.dataSource.DataSet.Prior;
end;

procedure TfrmCapturar_movimientos.buSiguienteClick(Sender: TObject);
begin
  inherited;
  dgMovimientos.dataSource.DataSet.Next;
end;

procedure TfrmCapturar_movimientos.buFinClick(Sender: TObject);
begin
  inherited;
  dgMovimientos.dataSource.DataSet.Last;
end;

end.
