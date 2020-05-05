unit FR_DESIGN;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, ImgList,  Buttons, ExtCtrls, System.ImageList;

type
  TfrmFR_DESIGN = class(TForm)
    paBotones: TPanel;
    LMDButton1: TBitBtn;
    paEnc: TPanel;
    ImageList1: TImageList;
    Label1: TLabel;
    FlatPanel1: TPanel;
    FileNameL: TLabel;
    DescriptionM: TMemo;
    paArbol: TPanel;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LMDButton1Click(Sender: TObject);
  private
    { Private declarations }
    ruta : string;
    rpt  : string; 
    procedure abrirReporte;
    function esGrafico : boolean;
    procedure InitTemplatesList;
  public
    { Public declarations }
  end;

var
  frmFR_DESIGN: TfrmFR_DESIGN;

implementation

{$R *.DFM}

procedure TfrmFR_DESIGN.InitTemplatesList;
begin
end;

function TfrmFR_DESIGN.esGrafico : boolean;
var
   tmp    : string;
   resp   : boolean;
begin
   resp := false;
   tmp    := UpperCase(copy(rpt,1,3));
   if tmp = 'frw' then
      resp := true;
   result := resp;
end;

procedure TfrmFR_DESIGN.abrirReporte;
begin
end;

procedure TfrmFR_DESIGN.FormCreate(Sender: TObject);
begin
   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';

   InitTemplatesList
end;

procedure TfrmFR_DESIGN.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmFR_DESIGN.LMDButton1Click(Sender: TObject);
begin
   abrirReporte;
end;


end.

