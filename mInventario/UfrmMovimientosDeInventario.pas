unit UfrmMovimientosDeInventario;

interface

uses
  db, UTypeMovDeInvDet, UTypeMovimientosDeInventario, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,
  UfrmFrameMaterial,
  Buttons, StdCtrls,  ExtCtrls,
   jpeg, dbgrids, DBCtrls, ComCtrls, Grids, Mask, IBX.IBStoredProc,
  IBX.IBCustomDataSet, IBX.IBQuery, cxGrid, cxGridDBTableView, cxGridLevel,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxClasses;

type
  TfrmMovimientosDeInventario = class(TForm)
    paLienzo: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    laAlmacenOrigen: TLabel;
    laSubTipo: TLabel;
    laAlmacenDestino: TLabel;
    Label5: TLabel;
    Label18: TLabel;
    edFechaAlta: TDateTimePicker;
    cbTipo: TDBComboBox;
    edObservaciones: TEdit;
    cbAlmOrigen: TDBLookupComboBox;
    cbAlmDestino: TDBLookupComboBox;
    paTitulo: TPanel;
    paBotones: TPanel;
    ibNuevo: TBitBtn;
    ibModificar: TBitBtn;
    ibGuardar: TBitBtn;
    ibCancelar: TBitBtn;
    ibEliminar: TBitBtn;
    ibImprimir: TBitBtn;
    ibAyuda: TBitBtn;
    cbEstatus: TDBLookupComboBox;
    edEstatus: TEdit;
    cbSubTipo: TDBLookupComboBox;
    dgPartidas: TcxGrid;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    paBotonesDetalle: TPanel;
    sbRefreshAlmOrigen: TSpeedButton;
    sbRefreshAlmDestino: TSpeedButton;
    sbRefreshSubTipos: TSpeedButton;
    edClave: TEdit;
    Label4: TLabel;
    cbGenerar: TDBEdit;
    fcLogo: TImage;
    ibAplicar: TBitBtn;
    sbEstatus: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    Label8: TLabel;
    edFolioOrigen: TEdit;
    edFolioDestino: TEdit;
    laFolioDestino: TLabel;
    paTituloDetalle: TPanel;
    paExtra: TPanel;
    laMoneda: TLabel;
    sbRefreshMonedas: TSpeedButton;
    laLote: TLabel;
    laSerie: TLabel;
    laSujeto: TLabel;
    cbMonedas: TDBLookupComboBox;
    edLote: TEdit;
    edSerie: TEdit;
    edProveedor: TEdit;
    edCliente: TEdit;
    MarcoMateriales1: TMarcoMateriales;
    ibNuevaPartida: TBitBtn;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibArchivo: TBitBtn;
    ibSubir: TBitBtn;
    buConteo: TBitBtn;
    qyIBXEliminar: TIBQuery;
    edLinea: TEdit;
    laLinea: TLabel;
    buImpresion: TBitBtn;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    itemDiferencias: TMenuItem;
    ibReAgrupar: TBitBtn;
    paInsuficiencias: TPanel;
    fcImager1: TImage;
    buInsuficiencias: TBitBtn;
    buSKUGenerar: TBitBtn;
    buEtiquetasM: TBitBtn;
    buEtiquetasZ: TBitBtn;
    itemPreview: TMenuItem;
    buSKU: TBitBtn;
    ppSKU: TPopupMenu;
    itemSKUGenerar: TMenuItem;
    itemSKUConfirmar: TMenuItem;
    itemSKUConfirmarCompleto: TMenuItem;
    itemSKUBusqueda: TMenuItem;
    ibCopiar: TBitBtn;
    spCOPIA_MI: TIBStoredProc;
    dgPartidasLevel1: TcxGridLevel;
    dgPartidasDBTableView1: TcxGridDBTableView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure cbSubTipoChange(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibCancelarClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibEliminarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure sbRefreshSubTiposClick(Sender: TObject);
    procedure sbRefreshAlmOrigenClick(Sender: TObject);
    procedure sbRefreshAlmDestinoClick(Sender: TObject);
    procedure sbRefreshMonedasClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure edSerieKeyPress(Sender: TObject; var Key: Char);
    procedure cbEstatusChange(Sender: TObject);
    procedure ibAplicarClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure MarcoMateriales1edMaterialKeyPress(Sender: TObject;
      var Key: Char);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure dgPartidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edProveedorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure ibArchivoClick(Sender: TObject);
    procedure ibSubirClick(Sender: TObject);
    procedure buConteoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edLineaButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edLineaKeyPress(Sender: TObject; var Key: Char);
    procedure cbMonedasChange(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure itemDiferenciasClick(Sender: TObject);
    procedure ibReAgruparClick(Sender: TObject);
    procedure MarcoMateriales1edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buInsuficienciasClick(Sender: TObject);
    procedure buEtiquetasZClick(Sender: TObject);
    procedure buEtiquetasMClick(Sender: TObject);
    procedure dgPartidasETIQUETAS_MONARCHButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasETIQUETAS_ZEBRAButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure itemPreviewClick(Sender: TObject);
    procedure itemSKUGenerarClick(Sender: TObject);
    procedure itemSKUConfirmarClick(Sender: TObject);
    procedure itemSKUConfirmarCompletoClick(Sender: TObject);
    procedure buSKUGenerarClick(Sender: TObject);
    procedure itemSKUBusquedaClick(Sender: TObject);
    procedure ibCopiarClick(Sender: TObject);
  private
    MovimientosDeInventario    : TMovimientosDeInventario;
    MovimientosDeInventarioDet : TMovimientosDeInventarioDet;
    grid            : TcxGridDBTableView;
    estatus         : string;
    cerrar          : boolean;
    edicion         : boolean;
    edicionDetalle  : boolean;
    usuario         : integer;
    tmpSujeto       : integer;
    tmpSujetoNombre : string;
    awrActivarFA    : boolean; //Activar Fecha de Alta
    procedure FijarBotones;
    procedure NavegadorClick;
    procedure verificarTipoMovimiento;
  public
    idActual : integer;
    procedure CargarValores;
    procedure CargarValoresDetalle;
    constructor Crear(AOwner : TComponent; pId : integer);overload;
    constructor Crear(AOwner : TComponent; pGrid : TcxGridDBTableView; pUsuario : integer);overload;
  end;

var
  frmMovimientosDeInventario: TfrmMovimientosDeInventario;

implementation

uses UfrmAutorizar, PRN_0029_MI, UfrmSeleccionarCliente, IBModulo,
  UfrmSeleccionarProveedor, Ulineas, FR_0001, UfrmInsuficienciasMI, UfrmSKUGenerar,
  generar, UfrmSKUConfirmar, UfrmSKUConfirmarCompleto, UfrmSKU, reglas_de_negocios,
  IBData;

{$R *.DFM}

constructor TfrmMovimientosDeInventario.Crear(AOwner : TComponent; pId : integer);
begin
   inherited Create(AOwner);
   MovimientosDeInventario    := TMovimientosDeInventario.Create;
   MovimientosDeInventarioDet := TMovimientosDeInventarioDet.Create;
   edicion := False;
   idActual := pId;
end;

constructor TfrmMovimientosDeInventario.Crear(AOwner : TComponent; pGrid : TcxGridDBTableView; pUsuario : integer);
begin
   Crear(AOwner, -1);
   usuario := pUsuario;
   grid    := pGrid;

   if not(dgPartidasDBTableView1.DataController.DataSource.DataSet.IsEmpty) then
      idActual := dgPartidasDBTableView1.DataController.DataSource.DataSet.FieldByName('R_ID').AsInteger
   else
      idActual := -1;
end;

procedure TfrmMovimientosDeInventario.verificarTipoMovimiento;
begin
   if (cbTipo.Text = 'Entrada') or (cbTipo.Text = 'Inventario Inicial') or (cbTipo.Text = 'Ajuste Inventario') then
   begin
      if (cbGenerar.Visible) and (cbGenerar.Text='Si') then//me indica que es una devolucion de un cliente
      begin
         MarcoMateriales1.MOVIMIENTO   := obSalida;
         //dgPartidasCostoPrecio.Caption := 'Precio Venta';
         //dgPartidasCostoPrecio.Visible := true;
      end
      else
         begin
            MarcoMateriales1.MOVIMIENTO   := obEntrada;
            //dgPartidasCostoPrecio.Caption := 'Costo';
            //dgPartidasCostoPrecio.Visible := true;
         end;
   end
   else
      if (cbTipo.Text = 'Salida') or (cbTipo.Text = 'Traspaso') then
      begin
         if (cbGenerar.Visible) and (cbGenerar.Text='Si') then//me indica que es una devolucion a un proveedor
         begin
            MarcoMateriales1.MOVIMIENTO   := obEntrada;
            //dgPartidasCostoPrecio.Caption := 'Costo';
            //dgPartidasCostoPrecio.Visible := true;
         end
         else
            begin
               MarcoMateriales1.MOVIMIENTO   := obSalida;
               //dgPartidasCostoPrecio.Caption := 'Precio Venta';
               //dgPartidasCostoPrecio.Visible := true;
            end;
      end
      else
         begin
            MarcoMateriales1.MOVIMIENTO   := obDesconocido;
            //dgPartidasCostoPrecio.Visible := false;
         end;
end;

procedure TfrmMovimientosDeInventario.CargarValores;
begin
  // Cargamos los valores de las propiedades en los componentes
  // visuales del formulario
  paTitulo.Caption           := IntToStr(MovimientosDeInventario.ID);
  edFechaAlta.Date           := MovimientosDeInventario.FECHA_HORA;
  edClave.Text               := MovimientosDeInventario.CLAVE;
  cbTipo.Text                := MovimientosDeInventario.TIPO;
  edObservaciones.Text       := MovimientosDeInventario.OBSERVACIONES;
  edEstatus.Text             := MovimientosDeInventario.ESTATUS;
  edFolioOrigen.Text         := IntToStr(MovimientosDeInventario.FOLIO_ORIGEN);
  edFolioDestino.Text        := IntToStr(MovimientosDeInventario.FOLIO_DESTINO);
  cbAlmOrigen.KeyValue := MovimientosDeInventario.ALMACEN_ORIGEN;
  MovimientosDeInventario.activarEstatus;

  if (MovimientosDeInventario.ALMACEN_DESTINO <> 0) and cbAlmDestino.Visible then
     cbAlmDestino.KeyValue := MovimientosDeInventario.ALMACEN_DESTINO
  else
     cbAlmDestino.KeyValue:=0;

  if (MovimientosDeInventario.SUB_TIPO <> 0) and cbSubTipo.Visible then
  begin
     cbSubTipo.KeyValue := MovimientosDeInventario.SUB_TIPO;
  end
  else
     cbSubTipo.KeyValue:=0;

  if (MovimientosDeInventario.LINEA <> 0) and (MovimientosDeInventario.LINEA <> 0) and edLinea.Visible then
  begin
     edLinea.Tag  := MovimientosDeInventario.LINEA;
     edLinea.Text := MovimientosDeInventario.LINEA_DESCRIPCION;
  end
  else
  begin
     edLinea.Tag  := 0;
     edLinea.Text := '<FALTA>';
  end;
end;

procedure TfrmMovimientosDeInventario.CargarValoresDetalle;
begin
  // Cargamos los valores de las propiedades en los componentes
  // visuales del formulario
  MarcoMateriales1.findMaterial(MovimientosDeInventarioDet.MATERIAL, MovimientosDeInventarioDet.UNIDAD);
  MarcoMateriales1.edMaterial.Tag            := MovimientosDeInventarioDet.MATERIAL;
  MarcoMateriales1.edMaterial.Text           := MovimientosDeInventarioDet.MATERIAL_CLAVE;
  MarcoMateriales1.edDescripcion.Text        := MovimientosDeInventarioDet.MATERIAL_DESCRIPCION;
  MarcoMateriales1.edCantidad.Text           := floatToStr(MovimientosDeInventarioDet.CANTIDAD);
  MarcoMateriales1.cbUnidades.KeyValue := MovimientosDeInventarioDet.UNIDAD;
  MarcoMateriales1.edPrecioCosto.Text       := floatToStr(MovimientosDeInventarioDet.COSTO);

  if MarcoMateriales1.FLAG_MEDIDAS and (MovimientosDeInventarioDet.MEDIDA <> 0) then
     MarcoMateriales1.cbMedidas.KeyValue := MovimientosDeInventarioDet.MEDIDA;
  if MarcoMateriales1.FLAG_COLORES and (MovimientosDeInventarioDet.COLOR <> 0) then
     MarcoMateriales1.cbColores.KeyValue := MovimientosDeInventarioDet.COLOR;

  cbMonedas.KeyValue     := MovimientosDeInventarioDet.MONEDA;
  edLote.Text                  := MovimientosDeInventarioDet.LOTE;
  edSerie.Text                 := MovimientosDeInventarioDet.SERIE;

  laLote.Visible  := false;
  laSerie.Visible := false;
  edLote.Visible  := false;
  edSerie.Visible := false;

  if MovimientosDeInventarioDet.LOTE <> '' then
  begin
     laLote.Visible := true;
     edLote.Visible := true;
     edLote.Text := MovimientosDeInventarioDet.LOTE;
  end;
  if MovimientosDeInventarioDet.SERIE <> '' then
  begin
     laSerie.Visible := true;
     edSerie.Visible := true;
     edSerie.Text := MovimientosDeInventarioDet.SERIE;
  end;
end;

procedure TfrmMovimientosDeInventario.fijarBotones;
var
   estatus   : boolean;
   miEstatus : string;
   vTipo     : string;
begin
   miEstatus := MovimientosDeInventario.ESTATUS;

   vTipo   := MovimientosDeInventario.TIPO;

   estatus := false;
   if MovimientosDeInventario.ID <> -1 then
      estatus := (miEstatus = 'Afectado') or (miEstatus = 'Cancelado') or (miEstatus = 'Terminado') or (miEstatus = 'Interno');
   //botones encabezado
   ibNuevo.Enabled     := not(edicionDetalle) and not edicion;
   ibModificar.Enabled := not(edicionDetalle) and not edicion and not(MovimientosDeInventario.VACIO);
   ibEliminar.Enabled  := not(edicionDetalle) and not edicion and not(MovimientosDeInventario.VACIO) and not(estatus);
   ibGuardar.Enabled   := not(edicionDetalle) and edicion;
   ibCancelar.Enabled  := not(edicionDetalle) and edicion;
   //componentes encabezado
   edFechaAlta.Enabled         := not(estatus) and edicion and awrActivarFA;
   edClave.Enabled             := not(estatus) and edicion;
   cbTipo.Enabled              := not(estatus) and edicion;
   cbSubTipo.Enabled           := not(estatus) and edicion;
   cbAlmOrigen.Enabled         := not(estatus) and edicion;
   cbAlmDestino.Enabled        := not(estatus) and edicion;
   edObservaciones.Enabled     := not(estatus) and edicion;
   edEstatus.Enabled           := edicion;
   cbEstatus.Enabled           := edicion;
   ibAplicar.Enabled           := edicion;
   sbRefreshSubTipos.Enabled   := not(estatus) and edicion;
   sbRefreshAlmOrigen.Enabled  := not(estatus) and edicion;
   sbRefreshAlmDestino.Enabled := not(estatus) and edicion;
   edFolioOrigen.Enabled       := edicion;
   edFolioDestino.Enabled      := edicion;
   laLinea.Enabled             := not(estatus) and edicion;
   edLinea.Enabled             := not(estatus) and edicion;
   buConteo.Visible            := not(edicion) and estatus and ((vTipo = 'Conteo') or (vTipo = 'Conteo Parcial') or (vTipo = 'Inventario Inicial'));

   buSKUGenerar.Enabled             := not(edicion) and not(estatus) and ((vTipo = 'Entrada' ));
   itemSKUGenerar.Enabled           := not(edicion) and not(estatus) and ((vTipo = 'Entrada' ));
   itemSKUConfirmar.Enabled         := not(edicion) and not(estatus) and ((vTipo = 'Entrada' ) or (vTipo = 'Traspaso'));
   itemSKUConfirmarCompleto.Enabled := not(edicion) and not(estatus) and ((vTipo = 'Entrada' ));
   itemSKUBusqueda.Enabled          := not(edicion) and not(estatus) and ((vTipo = 'Traspaso'));
   ibCopiar.Enabled                 := not(edicion) and not(MovimientosDeInventario.VACIO);

   buEtiquetasM.Enabled        := not(edicion);
   buEtiquetasZ.Enabled        := not(edicion);
   //botones detalle
   ibNuevaPartida.Enabled     := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle);
   ibModificarPartida.Enabled := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle) and not(MovimientosDeInventarioDet.VACIO);
   ibEliminarPartida.Enabled  := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle) and not(MovimientosDeInventarioDet.VACIO);
   ibGuardarPartida.Enabled   := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   ibCancelarPartida.Enabled  := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   ibArchivo.Enabled          := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle);
   ibSubir.Enabled            := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle);
   ibReAgrupar.Enabled        := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and not(edicionDetalle);
   //componentes detalle
   laMoneda.Visible           := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   cbMonedas.Visible          := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   sbRefreshMonedas.Visible   := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   MarcoMateriales1.Visible   := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   paExtra.Visible            := not(estatus) and not(edicion) and not(MovimientosDeInventario.VACIO) and edicionDetalle;
   //botones estatus bar
   buInicio.Enabled           := not(edicion) and not(edicionDetalle);
   buAnterior.Enabled         := not(edicion) and not(edicionDetalle);
   buSiguiente.Enabled        := not(edicion) and not(edicionDetalle);
   buFin.Enabled              := not(edicion) and not(edicionDetalle);
end;

procedure TfrmMovimientosDeInventario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cerrar := true;
  // Liberamos el objeto
  MovimientosDeInventario.Free;
  MovimientosDeInventario:=nil;
  MovimientosDeInventarioDet.Free;
  MovimientosDeInventarioDet:=nil;
  Action := caFree;
end;

procedure TfrmMovimientosDeInventario.FormShow(Sender: TObject);
begin
   cbAlmOrigen.ListSource           := MovimientosDeInventario.DSALMACENES;
   cbAlmDestino.ListSource          := MovimientosDeInventario.DSALMACENES;
   cbSubTipo.ListSource             := MovimientosDeInventario.DSSUBTIPO;
   cbEstatus.ListSource             := MovimientosDeInventario.DSESTATUS;
   dgPartidasDBTableView1.DataController.DataSource            := MovimientosDeInventarioDet.DSDETALLE;
   //Carga datos actuales del grid(No colocar en evento OnActivate).
   if (grid <> nil) and not(MovimientosDeInventarioDet.EstaLoad) then
      idActual := dgPartidasDBTableView1.DataController.DataSource.DataSet.FieldByName('R_ID').AsInteger;
   MovimientosDeInventario.Cargar(idActual);
   MovimientosDeInventarioDet.Cargar(idActual);
   CargarValores;
   fijarBotones;
end;

procedure TfrmMovimientosDeInventario.cbTipoChange(Sender: TObject);
begin
   laSubTipo.Visible           := false;
   cbSubTipo.Visible           := false;
   sbRefreshSubTipos.Visible   := false;
   laAlmacenDestino.Visible    := false;
   cbAlmDestino.Visible        := false;
   edFolioDestino.Visible      := false;
   laFolioDestino.Visible      := false;
   sbRefreshAlmDestino.Visible := false;
   //dgPartidasProveedor.Visible := false;
   //dgPartidasCliente.Visible   := false;
   laLinea.Visible             := false;
   edLinea.Visible             := false;
   MovimientosDeInventario.refreshSubTipo(cbTipo.Text);
   if ibCancelar.Enabled then
      cbSubTipo.KeyValue:=0;
   if (cbTipo.Text = 'Entrada') or (cbTipo.Text = 'Salida') then
   begin
      laSubTipo.Visible             := true;
      cbSubTipo.Visible             := true;
      sbRefreshSubTipos.Visible     := true;
   end
   else
   if (cbTipo.Text = 'Traspaso') then
   begin
      laAlmacenDestino.Visible    := true;
      cbAlmDestino.Visible        := true;
      edFolioDestino.Visible      := true;
      laFolioDestino.Visible      := true;
      sbRefreshAlmDestino.Visible := true;
   end
   else
   if (cbTipo.Text = 'Conteo Parcial') then
   begin
      laLinea.Visible := true;
      edLinea.Visible := true;
   end;

   verificarTipoMovimiento;
end;

procedure TfrmMovimientosDeInventario.cbSubTipoChange(Sender: TObject);
begin
   cbGenerar.Visible   := false;
   laSujeto.Visible    := false;
   edProveedor.Visible := false;
   edCliente.Visible   := false;
   //dgPartidasProveedor.Visible := false;
   //dgPartidasCliente.Visible   := false;
   if cbSubTipo.Text <> '' then
   begin
      cbGenerar.Visible := true;
      {
      if cbTipo.Text = 'Entrada' then
      begin
         cbGenerar.Text := 'Generar Nota de Credito.';
      end
      else
      if cbTipo.Text = 'Salida' then
      begin
         cbGenerar.Text := 'Generar Nota de Cargo CXP.';
      end;
      }
      if cbSubTipo.ListSource.DataSet.FieldByName('R_GENERA').AsString = 'Si' then
      begin
         cbGenerar.Text := 'Si' ;
         laSujeto.Visible  := true;

         if cbTipo.Text = 'Entrada' then
         begin
            laSujeto.Caption          := '&Cliente (Enter)';
            laSujeto.FocusControl     := edCliente;
            edCliente.Visible         := true;
            //dgPartidasCliente.Visible := true;
         end
         else
         if cbTipo.Text = 'Salida' then
         begin
            laSujeto.Caption            := '&Proveedor (Enter)';
            laSujeto.FocusControl       := edProveedor;
            edProveedor.Visible         := true;
            //dgPartidasProveedor.Visible := true;
         end;
      end
      else
         cbGenerar.Text := 'Si' ;
   end;
   verificarTipoMovimiento;
end;

procedure TfrmMovimientosDeInventario.ibNuevoClick(Sender: TObject);
begin                                           
  MovimientosDeInventarioDet.Cargar(-1);
  ibNuevaPartida.Enabled     := false;
  ibModificarPartida.Enabled := false;
  ibEliminarPartida.Enabled  := false;

  paTitulo.Caption := 'Nuevo';
  edicion          := not edicion;

  IdActual         := MovimientosDeInventario.ID;
  edFechaAlta.Date := MovimientosDeInventario.FECHA_SERVIDOR;

  MovimientosDeInventario.USUARIO      := usuario;
  MovimientosDeInventario.ID           := -1;
  MovimientosDeInventario.REFERENCIA   := '';
  MovimientosDeInventario.IDREFERENCIA := 0;

  fijarBotones;

  edClave.Clear;
  cbTipo.Clear;
  cbSubTipo.KeyValue := 0;
  cbAlmOrigen.KeyValue := 0;
  edObservaciones.Clear;
  cbAlmDestino.KeyValue := 0;
  edFolioOrigen.Clear;
  edFolioDestino.Clear;
  edLinea.Text := '<FALTA>';
  edLinea.Tag  := 0;

  edEstatus.Text    := 'Sin Afectar';
//  edEstatus.Enabled := false;
  cbEstatus.Enabled := false;
  ibAplicar.Enabled := false;
  edClave.SetFocus;
end;

procedure TfrmMovimientosDeInventario.ibCancelarClick(Sender: TObject);
begin
  paTitulo.Caption := IntToStr(idActual);
  edicion := not edicion;
  MovimientosDeInventario.Cargar(idActual);
  MovimientosDeInventarioDet.Cargar(idActual);
  fijarBotones;
  CargarValores;
end;

procedure TfrmMovimientosDeInventario.ibModificarClick(Sender: TObject);
begin
   paTitulo.Caption  := 'Modificar';
   idActual          := MovimientosDeInventario.ID;
   estatus           := MovimientosDeInventario.ESTATUS;
   edicion           := not edicion;
   fijarBotones;
   MovimientosDeInventario.USUARIO := usuario;
   ibAplicar.Enabled := false;

   if edClave.Enabled then
     edClave.SetFocus
end;

procedure TfrmMovimientosDeInventario.ibEliminarClick(Sender: TObject);
begin
   paTitulo.Caption := 'Eliminar';
   if MessageDlg('¿Eliminar registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      idActual := 0;
      paTitulo.Caption := '0';
      MovimientosDeInventario.eliminar;
      MovimientosDeInventario.Cargar(0);
      MovimientosDeInventarioDet.Cargar(0);
      cargarValores;
   end;
end;

procedure TfrmMovimientosDeInventario.ibGuardarClick(Sender: TObject);
var
   grabar : boolean;
   tmp    : integer;
begin
   grabar := true;
   if cbAlmDestino.Visible then
      if cbAlmDestino.Text = '' then
      begin
         grabar := false;
         MessageDlg('Falta capturar almacen destino.',mtError, [mbOk], 0);
      end;

   if cbTipo.Text = '' then
   begin
      grabar := false;
      MessageDlg('Falta capturar tipo.',mtError, [mbOk], 0);
   end;

   if grabar then
   begin
      MovimientosDeInventario.FECHA_HORA := edFechaAlta.Date;
      MovimientosDeInventario.CLAVE      := edClave.Text;
      MovimientosDeInventario.TIPO       := cbTipo.Text;
      MovimientosDeInventario.SUB_TIPO   := 0;
      MovimientosDeInventario.LINEA      := 0;
      MovimientosDeInventario.LINEA_DESCRIPCION := '';

      if cbSubTipo.Visible then
      begin
         if cbSubTipo.Text <> '' then
            MovimientosDeInventario.SUB_TIPO := cbSubTipo.KeyValue
      end;

      if edLinea.Visible then
      begin
         if edLinea.Tag <> 0 then
         begin
            MovimientosDeInventario.LINEA := edLinea.Tag;
            MovimientosDeInventario.LINEA_DESCRIPCION := edLinea.Text;
         end;
      end;

      MovimientosDeInventario.ALMACEN_ORIGEN := cbAlmOrigen.KeyValue;
      MovimientosDeInventario.OBSERVACIONES  := edObservaciones.Text;
      if cbAlmDestino.Visible then
         MovimientosDeInventario.ALMACEN_DESTINO := cbAlmDestino.KeyValue
      else
         MovimientosDeInventario.ALMACEN_DESTINO := 0;
      MovimientosDeInventario.ESTATUS      := edEstatus.Text;
      tmp := MovimientosDeInventario.Guardar;
      if tmp <> -1 then
      begin
         idActual := tmp;
         MovimientosDeInventario.Cargar(idActual);
         MovimientosDeInventarioDet.Cargar(idActual);
      end;
      paTitulo.Caption := IntToStr(idActual);
      edicion := not edicion;
      FijarBotones;
      CargarValores;
   end;
end;

procedure TfrmMovimientosDeInventario.ibNuevaPartidaClick(Sender: TObject);
begin
  paTituloDetalle.Caption := 'Nuevo';
  edicionDetalle := not edicionDetalle;
  fijarBotones;
  cbMonedas.ListSource := MovimientosDeInventarioDet.DSMONEDAS;

  if tmpSujeto <> 0 then
  begin
     if edCliente.Visible then
     begin
        MovimientosDeInventarioDet.CLIENTE := tmpSujeto;
        edCliente.Text := tmpSujetoNombre;
     end;
     if edProveedor.Visible then
     begin
        MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := tmpSujeto;
        edProveedor.Text := tmpSujetoNombre;
     end;
  end
  else
     begin
        edProveedor.Clear;
        edCliente.Clear;
     end;

  laLote.Visible  := false;
  laSerie.Visible := false;
  edLote.Visible  := false;
  edSerie.Visible := false;

  MarcoMateriales1.ALMACENES := MovimientosDeInventario.ALMACEN_ORIGEN;

  cbMonedas.KeyValue   := MovimientosDeInventarioDet.MONEDAB;
  MarcoMateriales1.MONEDA    := MovimientosDeInventarioDet.MONEDAB;

  edLote.Clear;
  edSerie.Clear;

  MarcoMateriales1.limpiar;
  //sirve asi, para el caso en que se edite el registro
  //no capturar con boton Capturar.
  MarcoMateriales1.FLAG_ESTADO := stNuevo;

  MovimientosDeInventarioDet.ID                    := -1;
  MovimientosDeInventarioDet.ID_INVENTARIO         := 0;
  MovimientosDeInventarioDet.CAJAS                 := 0;
  MovimientosDeInventarioDet.PEDIDO                := 0;
  MovimientosDeInventarioDet.PEDIDO_DETALLE        := 0;
  MovimientosDeInventarioDet.FACTURA               := 0;
  MovimientosDeInventarioDet.FACTURA_DETALLE       := 0;
  MovimientosDeInventarioDet.DEVOLUCIONES_CANTIDAD := 0;
  MovimientosDeInventarioDet.DEVOLUCIONES_CAJA     := 0;
  MovimientosDeInventarioDet.REFERENCIA            := '';
  MovimientosDeInventarioDet.ESTATUS               := 'Activo';


  if paExtra.Visible then
  begin
     if edCliente.Visible then
        edCliente.SetFocus
     else
     if edProveedor.Visible then
        edProveedor.SetFocus;
  end
end;

procedure TfrmMovimientosDeInventario.ibCancelarPartidaClick(
  Sender: TObject);
begin
  paTituloDetalle.Caption := 'Partidas';
  edicionDetalle          := not edicionDetalle;
  fijarBotones;
end;

procedure TfrmMovimientosDeInventario.sbRefreshSubTiposClick(
  Sender: TObject);
begin
   MovimientosDeInventario.refreshSubTipo;
end;

procedure TfrmMovimientosDeInventario.sbRefreshAlmOrigenClick(
  Sender: TObject);
begin
   MovimientosDeInventario.refreshAlmacenes;
end;

procedure TfrmMovimientosDeInventario.sbRefreshAlmDestinoClick(
  Sender: TObject);
begin
   MovimientosDeInventario.refreshAlmacenes;
end;

procedure TfrmMovimientosDeInventario.sbRefreshMonedasClick(
  Sender: TObject);
begin
   MovimientosDeInventarioDet.refreshMonedas;
end;

procedure TfrmMovimientosDeInventario.ibGuardarPartidaClick(
  Sender: TObject);
var
   i, j      : integer;
   material  : integer;
   unidad    : integer;
   precio    : double;
   renglones : integer;

   grabar : boolean;
   tmp    : integer;
begin
   tmp    := 0;
   grabar := true;
   if (edCliente.Visible or edProveedor.Visible) and grabar then
   begin
      if edProveedor.Visible and (MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO = 0) then
      begin
         grabar := false;
         MessageDlg('Falta capturar proveedor.',mtError, [mbOk], 0);
         edProveedor.SetFocus;
      end
      else
         if edProveedor.Visible then
         begin
            tmpSujeto       := MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO;
            tmpSujetoNombre := edProveedor.Text;
         end;

      if edCliente.Visible and (MovimientosDeInventarioDet.CLIENTE = 0) then
      begin
         grabar := false;
         MessageDlg('Falta capturar cliente.',mtError, [mbOk], 0);
         edCliente.SetFocus;
      end
      else
         if edCliente.Visible then
         begin
            tmpSujeto       := MovimientosDeInventarioDet.CLIENTE;
            tmpSujetoNombre := edCliente.Text;
         end;
   end;

   if edLote.Visible and grabar  then
      if edLote.Text = '' then
      begin
         grabar := false;
         MessageDlg('Falta capturar lote.',mtError, [mbOk], 0);
         edLote.SetFocus;
      end;

   if edSerie.Visible and grabar  then
      if edSerie.Text = '' then
      begin
         grabar := false;
         MessageDlg('Falta capturar serie.',mtError, [mbOk], 0);
         edSerie.SetFocus;
      end;

   if grabar then
   begin
      material := MarcoMateriales1.edMaterial.Tag;
      unidad   := MarcoMateriales1.cbUnidades.KeyValue;
      precio   := StrToFloat(MarcoMateriales1.edPrecioCosto.Text);
      //proceso normal
      if not(MarcoMateriales1.FLAG_MEDIDAS) or (MarcoMateriales1.FLAG_ESTADO = stModificar) then
      begin
         if MarcoMateriales1.FLAG_MEDIDAS then
            MovimientosDeInventarioDet.MEDIDA := MarcoMateriales1.cbMedidas.KeyValue
         else
            MovimientosDeInventarioDet.MEDIDA := 0;

         if MarcoMateriales1.FLAG_COLORES then
            MovimientosDeInventarioDet.COLOR  := MarcoMateriales1.cbColores.KeyValue
         else
            MovimientosDeInventarioDet.COLOR  := 0;

         if not(edProveedor.Visible) then
            MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := 0;
         if not(edCliente.Visible) then
            MovimientosDeInventarioDet.CLIENTE := 0;

         MovimientosDeInventarioDet.MOVIMIENTOS_DE_INVENTARIO := idActual;
         MovimientosDeInventarioDet.MATERIAL                  := material;
         MovimientosDeInventarioDet.UNIDAD                    := unidad;
         MovimientosDeInventarioDet.COSTO                     := precio;
         MovimientosDeInventarioDet.CANTIDAD                  := StrToFloat(MarcoMateriales1.edCantidad.Text);
         MovimientosDeInventarioDet.MONEDA                    := cbMonedas.KeyValue;
         MovimientosDeInventarioDet.LOTE                      := edLote.Text;
         MovimientosDeInventarioDet.SERIE                     := edSerie.Text;

         tmp := MovimientosDeInventarioDet.Guardar;
         if tmp <> -1 then
         begin
            MovimientosDeInventarioDet.CargarDatos(tmp);
         end
         else
            MovimientosDeInventarioDet.CargarDatos(MovimientosDeInventarioDet.ID);
         paTituloDetalle.Caption := 'Partidas';
         edicionDetalle := not edicionDetalle;
         FijarBotones;
      end
      else
      if MarcoMateriales1.FLAG_MEDIDAS then
      begin
         if MarcoMateriales1.buCapturar.Visible then
         begin
            ibCancelarPartida.Click;

            if MarcoMateriales1.frmHorizontal.colores then
               renglones := MarcoMateriales1.frmHorizontal.renglones
            else
               renglones := 1;

            MovimientosDeInventarioDet.ID                    := -1;
            MovimientosDeInventarioDet.ID_INVENTARIO         := 0;
            MovimientosDeInventarioDet.CAJAS                 := 0;
            MovimientosDeInventarioDet.PEDIDO                := 0;
            MovimientosDeInventarioDet.PEDIDO_DETALLE        := 0;
            MovimientosDeInventarioDet.FACTURA               := 0;
            MovimientosDeInventarioDet.FACTURA_DETALLE       := 0;
            MovimientosDeInventarioDet.DEVOLUCIONES_CANTIDAD := 0;
            MovimientosDeInventarioDet.DEVOLUCIONES_CAJA     := 0;
            MovimientosDeInventarioDet.REFERENCIA            := '';
            MovimientosDeInventarioDet.ESTATUS               := 'Activo';
            if not(edProveedor.Visible) then
               MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := 0;
            if not(edCliente.Visible) then
               MovimientosDeInventarioDet.CLIENTE := 0;
            MovimientosDeInventarioDet.MOVIMIENTOS_DE_INVENTARIO := idActual;
            MovimientosDeInventarioDet.MATERIAL                  := material;
            MovimientosDeInventarioDet.UNIDAD                    := unidad;
            MovimientosDeInventarioDet.COSTO                     := precio;
            MovimientosDeInventarioDet.MONEDA                    := cbMonedas.KeyValue;
            MovimientosDeInventarioDet.LOTE                      := edLote.Text;
            MovimientosDeInventarioDet.SERIE                     := edSerie.Text;
            for i := 1 to renglones do
               for j := 1 to (MarcoMateriales1.frmHorizontal.columnas) do
               begin
                  if MarcoMateriales1.frmHorizontal.cantStr(i, j) <> '' then
                  begin
                     MovimientosDeInventarioDet.CANTIDAD := MarcoMateriales1.frmHorizontal.cantNum(i, j);
                     MovimientosDeInventarioDet.MEDIDA   := MarcoMateriales1.frmHorizontal.medida(j);

                     if MarcoMateriales1.FLAG_COLORES then
                        MovimientosDeInventarioDet.COLOR := MarcoMateriales1.frmHorizontal.color(i)
                     else
                        MovimientosDeInventarioDet.COLOR := 0;

                     tmp := MovimientosDeInventarioDet.Guardar;
                  end;
               end;
            MovimientosDeInventarioDet.CargarDatos(tmp);
         end;
      end;
   end;
end;

procedure TfrmMovimientosDeInventario.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   tmpSujeto       := 0;
   tmpSujetoNombre := '';
   cerrar          := false;
   MarcoMateriales1.inicializar(true);
   MarcoMateriales1.FLAG_COSTO := 1; //da el costo ultima compra
   //El campo debe ir despues de inicializar, puesto que ahi se coloca la variable a verdadero.
   MarcoMateriales1.ELECCION    := false;//Toma la todos los materiales en la busqueda, indpendiente de que tipo de movimiento sea.
   MarcoMateriales1.PEDIR_SERIE := true;


  //Activar columna Medidas
  //dgPartidasMEDIDAS.Visible := MarcoMateriales1.FLAG_MEDIDAS;
  //Activar columna colores
  //dgPartidasCOLORES.Visible := MarcoMateriales1.FLAG_COLORES;
  //Activar Fecha de Alta
  dmIBData.TPreferencias.Filter := 'ID = 337';
  awrActivarFA := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

end;

procedure TfrmMovimientosDeInventario.ibModificarPartidaClick(
  Sender: TObject);
begin
  if not(dgPartidasDBTableView1.DataController.DataSource.DataSet.IsEmpty) then
  begin
     paTituloDetalle.Caption := 'Modificar';
     edicionDetalle          := not edicionDetalle;
     fijarBotones;
     cbMonedas.ListSource     := MovimientosDeInventarioDet.DSMONEDAS;

     if edCliente.Visible then
        edCliente.Text := dgPartidasDBTableView1.DataController.DataSource.DataSet.FieldByName('R_CLIENTE_NOMBRE').AsString;
     if edProveedor.Visible then
        edProveedor.Text := dgPartidasDBTableView1.DataController.DataSource.DataSet.FieldByName('R_PROVEEDOR_NOMBRE').AsString;

     MarcoMateriales1.limpiar;
     //sirve asi, para el caso en que se edite el registro
     //no capturar con boton Capturar.
     MarcoMateriales1.FLAG_ESTADO := stModificar;
     MovimientosDeInventarioDet.Cargar;
     CargarValoresDetalle;
  end;
end;

procedure TfrmMovimientosDeInventario.ibEliminarPartidaClick(
  Sender: TObject);
var
   i : integer;
   L : TList;
   tmp : string;
begin
   if MessageDlg('Eliminar registro',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     {
     L := TList.Create;
     for i := 0 to dgPartidasDBTableView1.DataController.SelectedCount - 1 do
         L.Add(dgPartidasDBTableView1.DataController.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
     for i := 0 to (L.Count - 1) do
     begin
        tmp := TdxTreeListNode(L.Items[i]).Strings[2];
        qyIBXEliminar.ParamByName('P_ID').AsString := tmp;
        qyIBXEliminar.ExecSQL;
        qyIBXEliminar.Transaction.CommitRetaining;
     end;
     L.Free;
     MovimientosDeInventarioDet.CargarDatos(0);
     }
  end;
end;

procedure TfrmMovimientosDeInventario.dgPartidasDblClick(Sender: TObject);
begin
   if ibCancelarPartida.Enabled then
      ibCancelarPartida.Click;
   if ibModificarPartida.Enabled and not(dgPartidasDBTableView1.DataController.DataSource.DataSet.IsEmpty) then
      ibModificarPartida.Click
   else
      if ibNuevaPartida.Enabled then
         ibNuevaPartida.Click;
end;

procedure TfrmMovimientosDeInventario.edSerieKeyPress(Sender: TObject;
  var Key: Char);
var
   material  : integer;
   cantidad  : double;
   unidad    : integer;
   costo     : double;
   moneda    : integer;
   cliente   : variant;
   proveedor : variant;
   lote      : string;
begin
   if (key = #13) and (edSerie.Text <> '') then
   begin
      material  := MarcoMateriales1.edMaterial.Tag;
      cantidad  := StrToFloat(MarcoMateriales1.edCantidad.Text);
      unidad    := MarcoMateriales1.cbUnidades.KeyValue;
      costo     := StrToFloat(MarcoMateriales1.edPrecioCosto.Text);
      moneda    := cbMonedas.KeyValue;
      cliente   := MovimientosDeInventarioDet.CLIENTE;
      proveedor := MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO;
      lote      := edLote.Text;
      MarcoMateriales1.edCantidad.Text := '1';
      ibGuardarPartida.Click;
      cantidad  := cantidad - 1;
      if cantidad > 0 then
      begin
         ibNuevaPartida.Click;
         MarcoMateriales1.edMaterial.Tag            := material;
         MarcoMateriales1.edCantidad.Text           := FloatToStr(cantidad);
         MarcoMateriales1.cbUnidades.KeyValue := unidad;
         MarcoMateriales1.edPrecioCosto.Text       := FloatToStr(costo);
         cbMonedas.KeyValue                   := moneda;
         MovimientosDeInventarioDet.CLIENTE         := cliente;
         MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := proveedor;
         edLote.Text := lote;
         edSerie.SetFocus;
      end;
   end
end;

procedure TfrmMovimientosDeInventario.cbEstatusChange(Sender: TObject);
begin
  edEstatus.Text := cbEstatus.Text;
  if edEstatus.Text <> '' then
  begin
     MovimientosDeInventario.cargarEstatusEjecucion;
     ibAplicar.Enabled := true;
     ibGuardar.Enabled := false;
  end;
end;

procedure TfrmMovimientosDeInventario.ibAplicarClick(Sender: TObject);
begin
   edEstatus.Text := estatus;
   ibGuardar.Click;
   if MovimientosDeInventario.ejecucionEstatus(idActual) then
   begin
      paTitulo.Caption := IntToStr(idActual);
      MovimientosDeInventario.Cargar(idActual);
      MovimientosDeInventarioDet.Cargar(idActual);
      CargarValores;
      fijarBotones;
   end;
end;

procedure TfrmMovimientosDeInventario.NavegadorClick;
begin
   tmpSujeto := 0;
   tmpSujetoNombre := '';

   if ibCancelar.Enabled then
      ibCancelar.Click;
   if ibCancelarPartida.Enabled then
      ibCancelarPartida.Click;
   idActual := dgPartidasDBTableView1.DataController.DataSource.DataSet.FieldByName('R_ID').AsInteger;
   MovimientosDeInventario.Cargar(idActual);
   MovimientosDeInventarioDet.Cargar(idActual);
   CargarValores;
   fijarBotones;
end;

procedure TfrmMovimientosDeInventario.buInicioClick(Sender: TObject);
begin
   dgPartidasDBTableView1.DataController.DataSource.DataSet.First;
   NavegadorClick;
end;

procedure TfrmMovimientosDeInventario.buAnteriorClick(Sender: TObject);
begin
  dgPartidasDBTableView1.DataController.DataSource.DataSet.Prior;
  NavegadorClick;
end;

procedure TfrmMovimientosDeInventario.buSiguienteClick(Sender: TObject);
begin
   dgPartidasDBTableView1.DataController.DataSource.DataSet.Next;
   NavegadorClick;
end;

procedure TfrmMovimientosDeInventario.buFinClick(Sender: TObject);
begin
   dgPartidasDBTableView1.DataController.DataSource.DataSet.Last;
   NavegadorClick;
end;

procedure TfrmMovimientosDeInventario.ibSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMovimientosDeInventario.MarcoMateriales1edMaterialKeyPress(
  Sender: TObject; var Key: Char);
begin
  MarcoMateriales1.edMaterialKeyPress(Sender, Key);

  if not(MarcoMateriales1.qyIBXMateriales.IsEmpty) and (Key = #13) then
  begin
     if not(cerrar) then
     begin
        laLote.Visible  := false;
        laSerie.Visible := false;
        edLote.Visible  := false;
        edSerie.Visible := false;
        if MarcoMateriales1.qyIBXMateriales.FieldByName('LOTE').AsString = 'Si' then
        begin
           laLote.Visible := true;
           edLote.Visible := true;
        end;
        if MarcoMateriales1.qyIBXMateriales.FieldByName('NUM_SERIE').AsString = 'Si' then
        begin
           laSerie.Visible := true;
           edSerie.Visible := true;
        end;
     end;
   end;
end;

procedure TfrmMovimientosDeInventario.NuevaPartida1Click(Sender: TObject);
begin
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmMovimientosDeInventario.ModificarPartida1Click(
  Sender: TObject);
begin
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmMovimientosDeInventario.GuardarPartida1Click(
  Sender: TObject);
begin
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmMovimientosDeInventario.CancelarPartida1Click(
  Sender: TObject);
begin
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmMovimientosDeInventario.EliminarPartida1Click(
  Sender: TObject);
begin
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmMovimientosDeInventario.dgPartidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{
  with TDBGrid(Sender) do
    if (Key = VK_RETURN) and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)]is TdxDBGridCheckColumn) then
    begin
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasError) then
          if dgPartidas.DataSource.DataSet.FieldByName('R_ERROR').AsString = 'Si' then
             MovimientosDeInventarioDet.mensajeError(dgPartidas.DataSource.DataSet.FieldByName('R_ID_ERROR').AsInteger);
    end;
    }
end;

procedure TfrmMovimientosDeInventario.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 edCliente.Text                     := frmSeleccionarCliente.NOMBRE;
                 MovimientosDeInventarioDet.CLIENTE := frmSeleccionarCliente.ID;
                 cbMonedas.KeyValue           := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                     := frmSeleccionarCliente.NOMBRE;
                 MovimientosDeInventarioDet.CLIENTE := frmSeleccionarCliente.ID;
                 cbMonedas.KeyValue           := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;

           if MovimientosDeInventarioDet.CLIENTE <> 0 then
           begin
              MarcoMateriales1.CLIENTE := MovimientosDeInventarioDet.CLIENTE;
           end;
        end;
    1 : begin
           MovimientosDeInventarioDet.CLIENTE := 0;
           edCliente.Clear;
        end;
  end;
end;

procedure TfrmMovimientosDeInventario.edProveedorButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarProveedor             := TfrmSeleccionarProveedor.Create(Application);
           frmSeleccionarProveedor.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarProveedor.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarProveedor.CLAVE       := edProveedor.Text;
           if frmSeleccionarProveedor.abrirConsulta then
           begin
              frmSeleccionarProveedor.ShowModal;
              if frmSeleccionarProveedor.ACEPTAR then
              begin
                 MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := frmSeleccionarProveedor.ID;
                 edProveedor.Text                                 := frmSeleccionarProveedor.NOMBRE;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           end
           else
              begin
                 MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := frmSeleccionarProveedor.ID;
                 edProveedor.Text                                 := frmSeleccionarProveedor.NOMBRE;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           frmSeleccionarProveedor.Free;
           frmSeleccionarProveedor := nil;
        end;
    1 : begin
           MovimientosDeInventarioDet.PROVEEDOR_CONSOLIDADO := 0;
           edProveedor.Clear;
        end;
  end;
end;

procedure TfrmMovimientosDeInventario.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key = #13 then
  //   edCliente.OnButtonClick(sender, 0);
end;

procedure TfrmMovimientosDeInventario.edProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key = #13 then
  //   edProveedor.OnButtonClick(Sender, 0);
end;

procedure TfrmMovimientosDeInventario.ibArchivoClick(Sender: TObject);
begin
   MovimientosDeInventarioDet.CargarArchivo;
end;

procedure TfrmMovimientosDeInventario.ibSubirClick(Sender: TObject);
var
   i : integer;
begin
   MarcoMateriales1.CAMPO := 'M.CODIGO_BARRAS';
   MarcoMateriales1.ABRIR := false;
   if MovimientosDeInventarioDet.GRID.RowCount > 1 then
   begin
      for i := 1 to MovimientosDeInventarioDet.GRID.RowCount do
      begin
         if MovimientosDeInventarioDet.GRID.Cells[1,i] = 'X' then
         begin
            {
            ibNuevaPartida.Click;
            MarcoMateriales1.edMaterial.Text := MovimientosDeInventarioDet.GRID.Cells[0, i];
            MarcoMateriales1.edMaterial.OnButtonClick(nil, 0);
            if MarcoMateriales1.edMaterial.Tag <> 0 then
            begin
               try
                  MarcoMateriales1.edCantidad.Text := StrToInt(MovimientosDeInventarioDet.GRID.Cells[3,i]);
                  ibGuardarPartida.Click;
                  MovimientosDeInventarioDet.GRID.Cells[1,i] := 'Ok.';
                  MovimientosDeInventarioDet.GRID.Cells[2,i] := 'Afectado: '+MarcoMateriales1.edMaterial.Text;
               except
                  ibCancelarPartida.Click;
                  MovimientosDeInventarioDet.GRID.Cells[2,i] := 'Falta definir unidad base de: '+MarcoMateriales1.edMaterial.Text;
               end;
            end
            else
               begin
                  ibCancelarPartida.Click;
                  MovimientosDeInventarioDet.GRID.Cells[2,i] := 'No se encontro registro y no se dio de alta';
               end;
            }
         end;
      end;
   end;
   MarcoMateriales1.CAMPO := '';
   MarcoMateriales1.ABRIR := true;
end;

procedure TfrmMovimientosDeInventario.buConteoClick(Sender: TObject);
begin
   if MessageDlg('Este proceso ajusta su inventario = conteo + compras - ventas; apartir de la fecha del movmiento de Inventario.',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      MovimientosDeInventario.EjecutarAjusteConteo;
      ShowMessage('Se ha actualizado su intentario.');
   end;
end;

procedure TfrmMovimientosDeInventario.FormDestroy(Sender: TObject);
begin
   MarcoMateriales1.Destruir;
end;

procedure TfrmMovimientosDeInventario.edLineaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   c : TPoint;
begin
   case AbsoluteIndex of
     0: begin
           c := edLinea.ClientToScreen(Point(0,0));
           frmLineasSub := TfrmLineasSub.Create(Application);
           frmLineasSub.coordenadas(c.x, c.y + edLinea.Height);
           frmLineasSub.ShowModal();
           edLinea.Tag := frmLineasSub.dame_seleccion;
           if edLinea.Tag = 0 then
           begin
              edLinea.Text    := '<FALTA>';
              //edLinea.SetSelection(Length(edLinea.Text),Length(edLinea.Text),false);
           end
           else
              begin
                 edLinea.Text    := frmLineasSub.dame_strSeleccion;
                 //edLinea.SetSelection(Length(edLinea.Text),Length(edLinea.Text),false);
              end;
           frmLineasSub.Destroy;
        end;
     1: begin
           edLinea.Text    := '<FALTA>';
           //edLinea.SetSelection(Length(edLinea.Text),Length(edLinea.Text),false);
           edLinea.Tag     := 0;
        end;
   end;
end;

procedure TfrmMovimientosDeInventario.edLineaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
     //edLinea.OnButtonClick(sender, 0);
  end;
end;

procedure TfrmMovimientosDeInventario.cbMonedasChange(Sender: TObject);
begin
   MarcoMateriales1.MONEDA := cbMonedas.KeyValue; 
end;

procedure TfrmMovimientosDeInventario.itemImprimirClick(Sender: TObject);
begin
   try
      frmPRN_0029    := TfrmPRN_0029.Create(Application);
      frmPRN_0029.ID := idActual;
      if frmPRN_0029.openFormato then
         frmPRN_0029.imprimir;
   finally
      frmPRN_0029.Release;
   end;

   MovimientosDeInventario.Cargar(idActual);
   CargarValores;
end;

procedure TfrmMovimientosDeInventario.ibImprimirClick(Sender: TObject);
begin
   itemImprimir.Click
end;

procedure TfrmMovimientosDeInventario.itemDiferenciasClick(
  Sender: TObject);
begin
  try
     frmFR_0001             := TfrmFR_0001.Create(Application);
     frmFR_0001.ID          := idActual;
     frmFR_0001.OpenFormato;
     frmFR_0001.imprimir;
  finally
     frmFR_0001.Release;
  end;
end;

procedure TfrmMovimientosDeInventario.ibReAgruparClick(Sender: TObject);
begin
   MovimientosDeInventario.EjecutarReagrupar;
   MovimientosDeInventarioDet.Cargar(MovimientosDeInventario.ID);
end;

procedure TfrmMovimientosDeInventario.MarcoMateriales1edMaterialButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   i : integer;  
begin
  MarcoMateriales1.edMaterialButtonClick(Sender, AbsoluteIndex);

  if (MarcoMateriales1.NUM_SERIE) then
  begin
     MarcoMateriales1.edCantidad.Text := '1';
     if (MarcoMateriales1.FLAG_ESTADO = stNuevo) then
     begin
        for i := 1 to MarcoMateriales1.REPETIR do
        begin
           MarcoMateriales1.pedirSerie;
           edSerie.Text := MarcoMateriales1.SERIE;
           ibGuardarPartida.Click;
        end;
     end;
  end;
end;

procedure TfrmMovimientosDeInventario.buInsuficienciasClick(
  Sender: TObject);
begin
  try
     frmInsuficienciasMI    := TfrmInsuficienciasMI.Create(Application);
     frmInsuficienciasMI.ID := idActual;
     frmInsuficienciasMI.ShowModal;
  finally
     frmInsuficienciasMI.Release;
  end;
end;

procedure TfrmMovimientosDeInventario.buEtiquetasZClick(Sender: TObject);
var
   i           : integer;
   L           : TList;
   etiquetas   : string;
   cbarras     : string;
   clave       : string;
   descripcion : string;
   precio      : string;
   serie       : string;
   medida      : string;
   color       : string;
begin
   if MessageDlg('¿Imprimir etiquetas seleccionadas?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     {
     L := TList.Create;
     for i := 0 to dgPartidas.SelectedCount - 1 do
         L.Add(dgPartidas.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
     for i := 0 to (L.Count - 1) do
     begin
        etiquetas   := TdxTreeListNode(L.Items[i]).Strings[0];
        cbarras     := TdxTreeListNode(L.Items[i]).Strings[1];
        clave       := TdxTreeListNode(L.Items[i]).Strings[4];
        descripcion := TdxTreeListNode(L.Items[i]).Strings[5];
        precio      := TdxTreeListNode(L.Items[i]).Strings[10];
        serie       := TdxTreeListNode(L.Items[i]).Strings[15];
        medida      := TdxTreeListNode(L.Items[i]).Strings[6];
        color       := TdxTreeListNode(L.Items[i]).Strings[7];
        try
           frmGenerar             := TfrmGenerar.Create(Application);
           frmGenerar.FORMATO     := fZebra;
           frmGenerar.ALMACEN     := MovimientosDeInventario.DSALMACENES.DataSet.FieldByName('CLAVE').AsString;
           frmGenerar.CUANTAS     := etiquetas;
           frmGenerar.ARTICULO    := clave;
           frmGenerar.DESCRIPCION := descripcion;
           frmGenerar.CBARRAS     := cbarras;
           frmGenerar.PRECIO      := precio;
           frmGenerar.SERIE       := serie;
           frmGenerar.FECHA       := FormatDateTime('DDMMYY', MovimientosDeInventario.FECHA_HORA);
           frmGenerar.MEDIDA      := medida;
           frmGenerar.COLORES     := color;
           frmGenerar.buImprimir.Click;
        finally
           frmGenerar.Release;
        end;
        Sleep(1000);
     end;
     L.Free;
     }
  end;
end;

procedure TfrmMovimientosDeInventario.buEtiquetasMClick(Sender: TObject);
var
   i           : integer;
   L           : TList;
   etiquetas   : string;
   cbarras     : string;
   clave       : string;
   descripcion : string;
   precio      : string;
   serie       : string;
   medida      : string;
   color       : string;
begin
  if MessageDlg('¿Imprimir etiquetas seleccionadas?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     {
     L := TList.Create;
     for i := 0 to dgPartidas.SelectedCount - 1 do
         L.Add(dgPartidas.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
     for i := 0 to (L.Count - 1) do
     begin
        etiquetas   := TdxTreeListNode(L.Items[i]).Strings[0];
        cbarras     := TdxTreeListNode(L.Items[i]).Strings[1];
        clave       := TdxTreeListNode(L.Items[i]).Strings[4];
        descripcion := TdxTreeListNode(L.Items[i]).Strings[5];
        precio      := TdxTreeListNode(L.Items[i]).Strings[10];
        serie       := TdxTreeListNode(L.Items[i]).Strings[15];
        medida      := TdxTreeListNode(L.Items[i]).Strings[6];
        color       := TdxTreeListNode(L.Items[i]).Strings[7];
        try
           frmGenerar             := TfrmGenerar.Create(Application);
           frmGenerar.FORMATO     := fMonarch;
           frmGenerar.ALMACEN     := MovimientosDeInventario.DSALMACENES.DataSet.FieldByName('CLAVE').AsString;
           frmGenerar.CUANTAS     := etiquetas;
           frmGenerar.ARTICULO    := clave;
           frmGenerar.DESCRIPCION := descripcion;
           frmGenerar.CBARRAS     := cbarras;
           frmGenerar.PRECIO      := precio;
           frmGenerar.SERIE       := serie;
           frmGenerar.FECHA       := FormatDateTime('DDMMYY', MovimientosDeInventario.FECHA_HORA);
           frmGenerar.MEDIDA      := medida;
           frmGenerar.COLORES     := color;
           frmGenerar.buImprimir.Click;
        finally
           frmGenerar.Release;
        end;
        Sleep(1000);
     end;
     L.Free;
     }
  end;
end;

procedure TfrmMovimientosDeInventario.dgPartidasETIQUETAS_MONARCHButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  try
     frmGenerar             := TfrmGenerar.Create(Application);
     frmGenerar.FORMATO     := fMonarch;
     frmGenerar.ALMACEN     := MovimientosDeInventario.DSALMACENES.DataSet.FieldByName('CLAVE').AsString;
     frmGenerar.CUANTAS     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_ETIQUETAS').AsString;
     frmGenerar.ARTICULO    := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MATERIAL_CLAVE').AsString;
     frmGenerar.DESCRIPCION := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
     frmGenerar.CBARRAS     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_CODIGO_BARRAS').AsString;
     frmGenerar.PRECIO      := FormatFloat('$ ###,###,##0.00',MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_COSTO').AsFloat);
     frmGenerar.SERIE       := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_SERIE').AsString;
     frmGenerar.FECHA       := FormatDateTime('DDMMYY', MovimientosDeInventario.FECHA_HORA);
     frmGenerar.MEDIDA      := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MEDIDA_DESCRIPCION').AsString;
     frmGenerar.COLORES     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_COLOR_NOMBRE').AsString;
     frmGenerar.ShowModal;
  finally
     frmGenerar.Release;
  end;
end;

procedure TfrmMovimientosDeInventario.dgPartidasETIQUETAS_ZEBRAButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  try
     frmGenerar             := TfrmGenerar.Create(Application);
     frmGenerar.FORMATO     := fZebra;
     frmGenerar.ALMACEN     := MovimientosDeInventario.DSALMACENES.DataSet.FieldByName('CLAVE').AsString;
     frmGenerar.CUANTAS     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_ETIQUETAS').AsString;
     frmGenerar.ARTICULO    := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MATERIAL_CLAVE').AsString;
     frmGenerar.DESCRIPCION := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
     frmGenerar.CBARRAS     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_CODIGO_BARRAS').AsString;
     frmGenerar.PRECIO      := FormatFloat('$ ###,###,##0.00',MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_COSTO').AsFloat);
     frmGenerar.SERIE       := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_SERIE').AsString;
     frmGenerar.FECHA       := FormatDateTime('DDMMYY', MovimientosDeInventario.FECHA_HORA);
     frmGenerar.MEDIDA      := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_MEDIDA_DESCRIPCION').AsString;
     frmGenerar.COLORES     := MovimientosDeInventarioDet.DSDETALLE.DataSet.FieldByName('R_COLOR_NOMBRE').AsString;
     frmGenerar.ShowModal;
  finally
     frmGenerar.Release;
  end;
end;

procedure TfrmMovimientosDeInventario.itemPreviewClick(Sender: TObject);
begin
   try
      frmPRN_0029    := TfrmPRN_0029.Create(Application);
      frmPRN_0029.ID := idActual;
      if frmPRN_0029.openFormato then
         frmPRN_0029.preview;
   finally
      frmPRN_0029.Release;
   end;
end;

procedure TfrmMovimientosDeInventario.itemSKUGenerarClick(Sender: TObject);
begin
   frmSKUGenerar := TfrmSKUGenerar.Create(Application);
   try
      frmSKUGenerar.MI      := idActual;
      frmSKUGenerar.DataSet := dgPartidasDBTableView1.DataController.DataSource.DataSet;
      frmSKUGenerar.ShowModal;
   finally
      frmSKUGenerar.Free;
   end;
end;

procedure TfrmMovimientosDeInventario.itemSKUConfirmarClick(
  Sender: TObject);
begin
   frmSKUConfirmar := TfrmSKUConfirmar.Create(Application);
   try
      frmSKUConfirmar.MI      := idActual;
//      frmSKUConfirmar.DataSet := dgPartidas.DataSource.DataSet;
      frmSKUConfirmar.ShowModal;
   finally
      frmSKUConfirmar.Free;
   end;

   dgPartidasDBTableView1.DataController.DataSource.DataSet.Close;
   dgPartidasDBTableView1.DataController.DataSource.DataSet.Open;
end;

procedure TfrmMovimientosDeInventario.itemSKUConfirmarCompletoClick(
  Sender: TObject);
begin
   frmSKUConfirmarCompleto := TfrmSKUConfirmarCompleto.Create(Application);
   try
      frmSKUConfirmarCompleto.MI      := idActual;
      frmSKUConfirmarCompleto.DataSet := dgPartidasDBTableView1.DataController.DataSource.DataSet;
      frmSKUConfirmarCompleto.ShowModal;
   finally
      frmSKUConfirmarCompleto.Free;
   end;
end;

procedure TfrmMovimientosDeInventario.buSKUGenerarClick(Sender: TObject);
begin
   itemSKUGenerar.Click;
end;

procedure TfrmMovimientosDeInventario.itemSKUBusquedaClick(
  Sender: TObject);
begin
   frmSKU := TfrmSKU.Create(Application);
   try
      frmSKU.MI      := idActual;
      frmSKU.ALMACEN := cbAlmOrigen.KeyValue;
      frmSKU.DataSet := dgPartidasDBTableView1.DataController.DataSource.DataSet;
      frmSKU.ShowModal;
   finally
      frmSKU.Free;
   end;
end;

procedure TfrmMovimientosDeInventario.ibCopiarClick(Sender: TObject);
begin
   if MessageDlg('¿ Copiar documento ?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
     spCOPIA_MI.ParamByName('P_ID').AsInteger := idActual;
     spCOPIA_MI.ExecProc;
     spCOPIA_MI.Transaction.CommitRetaining;

     ShowMessage('Nuevo M.Inventario con id = ' + spCOPIA_MI.ParamByName('R_MI').AsString  + ' Clave: ' + edClave.Text);
   end;
end;

end.
