unit capturar_punto_de_ventas_pagos;

interface

uses
  IBX.IBDatabase, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, Grids, DBGrids,  Db, Menus, IBX.IBStoredProc,
  IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls, StdCtrls, Buttons, Mask;

type
  TfrmCapturar_punto_de_ventas_pagos = class(TForm)
    paBotones: TPanel;
    qyIBXAlmacenes: TIBQuery;
    qyIBXAlmacenesID: TIntegerField;
    qyIBXAlmacenesCLAVE: TIBStringField;
    qyIBXAlmacenesNOMBRE: TIBStringField;
    qyIBXAlmacenesCOMPRA: TIBStringField;
    qyIBXAlmacenesVENDE: TIBStringField;
    qyIBXAlmacenesTRANSFORMA: TIBStringField;
    qyIBXAlmacenesFECHA_ALTA: TDateTimeField;
    qyIBXAlmacenesRESPONSABLE: TIntegerField;
    qyIBXAlmacenesOBSERVACIONES: TBlobField;
    qyIBXAlmacenesSERIE_FACTURA: TIBStringField;
    qyIBXAlmacenesCONSECUTIVO: TIntegerField;
    qyIBXAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyIBXAlmacenesESTATUS: TIBStringField;
    qyIBXAlmacenesSERIE_NC: TIBStringField;
    qyIBXAlmacenesSERIE_NVENTA: TIBStringField;
    qyIBXAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    dsBancos: TDataSource;
    qyBancos: TIBQuery;
    qyBancosID: TIntegerField;
    qyBancosCLAVE: TIBStringField;
    qyBancosNOMBRE: TIBStringField;
    qyBancosRAZON_SOCIAL: TIBStringField;
    qyBancosCUENTA: TIBStringField;
    qyBancosSUCURSAL: TIBStringField;
    qyBancosnombre_corto: TStringField;
    qyBlackBoxME1: TIBQuery;
    qyBlackBoxME1R_PUNTOS: TIntegerField;
    qyBlackBoxME1R_CONCEPTO: TIBStringField;
    qyBlackBoxME3: TIBQuery;
    qyBlackBoxME3R_PUNTOS: TIntegerField;
    qyBlackBoxME3R_RECOMENDADO_POR: TIntegerField;
    qyBlackBoxME3R_NOMBRE: TIBStringField;
    qyBlackBoxME3R_TELEFONO: TIBStringField;
    qyBlackBoxME3R_TARJETA: TIBStringField;
    spP_ME_AFECTAR: TIBStoredProc;
    spP_MONEDERO_AFECTAR: TIBStoredProc;
    spDAME_PUNTOS: TIBStoredProc;
    dsEncabezado: TDataSource;
    dsCliente: TDataSource;
    spGENERAR_CUPON_AJUSTE: TIBStoredProc;
    spCUPONES_PUNTO_DE_VTAS: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    pmFormas: TPopupMenu;
    itemF4: TMenuItem;
    itemF8: TMenuItem;
    itemF9: TMenuItem;
    itemF10: TMenuItem;
    itemF12Imp: TMenuItem;
    spTOTAL_FORMA_PAGOS: TIBStoredProc;
    qyBotones: TIBQuery;
    qyBotonesID: TIntegerField;
    qyBotonesR_ACTIVO: TIBStringField;
    qyBotonesR_NOMBRE: TIBStringField;
    qyCComerciales: TIBQuery;
    qyCComercialesR_ID: TIntegerField;
    qyCComercialesR_PUNTO_DE_VENTA: TIntegerField;
    qyCComercialesR_CCOMERCIAL: TIntegerField;
    qyCComercialesR_REFERENCIA: TIBStringField;
    qyCComercialesR_MONTO: TFloatField;
    qyCComercialesR_AUTORIZACION: TIBStringField;
    qyCComercialesR_FOLIO: TIntegerField;
    qyCComercialesR_BANCO: TIntegerField;
    qyCComercialesR_FECHA: TDateTimeField;
    qyCComercialesR_ESTATUS: TIBStringField;
    qyCComercialesR_CC_CLAVE: TIBStringField;
    qyCComercialesR_CC_NOMBRE: TIBStringField;
    qyCComercialesR_CC_MORATORIO: TIBStringField;
    qyCComercialesR_CC_AUTORIZACION: TIBStringField;
    qyCComercialesR_CC_BANCO: TIBStringField;
    qyCComercialesR_CC_FECHA: TIBStringField;
    qyCComercialesR_CC_FOLIO: TIBStringField;
    qyCComercialesR_CC_REFERENCIA: TIBStringField;
    qyCComercialesR_ACTIVAR_ALMACEN: TIBStringField;
    dsFuente: TDataSource;
    spADD_FORMAS_DE_PAGO_PVTA: TIBQuery;
    spAFECTA_PUNTO_DE_VENTA: TIBStoredProc;
    spFOLIO_ALMACEN: TIBStoredProc;
    spFOLIO_NOTA_DE_VENTA: TIBStoredProc;
    spVALES_PUNTO_DE_VTAS: TIBStoredProc;
    spP_VALES_AFECTAR: TIBStoredProc;
    qyVales: TIBQuery;
    qyValesID: TIntegerField;
    qyValesTOTAL: TFloatField;
    qyVALIDAR_LIMITE: TIBQuery;
    qyVALIDAR_LIMITER_AFECTAR: TIBStringField;
    qyActualizar: TIBQuery;
    paFacturar: TPanel;
    cbFacturar: TCheckBox;
    paCaptura: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    laBanco: TLabel;
    laFecha: TLabel;
    laReferencia: TLabel;
    laFolio: TLabel;
    laAlmacen: TLabel;
    sbRBancos: TSpeedButton;
    laCuenta: TLabel;
    edAlmacen: TEdit;
    buDoc: TButton;
    edCComercial: TEdit;
    edMonto: TEdit;
    edFecha: TDateTimePicker;
    edReferencia: TEdit;
    edFolio: TEdit;
    cbAlmacenes: TDBLookupComboBox;
    cbBancos: TDBLookupComboBox;
    deCuenta: TDBEdit;
    paContenedorTotales: TPanel;
    Label9: TLabel;
    dtCredito: TDBText;
    Label10: TLabel;
    dtCreditoDisp: TDBText;
    paTotales: TPanel;
    Label6: TLabel;
    dtCambio: TDBText;
    Label7: TLabel;
    Label8: TLabel;
    dtTotal: TDBText;
    laSaldo: TBitBtn;
    laF4: TLabel;
    dgFormaPago: TDBGrid;
    Label15: TLabel;
    deCliente: TDBEdit;
    Label1: TLabel;
    deExtension: TDBEdit;
    spME_REG_PUNTO_DE_VTAS: TIBStoredProc;
    qyMonedero: TIBQuery;
    IntegerField1: TIntegerField;
    FloatField1: TFloatField;
    dsEstatus: TDataSource;
    qyEstatus: TIBQuery;
    spEstatus: TIBStoredProc;
    buF8: TBitBtn;
    buF9: TBitBtn;
    buF10: TBitBtn;
    buF12Imp: TBitBtn;
    buVentas: TBitBtn;
    spVERIFICAR_ME_CLIENTE: TIBStoredProc;
    Panel2: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buFin: TBitBtn;
    buSiguiente: TBitBtn;
    ibSalir: TBitBtn;
    deID: TDBEdit;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure buF8Click(Sender: TObject);
    procedure buF9Click(Sender: TObject);
    procedure cClick(Sender: TObject);
    procedure buF12ImpClick(Sender: TObject);
    procedure buVentasClick(Sender: TObject);
    procedure dgFormaPagoDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure paCapturaEnter(Sender: TObject);
    procedure laSaldoClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure buDocClick(Sender: TObject);
    procedure sbRBancosClick(Sender: TObject);
    procedure edReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure qyBancosCalcFields(DataSet: TDataSet);
    procedure itemF8Click(Sender: TObject);
    procedure itemF9Click(Sender: TObject);
    procedure itemF10Click(Sender: TObject);
    procedure itemF12ImpClick(Sender: TObject);
    procedure edMontoKeyPress(Sender: TObject; var Key: Char);
    procedure buF10Click(Sender: TObject);
  private
    { Private declarations }
    awrMONEDERO      : integer;
    awrVALES         : integer;
    awrCUPONES       : integer;
    ccCheques        : integer;
    ccTarjetaCredito : integer;
    ccVales          : integer;
    ccCupones        : integer;
    ccME             : integer;

    mensajeCC        : boolean;
    edicionP         : boolean;
    awrCEfectivo     : integer;
    awrActivarME     : boolean;
    awrCliente       : integer;
    awrClienteN      : string;
    awrTelefono      : string;
    awrExtension     : integer;
    awrHuella        : boolean;
    awrVerificarME   : boolean;
    
    procedure setALMACEN(valor : integer);
    function getALMACEN : integer;
    procedure estatusInternoAfectado(pFacturar : String);
  protected
    procedure fijarBotonesP(valor : boolean);overload;
    procedure fijarBotonesP;overload;
  public
    { Public declarations }
  published
//     property CEfectivo : integer read awrCEfectivo write awrCEfectivo;
     property ALMACEN   : integer read getALMACEN write setALMACEN;
     property ACTIVARME : boolean read awrActivarME write awrActivarME;
     property CLIENTE   : integer read awrCliente write awrCliente;
     property CLIENTEN  : string read awrClienteN write awrClienteN;
     property TELEFONO  : string read awrTelefono write awrTelefono;
     property EXTENSION : integer read awrExtension write awrExtension;
  end;

TFunc = function(llave, servidor, ruta, basededatos : string; cliente, extension, nivel : integer): longint; stdcall;

var
  frmCapturar_punto_de_ventas_pagos: TfrmCapturar_punto_de_ventas_pagos;

const
   HuellaDLL = 'awrHuella.dll';
   IdHuella : String = 'awr_identificar_huella';

//procedure awr_identificar_huella(llave, servidor, ruta, basededatos : string; cliente, extension, nivel : integer); stdcall external 'awrHuella.dll';

implementation

uses
  IBModulo, IBData, reglas_de_negocios, autorizacion, UfrmInfo,
  PRN_0008_Ventas, PRN_0003_FACTURAR_TXT, PRN_0004_NOTA_VENTA_TXT,
  ver_detalle_venta, UfrmValesDetalle, PRN_0034, UfrmMonederoReg, UfrmAcceso,
  UfrmPOSEfectivo;

{$R *.DFM}

procedure TfrmCapturar_punto_de_ventas_pagos.estatusInternoAfectado(pFacturar : String);
var
   ejecutar   : boolean;
   vNivel     : integer;
   vAutorizar : boolean;
   vEstatus   : string;
   vStoreProc : string;
begin
   ejecutar := TRUE;

   qyEstatus.Close;
   qyEstatus.ParamByName('P_ESTATUS').AsString := 'Sin Afectar';
   qyEstatus.Open;

   vAutorizar := qyEstatus.FieldByName('R_AUTORIZACION').AsString = 'Si';
   vNivel     := qyEstatus.FieldByName('R_NIVEL').AsInteger;
   vEstatus   := qyEstatus.FieldByName('R_ESTATUS').AsString;
   vStoreProc := qyEstatus.FieldByName('R_STOREPROC').AsString;

   if (vAutorizar) and (vNivel > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel  := vNivel;
         frmAcceso.Status := vEstatus;
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

  if ejecutar then
  begin
     reglas.tmpDato1 := dsEncabezado.DataSet.FieldByName('R_CAMBIO_ENTREGADO').AsFloat;
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := vStoreProc;
     spEstatus.Params.CreateParam(ftString, 'P_FACTURAR',ptInput);
     spEstatus.Params.CreateParam(ftInteger,'P_PVTA',ptInput);
     spEstatus.Params.CreateParam(ftInteger,'P_USUARIO',ptInput);
     spEstatus.Params.CreateParam(ftInteger,'R_ID',ptOutput);
     spEstatus.Params.CreateParam(ftInteger,'R_FACTURA',ptOutput);
     spEstatus.ParamByName('P_FACTURAR').AsString  := pFacturar;
     spEstatus.ParamByName('P_PVTA').AsInteger     := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
     spEstatus.ParamByName('P_USUARIO').AsInteger  := reglas.dame_usuario;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.fijarBotonesP(valor : boolean);
begin
   edicionP := valor;
   fijarBotonesP;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.fijarBotonesP;
begin
  buF8.Enabled        := not edicionP;
  buF9.Enabled        := edicionP;
  buF10.Enabled       := edicionP;
  buF12Imp.Enabled    := (not edicionP) and (dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);

  itemF8.Enabled      := buF8.Enabled;
  itemF9.Enabled      := buF9.Enabled;
  itemF10.Enabled     := buF10.Enabled;
  itemF12Imp.Enabled  := buF12Imp.Enabled;

  paCaptura.Visible   := edicionP;
  dgFormaPago.Enabled := not edicionP;
end;

function TfrmCapturar_punto_de_ventas_pagos.getALMACEN : integer;
begin
   Result := cbAlmacenes.KeyValue;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.setALMACEN(valor : integer);
begin
   cbAlmacenes.KeyValue := valor;
   edAlmacen.Text := cbAlmacenes.Text;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.ibSalirClick(Sender: TObject);
begin
   ModalResult := mrCancel;
   Close;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.FormCreate(Sender: TObject);
begin
  awrVALES    := 0;
  awrCUPONES  := 0;
  awrMONEDERO := 0;
  
  //laSaldo.HotTrack := false;
  laSaldo.Cursor   := crDefault;

  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.abrir_IBTabla(dmIBData.TFiltroCondicionesComerciales);
  reglas.refresh_IBQuery(qyIBXAlmacenes);

  //Facturar en Punto de Venta
  dmIBData.TPreferencias.Filter := 'ID = 28';
  paFacturar.Visible := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Condicion Comercial Cheques
  dmIBData.TPreferencias.Filter := 'ID = 25';
  ccCheques := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Tarjeta de credito
  dmIBData.TPreferencias.Filter := 'ID = 26';
  ccTarjetaCredito := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Vales
  dmIBData.TPreferencias.Filter := 'ID = 103';
  ccVales := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Cupones
  dmIBData.TPreferencias.Filter := 'ID = 104';
  ccCupones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Activar mensaje condicion comercial punto de venta.
  dmIBData.TPreferencias.Filter := 'ID = 61';
  if UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI' then
     mensajeCC := true
  else
     mensajeCC := false;

  //Condicion Comercial Cupones
  dmIBData.TPreferencias.Filter := 'ID = 110';
  ccME := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Activar Monedero electronico
  dmIBData.TPreferencias.Filter := 'ID = 111';
  ACTIVARME := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Activar Huella Digital
  dmIBData.TPreferencias.Filter := 'ID = 81';
  awrHuella := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

  //Cliente de Contado
  dmIBData.TPreferencias.Filter := 'ID = 10';
  awrCEfectivo := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Verificar en Afectacion de ME el cliente
  dmIBData.TPreferencias.Filter := 'ID = 317';
  awrVerificarME := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buF8Click(Sender: TObject);
var
   cc : integer;
begin
   cc := qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger;
   if (ccME = cc) and (dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat = 0) then
   begin
     ShowMessage('El saldo por aplicar debe ser mayor a cero.');
   end
   else
   begin
      edCComercial.Clear;
      cbBancos.Visible     := false;
      sbRBancos.Visible    := false;
      edFecha.Visible      := false;
      edReferencia.Visible := false;
      edFolio.Visible      := false;
      laBanco.Visible      := false;
      laFecha.Visible      := false;
      laReferencia.Visible := false;
      laFolio.Visible      := false;
      laCuenta.Visible     := false;
      deCuenta.Visible     := false;
      cbAlmacenes.Visible  := false;

      edCComercial.Text    := qyCComerciales.FieldByName('R_CC_NOMBRE').AsString;
      cbBancos.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
      sbRBancos.Visible    := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
      laCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
      deCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
      edFecha.Visible      := qyCComerciales.FieldByName('R_CC_FECHA').AsString = 'Si';
      edReferencia.Visible := qyCComerciales.FieldByName('R_CC_REFERENCIA').AsString = 'Si';
      edFolio.Visible      := qyCComerciales.FieldByName('R_CC_FOLIO').AsString = 'Si';
      cbAlmacenes.Visible  := qyCComerciales.FieldByName('R_ACTIVAR_ALMACEN').AsString = 'Si';

      laBanco.Visible      := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
      laFecha.Visible      := qyCComerciales.FieldByName('R_CC_FECHA').AsString = 'Si';
      laReferencia.Visible := qyCComerciales.FieldByName('R_CC_REFERENCIA').AsString = 'Si';
      laFolio.Visible      := qyCComerciales.FieldByName('R_CC_FOLIO').AsString = 'Si';

      if edFecha.Visible then
      begin
         dmIBData.spFECHA_SERVIDOR.ExecProc;
         edFecha.Date := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDate;
      end;

      fijarBotonesP(true);

      if(cc in [ccME]) then
      begin
         qyMonedero.Close;
         qyMonedero.ParamByName('P_ID').AsInteger := qyCComerciales.FieldByName('R_ID').AsInteger;
         qyMonedero.Open;
         awrMONEDERO := qyMonedero.FieldByName('ID').AsInteger;

         //edMonto.Value := qyMonedero.FieldByName('TOTAL').AsFloat;

         buDoc.Visible      := true;
         edMonto.ReadOnly   := true;
         edMonto.TabStop    := false;
         edMonto.Color      := clBackground;
         edMonto.Font.Color := clWhite;
         if cbAlmacenes.Visible then
            cbAlmacenes.SetFocus
         else
         if edFecha.Visible then
            edFecha.SetFocus
         else
         if cbBancos.Visible then
            cbBancos.SetFocus
         else
         if edReferencia.Visible then
            edReferencia.SetFocus
         else
         if edFolio.Visible then
            edFolio.SetFocus;
      end
      else
      if (cc in [ccVales, ccCupones]) then
      begin
         qyVales.Close;
         qyVales.ParamByName('P_ID').AsInteger := qyCComerciales.FieldByName('R_ID').AsInteger;
         qyVales.Open;
         if (qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccVales) then
            awrVales := qyVales.FieldByName('ID').AsInteger;
         if (qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccCupones) then
            awrCupones := qyVales.FieldByName('ID').AsInteger;

         //edMonto.Value := qyVales.FieldByName('TOTAL').AsFloat;

         buDoc.Visible      := true;
         edMonto.ReadOnly   := true;
         edMonto.TabStop    := false;
         edMonto.Color      := clBackground;
         edMonto.Font.Color := clWhite;
         if cbAlmacenes.Visible then
            cbAlmacenes.SetFocus
         else
         if edFecha.Visible then
            edFecha.SetFocus
         else
         if cbBancos.Visible then
            cbBancos.SetFocus
         else
         if edReferencia.Visible then
            edReferencia.SetFocus
         else
         if edFolio.Visible then
            edFolio.SetFocus;
      end
      else
      begin
         buDoc.Visible      := false;
         edMonto.ReadOnly   := false;
         edMonto.Color      := clWindow;
         edMonto.Font.Color := clBlack;
         edMonto.TabStop    := true;
         //edMonto.Value := dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat;


         if cbAlmacenes.Visible then
            cbAlmacenes.SetFocus
         else
         if edFecha.Visible then
            edFecha.SetFocus
         else
         if cbBancos.Visible then
            cbBancos.SetFocus
         else
            edMonto.SetFocus;
      end;
   end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buF9Click(Sender: TObject);
var
   respuesta : boolean;
   fraccion  : Real;
   entero    : Real;
   grabar    : boolean;
begin
  grabar := true;
  if cbBancos.Visible then
  begin
     if cbBancos.Text = '' then
     begin
        grabar := false;
        ShowMessage('Falta capturar el BANCO');
     end;
  end;

  if edFecha.Visible and grabar then
  begin
     {
     try
       StrToDateTime(edFecha.DateTime);
     except
       on E: EConvertError do
       begin
          grabar := false;
          ShowMessage('Fecha no valida');
       end;
     end;
     }
  end;

  if grabar then
  begin
     if edFecha.Focused then
        edMonto.SetFocus;
     entero   := Int(edFecha.Date);
     fraccion := Frac(edFecha.Date);
     if entero > 0 then
     begin
        if fraccion = 0 then
           edFecha.Date := edFecha.Date + time;
     end;

     respuesta := true;

     if (qyCComerciales.FieldByName('R_CC_AUTORIZACION').AsString = 'Si') and (edMonto.TExt <> '0') then
     begin
        if reglas.dameUsuarioNivel < 3 then
        begin
           frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
           frmAutorizacion.ShowModal;
           respuesta := frmAutorizacion.dame_respuesta;
           frmAutorizacion.Destroy;
        end;
     end;

     if respuesta then
     begin
        qyActualizar.SQL.Clear;
        qyActualizar.SQL.Add('UPDATE PUNTO_DE_VENTAS_REF_PAGOS');
        qyActualizar.SQL.Add('SET MONTO = :P_MONTO');
        if cbBancos.Visible then
           qyActualizar.SQL.Add(', BANCO = :P_BANCO');
        if edFecha.Visible then
           qyActualizar.SQL.Add(', FECHA = :P_FECHA');
        if edReferencia.Visible then
           qyActualizar.SQL.Add(', CONTENIDO_REFERENCIA = :P_REFERENCIA');
        if edFolio.Visible then
           qyActualizar.SQL.Add(', CONSECUTIVO_FOLIO = :P_FOLIO');
        qyActualizar.SQL.Add('WHERE ID = :P_ID');
        qyActualizar.ParamByName('P_MONTO').AsFloat := StrToFloat(edMonto.Text);
        if cbBancos.Visible then
           qyActualizar.ParamByName('P_BANCO').AsInteger := cbBancos.KeyValue;
        if edFecha.Visible then
           qyActualizar.ParamByName('P_FECHA').AsDateTime := edFecha.Date;
        if edReferencia.Visible then
           qyActualizar.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
        if edFolio.Visible then
           qyActualizar.ParamByName('P_FOLIO').AsString := edFolio.Text;
        qyActualizar.ParamByName('P_ID').AsInteger := qyCComerciales.FieldByName('R_ID').AsInteger;
        qyActualizar.ExecSQL;
        qyActualizar.Transaction.CommitRetaining;

        spTOTAL_FORMA_PAGOS.ParamByName('P_PVENTA').AsInteger := TIBQuery(dsEncabezado.DataSet).FieldByName('R_ID').AsInteger;
        spTOTAL_FORMA_PAGOS.ExecProc;
        spTOTAL_FORMA_PAGOS.Transaction.CommitRetaining;
        reglas.abrir_IBQuery_seek('R_ID',dsEncabezado.DataSet.FieldByName('R_ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
        reglas.abrir_IBQuery_seek('R_ID',qyCComerciales.FieldByName('R_ID').AsInteger, qyCComerciales);

        fijarBotonesP(false);

        laSaldo.Caption := FormatFloat('$ ###,###,##0.00',dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat);
        if dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat < 0 then //menor a cero para generar nuevo cupon
        begin
          // laSaldo.HotTrack  := true;
           laSaldo.Cursor    := crHandPoint;
           laF4.Visible      := true;
           itemF4.Visible    := true;
        end
        else
           begin
              //laSaldo.HotTrack  := false;
              laSaldo.Cursor    := crDefault;
              laF4.Visible      := false;
              itemF4.Visible    := false;
           end;
        dgFormaPago.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.cClick(Sender: TObject);
begin
   fijarBotonesP(false);
   dgFormaPago.SetFocus;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buF12ImpClick(
  Sender: TObject);
var
   afectar   : boolean;
   cc        : boolean;
   mString   : string;
   cupon     : TfrmPRN_0034;
   tarjeta   : string;
   puntos    : double;
   vFacturar : string;

   HLibr     : THandle; //Puntero para la librer�a
   FuncPoint : TFarProc; //Puntero para la funci�n
   MiFunc    : TFunc;

begin
  buF12Imp.Enabled := false; //es para que no se corra cuando el usuario aprieta varias veces F12

  afectar := true;
  tarjeta := '';
  puntos  := 0;

  //Validar Huella Dactilar
  if awrHuella and (awrCEfectivo <> awrCliente) then
  begin
     HLibr := LoadLibrary (HuellaDLL); //Cargamos la librer�a
     if HLibr > 0 then
     begin
        try
           FuncPoint := GetProcAddress (HLibr, PChar (IdHuella)); //Cargamos la funci�n
           if FuncPoint <> nil then
           begin
              MiFunc := TFunc(FuncPoint); //Asignamos la funci�n...
              MiFunc(reglas.dame_llave, reglas.dame_servidor, reglas.dame_ruta, reglas.dameDatabaseName, awrCliente, awrExtension, reglas.dameUsuarioNivel); //y la ejecutamos
           end
           else
              ShowMessage ('No existe la funci�n ' + IdHuella);
        finally
           FreeLibrary (HLibr); //Liberamos la librer�a
        end
     end
     else
        ShowMessage ('No se ha encontrado la librer�a ' + HuellaDLL);
//     awr_identificar_huella(reglas.dame_llave, reglas.dame_servidor, reglas.dame_ruta, reglas.dameDatabaseName, awrCliente, awrExtension, reglas.dameUsuarioNivel);
{     try
        frmIdentificar := TfrmIdentificar.Create(Application);
        frmIdentificar.Open;
        frmIdentificar.CLIENTE   := awrCliente;
        frmIdentificar.EXTENSION := awrExtension;
        frmIdentificar.Inicializar;
        frmIdentificar.ShowModal;
     finally
        frmIdentificar.Release;
     end;}
  end;

  //Activar limites de credito
  dmIBData.TPreferencias.Filter := 'ID = 55';
  if UPPERCASE(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI' then
  begin
     qyVALIDAR_LIMITE.Close;
     qyVALIDAR_LIMITE.ParamByName('P_VENTA').AsInteger := TIBQuery(dsEncabezado.DataSet).FieldByName('R_ID').AsInteger;
     qyVALIDAR_LIMITE.Open;
     if qyVALIDAR_LIMITE.FieldByName('R_AFECTAR').AsString = 'No' then
        afectar := false;
  end;

  cc := true;
  if mensajeCC then
  begin
     mString := 'formas de pago: ' + #13 + #13;
     dsFuente.DataSet.First;
     while not(dsFuente.DataSet.Eof) do
     begin
        if dsFuente.DataSet.FieldByName('R_MONTO').AsFloat <> 0 then
           mString := mString + UpperCase(dsFuente.DataSet.FieldByName('R_CC_NOMBRE').AsString) + #13;
        dsFuente.DataSet.Next;
     end;

     if MessageDlg(mString,mtConfirmation, [mbYes, mbNo], 0) = mrNo then
        cc := false;
  end;

  if afectar and cc then
  begin
     {***************************
      Afectacion: vales
      Fecha:05/08/2004
     ***************************}
     if awrVALES <> 0 then
     begin
        spP_VALES_AFECTAR.ParamByName('P_ID').AsInteger := awrVALES;
        spP_VALES_AFECTAR.ExecProc;
        spP_VALES_AFECTAR.Transaction.CommitRetaining;
     end;
     {***************************
      Afectacion: cupones
      Fecha:11/10/2004
     ***************************}
     if awrCUPONES <> 0 then
     begin
        spP_VALES_AFECTAR.ParamByName('P_ID').AsInteger := awrCUPONES;
        spP_VALES_AFECTAR.ExecProc;
        spP_VALES_AFECTAR.Transaction.CommitRetaining;
     end;
     {***************************
      Afectacion: Monedero Electronico
      Fecha:07/03/2005
      Modificacion: 25/08/2005
     ***************************}
     if awrMONEDERO <> 0 then
     begin
        spP_MONEDERO_AFECTAR.ParamByName('P_ID').AsInteger := awrMONEDERO;
        spP_MONEDERO_AFECTAR.ExecProc;
        spP_MONEDERO_AFECTAR.Transaction.CommitRetaining;
     end;
     {***************************
      Generacion: Monedero Electronico (Puntos)
      Fecha:02/03/2005
     ***************************}
     if ACTIVARME then
     begin
        //Precedencia: Tienda, linea/sublinea, material, condicion comercial
        qyBlackBoxME1.Close;
        qyBlackBoxME1.ParamByName('P_ID').AsInteger   := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
        qyBlackBoxME1.ParamByName('P_QUIEN').AsString := 'PUNTO_DE_VENTA';
        qyBlackBoxME1.Open;
        if qyBlackBoxME1.FieldByName('R_PUNTOS').AsInteger > 0 then
        begin
           frmInfo := TfrmInfo.Create(Application);
           if awrCEfectivo <>  dsEncabezado.DataSet.FieldByName('R_CLIENTE').AsInteger then
           begin
              frmInfo.edNombre.Text       := CLIENTEN;
              frmInfo.edTelefono.Text     := TELEFONO;
              frmInfo.edNombre.Color      := frmInfo.edPuntos.Color;
              frmInfo.edNombre.ReadOnly   := true;
              frmInfo.edTelefono.Color    := frmInfo.edPuntos.Color;
              frmInfo.edTelefono.ReadOnly := true;
           end;
           frmInfo.edPuntos.Text := qyBlackBoxME1.FieldByName('R_PUNTOS').AsString;
           frmInfo.ShowModal;
           tarjeta := frmInfo.edTarjeta.Text;
           puntos  := qyBlackBoxME1.FieldByName('R_PUNTOS').AsFloat;
           //Afectacion
           spP_ME_AFECTAR.ParamByName('P_TARJETA').AsString          := frmInfo.edTarjeta.Text;
           spP_ME_AFECTAR.ParamByName('P_SUJETO').AsInteger          := CLIENTE;
           spP_ME_AFECTAR.ParamByName('P_SUJETO_TIPO').AsString      := 'SUJETOS_CLIENTES';
           spP_ME_AFECTAR.ParamByName('P_NOMBRE').AsString           := frmInfo.edNombre.Text;
           spP_ME_AFECTAR.ParamByName('P_TELEFONO').AsString         := frmInfo.edTelefono.Text;
           spP_ME_AFECTAR.ParamByName('P_PUNTOS').AsInteger          := qyBlackBoxME1.FieldByName('R_PUNTOS').AsInteger;
           spP_ME_AFECTAR.ParamByName('P_CONCEPTO').AsString         := qyBlackBoxME1.FieldByName('R_CONCEPTO').AsString;
           spP_ME_AFECTAR.ParamByName('P_TABLA_REFERENCIA').AsString := 'PUNTO_DE_VENTAS';
           spP_ME_AFECTAR.ParamByName('P_ID_REFERENCIA').AsInteger   := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
           spP_ME_AFECTAR.ExecProc;
           spP_ME_AFECTAR.Transaction.CommitRetaining;
           //End Afectacion
           frmInfo.Free;
           frmInfo := nil;
        end;

        //*CLIENTE (Primera Compra)
        qyBlackBoxME3.Close;
        qyBlackBoxME3.ParamByName('P_ID').AsInteger   := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
        qyBlackBoxME3.ParamByName('P_QUIEN').AsString := 'PUNTO_DE_VENTA';
        qyBlackBoxME3.Open;
        if (qyBlackBoxME3.FieldByName('R_PUNTOS').AsInteger > 0) and (qyBlackBoxME3.FieldByName('R_TARJETA').AsString <> '') then
        begin
           //Afectacion
           spP_ME_AFECTAR.ParamByName('P_TARJETA').AsString          := qyBlackBoxME3.FieldByName('R_TARJETA').AsString;
           spP_ME_AFECTAR.ParamByName('P_SUJETO').AsInteger          := qyBlackBoxME3.FieldByName('R_RECOMENDADO_POR').AsInteger;
           spP_ME_AFECTAR.ParamByName('P_SUJETO_TIPO').AsString      := 'SUJETOS_CLIENTES';
           spP_ME_AFECTAR.ParamByName('P_NOMBRE').AsString           := qyBlackBoxME3.FieldByName('R_NOMBRE').AsString;
           spP_ME_AFECTAR.ParamByName('P_TELEFONO').AsString         := qyBlackBoxME3.FieldByName('R_TELEFONO').AsString;
           spP_ME_AFECTAR.ParamByName('P_PUNTOS').AsInteger          := qyBlackBoxME3.FieldByName('R_PUNTOS').AsInteger;
           spP_ME_AFECTAR.ParamByName('P_CONCEPTO').AsString         := '*CLIENTE (Primera Compra)';
           spP_ME_AFECTAR.ParamByName('P_TABLA_REFERENCIA').AsString := 'PUNTO_DE_VENTAS';
           spP_ME_AFECTAR.ParamByName('P_ID_REFERENCIA').AsInteger   := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
           spP_ME_AFECTAR.ExecProc;
           spP_ME_AFECTAR.Transaction.CommitRetaining;
           //End Afectacion
        end;
     end;
     //*************************}


     //Afectar Punto de Venta
     vFacturar := 'No';
     if paFacturar.Visible and cbFacturar.Checked then
        vFacturar := 'Si';
     estatusInternoAfectado(vFacturar);
     //Impresion Punto de Venta
     if paFacturar.Visible and cbFacturar.Checked then
     begin
        try
           frmPRN_0003_TXT    := TfrmPRN_0003_TXT.Create(Application);
           frmPRN_0003_TXT.ID := spEstatus.ParamByName('R_FACTURA').AsInteger;
           if frmPRN_0003_TXT.OpenFormato then
              frmPRN_0003_TXT.imprimir;
        finally
           frmPRN_0003_TXT.Destroy;
        end;

        ModalResult := mrOk;
     end
     else
     begin//PRN_0008
        frmPRN_0008         := TfrmPRN_0008.Create(Application);
        frmPRN_0008.ID      := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
        frmPRN_0008.Print;
        frmPRN_0008.Destroy;

        {***************************
        Impresion: Cupon detalle
        Fecha:19/03/2004
        ***************************}
        cupon := TfrmPRN_0034.Create(Application);
        cupon.FOLIO := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
        if not(cupon.VACIO) then
        begin
           cupon.PEDIR := false;
           if awrCEfectivo =  dsEncabezado.DataSet.FieldByName('R_CLIENTE').AsInteger then
              cupon.PEDIR := true;
           cupon.Imprimir;
        end;
        cupon.Destroy;
        //***************************}

        ModalResult := mrOk;
     end
{     else
        if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger = 2 then
        begin//PRN_0003, PRN_0004
           else
              begin
                 if MessageDlg('imprimir: NOTA DE VENTA',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                 begin
                    spADD_PVTA_A_PEDIDO2.ParamByName('P_ID').AsInteger      := TIBQuery(dsEncabezado.DataSet).FieldByName('R_ID').AsInteger;
                    spADD_PVTA_A_PEDIDO2.ParamByName('P_FOLIO').AsString    := '';
                    spADD_PVTA_A_PEDIDO2.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
                    spADD_PVTA_A_PEDIDO2.ParamByName('P_ORIGEN').AsString   := 'Nota de Venta';
                    spADD_PVTA_A_PEDIDO2.ExecProc;
                    spADD_PVTA_A_PEDIDO2.Transaction.CommitRetaining;

                    frmPRN_0004_TXT := TfrmPRN_0004_TXT.CrearA(Application, dsEncabezado.DataSet.FieldByName('R_ID').AsInteger);
                    frmPRN_0004_TXT.imprimir;
                    frmPRN_0004_TXT.Destroy;

                    ModalResult := mrOk;
                 end;
              end;
        end;}
  end
  else
     if not(afectar) then
     begin
       showMessage('Sobrepasa su credito disponible, verificar en sus formas de pago.');
     end

  //buF12Imp.Enabled := true;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buVentasClick(
  Sender: TObject);
var
   pnt1 : TPoint;
   pnt2 : TPoint;
   y2   : integer;
begin
  pnt1 := paCaptura.ClientToScreen(Point(0,0));
  //pnt2 := sbHijo.ClientToScreen(Point(0,0));
  y2   := pnt2.y - pnt1.y;
  frmVerDetalleHijo := TfrmVerDetalleHijo.crear(Application, dsEncabezado.DataSet.FieldByName('R_ID').AsInteger, pnt1.x, pnt1.y, y2);
  frmVerDetalleHijo.ShowModal;
  frmVerDetalleHijo.Destroy;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.dgFormaPagoDblClick(
  Sender: TObject);
begin
  if buF8.Enabled then
     buF8.Click;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsEncabezado.DataSet := nil;
  dsCliente.DataSet    := nil;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.FormShow(Sender: TObject);
var
   id : integer;
begin
  id := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
  spADD_FORMAS_DE_PAGO_PVTA.ParamByName('PVENTA').AsInteger := id;
  spADD_FORMAS_DE_PAGO_PVTA.ExecSQL;
  spADD_FORMAS_DE_PAGO_PVTA.Transaction.CommitRetaining;

  reglas.abrir_IBQuery_seek('R_ID',id, TIBQuery(dsEncabezado.DataSet));

  qyCComerciales.Close;
  qyCComerciales.ParamByName('P_VENTA').AsInteger := id;
  qyCComerciales.Open;

  fijarBotonesP(false);

  laSaldo.Caption := FormatFloat('$ ###,###,##0.00',dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat);
end;

procedure TfrmCapturar_punto_de_ventas_pagos.paCapturaEnter(
  Sender: TObject);
begin
  if cbBancos.Visible then
  begin
     reglas.refresh_IBQuery(qyBancos);
     cbBancos.KeyValue := dsBancos.DataSet.FieldByName('ID').AsInteger;
  end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.laSaldoClick(Sender: TObject);
begin
  if dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat < 0 then
  begin
     spGENERAR_CUPON_AJUSTE.ParamByName('P_ID').AsInteger := dsEncabezado.DataSet.FieldByName('R_ID').AsInteger;
     spGENERAR_CUPON_AJUSTE.ExecProc;
     if spGENERAR_CUPON_AJUSTE.ParamByName('R_ERROR').AsInteger = 0 then
     begin
        ShowMessage( 'Solamente debe contener formas de pago VALES y/o CUPONES');
     end
     else
        begin
           spTOTAL_FORMA_PAGOS.ParamByName('P_PVENTA').AsInteger := TIBQuery(dsEncabezado.DataSet).FieldByName('R_ID').AsInteger;
           spTOTAL_FORMA_PAGOS.ExecProc;
           spTOTAL_FORMA_PAGOS.Transaction.CommitRetaining;
           reglas.abrir_IBQuery_seek('R_ID',dsEncabezado.DataSet.FieldByName('R_ID').AsInteger, TIBQuery(dsEncabezado.DataSet));
           reglas.abrir_IBQuery_seek('R_ID',qyCComerciales.FieldByName('R_ID').AsInteger, qyCComerciales);
           laSaldo.Caption    := FormatFloat('$ ###,###,##0.00',dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat);
           buF12Imp.Enabled   := true;
           itemF12Imp.Enabled := true;
           //laSaldo.HotTrack   := false;
           laSaldo.Cursor     := crDefault;
           laF4.Visible       := false;
           itemF4.Visible     := false;
        end;
  end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buInicioClick(
  Sender: TObject);
begin
  dgFormaPago.DataSource.Dataset.First;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buAnteriorClick(
  Sender: TObject);
begin
  dgFormaPago.DataSource.Dataset.Prior;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buSiguienteClick(
  Sender: TObject);
begin
  dgFormaPago.DataSource.Dataset.Next;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buFinClick(Sender: TObject);
begin
  dgFormaPago.DataSource.Dataset.Last;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buDocClick(Sender: TObject);
var
   pnt : TPoint;
begin
   pnt := buDoc.ClientToScreen(Point(0,0));
   pnt.y := pnt.y + buDoc.Height;

   if qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccVales then
   begin
      frmValesDetalle := TfrmValesDetalle.Create(Application);
      frmValesDetalle.ID := qyCComerciales.FieldByName('R_ID').AsInteger;
      frmValesDetalle.X  := pnt.X;
      frmValesDetalle.Y  := pnt.Y;
      frmValesDetalle.ShowModal;
      if frmValesDetalle.ELIMINAR then
      begin
         edMonto.Text := FloatToStr(frmValesDetalle.TOTAL);
      end;
      frmValesDetalle.Destroy;
   end
   else
   if qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccME then
   begin
      frmMonederoReg    := TfrmMonederoReg.Create(Application);
      frmMonederoReg.ID := qyCComerciales.FieldByName('R_ID').AsInteger;
      frmMonederoReg.X  := pnt.X;
      frmMonederoReg.Y  := pnt.Y;
      frmMonederoReg.ShowModal;
      if frmMonederoReg.ELIMINAR then
      begin
         edMonto.Text  := FloatToStr(frmMonederoReg.TOTAL);
      end;
      frmMonederoReg.Destroy;
   end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.sbRBancosClick(
  Sender: TObject);
begin
  reglas.refresh_IBQuery(qyBancos);
end;

procedure TfrmCapturar_punto_de_ventas_pagos.edReferenciaKeyPress(
  Sender: TObject; var Key: Char);
var
   cc   : integer;
   v_me : boolean;
begin
   if (key = #13) and (edReferencia.Text <> '') then
   begin
      cc := qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger;
      if cc = ccCupones then
      begin
         spCUPONES_PUNTO_DE_VTAS.ParamByName('P_ID').AsInteger      := qyCComerciales.FieldByName('R_ID').AsInteger;
         spCUPONES_PUNTO_DE_VTAS.ParamByName('P_FECHA').AsDate      := edFecha.Date;
         spCUPONES_PUNTO_DE_VTAS.ParamByName('P_FOLIO').AsString    := edReferencia.Text;
         spCUPONES_PUNTO_DE_VTAS.ParamByName('P_ALMACEN').AsInteger := ALMACEN;
         spCUPONES_PUNTO_DE_VTAS.ExecProc;
         spCUPONES_PUNTO_DE_VTAS.Transaction.CommitRetaining;
         if spCUPONES_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger = 0 then//no hay error
         begin
            awrCUPONES   := spCUPONES_PUNTO_DE_VTAS.ParamByName('R_CONSECUTIVO').AsInteger;
            edMonto.Text := spCUPONES_PUNTO_DE_VTAS.ParamByName('R_TOTAL').AsString;
         end
         else//si hay error
            begin
               case spCUPONES_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger of
                 1 : ShowMessage('No se encuentra folio con esa fecha.');
                 2 : ShowMessage( 'Ya contiene este pago, esta partida.');
                 3 :ShowMessage( 'Ya fue afectado en otra partida.');
               end;
            end;
      end;
      if cc = ccVales then
      begin
         spVALES_PUNTO_DE_VTAS.ParamByName('P_ID').AsInteger      := qyCComerciales.FieldByName('R_ID').AsInteger;
         spVALES_PUNTO_DE_VTAS.ParamByName('P_FECHA').AsDate      := edFecha.Date;
         spVALES_PUNTO_DE_VTAS.ParamByName('P_FOLIO').AsString    := edReferencia.Text;
         spVALES_PUNTO_DE_VTAS.ParamByName('P_ALMACEN').AsInteger := ALMACEN;
         spVALES_PUNTO_DE_VTAS.ExecProc;
         spVALES_PUNTO_DE_VTAS.Transaction.CommitRetaining;
         if spVALES_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger = 0 then//no hay error
         begin
            awrVALES     := spVALES_PUNTO_DE_VTAS.ParamByName('R_CONSECUTIVO').AsInteger;
            edMonto.Text := spVALES_PUNTO_DE_VTAS.ParamByName('R_TOTAL').AsString;
         end
         else//si hay error
            begin
               case spVALES_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger of
                 1 : ShowMessage( 'No se encuentra folio con esa fecha.');
                 2 : ShowMessage( 'Ya contiene este pago, esta partida.');
                 3 : ShowMessage( 'Ya fue afectado en otra partida.');
                 4 : ShowMessage( 'El folio encontrado, no es vale.');
               end;
            end;
      end;
      if cc = ccME then
      begin
         v_me := true;
         if awrVerificarME then
         begin
            spVERIFICAR_ME_CLIENTE.ParamByName('P_CLIENTE').AsInteger := dsEncabezado.DataSet.FieldByName('R_CLIENTE').AsInteger;
            spVERIFICAR_ME_CLIENTE.ParamByName('P_CODIGO').AsString   := edReferencia.Text;
            spVERIFICAR_ME_CLIENTE.ExecProc;
            spVERIFICAR_ME_CLIENTE.Transaction.CommitRetaining;
            v_me := spVERIFICAR_ME_CLIENTE.ParamByName('R_ACEPTAR').AsString = 'Si';
            if not(v_me) then
            begin
              ShowMessage('El Cliente no cuenta con  este monedero.');
            end;
         end;

         if v_me then
         begin
            spDAME_PUNTOS.ParamByName('P_ID').AsInteger    := qyCComerciales.FieldByName('R_ID').AsInteger;
            spDAME_PUNTOS.ParamByName('P_QUIEN').AsString  := 'PUNTO_DE_VENTAS_REF_PAGOS';
            spDAME_PUNTOS.ParamByName('P_CODIGO').AsString := edReferencia.Text;
            spDAME_PUNTOS.ParamByName('P_SALDO').AsFloat   := dsEncabezado.DataSet.FieldByName('R_SALDO').AsFloat;
            spDAME_PUNTOS.ExecProc;
            spDAME_PUNTOS.Transaction.CommitRetaining;
            if spDAME_PUNTOS.ParamByName('R_PUNTOS').AsInteger = 0 then
            begin
              ShowMessage('No contiene puntos esta tarjeta.');
            end
            else
            begin
               spME_REG_PUNTO_DE_VTAS.ParamByName('P_ID').AsInteger     := qyCComerciales.FieldByName('R_ID').AsInteger;
               spME_REG_PUNTO_DE_VTAS.ParamByName('P_ME').AsInteger     := spDAME_PUNTOS.ParamByName('R_ME').AsInteger;
               spME_REG_PUNTO_DE_VTAS.ParamByName('P_ME_DET').AsInteger := spDAME_PUNTOS.ParamByName('R_ID').AsInteger;
               spME_REG_PUNTO_DE_VTAS.ParamByName('P_PUNTOS').AsFloat   := spDAME_PUNTOS.ParamByName('R_PUNTOS').AsFloat;
               spME_REG_PUNTO_DE_VTAS.ExecProc;
               spME_REG_PUNTO_DE_VTAS.Transaction.CommitRetaining;
               if spME_REG_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger = 0 then//no hay error
               begin
                  awrMONEDERO  := spME_REG_PUNTO_DE_VTAS.ParamByName('R_CONSECUTIVO').AsInteger;
                  edMonto.Text := spME_REG_PUNTO_DE_VTAS.ParamByName('R_TOTAL').AsString;

                  edReferencia.Clear;
                  edReferencia.SetFocus;
               end
               else//si hay error
                  begin
                     case spME_REG_PUNTO_DE_VTAS.ParamByName('R_ERROR').AsInteger of
                       1 : ShowMessage('Ya contiene este monedero, esta partida.');
                     end;
                  end;
            end;
         end;
      end;
   end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.qyBancosCalcFields(
  DataSet: TDataSet);
begin
  if DataSet.FieldByName('NOMBRE').AsString <> '' then
     DataSet.FieldByName('nombre_corto').AsString := Copy(DataSet.FieldByName('NOMBRE').AsString,1,25)
  else
     DataSet.FieldByName('nombre_corto').AsString := '';
end;

procedure TfrmCapturar_punto_de_ventas_pagos.itemF8Click(Sender: TObject);
begin
   buF8.Click;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.itemF9Click(Sender: TObject);
begin
   buF9.Click;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.itemF10Click(Sender: TObject);
begin
   buF10.Click;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.itemF12ImpClick(
  Sender: TObject);
begin
   if buF12Imp.Enabled then
      buF12Imp.Click;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.edMontoKeyPress(
  Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (edMonto.Text <> '') then
   begin
      buF9.Click;
   end;
end;

procedure TfrmCapturar_punto_de_ventas_pagos.buF10Click(
  Sender: TObject);
begin
   fijarBotonesP(false);
   dgFormaPago.SetFocus;
end;

end.
