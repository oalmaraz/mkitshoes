unit PRN_0015_NC_TXT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,   
      StdCtrls, Db, IBX.IBCustomDataSet,
  IBX.IBQuery, IBX.IBStoredProc;

type
  TfrmPRN_0015_TXT = class(TfrmPadre)
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresaR_CIUDAD_DESCRIPCION: TIBStringField;
    dsEmpresa: TDataSource;
    spAUTO_FOLIO: TIBStoredProc;
    qyEncabezadoNC: TIBQuery;
    dsEncabezado: TDataSource;
    dsDetalle: TDataSource;
    qyDetalleNC: TIBQuery;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_NOTA_DE_CREDITO: TIBStoredProc;
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
  frmPRN_0015_TXT: TfrmPRN_0015_TXT;

implementation

uses inifiles, IBModulo, reglas_de_negocios, controladorImpresora, IBData,
  UfrmFolio;

{$R *.DFM}

constructor TfrmPRN_0015_TXT.CrearA(AOwner : TComponent; p_nota : integer);
begin
   Create(AOwner);

   qyEncabezadoNC.Close;
   qyEncabezadoNC.ParamByName('P_ID').AsInteger := p_nota;
   qyEncabezadoNC.Open;

   qyDetalleNC.Close;
   qyDetalleNC.ParamByName('P_ID').AsInteger := p_nota;
   qyDetalleNC.Open;
end;

procedure TfrmPRN_0015_TXT.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('NOTAS_DE_CREDITO') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boNCredito;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Free;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1  := iniFile.ReadString('NOTAS_DE_CREDITO','ImpresoraNom1','');
   strPrinterVal1  := iniFile.ReadString('NOTAS_DE_CREDITO','ImpresoraVal1','');
   strEscModel1    := iniFile.ReadString('NOTAS_DE_CREDITO','EscModel1','');
   modo            := iniFile.ReadString('NOTAS_DE_CREDITO','Modo','');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Free;
   modo := upperCase(modo);
end;

procedure TfrmPRN_0015_TXT.preview;
begin
end;

procedure TfrmPRN_0015_TXT.imprimir;
begin
end;

procedure TfrmPRN_0015_TXT.FormCreate(Sender: TObject);
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
     nombre := 'notaDeCredito.prt'
  else
     if modo = 'WIN' then
        nombre := 'win_notaDeCredito.prt';
  if FindFirst(ruta+nombre, faAnyFile, SearchRec) = 0 then
  begin
     reporte := nombre;
  end;
  reglas.refresh_IBQuery(qyEmpresa);
  //Numero de impresiones por nota de credito
  dmIBData.TPreferencias.Filter := 'ID = 106';
  impresiones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

end.
