unit UfrmDocumentoPagos;

interface

uses
  UTypeDocumentoPagos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
      Menus,
     ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Data.DB;

type
  TfrmDocumentoPagos = class(TForm)
    fcStatusBar1: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    ppCerrar: TPopupMenu;
    Cerrar1: TMenuItem;
    dgPartidas: TDBGrid;
    procedure ibSalirClick(Sender: TObject);
    procedure Cerrar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dgPartidasFolioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    awrUsuario    : integer;
    awrActivarChq : Boolean;
    DocumentoPagos : TDocumentoPagos;
    procedure setCXC(valor : integer);
    procedure setHayCheques(valor : boolean);
    function getHayCheques : boolean;
  public
    { Public declarations }
  published
     property Usuario : integer read awrUsuario write awrUsuario;
     property CXC : integer write setCXC;
     property HayCheques : boolean read getHayCheques write setHayCheques;
  end;

{var
  frmDocumentoPagos: TfrmDocumentoPagos;}

implementation

uses
  IBData, reglas_de_negocios;

{$R *.DFM}

procedure TfrmDocumentoPagos.setHayCheques(valor : boolean);
begin
   DocumentoPagos.HayCheques := valor;
end;

function TfrmDocumentoPagos.getHayCheques : boolean;
begin
   Result := DocumentoPagos.HayCheques;
end;

procedure TfrmDocumentoPagos.setCXC(valor : integer);
begin
   DocumentoPagos.CXC := valor;
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmDocumentoPagos.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDocumentoPagos.Cerrar1Click(Sender: TObject);
begin
   Close;
end;

procedure TfrmDocumentoPagos.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);

   DocumentoPagos := TDocumentoPagos.Create;

   dmIBData.TPreferencias.Filter := 'ID = 345';
   awrActivarChq := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmDocumentoPagos.FormDestroy(Sender: TObject);
begin
   DocumentoPagos.Free;
   DocumentoPagos := nil;
end;

procedure TfrmDocumentoPagos.FormShow(Sender: TObject);
begin
   dgPartidas.DataSource := DocumentoPagos.dsDetalle;
end;

procedure TfrmDocumentoPagos.dgPartidasFolioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   if awrActivarChq then
      DocumentoPagos.ChequesDevueltos(Usuario)
   else
   begin
     ShowMessage('Cheques Devueltos. No tiene activada  esta opcion. Preferencias (345).');
   end;
end;

end.
