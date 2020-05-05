unit PRN_CORTE_CAJAS_CXP;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      StdCtrls, ExtCtrls, DBCtrls,
      Buttons,
  ComCtrls, Db, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery, ImgList, System.ImageList;

type
  TfrmPRN_CORTE_CAJAS_CXP = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    fcImager7: TImage;
    sbEstatus: TPanel;
    ibSalir: TBitBtn;
    ilCortes: TImageList;
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
    paDatos: TPanel;
    fcImager6: TImage;
    Label3: TLabel;
    Label4: TLabel;
    Label2: TLabel;
    sbBorrarAlmacen: TSpeedButton;
    sbBorrarCaja: TSpeedButton;
    Label1: TLabel;
    deFecha: TDateTimePicker;
    deAl: TDateTimePicker;
    cbCajas: TDBLookupComboBox;
    cbAlmacenes: TDBLookupComboBox;
    ibAutorizar: TBitBtn;
    pcCortes: TPageControl;
    tsNormal: TTabSheet;
    paCortes: TPanel;
    fcImager1: TImage;
    laCorteCajas: TBitBtn;
    laCorteCajasDetalle: TBitBtn;
    laCorteCajasCComerciales: TBitBtn;
    laCorteCajasCComercialesDetalle: TBitBtn;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure laCorteCajasClick(Sender: TObject);
    procedure ibAutorizarClick(Sender: TObject);
    procedure sbBorrarCajaClick(Sender: TObject);
    procedure laCorteCajasDetalleClick(Sender: TObject);
    procedure laCorteCajasCComercialesClick(Sender: TObject);
    procedure laCorteCajasCComercialesDetalleClick(Sender: TObject);
    procedure sbBorrarAlmacenClick(Sender: TObject);
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
  frmPRN_CORTE_CAJAS_CXP: TfrmPRN_CORTE_CAJAS_CXP;

implementation

uses
  reglas_de_negocios, RPT_CORTE_CAJAS_CXP, autorizacion, RPT_CORTE_CAJAS_CXP_CC,
  RPT_CORTE_CAJAS_CXP_CC_DET, RPT_CORTE_CAJAS_CXP_DET;

{$R *.DFM}

procedure TfrmPRN_CORTE_CAJAS_CXP.setALMACEN(valor : integer);
begin
   if valor <> 0 then
      cbAlmacenes.KeyValue := valor
   else
      cbAlmacenes.KeyValue := 0;
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.setCAJA(valor : integer);
begin
   if valor <> 0 then
      cbCajas.KeyValue := valor
   else
      cbCajas.KeyValue := 0;
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.FormCreate(Sender: TObject);
begin
   deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
   deAl.Date    := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));

  reglas.refresh_IBQuery(qyEmpresa);
  reglas.abrir_IBTabla(TCajas);
  reglas.abrir_IBQuery(qyAlmacenes);
  deFecha.Enabled         := (reglas.dameUsuarioNivel >= 5);
  deAl.Enabled            := (reglas.dameUsuarioNivel >= 5);
  cbCajas.Enabled         := (reglas.dameUsuarioNivel >= 5);
  cbAlmacenes.Enabled     := (reglas.dameUsuarioNivel >= 5);
  sbBorrarCaja.Enabled    := (reglas.dameUsuarioNivel >= 5);
  sbBorrarAlmacen.Enabled := (reglas.dameUsuarioNivel >= 5);
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.laCorteCajasClick(Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXP;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXP.Create(Application);
     if cbCajas.KeyValue <> 0 then
     begin
        reporte.caja := cbCajas.KeyValue;
     end;
     if cbAlmacenes.KeyValue <> 0 then
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

procedure TfrmPRN_CORTE_CAJAS_CXP.ibAutorizarClick(Sender: TObject);
var
   ejecutar  : boolean;
begin
  frmAutorizacion := TfrmAutorizacion.Crear(Application, 5);
  frmAutorizacion.ShowModal;
  ejecutar := frmAutorizacion.dame_respuesta;
  frmAutorizacion.Free;
  if ejecutar then
  begin
     deFecha.Enabled          := true;
     deAl.Enabled             := true;
     cbCajas.Enabled          := true;
     cbAlmacenes.Enabled      := true;
     sbBorrarCaja.Enabled     := true;
     sbBorrarAlmacen.Enabled  := true;
  end;
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.sbBorrarCajaClick(Sender: TObject);
begin
  cbCajas.KeyValue := 0;
end;

procedure TfrmPRN_CORTE_CAJAS_CXP.laCorteCajasDetalleClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXP_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXP_DET.Create(Application);
     if cbCajas.KeyValue <> 0 then
     begin
        reporte.caja := cbCajas.KeyValue;
     end;
     if cbAlmacenes.KeyValue <> 0 then
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

procedure TfrmPRN_CORTE_CAJAS_CXP.laCorteCajasCComercialesClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXP_CC;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXP_CC.Create(Application);
     if cbCajas.KeyValue <> 0 then
     begin
        reporte.caja := cbCajas.KeyValue;
     end;
     if cbAlmacenes.KeyValue <> 0 then
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

procedure TfrmPRN_CORTE_CAJAS_CXP.laCorteCajasCComercialesDetalleClick(
  Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CAJAS_CXP_CC_DET;
begin
  reporte := nil;
  try
     reporte := TfrmRPT_CORTE_CAJAS_CXP_CC_DET.Create(Application);
     if cbCajas.KeyValue <> 0 then
     begin
        reporte.caja := cbCajas.KeyValue;
     end;
     if cbAlmacenes.KeyValue <> 0 then
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

procedure TfrmPRN_CORTE_CAJAS_CXP.sbBorrarAlmacenClick(Sender: TObject);
begin
  cbAlmacenes.KeyValue := 0;
end;

end.
