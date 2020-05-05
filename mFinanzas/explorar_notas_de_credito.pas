unit explorar_notas_de_credito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    Menus,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
      ComCtrls, Grids, DBGrids,
  Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_notas_de_credito = class(TfrmExplorarMDI)
    qyConstructor_Detalle: TIBQuery;
    qyConstructor_DetalleID: TIntegerField;
    qyConstructor_DetalleCONSTRUCTOR: TIntegerField;
    qyConstructor_DetalleUSR_CAMPO: TIBStringField;
    qyConstructor_DetalleUSR_SENTENCIA: TIBStringField;
    qyConstructor_DetalleUSR_LOGICA: TIBStringField;
    qyConstructor_DetalleUSR_VALOR: TIBStringField;
    qyConstructor_DetalleBD_CAMPO: TIBStringField;
    qyConstructor_DetalleBD_SENTENCIA: TIBStringField;
    qyConstructor_DetalleBD_LOGICA: TIBStringField;
    qyConstructor_DetalleBD_VALOR: TIBStringField;
    dsConstructor_Detalle: TDataSource;
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_ALMACEN_CLAVE: TIBStringField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_MONEDA_CLAVE: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    qyExplorarR_CLIENTE: TIBStringField;
    qyExplorarR_C_NOMBRE: TIBStringField;
    qyExplorarR_REFERENCIA: TIBStringField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_EXTENSION: TIBStringField;
    qyExplorarR_E_NOMBRE: TIBStringField;
    qyExplorarR_DEVOLUCION_PRODUCTO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_C_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_E_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_DEVOLUCION_PRODUCTO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure OnClickMio(Sender : TObject);
    procedure armar_sql;
  public
    { Public declarations }
    constructor CrearParaPagos(AOwner : TComponent; PX, PY : TPoint; pConstructor : integer);
    procedure Mostrar(p_cuantos : integer);
  end;

var
  frmExplorar_notas_de_credito: TfrmExplorar_notas_de_credito;

implementation

uses capturar_notas_de_credito, reglas_de_negocios;

{$R *.DFM}

procedure TfrmExplorar_notas_de_credito.Mostrar(p_cuantos : integer);
begin
   if p_cuantos = 1 then
   begin
      OnClickMio(Self);
      Close;
   end
   else
      begin
         ShowModal;
      end;
end;

procedure TfrmExplorar_notas_de_credito.OnClickMio(Sender : TObject);
begin
   frmCapturar_notas_de_credito := TfrmCapturar_notas_de_credito.CrearParaPagos(Application);
   frmCapturar_notas_de_credito.ShowModal;
   frmCapturar_notas_de_credito.Free;
//   reglas.refresh_IBQuery(qyExplorar);
end;

procedure TfrmExplorar_notas_de_credito.armar_sql;
{var
   primero : boolean;
   valor   : string;}
begin
{   primero := False;
   qyExplorar.Close;
   qyExplorar.SQL.Clear;
   qyExplorar.SQL.Add('SELECT '+select);
   if select2 <> '' then
      qyExplorar.SQL.Add(', '+select2);
   qyExplorar.SQL.Add('FROM '+tabla);

   dsConstructor_Detalle.DataSet.First;
   while not(dsConstructor_Detalle.DataSet.Eof) do
   begin
      if not(primero) then
      begin
         valor := 'WHERE '+whereAlways+'( ( '+dsConstructor_Detalle.DataSet.FieldByName('BD_CAMPO').AsString+' '+dsConstructor_Detalle.DataSet.FieldByName('BD_SENTENCIA').AsString+' '+dsConstructor_Detalle.DataSet.FieldByName('BD_VALOR').AsString+' )';
         qyExplorar.SQL.Add(valor);
         primero := True;
      end
      else
         begin
            valor := dsConstructor_Detalle.DataSet.FieldByName('BD_LOGICA').AsString+' ( '+dsConstructor_Detalle.DataSet.FieldByName('BD_CAMPO').AsString+' '+dsConstructor_Detalle.DataSet.FieldByName('BD_SENTENCIA').AsString+' '+dsConstructor_Detalle.DataSet.FieldByName('BD_VALOR').AsString+' )';
            qyExplorar.SQL.Add(valor);
         end;
      dsConstructor_Detalle.DataSet.Next;
   end;
   if primero then
      qyExplorar.SQL.Add(' )');
   ARecord := campos.Items[0];
   qyExplorar.SQL.Add('ORDER BY '+ARecord^.nombre);
   qyExplorar.Open;}
end;

constructor TfrmExplorar_notas_de_credito.CrearParaPagos(AOwner : TComponent; PX, PY : TPoint; pConstructor : integer);
begin
   Create(AOwner);
   Self.FormStyle        := fsNormal;
   Self.WindowState      := wsMaximized;
   Self.Visible          := false;
{   Self.Left             := PX.x;
   Self.Top              := PX.y;
   Self.Width            := PY.x;
   Self.Height           := PY.y;}
   ibPantalla.OnClick    := OnClickMio;
   ibConstructor.Enabled := false;
   ibVer.Enabled         := false;

   qyConstructor_Detalle.Close;
   qyConstructor_Detalle.ParamByName('P_ID').AsInteger := pConstructor;
   qyConstructor_Detalle.Open;
   armar_sql;

{   qyExplorar.SQL        := p_sql;
   qyExplorar.Close;
   qyExplorar.ParamByName('P_POSICION').AsInteger  := 0;
   qyExplorar.ParamByName('P_REGISTRO').AsInteger  := 0;
   qyExplorar.ParamByName('P_REGISTROS').AsInteger :=-1;
   qyExplorar.ParamByName('P_A_DONDE').AsInteger   := 0;
   qyExplorar.Open;}
end;

procedure TfrmExplorar_notas_de_credito.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_notas_de_credito';
end;

end.
