unit UdmDocumentoPagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TdmDocumentoPagos = class(TDataModule)
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_CXC_PAGOS: TIntegerField;
    qyPartidasR_TOTAL_DOCUMENTO: TFloatField;
    qyPartidasR_FOLIO_PAGO: TIntegerField;
    qyPartidasR_FECHA_PAGO: TDateTimeField;
    qyPartidasR_CAJA: TIntegerField;
    qyPartidasR_CAJA_NOMBRE: TIBStringField;
    qyPartidasR_CAJERO: TIntegerField;
    qyPartidasR_CAJERO_NOMBRE: TIBStringField;
    qyPartidasR_TOTAL_PAGO: TFloatField;
    qyPartidasR_CAMBIO_ENTREGADO: TFloatField;
    qyPartidasR_MONEDA: TIntegerField;
    qyPartidasR_MONEDA_CLAVE: TIBStringField;
    qyPartidasR_MONEDA_DESCRIPCION: TIBStringField;
    qyPartidasR_ESTATUS_PAGO: TIBStringField;
    qyPartidasR_FECHA: TDateTimeField;
    qyPartidasR_CXC_REFERENCIA: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure detalle(valor : integer);
  end;

{var
  dmDocumentoPagos: TdmDocumentoPagos;}

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TdmDocumentoPagos.detalle(valor : integer);
begin
   qyPartidas.Close;
   qyPartidas.ParamByName('P_DOCUMENTO').AsInteger := valor;
   qyPartidas.Open;
end;

end.
