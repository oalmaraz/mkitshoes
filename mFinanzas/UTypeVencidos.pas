unit UTypeVencidos;

interface

uses
   UdmVencidos, db;

type
   TSaldosVencidos = class(TObject)
   private
      dmVencidos : TdmVencidos;
      function GetDataSourceVencidos : TDataSource;
   public
     constructor Create();
     destructor Destroy; override;
     procedure refreshVencidos(p_cliente : integer);
   published
     property DSVENCIDOS : TDataSource read GetDataSourceVencidos;
   end;

implementation

constructor TSaldosVencidos.Create();
begin
  inherited Create;
  dmVencidos := TdmVencidos.Create(nil);
end;

destructor TSaldosVencidos.Destroy;
begin
  dmVencidos.Free;
  dmVencidos := nil;
  inherited destroy;
end;

function TSaldosVencidos.GetDataSourceVencidos : TDataSource;
begin
   Result := dmVencidos.dsVencido;
end;

procedure TSaldosVencidos.refreshVencidos(p_cliente : integer);
begin
   dmVencidos.refreshVencidos(p_cliente);
end;

end.
