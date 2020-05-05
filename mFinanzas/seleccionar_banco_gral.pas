unit seleccionar_banco_gral;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons, System.Variants;

type
  TfrmSeleccionar_bancos_gral = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_NOMBRE: TIBStringField;
    qySeleccionarR_CUENTA: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    proceso : integer;
  protected
    procedure agregar; override;
    procedure eliminar; override;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
  end;

var
  frmSeleccionar_bancos_gral: TfrmSeleccionar_bancos_gral;

implementation

uses IBModulo;

{$R *.DFM}

procedure TfrmSeleccionar_bancos_gral.agregar;
begin
   case proceso of
     1: begin
           dsDestino.DataSet.FieldByName('BANCO').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           close;
        end;
   end;
end;

procedure TfrmSeleccionar_bancos_gral.eliminar;
begin
   case proceso of
     1: begin
           dsDestino.DataSet.FieldByName('BANCO').AsVariant := null;
           close;
        end;
   end;
end;

constructor TfrmSeleccionar_bancos_gral.Crear(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
begin
   CrearObj(AOwner, sup.x, sup.y, inf.x, inf. y);
   proceso    := p_proceso;
end;

procedure TfrmSeleccionar_bancos_gral.FormCreate(Sender: TObject);
begin
  todos := 'WHERE R_ID = 0';
  tabla := 'BANCOS';
  inherited;
  todos := 'WHERE R_ID > 0';
  laCampo.Caption := 'R_NOMBRE';
end;

end.
