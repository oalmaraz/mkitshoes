unit UfrmFrameMaterial;

interface

uses
  UfrmHorizontal, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ExtCtrls,
    Buttons,    StdCtrls, Db,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable,
    IBX.IBStoredProc,  UfrmSeleccionarMaterialCompras,
      DBCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit, cxCurrencyEdit;

type
  tiObjetivo = (obEntrada, obSalida, obDesconocido);
  stEstado   = (stNuevo, stModificar, stExplorar);

  TMaterial = record
     id         : integer;
     cantidad   : double;
     unidad     : integer;
     precio     : double;
     dp_porc    : double;
     dg_porc    : double;
     medida     : integer;
     color      : integer;
     comentario : string;
  end;

  TMarcoMateriales = class(TFrame)
    paMateriales: TPanel;
    Label9: TLabel;
    edDescripcion: TEdit;
    Label13: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cbUnidades: TDBLookupComboBox;
    sbRefreshUnidades: TSpeedButton;
    edPrecioCosto: TcxCurrencyEdit;
    laPrecioCosto: TLabel;
    laColor: TLabel;
    sbRefreshColores: TSpeedButton;
    laMedida: TLabel;
    sbRefreshMedidas: TSpeedButton;
    edSubTotal: TcxCurrencyEdit;
    edIVA: TcxCurrencyEdit;
    edIEPS: TcxCurrencyEdit;
    edImpuesto1: TcxCurrencyEdit;
    edImpuesto2: TcxCurrencyEdit;
    edDescuentoPorc: TcxCurrencyEdit;
    laSubTotal: TLabel;
    laIVA: TLabel;
    laIEPS: TLabel;
    laImpuesto1: TLabel;
    laImpuesto2: TLabel;
    laDescPorc: TLabel;
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
    qyMateriales_Unidades: TIBQuery;
    qyMateriales_UnidadesR_ID: TIntegerField;
    qyMateriales_UnidadesR_MATERIAL: TIntegerField;
    qyMateriales_UnidadesR_UNIDAD: TIntegerField;
    qyMateriales_UnidadesR_CLAVE: TIBStringField;
    qyMateriales_UnidadesR_DESCRIPCION: TIBStringField;
    qyMateriales_UnidadesR_FACTOR: TFloatField;
    dsMateriales_Unidades: TDataSource;
    qyMateriales_Medidas: TIBQuery;
    qyMateriales_MedidasR_ID: TIntegerField;
    qyMateriales_MedidasR_ID_MEDIDA: TIntegerField;
    qyMateriales_MedidasR_DESCRIPCION: TIBStringField;
    qyMateriales_MedidasR_CODIGO_BARRAS: TIBStringField;
    dsMateriales_Medidas: TDataSource;
    qyColores: TIBQuery;
    qyColoresID: TIntegerField;
    qyColoresNOMBRE: TIBStringField;
    dsColores: TDataSource;
    TPreferencias: TIBTable;
    qyCalculoImpuestos: TIBQuery;
    edPU: TcxCurrencyEdit;
    edCantidad: TcxCurrencyEdit;
    buCapturar: TBitBtn;
    qyPrecio_X: TIBQuery;
    fcLabel1: TLabel;
    fcLabel2: TLabel;
    qyExistencia: TIBQuery;
    qyExistenciaR_ORIGINAL: TFloatField;
    qyExistenciaR_OTROS: TFloatField;
    dsExistencia: TDataSource;
    edExistencia: TcxCurrencyEdit;
    edOtros: TcxButtonEdit;
    edCBarras: TEdit;
    edPPC: TEdit;
    fcLabel3: TLabel;
    edComentario: TEdit;
    laComentario: TLabel;
    laPU: TLabel;
    Panel1: TPanel;
    edObservaciones: TMemo;
    qyCalculoImpuestosCosto: TIBQuery;
    qyCosto_X: TIBQuery;
    spCALCULA_PSI: TIBStoredProc;
    cbMedidas: TDBLookupComboBox;
    cbColores: TDBLookupComboBox;
    qyUnidadPivote: TIBQuery;
    edMaterial: TcxButtonEdit;
    procedure edMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edCantidadChange(Sender: TObject);
    procedure sbRefreshColoresClick(Sender: TObject);
    procedure sbRefreshMedidasClick(Sender: TObject);
    procedure edOtrosButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buCapturarClick(Sender: TObject);
    procedure edMaterialPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    { Private declarations }
//     X1, Y1, X2, Y2 : integer;
     awrRepetir        : integer;
     awrIvaPorc        : double;
     awrIepsPorc       : double;
     awrImpuesto1Porc  : double;
     awrImpuesto2Porc  : double;
     awrCostoUltComp   : double;
     awrPedirSerie     : boolean;
     awrNumSerie       : boolean;
     awrSerie          : string;
     awrImagen      : TMemoryStream;
//     awrObserv      : TMemoryStream;
     awrCampo       : string;
     awrAbrir       : boolean;
     almacen        : integer;
     awrCliente        : integer;
     extension      : integer;
     awrMoneda      : integer;
     awrProveedor   : integer;
     awrEstado      : stEstado;
     //OFERTA
     awrHayOferta   : boolean;
     awrPorcOferta  : double;
     awrPrecOferta  : double;
     //campos temporales
     tmpMaterial    : integer;
     tmpClave       : string;
     tmpDescripcion : string;
     tmpUnidadBase  : integer;
     tmpOb          : TMemoryStream;
     awrEleccion    : Boolean;
     procedure setTipoMovimiento(valor  : tiObjetivo);
     procedure setEstado(valor : stEstado);
     procedure setFLAG_CALCULAR(valor : boolean);
     procedure setHayOferta(valor : boolean);
     procedure setEnabledDP(valor : boolean);
     procedure buscarMaterialCompra;
     procedure buscarMaterialVende;
     procedure buscarMaterialTodos;
     function dameUnidadPivote(p_material : integer) : integer;
  public
     { Public declarations }
     boton            : boolean;//<-cuando se modifica que el componente dxLookupEdit no quite el valor asignado
     tipo             : tiObjetivo;
     awrFlagCosto     : integer;
     awrFlagCalc      : boolean;
     awrFlagColores   : boolean;
     awrFlagMedidas   : boolean;
     awrAltaRapida    : boolean;
     awrPreguntar     : boolean;
     awrPrecioMax     : double;
     awrPrecioMin     : double;
     awrSolicitarPeso : string;
     frmHorizontal    : TfrmHorizontal;
     dto              : TMaterial;
     awrVisible       : boolean;
     
     procedure inicializar(pActivarCalculos : boolean);
//     procedure coordenas(pX1, pY1, pX2, pY2 : integer);
     procedure datos(pAlmacen, pCliente, pExtension, pMoneda : integer); overload;
     procedure datos(pAlmacen, pProveedor : integer); overload;
     procedure limpiar;
     procedure findMaterial(pMaterial, pUnidad : integer);
     procedure pedirSerie;
     procedure Destruir;
  published
     property MOVIMIENTO     : tiObjetivo write setTipoMovimiento;
     property CAMPO          : string read awrCampo write awrCampo;
     property ABRIR          : boolean read awrAbrir write awrAbrir;
     property FLAG_COSTO     : integer read awrFlagCosto write awrFlagCosto; // 0 = Costo Actual, 1 = Costo Ultima Compra
     property FLAG_CALCULAR  : boolean read awrFlagCalc write setFLAG_CALCULAR;
     property FLAG_COLORES   : boolean read awrFlagColores write awrFlagColores;
     property FLAG_MEDIDAS   : boolean read awrFlagMedidas write awrFlagMedidas;
     property FLAG_ESTADO    : stEstado read awrEstado write setEstado;
     property ALTARAPIDA     : boolean read awrPreguntar write awrPreguntar;
     property PRECIOMAXIMO   : double read awrPrecioMax write awrPrecioMax;
     property PRECIOMINIMO   : double read awrPrecioMin write awrPrecioMin;
     property IVAPORC        : double read awrIvaPorc write awrIvaPorc;
     property IEPSPORC       : double read awrIepsPorc write awrIepsPorc;
     property IMPUESTO1PORC  : double read awrImpuesto1Porc write awrImpuesto1Porc;
     property IMPUESTO2PORC  : double read awrImpuesto2Porc write awrImpuesto2Porc;
     property COSTOULTCOMPRA : double read awrCostoUltComp write awrCostoUltComp;
     property HAY_OFERTA     : boolean read awrHayOferta write setHayOferta;
     property PORC_OFERTA    : double read awrPorcOferta;
     property PRECIO_OFERTA  : double read awrPrecOferta;
     property ALMACENES      : integer read almacen write almacen;
     property MONEDA         : integer read awrMoneda write awrMoneda;
     property ENABLED_DP     : boolean write setEnabledDP;
     property ELECCION       : boolean read awrEleccion write awrEleccion;
     property NUM_SERIE      : boolean read awrNumSerie write awrNumSerie;
     property PEDIR_SERIE    : boolean read awrPedirSerie write awrPedirSerie;
     property SERIE          : string read awrSerie write awrSerie;
     property REPETIR        : integer read awrRepetir write awrRepetir;
     property CLIENTE        : integer read awrCliente write awrCliente;
     property SOLICITAR_PESO : string read awrSolicitarPeso write awrSolicitarPeso;
     property VER            : boolean read awrVisible write awrVisible;
  end;

implementation

uses IBModulo, UfrmAltaRapidaMateriales, UfrmSeleccionarMaterial,
  UfrmMaterialExistencias, UfrmImagen, UfrmSeleccionarMaterialTodos, UfrmSerie;

{$R *.DFM}

function TMarcoMateriales.dameUnidadPivote(p_material : integer) : integer;
begin
   qyUnidadPivote.Close;
   qyUnidadPivote.ParamByName('P_MATERIAL').AsInteger := p_material;
   qyUnidadPivote.Open;

   result := qyUnidadPivote.FieldByName('R_UNIDAD').AsInteger;
end;

procedure TMarcoMateriales.buscarMaterialTodos;
begin
   awrNumSerie := false;
   awrSerie    := '';

   frmSeleccionarMaterialTodos := TfrmSeleccionarMaterialTodos.Create(Application);
   try
      frmSeleccionarMaterialTodos.DATABASE    := dmIBModulo.ibSistema;
      frmSeleccionarMaterialTodos.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
      frmSeleccionarMaterialTodos.CLAVE       := edMaterial.Text;
      if CAMPO <> '' then
         frmSeleccionarMaterialTodos.CAMPO := CAMPO;
      if frmSeleccionarMaterialTodos.abrirConsulta and ABRIR then
      begin
         frmSeleccionarMaterialTodos.ShowModal;
         if frmSeleccionarMaterialTodos.ACEPTAR then
         begin
            edMaterial.Tag     := frmSeleccionarMaterialTodos.ID;
            edMaterial.Text    := frmSeleccionarMaterialTodos.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterialTodos.DESCRIPCION;
            edPPC.Text        :=  IntToStr (frmSeleccionarMaterialTodos.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterialTodos.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
            ivaPorc        := frmSeleccionarMaterialTodos.IVA_PORC;
            iepsPorc       := frmSeleccionarMaterialTodos.IEPS_PORC;
            impuesto1Porc  := frmSeleccionarMaterialTodos.IMPUESTO1_PORC;
            impuesto2Porc  := frmSeleccionarMaterialTodos.IMPUESTO2_PORC;
            COSTOULTCOMPRA := frmSeleccionarMaterialTodos.COSTO_ULT_COMP;
            awrNumSerie    := frmSeleccionarMaterialTodos.SERIE;

            frmSeleccionarMaterialTodos.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            frmSeleccionarMaterialTodos.LoadObservaciones(tmpOb);
            tmpOb.Position := 0;
            edObservaciones.Lines.LoadFromStream(tmpOb);
            tmpOb.Free;
         end;
      end
      else
         if frmSeleccionarMaterialTodos.ID <> 0 then
         begin
            edMaterial.Tag     := frmSeleccionarMaterialTodos.ID;
            edMaterial.Text    := frmSeleccionarMaterialTodos.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterialTodos.DESCRIPCION;
            edPPC.Text        := IntToStr(frmSeleccionarMaterialTodos.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterialTodos.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
            ivaPorc        := frmSeleccionarMaterialTodos.IVA_PORC;
            iepsPorc       := frmSeleccionarMaterialTodos.IEPS_PORC;
            impuesto1Porc  := frmSeleccionarMaterialTodos.IMPUESTO1_PORC;
            impuesto2Porc  := frmSeleccionarMaterialTodos.IMPUESTO2_PORC;
            COSTOULTCOMPRA := frmSeleccionarMaterialTodos.COSTO_ULT_COMP;
            awrNumSerie    := frmSeleccionarMaterialTodos.SERIE;

            frmSeleccionarMaterialTodos.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            try
               frmSeleccionarMaterialTodos.LoadObservaciones(tmpOb);
               tmpOb.Position := 0;
               edObservaciones.Lines.LoadFromStream(tmpOb);
            finally
               tmpOb.Free;
            end;
         end;
   finally
      frmSeleccionarMaterialTodos.Free;
   end;
   //frmSeleccionarMaterialTodos := nil;

   awrRepetir := 1;
   if awrNumSerie and awrPedirSerie then
   begin
   {
      idRepetir.Entrada := '1';
      idRepetir.Execute;
      if idRepetir.Respuesta then
      begin
         if not((idRepetir.Entrada = '') or (idRepetir.Entrada = '0')) then
            awrRepetir := StrToInt(idRepetir.Entrada);
      end;
      }
   end;
end;

procedure TMarcoMateriales.buscarMaterialCompra;
begin
   awrNumSerie := false;
   awrSerie    := '';

   frmSeleccionarMaterialCompras := TfrmSeleccionarMaterialCompras.Create(Application);
   try
      frmSeleccionarMaterialCompras.DATABASE    := dmIBModulo.ibSistema;
      frmSeleccionarMaterialCompras.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
      frmSeleccionarMaterialCompras.CLAVE       := edMaterial.Text;
      if CAMPO <> '' then
         frmSeleccionarMaterialCompras.CAMPO := CAMPO;
      if frmSeleccionarMaterialCompras.abrirConsulta and ABRIR then
      begin
         frmSeleccionarMaterialCompras.ShowModal;
         if frmSeleccionarMaterialCompras.ACEPTAR then
         begin
            edMaterial.Tag     := frmSeleccionarMaterialCompras.ID;
            edMaterial.Text    := frmSeleccionarMaterialCompras.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterialCompras.DESCRIPCION;
            edPPC.Text        := IntToStr(frmSeleccionarMaterialCompras.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterialCompras.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
            ivaPorc        := frmSeleccionarMaterialCompras.IVA_PORC;
            iepsPorc       := frmSeleccionarMaterialCompras.IEPS_PORC;
            impuesto1Porc  := frmSeleccionarMaterialCompras.IMPUESTO1_PORC;
            impuesto2Porc  := frmSeleccionarMaterialCompras.IMPUESTO2_PORC;
            COSTOULTCOMPRA := frmSeleccionarMaterialCompras.COSTO_ULT_COMP;
            awrNumSerie    := frmSeleccionarMaterialCompras.SERIE;

            frmSeleccionarMaterialCompras.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            try
               frmSeleccionarMaterialCompras.LoadObservaciones(tmpOb);
               tmpOb.Position := 0;
               edObservaciones.Lines.LoadFromStream(tmpOb);
            finally
               tmpOb.Free;
            end;
         end;
      end
      else
         if frmSeleccionarMaterialCompras.ID <> 0 then
         begin
            edMaterial.Tag     := frmSeleccionarMaterialCompras.ID;
            edMaterial.Text    := frmSeleccionarMaterialCompras.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterialCompras.DESCRIPCION;
            edPPC.Text        :=  IntToStr(frmSeleccionarMaterialCompras.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterialCompras.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
            ivaPorc        := frmSeleccionarMaterialCompras.IVA_PORC;
            iepsPorc       := frmSeleccionarMaterialCompras.IEPS_PORC;
            impuesto1Porc  := frmSeleccionarMaterialCompras.IMPUESTO1_PORC;
            impuesto2Porc  := frmSeleccionarMaterialCompras.IMPUESTO2_PORC;
            COSTOULTCOMPRA := frmSeleccionarMaterialCompras.COSTO_ULT_COMP;
            awrNumSerie    := frmSeleccionarMaterialCompras.SERIE;

            frmSeleccionarMaterialCompras.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            try
               frmSeleccionarMaterialCompras.LoadObservaciones(tmpOb);
               tmpOb.Position := 0;
               edObservaciones.Lines.LoadFromStream(tmpOb);
            finally
               tmpOb.Free;
            end;
         end;
   finally
      frmSeleccionarMaterialCompras.Free;
   end;
   //frmSeleccionarMaterialCompras := nil;
end;

procedure TMarcoMateriales.buscarMaterialVende;
begin
   awrNumSerie := false;
   awrSerie    := '';
   dto.medida  := 0;
   dto.color   := 0;

   frmSeleccionarMaterial := TfrmSeleccionarMaterial.Create(Application);
   try
      frmSeleccionarMaterial.DATABASE    := dmIBModulo.ibSistema;
      frmSeleccionarMaterial.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
      frmSeleccionarMaterial.CLAVE       := edMaterial.Text;
      if CAMPO <> '' then
         frmSeleccionarMaterial.CAMPO := CAMPO;
      if frmSeleccionarMaterial.abrirConsulta and ABRIR then
      begin
         frmSeleccionarMaterial.ShowModal;
         if frmSeleccionarMaterial.ACEPTAR then
         begin
            edMaterial.Tag     := frmSeleccionarMaterial.ID;
            edMaterial.Text    := frmSeleccionarMaterial.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterial.DESCRIPCION;
            edPPC.Text        := IntToStr(frmSeleccionarMaterial.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterial.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase    := dameUnidadPivote(edMaterial.Tag);
            ivaPorc          := frmSeleccionarMaterial.IVA_PORC;
            iepsPorc         := frmSeleccionarMaterial.IEPS_PORC;
            impuesto1Porc    := frmSeleccionarMaterial.IMPUESTO1_PORC;
            impuesto2Porc    := frmSeleccionarMaterial.IMPUESTO2_PORC;
            COSTOULTCOMPRA   := frmSeleccionarMaterial.COSTO_ULT_COMP;
            awrNumSerie      := frmSeleccionarMaterial.SERIE;
            awrSolicitarPeso := frmSeleccionarMaterial.SOLICITAR_PESO;

            frmSeleccionarMaterial.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            frmSeleccionarMaterial.LoadObservaciones(tmpOb);
            tmpOb.Position := 0;
            edObservaciones.Lines.LoadFromStream(tmpOb);
            tmpOb.Free;

            if awrFlagMedidas then
               dto.medida := frmSeleccionarMaterial.MEDIDA;
            if awrFlagColores then
               dto.color := frmSeleccionarMaterial.COLORES;
         end;
      end
      else
         if frmSeleccionarMaterial.ID <> 0 then
         begin
            edMaterial.Tag     := frmSeleccionarMaterial.ID;
            edMaterial.Text    := frmSeleccionarMaterial.CLAVE;
            edDescripcion.Text := frmSeleccionarMaterial.DESCRIPCION;
            edPPC.Text        :=  IntToStr (frmSeleccionarMaterial.PZASXCAJA);
            edCBarras.Text     := frmSeleccionarMaterial.CODIGO_BARRAS;
            {
            edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
            }
            tmpUnidadBase    := dameUnidadPivote(edMaterial.Tag);
            ivaPorc          := frmSeleccionarMaterial.IVA_PORC;
            iepsPorc         := frmSeleccionarMaterial.IEPS_PORC;
            impuesto1Porc    := frmSeleccionarMaterial.IMPUESTO1_PORC;
            impuesto2Porc    := frmSeleccionarMaterial.IMPUESTO2_PORC;
            COSTOULTCOMPRA   := frmSeleccionarMaterial.COSTO_ULT_COMP;
            awrNumSerie      := frmSeleccionarMaterial.SERIE;
            awrSolicitarPeso := frmSeleccionarMaterial.SOLICITAR_PESO;

            frmSeleccionarMaterial.LoadFoto(awrImagen);

            //Carga las observaciones en el campo memo
            tmpOb := TMemoryStream.Create;
            frmSeleccionarMaterial.LoadObservaciones(tmpOb);
            tmpOb.Position := 0;
            edObservaciones.Lines.LoadFromStream(tmpOb);
            tmpOb.Free;

            if awrFlagMedidas then
               dto.medida := frmSeleccionarMaterial.MEDIDA;
            if awrFlagColores then
               dto.color := frmSeleccionarMaterial.COLORES;
         end;
   finally
      frmSeleccionarMaterial.Free;
   end;

   awrRepetir := 1;
   if awrNumSerie and awrPedirSerie then
   begin
   {
      idRepetir.Entrada := '1';
      idRepetir.Execute;
      if idRepetir.Respuesta then
      begin
         if not((idRepetir.Entrada = '') or (idRepetir.Entrada = '0')) then
            awrRepetir := StrToInt(idRepetir.Entrada);
      end;
      }
   end;
end;

procedure TMarcoMateriales.pedirSerie;
begin
   if awrNumSerie and awrPedirSerie then
   begin
      awrSerie := '';
      frmSerie := TfrmSerie.Create(Application);
      try
         frmSerie.Material := edMaterial.Tag;
         frmSerie.Moneda   := awrMoneda;
         if frmSerie.ShowModal = mrOk then
         begin
            awrSerie := frmSerie.edSerie.Text;
         end;
      finally
         frmSerie.Free;
      end;


//      idSerie.Entrada := '';
//      idSerie.Execute;
//      if idSerie.Respuesta then
//         awrSerie := idSerie.Entrada;
   end;
end;

procedure TMarcoMateriales.setEnabledDP(valor : boolean);
begin
   edDescuentoPorc.Enabled := valor;
end;

procedure TMarcoMateriales.setHayOferta(valor : boolean);
begin
   awrHayOferta  := valor;
   awrPorcOferta := 0.00;
   awrPrecOferta := 0.00;
   if valor then
   begin
      awrPorcOferta := qyPrecio_X.FieldByName('R_OFERTA_PORC').AsFloat;
      awrPrecOferta := qyPrecio_X.FieldByName('R_PRECIO_OFERTA').AsFloat;
   end;
end;

procedure TMarcoMateriales.setFLAG_CALCULAR(valor : boolean);
begin
   awrFlagCalc := valor;

   laIVA.Visible           := valor;
   edIVA.Visible           := valor;
   laIEPS.Visible          := valor;
   edIEPS.Visible          := valor;
   laImpuesto1.Visible     := valor;
   edImpuesto1.Visible     := valor;
   laImpuesto2.Visible     := valor;
   edImpuesto2.Visible     := valor;
//   laDescPorc.Visible      := valor;
//   edDescuentoPorc.Visible := valor;
end;

procedure TMarcoMateriales.setEstado(valor : stEstado);
begin
   awrEstado := valor;
   //colores
   laColor.Visible          := false;
   cbColores.Visible        := false;
   sbRefreshColores.Visible := false;
   //medidas
   laMedida.Visible         := false;
   cbMedidas.Visible        := false;
   sbRefreshMedidas.Visible := false;

   buCapturar.Visible := FLAG_MEDIDAS and (valor = stNuevo);
   edCantidad.Visible := not(buCapturar.Visible);

   case valor of
         stNuevo : begin
                      if edMaterial.Visible and awrVisible then
                         edMaterial.SetFocus;
                   end;
     stModificar : begin
                      if FLAG_COLORES then
                      begin
                         laColor.Visible          := true;
                         cbColores.Visible        := true;
                         sbRefreshColores.Visible := true;
                      end;
                      if FLAG_MEDIDAS then
                      begin
                         laMedida.Visible         := true;
                         cbMedidas.Visible        := true;
                         sbRefreshMedidas.Visible := true;
                      end;
                      if edCantidad.Visible and awrVisible then
                         edCantidad.SetFocus;
                   end;
   end;
end;

procedure TMarcoMateriales.Destruir;
begin
   if frmHorizontal <> nil then
   begin
      frmHorizontal.Free;
      frmHorizontal := nil;
   end;

   if awrImagen <> nil then
   begin
      awrImagen.Free;
      awrImagen := nil;
   end;
end;

procedure TMarcoMateriales.inicializar(pActivarCalculos : boolean);
begin
   awrVisible       := true;
   awrSolicitarPeso := 'No';
   awrRepetir       := 1;
   awrPedirSerie    := false;
   awrEleccion      := true;
   paMateriales.Tag := Self.Height;
   ALTARAPIDA       := true;

   awrImagen     := TMemoryStream.Create;
   FLAG_CALCULAR := pActivarCalculos;
   FLAG_COSTO    := 0;

   CAMPO      := '';
   ABRIR      := true;

   boton         := false;
   TPreferencias.Close;
   TPreferencias.Open;

   //Alta Rapida
   TPreferencias.Filter := 'ID = 48';
   awrAltaRapida := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //Activar medidas
   TPreferencias.Filter := 'ID = 66';
   FLAG_MEDIDAS := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //Activar colores
   TPreferencias.Filter := 'ID = 69';
   FLAG_COLORES := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   FLAG_COLORES := FLAG_COLORES and FLAG_MEDIDAS;

   if (FLAG_MEDIDAS) then
      frmHorizontal  := TfrmHorizontal.Create(Application);
end;

procedure TMarcoMateriales.setTipoMovimiento(valor  : tiObjetivo);
begin
   tipo := valor;
   laPrecioCosto.Visible := false;
   edPrecioCosto.Visible := false;
   laPU.Visible          := false;
   edPU.Visible          := false;
   case tipo of
     obEntrada: begin
                   laPrecioCosto.Caption := 'Co&sto';
                   laPrecioCosto.Visible := true;
                   edPrecioCosto.Visible := true;
                   laPU.Visible          := false;
                   edPU.Visible          := false;

                   edPrecioCosto.Properties.DisplayFormat:= '$,0.0000;-$,0.0000';

                end;
     obSalida : begin
                   laPrecioCosto.Caption := '&Precio Venta';
                   laPrecioCosto.Visible := true;
                   edPrecioCosto.Visible := true;
                   laPU.Visible          := true;
                   edPU.Visible          := true;
                   edPrecioCosto.Properties.DisplayFormat:= '$,0.0000;-$,0.0000';
                end;
   end;
end;

procedure TMarcoMateriales.limpiar;
begin
   edMaterial.Tag := 0;
   edMaterial.Clear;
   edDescripcion.Clear;
   edCantidad.Clear;
   //cbUnidades.Clear;
   edPrecioCosto.Clear;
   edSubTotal.Clear;
   edIVA.Clear;
   edIEPS.Clear;
   edImpuesto1.Clear;
   edImpuesto2.Clear;
   edDescuentoPorc.Clear;

   //cbColores.ClearValue;
   //cbMedidas.ClearValue;
   
   edPU.Clear;
   edExistencia.Clear;
   edCBarras.Clear;
   //edOtros.Text := '0.0000';
   awrImagen.Clear;
//   awrObserv.Clear;
   edPPC.Clear;
   edComentario.Clear;
   edObservaciones.Lines.Clear;
end;

{procedure TMarcoMateriales.coordenas(pX1, pY1, pX2, pY2 : integer);
begin
   X1 := pX1;
   Y1 := pY1;
   X2 := pX2;
   Y2 := pY2;
end;}

procedure TMarcoMateriales.datos(pAlmacen, pProveedor : integer);
begin
   almacen      := pAlmacen;
   awrProveedor := pProveedor;
end;

procedure TMarcoMateriales.datos(pAlmacen, pCliente, pExtension, pMoneda : integer);
begin
   almacen   := pAlmacen;
   cliente   := pCliente;
   extension := pExtension;
   awrMoneda := pMoneda;


   qyPrecio_X.Close;
   qyPrecio_X.ParamByName('P_MATERIAL').AsInteger  := edMaterial.Tag;
   qyPrecio_X.ParamByName('P_ALMACEN').AsInteger   := almacen;
   qyPrecio_X.ParamByName('P_CLIENTE').AsInteger   := cliente;
   qyPrecio_X.ParamByName('P_EXTENSION').AsInteger := extension;
   qyPrecio_X.ParamByName('P_MONEDA').AsInteger    := awrMoneda;
   qyPrecio_X.Open;

   if (FLAG_CALCULAR) then
   begin
      PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAXIMO').AsFloat;
      PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MINIMO').AsFloat;
   end
   else
      begin
         PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAX_UNIT').AsFloat;
         PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MIN_UNIT').AsFloat;
      end;
end;

procedure TMarcoMateriales.findMaterial(pMaterial, pUnidad : integer);
begin
   if pMaterial <> 0 then
   begin
      qyMateriales_Unidades.Close;
      qyMateriales_Unidades.ParamByName('P_MATERIAL').AsInteger := pMaterial;
      qyMateriales_Unidades.Open;

      {oao 22mayo2016}
      if FLAG_ESTADO = stNuevo then
         cbUnidades.KeyValue := pUnidad;

      if FLAG_MEDIDAS then
      begin
         qyMateriales_Medidas.Close;
         qyMateriales_Medidas.ParamByName('P_MATERIAL').AsInteger := pMaterial;
         qyMateriales_Medidas.Open;
      end;

      if FLAG_COLORES then
      begin
         qyColores.Close;
         qyColores.Open
      end
   end;
end;

procedure TMarcoMateriales.edMaterialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin

     edMaterial.Properties.OnButtonClick(nil, 0);

  end;
end;

procedure TMarcoMateriales.edMaterialPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var
   AltaRapidaMaterial : TfrmAltaRapidaMateriales;
   vMedida : integer;
   vColor  : integer;
begin
   tmpUnidadBase := 0;
   vMedida       := 0;
   vColor        := 0;
   case AButtonIndex of
     0: begin
           if (awrEleccion) then
           begin
              case tipo of
                obEntrada: buscarMaterialCompra;
                 obSalida: buscarMaterialVende;
              else
                 buscarMaterialTodos;
              end;
           end
           else
              buscarMaterialTodos;

           qyExistencia.Close;
           qyExistencia.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
           qyExistencia.ParamByName('P_MEDIDA').AsInteger   := dto.medida;
           qyExistencia.ParamByName('P_COLOR').AsInteger    := dto.color;
           qyExistencia.ParamByName('P_ALMACEN').AsInteger  := almacen;
           qyExistencia.ParamByName('P_MONEDA').AsInteger   := awrMoneda;
           qyExistencia.Open;
           edExistencia.Value := qyExistencia.FieldByName('R_ORIGINAL').AsFloat;
           edOtros.Text       := FormatFloat('###,###,##0.0000',qyExistencia.FieldByName('R_OTROS').AsFloat);

           PRECIOMAXIMO          := 0;
           PRECIOMINIMO          := 0;


           if (edMaterial.Tag <> 0) then // and (FLAG_CALCULAR) then
           begin
              if tipo = obSalida then
              begin
                 qyPrecio_X.Close;
                 qyPrecio_X.ParamByName('P_MATERIAL').AsInteger  := edMaterial.Tag;
                 qyPrecio_X.ParamByName('P_ALMACEN').AsInteger   := almacen;
                 qyPrecio_X.ParamByName('P_CLIENTE').AsInteger   := cliente;
                 qyPrecio_X.ParamByName('P_EXTENSION').AsInteger := extension;
                 qyPrecio_X.ParamByName('P_MONEDA').AsInteger    := awrMoneda;
                 qyPrecio_X.Open;

                 HAY_OFERTA            := qyPrecio_X.FieldByName('R_HAY_OFERTA').AsString = 'Si';
                 edDescuentoPorc.Value := qyPrecio_X.FieldByName('R_OFERTA_PORC').AsFloat;

                 if (FLAG_CALCULAR) then
                 begin
                    PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAXIMO').AsFloat;
                    PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MINIMO').AsFloat;
                 end
                 else
                    begin
                       PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAX_UNIT').AsFloat;
                       PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MIN_UNIT').AsFloat;
                    end;
              end
              else
                 if tipo = obEntrada then
                 begin
                    qyCosto_X.Close;
                    qyCosto_X.ParamByName('P_MATERIAL').AsInteger  := edMaterial.Tag;
                    qyCosto_X.ParamByName('P_PROVEEDOR').AsInteger := awrProveedor;
                    qyCosto_X.Open;

                    PRECIOMAXIMO := qyCosto_X.FieldByName('R_COSTO').AsFloat;
                 end;
              edPrecioCosto.value :=  PRECIOMAXIMO;

//              findMaterial(edMaterial.Tag, tmpUnidadBase);
//              edMaterial.Text    := edMaterial.Text;
//              edDescripcion.Text := edDescripcion.Text;
              if edCantidad.Visible and awrVisible then
                 edCantidad.SetFocus
              else
                 edCantidadChange(Sender);
           end
           else//alta rapida del material, cuando se busca y no se encuentra
           begin
              if (edMaterial.Tag = 0) and awrAltaRapida and ALTARAPIDA then
              begin
                 if MessageDlg('� Desea dar de Alta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
                 begin
                    AltaRapidaMaterial := TfrmAltaRapidaMateriales.Create(Application);
                    try
                       AltaRapidaMaterial.edClave.Text        := edMaterial.Text;
                       AltaRapidaMaterial.edCodigoBarras.Text := edMaterial.Text;
                       AltaRapidaMaterial.ShowModal;
                       tmpMaterial    := AltaRapidaMaterial.dameMaterial;
                       tmpClave       := AltaRapidaMaterial.edClave.Text;
                       tmpDescripcion := AltaRapidaMaterial.edDescripcion.Text;
                       tmpUnidadBase  := AltaRapidaMaterial.cbUnidades.KeyValue;
                       ivaPorc        := StrToFloat(AltaRapidaMaterial.ceIVA.Text);
                       iepsPorc       := 0.00;
                       impuesto1Porc  := 0.00;
                       impuesto2Porc  := 0.00;
                    finally
                       AltaRapidaMaterial.Free;
                    end;

                    if tmpMaterial <> 0 then
                    begin
                       edMaterial.Tag     := tmpMaterial;
                       edMaterial.Text    := tmpClave;
                       edDescripcion.Text := tmpDescripcion;
//                       findMaterial(edMaterial.Tag, tmpUnidadBase);
                    end;
                 end;
              end;
           end;

           if edMaterial.Tag <> 0 then
           begin
              findMaterial(edMaterial.Tag, tmpUnidadBase);
              if FLAG_MEDIDAS or FLAG_COLORES then
                 frmHorizontal.loadMaterial(edMaterial.Tag);
           end;
        end;
     1: begin
           limpiar;
        end;
     2: begin
           frmImagen := TfrmImagen.Create(Application);
           try
              //Application.CreateForm(TfrmImagen, frmImagen);
              frmImagen.LoadImagen(awrImagen);
              frmImagen.ShowModal;
           finally
              frmImagen.Free;
           end;
        end;

   end;
end;


procedure TMarcoMateriales.edMaterialButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   AltaRapidaMaterial : TfrmAltaRapidaMateriales;
   vMedida : integer;
   vColor  : integer;
begin
   tmpUnidadBase := 0;
   vMedida       := 0;
   vColor        := 0;
   case AbsoluteIndex of
     0: begin
           if (awrEleccion) then
           begin
              case tipo of
                obEntrada: buscarMaterialCompra;
                 obSalida: buscarMaterialVende;
              else
                 buscarMaterialTodos;
              end;
           end
           else
              buscarMaterialTodos;

           qyExistencia.Close;
           qyExistencia.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
           qyExistencia.ParamByName('P_MEDIDA').AsInteger   := dto.medida;
           qyExistencia.ParamByName('P_COLOR').AsInteger    := dto.color;
           qyExistencia.ParamByName('P_ALMACEN').AsInteger  := almacen;
           qyExistencia.ParamByName('P_MONEDA').AsInteger   := awrMoneda;
           qyExistencia.Open;
           edExistencia.value := qyExistencia.FieldByName('R_ORIGINAL').AsFloat;
           edOtros.Text       := FormatFloat('###,###,##0.0000',qyExistencia.FieldByName('R_OTROS').AsFloat);

           PRECIOMAXIMO          := 0;
           PRECIOMINIMO          := 0;
           edDescuentoPorc.value := 0;
           if (edMaterial.Tag <> 0) then // and (FLAG_CALCULAR) then
           begin
              if tipo = obSalida then
              begin
                 qyPrecio_X.Close;
                 qyPrecio_X.ParamByName('P_MATERIAL').AsInteger  := edMaterial.Tag;
                 qyPrecio_X.ParamByName('P_ALMACEN').AsInteger   := almacen;
                 qyPrecio_X.ParamByName('P_CLIENTE').AsInteger   := cliente;
                 qyPrecio_X.ParamByName('P_EXTENSION').AsInteger := extension;
                 qyPrecio_X.ParamByName('P_MONEDA').AsInteger    := awrMoneda;
                 qyPrecio_X.Open;

                 HAY_OFERTA            := qyPrecio_X.FieldByName('R_HAY_OFERTA').AsString = 'Si';
                 edDescuentoPorc.value := qyPrecio_X.FieldByName('R_OFERTA_PORC').asfloat;

                 if (FLAG_CALCULAR) then
                 begin
                    PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAXIMO').AsFloat;
                    PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MINIMO').AsFloat;
                 end
                 else
                    begin
                       PRECIOMAXIMO := qyPrecio_X.FieldByName('R_PRECIO_MAX_UNIT').AsFloat;
                       PRECIOMINIMO := qyPrecio_X.FieldByName('R_PRECIO_MIN_UNIT').AsFloat;
                    end;
              end
              else
                 if tipo = obEntrada then
                 begin
                    qyCosto_X.Close;
                    qyCosto_X.ParamByName('P_MATERIAL').AsInteger  := edMaterial.Tag;
                    qyCosto_X.ParamByName('P_PROVEEDOR').AsInteger := awrProveedor;
                    qyCosto_X.Open;

                    PRECIOMAXIMO := qyCosto_X.FieldByName('R_COSTO').AsFloat;
                 end;
              edPrecioCosto.value :=   PRECIOMAXIMO;

//              findMaterial(edMaterial.Tag, tmpUnidadBase);
//              edMaterial.Text    := edMaterial.Text;
//              edDescripcion.Text := edDescripcion.Text;
              if edCantidad.Visible and awrVisible then
                 edCantidad.SetFocus
              else
                 edCantidadChange(Sender);
           end
           else//alta rapida del material, cuando se busca y no se encuentra
           begin
              if (edMaterial.Tag = 0) and awrAltaRapida and ALTARAPIDA then
              begin
                 if MessageDlg('� Desea dar de Alta ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
                 begin
                    AltaRapidaMaterial := TfrmAltaRapidaMateriales.Create(Application);
                    try
                       AltaRapidaMaterial.edClave.Text        := edMaterial.Text;
                       AltaRapidaMaterial.edCodigoBarras.Text := edMaterial.Text;
                       AltaRapidaMaterial.ShowModal;
                       tmpMaterial    := AltaRapidaMaterial.dameMaterial;
                       tmpClave       := AltaRapidaMaterial.edClave.Text;
                       tmpDescripcion := AltaRapidaMaterial.edDescripcion.Text;
                       tmpUnidadBase  := AltaRapidaMaterial.cbUnidades.KeyValue;
                       ivaPorc        := StrToFloat(AltaRapidaMaterial.ceIVA.Text);
                       iepsPorc       := 0.00;
                       impuesto1Porc  := 0.00;
                       impuesto2Porc  := 0.00;
                    finally
                       AltaRapidaMaterial.Free;
                    end;

                    if tmpMaterial <> 0 then
                    begin
                       edMaterial.Tag     := tmpMaterial;
                       edMaterial.Text    := tmpClave;
                       edDescripcion.Text := tmpDescripcion;
//                       findMaterial(edMaterial.Tag, tmpUnidadBase);
                    end;
                 end;
              end;
           end;

           if edMaterial.Tag <> 0 then
           begin
              findMaterial(edMaterial.Tag, tmpUnidadBase);
              if FLAG_MEDIDAS or FLAG_COLORES then
                 frmHorizontal.loadMaterial(edMaterial.Tag);
           end;
        end;
     1: begin
           limpiar;
        end;
     2: begin
           frmImagen := TfrmImagen.Create(Application);
           try
              //Application.CreateForm(TfrmImagen, frmImagen);
              frmImagen.LoadImagen(awrImagen);
              frmImagen.ShowModal;
           finally
              frmImagen.Free;
           end;
        end;

   end;
end;

procedure TMarcoMateriales.edCantidadChange(Sender: TObject);
var
  cant, precio , subtotal : double;
begin
   if (edMaterial.Tag <> 0) then
   begin
      if FLAG_CALCULAR then
      begin
         case tipo of
            obSalida: begin
                          qyCalculoImpuestos.Close;
                          qyCalculoImpuestos.ParamByName('P_MATERIAL').AsInteger   := edMaterial.Tag;
                          qyCalculoImpuestos.ParamByName('P_CANTIDAD').AsFloat     := edCantidad.Value;
                          qyCalculoImpuestos.ParamByName('P_PRECIO_VENTA').AsFloat := edPrecioCosto.value;
                          qyCalculoImpuestos.Open;

                          edSubTotal.value  := qyCalculoImpuestos.FieldByName('R_SUBTOTAL').AsFloat;
                          edIVA.value       := qyCalculoImpuestos.FieldByName('R_IVA').AsFloat;
                          edIEPS.value      := qyCalculoImpuestos.FieldByName('R_IEPS').AsFloat;
                          edImpuesto1.value := qyCalculoImpuestos.FieldByName('R_IMPUESTO1').AsFloat;
                          edImpuesto2.value := qyCalculoImpuestos.FieldByName('R_IMPUESTO2').AsFloat;
                          edPU.value        := qyCalculoImpuestos.FieldByName('R_PRECIO').AsFloat;

                          ivaPorc           := qyCalculoImpuestos.FieldByName('R_IVA_PORC').AsFloat;
                          iepsPorc          := qyCalculoImpuestos.FieldByName('R_IEPS_PORC').AsFloat;
                          impuesto1Porc     := qyCalculoImpuestos.FieldByName('R_IMPUESTO1_PORC').AsFloat;
                          impuesto2Porc     := qyCalculoImpuestos.FieldByName('R_IMPUESTO2_PORC').AsFloat;
                       end;
            obEntrada: begin
                          qyCalculoImpuestosCosto.Close;
                          qyCalculoImpuestosCosto.ParamByName('P_MATERIAL').AsInteger   := edMaterial.Tag;
                          qyCalculoImpuestosCosto.ParamByName('P_CANTIDAD').AsFloat     := edCantidad.Value;
                          qyCalculoImpuestosCosto.ParamByName('P_COSTO').AsFloat        := edPrecioCosto.value;
                          qyCalculoImpuestosCosto.Open;

                          edSubTotal.value  := qyCalculoImpuestosCosto.FieldByName('R_SUBTOTAL').AsFloat;
                          edIVA.value       := qyCalculoImpuestosCosto.FieldByName('R_IVA').AsFloat;
                          edIEPS.value      := qyCalculoImpuestosCosto.FieldByName('R_IEPS').AsFloat;
                          edImpuesto1.value := qyCalculoImpuestosCosto.FieldByName('R_IMPUESTO1').AsFloat;
                          edImpuesto2.value := qyCalculoImpuestosCosto.FieldByName('R_IMPUESTO2').AsFloat;
                          edPU.value        := qyCalculoImpuestosCosto.FieldByName('R_COSTO').AsFloat;

                          ivaPorc           := qyCalculoImpuestosCosto.FieldByName('R_IVA_PORC').AsFloat;
                          iepsPorc          := qyCalculoImpuestosCosto.FieldByName('R_IEPS_PORC').AsFloat;
                          impuesto1Porc     := qyCalculoImpuestosCosto.FieldByName('R_IMPUESTO1_PORC').AsFloat;
                          impuesto2Porc     := qyCalculoImpuestosCosto.FieldByName('R_IMPUESTO2_PORC').AsFloat;
                       end;
         end;

      end
      else
      begin
         cant := edCantidad.Value; ;
         precio := edPrecioCosto.value;
         subtotal := cant * precio;

         edSubTotal.Value  :=  subtotal;
         edPU.Value        := edPrecioCosto.Value;

         edIVA.Value       := 0;
         edIEPS.Value      := 0;
         edImpuesto1.Value := 0;
         edImpuesto2.Value := 0;
         edPU.Value        := 0;

         ivaPorc           := 0;
         iepsPorc          := 0;
         impuesto1Porc     := 0;
         impuesto2Porc     := 0;

      end;
   end;
end;

procedure TMarcoMateriales.sbRefreshColoresClick(Sender: TObject);
begin
   qyColores.Close;
   qyColores.Open;
end;

procedure TMarcoMateriales.sbRefreshMedidasClick(Sender: TObject);
begin
   qyMateriales_Medidas.Close;
   qyMateriales_Medidas.Open;
end;

procedure TMarcoMateriales.edOtrosButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  frmMaterialExistencias := TfrmMaterialExistencias.Create(Application);
  try
     frmMaterialExistencias.Open(edMaterial.Tag, almacen);
     frmMaterialExistencias.ShowModal;
  finally
     frmMaterialExistencias.Free;
  end;
end;

procedure TMarcoMateriales.buCapturarClick(Sender: TObject);
begin
//   frmHorizontal.limpiar;
   frmHorizontal.ShowModal;
end;

end.
