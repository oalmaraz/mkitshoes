unit PRN_0021_NCARGO_TXT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery,     IBX.IBStoredProc,
   StdCtrls;

type
  TfrmPRN_0021_TXT = class(TfrmPadre)
    spACTUALIZA_NOTA_DE_CARGO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spAUTO_FOLIO: TIBStoredProc;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresaR_CIUDAD_DESCRIPCION: TIBStringField;
    dsEmpresa: TDataSource;
    dsEncabezado: TDataSource;
    qyEncabezadoNCargo: TIBQuery;
    qyEncabezadoNCargocantidadconletra: TStringField;
    qyDetalleNCargo: TIBQuery;
    dsDetalle: TDataSource;
    qyEncabezadoNCargoR_ID: TIntegerField;
    qyEncabezadoNCargoR_TIPO: TIBStringField;
    qyEncabezadoNCargoR_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_FECHA_ALTA: TDateTimeField;
    qyEncabezadoNCargoR_FECHA_CANCELACION: TDateTimeField;
    qyEncabezadoNCargoR_PROVEEDOR: TIntegerField;
    qyEncabezadoNCargoR_CLIENTE: TIntegerField;
    qyEncabezadoNCargoR_EXTENSION: TIntegerField;
    qyEncabezadoNCargoR_EXTENSION_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_EXTENSION_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_EXTENSION_PROVEEDOR: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_TELEFONO: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_FAX: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_RFC: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_ENTRE_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_Y_CALLE: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NUM_EXT: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_NUM_INT: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_COLONIA: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CP: TIBStringField;
    qyEncabezadoNCargoR_SUJETO_CIUDAD: TIBStringField;
    qyEncabezadoNCargoR_ALMACEN: TIntegerField;
    qyEncabezadoNCargoR_ALMACEN_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_IVA_PORC: TFloatField;
    qyEncabezadoNCargoR_IEPS_PORC: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO1_PORC: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO2_PORC: TFloatField;
    qyEncabezadoNCargoR_SUBTOTAL: TFloatField;
    qyEncabezadoNCargoR_IVA: TFloatField;
    qyEncabezadoNCargoR_IEPS: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO1: TFloatField;
    qyEncabezadoNCargoR_IMPUESTO2: TFloatField;
    qyEncabezadoNCargoR_TOTAL: TFloatField;
    qyEncabezadoNCargoR_MONEDA: TIntegerField;
    qyEncabezadoNCargoR_MONEDA_CLAVE: TIBStringField;
    qyEncabezadoNCargoR_MONEDA_DESCRIPCION: TIBStringField;
    qyEncabezadoNCargoR_USUARIO: TIntegerField;
    qyEncabezadoNCargoR_USUARIO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_AUTORIZO: TIntegerField;
    qyEncabezadoNCargoR_AUTORIZO_NOMBRE: TIBStringField;
    qyEncabezadoNCargoR_SERIE_NC: TIBStringField;
    qyEncabezadoNCargoR_CONSECUTIVO: TIntegerField;
    qyEncabezadoNCargoR_ID_REFERENCIA: TIntegerField;
    qyEncabezadoNCargoR_TABLA_REFERENCIA: TIBStringField;
    qyEncabezadoNCargoR_ESTATUS: TIBStringField;
    qyEncabezadoNCargoR_REFERENCIA: TIBStringField;
    qyEncabezadoNCargoR_NUMERO_DE_DOCS: TIntegerField;
    qyEncabezadoNCargoR_DOCUMENTO: TIntegerField;
    qyEncabezadoNCargoR_OBSERVACIONES: TBlobField;
    procedure qyEncabezadoNCargoCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    modo            : string;
    pedirFolio      : boolean;
    impresiones     : integer;
    procedure loadImpresora;
  public
    { Public declarations }
    procedure imprimir;
    procedure preview;
    constructor CrearA(AOwner : TComponent; p_nota : integer);
  end;

var
  frmPRN_0021_TXT: TfrmPRN_0021_TXT;

implementation

uses
   inifiles, IBModulo, controladorImpresora, reglas_de_negocios, IBData;

{$R *.DFM}

constructor TfrmPRN_0021_TXT.CrearA(AOwner : TComponent; p_nota : integer);
begin
   Create(AOwner);

   qyEncabezadoNCargo.Close;
   qyEncabezadoNCargo.ParamByName('P_ID').AsInteger := p_nota;
   qyEncabezadoNCargo.Open;

   qyDetalleNCargo.Close;
   qyDetalleNCargo.ParamByName('P_ID').AsInteger := p_nota;
   qyDetalleNCargo.Open;
end;

procedure TfrmPRN_0021_TXT.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('NOTAS_DE_CARGO') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boNCargo;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Free;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1  := iniFile.ReadString('NOTAS_DE_CARGO','ImpresoraNom1','');
   strPrinterVal1  := iniFile.ReadString('NOTAS_DE_CARGO','ImpresoraVal1','');
   strEscModel1    := iniFile.ReadString('NOTAS_DE_CARGO','EscModel1'    ,'');
   modo            := iniFile.ReadString('NOTAS_DE_CARGO','Modo','');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Free;
   modo := upperCase(modo);
end;

procedure TfrmPRN_0021_TXT.imprimir;
begin
end;

procedure TfrmPRN_0021_TXT.preview;
begin
end;

procedure TfrmPRN_0021_TXT.qyEncabezadoNCargoCalcFields(DataSet: TDataSet);
var
   enteroStr : string;
   fracStr   : string;
begin
  inherited;
  if (DataSet.FieldByName('R_TOTAL').AsString <> '') then
  begin
     reglas.separarFlotante(DataSet.FieldByName('R_TOTAL').AsFloat, enteroStr, fracStr);
     //leCantidad.Numero := StrToInt(enteroStr);
     //leCantidad.Moneda := DataSet.FieldByName('R_MONEDA_DESCRIPCION').AsString;
     //DataSet.FieldByName('CANTIDADCONLETRA').AsString := UpperCase(leCantidad.AsString + ' ' + fracStr + '/100 ' + DataSet.FieldByName('R_MONEDA_CLAVE').AsString);
  end
  else
     DataSet.FieldByName('CANTIDADCONLETRA').AsString := '';
end;

procedure TfrmPRN_0021_TXT.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
   nombre : string;
begin
  pedirFolio := true;                   
  loadImpresora;
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  inherited;
  //cargar archivo del directorio de reportes
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  if modo = 'DOS' then
     nombre := 'notaDeCargo.prt'
  else
     if modo = 'WIN' then
        nombre := 'win_notaDeCargo.prt';
  if FindFirst(ruta+nombre, faAnyFile, SearchRec) = 0 then
  begin
     reporte := nombre;
  end;
  reglas.refresh_IBQuery(qyEmpresa);
  //numero de impresiones por notas de cargo
  dmIBData.TPreferencias.Filter := 'ID = 107';
  impresiones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

end.
