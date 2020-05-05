unit FR_0001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db,   IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmFR_0001 = class(TForm)
    qyMIDiferenciasE: TIBQuery;
    qyMIDiferenciasD: TIBQuery;
    dsHospEdoCtaE: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    awrID           : integer;
    procedure loadImpresora;
    function Open(archivo : string) : boolean;
  public
    { Public declarations }
    function OpenFormato : boolean;
    procedure imprimir;
  published
     property ID : integer write awrID;
  end;

var
  frmFR_0001: TfrmFR_0001;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmFR_0001.imprimir;
begin
end;

procedure TfrmFR_0001.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('MOV_INVENTARIO') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boMI;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile         := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1  := iniFile.ReadString('MOV_INVENTARIO','ImpresoraNom1','');
   strPrinterVal1  := iniFile.ReadString('MOV_INVENTARIO','ImpresoraVal1','');
   strEscModel1    := iniFile.ReadString('MOV_INVENTARIO','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

function TfrmFR_0001.Open(archivo : string) : boolean;
var
   SearchRec : TSearchRec;
   tmp : boolean;
begin
   tmp := true;
   //encabezado
   qyMIDiferenciasE.Close;
   qyMIDiferenciasE.ParamByName('P_ID').AsInteger := awrID;
   qyMIDiferenciasE.Open;
   //detalle
   qyMIDiferenciasD.Close;
   qyMIDiferenciasD.ParamByName('P_ID').AsInteger := awrID;
   qyMIDiferenciasD.Open;

   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';
   if FindFirst(ruta+archivo, faAnyFile, SearchRec) = 0 then
      reporte := archivo
   else
      begin
         tmp := false;
         showmessage('Falta archivo: '+archivo);
      end;
   result := tmp;
end;

function TfrmFR_0001.OpenFormato : boolean;
begin
   result := Open('win_mi_diferencias.prt');
end;

procedure TfrmFR_0001.FormCreate(Sender: TObject);
begin
   loadImpresora;
end;

end.
