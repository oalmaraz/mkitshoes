unit capturar_pagos_formas_de_pago;

interface

uses
  UfrmChequesR, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  hijo, IBX.IBStoredProc, Menus, Db, IBX.IBTable,
     DBCtrls,
   StdCtrls, IBX.IBCustomDataSet, IBX.IBQuery,   Mask,
   jpeg,  ExtCtrls,  IBX.IBUpdateSQL,
   ComCtrls, Buttons,
    Grids, DBGrids;

type
  TfrmCapturar_Pagos_formas_de_pago = class(TfrmHijo)
    pmFormas: TPopupMenu;
    miModificar: TMenuItem;
    miGuardar: TMenuItem;
    miCancelar: TMenuItem;
    miImprimir: TMenuItem;
    Salir1: TMenuItem;
    spAFECTA_CXC_PAGOS: TIBStoredProc;
    qyBancos: TIBQuery;
    dsBancos: TDataSource;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    paCaptura: TPanel;
    Label3: TLabel;
    laReferencia: TLabel;
    laFolio: TLabel;
    paContenedorTotales: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    paTotales: TPanel;
    Label6: TLabel;
    dtCambio: TDBText;
    Label7: TLabel;
    dtSaldoXAplicar: TDBText;
    Label8: TLabel;
    dtTotal: TDBText;
    dgFormaPago: TDBGrid;
    qyTotalCXCPagos: TIBQuery;
    qyTotalCXCPagosR_SALDO: TFloatField;
    dsTotalCXCPagos: TDataSource;
    qyTotalCXCPagosR_TOTAL: TFloatField;
    qyTotalCXCPagosR_CAMBIO: TFloatField;
    spCASOS_PAGOS: TIBStoredProc;
    spCREA_CCOMERCIALES_CXC: TIBStoredProc;
    spTAJETA_DE_CREDITO: TIBStoredProc;
    laFecha: TLabel;
    qyCComerciales: TIBQuery;
    edMonto: TEdit;
    edReferencia: TEdit;
    edFolio: TEdit;
    qyActualizar: TIBQuery;
    edFecha: TDateTimePicker;
    laCredito: TLabel;
    laDisponible: TLabel;
    qyBancosID: TIntegerField;
    qyBancosCLAVE: TIBStringField;
    qyBancosNOMBRE: TIBStringField;
    qyBancosRAZON_SOCIAL: TIBStringField;
    qyBancosCUENTA: TIBStringField;
    qyBancosSUCURSAL: TIBStringField;
    qyBancosnombre_corto: TStringField;
    Label2: TLabel;
    edCComercial: TEdit;
    laAlmacen: TLabel;
    edAlmacen: TEdit;
    laBanco: TLabel;
    cbBancos: TDBLookupComboBox;
    sbRBancos: TSpeedButton;
    deCuenta: TDBEdit;
    laCuenta: TLabel;
    spCAJA_NEGRA_ME_2: TIBStoredProc;
    spP_ME_AFECTAR: TIBStoredProc;
    spTAJETA_DE_DEBITO: TIBStoredProc;
    buCheques: TButton;
    spP_CXC_CHEQUES_AFECTAR: TIBStoredProc;
    qyTotalCXCPagosR_MONEDA: TIntegerField;
    qyTotalCXCPagosR_MONEDA_CLAVE: TIBStringField;
    qyTotalCXCPagosR_MONEDA_DESCRIPCION: TIBStringField;
    dtMoneda: TDBText;
    DBText1: TDBText;
    DBText2: TDBText;
    laMoneda1: TLabel;
    laMoneda2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure dsTotalCXCPagosDataChange(Sender: TObject; Field: TField);
    procedure paCapturaEnter(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure miModificarClick(Sender: TObject);
    procedure miGuardarClick(Sender: TObject);
    procedure miCancelarClick(Sender: TObject);
    procedure miImprimirClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure dgFormaPagoDblClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure qyBancosCalcFields(DataSet: TDataSet);
    procedure buChequesClick(Sender: TObject);
  private
    { Private declarations }
    ccCheques     : integer;
    ccTCredito    : integer;
    ccTDebito     : integer;
    ccDepositos   : integer;
    edicion       : boolean;
    awrID         : integer;
    awrCLIENTE    : integer;
    awrCREDITO    : double;
    awrCDIPONIBLE : double;
    awrActivarME  : boolean;
    awrCLIENTEN   : string;
    awrTELEFONO   : string;
    awrDEPOSITO   : integer;
    procedure fijarBotones;
    procedure setCREDITO(valor : double);
    procedure setCDIPONIBLE(valor : double);
    procedure setID(valor : integer);
    procedure setALMACEN(valor: string);
    procedure setCliente(valor : integer);
  public
    { Public declarations }
  published
     property ID         : integer read awrID write setID;
     property CLIENTE    : integer read awrCLIENTE write setCliente;
     property CLIENTEN   : string read awrCLIENTEN write awrCLIENTEN;
     property TELEFONO   : string read awrTELEFONO write awrTELEFONO;
     property CREDITO    : double read awrCREDITO write setCREDITO;
     property DISPONIBLE : double read awrCDIPONIBLE write setCDIPONIBLE;
     property ALMACEN    : string write setALMACEN;
     property ACTIVARME  : boolean read awrActivarME write awrActivarMe;
     property DEPOSITO   : integer read awrDeposito write awrDeposito;
  end;

var
  frmCapturar_Pagos_formas_de_pago: TfrmCapturar_Pagos_formas_de_pago;

implementation

uses reglas_de_negocios, IBData, IBModulo, PRN_0007_Pagos, autorizacion, UfrmInfo;

{$R *.DFM}

procedure TfrmCapturar_Pagos_formas_de_pago.setCliente(valor : integer);
begin
   awrCLIENTE := valor;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.setALMACEN(valor: string);
begin
   edAlmacen.Text := valor;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.setID(valor : integer);
begin
   awrID := valor;
   qyCComerciales.Close;
   qyCComerciales.ParamByName('P_PAGO').AsInteger := valor;
   qyCComerciales.Open;
   qyTotalCXCPagos.Close;
   qyTotalCXCPagos.ParamByName('P_CXC_PAGOS').AsInteger := valor;
   qyTotalCXCPagos.Open;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.setCREDITO(valor : double);
begin
   awrCREDITO := valor;
   laCredito.Caption := FormatFloat('$ ###,###,##0.00', valor);
end;

procedure TfrmCapturar_Pagos_formas_de_pago.setCDIPONIBLE(valor : double);
begin
   awrCDIPONIBLE := valor;
   laDisponible.Caption := FormatFloat('$ ###,###,##0.00', valor);
end;

procedure TfrmCapturar_Pagos_formas_de_pago.fijarBotones;
begin
  ibModificarPartida.Enabled := not edicion;
  ibGuardarPartida.Enabled   := edicion;
  ibCancelarPartida.Enabled  := edicion;
  ibImprimir.Enabled         := (not edicion) and (dsTotalCXCPagos.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);
  miModificar.Enabled        := ibModificarPartida.Enabled;
  miGuardar.Enabled          := ibGuardarPartida.Enabled;
  miCancelar.Enabled         := ibCancelarPartida.Enabled;
  miImprimir.Enabled         := ibImprimir.Enabled;
  paCaptura.Visible          := edicion;
  dgFormaPago.Enabled        := not edicion;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  reglas.abrir_IBTabla(dmIBData.TFiltroCondicionesComerciales);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.abrir_IBTabla(dmIBData.TFiltroMonedas);

  //Condicion Comercial Cheques
  dmIBData.TPreferencias.Filter := 'ID = 25';
  ccCheques := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Depositos
  dmIBData.TPreferencias.Filter := 'ID = 124';
  ccDepositos := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Tarjeta de credito
  dmIBData.TPreferencias.Filter := 'ID = 26';
  ccTCredito := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Condicion Comercial Tarjeta de debito
  dmIBData.TPreferencias.Filter := 'ID = 128';
  ccTDebito := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  //Activar Monedero electronico
  dmIBData.TPreferencias.Filter := 'ID = 111';
  ACTIVARME := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //Moneda base
   dmIBData.TPreferencias.Filter  := 'ID = 3';
   dmIBData.TFiltroMonedas.Filter := 'ID = '+dmIBData.TPreferencias.FieldByName('VALOR').AsString;
   laMoneda1.Caption := dmIBData.TFiltroMonedas.FieldByName('CLAVE').AsString;
   laMoneda2.Caption := dmIBData.TFiltroMonedas.FieldByName('CLAVE').AsString;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotones;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.ibGuardarPartidaClick(
  Sender: TObject);
var
   respuesta : boolean;
   fraccion  : Real;
   entero    : Real;
   grabar    : boolean;
begin
  inherited;
  grabar := true;
  if cbBancos.Visible then
  begin
     if cbBancos.Text = '' then
     begin
        grabar := false;
        ShowMessage('Informacion Incompleta. Falta capturar el BANCO');

     end;
  end;

  {
  if edFecha.Visible and grabar then
  begin
     try
       StrToDateTime(edFecha.Text);
     except
       on E: EConvertError do
       begin
          grabar := false;
          ShowMessage('Conversion. Fecha no valida');
       end;
     end;
  end;
  }
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
     if (qyCComerciales.FieldByName('R_CC_AUTORIZACION').AsString = 'Si') and (StrToFloat(edMonto.Text) <> 0) then
     begin
        if reglas.dameUsuarioNivel < 3 then
        begin
           frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
           frmAutorizacion.ShowModal;
           respuesta := frmAutorizacion.dame_respuesta;
           frmAutorizacion.Free;
        end;
     end;

     if respuesta then
     begin
        qyActualizar.SQL.Clear;
        qyActualizar.SQL.Add('UPDATE CUENTAS_POR_COBRAR_REF_PAGOS');
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

        qyTotalCXCPagos.Close;
        qyTotalCXCPagos.ParamByName('P_CXC_PAGOS').AsInteger := ID;
        qyTotalCXCPagos.Open;
        qyTotalCXCPagos.Transaction.CommitRetaining;
        reglas.abrir_IBQuery_seek('R_ID',qyCComerciales.FieldByName('R_ID').AsInteger, qyCComerciales);

        edicion := not edicion;
        FijarBotones;

        dgFormaPago.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.ibModificarPartidaClick(
  Sender: TObject);
var
   monto : double;
begin
  inherited;
  edCComercial.Clear;
  cbBancos.Visible     := false;
  edFecha.Visible      := false;
  edReferencia.Visible := false;
  edFolio.Visible      := false;
  laBanco.Visible      := false;
  laFecha.Visible      := false;
  laReferencia.Visible := false;
  laFolio.Visible      := false;
  buCheques.Visible    := false;

  edCComercial.Text    := qyCComerciales.FieldByName('R_CC_NOMBRE').AsString;
  cbBancos.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  sbRBancos.Visible    := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  edFecha.Visible      := qyCComerciales.FieldByName('R_CC_FECHA').AsString = 'Si';
  laCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  deCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  edReferencia.Visible := qyCComerciales.FieldByName('R_CC_REFERENCIA').AsString = 'Si';
  edFolio.Visible      := qyCComerciales.FieldByName('R_CC_FOLIO').AsString = 'Si';
  buCheques.Visible    :=(qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccDepositos);

  laBanco.Visible      := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  laFecha.Visible      := qyCComerciales.FieldByName('R_CC_FECHA').AsString = 'Si';
  laReferencia.Visible := qyCComerciales.FieldByName('R_CC_REFERENCIA').AsString = 'Si';
  laFolio.Visible      := qyCComerciales.FieldByName('R_CC_FOLIO').AsString = 'Si';

  if edFecha.Visible then
  begin
     dmIBData.spFECHA_SERVIDOR.ExecProc;
     edFecha.Date := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDate;
  end;
  edicion := not edicion;
  fijarBotones;

  if qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccTCredito then
  begin
     spTAJETA_DE_CREDITO.ParamByName('P_CLIENTE').AsInteger := CLIENTE;
     spTAJETA_DE_CREDITO.ParamByName('P_ID_PAGO').AsInteger := ID;
     spTAJETA_DE_CREDITO.ExecProc;
     spTAJETA_DE_CREDITO.Transaction.CommitRetaining;
     monto := spTAJETA_DE_CREDITO.ParamByName('R_TOTAL').AsFloat;
  end
  else
     if qyCComerciales.FieldByName('R_CCOMERCIAL').AsInteger = ccTDebito then
     begin
        spTAJETA_DE_DEBITO.ParamByName('P_ID').AsInteger := ID;
        spTAJETA_DE_DEBITO.ExecProc;
        spTAJETA_DE_DEBITO.Transaction.CommitRetaining;
        monto := spTAJETA_DE_DEBITO.ParamByName('R_TOTAL').AsFloat;
     end
     else
        monto := dsTotalCXCPagos.DataSet.FieldByName('R_SALDO').AsFloat;

  edMonto.Text := FloatToStr(monto);

  if edFecha.Visible then
     edFecha.SetFocus
  else
  if cbBancos.Visible then
     cbBancos.SetFocus
  else
     edMonto.SetFocus;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
{  dsFuente.DataSet.Cancel;}

  edicion := not edicion;
  fijarBotones;

  dgFormaPago.SetFocus;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.dsTotalCXCPagosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsTotalCXCPagos.DataSet <> nil then
  begin
     ibImprimir.Enabled := (TDataSource(sender).DataSet.State = dsBrowse) and (dsTotalCXCPagos.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);
     miImprimir.Enabled := ibImprimir.Enabled;
  end;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.paCapturaEnter(
  Sender: TObject);
begin
  inherited;
  if cbBancos.Visible then
  begin
     reglas.refresh_IBQuery(qyBancos);
     cbBancos.KeyValue := dsBancos.DataSet.FieldByName('ID').AsInteger;
  end;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.ibImprimirClick(
  Sender: TObject);
var
   id_chq : integer;
begin
  inherited;
  spCASOS_PAGOS.ParamByName('P_CXC_PAGO').AsInteger := ID;
  spCASOS_PAGOS.ParamByName('P_DEPOSITO').AsInteger := DEPOSITO;
  spCASOS_PAGOS.ExecProc;
  spCASOS_PAGOS.Transaction.CommitRetaining;

  {***************************
   Afectacion: Monedero Electronico
   Fecha:02/03/2005
  ***************************}
  if ACTIVARME then
  begin
     //Normal
     spCAJA_NEGRA_ME_2.ParamByName('P_ID').AsInteger := ID;
     spCAJA_NEGRA_ME_2.ExecProc;
     spCAJA_NEGRA_ME_2.Transaction.CommitRetaining;
     if spCAJA_NEGRA_ME_2.ParamByName('R_PUNTOS').AsInteger > 0 then
     begin
        frmInfo := TfrmInfo.Create(Application);
        frmInfo.edNombre.Text       := CLIENTEN;
        frmInfo.edTelefono.Text     := TELEFONO;
        frmInfo.edNombre.Color      := frmInfo.edPuntos.Color;
        frmInfo.edNombre.ReadOnly   := true;
        frmInfo.edTelefono.Color    := frmInfo.edPuntos.Color;
        frmInfo.edTelefono.ReadOnly := true;
        frmInfo.edPuntos.Text       := spCAJA_NEGRA_ME_2.ParamByName('R_PUNTOS').AsString;
        frmInfo.ShowModal;
        //Afectacion
        spP_ME_AFECTAR.ParamByName('P_TARJETA').AsString          := frmInfo.edTarjeta.Text;
        spP_ME_AFECTAR.ParamByName('P_SUJETO').AsInteger          := CLIENTE;
        spP_ME_AFECTAR.ParamByName('P_SUJETO_TIPO').AsString      := 'SUJETOS_CLIENTES';
        spP_ME_AFECTAR.ParamByName('P_NOMBRE').AsString           := frmInfo.edNombre.Text;
        spP_ME_AFECTAR.ParamByName('P_TELEFONO').AsString         := frmInfo.edTelefono.Text;
        spP_ME_AFECTAR.ParamByName('P_PUNTOS').AsInteger          := spCAJA_NEGRA_ME_2.ParamByName('R_PUNTOS').AsInteger;
        spP_ME_AFECTAR.ParamByName('P_CONCEPTO').AsString         := '*CUENTA EN CERO';
        spP_ME_AFECTAR.ParamByName('P_TABLA_REFERENCIA').AsString := 'CUENTAS_POR_COBRAR_PAGOS';
        spP_ME_AFECTAR.ParamByName('P_ID_REFERENCIA').AsInteger   := ID;
        spP_ME_AFECTAR.ExecProc;
        spP_ME_AFECTAR.Transaction.CommitRetaining;
        //End Afectacion
        frmInfo.Free;
        frmInfo := nil;
     end;
  end;
  {***************************}

  //Proceso de afectacion de cheques recibidos, si es que existen
  id_chq := ID;
  if spCASOS_PAGOS.ParamByName('R_IMPRIMIR_ORIGINAL').AsString = 'No' then//<---Me indica si el folio original existe
     id_chq := spCASOS_PAGOS.ParamByName('R_CXC_PAGO_PRIORIDAD').AsInteger;
  spP_CXC_CHEQUES_AFECTAR.ParamByName('P_ID').AsInteger := id_chq;
  spP_CXC_CHEQUES_AFECTAR.ExecProc;
  spP_CXC_CHEQUES_AFECTAR.Transaction.CommitRetaining;

  //Impresion CXC Pagos
  try
     dmIBData.TPreferencias.Filter := 'ID = 27';
     if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger = 1 then
     begin//PRN_0007
        if spCASOS_PAGOS.ParamByName('R_IMPRIMIR_ORIGINAL').AsString = 'Si' then
        begin
           frmPRN_0007 := TfrmPRN_0007.Crear(Application, ID, spCASOS_PAGOS.ParamByName('R_TOTAL_ORIGINAL').AsFloat);
           frmPRN_0007.imprimir;
           frmPRN_0007.Free;
        end;

        if spCASOS_PAGOS.ParamByName('R_CXC_PAGO_PRIORIDAD').AsInteger <> 0 then
        begin
           frmPRN_0007 := TfrmPRN_0007.Crear(Application, spCASOS_PAGOS.ParamByName('R_CXC_PAGO_PRIORIDAD').AsInteger, spCASOS_PAGOS.ParamByName('R_TOTAL_PRIORIDAD').AsFloat);
           frmPRN_0007.imprimir;
           frmPRN_0007.Free;
        end;
     end;
  finally
     ModalResult := mrOk;
  end;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.miModificarClick(
  Sender: TObject);
begin
  inherited;
  ibModificarPartida.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.miGuardarClick(
  Sender: TObject);
begin
  inherited;
  ibGuardarPartida.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.miCancelarClick(
  Sender: TObject);
begin
  inherited;
  ibCancelarPartida.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.miImprimirClick(
  Sender: TObject);
begin
  inherited;
  ibImprimir.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.Salir1Click(Sender: TObject);
begin
  inherited;
  ibSalir.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.dgFormaPagoDblClick(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.buAnteriorClick(
  Sender: TObject);
begin
  inherited;
  dgFormaPago.DataSource.DataSet.Prior;
end;

procedure TfrmCapturar_Pagos_formas_de_pago.buInicioClick(Sender: TObject);
begin
  inherited;
  dgFormaPago.DataSource.DataSet.First;

end;

procedure TfrmCapturar_Pagos_formas_de_pago.buSiguienteClick(
  Sender: TObject);
begin
  inherited;
  dgFormaPago.DataSource.DataSet.Next;

end;

procedure TfrmCapturar_Pagos_formas_de_pago.buFinClick(Sender: TObject);
begin
  inherited;
  dgFormaPago.DataSource.DataSet.Last;

end;

procedure TfrmCapturar_Pagos_formas_de_pago.qyBancosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('NOMBRE').AsString <> '' then
     DataSet.FieldByName('nombre_corto').AsString := Copy(DataSet.FieldByName('NOMBRE').AsString,1,25)
  else
     DataSet.FieldByName('nombre_corto').AsString := '';
end;

procedure TfrmCapturar_Pagos_formas_de_pago.buChequesClick(Sender: TObject);
begin
  inherited;
  frmChequesR          := TfrmChequesR.Create(Application);
  frmChequesR.PAGO     := ID;
  frmChequesR.Cliente  := CLIENTE;
  frmChequesR.ClienteN := CLIENTEN;
  frmChequesR.ShowModal;
  frmChequesR.Free;
end;

end.

