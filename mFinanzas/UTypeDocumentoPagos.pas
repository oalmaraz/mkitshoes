unit UTypeDocumentoPagos;

interface

uses
   UdmDocumentoPagos, UfrmChequeDevuelto, db;

type
   TDocumentoPagos = class
   private
      dmDocumentoPagos : TdmDocumentoPagos;
      Cheques          : TfrmChequeDevuelto;
      procedure setCXC(valor : integer);
      function setDSDetalle : TDataSource;
      function getHayCheques : boolean;
      procedure setHayCheques(valor : boolean);
   public
     constructor Create();overload;
     destructor Destroy; override;
     procedure ChequesDevueltos(p_usuario : integer);
   published
     property CXC : integer write setCXC;
     property dsDetalle  : TDataSource read setDSDetalle;
     property HayCheques : boolean read getHayCheques write setHayCheques;
   end;

implementation

constructor TDocumentoPagos.Create();
begin
  inherited Create;
  dmDocumentoPagos := TdmDocumentoPagos.Create(nil);
  Cheques          := TfrmChequeDevuelto.Create(nil);
end;

destructor TDocumentoPagos.Destroy;
begin
   Cheques.Free;
   Cheques := nil;
   dmDocumentoPagos.Free;
   dmDocumentoPagos := nil;
   inherited destroy;
end;

procedure TDocumentoPagos.setHayCheques(valor : boolean);
begin
   Cheques.Cheques := valor;
end;

function TDocumentoPagos.getHayCheques : boolean;
begin
   Result := Cheques.Cheques;
end;

procedure TDocumentoPagos.ChequesDevueltos(p_usuario : integer);
begin
   Cheques.ID_PAGO    := dmDocumentoPagos.dsPartidas.DataSet.FieldByName('R_CXC_PAGOS').AsInteger;
   Cheques.Usuario    := p_usuario;
   Cheques.referencia := dmDocumentoPagos.dsPartidas.DataSet.FieldByName('R_CXC_REFERENCIA').AsString;
   Cheques.monto      := dmDocumentoPagos.dsPartidas.DataSet.FieldByName('R_TOTAL_PAGO').AsFloat;
   Cheques.ShowModal;
end;

function TDocumentoPagos.setDSDetalle : TDataSource;
begin
   Result := dmDocumentoPagos.dsPartidas;
end;

procedure TDocumentoPagos.setCXC(valor : integer);
begin
   dmDocumentoPagos.detalle(valor);
end;

end.
