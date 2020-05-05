unit UfrmBuild;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     Menus, StdCtrls,
       ExtCtrls,
   DB, IBX.IBDatabase, IBX.IBCustomDataSet, IBX.IBStoredProc, IBX.IBQuery,
  Buttons, Grids, DBGrids;

type
  TfrmBuild = class(TForm)
    Panel1: TPanel;
    dgVista: TDBGrid;
    dgConstructor: TDBGrid;
    paBotones: TPanel;
    Panel2: TPanel;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    spFECHA_SERVIDOR_SH: TIBStoredProc;
    dsVista: TDataSource;
    qyVista: TIBQuery;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    Pedidos1: TMenuItem;
    buF7Build: TBitBtn;
    buF9Build: TBitBtn;
    buF11Build: TBitBtn;
    buF10Build: TBitBtn;
    buF12Build: TBitBtn;
    buF8Build: TBitBtn;

  private
    { Private declarations }
    awrBuild : TSqlAnaliza;
    awrForma : string;
    awrUsr   : integer;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);

    procedure setForma(valor : string);
    procedure setUsuario(valor : integer);
    procedure setSQL(valor : TSqlAnaliza);

    function strValor(index : integer) : string;
    function strSentencia(index : integer) : string;
  public
    { Public declarations }
  published
    property DATABASE    : TIBDatabase write setDatabase;
    property TRANSACTION : TIBTransaction write setTransaction;

    property FORMA : string write setForma;
    property USR   : integer write setUsuario;
    property SQL   : TSqlAnaliza read awrBuild write setSQL;
  end;

var
  frmBuild: TfrmBuild;

implementation

uses
  UfrmScript;

{$R *.DFM}

procedure TfrmBuild.setDatabase(valor : TIBDatabase);
begin
   qyVista.Database             := valor;
   spFECHA_SERVIDOR_SH.Database := valor;
end;

procedure TfrmBuild.setTransaction(valor : TIBTransaction);
begin
   qyVista.Transaction             := valor;
   spFECHA_SERVIDOR_SH.Transaction := valor;
end;

procedure TfrmBuild.setForma(valor : string);
begin
end;

procedure TfrmBuild.setUsuario(valor : integer);
begin
   awrUsr := valor;
end;

procedure TfrmBuild.setSQL(valor : TSqlAnaliza);
begin
end;



function TfrmBuild.strSentencia(index : integer) : string;
begin
end;

function TfrmBuild.strValor(index : integer) : string;
begin
end;



end.
