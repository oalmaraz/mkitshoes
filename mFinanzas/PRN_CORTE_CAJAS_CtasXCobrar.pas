unit PRN_CORTE_CAJAS_CtasXCobrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, Db, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery,
    ComCtrls,   DBCtrls,
     Buttons, StdCtrls,  ExtCtrls, jpeg, System.ImageList, System.Variants;

type
  TfrmPRN_CORTE_CAJA_CtasXCobrar = class(TForm)
    paDatos: TPanel;
    pcCortes: TPageControl;
    tsNormal: TTabSheet;
    tsPrioridad: TTabSheet;
    tsAmbos: TTabSheet;
    tsResumen: TTabSheet;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_FACTURAR: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresaR_TELEFONO1: TIBStringField;
    qyEmpresaR_TELEFONO2: TIBStringField;
    qyEmpresaR_FAX: TIBStringField;
    qyEmpresaR_CALLE: TIBStringField;
    qyEmpresaR_ENTRE_CALLE: TIBStringField;
    qyEmpresaR_Y_CALLE: TIBStringField;
    qyEmpresaR_NUM_EXT: TIBStringField;
    qyEmpresaR_NUM_INT: TIBStringField;
    qyEmpresaR_LETRA: TIBStringField;
    qyEmpresaR_CP: TIBStringField;
    qyEmpresaR_COLONIA: TIBStringField;
    qyEmpresaR_CIUDAD: TIBStringField;
    TCajas: TIBTable;
    TCajasID: TIntegerField;
    TCajasNOMBRE: TIBStringField;
    TCajasALMACEN: TIntegerField;
    TCajasUSUARIO: TIntegerField;
    TCajasTIPO_DE_CAJA: TIBStringField;
    TCajasESTATUS: TIBStringField;
    TCajasMODULO_FUNCION: TIntegerField;
    dsCajas: TDataSource;
    qyAlmacenes: TIBQuery;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    Label3: TLabel;
    deFecha: TDateTimePicker;
    deAl: TDateTimePicker;
    Label4: TLabel;
    cbCajas: TDBLookupComboBox;
    Label2: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    sbBorrarAlmacen: TSpeedButton;
    sbBorrarCaja: TSpeedButton;
    ibAutorizar: TBitBtn;
    ilCortes: TImageList;
    sbEstatus: TPanel;
    ibSalir: TBitBtn;
    Label1: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    fcImager7: TImage;
    paCortes: TPanel;
    laCorteCajas: TBitBtn;
    laCorteCajasDetalle: TBitBtn;
    laCorteCajasCComerciales: TBitBtn;
    laCorteCajasCComercialesDetalle: TBitBtn;
    laCorteCajasFichaDeposito: TBitBtn;
    paResumen: TPanel;
    paAmbos: TPanel;
    paPrioridad: TPanel;
    laCorteCajasPrioridad: TBitBtn;
    laCorteCajasDetallePrioridad: TBitBtn;
    laCorteCajasCComercialesPrioridad: TBitBtn;
    laCorteCajasCComercialesDetallePrioridad: TBitBtn;
    laCorteCajasAmbos: TBitBtn;
    laCorteCajasDetalleAmbos: TBitBtn;
    laCorteCajasCComercialesAmbos: TBitBtn;
    laCorteCajasCComercialesDetalleAmbos: TBitBtn;
    laResumenPorAlmacen: TBitBtn;
    laDetalleResumenPorAlmacen: TBitBtn;
    imBack: TImage;
    procedure sbBorrarCajaClick(Sender: TObject);
    procedure sbBorrarAlmacenClick(Sender: TObject);
    procedure ibAutorizarClick(Sender: TObject);
    procedure laCorteCajasClick(Sender: TObject);
    procedure laCorteCajasDetalleClick(Sender: TObject);
    procedure laCorteCajasCComercialesClick(Sender: TObject);
    procedure laCorteCajasCComercialesDetalleClick(Sender: TObject);
    procedure laCorteCajasFichaDepositoClick(Sender: TObject);
    procedure laCorteCajasPrioridadClick(Sender: TObject);
    procedure laCorteCajasDetallePrioridadClick(Sender: TObject);
    procedure laCorteCajasCComercialesPrioridadClick(Sender: TObject);
    procedure laCorteCajasCComercialesDetallePrioridadClick(
      Sender: TObject);
    procedure laCorteCajasAmbosClick(Sender: TObject);
    procedure laCorteCajasDetalleAmbosClick(Sender: TObject);
    procedure laCorteCajasCComercialesAmbosClick(Sender: TObject);
    procedure laCorteCajasCComercialesDetalleAmbosClick(Sender: TObject);
    procedure laResumenPorAlmacenClick(Sender: TObject);
    procedure laDetalleResumenPorAlmacenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
    procedure setALMACEN(valor : integer);
    procedure setCAJA(valor : integer);
  public
    { Public declarations }
  published
    property CAJA    : integer write setCAJA;
    property ALMACEN : integer write setALMACEN;
  end;

var
  frmPRN_CORTE_CAJA_CtasXCobrar: TfrmPRN_CORTE_CAJA_CtasXCobrar;

implementation

uses autorizacion, IBData, IBModulo, RPT_FICHA_DEPOSITO,
  RPT_RESUMEN_ALMACENES, RPT_ENTRADAS_SALIDAS,
  reglas_de_negocios, RPT_CORTE_CAJAS_CXC,
  RPT_CORTE_CAJAS_CXC_DET, RPT_CORTE_CAJAS_CXC_CC, RPT_CORTE_CAJAS_CXC_CC_DET,
  UfrmAcceso;

{$R *.DFM}

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.setALMACEN(valor : integer);
begin
   if valor <> 0 then
      cbAlmacenes.KeyValue := valor
   else
      cbAlmacenes.KeyValue := Null;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.setCAJA(valor : integer);
begin
   if valor <> 0 then
      cbCajas.KeyValue := valor
   else
      cbCajas.KeyValue := Null;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.sbBorrarCajaClick(Sender: TObject);
begin
  cbCajas.KeyValue := Null;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.sbBorrarAlmacenClick(Sender: TObject);
begin
  cbAlmacenes.KeyValue := Null;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.ibAutorizarClick(Sender: TObject);
var
   ejecutar : boolean;
   awrNivel : integer;
begin
   ejecutar := true;
   awrNivel := 5;

   if (awrNivel > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel := awrNivel;
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

   if ejecutar then
   begin
      deFecha.Enabled          := true;
      deAl.Enabled             := true;
      cbCajas.Enabled          := true;
      cbAlmacenes.Enabled      := true;
      sbBorrarCaja.Enabled     := true;
      sbBorrarAlmacen.Enabled  := true;
      dmIBData.TPreferencias.Filter := 'ID = 97';
      tsPrioridad.TabVisible := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI');
      tsAmbos.TabVisible     := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI');
      tsResumen.TabVisible   := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI');
   end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasClick(Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC.Create(Application);
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasDetalleClick(Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_DET.Create(Application);
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end; 
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC.Create(Application);
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesDetalleClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC_DET.Create(Application);
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasFichaDepositoClick(
  Sender: TObject);
var
   reporte : TfrmRPT_FICHA_DEPOSITO;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_FICHA_DEPOSITO.Create(Application);
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasPrioridadClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC.Create(Application);
     reporte.opcion := 1;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasDetallePrioridadClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_DET.Create(Application);
     reporte.opcion := 4;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesPrioridadClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC.Create(Application);
     reporte.opcion := 7;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesDetallePrioridadClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC_DET.Create(Application);
     reporte.opcion := 10;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasAmbosClick(Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC.Create(Application);
     reporte.opcion := 2;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasDetalleAmbosClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_DET.Create(Application);
     reporte.opcion := 5;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesAmbosClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC.Create(Application);
     reporte.opcion := 8;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laCorteCajasCComercialesDetalleAmbosClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXC_CC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXC_CC_DET.Create(Application);
     reporte.opcion := 11;
     //reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
     //reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
     //reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     if cbCajas.KeyValue <> null then
     begin
        reporte.caja := cbCajas.KeyValue;
        //reporte.laCajas.Caption := cbCajas.Text;
     end;
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
        //reporte.laAlmacenes.Caption := cbAlmacenes.Text;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laResumenPorAlmacenClick(Sender: TObject);
var
   reporte : TfrmRPT_RESUMEN_ALMACENES;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_RESUMEN_ALMACENES.Create(Application);
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.laDetalleResumenPorAlmacenClick(
  Sender: TObject);
var
   reporte : TfrmRPT_ENTRADAS_SALIDAS;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_ENTRADAS_SALIDAS.Create(Application);
     if cbAlmacenes.KeyValue <> null then
     begin
        reporte.almacen := cbAlmacenes.KeyValue;
     end;
     reporte.fechaInicio := deFecha.Date;
     reporte.fechaFin    := deAl.Date;
     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.FormCreate(Sender: TObject);
begin
   deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
   deAl.Date    := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));

  reglas.refresh_IBQuery(qyEmpresa);
  reglas.abrir_IBTabla(TCajas);
  reglas.abrir_IBQuery(qyAlmacenes);
  //Activar Prioridad
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  dmIBData.TPreferencias.Filter := 'ID = 97';
  tsPrioridad.TabVisible  := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI') and (reglas.dameUsuarioNivel >= 5);
  tsAmbos.TabVisible      := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI') and (reglas.dameUsuarioNivel >= 5);
  tsResumen.TabVisible    := (UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI') and (reglas.dameUsuarioNivel >= 5);
  deFecha.Enabled         := (reglas.dameUsuarioNivel >= 5);
  deAl.Enabled            := (reglas.dameUsuarioNivel >= 5);
  cbCajas.Enabled         := (reglas.dameUsuarioNivel >= 5);
  cbAlmacenes.Enabled     := (reglas.dameUsuarioNivel >= 5);
  sbBorrarCaja.Enabled    := (reglas.dameUsuarioNivel >= 5);
  sbBorrarAlmacen.Enabled := (reglas.dameUsuarioNivel >= 5);
end;

procedure TfrmPRN_CORTE_CAJA_CtasXCobrar.ibSalirClick(Sender: TObject);
begin
   Close;
end;

end.
