unit UTypeDetalleDeLaVenta;

interface

uses
   UdmDetalleDeLaVenta, db;

type
   TDetalleDeLaVenta = class(TObject)
   private
      dmDetalle : TdmDetalleDeLaVenta;
      function GetDataSourceDetalle : TDataSource;
   public
     constructor Create();
     destructor Destroy; override;
     procedure refreshDetalle(p_cxc : integer);
   published
     property DSDETALLE : TDataSource read GetDataSourceDetalle;
   end;

implementation

constructor TDetalleDeLaVenta.Create();
begin
  inherited Create;
  dmDetalle := TdmDetalleDeLaVenta.Create(nil);
end;

destructor TDetalleDeLaVenta.Destroy; 
begin
  dmDetalle.Free;
  dmDetalle := nil;
  inherited destroy;
end;

procedure TDetalleDeLaVenta.refreshDetalle(p_cxc : integer);
begin
   dmDetalle.refreshDetalle(p_cxc);
end;

function TDetalleDeLaVenta.GetDataSourceDetalle : TDataSource;
begin
   Result := dmDetalle.dsDetalle;
end;

end.
