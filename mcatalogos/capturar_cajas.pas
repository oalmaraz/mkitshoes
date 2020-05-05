unit capturar_cajas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
        Buttons;

type
  TfrmCapturar_cajas = class(TfrmCapturarMDI)
    deCaja: TDBEdit;
    leAlmacenes: TDBLookupComboBox;
    leUsuarios: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mruEstatus: TDBComboBox;
    Label4: TLabel;
    TCapturarID: TIntegerField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarALMACEN: TIntegerField;
    TCapturarUSUARIO: TIntegerField;
    TCapturarTIPO_DE_CAJA: TIBStringField;
    TCapturarESTATUS: TIBStringField;
    Label5: TLabel;
    mruTipoCaja: TDBComboBox;
    dsAlmacenes: TDataSource;
    dsUsuarios: TDataSource;
    qyUsuarios: TIBQuery;
    qyAlmacenes: TIBQuery;
    qyUsuariosR_ID: TIntegerField;
    qyUsuariosR_NOMBRE: TIBStringField;
    qyUsuariosR_BAJA: TIBStringField;
    deAlmacen: TDBEdit;
    TCapturarclave_almacen: TStringField;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    laError1: TLabel;
    laError2: TLabel;
    laError3: TLabel;
    TCapturarclave_almacenes: TStringField;
    deUsuario: TDBEdit;
    TCapturarnombre_usuario: TIBStringField;
    TCapturarnombre_usuarios: TIBStringField;
    leModulo: TDBLookupComboBox;
    Label6: TLabel;
    qyVerModuloFuncion: TIBQuery;
    qyVerModuloFuncionR_ID: TIntegerField;
    qyVerModuloFuncionR_MODULO: TIntegerField;
    qyVerModuloFuncionR_NOMBRE: TIBStringField;
    qyVerModuloFuncionR_DESCRIPCION: TIBStringField;
    qyVerModuloFuncionR_INICIALIZACION_DIARIA: TIBStringField;
    dsVerModuloFuncion: TDataSource;
    TCapturarMODULO_FUNCION: TIntegerField;
    TCapturardescripcion_funcion: TStringField;
    sbAlmacen: TSpeedButton;
    sbUsuario: TSpeedButton;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure sbAlmacenClick(Sender: TObject);
    procedure sbUsuarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_cajas: TfrmCapturar_cajas;

implementation

uses IBModulo, explorar_cajas, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmCapturar_cajas.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('TIPO_DE_CAJA').AsString := 'Desconocido';
  dsFuente.DataSet.FieldByName('ESTATUS').AsString      := 'En Operacion';
  deCaja.SetFocus;
end;

procedure TfrmCapturar_cajas.ibModificarClick(Sender: TObject);
begin
  inherited;
  deCaja.SetFocus;
end;

procedure TfrmCapturar_cajas.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
  reglas.abrir_IBTabla(dmIBData.TFiltroVistaUsuarios);
  reglas.abrir_IBQuery(qyAlmacenes);
  reglas.abrir_IBQuery(qyUsuarios);
  reglas.abrir_IBQuery(qyVerModuloFuncion);
  inherited;
end;

procedure TfrmCapturar_cajas.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('ALMACEN').AsString <> '' then
  begin
     dmIBData.TFiltroAlmacenes.Filter              := 'ID ='+DataSet.FieldByName('ALMACEN').AsString;
     DataSet.FieldByName('CLAVE_ALMACEN').AsString := dmIBData.TFiltroAlmacenes.FieldByName('CLAVE').AsString;
     
     if dmIBData.TFiltroAlmacenes.FieldByName('VENDE').AsString = 'No' then
        laError1.Visible := True
     else
        laError1.Visible := False;

     if dmIBData.TFiltroAlmacenes.FieldByName('ESTATUS').AsString = 'Fuera de Operacion' then
        laError2.Visible := True
     else
        laError2.Visible := False;
  end
  else
     begin
        DataSet.FieldByName('CLAVE_ALMACEN').AsString  := '';
        laError1.Visible := False;
        laError2.Visible := False;
     end;

  if DataSet.FieldByName('USUARIO').AsString <> '' then
  begin
     dmIBData.TFiltroVistaUsuarios.Filter           := 'ID = '+DataSet.FieldByName('USUARIO').AsString;
     DataSet.FieldByName('NOMBRE_USUARIO').AsString := dmIBData.TFiltroVistaUsuarios.FieldByName('NOMBRE').AsString;

     if dmIBData.TFiltroVistaUsuarios.FieldByName('BAJA').AsString = 'Si' then
        laError3.Visible := True
     else
        laError3.Visible := False;
  end
  else
     begin
        DataSet.FieldByName('NOMBRE_USUARIO').AsString := '';
        laError3.Visible := False;
     end;
end;

procedure TfrmCapturar_cajas.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     leAlmacenes.Visible := dsFuente.DataSet.State in [dsInsert, dsEdit];
     deAlmacen.Visible   := not(leAlmacenes.Visible);
     leUsuarios.Visible  := dsFuente.DataSet.State in [dsInsert, dsEdit];
     deUsuario.Visible   := not(leUsuarios.Visible); 
  end;
end;

procedure TfrmCapturar_cajas.sbAlmacenClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyAlmacenes);
end;

procedure TfrmCapturar_cajas.sbUsuarioClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyUsuarios);
end;

end.
