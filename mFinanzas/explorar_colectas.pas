unit explorar_colectas;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,
      ExtCtrls, Menus,
   IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
    Mask, DBCtrls,
    jpeg,   
  ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_colectas = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_CAJA_NOMBRE: TIBStringField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_USUARIO_NOMBRE: TIBStringField;
    qyExplorarR_REFERENCIA: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_ALMACEN_CLAVE: TIBStringField;
    qyExplorarR_ALMACEN_NOMBRE: TIBStringField;
    qyVer_Datos_Cajero: TIBQuery;
    qyVer_Datos_CajeroR_ID: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN: TIntegerField;
    qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField;
    qyVer_Datos_CajeroR_USUARIO: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField;
    qyVer_Datos_CajeroR_BAJA: TIBStringField;
    qyVer_Datos_CajeroR_ESTATUS: TIBStringField;
    qyVer_Datos_CajeroR_REGISTROS: TIntegerField;
    qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField;
    dsVer_Datos_Cajero: TDataSource;
    Shape3: TShape;
    Label24: TLabel;
    Shape17: TShape;
    Shape4: TShape;
    deUsuario: TDBEdit;
    deAlmacen: TDBEdit;
    Shape9: TShape;
    edFecha: TEdit;
    Shape10: TShape;
    Shape7: TShape;
    Shape8: TShape;
    deCaja: TDBEdit;
    Shape1: TShape;
    hlEstatus: TBitBtn;
    cbAlmacenes: TDBLookupComboBox;
    cbCajas: TDBLookupComboBox;
    JvHotLink1: TBitBtn;
    cbFecha: TDateTimePicker;
    JvHotLink2: TBitBtn;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_USUARIO_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure hlEstatusClick(Sender: TObject);
    procedure JvHotLink1Click(Sender: TObject);
    procedure cbAlmacenesChange(Sender: TObject);
    procedure JvHotLink2Click(Sender: TObject);
    procedure cbFechaChange(Sender: TObject);
  private
    { Private declarations }
    awrAlmacen : integer;
    awrFecha   : TDatetime;
    procedure setAlmacen(valor : integer);
    procedure setFecha(valor : TDatetime);
  protected 
    procedure Parametros; override;
  public
    { Public declarations }
  published
     property ALMACEN : integer read awrAlmacen write setAlmacen;
     property FECHA   : TDatetime read awrFecha write setFecha;
  end;

var
  frmExplorar_colectas: TfrmExplorar_colectas;

implementation

uses USqlAnaliza, inifiles, reglas_de_negocios, IBModulo, IBData, autorizacion;

{$R *.DFM}

procedure TfrmExplorar_colectas.Parametros;
var
   caja : integer;
begin
   if cbCajas.Visible then
      caja := cbCajas.KeyValue
   else
      caja := dsVer_Datos_Cajero.DataSet.FieldByName('R_ID').AsInteger;

   sqlExp.setParam(sqlExp.dameParam('P_ALMACEN'), ALMACEN, psCadena);
   sqlExp.setParam(sqlExp.dameParam('P_CAJA'),    caja,    psCadena);
   sqlExp.setParam(sqlExp.dameParam('P_INICIAL'), FECHA,   psFecha);
   sqlExp.setParam(sqlExp.dameParam('P_FINAL'),   FECHA,   psFecha);
end;

procedure TfrmExplorar_colectas.setFecha(valor : TDatetime);
begin
   awrFecha := valor;
   edFecha.Text := FormatDateTime('dd/mm/yyyy', valor);
end;

procedure TfrmExplorar_colectas.setAlmacen(valor : integer);
begin
   awrAlmacen := valor;
   reglas.abrir_IBTabla(dmIBData.TFiltroCajas2);
   dmIBData.TFiltroCajas2.Filter := 'ID > 0 AND TIPO_DE_CAJA = "Ventas" AND ALMACEN = '+IntToStr(valor);
end;

procedure TfrmExplorar_colectas.FormCreate(Sender: TObject);
var
   error : boolean;
begin
  error := False;
  inherited;
  //datos que tienen que ver con el cajero y su caja
  qyVer_Datos_Cajero.Close;
  qyVer_Datos_Cajero.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyVer_Datos_Cajero.Open;

  dmIBData.spFECHA_SERVIDOR_SH.ExecProc;
  FECHA := dmIBData.spFECHA_SERVIDOR_SH.ParamByName('R_FECHA').AsDateTime;

   if qyVer_Datos_Cajero.IsEmpty then
   begin
      error := True;
      ShowMessage('Usuario. No tiene asignada ninguna caja para operar el punto de venta.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_BAJA').AsString = 'Si' then
   begin
      error := True;
      ShowMessage('Usuario. Dado de baja, por el administrador del sistema.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_ESTATUS').AsString = 'Fuera de Operacion' then
   begin
      error := True;
      ShowMessage('Fuera de Operacion. Temporalmente fue suspendida la caja, consulte al administrador del sistema.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_REGISTROS').AsInteger > 1 then
   begin
      error := True;
      ShowMessage('Cajas. El usuario tiene asignado a el, mas de una caja.');
   end;

  if error then
     Close
  else
  begin
     ALMACEN    := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;
     ViewSearch := false;
     EXP_NVO    := true;
     FForma     := 'frmCapturar_colectas';
  end;
end;

procedure TfrmExplorar_colectas.hlEstatusClick(Sender: TObject);
var
   ejecutar : boolean;
begin
  inherited;
  ejecutar := true;
  if not(cbAlmacenes.Visible) then
  begin
     if reglas.dameUsuarioNivel < 3 then
     begin
        frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
        frmAutorizacion.ShowModal;
        ejecutar := frmAutorizacion.dame_respuesta;
        frmAutorizacion.Free;
     end;

     if ejecutar then
     begin
        reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
        dmIBData.TFiltroAlmacenes.Filter := 'ID > 0';
        cbAlmacenes.Visible := true;
        cbAlmacenes.Keyvalue := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN').asInteger;
     end;
   end
   else
      begin
         ALMACEN := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN').AsInteger;
         cbAlmacenes.Visible := false;
      end;
end;

procedure TfrmExplorar_colectas.JvHotLink1Click(Sender: TObject);
var
   ejecutar : boolean;
begin
  inherited;
  ejecutar := true;
  if not(cbCajas.Visible) then
  begin
     if reglas.dameUsuarioNivel < 3 then
     begin
        frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
        frmAutorizacion.ShowModal;
        ejecutar := frmAutorizacion.dame_respuesta;
        frmAutorizacion.Free;
     end;

     if ejecutar then
     begin
        cbCajas.Visible := true;
        cbCajas.KeyValue := dsVer_Datos_Cajero.DataSet.FieldByName('R_ID').AsInteger;
     end;
   end
   else
      cbCajas.Visible := false;
end;

procedure TfrmExplorar_colectas.cbAlmacenesChange(Sender: TObject);
begin
  inherited;
  ALMACEN := cbAlmacenes.KeyValue;
end;

procedure TfrmExplorar_colectas.JvHotLink2Click(Sender: TObject);
var
   ejecutar : boolean;
begin
  inherited;
  ejecutar := true;
  if not(cbFecha.Visible) then
  begin
     if reglas.dameUsuarioNivel < 3 then
     begin
        frmAutorizacion := TfrmAutorizacion.Crear(Application, 3);
        frmAutorizacion.ShowModal;
        ejecutar := frmAutorizacion.dame_respuesta;
        frmAutorizacion.Free;
     end;

     if ejecutar then
     begin
        cbFecha.Visible := true;
        cbFecha.Date    := FECHA;
     end;
   end
   else
      begin
         cbFecha.Visible := false;
         FECHA := dmIBData.spFECHA_SERVIDOR_SH.ParamByName('R_FECHA').AsDate;
      end;
end;

procedure TfrmExplorar_colectas.cbFechaChange(Sender: TObject);
begin
  inherited;
  FECHA := cbFecha.Date;
end;

end.
