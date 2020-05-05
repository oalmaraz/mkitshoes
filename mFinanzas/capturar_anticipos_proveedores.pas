unit capturar_anticipos_proveedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDIEstatus, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, Buttons, Menus,   StdCtrls, DBCtrls,
  Mask, ExtCtrls, System.Variants;

type
  TfrmCapturar_anticipos_proveedores = class(TfrmCapturarMDIEstatus)
    Label2: TLabel;
    deFolio: TDBEdit;
    Label7: TLabel;
    deFechaAlta: TDBEdit;
    deClave: TDBEdit;
    Label22: TLabel;
    Label5: TLabel;
    deObservaciones: TDBMemo;
    Label1: TLabel;
    beCXP: TDBEdit;
    Label3: TLabel;
    edProveedor: TEdit;
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
    deProveedor: TDBEdit;
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
    TCapturarcxp: TStringField;
    TCapturarcxp_saldo: TFloatField;
    TCapturarproveedor_n: TStringField;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_CANCELACION: TDateTimeField;
    TCapturarPROVEEDOR: TIntegerField;
    TCapturarCUENTA_POR_PAGAR: TIntegerField;
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
    procedure edTotalChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edSubTotalChange(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure edProveedorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure beCXPButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure beCXPKeyPress(Sender: TObject; var Key: Char);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ceIVAPorcChange(Sender: TObject);
    procedure ceIEPSPorcChange(Sender: TObject);
    procedure ceImpuesto1PorcChange(Sender: TObject);
    procedure ceImpuesto2PorcChange(Sender: TObject);
    procedure buAplicarClick(Sender: TObject);
    procedure itemImprimirClick(Sender: TObject);
    procedure itemPreviewClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
  private
    { Private declarations }
    capturar     : boolean;
    awrActivarFA : boolean; //Activar Fecha Alta
  public
    { Public declarations }
  end;

var
  frmCapturar_anticipos_proveedores: TfrmCapturar_anticipos_proveedores;

implementation

uses
  IBModulo, IBData, reglas_de_negocios,
  UfrmSeleccionarProveedor_, UfrmSeleccionarCXP,
  explorar_anticipos_proveedores, URPT_ANTICIPOS_PROVEEDORES;

{$R *.DFM}

procedure TfrmCapturar_anticipos_proveedores.edTotalChange(Sender: TObject);
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
   end;
end;

procedure TfrmCapturar_anticipos_proveedores.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroProveedores);
  reglas.abrir_IBTabla(dmIBData.TFiltroCXP);
  reglas.abrir_IBTabla(TAlmacenes);
  reglas.abrir_IBTabla(TMonedas);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  inherited;
  capturar := true;
  //Activar Fecha Alta
  dmIBData.TPreferencias.Filter := 'ID = 340';
  awrActivarFA := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmCapturar_anticipos_proveedores.edSubTotalChange(Sender: TObject);
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
   end;
end;

procedure TfrmCapturar_anticipos_proveedores.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('cxp').AsString      := '';
  DataSet.FieldByName('cxp_saldo').AsFloat := 0.00;
  if DataSet.FieldByName('CUENTA_POR_PAGAR').AsString <> '' then
  begin
     dmIBData.TFiltroCXP.Filter               := 'ID = '+DataSet.FieldByName('CUENTA_POR_PAGAR').AsString;
     DataSet.FieldByName('cxp').AsString      := dmIBData.TFiltroCXP.FieldByName('REFERENCIA').AsString +', '+ dmIBData.TFiltroCXP.FieldByName('DOCUMENTO').AsString +'/'+ dmIBData.TFiltroCXP.FieldByName('NUMERO_DE_DOCUMENTOS').AsString;
     DataSet.FieldByName('cxp_saldo').AsFloat := dmIBData.TFiltroCXP.FieldByName('SALDO_ACTUAL').AsFloat;
  end;

  DataSet.FieldByName('proveedor_n').AsString := '';
  if DataSet.FieldByName('PROVEEDOR').AsString <> '' then
  begin
     dmIBData.TFiltroProveedores.Filter := 'ID = '+DataSet.FieldByName('PROVEEDOR').AsString;

     if dmIBData.TSujetosProveedor.FieldByName('FACTURAR_A').AsString = 'Razon Social' then
        DataSet.FieldByName('proveedor_n').AsString := dmIBData.TSujetosProveedor.FieldByName('RAZON_SOCIAL').AsString
     else
        DataSet.FieldByName('proveedor_n').AsString := dmIBData.TSujetosProveedor.FieldByName('NOMBRE').AsString;
  end;
end;

procedure TfrmCapturar_anticipos_proveedores.edProveedorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarProveedor_             := TfrmSeleccionarProveedor_.Create(Application);
           frmSeleccionarProveedor_.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarProveedor_.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarProveedor_.CLAVE       := edProveedor.Text;
           if frmSeleccionarProveedor_.abrirConsulta then
           begin
              frmSeleccionarProveedor_.ShowModal;
              if frmSeleccionarProveedor_.ACEPTAR then
              begin
                 edProveedor.Text                                  := frmSeleccionarProveedor_.NOMBRE;
                 dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger := frmSeleccionarProveedor_.ID;
                 if frmSeleccionarProveedor_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarProveedor_.MONEDA;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           end
           else
              begin
                 edProveedor.Text                                    := frmSeleccionarProveedor_.NOMBRE;
                 dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger   := frmSeleccionarProveedor_.ID;
                 if frmSeleccionarProveedor_.MONEDA <> 0 then
                    dsFuente.DataSet.FieldByName('MONEDA').AsInteger := frmSeleccionarProveedor_.MONEDA;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           frmSeleccionarProveedor_.Free;
           frmSeleccionarProveedor_ := nil;
           dsFuente.DataSet.FieldByName('CUENTA_POR_PAGAR').AsVariant := null;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('PROVEEDOR').AsVariant        := null;
           dsFuente.DataSet.FieldByName('CUENTA_POR_PAGAR').AsVariant := null;
        end;
  end;
end;

procedure TfrmCapturar_anticipos_proveedores.ibNuevoClick(Sender: TObject);
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
  deClave.SetFocus;
end;

procedure TfrmCapturar_anticipos_proveedores.ibModificarClick(Sender: TObject);
begin
  inherited;
  estatus := dsFuente.DataSet.FieldByName('ESTATUS').AsString;
  inherited;
  if deClave.Enabled then
     deClave.SetFocus;
end;

procedure TfrmCapturar_anticipos_proveedores.ibGuardarClick(Sender: TObject);
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

procedure TfrmCapturar_anticipos_proveedores.beCXPButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCXP              := TfrmSeleccionarCXP.Create(Application);
           frmSeleccionarCXP.DATABASE     := dmIBModulo.ibSistema;
           frmSeleccionarCXP.TRANSACTION  := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCXP.ID_PROVEEDOR := dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger;
           if frmSeleccionarCXP.abrirConsulta then
           begin
              frmSeleccionarCXP.ShowModal;
              if frmSeleccionarCXP.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CUENTA_POR_PAGAR').AsInteger := frmSeleccionarCXP.ID;
                 dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger         := frmSeleccionarCXP.ID_PROVEEDOR;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CUENTA_POR_PAGAR').AsInteger := frmSeleccionarCXP.ID;
                 dsFuente.DataSet.FieldByName('PROVEEDOR').AsInteger         := frmSeleccionarCXP.ID_PROVEEDOR;
              end;
           frmSeleccionarCXP.Free;
           frmSeleccionarCXP := nil;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CUENTA_POR_PAGAR').AsVariant  := null;
        end;
  end;
end;

procedure TfrmCapturar_anticipos_proveedores.edProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
  //   edProveedor.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_anticipos_proveedores.beCXPKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
  //   beCXPButtonClick(Sender, 0);
end;

procedure TfrmCapturar_anticipos_proveedores.dsFuenteDataChange(Sender: TObject;
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
     edProveedor.Enabled     := s_a;
     beCXP.Enabled           := s_a;
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

//     leEstatus.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse, dsEdit];
//     beAplicar.Enabled       := TDataSource(sender).DataSet.State in [dsBrowse];
     ibEliminar.Enabled      := ibEliminar.Enabled and s_a;
     edProveedor.Visible       :=(TDataSource(sender).DataSet.State in [dsInsert, dsEdit]) and s_a;
     if edProveedor.Visible then
        edProveedor.Text := dsFuente.DataSet.FieldByName('proveedor_n').AsString;
  end;
end;

procedure TfrmCapturar_anticipos_proveedores.ceIVAPorcChange(Sender: TObject);
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

procedure TfrmCapturar_anticipos_proveedores.ceIEPSPorcChange(Sender: TObject);
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

procedure TfrmCapturar_anticipos_proveedores.ceImpuesto1PorcChange(Sender: TObject);
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

procedure TfrmCapturar_anticipos_proveedores.ceImpuesto2PorcChange(Sender: TObject);
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

procedure TfrmCapturar_anticipos_proveedores.buAplicarClick(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TCapturar);
  qyCuantos.Close;
  qyCuantos.ParamByName('P_ID').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyCuantos.Open;
  if qyCuantos.FieldByName('ID').AsInteger <> 0  then
  begin
     ShowMessage('Se genero nuevo anticipo: ('+qyCuantos.FieldByName('ID').AsString+') por la diferencia en documento de cxc.');
  end;
end;

procedure TfrmCapturar_anticipos_proveedores.itemImprimirClick(Sender: TObject);
begin
  inherited;
  try
    RPT_ANTICIPOS_PROVEEDORES := TRPT_ANTICIPOS_PROVEEDORES.Create(self);
    if RPT_ANTICIPOS_PROVEEDORES.openReporte then
    begin
       RPT_ANTICIPOS_PROVEEDORES.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
       RPT_ANTICIPOS_PROVEEDORES.imprimir;
    end;
  finally
     RPT_ANTICIPOS_PROVEEDORES.Free;
  end;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_anticipos_proveedores.itemPreviewClick(Sender: TObject);
begin
  inherited;
   try
      RPT_ANTICIPOS_PROVEEDORES := TRPT_ANTICIPOS_PROVEEDORES.Create(self);
      if RPT_ANTICIPOS_PROVEEDORES.openReporte then
      begin
         RPT_ANTICIPOS_PROVEEDORES.ID := dsFuente.DataSet.FieldByName('ID').AsInteger;
         RPT_ANTICIPOS_PROVEEDORES.preview;
      end;
   finally
      RPT_ANTICIPOS_PROVEEDORES.Free;
   end;
end;

procedure TfrmCapturar_anticipos_proveedores.ibImprimirClick(Sender: TObject);
begin
  inherited;
  itemImprimir.Click;
end;

end.
