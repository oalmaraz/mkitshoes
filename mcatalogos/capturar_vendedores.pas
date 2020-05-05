unit capturar_vendedores;

interface               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturar_base_sujetos, Db, ImgList,  IBX.IBStoredProc, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, ComCtrls,  DBCtrls, Mask, jpeg,  ExtCtrls,
  Menus, ExtDlgs, Buttons,   Grids, DBGrids,
     System.ImageList;

type
  TfrmCapturar_vendedores = class(TfrmCapturar_base_sujetos)
    TClasificaciones: TIBTable;
    dsClasificaciones: TDataSource;
    TClasificacionesID: TIntegerField;
    TClasificacionesDESCRIPCION: TIBStringField;
    TCapturarID: TIntegerField;
    TCapturarSUJETO: TIntegerField;
    TCapturarCLASIFICACION: TIntegerField;
    TCapturardescripcion: TStringField;
    tsZonas: TTabSheet;
    dgZonas: TDBGrid;
    TZonas: TIBTable;
    dsZonas: TDataSource;
    TZonasID: TIntegerField;
    TZonasVENDEDOR: TIntegerField;
    TZonasZONA: TIntegerField;
    qyBuscar: TIBQuery;
    TZonasdescripcion: TStringField;
    qyBuscarR_DESCRIPCION: TIBStringField;
    spDelZona: TIBStoredProc;
    fpZonasV: TPanel;
    fpZonas: TPanel;
    ibNuevaZona: TBitBtn;
    ibEliminarZona: TBitBtn;
    Label12: TLabel;
    cbClasificacion: TDBLookupComboBox;
    sbRefreshClasificacion: TSpeedButton;
    TCapturarSUPERVISOR: TIntegerField;
    Label16: TLabel;
    sbRefreshVendedor: TSpeedButton;
    sbLimpiarVendedor: TSpeedButton;
    cbSupervisor: TDBLookupComboBox;
    qyVendedores: TIBQuery;
    dsVendedores: TDataSource;
    qyVendedoresNOMBRE: TIBStringField;
    qyVendedoresID: TIntegerField;
    Label17: TLabel;
    sbActAlmacen: TSpeedButton;
    sbLimAlmacen: TSpeedButton;
    cbAlmacenes: TDBLookupComboBox;
    TCapturarALMACEN: TIntegerField;
    qyAlmacenes: TIBQuery;
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
    qyAlmacenesSERIE_NC: TIBStringField;
    qyAlmacenesSERIE_NVENTA: TIBStringField;
    qyAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    gbComisiones: TGroupBox;
    TCapturarPORC_NAC_LOCALES: TFloatField;
    TCapturarPORC_NAC_FORANEOS: TFloatField;
    TCapturarPORC_IMPORTADOS: TFloatField;
    TCapturarPORC_EXTEMPORANEOS: TFloatField;
    TCapturarPORC_SIN_OCOMPRA: TFloatField;
    Label13: TLabel;
    Label2: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label18: TLabel;
    TCapturarPORC_DISTRIBUIDOR: TFloatField;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure TZonasCalcFields(DataSet: TDataSet);
    procedure ibZonasClick(Sender: TObject);
    procedure ibNuevaZonaClick(Sender: TObject);
    procedure ibEliminarZonaClick(Sender: TObject);
    procedure dsZonasDataChange(Sender: TObject; Field: TField);
    procedure sbRefreshClasificacionClick(Sender: TObject);
    procedure sbRefreshVendedorClick(Sender: TObject);
    procedure sbLimpiarVendedorClick(Sender: TObject);
    procedure sbActAlmacenClick(Sender: TObject);
    procedure sbLimAlmacenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
     procedure valores;override;
  public
    { Public declarations }
  end;

var
  frmCapturar_vendedores: TfrmCapturar_vendedores;

implementation

uses IBModulo, explorar_vendedores, reglas_de_negocios, seleccionar_zonas;

{$R *.DFM}

procedure TfrmCapturar_vendedores.valores;
begin
  dsFuente.DataSet.FieldByName('CLASIFICACION').AsInteger      := -3;
  dsFuente.DataSet.FieldByName('PORC_DISTRIBUIDOR').AsInteger  := 0;
  dsFuente.DataSet.FieldByName('PORC_NAC_LOCALES').AsInteger   := 0;
  dsFuente.DataSet.FieldByName('PORC_NAC_FORANEOS').AsInteger  := 0;
  dsFuente.DataSet.FieldByName('PORC_IMPORTADOS').AsInteger    := 0;
  dsFuente.DataSet.FieldByName('PORC_EXTEMPORANEOS').AsInteger := 0;
  dsFuente.DataSet.FieldByName('PORC_SIN_OCOMPRA').AsInteger   := 0;
  dsFuente.DataSet.FieldByName('SUPERVISOR').AsVariant         := 0;
end;

procedure TfrmCapturar_vendedores.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(TClasificaciones);
  reglas.refresh_IBQuery(qyVendedores);
  reglas.refresh_IBQuery(qyAlmacenes);
  reglas.refresh_IBQuery(qyZonas_);

  inherited;
  //fpZonasV.FoldStatus := fsCollapsed;
end;

procedure TfrmCapturar_vendedores.FormShow(Sender: TObject);
begin
  inherited;
  qyTelefonosTipos.Last;
  TClasificaciones.Last;
  qyCiudades.Last;
  qyZonas_.Last;
end;

procedure TfrmCapturar_vendedores.TZonasCalcFields(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyBuscar);
  DataSet.FieldByName('DESCRIPCION').AsString := qyBuscar.FieldByName('R_DESCRIPCION').AsString; 
end;

procedure TfrmCapturar_vendedores.ibZonasClick(Sender: TObject);
begin
  inherited;
  if TZonas.State = dsInactive then
  begin
    reglas.abrir_IBTabla(TZonas);
//    reglas.abrir_IBQuery(qyBuscar);
  end;
end;

procedure TfrmCapturar_vendedores.ibNuevaZonaClick(Sender: TObject);
var
   pnt : TPoint;
begin
  inherited;
  pnt := dgZonas.ClientToScreen(Point(0,0));
  frmSeleccionar_zonas := TfrmSeleccionar_zonas.Create(Application);
  frmSeleccionar_zonas.dsDestino.Tag     := dsFuente.DataSet.FieldByName('ID').AsInteger;
  frmSeleccionar_zonas.dsDestino.DataSet := TZonas;
  frmSeleccionar_zonas.coordenadas(0,pnt.x-6, width-7, pnt.y);
  frmSeleccionar_zonas.ShowModal;
  frmSeleccionar_zonas.Free;
  reglas.abrir_IBTabla(TZonas);
end;

procedure TfrmCapturar_vendedores.ibEliminarZonaClick(Sender: TObject);
begin
  inherited;
  spDelZona.ParamByName('P_ZONA').AsInteger := dsZonas.DataSet.FieldByName('ID').AsInteger;
  spDelZona.ExecProc;
  spDelZona.Transaction.CommitRetaining;
  reglas.abrir_IBTabla(TZonas);
end;

procedure TfrmCapturar_vendedores.dsZonasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsZonas.DataSet <> nil then
  begin
     ibNuevaZona.Enabled    := not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.State = dsBrowse);
     ibEliminarZona.Enabled := not(dsZonas.DataSet.IsEmpty)
  end;
end;

procedure TfrmCapturar_vendedores.sbRefreshClasificacionClick(
  Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TClasificaciones);
end;

procedure TfrmCapturar_vendedores.sbRefreshVendedorClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyVendedores);
end;

procedure TfrmCapturar_vendedores.sbLimpiarVendedorClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('SUPERVISOR').AsVariant := 0;
end;

procedure TfrmCapturar_vendedores.sbActAlmacenClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyAlmacenes);
end;

procedure TfrmCapturar_vendedores.sbLimAlmacenClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('ALMACEN').AsVariant := 0;
end;

end.
