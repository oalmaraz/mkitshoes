unit UfrmVencidos;

interface

uses
  UTypeVencidos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
        
  ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TfrmVencidos = class(TForm)
    fcStatusBar1: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    dgVencidos: TDBGrid;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    vencidos : TSaldosVencidos;
    cliente : integer;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_cliente : integer);
  end;

var
  frmVencidos: TfrmVencidos;

implementation

{$R *.DFM}

constructor TfrmVencidos.Crear(AOwner : TComponent; p_cliente : integer);
begin
   Create(AOwner);
   cliente := p_cliente;
end;

procedure TfrmVencidos.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmVencidos.FormCreate(Sender: TObject);
begin
   vencidos := TSaldosVencidos.Create;
end;

procedure TfrmVencidos.FormShow(Sender: TObject);
begin
   dgVencidos.DataSource := vencidos.DSVENCIDOS;
   vencidos.refreshVencidos(cliente);
   dgVencidos.Datasource.DataSet.First;
end;

procedure TfrmVencidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vencidos.Free;
  vencidos:=nil;
end;

end.
