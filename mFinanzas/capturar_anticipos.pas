unit capturar_anticipos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDIEstatus, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet, Buttons,
  Menus,  IBX.IBQuery, DBCtrls,
  StdCtrls, Mask, ExtCtrls, System.Variants;

type
  TfrmCapturar_anticipos = class(TfrmCapturarMDIEstatus)
    Label2: TLabel;
    deFolio: TDBEdit;
    Label7: TLabel;
    deFechaAlta: TDBEdit;
    deClave: TDBEdit;
    Label22: TLabel;
    Label5: TLabel;
    deObservaciones: TDBMemo;
    Label1: TLabel;
    beCXC: TDBEdit;
    Label3: TLabel;
    edCliente: TEdit;
    Label21: TLabel;
    beExtension: TDBEdit;
    Label19: TLabel;
    ceIVAPorc: TDBEdit;
    Label17: TLabel;
    ceIEPSPorc: TDBEdit;
    laImpuesto1Porc: TLabel;
    ceImpuesto1Porc: TDBEdit;
    laImpuesto2Porc: TLabel;
    ceImpuesto2Porc: TDBEdit;
    Label13: TLabel;
    deSaldo: TDBEdit;
    Label12: TLabel;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarEXTENSION: TIntegerField;
    TCapturarCUENTA_POR_COBRAR: TIntegerField;
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
    TCapturarCONSECUTIVO: TIntegerField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarTABLA_REFERENCIA: TIBStringField;
    TCapturarESTATUS: TIBStringField;
    edTotal: TDBEdit;
    edSubTotal: TDBEdit;
    edIVA: TDBEdit;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    edIEPS: TDBEdit;
    Label9: TLabel;
    edImpuesto1: TDBEdit;
    edImpuesto2: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    deCliente: TDBEdit;
    dsMonedas: TDataSource;
    TMonedas: TIBTable;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    dsAlmacenes: TDataSource;
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
    TCapturaralmacen_n: TStringField;
    TCapturarmoneda_c: TStringField;
    TCapturarcliente_n: TStringField;
    TCapturarextension_n: TStringField;
    TCapturarcxc_saldo: TFloatField;
    TCapturarcxc: TStringField;
    qyImpuestosT: TIBQuery;
    qyImpuestosST: TIBQuery;
    cbAlmacenes: TDBLookupComboBox;
    cbMonedas: TDBLookupComboBox;
    qyCuantos: TIBQuery;
    qyCuantosID: TIntegerField;
    ppImpresion: TPopupMenu;
    itemImprimir: TMenuItem;
    itemPreview: TMenuItem;
    buImpresion: TBitBtn;
    TCapturarRETENCION: TIBStringField;
    TCapturarRETENCION_IVA: TFloatField;
    cbRetencion: TDBEdit;
    laCtaContable: TLabel;
    cbBancos: TDBLookupComboBox;
    buActBancos: TBitBtn;
    buLimCtas: TBitBtn;
    deCuenta: TDBEdit;
    Label14: TLabel;
    qyBancos: TIBQuery;
    qyBancosID: TIntegerField;
    qyBancosCLAVE: TIBStringField;
    qyBancosNOMBRE: TIBStringField;
    qyBancosRAZON_SOCIAL: TIBStringField;
    qyBancosCUENTA: TIBStringField;
    qyBancosSUCURSAL: TIBStringField;
    qyBancosnombre_corto: TStringField;
    dsBancos: TDataSource;
    TCapturarBANCO: TIntegerField;
    TCapturarcuenta: TStringField;
    procedure edTotalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSubTotalChange(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure beExtensionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure beCXCButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure beExtensionKeyPress(Sender: TObject; var Key: Char);
    procedure beCXCKeyPress(Sender: TObject; var Key: Char);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ceIVAPorcChange(Sender: TObject);
    procedure ceIEPSPorcChange(Sender: TObject);
    procedure ceImpuesto1PorcChange(Sender: TObject);
    procedure ceImpuesto2PorcChange(Sender: TObject);
    procedure buAplicarClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure buActBancosClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
  private
    { Private declarations }
    capturar     : boolean;
    awrActivarFA : boolean; //Activar Fecha Alta
  public
    { Public declarations }
  end;

var
  frmCapturar_anticipos: TfrmCapturar_anticipos;

implementation

uses
  explorar_anticipos, IBModulo, IBData, UfrmSeleccionarCliente_,
  UfrmSeleccionarExtension, UfrmSeleccionarCXC, reglas_de_negocios,
  URPT_ANTICIPOS;

{$R *.DFM}

procedure TfrmCapturar_anticipos.edTotalChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosST.Close;
      qyImpuestosST.ParamByName('P_TOTAL').AsFloat          := StrToFloat(edTotal.Text);
      qyImpuestosST.ParamByName('P_IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      qyImpuestosST.ParamByName('P_IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      qyImpuestosST.ParamByName('P_IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      qyImpuestosST.ParamByName('P_IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      qyImpuestosST.Open;

      dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat  := qyImpuestosST.FieldByName('R_SUBTOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosST.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosST.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosST.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosST.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;
      
      if dsFuente.DataSet.FieldByName('RETENCION').AsString = 'Si' then
      begin
         dsFuente.DataSet.FieldByName('TOTAL').AsFloat         := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
         dsFuente.DataSet.FieldByName('RETENCION_IVA').AsFloat := dsFuente.DataSet.FieldByName('IVA').AsFloat;
         dsFuente.DataSet.FieldByName('IVA').AsFloat           := 0;
      end;
   end;
end;

procedure TfrmCapturar_anticipos.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientesExtensiones);
  reglas.abrir_IBTabla(dmIBData.TFiltroCXC);
  reglas.abrir_IBTabla(TAlmacenes);
  reglas.abrir_IBTabla(TMonedas);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.refresh_IBQuery(qyBancos);
  reglas.abrir_IBTabla(dmIBData.TFiltroBancos);
  inherited;
  capturar := true;
  //Activar Fecha Alta
  dmIBData.TPreferencias.Filter := 'ID = 339';
  awrActivarFA := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmCapturar_anticipos.edSubTotalChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosT.Close;
      qyImpuestosT.ParamByName('P_SUBTOTAL').AsFloat       := StrToFloat(edSubTotal.Text);
      qyImpuestosT.ParamByName('P_IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      qyImpuestosT.Open;

      dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := qyImpuestosT.FieldByName('R_TOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosT.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosT.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;

      if dsFuente.DataSet.FieldByName('RETENCION').AsString = 'Si' then
      begin
         dsFuente.DataSet.FieldByName('TOTAL').AsFloat         := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
         dsFuente.DataSet.FieldByName('RETENCION_IVA').AsFloat := dsFuente.DataSet.FieldByName('IVA').AsFloat;
         dsFuente.DataSet.FieldByName('IVA').AsFloat           := 0;
      end;
   end;
end;

procedure TfrmCapturar_anticipos.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('cxc').AsString      := '';
  DataSet.FieldByName('cxc_saldo').AsFloat := 0.00;
  if DataSet.FieldByName('CUENTA_POR_COBRAR').AsString <> '' then
  begin
     dmIBData.TFiltroCXC.Filter := 'ID = '+DataSet.FieldByName('CUENTA_POR_COBRAR').AsString;
     DataSet.FieldByName('cxc').AsString      := dmIBData.TFiltroCXC.FieldByName('REFERENCIA').AsString +', '+ dmIBData.TFiltroCXC.FieldByName('DOCUMENTO').AsString +'/'+ dmIBData.TFiltroCXC.FieldByName('NUMERO_DE_DOCUMENTOS').AsString;
     DataSet.FieldByName('cxc_saldo').AsFloat := dmIBData.TFiltroCXC.FieldByName('SALDO_ACTUAL').AsFloat;
  end;

  DataSet.FieldByName('cliente_n').AsString := '';
  if DataSet.FieldByName('CLIENTE').AsString <> '' then
  begin
     dmIBData.TFiltroClientes.Filter := 'ID = '+DataSet.FieldByName('CLIENTE').AsString;

     if dmIBData.TSujetosCliente.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
        DataSet.FieldByName('cliente_n').AsString := dmIBData.TSujetosCliente.FieldByName('RAZON_SOCIAL').AsString
     else
        DataSet.FieldByName('cliente_n').AsString := dmIBData.TSujetosCliente.FieldByName('NOMBRE').AsString;
  end;

  DataSet.FieldByName('extension_n').AsString := '';
  if DataSet.FieldByName('EXTENSION').AsString <> '' then
  begin
     dmIBData.TFiltroClientesExtensiones.Filter  := 'ID = '+DataSet.FieldByName('EXTENSION').AsString;
     DataSet.FieldByName('extension_n').AsString := dmIBData.TFiltroClientesExtensiones.FieldByName('NOMBRE').AsString;
  end;

  DataSet.FieldByName('cuenta').AsString := '';
  if DataSet.FieldByName('BANCO').AsString <> '' then
  begin
     dmIBData.TFiltroBancos.Filter := 'ID = '+DataSet.FieldByName('BANCO').AsString;
     DataSet.FieldByName('cuenta').AsString := dmIBData.TFiltroBancos.FieldByName('CUENTA').AsString;
  end;
end;

procedure TfrmCapturar_anticipos.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente_ := TfrmSeleccionarCliente_.Create(Application);
           frmSeleccionarCliente_.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente_.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente_.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente_.abrirConsulta then
           begin
              frmSeleccionarCliente_.ShowModal;
              if frmSeleccionarCliente_.ACEPTAR then
              begin
                 edCliente.Text                                                := frmSeleccionarCliente_.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente_.ID;
                 if frmSeleccionarCliente_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarCliente_.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                                                := frmSeleccionarCliente_.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente_.ID;
                 if frmSeleccionarCliente_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarCliente_.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente_.Free;
           frmSeleccionarCliente_ := nil;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant           := null;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
  end;
end;

procedure TfrmCapturar_anticipos.beExtensionButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarExtension             := TfrmSeleccionarExtension.Create(Application);
           frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarExtension.CLAVE       := '';
           if frmSeleccionarExtension.abrirConsulta then
           begin
              frmSeleccionarExtension.ShowModal;
              if frmSeleccionarExtension.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
              end;
           frmSeleccionarExtension.Free;
           frmSeleccionarExtension := nil;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant := null;
        end;
  end;
end;

procedure TfrmCapturar_anticipos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  //Moneda base
  dmIBData.TPreferencias.Filter := 'ID = 3';
  if dmIBData.TPreferencias.FieldByName('VALOR').AsInteger <> 0 then
     dsFuente.DataSet.FieldByName('MONEDA').AsInteger    := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
  //Fecha Servidor
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime  := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  //I.V.A.
  dmIBData.TPreferencias.Filter := 'ID = 68';
  dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat       := dmIBData.TPreferencias.FieldByName('VALOR').AsFloat;

  dsFuente.DataSet.FieldByName('ESTATUS').AsString       := 'Sin Afectar';
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
  dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger  := 0;
  dsFuente.DataSet.FieldByName('RETENCION').AsString     := 'No';
  deClave.SetFocus;
end;

procedure TfrmCapturar_anticipos.ibModificarClick(Sender: TObject);
begin
  inherited;
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  if deClave.Enabled then
     deClave.SetFocus;
end;

procedure TfrmCapturar_anticipos.ibGuardarClick(Sender: TObject);
var
   fraccion   : Real;
   entero     : Real;
   lDate :TDateTime;
begin
  if deFechaAlta.Focused then
     deClave.SetFocus;

  lDate :=  StrToDateTime(deFechaAlta.Text);
  entero   := Int(lDate);
  fraccion := Frac(lDate);
  if entero > 0 then
  begin
     if fraccion = 0 then
        dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := lDate + time;
  end;
  inherited;
end;

procedure TfrmCapturar_anticipos.beCXCButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCXC             := TfrmSeleccionarCXC.Create(Application);
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
                 dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsInteger := frmSeleccionarCXC.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger           := frmSeleccionarCXC.ID_CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant         := frmSeleccionarCXC.ID_EXTENSION;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsInteger   := frmSeleccionarCXC.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarCXC.ID_CLIENTE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarCXC.ID_EXTENSION;
              end;
           frmSeleccionarCXC.Free;
           frmSeleccionarCXC := nil;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CUENTA_POR_COBRAR').AsVariant  := null;
        end;
  end;
end;

procedure TfrmCapturar_anticipos.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;

  //if Key = #13 then
    // edCliente.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_anticipos.beExtensionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
    // beExtensionButtonClick(Sender, 0);
end;

procedure TfrmCapturar_anticipos.beCXCKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
    // beCXCButtonClick(Sender, 0);
end;

procedure TfrmCapturar_anticipos.dsFuenteDataChange(Sender: TObject;
  Field: TField);
var
   s_a : boolean;
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
     s_a                     := dsFuente.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar';
     deFechaAlta.Enabled     := s_a and awrActivarFA;
     deClave.Enabled         := s_a;
     cbAlmacenes.Enabled     := s_a;
     deObservaciones.Enabled := s_a;
     edCliente.Enabled       := s_a;
     beCXC.Enabled           := s_a;
     beExtension.Enabled     := s_a;
     ceIvaPorc.Enabled       := s_a;
     ceIEPSPorc.Enabled      := s_a;
     ceImpuesto1Porc.Enabled := s_a;
     ceImpuesto2Porc.Enabled := s_a;
     cbMonedas.Enabled       := s_a;
     edTotal.Enabled         := s_a;
     edSubTotal.Enabled      := s_a;
     edIVA.Enabled           := s_a;
     edIEPS.Enabled          := s_a;
     edImpuesto1.Enabled     := s_a;
     edImpuesto2.Enabled     := s_a;
     cbRetencion.Enabled     := s_a;

//     leEstatus.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse, dsEdit];
//     beAplicar.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse];
     ibEliminar.Enabled      := ibEliminar.Enabled and s_a;
     edCliente.Visible       :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and s_a;
     if edCliente.Visible then
        edCliente.Text := dsFuente.DataSet.FieldByName('cliente_n').AsString;
  end;
end;

procedure TfrmCapturar_anticipos.ceIVAPorcChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosT.Close;
      qyImpuestosT.ParamByName('P_SUBTOTAL').AsFloat       := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
      qyImpuestosT.ParamByName('P_IVA_PORC').AsFloat       := StrToFloat(ceIVAPorc.Text);
      qyImpuestosT.ParamByName('P_IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      qyImpuestosT.Open;

      dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := qyImpuestosT.FieldByName('R_TOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosT.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosT.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;
   end;
end;

procedure TfrmCapturar_anticipos.ceIEPSPorcChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosT.Close;
      qyImpuestosT.ParamByName('P_SUBTOTAL').AsFloat       := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
      qyImpuestosT.ParamByName('P_IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IEPS_PORC').AsFloat      := StrToFloat(ceIEPSPorc.Text);
      qyImpuestosT.ParamByName('P_IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      qyImpuestosT.Open;

      dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := qyImpuestosT.FieldByName('R_TOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosT.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosT.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;
   end;
end;

procedure TfrmCapturar_anticipos.ceImpuesto1PorcChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosT.Close;
      qyImpuestosT.ParamByName('P_SUBTOTAL').AsFloat       := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
      qyImpuestosT.ParamByName('P_IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO1_PORC').AsFloat := StrToFloat(ceImpuesto1Porc.Text);
      qyImpuestosT.ParamByName('P_IMPUESTO2_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO2_PORC').AsFloat;
      qyImpuestosT.Open;

      dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := qyImpuestosT.FieldByName('R_TOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosT.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosT.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;
   end;
end;

procedure TfrmCapturar_anticipos.ceImpuesto2PorcChange(Sender: TObject);
begin
  inherited;
   if capturar and (dsFuente.DataSet.State in [dsEdit, dsInsert]) then
   begin
      capturar := false;
      qyImpuestosT.Close;
      qyImpuestosT.ParamByName('P_SUBTOTAL').AsFloat       := dsFuente.DataSet.FieldByName('SUBTOTAL').AsFloat;
      qyImpuestosT.ParamByName('P_IVA_PORC').AsFloat       := dsFuente.DataSet.FieldByName('IVA_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IEPS_PORC').AsFloat      := dsFuente.DataSet.FieldByName('IEPS_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO1_PORC').AsFloat := dsFuente.DataSet.FieldByName('IMPUESTO1_PORC').AsFloat;
      qyImpuestosT.ParamByName('P_IMPUESTO2_PORC').AsFloat := StrToFloat(ceImpuesto2Porc.Text);
      qyImpuestosT.Open;

      dsFuente.DataSet.FieldByName('TOTAL').AsFloat     := qyImpuestosT.FieldByName('R_TOTAL').AsFloat;
      dsFuente.DataSet.FieldByName('IVA').AsFloat       := qyImpuestosT.FieldByName('R_IVA').AsFloat;
      dsFuente.DataSet.FieldByName('IEPS').AsFloat      := qyImpuestosT.FieldByName('R_IEPS').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO1').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO1').AsFloat;
      dsFuente.DataSet.FieldByName('IMPUESTO2').AsFloat := qyImpuestosT.FieldByName('R_IMPUESTO2').AsFloat;
      capturar := true;
   end;
end;

procedure TfrmCapturar_anticipos.buAplicarClick(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TCapturar);
  qyCuantos.Close;
  qyCuantos.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyCuantos.Open;
  if qyCuantos.FieldByName('ID').AsInteger <> 0  then
  begin
     ShowMessage( 'Se genero nuevo anticipo: ('+qyCuantos.FieldByName('ID').AsString+') por la diferencia en documento de cxc.');
  end;
end;

procedure TfrmCapturar_anticipos.itemImprimirClick(Sender: TObject);
begin
  inherited;
  try
    RPT_ANTICIPOS := TRPT_ANTICIPOS.Create(self);
    if RPT_ANTICIPOS.openReporte then
    begin
       RPT_ANTICIPOS.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
       RPT_ANTICIPOS.imprimir;
    end;
  finally
     RPT_ANTICIPOS.Free;
  end;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_anticipos.itemPreviewClick(Sender: TObject);
begin
  inherited;
   try
      RPT_ANTICIPOS    := TRPT_ANTICIPOS.Create(self);
      if RPT_ANTICIPOS.openReporte then
      begin
         RPT_ANTICIPOS.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
         RPT_ANTICIPOS.preview;
      end;
   finally
      RPT_ANTICIPOS.Free;
   end;
end;

procedure TfrmCapturar_anticipos.ibImprimirClick(Sender: TObject);
begin
  inherited;
  itemImprimir.Click;
end;

procedure TfrmCapturar_anticipos.buActBancosClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyBancos);
end;

procedure TfrmCapturar_anticipos.buLimCtasClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('BANCO').AsVariant := null;
end;

end.
