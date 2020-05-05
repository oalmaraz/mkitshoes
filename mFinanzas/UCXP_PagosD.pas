unit UCXP_PagosD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmCXP_PagosD = class(TForm)
    fcStatusBar1: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    dgPartidas: TDBGrid;
    qyDetalle: TIBQuery;
    dsDetalle: TDataSource;
    qyDetalleR_ID: TIntegerField;
    qyDetalleR_CC: TIntegerField;
    qyDetalleR_CC_C: TIBStringField;
    qyDetalleR_CC_N: TIBStringField;
    qyDetalleR_REFERENCIA: TIBStringField;
    qyDetalleR_FOLIO: TIntegerField;
    qyDetalleR_BANCO: TIntegerField;
    qyDetalleR_BANCO_C: TIBStringField;
    qyDetalleR_BANCO_N: TIBStringField;
    qyDetalleR_FECHA: TDateTimeField;
    qyDetalleR_MONTO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
    awrID : integer;
    procedure setID(p_id : integer);
  public
    { Public declarations }
  published
     property ID : integer write setID;
  end;

var
  frmCXP_PagosD: TfrmCXP_PagosD;

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TfrmCXP_PagosD.setID(p_id : integer);
begin
   awrID := p_id;

   qyDetalle.Close;
   qyDetalle.ParamByName('P_ID').AsInteger := awrID;
   qyDetalle.Open;
end;

procedure TfrmCXP_PagosD.FormCreate(Sender: TObject);
begin
   awrID := 0;
end;

procedure TfrmCXP_PagosD.ibSalirClick(Sender: TObject);
begin
   Close;
end;

end.
