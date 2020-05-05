unit seleccionar_cuentas_por_cobrar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons, System.Variants;

type
  TfrmSeleccionar_cuentas_por_cobrar = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_REFERENCIA: TIBStringField;
    qySeleccionarRN_CLIENTE: TIntegerField;
    qySeleccionarR_CLIENTE_NOMBRE: TIBStringField;
    qySeleccionarR_CLIENTE_CLAVE: TIBStringField;
    qySeleccionarRN_EXTENSION: TIntegerField;
    qySeleccionarRN_EXTENSION_CLAVE: TIBStringField;
    qySeleccionarRN_EXTENSION_NOMBRE: TIBStringField;
    qySeleccionarRN_ALMACEN: TIntegerField;
    qySeleccionarR_ALMACEN_NOMBRE: TIBStringField;
    qySeleccionarRN_NUMERO_DE_DOCUMENTOS: TIntegerField;
    qySeleccionarRN_DOCUMENTO: TIntegerField;
    qySeleccionarR_FECHA: TDateTimeField;
    qySeleccionarR_FECHA_VENCIMIENTO: TDateTimeField;
    qySeleccionarR_IMPORTE_INICIAL: TFloatField;
    qySeleccionarRN_SALDO_ACTUAL: TFloatField;
    qySeleccionarR_VENCIMIENTOS: TIntegerField;
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
  frmSeleccionar_cuentas_por_cobrar: TfrmSeleccionar_cuentas_por_cobrar;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmSeleccionar_cuentas_por_cobrar.Crear(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
begin
   CrearObj(AOwner, sup.x, sup.y, inf.x, inf. y);
   proceso    := p_proceso;
end;

procedure TfrmSeleccionar_cuentas_por_cobrar.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_cuentas_por_cobrar.agregar;
begin
   spAdd.Params.Clear;
   case proceso of
     1: begin
           TIBTable(dsDestino.DataSet).FieldByName('CUENTA_POR_COBRAR').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('CLIENTE').AsInteger           := dsFuente.DataSet.FieldByName('RN_CLIENTE').AsInteger;
           if(dsFuente.DataSet.FieldByName('RN_EXTENSION').AsString <> '')then
              TIBTable(dsDestino.DataSet).FieldByName('EXTENSION').AsInteger      := dsFuente.DataSet.FieldByName('RN_EXTENSION').AsInteger
           else
              TIBTable(dsDestino.DataSet).FieldByName('EXTENSION').AsVariant      := null;
           TIBTable(dsDestino.DataSet).FieldByName('ALMACEN').AsInteger           := dsFuente.DataSet.FieldByName('RN_ALMACEN').AsInteger;
           dsDestino.DataSet := nil;
        end;
     2: begin
           TIBTable(dsDestino.DataSet).FieldByName('ID_REFERENCIA').AsInteger   := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('TABLA_REFERENCIA').AsString := 'CUENTAS_POR_COBRAR';
           TIBTable(dsDestino.DataSet).FieldByName('CLIENTE').AsInteger         := dsFuente.DataSet.FieldByName('RN_CLIENTE').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('EXTENSION').AsVariant       := dsFuente.DataSet.FieldByName('RN_EXTENSION').AsVariant;
           TIBTable(dsDestino.DataSet).FieldByName('ALMACEN').AsInteger         := dsFuente.DataSet.FieldByName('RN_ALMACEN').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('PROVEEDOR').AsVariant       := null;
        end;
   end;
   Close;   
end;

procedure TfrmSeleccionar_cuentas_por_cobrar.FormCreate(Sender: TObject);
begin
  todos := '';
  tabla := 'VER_ESTADO_DE_CUENTA(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_CLIENTE_NOMBRE';
end;

end.
