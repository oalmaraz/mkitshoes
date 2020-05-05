unit seleccionar_unidades;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,      IBX.IBStoredProc,
  Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,   DBCtrls,
  StdCtrls, Mask,      jpeg,
   ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmSeleccionar_Unidades = class(TfrmSeleccionar)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure agregar; override;
    procedure eliminar; override;
  public
    { Public declarations }
  end;

var
  frmSeleccionar_Unidades: TfrmSeleccionar_Unidades;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmSeleccionar_Unidades.eliminar;
begin
  spDel.ParamByName('P_UNIDAD').AsInteger := dsDestino.DataSet.FieldByName('R_ID').AsInteger;
  spDel.ExecProc;
  spDel.Transaction.CommitRetaining;
  if dsDestino.DataSet <> nil then
     reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
end;

procedure TfrmSeleccionar_Unidades.agregar;
begin
{
   idFactor.Execute;
   if idFactor.Respuesta and (idFactor.Entrada <> '') then
   begin
     spAdd.ParamByName('P_MATERIAL').AsInteger := dsDestino.Tag;
     spAdd.ParamByName('P_UNIDAD').AsInteger   := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spAdd.ParamByName('P_FACTOR').AsString    := idFactor.Entrada;
     spAdd.ExecProc;
     spAdd.Transaction.CommitRetaining;
     if dsDestino.DataSet <> nil then
        reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
   end;
   }
end;

procedure TfrmSeleccionar_Unidades.FormCreate(Sender: TObject);
begin
  todos := 'WHERE ID = 0';
  tabla := 'UNIDADES';
  inherited;
  todos := 'WHERE ID > 0';
  laCampo.Caption := 'DESCRIPCION';
end;

end.
