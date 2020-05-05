unit capturar_notas_de_cargos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
   Menus,   Buttons, Grids, DBGrids, system.Variants;

type
  TfrmCapturar_notas_de_cargo = class(TfrmCapturarMDI)
    paLienzo2: TPanel;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    paCaptura: TPanel;
    Label8: TLabel;
    Label20: TLabel;
    Label11: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ceSubTotal: TDBEdit;
    beConcepto: TDBEdit;
    ceDescuentoPorc: TDBEdit;
    ceIVA: TDBEdit;
    ceIEPS: TDBEdit;
    ceImpuesto1: TDBEdit;
    ceImpuesto2: TDBEdit;
    dgPartidas: TDBGrid;
    TAlmacenes: TIBTable;
    TAlmacenesID: TIntegerField;
    TAlmacenesCLAVE: TIBStringField;
    TAlmacenesNOMBRE: TIBStringField;
    TAlmacenesCOMPRA: TIBStringField;
    TAlmacenesVENDE: TIBStringField;
    TAlmacenesTRANSFORMA: TIBStringField;
    TAlmacenesFECHA_ALTA: TDateTimeField;
    TAlmacenesRESPONSABLE: TIntegerField;
    TAlmacenesOBSERVACIONES: TBlobField;
    TAlmacenesSERIE_FACTURA: TIBStringField;
    TAlmacenesCONSECUTIVO: TIntegerField;
    TAlmacenesFECHA_ULT_INV: TDateTimeField;
    TAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    TMonedas: TIBTable;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    dsMonedas: TDataSource;
    spEstatus: TIBStoredProc;
    dsEstatusProcesosDetalle: TDataSource;
    TEstatusProcesosDetalle: TIBTable;
    TEstatusProcesosDetalleID: TIntegerField;
    TEstatusProcesosDetallePROCESO: TIntegerField;
    TEstatusProcesosDetalleESTATUS: TIBStringField;
    TEstatusProcesosDetalleAUTORIZACION: TIBStringField;
    TEstatusProcesosDetalleSTOREPROC: TIBStringField;
    dsEstatusProcesos: TDataSource;
    qyEstatusProcesos: TIBQuery;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    TDetalle: TIBTable;
    dsDetalle: TDataSource;
    spID2: TIBStoredProc;
    spDEL_PARTIDA_NOTA_DE_CARGO: TIBStoredProc;
    spTOTALES_NOTA_DE_CARGO: TIBStoredProc;
    spCALCULA_IVA: TIBStoredProc;
    spCALCULA_IEPS: TIBStoredProc;
    spCALCULA_IMPUESTO_1: TIBStoredProc;
    spCALCULA_IMPUESTO_2: TIBStoredProc;
    Label2: TLabel;
    deFechaAlta: TDBEdit;
    deClave: TDBEdit;
    Label7: TLabel;
    laReferencia: TLabel;
    beReferencia: TDBEdit;
    Label22: TLabel;
    leAlmacenes: TDBLookupComboBox;
    laNombre: TLabel;
    deNombre: TDBEdit;
    ceIVAPorc: TDBEdit;
    Label19: TLabel;
    ceIEPSPorc: TDBEdit;
    Label17: TLabel;
    ceImpuesto1Porc: TDBEdit;
    laImpuesto1Porc: TLabel;
    ceImpuesto2Porc: TDBEdit;
    laImpuesto2Porc: TLabel;
    Label5: TLabel;
    deObservaciones: TDBMemo;
    leMoneda: TDBLookupComboBox;
    Label12: TLabel;
    leEstatus: TDBLookupComboBox;
    Label18: TLabel;
    beAplicar: TEdit;
    laSaldo: TLabel;
    TCapturarID: TIntegerField;
    TCapturarTIPO: TIBStringField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarPROVEEDOR: TIntegerField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarEXTENSION: TIntegerField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarALMACEN: TIntegerField;
    TCapturarIVA_PORC: TFloatField;
    TCapturarIEPS_PORC: TFloatField;
    TCapturarIMPUESTO1_PORC: TFloatField;
    TCapturarIMPUESTO2_PORC: TFloatField;
    TCapturarSUBTOTAL: TFloatField;
    TCapturarIVA: TFloatField;
    TCapturarIEPS: TFloatField;
    TCapturarIMPUESTO1: TFloatField;
    TCapturarIMPUESTO2: TFloatField;
    TCapturarTOTAL: TFloatField;
    TCapturarMONEDA: TIntegerField;
    TCapturarUSUARIO: TIntegerField;
    TCapturarAUTORIZO: TIntegerField;
    TCapturarSERIE_NC: TIBStringField;
    TCapturarCONSECUTIVO: TIntegerField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    TCapturarNC: TIntegerField;
    TCapturarESTATUS: TIBStringField;
    meTipo: TDBComboBox;
    Label14: TLabel;
    deSaldo: TDBEdit;
    TCapturarnotacargo: TStringField;
    deFolio: TDBEdit;
    TCapturarextension_nombre: TStringField;
    TCapturarsaldo: TFloatField;
    TCapturarreferencia: TStringField;
    TCapturardescripcion_moneda: TStringField;
    TCapturaralmacen_clave: TStringField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_NOTA_DE_CARGO: TIntegerField;
    qyPartidasR_CONCEPTO: TIntegerField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_PORCENTAJE: TFloatField;
    qyPartidasR_AUTOMATICO: TIBStringField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_TOTAL: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    TDetalleID: TIntegerField;
    TDetalleNOTA_DE_CARGO: TIntegerField;
    TDetalleCONCEPTO: TIntegerField;
    TDetalleDESCRIPCION: TIBStringField;
    TDetallePORCENTAJE: TFloatField;
    TDetalleAUTOMATICO: TIBStringField;
    TDetalleSUBTOTAL: TFloatField;
    TDetalleIVA: TFloatField;
    TDetalleIEPS: TFloatField;
    TDetalleIMPUESTO1: TFloatField;
    TDetalleIMPUESTO2: TFloatField;
    TDetalleORIGINAL: TIBStringField;
    TDetalleESTATUS: TIBStringField;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    qyCalculaImpuestos: TIBQuery;
    qyCalculaImpuestosR_SUBTOTAL: TFloatField;
    qyCalculaImpuestosR_IVA: TFloatField;
    qyCalculaImpuestosR_IEPS: TFloatField;
    qyCalculaImpuestosR_IMPUESTO1: TFloatField;
    qyCalculaImpuestosR_IMPUESTO2: TFloatField;
    qyCalculaImpuestosR_TOTAL: TFloatField;
    cbAutomatico: TDBEdit;
    TCapturarNOMBRE: TIBStringField;
    MainMenu1: TMainMenu;
    buImpresion: TBitBtn;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    itemPreview: TMenuItem;
    TCapturarGEN_CXC: TIBStringField;
    cbGenCXC: TDBCheckBox;
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoClick(Sender: TObject);
    procedure deNombreButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure beReferenciaButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibModificarClick(Sender: TObject);
    procedure dsDetalleDataChange(Sender: TObject; Field: TField);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure dgPartidasColumn9DrawSummaryFooter(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; var AText: String;
      var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
      var ADone: Boolean);
    procedure beConceptoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ceDescuentoPorcChange(Sender: TObject);
    procedure leEstatusChange(Sender: TObject);
    procedure beAplicarButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure beReferenciaKeyPress(Sender: TObject; var Key: Char);
    procedure deNombreKeyPress(Sender: TObject; var Key: Char);
    procedure beConceptoKeyPress(Sender: TObject; var Key: Char);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure ceSubTotalChange(Sender: TObject);
    procedure cbAutomaticoChange(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
  private
    { Private declarations }
    awrActivarFA : boolean; //Activar Fecha de Alta
    
    procedure refresh_totales(p_id : integer);
  public
    { Public declarations }
  end;

var
  frmCapturar_notas_de_cargo: TfrmCapturar_notas_de_cargo;

implementation

uses IBModulo, IBData, reglas_de_negocios, explorar_notas_de_cargo,
  seleccionar_cliente, seleccionar_proveedor,
  seleccionar_cuentas_por_cobrar, seleccionar_cuentas_x_pagar,
  seleccionar_descuentos, autorizacion, PRN_0021_NCARGO_TXT,
  UfrmSeleccionarExtension, UfrmSeleccionarCXC, UfrmSeleccionarCXP,
  UfrmSeleccionarCliente_, UfrmSeleccionarProveedor_;

{$R *.DFM}

procedure TfrmCapturar_notas_de_cargo.refresh_totales(p_id : integer);
begin
  spTOTALES_NOTA_DE_CARGO.ParamByName('P_NOTA_DE_CARGO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  spTOTALES_NOTA_DE_CARGO.ExecProc;
  spTOTALES_NOTA_DE_CARGO.Transaction.CommitRetaining;
  reglas.abrir_IBTabla(TCapturar);
  if p_id = 0 then
     reglas.refresh_IBQuery(qyPartidas)
  else
     reglas.abrir_IBQuery_seek('R_ID',p_id,qyPartidas);
end;

procedure TfrmCapturar_notas_de_cargo.TCapturarCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('NOTACARGO').AsString := DataSet.FieldByName('SERIE_NC').AsString + DataSet.FieldByName('CONSECUTIVO').AsString;
  if DataSet.FieldByName('TIPO').AsString = 'CXC' then
  begin//cuentas x cobrar
     if dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsString <> '' then
     begin
        dmIBData.TFiltroCXC.Filter                          := 'ID = '+dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsString;
        dsFuente.DataSet.FieldByName('REFERENCIA').AsString := dmIBData.TFiltroCXC.FieldByName('REFERENCIA').AsString +', '+ dmIBData.TFiltroCXC.FieldByName('DOCUMENTO').AsString +'/'+ dmIBData.TFiltroCXC.FieldByName('NUMERO_DE_DOCUMENTOS').AsString;
        dsFuente.DataSet.FieldByName('SALDO').AsFloat       := dmIBData.TFiltroCXC.FieldByName('SALDO_ACTUAL').AsFloat;
     end
     else
        begin
           dsFuente.DataSet.FieldByName('REFERENCIA').AsString := '';
           dsFuente.DataSet.FieldByName('SALDO').AsFloat       := 0.00;
        end;

     if DataSet.FieldByName('EXTENSION').AsString <> '' then
     begin
        dmIBData.TFiltroClientesExtensiones.Filter       := 'ID = '+DataSet.FieldByName('EXTENSION').AsString;
        DataSet.FieldByName('EXTENSION_NOMBRE').AsString := dmIBData.TFiltroClientesExtensiones.FieldByName('NOMBRE').AsString;
     end
     else
        DataSet.FieldByName('EXTENSION_NOMBRE').AsString := '';
  end
  else//cuentas x pagar
     if DataSet.FieldByName('TIPO').AsString = 'CXP' then
     begin
        if dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsString <> '' then
        begin
           dmIBData.TFiltroCXP.Filter                          := 'ID = '+dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsString;
           dsFuente.DataSet.FieldByName('REFERENCIA').AsString := dmIBData.TFiltroCXP.FieldByName('REFERENCIA').AsString +', '+ dmIBData.TFiltroCXP.FieldByName('DOCUMENTO').AsString +'/'+ dmIBData.TFiltroCXP.FieldByName('NUMERO_DE_DOCUMENTOS').AsString;
           dsFuente.DataSet.FieldByName('SALDO').AsFloat       := dmIBData.TFiltroCXP.FieldByName('SALDO_ACTUAL').AsFloat;
        end
        else
           begin
              dsFuente.DataSet.FieldByName('REFERENCIA').AsString := '';
              dsFuente.DataSet.FieldByName('SALDO').AsFloat       := 0.00;
           end;
     end;
end;

procedure TfrmCapturar_notas_de_cargo.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroCXC);
  reglas.abrir_IBTabla(dmIBData.TFiltroCXP);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientesExtensiones);
  reglas.abrir_IBTabla(dmIBData.TFiltroProveedores);
  inherited;
  reglas.refresh_IBQuery(qyEstatusProcesos);
  reglas.abrir_IBTabla(TEstatusProcesosDetalle);
  reglas.refresh_IBQuery(qyPartidas);
  reglas.abrir_IBTabla(TDetalle);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);

  //Activar Fecha de Alta
  dmIBData.TPreferencias.Filter := 'ID = 338';
  awrActivarFA := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmCapturar_notas_de_cargo.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     if dsFuente.DataSet.FieldByName('TIPO').AsString = 'CXC' then
     begin
        laNombre.Caption     := 'Cliente (Enter)';
        laReferencia.Caption := 'Cuentas x Cobrar (Enter)';
     end
     else
        if dsFuente.DataSet.FieldByName('TIPO').AsString = 'CXP' then
        begin
           laNombre.Caption     := 'Proveedor (Enter)';
           laReferencia.Caption := 'Cuentas x Pagar (Enter)';
        end
        else
           begin
              laNombre.Caption     := 'Nombre';
              laReferencia.Caption := 'Referencia';
           end;
     deFechaAlta.Enabled         := (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar') and awrActivarFA;
     deNombre.Enabled            := (dsFuente.DataSet.FieldByName('ESTATUS').AsString <> 'Afectado');
     beReferencia.Enabled        := (dsFuente.DataSet.FieldByName('ESTATUS').AsString <> 'Afectado') and not(dsFuente.DataSet.FieldByName('GEN_CXC').AsString = 'Si');

     paLienzo2.Visible           :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(TDataSource(sender).DataSet.IsEmpty);
     leEstatus.Enabled           := TDataSource(sender).DataSet.State in [dsBrowse, dsEdit];
     beAplicar.Enabled           := TDataSource(sender).DataSet.State in [dsBrowse];
     ibEliminar.Enabled          := ibEliminar.Enabled and (TDataSource(sender).DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     //deNombre.Buttons[1].Visible := meTipo.Text = 'CXC';
{     case TDataSource(sender).DataSet.State of
        dsEdit   : beReferencia.Enabled := dsPartidas.DataSet.IsEmpty;
     else
        beReferencia.Enabled := true;
     end;}
  end;
end;

procedure TfrmCapturar_notas_de_cargo.ibNuevoClick(Sender: TObject);
begin
  inherited;
  //Moneda base
  dmIBData.TPreferencias.Filter := 'ID = 3';
  if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger <> 0 then
     dsFuente.DataSet.FieldByName('MONEDA').AsInteger := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  //Fecha Servidor
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime  := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  //I.V.A.
  dmIBData.TPreferencias.Filter := 'ID = 68';
  dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat       := dmIBData.TPreferencias.FieldByName('VALOR').AsFloat;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString       := 'Sin Afectar';
  dsFuente.DataSet.FieldByName('TIPO').AsString          := 'Sin Clasificar';
  dsFuente.DataSet.FieldByName('USUARIO').AsInteger      := reglas.dame_usuario;
  dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat      := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat := 0;
  dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat       := 0;
  dsFuente.DataSet.FieldByName('IVA').AsFloat            := 0;
  dsFuente.DataSet.FieldByName('IEPS').AsFloat           := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat      := 0;
  dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat      := 0;
  dsFuente.DataSet.FieldByName('TOTAL').AsFloat          := 0;
  dsFuente.DataSet.FieldByName('ALMACEN').AsInteger      := -3;
  meTipo.SetFocus;
end;

procedure TfrmCapturar_notas_de_cargo.deNombreButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           if meTipo.Text = 'CXC' then
           begin
              frmSeleccionarCliente_ := TfrmSeleccionarCliente_.Create(Application);
              frmSeleccionarCliente_.DATABASE    := dmIBModulo.ibSistema;
              frmSeleccionarCliente_.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
              frmSeleccionarCliente_.CLAVE   := deNombre.Text;
              if frmSeleccionarCliente_.abrirConsulta then
              begin
                 frmSeleccionarCliente_.ShowModal;
                 if frmSeleccionarCliente_.ACEPTAR then
                 begin
                    dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := frmSeleccionarCliente_.ID;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString   := frmSeleccionarCliente_.NOMBRE;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              end
              else
                 begin
                    dsFuente.DataSet.FieldByName('CLIENTE').AsInteger := frmSeleccionarCliente_.ID;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString   := frmSeleccionarCliente_.NOMBRE;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              frmSeleccionarCliente_.Free;
              frmSeleccionarCliente_ := nil;
              dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant := null;
              dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := null;
           end
           else
           if meTipo.Text = 'CXP' then
           begin
              frmSeleccionarProveedor_             := TfrmSeleccionarProveedor_.Create(Application);
              frmSeleccionarProveedor_.DATABASE    := dmIBModulo.ibSistema;
              frmSeleccionarProveedor_.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
              frmSeleccionarProveedor_.CLAVE       := deNombre.Text;
              if frmSeleccionarProveedor_.abrirConsulta then
              begin
                 frmSeleccionarProveedor_.ShowModal;
                 if frmSeleccionarProveedor_.ACEPTAR then
                 begin
                    dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger := frmSeleccionarProveedor_.ID;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString     := frmSeleccionarProveedor_.FACTURAR_A;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              end
              else
                 begin
                    dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger := frmSeleccionarProveedor_.ID;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString     := frmSeleccionarProveedor_.FACTURAR_A;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              frmSeleccionarProveedor_.Free;
              frmSeleccionarProveedor_ := nil;

              dsFuente.DataSet.FieldByName('CLIENTE').AsVariant   := null;
              dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := null;
           end;
        end;
    1 : begin
           frmSeleccionarExtension := TfrmSeleccionarExtension.Create(Application);
           frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarExtension.CLAVE       := deNombre.Text;
           if frmSeleccionarExtension.abrirConsulta then
           begin
              frmSeleccionarExtension.ShowModal;
              if frmSeleccionarExtension.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('NOMBRE').AsString     := frmSeleccionarExtension.NOMBRE;
                 //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('NOMBRE').AsString     := frmSeleccionarExtension.NOMBRE;
                 //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
              end;
           frmSeleccionarExtension.Free;
           frmSeleccionarExtension := nil;
           dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant := null;
        end;
    2 : begin
           dsFuente.DataSet.FieldByName('NOMBRE').AsString := '';
           //beReferencia.OnButtonClick(Sender, 1);
           if meTipo.Text = 'CXC' then
           begin
              dsFuente.DataSet.FieldByName('CLIENTE').AsVariant   := null;
              dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := null;
           end
           else
              if meTipo.Text = 'CXP' then
              begin
                 dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant   := null;
              end
              else
                 begin
                    dsFuente.DataSet.FieldByName('CLIENTE').AsVariant   := null;
                    dsFuente.DataSet.FieldByName('EXTENSION').AsVariant := null;
                    dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant := null;
                 end;
        end;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.beReferenciaButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           if meTipo.Text = 'CXC' then
           begin
              frmSeleccionarCXC := TfrmSeleccionarCXC.Create(Application);
              frmSeleccionarCXC.DATABASE    := dmIBModulo.ibSistema;
              frmSeleccionarCXC.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
              if dsFuente.DataSet.FieldByName('EXTENSION').AsString <> '' then
                 frmSeleccionarCXC.ID_EXTENSION := dsFuente.DataSet.FieldByName('EXTENSION').AsInteger
              else
                 frmSeleccionarCXC.ID_CLIENTE   := dsFuente.DataSet.FieldByName('CLIENTE').AsInteger;
              if frmSeleccionarCXC.abrirConsulta then
              begin
                 frmSeleccionarCXC.ShowModal;
                 if frmSeleccionarCXC.ACEPTAR then
                 begin
                    dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsInteger   := frmSeleccionarCXC.ID;
                    dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_POR_COBRAR';
                    dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarCXC.ID_CLIENTE;
                    dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarCXC.ID_EXTENSION;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString           := frmSeleccionarCXC.NOMBRE;
                    dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant       := null;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              end
              else
                 begin
                    dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsInteger   := frmSeleccionarCXC.ID;
                    dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_POR_COBRAR';
                    dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarCXC.ID_CLIENTE;
                    dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarCXC.ID_EXTENSION;
                    dsFuente.DataSet.FieldByName('NOMBRE').AsString           := frmSeleccionarCXC.NOMBRE;
                    dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant       := null;
                    //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                 end;
              frmSeleccionarCXC.Free;
              frmSeleccionarCXC := nil;
           end
           else
              if meTipo.Text = 'CXP' then
              begin
                 frmSeleccionarCXP := TfrmSeleccionarCXP.Create(Application);
                 frmSeleccionarCXP.DATABASE     := dmIBModulo.ibSistema;
                 frmSeleccionarCXP.TRANSACTION  := dmIBModulo.ibSistemaTransaccion;
                 frmSeleccionarCXP.ID_PROVEEDOR := dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger;
                 if frmSeleccionarCXP.abrirConsulta then
                 begin
                    frmSeleccionarCXP.ShowModal;
                    if frmSeleccionarCXP.ACEPTAR then
                    begin
                       dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsInteger   := frmSeleccionarCXP.ID;
                       dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_X_PAGAR';
                       dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger       := frmSeleccionarCXP.ID_PROVEEDOR;
                       dsFuente.DataSet.FieldByName('NOMBRE').AsString           := frmSeleccionarCXP.NOMBRE;
                       dsFuente.DataSet.FieldByName('CLIENTE').AsVariant         := NULL;
                       dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := NULL;
                       //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                    end;
                 end
                 else
                    begin
                       dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsInteger   := frmSeleccionarCXP.ID;
                       dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_X_PAGAR';
                       dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger       := frmSeleccionarCXP.ID_PROVEEDOR;
                       dsFuente.DataSet.FieldByName('NOMBRE').AsString           := frmSeleccionarCXP.NOMBRE;
                       dsFuente.DataSet.FieldByName('CLIENTE').AsVariant         := NULL;
                       dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := NULL;
                       //deNombre.SetSelection(Length(deNombre.Text),Length(deNombre.Text),false);
                    end;
                 frmSeleccionarCXP.Free;
                 frmSeleccionarCXP := nil;
              end
              else
                 begin
                    dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsVariant   := null;
                    dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := '';
                 end;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsVariant   := null;
           dsFuente.DataSet.FieldByName('TABLA_REFERENCIA').AsString := '';
        end;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.ibModificarClick(Sender: TObject);
begin
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  deClave.SetFocus;
end;

procedure TfrmCapturar_notas_de_cargo.dsDetalleDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     ibNuevaPartida.Enabled     :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibModificarPartida.Enabled :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibGuardarPartida.Enabled   :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibCancelarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ibEliminarPartida.Enabled  :=(TDataSource(sender).DataSet.State in [dsBrowse]) and not(dsPartidas.DataSet.IsEmpty) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     paCaptura.Visible          :=(TDataSource(sender).DataSet.State in [dsEdit, dsInsert]) and (dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar');
     ceSubTotal.Enabled         := not(cbAutomatico.Text = 'Si');
     ceIVA.Enabled              := not(cbAutomatico.Text = 'Si');
     ceIEPS.Enabled             := not(cbAutomatico.Text = 'Si');
     ceImpuesto1.Enabled        := not(cbAutomatico.Text = 'Si');
     ceImpuesto2.Enabled        := not(cbAutomatico.Text = 'Si');
  end;
end;

procedure TfrmCapturar_notas_de_cargo.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Insert;
  spID2.ExecProc;
  dsDetalle.DataSet.FieldByName('ID').AsInteger              := spID2.ParamByName('R_ID').AsInteger;
  dsDetalle.DataSet.FieldByName('NOTA_DE_CARGO').AsInteger   := dsFuente.DataSet.FieldByName('ID').AsInteger;
  if dsFuente.DataSet.FieldByName('ID_REFERENCIA').AsString <> '' then
     dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString    := 'Si'
  else
     dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString    := 'No';
  dsDetalle.DataSet.FieldByName('ORIGINAL').AsString         := 'Si';
  dsDetalle.DataSet.FieldByName('PORCENTAJE').AsFloat        := 0;
  dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat          := 0;
  dsDetalle.DataSet.FieldByName('IVA').AsFloat               := 0;
  dsDetalle.DataSet.FieldByName('IEPS').AsFloat              := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat         := 0;
  dsDetalle.DataSet.FieldByName('ESTATUS').AsString          := 'Sin Afectar';
  beConcepto.SetFocus;
end;

procedure TfrmCapturar_notas_de_cargo.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Edit;
  beConcepto.SetFocus;
end;

procedure TfrmCapturar_notas_de_cargo.ibGuardarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Post;
  TDetalle.Transaction.CommitRetaining;
  refresh_totales(TDetalle.FieldByName('ID').AsInteger);
end;

procedure TfrmCapturar_notas_de_cargo.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Cancel;
end;

procedure TfrmCapturar_notas_de_cargo.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('¿ Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
    spDEL_PARTIDA_NOTA_DE_CARGO.ParamByName('P_ID').AsInteger := qyPartidas.FieldByName('R_ID').AsInteger;
    spDEL_PARTIDA_NOTA_DE_CARGO.ExecProc;
    spDEL_PARTIDA_NOTA_DE_CARGO.Transaction.CommitRetaining;
    refresh_totales(0);
  end;
end;

procedure TfrmCapturar_notas_de_cargo.dgPartidasColumn9DrawSummaryFooter(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; var AText: String;
  var AAlignment: TAlignment; AFont: TFont; var AColor: TColor;
  var ADone: Boolean);
begin
  inherited;
  AText := FormatFloat('$ ###,###,###,##0.00',dsFuente.DataSet.FieldByName('TOTAL').AsFloat);
end;

procedure TfrmCapturar_notas_de_cargo.beConceptoButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   pntX : TPoint;
   pntY : TPoint;
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           pntX   := paLienzo.ClientToScreen(Point(0,0));
           pntY   := dgPartidas.ClientToScreen(Point(0,0));
           pntY.y := pntY.y - pntX.y;
           pntY.x := paLienzo.Width;
           frmSeleccionar_descuentos                   := TfrmSeleccionar_descuentos.CrearA(Application, pntX, pntY, 3);
           frmSeleccionar_descuentos.dsDestino.DataSet := TDetalle;
           frmSeleccionar_descuentos.ShowModal;
           frmSeleccionar_descuentos.Free;
           ceDescuentoPorc.OnChange(Sender);
           if ceDescuentoPorc.Enabled then
              ceDescuentoPorc.SetFocus;
        end;
    1 : begin
           dsDetalle.DataSet.FieldByName('CONCEPTO').AsVariant   := null;
           dsDetalle.DataSet.FieldByName('DESCRIPCION').AsString := '';
           dsDetalle.DataSet.FieldByName('PORCENTAJE').AsFloat   := 0.00;
        end;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.ceDescuentoPorcChange(
  Sender: TObject);
begin
  inherited;
  if (dsDetalle.DataSet.State in [dsInsert, dsEdit]) and (dsDetalle.DataSet.FieldByName('AUTOMATICO').AsString = 'Si') then
  begin
     qyCalculaImpuestos.Close;
     qyCalculaImpuestos.ParamByName('P_ID').AsInteger       := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyCalculaImpuestos.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(ceDescuentoPorc.Text);
     qyCalculaImpuestos.Open;

     dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat  := qyCalculaImpuestos.FieldByName('R_SUBTOTAL').AsFloat;
     dsDetalle.DataSet.FieldByName('IVA').AsFloat       := qyCalculaImpuestos.FieldByName('R_IVA').AsFloat;
     dsDetalle.DataSet.FieldByName('IEPS').AsFloat      := qyCalculaImpuestos.FieldByName('R_IEPS').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat := qyCalculaImpuestos.FieldByName('R_IMPUESTO1').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat := qyCalculaImpuestos.FieldByName('R_IMPUESTO2').AsFloat;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.leEstatusChange(Sender: TObject);
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

procedure TfrmCapturar_notas_de_cargo.beAplicarButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
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
     reglas.abrir_IBTabla(dmIBData.TFiltroCXC);
     reglas.abrir_IBTabla(dmIBData.TFiltroCXP);
     reglas.abrir_IBTabla(TCapturar);
  end;
end;

procedure TfrmCapturar_notas_de_cargo.beReferenciaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     beReferenciaButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_cargo.deNombreKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     deNombreButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_cargo.beConceptoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     beConceptoButtonClick(Sender, 0);
end;

procedure TfrmCapturar_notas_de_cargo.NuevaPartida1Click(Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_notas_de_cargo.ModificarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_notas_de_cargo.GuardarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_notas_de_cargo.CancelarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_notas_de_cargo.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_notas_de_cargo.ceSubTotalChange(Sender: TObject);
var
 lSubtotal : double;
begin
  inherited;
  if not(cbAutomatico.Text = 'Si') and (dsDetalle.DataSet.State in [dsEdit, dsInsert]) then
  begin
     lSubtotal := StrToFloat(ceSubTotal.Text);
     spCALCULA_IVA.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
     spCALCULA_IVA.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
     spCALCULA_IVA.ExecProc;

     spCALCULA_IEPS.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
     spCALCULA_IEPS.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
     spCALCULA_IEPS.ExecProc;

     spCALCULA_IMPUESTO_1.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
     spCALCULA_IMPUESTO_1.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
     spCALCULA_IMPUESTO_1.ExecProc;

     spCALCULA_IMPUESTO_2.ParamByName('P_SUBTOTAL').AsFloat   := lSubtotal;
     spCALCULA_IMPUESTO_2.ParamByName('P_PORCENTAJE').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
     spCALCULA_IMPUESTO_2.ExecProc;

     dsDetalle.DataSet.FieldByName('IVA').AsFloat       := spCALCULA_IVA.ParamByName('R_IVA').AsFloat;
     dsDetalle.DataSet.FieldByName('IEPS').AsFloat      := spCALCULA_IEPS.ParamByName('R_IEPS').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat := spCALCULA_IMPUESTO_1.ParamByName('R_IMPUESTO_1').AsFloat;
     dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat := spCALCULA_IMPUESTO_2.ParamByName('R_IMPUESTO_2').AsFloat;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.cbAutomaticoChange(Sender: TObject);
begin
  inherited;
  if dsDetalle.DataSet.State in [dsEdit, dsInsert] then
  begin
     ceDescuentoPorc.Enabled := cbAutomatico.Text = 'Si';
     ceSubTotal.Enabled      := not(cbAutomatico.Text = 'Si');
     ceIVA.Enabled           := not(cbAutomatico.Text = 'Si');
     ceIEPS.Enabled          := not(cbAutomatico.Text = 'Si');
     ceImpuesto1.Enabled     := not(cbAutomatico.Text = 'Si');
     ceImpuesto2.Enabled     := not(cbAutomatico.Text = 'Si');

     if not(ceDescuentoPorc.Enabled) then
     begin
        dsDetalle.DataSet.FieldByName('PORCENTAJE').AsFloat := 0.00;
        dsDetalle.DataSet.FieldByName('SUBTOTAL').AsFloat   := 0.00;
        dsDetalle.DataSet.FieldByName('IVA').AsFloat        := 0.00;
        dsDetalle.DataSet.FieldByName('IEPS').AsFloat       := 0.00;
        dsDetalle.DataSet.FieldByName('IMPUESTO1').AsFloat  := 0.00;
        dsDetalle.DataSet.FieldByName('IMPUESTO2').AsFloat  := 0.00;
        ceSubTotal.SetFocus;
     end
     else
        ceDescuentoPorc.SetFocus;
  end;
end;

procedure TfrmCapturar_notas_de_cargo.ibGuardarClick(Sender: TObject);
begin
  inherited;
  if dsFuente.DataSet.FieldByName('ALMACEN').AsInteger = -3 then
  begin
    ShowMessage('Falta Informacion. No selecciono algun almacen');
  end
end;

procedure TfrmCapturar_notas_de_cargo.itemImprimirClick(Sender: TObject);
begin
  inherited;
  frmPRN_0021_TXT := TfrmPRN_0021_TXT.CrearA(Application, dsFuente.DataSet.FieldByName('ID').AsInteger);
  try
     frmPRN_0021_TXT.imprimir;
  finally
     frmPRN_0021_TXT.Free;
  end;

  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_notas_de_cargo.ibImprimirClick(Sender: TObject);
begin
  inherited;
  itemImprimir.Click;
end;

procedure TfrmCapturar_notas_de_cargo.itemPreviewClick(Sender: TObject);
begin
  inherited;
  frmPRN_0021_TXT := TfrmPRN_0021_TXT.CrearA(Application, dsFuente.DataSet.FieldByName('ID').AsInteger);
  try
     frmPRN_0021_TXT.preview;
  finally
     frmPRN_0021_TXT.Free;
  end;
end;

end.
