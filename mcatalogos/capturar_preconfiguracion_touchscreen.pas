unit capturar_preconfiguracion_touchscreen;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI,

    StdCtrls, IBX.IBStoredProc, IBX.IBTable,  Db,
  IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls, Mask,
  jpeg,  ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmCapturar_preconfiguracion_touchScreen = class(TfrmCapturarMDI)
    cbConCajas: TDBCheckBox;
    Label2: TLabel;
    Label4: TLabel;
    cbCobrarCajas: TDBCheckBox;
    Label6: TLabel;
    seOrden: TDBEdit;
    laTipoCaja: TLabel;
    laAlmacen: TLabel;
    cbUnidades: TDBLookupComboBox;
    dsVer_Unidades_Material: TDataSource;
    qyVer_Unidades_Material: TIBQuery;
    cbAlmacenes: TDBLookupComboBox;
    dsAlmacenes: TDataSource;
    TCapturarID: TIntegerField;
    TCapturarALMACEN: TIntegerField;
    TCapturarGRUPO_MATERIAL: TIntegerField;
    TCapturarMATERIAL: TIntegerField;
    TCapturarMATERIAL_UNIDAD: TIntegerField;
    TCapturarCON_CAJAS: TIBStringField;
    TCapturarTIPO_CAJA: TIntegerField;
    TCapturarCOBRAR_CAJAS: TIBStringField;
    TCapturarVISUALIZAR: TIBStringField;
    TCapturarORDEN_VISUALIZACION: TIntegerField;
    TAlmacenes: TIBTable;
    TAlmacenesID: TIntegerField;
    TAlmacenesCLAVE: TIBStringField;
    TAlmacenesNOMBRE: TIBStringField;
    TAlmacenesCOMPRA: TIBStringField;
    TAlmacenesVENDE: TIBStringField;
    TAlmacenesTRANSFORMA: TIBStringField;
    TAlmacenesFECHA_ALTA: TDateTimeField;
    TAlmacenesRESPONSABLE: TIntegerField;
    TAlmacenesOBSERVACIONES: TBlobField;
    TAlmacenesSERIE_FACTURA: TIBStringField;
    TAlmacenesCONSECUTIVO: TIntegerField;
    TAlmacenesFECHA_ULT_INV: TDateTimeField;
    TAlmacenesESTATUS: TIBStringField;
    cbGrupos: TDBLookupComboBox;
    Label1: TLabel;
    TGrupos_Materiales: TIBTable;
    dsGrupos_Materiales: TDataSource;
    TGrupos_MaterialesID: TIntegerField;
    TGrupos_MaterialesNOMBRE: TIBStringField;
    cbMateriales: TDBLookupComboBox;
    qyGrupos_Materiales_Detalle: TIBQuery;
    dsGrupos_Materiales_Detalle: TDataSource;
    qyGrupos_Materiales_DetalleR_ID: TIntegerField;
    qyGrupos_Materiales_DetalleR_GRUPO_MATERIAL: TIntegerField;
    qyGrupos_Materiales_DetalleR_MATERIAL: TIntegerField;
    qyGrupos_Materiales_DetalleR_MATERIAL_CLAVE: TIBStringField;
    qyGrupos_Materiales_DetalleR_MATERIAL_DESCRIPCION: TIBStringField;
    qyGrupos_Materiales_DetalleR_UNIDAD_BASE: TIntegerField;
    qyGrupos_Materiales_DetalleR_CALIDAD: TIntegerField;
    qyGrupos_Materiales_DetalleR_UNIDAD_BASE_DESCRIPCION: TIBStringField;
    qyGrupos_Materiales_DetalleR_CALIDAD_NOMBRE: TIBStringField;
    cbVisualizar: TDBCheckBox;
    cbTipoDeCajas: TDBLookupComboBox;
    qyVerMaterialesCajas: TIBQuery;
    dsVerMaterialesCajas: TDataSource;
    qyVerMaterialesCajasR_ID: TIntegerField;
    qyVerMaterialesCajasR_CLAVE: TIBStringField;
    qyVerMaterialesCajasR_DESCRIPCION: TIBStringField;
    qyVerMaterialesCajasR_UNIDAD_BASE: TIntegerField;
    qyVerMaterialesCajasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyVerMaterialesCajasR_CODIGO_BARRAS: TIBStringField;
    procedure ibNuevoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsGrupos_MaterialesDataChange(Sender: TObject;
      Field: TField);
    procedure dsGrupos_Materiales_DetalleDataChange(Sender: TObject;
      Field: TField);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_preconfiguracion_touchScreen: TfrmCapturar_preconfiguracion_touchScreen;

implementation

uses reglas_de_negocios, IBModulo, seleccionar_material,
  explorar_preconfiguracion_touchScreen, IBData, seleccionar_almacen;

{$R *.DFM}

procedure TfrmCapturar_preconfiguracion_touchScreen.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('CON_CAJAS').AsString            := 'No';
  dsFuente.DataSet.FieldByName('COBRAR_CAJAS').AsString         := 'No';
  dsFuente.DataSet.FieldByName('VISUALIZAR').AsString           := 'No';
  dsFuente.DataSet.FieldByName('ORDEN_VISUALIZACION').AsInteger := 0;
  cbAlmacenes.SetFocus;
end;

procedure TfrmCapturar_preconfiguracion_touchScreen.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(TAlmacenes);
  reglas.abrir_IBTabla(TGrupos_Materiales);
  reglas.refresh_IBQuery(qyVerMaterialesCajas);
  inherited;
end;

procedure TfrmCapturar_preconfiguracion_touchScreen.dsGrupos_MaterialesDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  qyGrupos_Materiales_Detalle.Close;
  qyGrupos_Materiales_Detalle.ParamByName('P_GRUPO').AsInteger := dsGrupos_Materiales.DataSet.FieldByName('ID').AsInteger;
  qyGrupos_Materiales_Detalle.Open;
end;

procedure TfrmCapturar_preconfiguracion_touchScreen.dsGrupos_Materiales_DetalleDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  qyVer_Unidades_Material.Close;
  qyVer_Unidades_Material.ParamByName('P_MATERIAL').AsInteger := dsGrupos_Materiales_Detalle.DataSet.FieldByName('R_MATERIAL').AsInteger;
  qyVer_Unidades_Material.Open;
end;

procedure TfrmCapturar_preconfiguracion_touchScreen.ibModificarClick(
  Sender: TObject);
begin
  inherited;
  cbAlmacenes.SetFocus;
end;

end.
