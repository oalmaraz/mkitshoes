unit ver_notas_de_credito_en_nc;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  Db, IBX.IBCustomDataSet,  IBX.IBStoredProc,
  Grids, DBGrids, StdCtrls, Buttons, IBX.IBQuery;

type
  TfrmVer_notas_de_credito_en_nc = class(TfrmPadre)
    qyNC: TIBQuery;
    dsNC: TDataSource;
    spACT_COT_EN_PEDIDO: TIBStoredProc;
    spDEL_NC_A_NC: TIBStoredProc;
    dsPartidas: TDataSource;
    ibEliminar: TBitBtn;
    ibSalir: TBitBtn;
    dgPartidas: TDBGrid;
    qyNCR_ID: TIntegerField;
    qyNCR_CLAVE: TIBStringField;
    qyNCR_FECHA_ALTA: TDateTimeField;
    qyNCR_TOTAL: TFloatField;
    qyNCR_CLIENTE: TIBStringField;
    qyNCR_EXTENSION: TIBStringField;
    qyNCR_REFERENCIA: TIBStringField;
    qyNCR_FECHA_COMPRA: TDateTimeField;
    qyNCR_FECHA_VENCIMIENTO: TDateTimeField;
    dsEncabezado: TDataSource;
    procedure ibEliminarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dsEncabezadoDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
    id : integer;
  public
    { Public declarations }
    constructor crear(AOwner : TComponent; pntX, pntY : TPoint; p_id : integer);
  end;

var
  frmVer_notas_de_credito_en_nc: TfrmVer_notas_de_credito_en_nc;

implementation

uses IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmVer_notas_de_credito_en_nc.crear(AOwner : TComponent; pntX, pntY : TPoint; p_id : integer);
begin
   Create(AOwner);
   Left   := pntX.x;
   Top    := pntX.y;
   Width  := pntY.x;
   Height := pntY.y;
   id     := p_id;
   qyNC.Close;
   qyNC.ParamByName('P_NC').AsInteger := id;
   qyNC.Open;
end;

procedure TfrmVer_notas_de_credito_en_nc.ibEliminarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  {
  for i := 0 to dgPartidas.Count - 1 do
  begin
     if dgPartidas.Items[i].Selected then
     begin
        spDEL_NC_A_NC.ParamByName('P_NC_ORIGEN').AsInteger  := dgPartidas.Items[i].Values[0];
        spDEL_NC_A_NC.ParamByName('P_NC_DESTINO').AsInteger := id;
        spDEL_NC_A_NC.ExecProc;
        spDEL_NC_A_NC.Transaction.CommitRetaining;
        reglas.abrir_IBTabla(TIBTable(dsEncabezado.DataSet));
        reglas.refresh_IBQuery(TIBQuery(dsPartidas.DataSet));
     end;
  end;
  }
  reglas.refresh_IBQuery(qyNC);
//  reglas.abrir_IBTabla(TIBTable(dsPartidas.DataSet));
end;

procedure TfrmVer_notas_de_credito_en_nc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsEncabezado.DataSet := nil;
  dsPartidas.DataSet   := nil;
  inherited;
end;

procedure TfrmVer_notas_de_credito_en_nc.dsEncabezadoDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsEncabezado.DataSet <> nil then
  begin
     ibEliminar.Enabled := dsEncabezado.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar';
  end
end;

end.
