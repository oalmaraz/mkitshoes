unit PRN_0030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  stdCtrls,
    Db, IBX.IBCustomDataSet, IBX.IBQuery, Buttons;

type
  TfrmPRN_0030 = class(TForm)
    qyGEPedidos: TIBQuery;
    Label1: TLabel;
    laCuantas: TLabel;
    cePosicion: TEdit;
    cbTodo: TCheckBox;
    ceCuantas: TEdit;
    edTotal: TEdit;
    Label2: TLabel;
    ibCerrar: TBitBtn;
    ibImpresion: TBitBtn;
    procedure cbTodoChange(Sender: TObject);
    procedure ibImpresionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    pedido          : integer;
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    procedure loadImpresora;
  public
    { Public declarations }
    constructor crear(AOwner : TComponent; pPedido : integer; pTotal : double);
    procedure imprimir;
  end;

var
  frmPRN_0030: TfrmPRN_0030;

implementation

uses inifiles, controladorImpresora, reglas_de_negocios;

{$R *.DFM}

constructor TfrmPRN_0030.crear(AOwner : TComponent; pPedido : integer; pTotal : double);
begin
   Create(AOwner);
   pedido := pPedido;
   edTotal.text := FloatToStr(pTotal);
end;

procedure TfrmPRN_0030.imprimir;
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

procedure TfrmPRN_0030.loadImpresora;
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

procedure TfrmPRN_0030.cbTodoChange(Sender: TObject);
begin
   laCuantas.Visible := not(cbTodo.Checked);
   ceCuantas.Visible := not(cbTodo.Checked);
   if ceCuantas.Visible then
      ceCuantas.SetFocus;
end;

procedure TfrmPRN_0030.ibImpresionClick(Sender: TObject);
var
   todo : string;
begin
   if cbTodo.Checked then
      todo := 'Si'
   else
      todo := 'No';
   qyGEPedidos.Close;
   qyGEPedidos.ParamByName('P_PEDIDO').AsInteger   := pedido;
   qyGEPedidos.ParamByName('P_POSICION').AsInteger := (StrToInt(cePosicion.Text));
   qyGEPedidos.ParamByName('P_TODO').AsString      := todo;
   qyGEPedidos.ParamByName('P_CUANTAS').AsInteger  := StrToInt(ceCuantas.Text);
   qyGEPedidos.ParamByName('P_TOTAL').AsFloat      := StrToFloat(edTotal.Text);
   qyGEPedidos.Open;
   imprimir;
end;

procedure TfrmPRN_0030.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
   archivo   : string;
begin
   loadImpresora;
   //cargar archivo del directorio de reportes
   archivo := 'win_guiaEmbarquePedido.prt';
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';
   if FindFirst(ruta+archivo, faAnyFile, SearchRec) = 0 then
      reporte := archivo
   else
      showmessage('Falta archivo: '+archivo);
end;

end.
