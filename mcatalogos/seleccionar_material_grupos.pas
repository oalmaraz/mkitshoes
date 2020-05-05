unit seleccionar_material_grupos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmSeleccionar_material_grupos = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_DESCRIPCION: TIBStringField;
    qySeleccionarR_UNIDAD_BASE: TIntegerField;
    qySeleccionarR_DESCRIPCION_UNIDAD: TIBStringField;
    qySeleccionarR_CODIGO_BARRAS: TIBStringField;
    qySeleccionarR_CALIDAD: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    proceso : integer;
    grupo   : integer;
  protected
    procedure eliminar; override;
    procedure agregar; override;
    procedure buscar; override;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; x1, y1, x2, y2, p_grupo : integer);
    constructor CrearA(AOwner : TComponent; PX, PY : TPoint; p_proceso : integer);
  end;

var
  frmSeleccionar_material_grupos: TfrmSeleccionar_material_grupos;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

constructor TfrmSeleccionar_material_grupos.CrearA(AOwner : TComponent; PX, PY : TPoint; p_proceso : integer);
begin
   CrearObj(AOwner, PX.x, PX.y, PY.x, PY.y);
   proceso := p_proceso;
end;

procedure TfrmSeleccionar_material_grupos.eliminar;
begin
   spAdd.Params.Clear;
   case proceso of
     1 : begin
            dsDestino.DataSet.FieldByName('MATERIAL').AsVariant   := 0;
            dsDestino.DataSet.FieldByName('DESCRIPCION').AsString := '';
         end;
   else
      begin
         spDel.StoredProcName := 'DEL_MATERIAL_A_GRUPO';
         spDel.Params.CreateParam(ftInteger,'P_ID',ptInput);
         spDel.ParamByName('P_ID').AsInteger := dsDestino.DataSet.FieldByName('R_ID').AsInteger;
         spDel.ExecProc;
         spDel.Transaction.CommitRetaining;
         if dsDestino.DataSet <> nil then
            reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
      end;
   end;
end;

constructor TfrmSeleccionar_material_grupos.Crear(AOwner : TComponent; x1, y1, x2, y2, p_grupo : integer);
begin
   CrearObj(AOwner, x1, y1, x2, y2);
   grupo := p_grupo;
end;

procedure TfrmSeleccionar_material_grupos.agregar;
begin
   spAdd.Params.Clear;
   case proceso of
     1 : begin
            dsDestino.DataSet.FieldByName('MATERIAL').AsInteger   := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
            dsDestino.DataSet.FieldByName('DESCRIPCION').AsString := dsFuente.DataSet.FieldByName('R_DESCRIPCION').AsString;
            Close;
         end;
   else
      spAdd.StoredProcName := 'ADD_MATERIAL_A_GRUPO';
      spAdd.Params.CreateParam(ftInteger,'P_GRUPO',ptInput);
      spAdd.Params.CreateParam(ftInteger,'P_MATERIAL',ptInput);
      spAdd.ParamByName('P_GRUPO').AsInteger    := grupo;
      spAdd.ParamByName('P_MATERIAL').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
      spAdd.ExecProc;
      spAdd.Transaction.CommitRetaining;
      if dsDestino.DataSet <> nil then
         reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
   end;
end;

procedure TfrmSeleccionar_material_grupos.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_material_grupos.FormCreate(Sender: TObject);
begin
  campo := 'MATERIAL';
  todos := '';
  tabla := 'SELECCIONAR_MATERIAL_ES(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_DESCRIPCION';
end;

end.
