unit capturar_seguimiento_cobranza;

interface

uses
  UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,
      StdCtrls,
     Db,
  IBX.IBCustomDataSet, IBX.IBQuery,    Buttons, Grids,
  DBGrids;

type
  TfrmCapturar_SeguimientoCobranza = class(TfrmPadre)
    ceMayorA: TEdit;
    Label1: TLabel;
    dgSeguimiento: TDBGrid;
    seColumnas: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ceMenorQue: TEdit;
    qySeguimiento: TIBQuery;
    dsSeguimiento: TDataSource;
    ibBusqueda: TBitBtn;
    ibCerrar: TBitBtn;
    ibImprimir: TBitBtn;
    procedure seColumnasChange(Sender: TObject);
    procedure ibBusquedaClick(Sender: TObject);
    procedure ibCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgSeguimientoColumn1ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn2ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn4ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn5ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn6ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn7ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn8ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn9ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgSeguimientoColumn10ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    procedure verEdoDeCta(p_cliente : string);
  public
    { Public declarations }
  end;

var
  frmCapturar_SeguimientoCobranza: TfrmCapturar_SeguimientoCobranza;

implementation

uses IBModulo, reglas_de_negocios, UfrmEstadoDeCuentas;

{$R *.DFM}



procedure TfrmCapturar_SeguimientoCobranza.seColumnasChange(
  Sender: TObject);
var
   i : integer;
begin
  inherited;

end;

procedure TfrmCapturar_SeguimientoCobranza.ibBusquedaClick(
  Sender: TObject);
begin
  inherited;

  qySeguimiento.Close;
  qySeguimiento.ParamByName('P_MAYOR_A').AsString   := ceMayorA.Text;
  qySeguimiento.ParamByName('P_MENOR_QUE').AsString := ceMenorQue.Text;
  qySeguimiento.ParamByName('P_COLUMNAS').AsInteger := StrToInt(seColumnas.Text);
  qySeguimiento.Open;
end;

procedure TfrmCapturar_SeguimientoCobranza.ibCerrarClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmCapturar_SeguimientoCobranza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCapturar_SeguimientoCobranza.verEdoDeCta(p_cliente : string);
var
   i       : integer;
   iFound  : integer;
begin
   iFound := -1;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].name = 'frmEstadoDeCuentas' then
      begin
         iFound := i;
         break;
      end;

   if iFound >= 0 then
   begin
      frmEstadoDeCuentas.Show;
      frmEstadoDeCuentas.Cliente := p_cliente;
   end
   else
     begin
        frmEstadoDeCuentas         := TfrmEstadoDeCuentas.Create(Application);
        frmEstadoDeCuentas.Tipo    := tfEstadoCtas;
        frmEstadoDeCuentas.Usuario := reglas.dame_usuario;
        frmEstadoDeCuentas.Nivel   := reglas.dameUsuarioNivel;
        frmEstadoDeCuentas.Show;
        frmEstadoDeCuentas.Cliente := p_cliente;
     end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn1ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID1').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA1').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn2ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID2').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA2').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn3ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID3').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA3').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn4ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID4').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA4').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn5ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID5').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA5').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn6ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID6').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA6').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn7ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID7').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA7').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn8ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID8').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA8').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn9ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID9').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA9').AsString);
  end
end;

procedure TfrmCapturar_SeguimientoCobranza.dgSeguimientoColumn10ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if dsSeguimiento.DataSet.FieldByName('R_ID10').AsString <> '' then
  begin
     verEdoDeCta(dsSeguimiento.DataSet.FieldByName('R_COLUMNA10').AsString);
  end
end;

end.
