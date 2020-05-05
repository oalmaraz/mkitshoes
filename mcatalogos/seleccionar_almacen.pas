unit seleccionar_almacen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmSeleccionar_Almacen = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_NOMBRE: TIBStringField;
    qySeleccionarR_COMPRA: TIBStringField;
    qySeleccionarR_VENDE: TIBStringField;
    qySeleccionarR_TRANSFORMA: TIBStringField;
    qySeleccionarR_FECHA_ALTA: TDateTimeField;
    qySeleccionarR_RESPONSABLE: TIntegerField;
    qySeleccionarR_OBSERVACIONES: TBlobField;
    qySeleccionarR_SERIE_FACTURA: TIBStringField;
    qySeleccionarR_CONSECUTIVO: TIntegerField;
    qySeleccionarR_FECHA_ULT_INV: TDateTimeField;
    qySeleccionarR_ESTATUS: TIBStringField;
    qySeleccionarR_RESPONSABLE_NOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
     procedure agregar; override;
     procedure buscar; override;
  public
    { Public declarations }
  end;

var
  frmSeleccionar_Almacen: TfrmSeleccionar_Almacen;

implementation

uses IBModulo, reglas_de_negocios, IBX.IBTable;

{$R *.DFM}

procedure TfrmSeleccionar_Almacen.agregar;
begin
   TIBTable(dsDestino.DataSet).FieldByName('ALMACEN').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
   dsDestino.DataSet := nil;
   Close;
end;

procedure TfrmSeleccionar_Almacen.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_Almacen.FormCreate(Sender: TObject);
begin
  todos := '';
  tabla := 'VER_ALMACEN_ES(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_NOMBRE';
end;

end.
