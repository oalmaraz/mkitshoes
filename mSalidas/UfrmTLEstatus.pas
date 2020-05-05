unit UfrmTLEstatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery,  Grids, DBGrids;

type
  TfrmTLEstatus = class(TForm)
    paBotones: TPanel;
    buSalir: TBitBtn;
    dgEstatus: TDBGrid;
    qyEstatus: TIBQuery;
    qyEstatusR_ID: TIntegerField;
    qyEstatusR_ESTATUS: TIBStringField;
    dsEstatus: TDataSource;
    procedure dgEstatusBTNButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
     awrForma   : integer;
     awrEstatus : string;
     procedure setForma(valor : integer);
     function getEstatus : string;
  public
    { Public declarations }
  published
     property FORMA   : integer read awrForma write setForma;
     property ESTATUS : string read getEstatus;
  end;

var
  frmTLEstatus: TfrmTLEstatus;

implementation

uses
  IBModulo;

{$R *.DFM}

function TfrmTLEstatus.getEstatus : string;
begin
   result := awrEstatus;
end;

procedure TfrmTLEstatus.setForma(valor : integer);
begin
   awrForma := valor;

   qyEstatus.Close;
   qyEstatus.ParamByName('P_FORMA').AsInteger := valor;
   qyEstatus.Open;
end;

procedure TfrmTLEstatus.dgEstatusBTNButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   awrEstatus       := dsEstatus.DataSet.FieldByName('R_ESTATUS').AsString;
   self.ModalResult := mrOk;
end;

procedure TfrmTLEstatus.FormCreate(Sender: TObject);
begin
   awrEstatus := '';
end;

end.
