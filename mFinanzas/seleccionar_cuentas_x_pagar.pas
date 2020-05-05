unit seleccionar_cuentas_x_pagar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons, System.Variants;

type
  TfrmSeleccionar_cuentas_x_pagar = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_REFERENCIA: TIBStringField;
    qySeleccionarRN_PROVEEDOR: TIntegerField;
    qySeleccionarR_PROVEEDOR_CLAVE: TIBStringField;
    qySeleccionarR_PROVEEDOR_NOMBRE: TIBStringField;
    qySeleccionarRN_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qySeleccionarRN_DOCUMENTO: TIntegerField;
    qySeleccionarR_FECHA_ALTA: TDateTimeField;
    qySeleccionarR_FECHA_VENCIMIENTO: TDateTimeField;
    qySeleccionarR_IMPORTE_INICIAL: TFloatField;
    qySeleccionarR_SALDO_ACTUAL: TFloatField;
    qySeleccionarR_VENCIMIENTOS: TIntegerField;
    qySeleccionarRN_ALMACEN: TIntegerField;
    qySeleccionarRN_ALMACEN_CLAVE: TIBStringField;
    qySeleccionarRN_ALMACEN_NOMBRE: TIBStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
     proceso    : integer;
     procedure buscar; override;
     procedure agregar; override;
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
  end;

var
  frmSeleccionar_cuentas_x_pagar: TfrmSeleccionar_cuentas_x_pagar;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmSeleccionar_cuentas_x_pagar.Crear(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
begin
   CrearObj(AOwner, sup.x, sup.y, inf.x, inf. y);
   proceso    := p_proceso;
end;

procedure TfrmSeleccionar_cuentas_x_pagar.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_cuentas_x_pagar.agregar;
begin
   spAdd.Params.Clear;
   case proceso of
     1: begin
        end;
     2: begin
           TIBTable(dsDestino.DataSet).FieldByName('ID_REFERENCIA').AsInteger   := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_X_PAGAR';
           TIBTable(dsDestino.DataSet).FieldByName('CLIENTE').AsVariant         := null;
           TIBTable(dsDestino.DataSet).FieldByName('EXTENSION').AsVariant       := null;
           TIBTable(dsDestino.DataSet).FieldByName('PROVEEDOR').AsInteger       := dsFuente.DataSet.FieldByName('RN_PROVEEDOR').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('ALMACEN').AsVariant         := dsFuente.DataSet.FieldByName('RN_ALMACEN').AsVariant;
        end;
   end;
   Close;
end;

procedure TfrmSeleccionar_cuentas_x_pagar.FormCreate(Sender: TObject);
begin
  todos := '';
  tabla := 'VER_CUENTAS_X_PAGAR(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_PROVEEDOR_NOMBRE';
end;

end.
