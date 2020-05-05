unit UPRN_0038;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   IBX.IBStoredProc, Db, IBX.IBCustomDataSet,
  IBX.IBQuery;

type
  TPRN_0038 = class(TForm)
    qyPGARANTIA: TIBQuery;
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_MI_ORIGEN: TIBStoredProc;
    qyActulizar: TIBQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrID           : integer;
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    modo            : string;
    pedirFolio      : boolean;
    impresiones     : integer;
    procedure loadImpresora;
    procedure setID(valor : integer);
    function getID : integer;
  public
    { Public declarations }
    procedure imprimir;
    procedure LoadReporte;
    //constructor CrearA(AOwner : TComponent; p_id : integer; abrir : boolean);
  published
     property ID : integer read getID write setID;
     property PEDIR : boolean read pedirFolio write pedirFolio;
  end;

var
  PRN_0038: TPRN_0038;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TPRN_0038.setID(valor : integer);
begin
   awrID := valor;
   qyPGARANTIA.Close;
   qyPGARANTIA.ParamByName('P_ID').AsInteger := valor;
   qyPGARANTIA.Open;
end;

function TPRN_0038.getID : integer;
begin
   result := awrID;
end;

procedure TPRN_0038.LoadReporte;
var
   SearchRec : TSearchRec;
begin
   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';

   loadImpresora;
   if modo = 'DOS' then
   begin
      if FindFirst(ruta+'polizaDeGarantia.prt', faAnyFile, SearchRec) = 0 then
         reporte := 'polizaDeGarantia.prt';
   end
   else
      begin
         if FindFirst(ruta+'win_PolizaDeGarantia.prt', faAnyFile, SearchRec) = 0 then
            reporte := 'win_PolizaDeGarantia.prt';
      end;
end;

procedure TPRN_0038.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('POLIZAS_DE_GARANTIA') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boPG;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('POLIZAS_DE_GARANTIA','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('POLIZAS_DE_GARANTIA','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('POLIZAS_DE_GARANTIA','EscModel1'    ,'');
   modo           := iniFile.ReadString('POLIZAS_DE_GARANTIA','Modo','');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
   modo := UpperCase(modo);
end;

procedure TPRN_0038.imprimir;
begin
end;

procedure TPRN_0038.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
  //Impresiones por poliza de garantia
  dmIBData.TPreferencias.Filter := 'ID = 109';
  impresiones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

end.
