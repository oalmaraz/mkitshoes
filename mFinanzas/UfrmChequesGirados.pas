unit UfrmChequesGirados;

interface

uses
  UTipos, UTypeChequesGirados, db, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,    ExtCtrls,
  Grids, DBGrids, ComCtrls, Menus, jpeg,   DBCtrls,
  Buttons, System.Variants;

type
  TfrmChequesGirados = class(TForm)
    paLienzo: TPanel;
    fcLogo: TImage;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    meObservaciones: TMemo;
    edFechaAlta: TDateTimePicker;
    edReferencia: TEdit;
    cbMonedas: TDBLookupComboBox;
    edMonto: TEdit;
    cbChequeras: TDBLookupComboBox;
    Label10: TLabel;
    edFAplicacion: TDateTimePicker;
    edBanco: TEdit;
    edProveedor: TEdit;
    edProveedorNombre: TEdit;
    Label8: TLabel;
    sbEstatus: TPanel;
    ibSalir: TBitBtn;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    Label11: TLabel;
    edFolio: TEdit;
    edFAReal: TDateTimePicker;
    paTitulo: TPanel;
    paBotones: TPanel;
    ibNuevo: TBitBtn;
    ibModificar: TBitBtn;
    ibGuardar: TBitBtn;
    ibCancelar: TBitBtn;
    ibEliminar: TBitBtn;
    ibImprimir: TBitBtn;
    ibAyuda: TBitBtn;
    dgPartidas: TDBGrid;
    ppImpresion: TPopupMenu;
    itemPartida: TMenuItem;
    itemTodo: TMenuItem;
    buImpresion: TBitBtn;
    itemRejilla: TMenuItem;
    ibPantalla: TBitBtn;
    ibCorte: TBitBtn;
    Label18: TLabel;
    laRejilla: TLabel;
    sbColapsar: TBitBtn;
    sbExpandir: TBitBtn;
    cbEstatus: TDBLookupComboBox;
    buAplicar: TEdit;
    itemPoliza: TMenuItem;
    itemPolizaT: TMenuItem;
    cbAbonoCta: TEdit;
    buActMonedas: TBitBtn;
    buActChequeras: TBitBtn;
    laPanel: TBitBtn;
    itemContinuo: TMenuItem;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibCancelarClick(Sender: TObject);
    procedure cbChequerasChange(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure cbEstatusChange(Sender: TObject);
    procedure buAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibEliminarClick(Sender: TObject);
    procedure edProveedorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure laPanelDblClick(Sender: TObject);
    procedure dgPartidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure itemTodoClick(Sender: TObject);
    procedure ibPantallaClick(Sender: TObject);
    procedure ibCorteClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure dgPartidasCHEQUEButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure itemPolizaClick(Sender: TObject);
    procedure dgPartidasPOLIZAButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure itemPolizaTClick(Sender: TObject);
    procedure buActMonedasClick(Sender: TObject);
    procedure buActChequerasClick(Sender: TObject);
    procedure itemContinuoClick(Sender: TObject);
  private
    { Private declarations }
    capturar    : boolean;
    cheques     : TChequesGirados;
    grid        : TDBGrid;
    estatus     : string;
    cerrar      : boolean;
    edicion     : boolean;
    idActual    : integer;
    awrUsuario  : integer;
    habilitar   : boolean;
    awrIndexPos : integer;
    procedure FijarBotones;
    procedure CargarValores;
    procedure DataChange(Sender: TObject; Field: TField);
    procedure setIndexPos(valor : integer);
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; pId : integer);overload;
    constructor Crear(AOwner : TComponent; pGrid : TDBGrid);overload;
  published
    property Usuario   : integer read awrUsuario write awrUsuario;
    property ID        : integer read idActual write idActual;
    property Rejilla   : TDBGrid read grid write grid;
    property rIndexPos : integer read awrIndexPos write setIndexPos;
  end;

var
  frmChequesGirados: TfrmChequesGirados;

implementation

uses UfrmSeleccionarProveedor, PRN_0018_CHEQUES_TXT,
  capturar_cheques_girados_movimientos, PRN_CORTE_CHEQUES_GIRADOS,
  UfrmPolizasEDetalle, reglas_de_negocios;

{$R *.DFM}

constructor TfrmChequesGirados.Crear(AOwner : TComponent; pId : integer);
begin
   inherited Create(AOwner);
   idActual  := pId;
end;

constructor TfrmChequesGirados.Crear(AOwner : TComponent; pGrid : TDBGrid);
begin
   Crear(AOwner, -1);
   grid    := pGrid;
   if not(grid.DataSource.DataSet.IsEmpty) then
      idActual := grid.DataSource.DataSet.FieldByName('R_ID').AsInteger
   else
      idActual := -1;
end;

procedure TfrmChequesGirados.setIndexPos(valor : integer);
var
   awrIndex : integer;
begin
   habilitar    := false;
   //awrIndex    := dgPartidas.TopIndex;
   awrIndexPos := valor;
   cheques.refreshPendientes;
   if not(Cheques.VACIO) then
   begin
      sbExpandir.Click;
      dgPartidas.DataSource.DataSet.First;
      while not(dgPartidas.DataSource.DataSet.EOF) do
      begin
         if cheques.dsPendientes.DataSet.FieldByName('R_ID').AsInteger = awrIndexPos then
            break;
         dgPartidas.DataSource.DataSet.Next;
      end;
      //dgPartidas.TopIndex := awrIndex;
   end;
   habilitar := true;
end;

procedure TfrmChequesGirados.DataChange(Sender: TObject; Field: TField);
begin
   if ibCancelar.Enabled then
      ibCancelar.Click;
   if habilitar then//cuando se selecciona no tarde en verse en pantalla
   begin
      if dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger <> idActual then
      begin
         idActual := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
         cheques.Cargar(idActual);
         CargarValores;
         fijarBotones;
      end;
   end;
end;

procedure TfrmChequesGirados.FijarBotones;
begin
  //botones encabezado
  ibNuevo.Enabled            := not edicion;
  ibModificar.Enabled        := not edicion and not(cheques.VACIO);
  ibGuardar.Enabled          := edicion;
  ibCancelar.Enabled         := edicion;
  ibEliminar.Enabled         := not edicion and not(cheques.VACIO);
  ibImprimir.Enabled         := not edicion and not(cheques.VACIO);

  //componentes encabezado
//  paLienzo.Visible           := edicion;         
  edFechaAlta.Enabled        := edicion;
  edFAplicacion.Enabled      := edicion;
  edReferencia.Enabled       := edicion;
  edProveedor.Enabled        := edicion;
  edProveedorNombre.Enabled  := edicion;
  cbChequeras.Enabled        := edicion;
  buActChequeras.Enabled     := edicion;
  edBanco.Enabled            := edicion;
  edMonto.Enabled            := edicion;
  cbMonedas.Enabled          := edicion;
  buActMonedas.Enabled       := edicion;
  cbAbonoCta.Enabled         := edicion;
//  edFolio.Enabled            := edicion;
//  edFAReal.Enabled           := edicion;
  meObservaciones.Enabled    := edicion;
//  edEstatus.Enabled          := edicion;
  cbEstatus.Enabled          := not(edicion);
  buAplicar.Enabled          := not(edicion);

  //botones estatus bar
  buInicio.Enabled           :=  not(edicion);
  buAnterior.Enabled         :=  not(edicion);
  buSiguiente.Enabled        :=  not(edicion);
  buFin.Enabled              :=  not(edicion);
end;

procedure TfrmChequesGirados.CargarValores;
begin
  // Cargamos los valores de las propiedades en los componentes
  // visuales del formulario
  paTitulo.Caption := 'Encabezado ('+IntToStr(cheques.ID)+')';

  //componentes encabezado
  edFechaAlta.Date           := cheques.FECHA_ALTA;
  edFAplicacion.Date         := cheques.FECHA_APLICACION;
  edReferencia.Text          := cheques.REFERENCIA;

  if (cheques.PROVEEDOR = 0) or (cheques.PROVEEDOR = null) then
     edProveedor.Tag  := 0
  else
     edProveedor.Tag  := cheques.PROVEEDOR;
  edProveedor.Text       := cheques.PROVEEDOR_CLAVE;
  edProveedorNombre.Text := cheques.PROVEEDOR_NOMBRE;

  if (cheques.CHEQUERA <> 0) then
     cbChequeras.KeyValue := cheques.CHEQUERA
  else
     cbChequeras.KeyValue := 0;

  edBanco.Tag        := cheques.BANCO;
  edBanco.Text       := cheques.BANCO_NOMBRE;
  edMonto.Text       := FloatToStr(cheques.MONTO);
  cbAbonoCta.Text := cheques.ABONO_CTA ;

  if (cheques.MONEDA <> 0) then
     cbMonedas.KeyValue := cheques.MONEDA
  else
     cbMonedas.KeyValue := 0;

  edFolio.Text           := IntToStr(cheques.CONSECUTIVO);
  edFAReal.Date           := cheques.FECHA_APLICACION_REAL;

  cheques.OBSERVACIONES.Position := 0;
  meObservaciones.Lines.LoadFromStream(cheques.OBSERVACIONES);

//  edEstatus.Text := cheques.ESTATUS;
  cheques.activarEstatus;
end;

procedure TfrmChequesGirados.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmChequesGirados.FormCreate(Sender: TObject);
begin
   habilitar := true;
   cheques   := TChequesGirados.Create;
   //dgPartidas.LoadFromIniFile(ExtractFilePath(ParamStr(0))+dgPartidas.IniFileName);
   capturar  := true;
   edicion   := false;
end;

procedure TfrmChequesGirados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  cerrar := true;
  // Liberamos el objeto
  cheques.Free;
  cheques := nil;

  Action := caFree;
end;

procedure TfrmChequesGirados.FormActivate(Sender: TObject);
begin
{   if grid <> nil then
      idActual := grid.DataSource.DataSet.FieldByName('R_ID').AsInteger;}
   cheques.refreshPendientes;
   sbExpandir.Click;
   dgPartidas.DataSource.DataSet.First;
{   cheques.Cargar(idActual);
   CargarValores;
   fijarBotones;}
end;

procedure TfrmChequesGirados.FormShow(Sender: TObject);
begin
   cbMonedas.ListSource      := cheques.dsMonedas;
   cbChequeras.ListSource    := cheques.dsChequeras;
   cbEstatus.ListSource      := cheques.dsEstatus;
   dgPartidas.DataSource     := cheques.dsPendientes;
   cheques.dsPendientes.OnDataChange := DataChange;
end;

procedure TfrmChequesGirados.ibNuevoClick(Sender: TObject);
begin
  IdActual := cheques.ID;
  cheques.Cargar(-1);
  paTitulo.Caption := 'Encabezado (Nuevo)';
  edicion := not edicion;
  fijarBotones;
  CargarValores;
  edReferencia.SetFocus;
end;

procedure TfrmChequesGirados.ibCancelarClick(Sender: TObject);
begin
  paTitulo.Caption := 'Encabezado ('+IntToStr(idActual)+')';
  edicion := not edicion;
  cheques.Cargar(idActual);
  fijarBotones;
  CargarValores;
end;

procedure TfrmChequesGirados.cbChequerasChange(Sender: TObject);
begin
   if (cbChequeras.Text <> '') then
   begin
      cheques.BANCO := 0;
      edBanco.Tag   := cheques.BANCO;
      edBanco.Text  := cheques.BANCO_NOMBRE;
   end;
end;

procedure TfrmChequesGirados.ibGuardarClick(Sender: TObject);
var
   grabar : boolean;
   tmp    : integer;
begin
   grabar := true;
   if cbChequeras.Text = '' then
   begin
      grabar := false;
      MessageDlg('Falta capturar chequera.',mtError, [mbOk], 0);
   end;

   if grabar then
   begin
      cheques.REFERENCIA := edReferencia.Text;
      cheques.MONTO      := StrToFloat(edMonto.Text);
      cheques.MONEDA     := cbMonedas.KeyValue;
      if edProveedor.Tag <> 0 then
         cheques.PROVEEDOR := edProveedor.Tag
      else
         cheques.PROVEEDOR := null;
      cheques.PROVEEDOR_CLAVE  := edProveedor.Text;
      cheques.PROVEEDOR_NOMBRE := edProveedorNombre.Text;
      cheques.FECHA_ALTA       := edFechaAlta.Date;
      cheques.FECHA_APLICACION := edFAplicacion.Date;
      cheques.OBSERVACIONES.Clear;
      meObservaciones.Lines.SaveToStream(cheques.OBSERVACIONES);
      cheques.USUARIO  := Usuario;
//      cheques.ESTATUS  := edEstatus.Text;
      cheques.CHEQUERA := cbChequeras.KeyValue;
      cheques.BANCO    := edBanco.Tag;


         cheques.ABONO_CTA := cbAbonoCta.Text ;


      tmp := cheques.Guardar;
      if tmp <> -1 then
      begin
         idActual := tmp;
         cheques.Cargar(idActual);
      end;
      paTitulo.Caption := 'Encabezado ('+IntToStr(idActual)+')';
      edicion := not edicion;
      FijarBotones;
      CargarValores;


      rIndexPos := idActual;
   end;
end;

procedure TfrmChequesGirados.ibModificarClick(Sender: TObject);
begin
   paTitulo.Caption := 'Encabezado (Modificar)';
   idActual := cheques.ID;
   estatus  := cheques.ESTATUS;
   edicion  := not edicion;
   fijarBotones;
   edReferencia.SetFocus;
end;

procedure TfrmChequesGirados.cbEstatusChange(Sender: TObject);
begin
//   edEstatus.Text := cbEstatus.Text;
   if cbEstatus.Text <> '' then
   begin
      cheques.cargarEstatusEjecucion;
   end;
end;

procedure TfrmChequesGirados.buAplicarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if cheques.ejecucionEstatus(cheques.USUARIO) then
   begin
      cheques.Cargar(idActual);
      CargarValores;
      fijarBotones;
      rIndexPos := idActual;
      //por si se afecto el registro y ya no aparece en el grid.
      if idActual <> dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger then
      begin
         idActual := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
         cheques.Cargar(idActual);
         CargarValores;
         fijarBotones;
      end;
   end;
end;

procedure TfrmChequesGirados.ibEliminarClick(Sender: TObject);
begin
   if MessageDlg('¿Eliminar registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      cheques.eliminar;


      if dgPartidas.DataSource.DataSet.BOF and dgPartidas.DataSource.DataSet.EOF then
      begin//solamente existe un solo registro
         idActual := 0;
      end
      else
      if dgPartidas.DataSource.DataSet.BOF then
      begin
         dgPartidas.DataSource.DataSet.Next;
         idActual := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      end
      else
      begin
         dgPartidas.DataSource.DataSet.Prior;
         idActual := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      end;
      cheques.Cargar(idActual);
      fijarBotones;
      cargarValores;
      rIndexPos := idActual;
   end;
end;

procedure TfrmChequesGirados.edProveedorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   case AbsoluteIndex of
     0: begin
           frmSeleccionarProveedor             := TfrmSeleccionarProveedor.Create(Application);
           frmSeleccionarProveedor.DATABASE    := cheques.DATABASE;
           frmSeleccionarProveedor.TRANSACTION := cheques.TRANSACTION;
           frmSeleccionarProveedor.CLAVE       := edProveedor.Text;
           if frmSeleccionarProveedor.abrirConsulta then
           begin
              frmSeleccionarProveedor.ShowModal;
              if frmSeleccionarProveedor.ACEPTAR then
              begin
                 edProveedor.Tag        := frmSeleccionarProveedor.ID;
                 edProveedor.Text       := frmSeleccionarProveedor.CLAVE;
                 edProveedorNombre.Text := frmSeleccionarProveedor.FACTURAR_A;
                 cheques.PROVEEDOR_CLAVE  := frmSeleccionarProveedor.CLAVE;
                 cheques.PROVEEDOR_NOMBRE := frmSeleccionarProveedor.FACTURAR_A;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           end
           else
              begin
                 edProveedor.Tag        := frmSeleccionarProveedor.ID;
                 edProveedor.Text       := frmSeleccionarProveedor.CLAVE;
                 edProveedorNombre.Text := frmSeleccionarProveedor.FACTURAR_A;
                 cheques.PROVEEDOR_NOMBRE := frmSeleccionarProveedor.FACTURAR_A;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           frmSeleccionarProveedor.Free;
           frmSeleccionarProveedor := nil;
        end;
     1: begin
           edProveedor.Clear;
           edProveedorNombre.Text := '<FALTA>';
           edProveedor.Tag := 0;
        end;
   end;
end;

procedure TfrmChequesGirados.edProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      edProveedorButtonClick(Sender, 0);
   end;
end;

procedure TfrmChequesGirados.laPanelDblClick(Sender: TObject);
begin
   //dgPartidas.ShowGroupPanel := not(dgPartidas.ShowGroupPanel);
end;

procedure TfrmChequesGirados.dgPartidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 32 then//barra espaciadora
  begin
     dgPartidasDblClick(nil);
  end;

  {
  with TdxDBGrid(Sender) do
    if (Key = VK_RETURN) and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)]is TdxDBGridButtonColumn) then
    begin
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasCHEQUE) then
          ibImprimir.Click;
    end;
    }
end;

procedure TfrmChequesGirados.dgPartidasDblClick(Sender: TObject);
var
  index       : integer;
  indexPos    : integer;
begin
   if cheques.dsPendientes.DataSet <> nil then
   begin
      habilitar := false;
      if not(Cheques.VACIO) then
      begin
         //index    := dgPartidas.TopIndex;
         indexPos := cheques.dsPendientes.DataSet.FieldByName('R_ID').AsInteger;
         cheques.Seleccionar;
         sbExpandir.Click;
         dgPartidas.DataSource.DataSet.First;
         while not(dgPartidas.DataSource.DataSet.EOF) do
         begin
            if cheques.dsPendientes.DataSet.FieldByName('R_ID').AsInteger = IndexPos then
            begin
               break;
            end;
            dgPartidas.DataSource.DataSet.Next;
         end;
         //dgPartidas.TopIndex := index;
      end;
      habilitar := true;
   end;
end;



procedure TfrmChequesGirados.ibImprimirClick(Sender: TObject);
begin
   idActual                := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
   frmPRN_0018_TXT         := TfrmPRN_0018_TXT.Create(Application);
   frmPRN_0018_TXT.ID      := idActual;
   frmPRN_0018_TXT.imprimir;
   frmPRN_0018_TXT.Destroy;
   
   //actualizar la pantalla.
   cheques.Cargar(idActual);
   CargarValores;
   fijarBotones;
   rIndexPos := idActual;
end;

procedure TfrmChequesGirados.itemTodoClick(Sender: TObject);
begin
   //Para imprimir todos los que tenga seleccionado = "Si"
   habilitar := false;
   frmPRN_0018_TXT := TfrmPRN_0018_TXT.Create(Application);
   frmPRN_0018_TXT.Rejilla := dgPartidas;
   frmPRN_0018_TXT.imprimirBloque;
   frmPRN_0018_TXT.Rejilla := nil;
   frmPRN_0018_TXT.Destroy;
   habilitar := true;
   //actualizar la pantalla.
   cheques.Cargar(idActual);
   CargarValores;
   fijarBotones;
   rIndexPos := idActual;
end;

procedure TfrmChequesGirados.ibPantallaClick(Sender: TObject);
begin
   frmCapturar_ChequesGiradosMovimientos := TfrmCapturar_ChequesGiradosMovimientos.Create(Application);
   frmCapturar_ChequesGiradosMovimientos.ShowModal;
   frmCapturar_ChequesGiradosMovimientos.Destroy;

   rIndexPos := cheques.dsPendientes.DataSet.FieldByName('R_ID').AsInteger;
end;

procedure TfrmChequesGirados.ibCorteClick(Sender: TObject);
var
   corte : TfrmPRN_CORTE_CHEQUES_GIRADOS;
begin
   corte := TfrmPRN_CORTE_CHEQUES_GIRADOS.Create(Application);
   corte.ShowModal;
   corte.Destroy;
end;

procedure TfrmChequesGirados.buInicioClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmChequesGirados.buAnteriorClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Prior;
end;

procedure TfrmChequesGirados.buSiguienteClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Next;
end;

procedure TfrmChequesGirados.buFinClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Last;
end;

procedure TfrmChequesGirados.dgPartidasCHEQUEButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   ibImprimir.Click;
end;

procedure TfrmChequesGirados.itemPolizaClick(Sender: TObject);
begin
   try
      frmPolizasEDetalle          := TfrmPolizasEDetalle.Create(Application);
      frmPolizasEDetalle.Cheque   := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      frmPolizasEDetalle.Folio    := dgPartidas.DataSource.DataSet.FieldByName('R_CONSECUTIVO').AsInteger;
      frmPolizasEDetalle.Monto    := dgPartidas.DataSource.DataSet.FieldByName('R_MONTO').AsFloat;
      frmPolizasEDetalle.loadData;
      frmPolizasEDetalle.ShowModal;
   finally
      frmPolizasEDetalle.Release;
   end;
end;

procedure TfrmChequesGirados.dgPartidasPOLIZAButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   itemPolizaClick(Sender);
end;

procedure TfrmChequesGirados.itemPolizaTClick(Sender: TObject);
begin
   //Para imprimir todos los que tenga seleccionado = "Si"
   habilitar := false;
   frmPRN_0018_TXT         := TfrmPRN_0018_TXT.Create(Application);
   frmPRN_0018_TXT.Rejilla := dgPartidas;
   frmPRN_0018_TXT.imprimirBloquePoliza;
   frmPRN_0018_TXT.Rejilla := nil;
   frmPRN_0018_TXT.Destroy;
   habilitar := true;
end;

procedure TfrmChequesGirados.buActMonedasClick(Sender: TObject);
begin
   cheques.refreshMonedas;
end;

procedure TfrmChequesGirados.buActChequerasClick(Sender: TObject);
begin
   cheques.refreshChequeras;
end;

procedure TfrmChequesGirados.itemContinuoClick(Sender: TObject);
begin
   frmPRN_0018_TXT := TfrmPRN_0018_TXT.Create(Application);
   try
      frmPRN_0018_TXT.OpenContinuos;
      frmPRN_0018_TXT.ShowModal;
   finally
      frmPRN_0018_TXT.Destroy;
   end;

   cheques.refreshPendientes;
   //dgPartidas.FullExpand;
end;

end.
