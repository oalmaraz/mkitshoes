unit seleccionar_descuentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  IBX.IBStoredProc, Menus, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,   Grids, DBGrids, Buttons, System.Variants;

type
  TfrmSeleccionar_descuentos = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_DESCRIPCION: TIBStringField;
    qySeleccionarR_DESCUENTO_PORC: TFloatField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
     proceso    : integer;
     encabezado : integer;
     procedure buscar; override;
     procedure agregar; override;
     procedure eliminar; override;
  public
    { Public declarations }
    constructor CrearA(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
    constructor CrearB(AOwner : TComponent; sup, inf : TPoint; p_encabezado, p_proceso : integer);
  end;

var
  frmSeleccionar_descuentos: TfrmSeleccionar_descuentos;

implementation

uses IBModulo, reglas_de_negocios, IBX.IBTable;

{$R *.DFM}

constructor TfrmSeleccionar_descuentos.CrearA(AOwner : TComponent; sup, inf : TPoint; p_proceso : integer);
begin
   CrearObj(AOwner, sup.x, sup.y, inf.x, inf. y);
   proceso := p_proceso;
end;

constructor TfrmSeleccionar_descuentos.CrearB(AOwner : TComponent; sup, inf : TPoint; p_encabezado, p_proceso : integer);
begin
   CrearA(AOwner, sup, inf, p_proceso);
   encabezado := p_encabezado;
end;

procedure TfrmSeleccionar_descuentos.eliminar;
begin
   spDel.Params.Clear;
   case proceso of
     1: begin
           spDel.StoredProcName := 'DEL_DESCUENTOS_EXTENSIONES';
           spDel.Params.CreateParam(ftInteger,'P_ID',ptInput);
           spDel.ParamByName('P_ID').AsInteger := dsDestino.DataSet.FieldByName('R_ID').AsInteger;
           spDel.ExecProc;
           spDel.Transaction.CommitRetaining;
           reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
        end;
     2: begin
           TIBTable(dsDestino.DataSet).FieldByName('CONCEPTO').AsVariant   := null;
           TIBTable(dsDestino.DataSet).FieldByName('DESCRIPCION').AsString := '';
           TIBTable(dsDestino.DataSet).FieldByName('DESC_PORC').AsFloat    := 0.00;
        end;
   end;
end;

procedure TfrmSeleccionar_descuentos.agregar;
begin
   spAdd.Params.Clear;
   case proceso of
     1: begin
        {
           idFactor.Entrada := dsFuente.DataSet.FieldByName('R_DESCUENTO_PORC').AsString;
           idFactor.Execute;
           if idFactor.Respuesta and (idFactor.Entrada <> '') then
           begin
              spAdd.StoredProcName := 'ADD_DESCUENTOS_EXTENSIONES';
              spAdd.Params.CreateParam(ftInteger,'P_EXTENSION',ptInput);
              spAdd.Params.CreateParam(ftInteger,'P_DESCUENTO',ptInput);
              spAdd.Params.CreateParam(ftFloat  ,'P_FACTOR'   ,ptInput);
              spAdd.ParamByName('P_EXTENSION').AsInteger := encabezado;
              spAdd.ParamByName('P_DESCUENTO').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
              spAdd.ParamByName('P_FACTOR').AsFloat      := StrToFloat(idFactor.Entrada);
              spAdd.ExecProc;
              spAdd.Transaction.CommitRetaining;

              reglas.refresh_IBQuery(TIBQuery(dsDestino.DataSet));
           end;
           }
        end;
     2: begin
           TIBTable(dsDestino.DataSet).FieldByName('CONCEPTO').AsInteger   := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('DESCRIPCION').AsString := dsFuente.DataSet.FieldByName('R_DESCRIPCION').AsString;
           TIBTable(dsDestino.DataSet).FieldByName('DESC_PORC').AsFloat    := dsFuente.DataSet.FieldByName('R_DESCUENTO_PORC').AsFloat;
           dsDestino.DataSet := nil;
           Close;
        end;
     3: begin
           TIBTable(dsDestino.DataSet).FieldByName('CONCEPTO').AsInteger   := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
           TIBTable(dsDestino.DataSet).FieldByName('DESCRIPCION').AsString := dsFuente.DataSet.FieldByName('R_DESCRIPCION').AsString;
           TIBTable(dsDestino.DataSet).FieldByName('PORCENTAJE').AsFloat   := dsFuente.DataSet.FieldByName('R_DESCUENTO_PORC').AsFloat;
           dsDestino.DataSet := nil;
           Close;
        end;
   end;
end;

procedure TfrmSeleccionar_descuentos.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_descuentos.FormCreate(Sender: TObject);
begin
  todos := '';
  tabla := 'VER_DESCUENTO_S(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_DESCRIPCION';
end;

end.
