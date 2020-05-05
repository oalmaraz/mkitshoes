unit seleccionar_notas_de_credito;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmSeleccionar_notas_de_credito = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_FECHA_ALTA: TDateTimeField;
    qySeleccionarR_FECHA_COMPRA: TDateTimeField;
    qySeleccionarR_FECHA_VENCIMIENTO: TDateTimeField;
    qySeleccionarR_REFERENCIA: TIBStringField;
    qySeleccionarR_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qySeleccionarR_DOCUMENTO: TIntegerField;
    qySeleccionarR_CLIENTE_NOMBRE: TIBStringField;
    qySeleccionarR_CLIENTE_RAZON_SOCIAL: TIBStringField;
    qySeleccionarRN_EXTENSION: TIntegerField;
    qySeleccionarRN_EXTENSION_NOMBRE: TIBStringField;
    dsEncabezado: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    proceso : integer;
    id      : integer;
  protected
     procedure buscar; override;
     procedure agregar; override;
     procedure eliminar; override;
  public
    { Public declarations }
    constructor crear(AOwner : TComponent; pntX, pntY : TPoint; p_proceso : integer);
    constructor crearB(AOwner : TComponent; pntX, pntY : TPoint; p_proceso, p_id : integer);
  end;

var
  frmSeleccionar_notas_de_credito: TfrmSeleccionar_notas_de_credito;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios, ver_notas_de_credito_en_nc;

{$R *.DFM}

constructor TfrmSeleccionar_notas_de_credito.crear(AOwner : TComponent; pntX, pntY : TPoint; p_proceso : integer);
begin
   crearObj(AOwner, pntX.x, pntX.y, pntY.x, pntY.y);
   proceso := p_proceso;
end;

constructor TfrmSeleccionar_notas_de_credito.crearB(AOwner : TComponent; pntX, pntY : TPoint; p_proceso, p_id : integer);
begin
   crear(AOwner, pntX, pntY, p_proceso);
   id := p_id;
end;

procedure TfrmSeleccionar_notas_de_credito.agregar;
begin
   case proceso of
     1 : begin
            if dsEncabezado.DataSet.FieldByName('ESTATUS').AsString = 'Sin Afectar' then
            begin
               spAdd.ParamByName('P_NC_ORIGEN').AsInteger  := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
               spAdd.ParamByName('P_NC_DESTINO').AsInteger := id;
               spAdd.ExecProc;
               spAdd.Transaction.CommitRetaining;
               reglas.abrir_IBTabla(TIBTable(dsEncabezado.DataSet));
               reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
               reglas.refresh_IBQuery(qySeleccionar);
            end;
         end;
   end;
end;

procedure TfrmSeleccionar_notas_de_credito.eliminar;
var
   pntA : TPoint;
   pntB : TPoint;
begin
   case proceso of
     1 : begin
            pntA   := frmSeleccionar_notas_de_credito.ClientToScreen(Point(0,0));
            pntB.x := frmSeleccionar_notas_de_credito.Width;
            pntB.y := frmSeleccionar_notas_de_credito.Height;
            frmVer_notas_de_credito_en_nc := TfrmVer_notas_de_credito_en_nc.crear(Application, pntA, pntB, id);
            frmVer_notas_de_credito_en_nc.dsEncabezado.DataSet := TIBTable(dsEncabezado.DataSet);
            frmVer_notas_de_credito_en_nc.dsPartidas.DataSet   := TIBQuery(dsDestino.DataSet);
            frmVer_notas_de_credito_en_nc.ShowModal;
            frmVer_notas_de_credito_en_nc.Free;
         end;
   end;
end;

procedure TfrmSeleccionar_notas_de_credito.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_notas_de_credito.FormCreate(Sender: TObject);
begin
  todos := '';
  tabla := 'VER_NOTAS_DE_CREDITO(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_CLIENTE_NOMBRE';
end;

procedure TfrmSeleccionar_notas_de_credito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsEncabezado.DataSet := nil;
  inherited;
end;

end.
