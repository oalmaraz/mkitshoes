unit PRN_0010_Colectas_pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  Db,
     DBCtrls, 
   StdCtrls, IBX.IBCustomDataSet, IBX.IBTable,  IBX.IBQuery, ComCtrls,
  Buttons, System.Variants;

type
  TfrmPRN_0010 = class(TfrmPadre)
    qyColectas: TIBQuery;
    dsColectas: TDataSource;
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
    Label2: TLabel;
    cbCajas: TDBLookupComboBox;
    Label1: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    sbSinCaja: TBitBtn;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    qyColectasR_ID: TIntegerField;
    qyColectasR_FECHA: TDateTimeField;
    qyColectasR_CAJA: TIntegerField;
    qyColectasR_CAJA_NOMBRE: TIBStringField;
    qyColectasR_ALMACEN: TIntegerField;
    qyColectasR_ALMACEN_NOMBRE: TIBStringField;
    qyColectasR_USUARIO: TIntegerField;
    qyColectasR_USUARIO_NOMBRE: TIBStringField;
    qyColectasR_REFERENCIA: TIBStringField;
    qyColectasR_TOTAL: TFloatField;
    qyColectasR_ID_DETALLE: TIntegerField;
    qyColectasR_REFERENCIA_PAGO: TIntegerField;
    qyColectasR_REFERENCIA_NOMBRE: TIBStringField;
    qyColectasR_CANTIDAD: TIntegerField;
    qyColectasR_MONTO: TFloatField;
    qyColectasR_TOTAL_DETALLE: TFloatField;
    qyColectasR_REFERENCIA_DETALLE: TIBStringField;
    qyColectasR_BANCO: TIntegerField;
    qyColectasR_BANCO_NOMBRE: TIBStringField;
    qyColectasR_ESTATUS: TIBStringField;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure sbSinCajaClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_caja, p_almacen : integer);
  end;

var
  frmPRN_0010: TfrmPRN_0010;

implementation

uses reglas_de_negocios;

{$R *.DFM}

constructor TfrmPRN_0010.Crear(AOwner : TComponent; p_caja, p_almacen : integer);
begin
   Create(AOwner);
   deFecha.Date         := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
   cbCajas.KeyValue     := p_caja;
   cbAlmacenes.KeyValue := p_almacen;
end;

procedure TfrmPRN_0010.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyEmpresa);
  reglas.abrir_IBTabla(TCajas);
  reglas.abrir_IBQuery(qyAlmacenes);
end;

procedure TfrmPRN_0010.sbSinCajaClick(Sender: TObject);
begin
  inherited;
  cbCajas.KeyValue := Null;
end;

procedure TfrmPRN_0010.ibImprimirClick(Sender: TObject);
var
   caja    : integer;
begin
  caja := 0;
  inherited;
  if cbCajas.Text <> '' then
  begin
     caja            := cbCajas.KeyValue;
     //laCajas.Caption := cbCajas.Text;
  end
  else
     //laCajas.Caption  := 'Todas';

  qyColectas.Close;
  qyColectas.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',deFecha.Date);
  qyColectas.ParamByName('P_CAJA').AsInteger    := caja;
  qyColectas.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
  qyColectas.Open;

  //qrColectas.PreviewModal;
end;


end.
