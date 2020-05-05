unit UdmVencidos;

interface

uses
  UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet,  IBX.IBQuery;

type
  TdmVencidos = class(TDataModule)
    qyIBXVencido: TIBQuery;
    dsVencido: TDataSource;
    qyIBXVencidoR_ID: TIntegerField;
    qyIBXVencidoR_CLAVE: TIBStringField;
    qyIBXVencidoR_NOMBRE: TIBStringField;
    qyIBXVencidoR_SALDO_VENCIDO: TFloatField;
    qyIBXVencidoR_SALDO: TFloatField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure refreshVencidos(p_cliente : integer);
  end;

{var
  dmVencidos: TdmVencidos;}

implementation

uses IBModulo;

{$R *.DFM}

procedure TdmVencidos.refreshVencidos(p_cliente : integer);
begin
   qyIBXVencido.Close;
   qyIBXVencido.ParamByName('P_CLIENTE').AsInteger := p_cliente;
   qyIBXVencido.Open;
end;

procedure TdmVencidos.DataModuleCreate(Sender: TObject);
begin
   dsVencido.DataSet := qyIBXVencido;
end;

end.
