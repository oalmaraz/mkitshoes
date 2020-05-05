unit capturar_desempaques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturar_procesos, Menus, Db,  Grids, DBGrids,   
  IBX.IBCustomDataSet, IBX.IBQuery, Mask, ExtCtrls, StdCtrls, Buttons, DBCtrls,
  IBX.IBStoredProc, IBX.IBTable;

type
  TfrmCapturar_desempaques = class(TfrmCapturar_procesos)
    TCapturarID: TIntegerField;
    TCapturarORDEN_COMPRA: TIntegerField;
    TCapturarFECHA_RECEPCION: TDateTimeField;
    TCapturarCONDUCTOR: TIBStringField;
    TCapturarPLACAS: TIBStringField;
    TCapturarFACTURA_PROVEEDOR: TIBStringField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarESTATUS: TIBStringField;
    leOrdenes_de_compras: TDBLookupComboBox;
    deFechaRecepcion: TDBEdit;
    deConductor: TDBEdit;
    dePlacas: TDBEdit;
    deFacturaProveedor: TDBEdit;
    dmObservaciones: TDBMemo;
    laOC_Clave: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qyOrdenes_de_Compras: TIBQuery;
    dsOrdenes_de_Compras: TDataSource;
    qyOrdenes_de_ComprasR_ID: TIntegerField;
    qyOrdenes_de_ComprasR_CLAVE: TIBStringField;
    qyOrdenes_de_ComprasR_PROVEEDOR: TIBStringField;
    qyOrdenes_de_ComprasR_FECHA_ENTREGA: TDateTimeField;
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    dgPartidas: TDBGrid;
    dsDetalle: TDataSource;
    TDetalle: TIBTable;
    TDetalleID: TIntegerField;
    TDetalleDESEMPAQUE: TIntegerField;
    TDetalleMATERIAL: TIntegerField;
    TDetalleFECHA_CADUCIDAD: TDateTimeField;
    TDetalleCANTIDAD: TFloatField;
    TDetalleUNIDAD: TIntegerField;
    TDetalleLOTE: TIBStringField;
    TDetalleSERIE: TIBStringField;
    dsMateriales_Unidades: TDataSource;
    spIDDetalle: TIBStoredProc;
    qyPartidas: TIBQuery;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_DESEMPAQUE: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_FECHA_CADUCIDAD: TDateTimeField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_LOTE: TIBStringField;
    qyPartidasR_SERIE: TIBStringField;
    qyPartidasR_PEDIMENTO: TIBStringField;
    qyPartidasR_PEDIMENTO_FECHA: TDateTimeField;
    dsPartidas: TDataSource;
    paCaptura: TPanel;
    Label20: TLabel;
    Label8: TLabel;
    deLote: TDBEdit;
    deSerie: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    qyCiudades: TIBQuery;
    dsCiudades: TDataSource;
    qyCiudadesR_ID: TIntegerField;
    qyCiudadesR_DESCRIPCION: TIBStringField;
    TDetalleID_OC_DETALLE: TIntegerField;
    TDetalleCANTIDAD_CONTADA: TFloatField;
    TDetallePEDIMENTO: TIBStringField;
    TDetallePEDIMENTO_FECHA: TDateTimeField;
    qyPartidasR_CANTIDAD_CONTADA: TFloatField;
    TCapturarAUTORIZO: TIntegerField;
    laAutorizado: TLabel;
    edOC_CLAVE: TDBEdit;
    TCapturarclave_orden_de_compra: TStringField;
    qyPartidasR_TIPO_INVENTARIO: TIBStringField;
    ibExpander: TBitBtn;
    ibColapsar: TBitBtn;
    qyPartidasR_UNIDAD_CLAVE: TIBStringField;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    TDetalleMEDIDA: TIntegerField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    paMateriales: TPanel;
    qyMateriales_Unidades: TIBQuery;
    qyMateriales_UnidadesR_ID: TIntegerField;
    qyMateriales_UnidadesR_MATERIAL: TIntegerField;
    qyMateriales_UnidadesR_UNIDAD: TIntegerField;
    qyMateriales_UnidadesR_CLAVE: TIBStringField;
    qyMateriales_UnidadesR_DESCRIPCION: TIBStringField;
    qyMateriales_UnidadesR_FACTOR: TFloatField;
    dsMateriales_Medidas: TDataSource;
    qyMateriales_Medidas: TIBQuery;
    qyMateriales_MedidasR_ID: TIntegerField;
    qyMateriales_MedidasR_ID_MEDIDA: TIntegerField;
    qyMateriales_MedidasR_DESCRIPCION: TIBStringField;
    qyMateriales_MedidasR_CODIGO_BARRAS: TIBStringField;
    dePedimento: TDBEdit;
    paMaterial: TPanel;
    paUnidades: TPanel;
    paCantidad: TPanel;
    Label17: TLabel;
    ceCantidad: TDBEdit;
    Label21: TLabel;
    cbUnidades: TDBLookupComboBox;
    sbRefreshUnidades: TSpeedButton;
    cbFechaCaducidad: TDBEdit;
    Label16: TLabel;
    Label9: TLabel;
    edClave: TEdit;
    qyIBXMateriales: TIBQuery;
    qyIBXMaterialesID: TIntegerField;
    qyIBXMaterialesCLAVE: TIBStringField;
    qyIBXMaterialesDESCRIPCION: TIBStringField;
    qyIBXMaterialesUNIDAD_BASE: TIntegerField;
    qyIBXMaterialesLINEA: TIntegerField;
    qyIBXMaterialesUNIDADES_COMPRADAS: TFloatField;
    qyIBXMaterialesUNIDADES_VENDIDAS: TFloatField;
    qyIBXMaterialesUNIDADES_PRODUCIDAS: TFloatField;
    qyIBXMaterialesLARGO: TFloatField;
    qyIBXMaterialesANCHO: TFloatField;
    qyIBXMaterialesALTO: TFloatField;
    qyIBXMaterialesUNIDAD_LAA: TIntegerField;
    qyIBXMaterialesLOTE: TIBStringField;
    qyIBXMaterialesNUM_SERIE: TIBStringField;
    qyIBXMaterialesCONSOLIDADO: TIBStringField;
    qyIBXMaterialesCOSTO_PROMEDIO: TIBStringField;
    qyIBXMaterialesCOSTO_PEPS: TIBStringField;
    qyIBXMaterialesCOSTO_UEPS: TIBStringField;
    qyIBXMaterialesFECHA_CERO_EXIST: TDateTimeField;
    qyIBXMaterialesFECHA_ULTIMA_COMPRA: TDateTimeField;
    qyIBXMaterialesCODIGO_BARRAS: TIBStringField;
    qyIBXMaterialesIVA_PORC: TFloatField;
    qyIBXMaterialesIEPS_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_1_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_2_PORC: TFloatField;
    qyIBXMaterialesOBSERVACIONES: TBlobField;
    qyIBXMaterialesFOTO: TBlobField;
    qyIBXMaterialesDIAS_DE_VIGENCIA: TIntegerField;
    qyIBXMaterialesCOSTO_ULT_COMPRA: TFloatField;
    qyIBXMaterialesNUM_ETIQUETAS: TIntegerField;
    qyIBXMaterialesACTIVO_FIJO: TIBStringField;
    qyIBXMaterialesCALIDAD: TIntegerField;
    dsMateriales: TDataSource;
    dsColores: TDataSource;
    qyColores: TIBQuery;
    qyColoresID: TIntegerField;
    qyColoresNOMBRE: TIBStringField;
    paMateriales2: TPanel;
    paDescripcion: TPanel;
    Label22: TLabel;
    edDescripcion: TEdit;
    paColores: TPanel;
    Label14: TLabel;
    sbRefreshColores: TSpeedButton;
    cbColores: TDBLookupComboBox;
    paMedidas: TPanel;
    Label23: TLabel;
    sbRefreshMedidas: TSpeedButton;
    cbMedidas: TDBLookupComboBox;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    TDetalleCOLOR: TIntegerField;
    qyPartidasR_ADUANA_CLAVE: TIBStringField;
    qyPartidasR_ADUANA_SECCION: TIBStringField;
    qyPartidasR_ADUANA_NOMBRE: TIBStringField;
    TIBXAduanas: TIBTable;
    dsAduanas: TDataSource;
    cbAduanas: TDBLookupComboBox;
    sbRefreshAlmOrigen: TSpeedButton;
    TIBXAduanasID: TIntegerField;
    TIBXAduanasCLAVE: TIBStringField;
    TIBXAduanasNUM_SECCION: TIBStringField;
    TIBXAduanasNOMBRE: TIBStringField;
    TIBXAduanasENTIDAD_GEOGRAFICA: TIntegerField;
    qyPartidasR_ADUANA: TIntegerField;
    TDetalleADUANA: TIntegerField;
    cbFechaPedimento: TDBEdit;
    cbEstatus: TDBLookupComboBox;
    edEstatus: TDBEdit;
    buAplicar: TBitBtn;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    qyOrdenes_de_ComprasR_FOLIO: TIntegerField;
    TCapturaroc_folio: TIntegerField;
    TCapturaroc_id: TIntegerField;
    edOC_ID: TDBEdit;
    laOC: TLabel;
    edOC_FOLIO: TDBEdit;
    laOC_Folio: TLabel;
    TCapturaroc_folio_: TIntegerField;
    buSeries: TBitBtn;
    spP_SERIES: TIBStoredProc;
    buImpresion: TBitBtn;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    itemPreview: TMenuItem;
    TCapturarUSUARIO: TIntegerField;
    TCapturarCONSECUTIVO: TIntegerField;
    deFolio: TDBEdit;
    TCapturaroc_almacen: TIntegerField;
    TCapturaroc_almacen_c: TStringField;
    TCapturaroc_almacen_n: TStringField;
    Label1: TLabel;
    edOC_Almacen: TDBEdit;
    procedure ibNuevoClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure dsDetalleDataChange(Sender: TObject; Field: TField);
    procedure paCapturaEnter(Sender: TObject);
    procedure ceCantidadKeyPress(Sender: TObject; var Key: Char);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure ibCandadoClick(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure ibColapsarClick(Sender: TObject);
    procedure ibExpanderClick(Sender: TObject);
    procedure dgPartidasHeaderButtonClick(Sender: TObject);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure deSerieKeyPress(Sender: TObject; var Key: Char);
    procedure dePedimentoKeyPress(Sender: TObject; var Key: Char);
    procedure deLoteKeyPress(Sender: TObject; var Key: Char);
    procedure edClaveButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edClaveKeyPress(Sender: TObject; var Key: Char);
    procedure sbRefreshMedidasClick(Sender: TObject);
    procedure sbRefreshColoresClick(Sender: TObject);
    procedure paMaterialesEnter(Sender: TObject);
    procedure sbRefreshAlmOrigenClick(Sender: TObject);
    procedure cbFechaCaducidadEnter(Sender: TObject);
    procedure cbFechaPedimentoEnter(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure buAplicarClick(Sender: TObject);
    procedure cbEstatusChange(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure deFechaRecepcionEnter(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure buSeriesClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
  private
    { Private declarations }
    iva_porc  : double;
    ieps_porc : double;
    impuesto1_porc : double;
    impuesto2_porc : double;
    boton          : boolean;//<-cuando se modifica que el componente dxLookupEdit no quiete el valor asignado
    awrActivarFA   : boolean; //Activar Fecha Alta
    procedure Material(id : integer);
    procedure ExplorarGrid;
    procedure verfificarFechas;
  public
    { Public declarations }
  end;

var
  frmCapturar_desempaques: TfrmCapturar_desempaques;

implementation

uses IBModulo, IBData, reglas_de_negocios,
  explorar_desempaques, seleccionar_material,
  UfrmAltaRapidaMateriales, UfrmAcceso, U0002_PR;

{$R *.DFM}

procedure TfrmCapturar_desempaques.verfificarFechas;
var
   fraccion   : Real;
   entero     : Real;
begin
   //validacion fecha alta
   if deFechaRecepcion.Focused then
      deConductor.SetFocus;
   entero   := Int(StrToDateTime(deFechaRecepcion.Text));
   fraccion := Frac(StrToDateTime(deFechaRecepcion.Text));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('FECHA_RECEPCION').AsDateTime := StrToDateTime(deFechaRecepcion.Text) + time;
   end;
end;

procedure TfrmCapturar_desempaques.ExplorarGrid;
begin
   reglas.refresh_IBQuery(qyPartidas);
  // dgPartidas.FullExpand;
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_desempaques.Material(id : integer);
begin
   qyMateriales_Unidades.Close;
   qyMateriales_Unidades.ParamByName('P_MATERIAL').AsInteger := id;
   qyMateriales_Unidades.Open;

   qyMateriales_Medidas.Close;
   qyMateriales_Medidas.ParamByName('P_MATERIAL').AsInteger := id;
   qyMateriales_Medidas.Open;
end;

procedure TfrmCapturar_desempaques.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_RECEPCION').AsDateTime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString           := 'Sin Afectar';
  leOrdenes_de_compras.SetFocus;
end;

procedure TfrmCapturar_desempaques.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     buAplicar.Enabled            := false;
     paLienzo2.Visible            :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     leOrdenes_de_compras.Visible := (dsDetalle.DataSet.IsEmpty and (TDataSource(sender).DataSet.State = dsEdit)) or (TDataSource(sender).DataSet.State = dsInsert);
     edOC_ID.Visible              := not(leOrdenes_de_compras.Visible);
     edOC_FOLIO.Visible           := not(leOrdenes_de_compras.Visible);
     edOC_CLAVE.Visible           := not(leOrdenes_de_compras.Visible);
     laOC_Folio.Visible           := not(leOrdenes_de_compras.Visible);
     laOC_Clave.Visible           := not(leOrdenes_de_compras.Visible);
     ibEliminar.Enabled           := ibEliminar.Enabled and (TDataSource(sender).DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     laAutorizado.Visible         := TDataSource(sender).DataSet.FieldByName('AUTORIZO').AsString <> '';
     deFechaRecepcion.Enabled     :=(dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') and awrActivarFA;

     if leOrdenes_de_compras.Visible then
        laOC.Caption := 'Orden de Compra'
     else
        laOC.Caption := 'O.C. Id.';
  end;
end;

procedure TfrmCapturar_desempaques.ibModificarClick(Sender: TObject);
begin
  inherited;
  if leOrdenes_de_compras.Visible then
     leOrdenes_de_compras.SetFocus
  else
     deConductor.SetFocus;
end;

procedure TfrmCapturar_desempaques.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroMateriales);
  reglas.abrir_IBTabla(dmIBData.TFiltroOrdenesDeCompras);
  reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
  reglas.refresh_IBQuery(qyOrdenes_de_Compras);
  inherited;
  setLogica('AND');
  ExplorarGrid;
  reglas.abrir_IBTabla(TDetalle);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);

  //Activar Medidas
  dmIBData.TPreferencias.Filter := 'ID = 66';
  paMedidas.Visible        := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  //dgPartidasMedida.Visible := paMedidas.Visible;
  //Activar colores
  dmIBData.TPreferencias.Filter := 'ID = 69';
  paColores.Visible         := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI') and paMedidas.Visible;
  //dgPartidasColores.Visible := paColores.Visible;
  //Activar Fecha de Alta
  dmIBData.TPreferencias.Filter := 'ID = 341';
  awrActivarFA := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI');
end;

procedure TfrmCapturar_desempaques.ibGuardarPartidaClick(Sender: TObject);
var
   id_detalle : integer;
   indice     : integer;
   fraccion   : Real;
   entero     : Real;
begin
   inherited;
   if cbFechaPedimento.Focused then
      dePedimento.SetFocus;
   entero   := Int(StrToDateTime(cbFechaPedimento.Text));
   fraccion := Frac(StrToDateTime(cbFechaPedimento.Text));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsDetalle.DataSet.FieldByName('PEDIMENTO_FECHA').AsDateTime := StrToDateTime(cbFechaPedimento.Text )+ time;
   end;

   if cbFechaCaducidad.Focused then
      cbUnidades.SetFocus;
   entero   := Int(StrToDateTime(cbFechaCaducidad.Text));
   fraccion := Frac(StrToDateTime(cbFechaCaducidad.Text));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsDetalle.DataSet.FieldByName('FECHA_CADUCIDAD').AsDateTime :=StrToDateTime( cbFechaCaducidad.Text) + time;
   end;

   if paMedidas.Visible then
      dsDetalle.DataSet.FieldByName('MEDIDA').AsInteger := cbMedidas.KeyValue;
   if paColores.Visible then
      dsDetalle.DataSet.FieldByName('COLOR').AsInteger := cbColores.KeyValue;
   dsDetalle.DataSet.FieldByName('UNIDAD').AsInteger := cbUnidades.KeyValue;
   if cbAduanas.KeyValue <>  0  then
      dsDetalle.DataSet.FieldByName('ADUANA').AsInteger := cbAduanas.KeyValue;

   //indice     := dgPartidas.TopIndex;
   id_detalle := qyPartidas.FieldByName('R_ID').AsInteger;
   dsDetalle.DataSet.Post;
   TDetalle.Transaction.CommitRetaining;
   reglas.refresh_IBQuery(qyPartidas);

   {
   dgPartidas.FullExpand;
   dgPartidas.GotoFirst;
   while not(dgPartidas.IsEOF) do
   begin
      if qyPartidas.FieldByName('R_ID').AsInteger = id_detalle then
      begin
         break;
      end;
      dgPartidas.GotoNext(true);
   end;
   dgPartidas.TopIndex := indice;
   }
end;

procedure TfrmCapturar_desempaques.ibCancelarPartidaClick(Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Cancel;
end;

procedure TfrmCapturar_desempaques.ibEliminarPartidaClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     dsDetalle.DataSet.Delete;
  end;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_desempaques.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     boton := true;
     Material(dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger);
     dsDetalle.DataSet.Edit;
     edClave.Text              := dsPartidas.DataSet.FieldByName('R_CLAVE').AsString;
     edDescripcion.Text        := dsPartidas.DataSet.FieldByName('R_DESCRIPCION').AsString;
     cbUnidades.KeyValue := dsPartidas.DataSet.FieldByName('R_UNIDAD').AsInteger;
     if paMedidas.Visible and (dsPartidas.DataSet.FieldByName('R_MEDIDA').AsString <> '') then
        cbMedidas.KeyValue := dsPartidas.DataSet.FieldByName('R_MEDIDA').AsInteger;
     if paColores.Visible and (dsPartidas.DataSet.FieldByName('R_COLOR').AsString <> '') then
        cbColores.KeyValue := dsPartidas.DataSet.FieldByName('R_COLOR').AsInteger;
     if dsPartidas.DataSet.FieldByName('R_ADUANA').AsString <> '' then
        cbAduanas.KeyValue := dsPartidas.DataSet.FieldByName('R_ADUANA').AsInteger;
     ceCantidad.SetFocus;
     boton := false;
  end;
end;

procedure TfrmCapturar_desempaques.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  edClave.Clear;
  edDescripcion.Clear;
  cbUnidades.keyvalue := 0;
  cbMedidas.keyvalue := 0;
  cbAduanas.keyvalue := 0;
  dsDetalle.DataSet.Insert;
  spIDDetalle.ExecProc;
  dsDetalle.DataSet.FieldByName('ID').AsInteger         := spIDDetalle.ParamByName('R_ID').AsInteger;
  dsDetalle.DataSet.FieldByName('DESEMPAQUE').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  edClave.SetFocus;
end;

procedure TfrmCapturar_desempaques.dsDetalleDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     paCaptura.Visible          :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
     ibNuevaPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsBrowse,dsInactive]) and not(dsFuente.DataSet.IsEmpty) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
     ibModificarPartida.Enabled :=(TDataSource(sender).DataSet.State in [dsBrowse,dsInactive]) and not(TDataSource(sender).DataSet.IsEmpty) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
     ibGuardarPartida.Enabled   :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
     ibCancelarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
     ibEliminarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty) and ((dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') or (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'En Proceso'));
//     beMaterial.Enabled         := TDataSource(sender).DataSet.FieldByName('ID_OC_DETALLE').AsString = '';
//     leUnidades.Enabled         := TDataSource(sender).DataSet.FieldByName('ID_OC_DETALLE').AsString = '';
  end;
end;

procedure TfrmCapturar_desempaques.paCapturaEnter(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyCiudades);
  reglas.abrir_IBTabla(TIBXAduanas);
end;

procedure TfrmCapturar_desempaques.ceCantidadKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
     ibGuardarPartida.Click;
     if not(dsPartidas.DataSet.Eof) then
     begin
       dsPartidas.DataSet.Next;
       ibModificarPartida.Click;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.dgPartidasDblClick(Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) and ibModificarPartida.Enabled then
  begin
     ibModificarPartida.Click;
  end
  else
     if ibNuevaPartida.Enabled then
        ibNuevaPartida.Click;
end;

procedure TfrmCapturar_desempaques.ibCandadoClick(Sender: TObject);
var
   aceptar : boolean;
begin
  inherited;
  try
     Application.CreateForm(TfrmAcceso, frmAcceso);
     frmAcceso.Nivel  := 5;
     frmAcceso.Status := 'Autorizar';
     frmAcceso.ShowModal;
     aceptar := frmAcceso.Rsp;
  finally
     frmAcceso.Free;
  end;

  if aceptar then
  begin
     TCapturar.Edit;
     TCapturar.FieldByName('AUTORIZO').AsInteger := dmIBData.TFiltroUsuarios.FieldByName('ID').AsInteger;
     TCapturar.Post;
     TCapturar.Transaction.CommitRetaining;
  end
end;

procedure TfrmCapturar_desempaques.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('clave_orden_de_compra').AsString := '';
  DataSet.FieldByName('oc_id').AsInteger                := 0;
  DataSet.FieldByName('oc_folio').AsInteger             := 0;
  DataSet.FieldByName('oc_almacen').AsInteger           := 0;
  if DataSet.FieldByName('ORDEN_COMPRA').AsString <> '' then
  begin
     dmIBData.TFiltroOrdenesDeCompras.Filter               := 'ID = '+DataSet.FieldByName('ORDEN_COMPRA').AsString;
     DataSet.FieldByName('clave_orden_de_compra').AsString := dmIBData.TFiltroOrdenesDeCompras.FieldByName('CLAVE').AsString;
     DataSet.FieldByName('oc_id').AsInteger                := dmIBData.TFiltroOrdenesDeCompras.FieldByName('ID').AsInteger;
     DataSet.FieldByName('oc_folio').AsInteger             := dmIBData.TFiltroOrdenesDeCompras.FieldByName('CONSECUTIVO').AsInteger;
     DataSet.FieldByName('oc_almacen').AsInteger           := dmIBData.TFiltroOrdenesDeCompras.FieldByName('ALMACEN').AsInteger;
  end;

  DataSet.FieldByName('oc_almacen_c').AsString := '';
  DataSet.FieldByName('oc_almacen_n').AsString := '';
  if DataSet.FieldByName('oc_almacen').AsString <> '' then
  begin
     dmIBData.TFiltroAlmacenes.Filter             := 'ID = '+DataSet.FieldByName('oc_almacen').AsString;
     DataSet.FieldByName('oc_almacen_c').AsString := dmIBData.TFiltroAlmacenes.FieldByName('CLAVE').AsString;
     DataSet.FieldByName('oc_almacen_n').AsString := dmIBData.TFiltroAlmacenes.FieldByName('NOMBRE').AsString;
  end;
end;

procedure TfrmCapturar_desempaques.ibColapsarClick(Sender: TObject);
begin
  inherited;
  //if not(qyPartidas.IsEmpty) then
    // dgPartidas.FullCollapse;
end;

procedure TfrmCapturar_desempaques.ibExpanderClick(Sender: TObject);
begin
  inherited;
//  if not(qyPartidas.IsEmpty) then
  //   dgPartidas.FullExpand;
end;

procedure TfrmCapturar_desempaques.dgPartidasHeaderButtonClick(
  Sender: TObject);
begin
  inherited;
//  if not(qyPartidas.IsEmpty) then
  //   dgPartidas.GotoFirst;
end;

procedure TfrmCapturar_desempaques.NuevaPartida1Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_desempaques.ModificarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_desempaques.GuardarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_desempaques.CancelarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_desempaques.EliminarPartida1Click(Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_desempaques.deSerieKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
     ibGuardarPartida.Click;
     if not(dsPartidas.DataSet.Eof) then
     begin
       dsPartidas.DataSet.Next;
       ibModificarPartida.Click;
       deSerie.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.dePedimentoKeyPress(Sender: TObject;
  var Key: Char);
var
   pedimento : string;
   fecha : TDatetime;
   aduana : integer;
begin
  inherited;
  aduana := 0;
  if Key = #13 then
  begin
     pedimento := dePedimento.Text;
     fecha     := StrToDateTime(cbFechaPedimento.Text);
     if cbAduanas.KeyValue <> 0 then
        aduana    := cbAduanas.KeyValue;
     ibGuardarPartida.Click;
     if not(dsPartidas.DataSet.Eof) then
     begin
        dsPartidas.DataSet.Next;
        ibModificarPartida.Click;
        dsDetalle.DataSet.FieldByName('PEDIMENTO_FECHA').AsDatetime := fecha;
        dsDetalle.DataSet.FieldByName('PEDIMENTO').AsString         := pedimento;
        if cbAduanas.KeyValue <> 0 then
           cbAduanas.KeyValue                                 := aduana;
        dePedimento.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.deLoteKeyPress(Sender: TObject;
  var Key: Char);
var
   lote : string;
begin
  inherited;
  if Key = #13 then
  begin
     lote := deLote.Text;
     ibGuardarPartida.Click;
     if not(dsPartidas.DataSet.Eof) then
     begin
       dsPartidas.DataSet.Next;
       ibModificarPartida.Click;
       dsDetalle.DataSet.FieldByName('LOTE').AsString := lote;
       deLote.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.edClaveButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pnt : TPoint;
   tmpClave       : string;
   tmpDescripcion : string;
   tmpUnidadBase  : integer;
begin
  inherited;
  pnt := paLienzo2.ClientToScreen(Point(0,0));
  frmSeleccionar_material := TfrmSeleccionar_material.Create(Application);
  frmSeleccionar_material.dsDestino.DataSet := TDetalle;
  frmSeleccionar_material.coordenadas(pnt.y, pnt.x, paLienzo2.width, paLienzo2.Height);
  frmSeleccionar_material.ShowModal;
  tmpClave       := frmSeleccionar_material.dameClave;
  tmpDescripcion := frmSeleccionar_material.dameDescripcion;
  tmpUnidadBase  := frmSeleccionar_material.dameUnidadBase;
  iva_porc       := frmSeleccionar_material.dameIVA_PORC;
  ieps_porc      := frmSeleccionar_material.dameIEPS_PORC;
  impuesto1_porc := frmSeleccionar_material.dameIMPUESTO1_PORC;
  impuesto2_porc := frmSeleccionar_material.dameIMPUESTO2_PORC;
  frmSeleccionar_material.Free;
  if dsDetalle.DataSet.FieldByName('MATERIAL').AsString <> '' then
  begin
     Material(dsDetalle.DataSet.FieldByName('MATERIAL').AsInteger);
     edClave.Text       := tmpClave;
     edDescripcion.Text := tmpDescripcion;
     if not(boton) then
        cbUnidades.KeyValue := tmpUnidadBase;
     if paMedidas.Visible then
        cbMedidas.keyvalue := 0;
  end;
end;

procedure TfrmCapturar_desempaques.edClaveKeyPress(Sender: TObject;
  var Key: Char);
var
   AltaRapidaMaterial : TfrmAltaRapidaMateriales;
   tmpMaterial : integer;
   tmpClave : string;
   tmpDescripcion : string;
   tmpUnidadBase : integer;
begin
  inherited;
  if (key = #13) and (edClave.Text <> '') then
  begin
     qyIBXMateriales.Close;
     qyIBXMateriales.ParamByName('P_CLAVE').AsString   := edClave.Text;
     qyIBXMateriales.Open;
     if not(qyIBXMateriales.IsEmpty) then
     begin
        Material(qyIBXMateriales.FieldByName('ID').AsInteger);
        iva_porc       := qyIBXMateriales.FieldByName('IVA_PORC').AsFloat;
        ieps_porc      := qyIBXMateriales.FieldByName('IEPS_PORC').AsFloat;
        impuesto1_porc := qyIBXMateriales.FieldByName('IMPUESTO_1_PORC').AsFloat;
        impuesto2_porc := qyIBXMateriales.FieldByName('IMPUESTO_2_PORC').AsFloat;
        edDescripcion.Text := qyIBXMateriales.FieldByName('DESCRIPCION').AsString;
        dsDetalle.DataSet.FieldByName('MATERIAL').AsInteger := qyIBXMateriales.FieldByName('ID').AsInteger;
        if not(boton) then
           cbUnidades.KeyValue := qyIBXMateriales.FieldByName('UNIDAD_BASE').AsInteger;
     end
     else
        begin
           if MessageDlg('El material no existe.  �Desea agregarlo?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
              AltaRapidaMaterial := TfrmAltaRapidaMateriales.Create(Application);
              AltaRapidaMaterial.edClave.Text := edClave.Text;
              AltaRapidaMaterial.ShowModal;
              tmpMaterial    := AltaRapidaMaterial.dameMaterial;
              tmpClave       := AltaRapidaMaterial.edClave.Text;
              tmpDescripcion := AltaRapidaMaterial.edDescripcion.Text;
              tmpUnidadBase  := AltaRapidaMaterial.cbUnidades.KeyValue;
              iva_porc       := StrToFloat(AltaRapidaMaterial.ceIVA.Text);
              ieps_porc      := 0.00;
              impuesto1_porc := 0.00;
              impuesto2_porc := 0.00;
              AltaRapidaMaterial.Free;
              if tmpMaterial <> 0 then
              begin
                 dsDetalle.DataSet.FieldByName('MATERIAL').AsInteger := tmpMaterial;
                 Material(tmpMaterial);
                 edClave.Text       := tmpClave;
                 edDescripcion.Text := tmpDescripcion;
                 if not(boton) then
                    cbUnidades.KeyValue := tmpUnidadBase;
              end;
           end;
        end;
  end
  else
     if (key = #13) and (edClave.Text = '') then
     begin
       // edClave.OnButtonClick(nil,0);
     end;
end;

procedure TfrmCapturar_desempaques.sbRefreshMedidasClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyMateriales_Medidas);
end;

procedure TfrmCapturar_desempaques.sbRefreshColoresClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyColores);
end;

procedure TfrmCapturar_desempaques.paMaterialesEnter(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyColores);
end;

procedure TfrmCapturar_desempaques.sbRefreshAlmOrigenClick(
  Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TIBXAduanas);
end;

procedure TfrmCapturar_desempaques.cbFechaCaducidadEnter(Sender: TObject);
begin
  inherited;
  cbFechaCaducidad.text := (FormatDateTime('dd/mm/yyyy',dsDetalle.DataSet.FieldByName('FECHA_CADUCIDAD').AsDateTime));
end;

procedure TfrmCapturar_desempaques.cbFechaPedimentoEnter(Sender: TObject);
begin
  inherited;
  cbFechaPedimento.text := (FormatDateTime('dd/mm/yyyy',dsDetalle.DataSet.FieldByName('PEDIMENTO_FECHA').AsDateTime));
end;

procedure TfrmCapturar_desempaques.buInicioClick(Sender: TObject);
begin
  inherited;
  //dgPartidas.FullExpand;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_desempaques.buAnteriorClick(Sender: TObject);
begin
  inherited;
 // dgPartidas.FullExpand;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_desempaques.buSiguienteClick(Sender: TObject);
begin
  inherited;
  //dgPartidas.FullExpand;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_desempaques.buFinClick(Sender: TObject);
begin
  inherited;
  //dgPartidas.FullExpand;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_desempaques.ibImprimirClick(Sender: TObject);
begin
  inherited;
  itemImprimir.Click;
end;

procedure TfrmCapturar_desempaques.buAplicarClick(Sender: TObject);
var
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
     ExplorarGrid;

     if awrStatus.correo then
     begin
        mensajes;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.cbEstatusChange(Sender: TObject);
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

     dsFuente.DataSet.FieldByName('ESTATUS').AsString := awrStatus.estatusSel;

     buAplicar.Enabled := true;
     ibGuardar.Enabled := false;
  end;
end;

procedure TfrmCapturar_desempaques.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyEstatus);
end;

procedure TfrmCapturar_desempaques.deFechaRecepcionEnter(Sender: TObject);
begin
  inherited;
  deFechaRecepcion.Text := (FormatDateTime('dd/mm/yyyy',dsFuente.DataSet.FieldByName('FECHA_RECEPCION').AsDateTime));
end;

procedure TfrmCapturar_desempaques.ibGuardarClick(Sender: TObject);
begin
  verfificarFechas;
  inherited;
end;

procedure TfrmCapturar_desempaques.buSeriesClick(Sender: TObject);
var
 mensaje : string;
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     mensaje := '� Generar numeros en automatico ?' + #13 + #13 + 'iniciando con: ' + dsPartidas.DataSet.FieldByName('R_SERIE').AsString;
     if MessageDlg(mensaje,mtConfirmation, [mbYes, mbNo], 0) = mrYes then
     begin
        spP_SERIES.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spP_SERIES.ExecProc;
        spP_SERIES.Transaction.CommitRetaining;

        ShowMessage('Proceso generado con exito.');
        reglas.refresh_IBQuery(qyPartidas);
        //dgPartidas.FullExpand;
     end;
  end;
end;

procedure TfrmCapturar_desempaques.itemImprimirClick(Sender: TObject);
begin
  inherited;
  PR_0002 := TPR_0002.Create(Self);
  try
     if PR_0002.OpenReporte then
     begin
        PR_0002.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
        if dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger = 0 then
           PR_0002.imprimir
        else
           PR_0002.preview;
     end;
  finally
     PR_0002.Free;
  end;
  reglas.abrir_IBTabla(TCapturar)
end;

procedure TfrmCapturar_desempaques.itemPreviewClick(Sender: TObject);
begin
  inherited;
  PR_0002 := TPR_0002.Create(Self);
  try
     if PR_0002.OpenReporte then
     begin
        PR_0002.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
        PR_0002.preview;
     end;
  finally
     PR_0002.Free;
  end;
end;

end.
