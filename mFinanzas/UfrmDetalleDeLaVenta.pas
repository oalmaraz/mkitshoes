unit UfrmDetalleDeLaVenta;

interface

uses
  UTypeDetalleDeLaVenta, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,

  Menus,  Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, Data.DB;

type
  TfrmDetalleDeLaVenta = class(TForm)
    fcStatusBar1: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    dgDetalle: TDBGrid;
    ppCerrar: TPopupMenu;
    Cerrar1: TMenuItem;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
  private
    { Private declarations }
    awrID : integer;
    det : TDetalleDeLaVenta;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; p_cxc : integer);
  published
     property ID : integer read awrID write awrID;
  end;

{var
  frmDetalleDeLaVenta: TfrmDetalleDeLaVenta;}

implementation

{$R *.DFM}

constructor TfrmDetalleDeLaVenta.Crear(AOwner : TComponent; p_cxc : integer);
begin
   Create(AOwner);
   awrID := p_cxc;
end;

procedure TfrmDetalleDeLaVenta.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDetalleDeLaVenta.FormCreate(Sender: TObject);
begin
   det := TDetalleDeLaVenta.Create;
end;

procedure TfrmDetalleDeLaVenta.FormShow(Sender: TObject);
begin
   dgDetalle.DataSource := det.DSDETALLE;
   det.refreshDetalle(awrID);
   dgDetalle.DataSource.DataSet.First;
end;

procedure TfrmDetalleDeLaVenta.FormDestroy(Sender: TObject);
begin
  det.Free;
  det:=nil;
end;

procedure TfrmDetalleDeLaVenta.Cerrar1Click(Sender: TObject);
begin
   Close;
end;

end.
