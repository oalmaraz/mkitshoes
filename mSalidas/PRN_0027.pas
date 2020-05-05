unit PRN_0027;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmPRN_0027 = class(TForm)
    qyEncabezadoPedidos: TIBQuery;
    qyPartidasPedidos: TIBQuery;
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
  frmPRN_0027: TfrmPRN_0027;

implementation

uses controladorImpresora, IBData, iniFiles, reglas_de_negocios;

{$R *.DFM}

constructor TfrmPRN_0027.CrearA(AOwner : TComponent; p_id : integer; abrir : boolean);
begin
   Create(AOwner);
   if abrir then
   begin
      qyEncabezadoPedidos.Close;
      qyEncabezadoPedidos.ParamByName('P_ID').AsInteger := p_id;
      qyEncabezadoPedidos.Open;

      qyPartidasPedidos.Close;
      qyPartidasPedidos.ParamByName('P_ID').AsInteger := p_id;
      qyPartidasPedidos.Open;
   end;
end;

procedure TfrmPRN_0027.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('PEDIDOS') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boPedido;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('PEDIDOS','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('PEDIDOS','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('PEDIDOS','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

procedure TfrmPRN_0027.imprimir;
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


procedure TfrmPRN_0027.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
begin
  loadImpresora;
  //cargar archivo del directorio de reportes
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  if FindFirst(ruta+'win_listaDeEmpaquePedido.prt', faAnyFile, SearchRec) = 0 then
     reporte := 'win_listaDeEmpaquePedido.prt';
end;

end.
