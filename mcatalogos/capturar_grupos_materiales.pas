unit capturar_grupos_materiales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
      Menus, Buttons,   Grids, DBGrids;

type
  TfrmCapturar_grupos_materiales = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarNOMBRE: TIBStringField;
    Label1: TLabel;
    deNombre: TDBEdit;
    dgGrupoMaterialesDetalle: TDBGrid;
    fpUnidades: TPanel;
    dsDetalle: TDataSource;
    TCapturarP_ID: TIntegerField;
    qyDetalle: TIBQuery;
    qyDetalleR_ID: TIntegerField;
    qyDetalleR_GRUPO_MATERIAL: TIntegerField;
    qyDetalleR_MATERIAL: TIntegerField;
    qyDetalleR_MATERIAL_CLAVE: TIBStringField;
    qyDetalleR_MATERIAL_DESCRIPCION: TIBStringField;
    qyDetalleR_UNIDAD_BASE: TIntegerField;
    qyDetalleR_CALIDAD: TIntegerField;
    qyDetalleR_UNIDAD_BASE_DESCRIPCION: TIBStringField;
    qyDetalleR_CALIDAD_NOMBRE: TIBStringField;
    spDEL_MATERIAL_A_GRUPO: TIBStoredProc;
    ibNuevaPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_grupos_materiales: TfrmCapturar_grupos_materiales;

implementation

uses IBModulo, explorar_grupos_materiales, reglas_de_negocios,
  seleccionar_material_grupos;

{$R *.DFM}

procedure TfrmCapturar_grupos_materiales.ibNuevoClick(Sender: TObject);
begin
  inherited;
  deNombre.SetFocus;
end;

procedure TfrmCapturar_grupos_materiales.ibModificarClick(Sender: TObject);
begin
  inherited;
  deNombre.SetFocus;
end;

procedure TfrmCapturar_grupos_materiales.dsFuenteDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  qyDetalle.Close;
  qyDetalle.ParamByName('P_GRUPO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyDetalle.Open;
end;

procedure TfrmCapturar_grupos_materiales.NuevaPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_grupos_materiales.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_grupos_materiales.ibNuevaPartidaClick(
  Sender: TObject);
var
   pnt  : TPoint;
   pnt2 : TPoint;
begin
  inherited;
  pnt  := fpPadre.ClientToScreen(Point(0,0));
  pnt2 := dgGrupoMaterialesDetalle.ClientToScreen(Point(0,0));
  frmSeleccionar_material_grupos                   := TfrmSeleccionar_material_grupos.Crear(Application,pnt.x, 0, dgGrupoMaterialesDetalle.width, pnt2.y, dsFuente.DataSet.FieldByName('ID').AsInteger);
  frmSeleccionar_material_grupos.dsDestino.DataSet := qyDetalle;
  frmSeleccionar_material_grupos.ShowModal;
  frmSeleccionar_material_grupos.Free;
end;

procedure TfrmCapturar_grupos_materiales.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
   spDEL_MATERIAL_A_GRUPO.ParamByName('P_ID').AsInteger := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
   spDEL_MATERIAL_A_GRUPO.ExecProc;
   spDEL_MATERIAL_A_GRUPO.Transaction.CommitRetaining;
   reglas.refresh_IBQuery(qyDetalle);
end;

end.
