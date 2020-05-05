unit PRN_0027_A;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids, DBGrids;

type
  TfrmPRN_0027_A = class(TForm)
    qyEncabezado: TIBQuery;
    qyDetalle: TIBQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    procedure loadImpresora;
  public
    { Public declarations }
    procedure imprimir;
    constructor CrearA(AOwner : TComponent; p_id : integer; abrir : boolean);
  end;

var
  frmPRN_0027_A: TfrmPRN_0027_A;

implementation

uses controladorImpresora, IBData, iniFiles, reglas_de_negocios;

{$R *.DFM}

constructor TfrmPRN_0027_A.CrearA(AOwner : TComponent; p_id : integer; abrir : boolean);
begin
   Create(AOwner);
   if abrir then
   begin
      qyEncabezado.Close;
      qyEncabezado.ParamByName('P_ID').AsInteger := p_id;
      qyEncabezado.Open;

      qyDetalle.Close;
      qyDetalle.ParamByName('P_FACTURA').AsInteger := p_id;
      qyDetalle.Open;
   end;
end;

procedure TfrmPRN_0027_A.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('FACTURAS') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boFacturas;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('FACTURAS','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('FACTURAS','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('FACTURAS','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

procedure TfrmPRN_0027_A.imprimir;
//var
  // prWINReporte : TprReport;
begin
   //impresion WIN
   {
   prWINReporte := TprReport.Create(Self);
   prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
   prWINReporte.PrinterName  := strImpresora;
   prWINReporte.PrepareReport;
   prWINReporte.PrintPreparedReport;
   prWINReporte.Destroy;
   }
end;


procedure TfrmPRN_0027_A.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
begin
  loadImpresora;
  //cargar archivo del directorio de reportes
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  if FindFirst(ruta+'win_listaDeEmpaqueFactura.prt', faAnyFile, SearchRec) = 0 then
     reporte := 'win_listaDeEmpaqueFactura.prt';
end;

end.
