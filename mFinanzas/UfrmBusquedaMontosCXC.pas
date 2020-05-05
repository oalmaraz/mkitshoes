unit UfrmBusquedaMontosCXC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db,
  IBX.IBCustomDataSet, IBX.IBQuery,    IBX.IBStoredProc, Grids,
  DBGrids;

type
  TfrmBusquedaMontos = class(TForm)
    paBotones: TPanel;
    dgPartidas: TDBGrid;
    qyBusqueda: TIBQuery;
    dsBusqueda: TDataSource;
    Label1: TLabel;
    edMonto: TEdit;
    buBuscar: TBitBtn;
    buSeleccionar: TBitBtn;
    buSalir: TBitBtn;
    Label2: TLabel;
    edRango: TEdit;
    spSELECCIONAR_PAGO: TIBStoredProc;
    procedure buBuscarClick(Sender: TObject);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure dgPartidasKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure buSeleccionarClick(Sender: TObject);
    procedure edMontoKeyPress(Sender: TObject; var Key: Char);
    procedure edRangoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    awrId    : integer;
    awrClave : string;
  public
    { Public declarations }
  published
     property ID    : integer read awrId;
     property CLAVE : string read awrClave;
  end;

var
  frmBusquedaMontos: TfrmBusquedaMontos;

implementation

{$R *.DFM}

procedure TfrmBusquedaMontos.buBuscarClick(Sender: TObject);
begin
   qyBusqueda.Close;
   qyBusqueda.ParamByName('P_MONTO').AsFloat     := StrToFloat(edMonto.Text);
   qyBusqueda.ParamByName('P_MAS_MENOS').AsFloat := StrToFloat(edRango.Text);
   qyBusqueda.Open;
end;

procedure TfrmBusquedaMontos.dgPartidasDblClick(Sender: TObject);
begin
   buSeleccionar.Click;
end;

procedure TfrmBusquedaMontos.dgPartidasKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (key = 13) and not(qyBusqueda.IsEmpty) then
      buSeleccionar.Click;
end;

procedure TfrmBusquedaMontos.FormCreate(Sender: TObject);
begin
   awrId    := 0;
   awrClave := '';
end;

procedure TfrmBusquedaMontos.buSeleccionarClick(Sender: TObject);
begin
   if not(dsBusqueda.DataSet.IsEmpty) then
   begin
      awrId    := dsBusqueda.DataSet.FieldByName('R_ID').AsInteger;
      awrClave := dsBusqueda.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
   end
end;

procedure TfrmBusquedaMontos.edMontoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) then
      buBuscar.Click
end;

procedure TfrmBusquedaMontos.edRangoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) then
      buBuscar.Click
end;

end.
