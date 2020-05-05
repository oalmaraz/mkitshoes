unit UfrmGuiaEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmGuiaDeEmbarque = class(TForm)
    qyEncabezado: TIBQuery;
    dsEncabezado: TDataSource;
    dsDetalle: TDataSource;
    qyDetalle: TIBQuery;
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
    constructor CrearA(AOwner : TComponent; p_factura : integer; abrir : boolean);
  end;

var
  frmGuiaDeEmbarque: TfrmGuiaDeEmbarque;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios;

{$R *.DFM}

constructor TfrmGuiaDeEmbarque.CrearA(AOwner : TComponent; p_factura : integer; abrir : boolean);
begin
   Create(AOwner);
   if abrir then
   begin
      qyEncabezado.Close;
      qyEncabezado.ParamByName('P_FACTURA').AsInteger := p_factura;
      qyEncabezado.Open;

      qyDetalle.Close;
      qyDetalle.ParamByName('P_FACTURA').AsInteger := p_factura;
      qyDetalle.Open;
   end;
end;

procedure TfrmGuiaDeEmbarque.loadImpresora;
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


procedure TfrmGuiaDeEmbarque.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
begin
  loadImpresora;
  //cargar archivo del directorio de reportes
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  if FindFirst(ruta+'win_listaDeEmpaque.prt', faAnyFile, SearchRec) = 0 then
     reporte := 'win_listaDeEmpaque.prt';
end;

procedure TfrmGuiaDeEmbarque.imprimir;
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

end.
