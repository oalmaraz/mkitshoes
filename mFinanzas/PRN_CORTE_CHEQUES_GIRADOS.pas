unit PRN_CORTE_CHEQUES_GIRADOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    ComCtrls, ImgList,   DBCtrls,
      Buttons,  StdCtrls,
  ExtCtrls,  Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBTable, System.ImageList, system.Variants;

type
  TfrmPRN_CORTE_CHEQUES_GIRADOS = class(TForm)
    Panel1: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    fcImager7: TImage;
    paDatos: TPanel;
    sbBorrarBanco: TSpeedButton;
    ilCortes: TImageList;
    pcCortes: TPageControl;
    tsNormal: TTabSheet;
    paCortes: TPanel;
    fcImager1: TImage;
    laCorteCajas: TBitBtn;
    cbEstatus: TComboBox;
    Label7: TLabel;
    edFechaDEL: TDateTimePicker;
    Label3: TLabel;
    edFechaAL: TDateTimePicker;
    Label4: TLabel;
    qyBancos: TIBQuery;
    qyBancosR_ID: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    dsBancos: TDataSource;
    laBanco: TLabel;
    cbBancos: TDBLookupComboBox;
    sbEstatus: TPanel;
    ibSalir: TBitBtn;
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
    Label1: TLabel;
    cbMonedas: TDBLookupComboBox;
    sbBorrarMoneda: TSpeedButton;
    dsMonedas: TDataSource;
    TMonedas: TIBTable;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    cbPorFechaAplicacion: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbBorrarBancoClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure laCorteCajasClick(Sender: TObject);
    procedure sbBorrarMonedaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRN_CORTE_CHEQUES_GIRADOS: TfrmPRN_CORTE_CHEQUES_GIRADOS;

implementation

uses
  reglas_de_negocios, RPT_CORTE_CHEQUES_GIRADOS;

{$R *.DFM}

procedure TfrmPRN_CORTE_CHEQUES_GIRADOS.FormCreate(Sender: TObject);
begin
   edFechaDEL.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
   edFechaAL.Date  := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));

   reglas.abrir_IBTabla(TMonedas);
   reglas.refresh_IBQuery(qyEmpresa);
   reglas.abrir_IBQuery(qyBancos);
end;

procedure TfrmPRN_CORTE_CHEQUES_GIRADOS.sbBorrarBancoClick(Sender: TObject);
begin
   cbBancos.KeyValue := null;
end;

procedure TfrmPRN_CORTE_CHEQUES_GIRADOS.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPRN_CORTE_CHEQUES_GIRADOS.laCorteCajasClick(Sender: TObject);
var
   reporte : TfrmRPT_CORTE_CHEQUES_GIRADOS;
   estatus : integer;
   banco   : integer;
   moneda  : integer;
   porApp  : String;
begin
  reporte := nil;
  try
      
{     estatus := 0;
     if cbEstatus.ItemIndex <> 4 then}
        estatus := cbEstatus.ItemIndex;

     banco := 0;
     if cbBancos.KeyValue <> null then
        banco := cbBancos.KeyValue;

     moneda := 0;
     if cbMonedas.KeyValue <> null then
        moneda := cbMonedas.KeyValue;

     porApp := 'No';
     if cbPorFechaAplicacion.Checked then
        porApp := 'Si';

     reporte                       := TfrmRPT_CORTE_CHEQUES_GIRADOS.Create(Application);
    // reporte.laRazonSocial.Caption := qyEmpresa.FieldByName('R_RAZON_SOCIAL').AsString;
    // reporte.laRFC.Caption         := qyEmpresa.FieldByName('R_RFC').AsString;
    // reporte.laTelefono1.Caption   := qyEmpresa.FieldByName('R_TELEFONO1').AsString;
     reporte.Estatus               := estatus;
     reporte.Banco                 := banco;
     reporte.Moneda                := moneda;
     reporte.PorAplicacion         := porApp;
     reporte.fechaInicio           := edFechaDEL.Date;
     reporte.fechaFin              := edFechaAL.Date;

//     if cbEstatus.ItemIndex <> 4 then
       // reporte.laEstatus.Caption := cbEstatus.Text;

     if cbBancos.KeyValue <> null then
     begin
        //reporte.laBancos.Caption := cbBancos.Text;
     end;
     if cbMonedas.KeyValue <> null then
     begin
        //reporte.laMonedas.Caption := cbMonedas.Text;
     end;
     //reporte.laDel.Caption := FormatDateTime('dd/mm/yyyy',edFechaDEL.Date);
     //reporte.laAl.Caption  := FormatDateTime('dd/mm/yyyy',edFechaAl.Date);

     reporte.Preview;
  finally
     reporte.Free;
  end;
end;

procedure TfrmPRN_CORTE_CHEQUES_GIRADOS.sbBorrarMonedaClick(
  Sender: TObject);
begin
   cbMonedas.KeyValue := null;
end;

end.
