unit capturar_cxp_pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  hijo, Db, IBX.IBCustomDataSet, IBX.IBQuery,   DBCtrls,
  StdCtrls, Mask,  jpeg,  ExtCtrls,

     IBX.IBTable, Menus, IBX.IBStoredProc,
  Buttons,  ComCtrls, Grids, DBGrids;

type
  TfrmCapturar_CXP_FormasDePago = class(TfrmHijo)
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    paCaptura: TPanel;
    paContenedorTotales: TPanel;
    paTotales: TPanel;
    Label7: TLabel;
    dtSaldoXAplicar: TDBEdit;
    Label8: TLabel;
    dtTotal: TDBEdit;
    dgFormaPago: TDBGrid;
    dsTotalCXPPagos: TDataSource;
    qyTotalCXPPagos: TIBQuery;
    qyTotalCXPPagosR_TOTAL: TFloatField;
    qyTotalCXPPagosR_SALDO: TFloatField;
    qyBancos: TIBQuery;
    dsBancos: TDataSource;
    spAFECTA_CXP_PAGOS: TIBStoredProc;
    pmFormas: TPopupMenu;
    miModificar: TMenuItem;
    miGuardar: TMenuItem;
    miCancelar: TMenuItem;
    miImprimir: TMenuItem;
    Salir1: TMenuItem;
    dsProveedor: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edMonto: TEdit;
    edFecha: TDateTimePicker;
    laFecha: TLabel;
    edReferencia: TEdit;
    laReferencia: TLabel;
    edFolio: TEdit;
    laFolio: TLabel;
    qyActualizar: TIBQuery;
    qyCComerciales: TIBQuery;
    qyBancosID: TIntegerField;
    qyBancosCLAVE: TIBStringField;
    qyBancosNOMBRE: TIBStringField;
    qyBancosRAZON_SOCIAL: TIBStringField;
    qyBancosCUENTA: TIBStringField;
    qyBancosSUCURSAL: TIBStringField;
    qyBancosnombre_corto: TStringField;
    edCComercial: TEdit;
    laBanco: TLabel;
    sbRBancos: TSpeedButton;
    deCuenta: TDBEdit;
    laCuenta: TLabel;
    laAlmacen: TLabel;
    edAlmacen: TEdit;
    cbBancos: TDBComboBox;
    procedure TCXPRef_PagosCalcFields(DataSet: TDataSet);
    procedure dgFormaPagoDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibImprimirClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure dsFuenteStateChange(Sender: TObject);
    procedure dsTotalCXPPagosDataChange(Sender: TObject; Field: TField);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure miModificarClick(Sender: TObject);
    procedure miGuardarClick(Sender: TObject);
    procedure miCancelarClick(Sender: TObject);
    procedure miImprimirClick(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure paCapturaEnter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qyBancosCalcFields(DataSet: TDataSet);
    procedure sbRBancosClick(Sender: TObject);
  private
    { Private declarations }
    ccCheques        : integer;
    ccTarjetaCredito : integer;
    edicion          : boolean;
    awrID            : integer;
    awrPROVEEDOR     : integer;
    procedure fijarBotones;
    procedure setID(valor : integer);
    procedure setALMACEN(valor : string);
  public
    { Public declarations }
  published
     property ID         : integer read awrID write setID;
     property PROVEEDOR  : integer read awrPROVEEDOR write awrPROVEEDOR;
     property ALMACEN    : string write setALMACEN;
  end;

var
  frmCapturar_CXP_FormasDePago: TfrmCapturar_CXP_FormasDePago;

implementation

uses IBModulo, reglas_de_negocios, IBData, UfrmAutorizar, autorizacion;

{$R *.DFM}

procedure TfrmCapturar_CXP_FormasDePago.setALMACEN(valor : string);
begin
   edAlmacen.Text := valor;
end;

procedure TfrmCapturar_CXP_FormasDePago.setID(valor : integer);
begin
   awrID := valor;
   qyCComerciales.Close;
   qyCComerciales.ParamByName('P_PAGO').AsInteger := valor;
   qyCComerciales.Open;
   qyTotalCXPPagos.Close;
   qyTotalCXPPagos.ParamByName('P_CXP_PAGOS').AsInteger := valor;
   qyTotalCXPPagos.Open;
end;

procedure TfrmCapturar_CXP_FormasDePago.fijarBotones;
begin
  ibModificarPartida.Enabled := not edicion;
  ibGuardarPartida.Enabled   := edicion;
  ibCancelarPartida.Enabled  := edicion;
  ibImprimir.Enabled         := (not edicion) and (dsTotalCXPPagos.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);
  miModificar.Enabled        := ibModificarPartida.Enabled;
  miGuardar.Enabled          := ibGuardarPartida.Enabled;
  miCancelar.Enabled         := ibCancelarPartida.Enabled;
  miImprimir.Enabled         := ibImprimir.Enabled;
  paCaptura.Visible          := edicion;
  dgFormaPago.Enabled        := not edicion;
end;

procedure TfrmCapturar_CXP_FormasDePago.TCXPRef_PagosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('CC_PAGO').AsString <> '' then
  begin
     dmIBData.TFiltroCondicionesComerciales.Filter     := 'ID = '+DataSet.FieldByName('CC_PAGO').AsString;
     DataSet.FieldByName('NOMBRE_REFERENCIA').AsString := dmIBData.TFiltroCondicionesComerciales.FieldByName('NOMBRE').AsString;
     DataSet.FieldByName('REQ_AUTORIZACION').AsString  := dmIBData.TFiltroCondicionesComerciales.FieldByName('REQUIERE_AUTORIZACION').AsString;
  end
  else
     begin
        DataSet.FieldByName('NOMBRE_REFERENCIA').AsString := '';
        DataSet.FieldByName('REQ_AUTORIZACION').AsString  := 'No'
     end;
end;

procedure TfrmCapturar_CXP_FormasDePago.dgFormaPagoDblClick(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.FormCreate(Sender: TObject);
begin
  inherited;
  Self.WindowState := wsMaximized;
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.abrir_IBTabla(dmIBData.TFiltroCondicionesComerciales);
  //Condicion Comercial Cheques
  dmIBData.TPreferencias.Filter := 'ID = 25';
  ccCheques := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  //Condicion Comercial Tarjeta de credito
  dmIBData.TPreferencias.Filter := 'ID = 26';
  ccTarjetaCredito := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

procedure TfrmCapturar_CXP_FormasDePago.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsProveedor.DataSet := nil;
  inherited;
end;

procedure TfrmCapturar_CXP_FormasDePago.ibImprimirClick(Sender: TObject);
begin
  inherited;
  //Afectacion CXC Pagos
  spAFECTA_CXP_PAGOS.ParamByName('P_PAGO').AsInteger := ID;
  spAFECTA_CXP_PAGOS.ExecProc;
  spAFECTA_CXP_PAGOS.Transaction.CommitRetaining;
  ModalResult := mrOk;
end;

procedure TfrmCapturar_CXP_FormasDePago.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     paCaptura.Visible            :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
     ibModificarPartida.Enabled   :=(TDataSource(sender).DataSet.State = dsBrowse) and not(TDataSource(sender).DataSet.IsEmpty);
     ibGuardarPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
     ibCancelarPartida.Enabled    :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
     ibImprimir.Enabled           :=(TDataSource(sender).DataSet.State = dsBrowse) and (dsTotalCXPPagos.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);
     miModificar.Enabled          := ibModificarPartida.Enabled;
     miGuardar.Enabled            := ibGuardarPartida.Enabled;
     miCancelar.Enabled           := ibCancelarPartida.Enabled;
     miImprimir.Enabled           := ibImprimir.Enabled;
  end;
end;

procedure TfrmCapturar_CXP_FormasDePago.dsFuenteStateChange(
  Sender: TObject);
begin
  inherited;
{  if TDataSource(sender).DataSet <> nil then
  begin
     deReferencia.Visible          :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
     deAutorizacion.Visible       :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
//     deFolio.Visible              :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
     laContenido.Visible          :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
     laAutorizacion.Visible       :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
//     laFolio.Visible              :=(TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
     cbBancos.Visible             := TCXPRef_Pagos.FieldByName('CC_PAGO').AsInteger in [ccCheques,ccTarjetaCredito];
     laBanco.Visible              := TCXPRef_Pagos.FieldByName('CC_PAGO').AsInteger in [ccCheques,ccTarjetaCredito];
     TCXPRef_Pagos.FieldByName('BANCO').Required        := (TDataSource(sender).DataSet.State = dsEdit) and cbBancos.Visible;
     TCXPRef_Pagos.FieldByName('REFERENCIA').Required   := (TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
//     TCXPRef_Pagos.FieldByName('AUTORIZACION').Required := (TDataSource(sender).DataSet.State = dsEdit) and (TDataSource(sender).DataSet.FieldByName('REQ_AUTORIZACION').AsString = 'Si');
  end;}
end;

procedure TfrmCapturar_CXP_FormasDePago.dsTotalCXPPagosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsTotalCXPPagos.DataSet <> nil then
  begin
     ibImprimir.Enabled := (TDataSource(sender).DataSet.State = dsBrowse) and (dsTotalCXPPagos.DataSet.FieldByName('R_SALDO').AsFloat = 0.0);
     miImprimir.Enabled := ibImprimir.Enabled;
  end;
end;

procedure TfrmCapturar_CXP_FormasDePago.ibModificarPartidaClick(
  Sender: TObject);
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

  edCComercial.Text    := qyCComerciales.FieldByName('R_CC_NOMBRE').AsString;
  cbBancos.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  sbRBancos.Visible    := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  edFecha.Visible      := qyCComerciales.FieldByName('R_CC_FECHA').AsString = 'Si';
  laCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  deCuenta.Visible     := qyCComerciales.FieldByName('R_CC_BANCO').AsString = 'Si';
  edReferencia.Visible := qyCComerciales.FieldByName('R_CC_REFERENCIA').AsString = 'Si';
  edFolio.Visible      := qyCComerciales.FieldByName('R_CC_FOLIO').AsString = 'Si';

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
  edMonto.Text := dsTotalCXPPagos.DataSet.FieldByName('R_SALDO').AsString;

  if edFecha.Visible then
     edFecha.SetFocus
  else
  if cbBancos.Visible then
     cbBancos.SetFocus
  else
     edMonto.SetFocus;
end;

procedure TfrmCapturar_CXP_FormasDePago.ibGuardarPartidaClick(
  Sender: TObject);
var
   respuesta : boolean;
   fraccion  : Real;
   entero    : Real;
   grabar    : boolean;
   index     : integer;
   indexPos  : integer;
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

  if edFecha.Visible and grabar then
  begin
    {
     try
       StrToDateTime(edFecha.Date);
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
        qyActualizar.SQL.Add('UPDATE CUENTAS_X_PAGAR_REF_PAGOS');
        qyActualizar.SQL.Add('SET MONTO = :P_MONTO');
        if cbBancos.Visible then
           qyActualizar.SQL.Add(', BANCO = :P_BANCO');
        if edFecha.Visible then
           qyActualizar.SQL.Add(', FECHA = :P_FECHA');
        if edReferencia.Visible then
           qyActualizar.SQL.Add(', REFERENCIA = :P_REFERENCIA');
        if edFolio.Visible then
           qyActualizar.SQL.Add(', CONSECUTIVO_FOLIO = :P_FOLIO');
        qyActualizar.SQL.Add('WHERE ID = :P_ID');
        qyActualizar.ParamByName('P_MONTO').AsFloat := StrToFloat(edMonto.Text);
        //if cbBancos.Visible then
          // qyActualizar.ParamByName('P_BANCO').AsInteger := cbBancos.LookupKeyValue;
        if edFecha.Visible then
           qyActualizar.ParamByName('P_FECHA').AsDateTime := edFecha.Date;
        if edReferencia.Visible then
           qyActualizar.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
        if edFolio.Visible then
           qyActualizar.ParamByName('P_FOLIO').AsString := edFolio.Text;
        qyActualizar.ParamByName('P_ID').AsInteger := qyCComerciales.FieldByName('R_ID').AsInteger;
        qyActualizar.ExecSQL;
        qyActualizar.Transaction.CommitRetaining;

        qyTotalCXPPagos.Close;
        qyTotalCXPPagos.ParamByName('P_CXP_PAGOS').AsInteger := ID;
        qyTotalCXPPagos.Open;
        qyTotalCXPPagos.Transaction.CommitRetaining;

        //Busca la posicion del registro que se modifico
        //index    := dgFormaPago.TopIndex;
        indexPos := qyCComerciales.FieldByName('R_ID').AsInteger;
        reglas.refresh_IBQuery(qyCComerciales);
        dgFormaPago.DataSource.DataSet.First;
        
        while not(dgFormaPago.DataSource.DataSet.EOF) do
        begin
           if qyCComerciales.FieldByName('R_ID').AsInteger = IndexPos then
           begin
              break;
           end;
           dgFormaPago.DataSource.DataSet.Next;
        end;
        //dgFormaPago.TopIndex := index;
        //Termina Busca
        
        edicion := not edicion;
        FijarBotones;
        dgFormaPago.SetFocus;
     end;
  end;
end;

procedure TfrmCapturar_CXP_FormasDePago.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
{  dsFuente.DataSet.Cancel;
  dgFormaPago.SetFocus;}
  edicion := not edicion;
  fijarBotones;

  dgFormaPago.SetFocus;
end;

procedure TfrmCapturar_CXP_FormasDePago.miModificarClick(Sender: TObject);
begin
  inherited;
  ibModificarPartida.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.miGuardarClick(Sender: TObject);
begin
  inherited;
  ibGuardarPartida.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.miCancelarClick(Sender: TObject);
begin
  inherited;
  ibCancelarPartida.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.miImprimirClick(Sender: TObject);
begin
  inherited;
  ibImprimir.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.Salir1Click(Sender: TObject);
begin
  inherited;
  ibSalir.Click;
end;

procedure TfrmCapturar_CXP_FormasDePago.paCapturaEnter(Sender: TObject);
begin
  inherited;
  if cbBancos.Visible then
  begin
     reglas.refresh_IBQuery(qyBancos);
     //bBancos.LookupKeyValue := dsBancos.DataSet.FieldByName('ID').AsInteger;
  end;
end;

procedure TfrmCapturar_CXP_FormasDePago.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotones;
{  qyTotalCXPPagos.Close;
  qyTotalCXPPagos.ParamByName('P_CXP_PAGOS').AsInteger := idPago;
  qyTotalCXPPagos.Open;
  reglas.abrir_IBTabla(TCXPRef_Pagos);
  TCXPRef_Pagos.Filter := 'CXP_PAGOS = '+IntToStr(idPago);}
end;

procedure TfrmCapturar_CXP_FormasDePago.qyBancosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('NOMBRE').AsString <> '' then
     DataSet.FieldByName('nombre_corto').AsString := Copy(DataSet.FieldByName('NOMBRE').AsString,1,25)
  else
     DataSet.FieldByName('nombre_corto').AsString := '';
end;

procedure TfrmCapturar_CXP_FormasDePago.sbRBancosClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyBancos);
end;

end.
