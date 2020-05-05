unit capturar_proveedores;

interface               

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturar_base_sujetos, Db, DBCtrls,    ImgList,
  IBX.IBStoredProc, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, ComCtrls,  Mask,
  jpeg,  ExtCtrls,  Menus,
  ExtDlgs, Buttons,
  Grids, DBGrids, System.ImageList;

type
  TfrmCapturar_proveedores = class(TfrmCapturar_base_sujetos)
    tsBancos: TTabSheet;
    dgBancos: TDBGrid;
    qyBuscar: TIBQuery;
    qyBuscarR_DESCRIPCION: TIBStringField;
    spDelBanco: TIBStoredProc;
    qyMonedas: TIBQuery;
    dsMonedas: TDataSource;
    TClasificaciones: TIBTable;
    dsClasificaciones: TDataSource;
    tsReferencias: TTabSheet;
    Label19: TLabel;
    ceDiasRetardo: TDBEdit;
    Label30: TLabel;
    qyCondiciones_Comerciales: TIBQuery;
    dsCondiciones_Comerciales: TDataSource;
    Label15: TLabel;
    Label23: TLabel;
    pePrioriodad: TDBComboBox;
    qyTransportistas: TIBQuery;
    dsTransportistas: TDataSource;
    Label17: TLabel;
    TCapturarID: TIntegerField;
    TCapturarSUJETO: TIntegerField;
    TCapturarDESCUENTO_PORC: TFloatField;
    TCapturarFORMAS_DE_PAGO: TIntegerField;
    TCapturarCOMPRA_MINIMA: TFloatField;
    TCapturarACUMULADO_COMPRA: TFloatField;
    TCapturarPRIORIDAD: TIBStringField;
    TCapturarCLASIFICACION: TIntegerField;
    TCapturarINCLUIR_EN_DECLARACION: TIBStringField;
    TCapturarMONEDA: TIntegerField;
    TCapturarDIAS_DE_RETARDO: TIntegerField;
    TCapturarRECIBIR_POR: TIntegerField;
    TCapturarCONGELAR_PAGO: TIBStringField;
    TCapturarDIA_FACTURA_REVISION: TIBStringField;
    TCapturarDFR_HORA_DE: TDateTimeField;
    TCapturarDFR_HORA_A: TDateTimeField;
    TCapturarDIA_ENTREGA_CHEQUES: TIBStringField;
    TCapturarDEC_HORA_DE: TDateTimeField;
    TCapturarDEC_HORA_A: TDateTimeField;
    TCapturardescripcion_clasificacion: TStringField;
    TCapturardescripcion_moneda: TStringField;
    TCapturarnombre_transportista: TStringField;
    TCapturarnombre_comercial: TStringField;
    qyBancos: TIBQuery;
    dsBancos: TDataSource;
    qyBancosR_ID: TIntegerField;
    qyBancosR_PROVEEDOR: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    fpBancosD: TPanel;
    fpBancos: TPanel;
    ibNuevoBanco: TBitBtn;
    ibEliminarBanco: TBitBtn;
    fpReferencias: TPanel;
    Label14: TLabel;
    deCompraMinima: TDBEdit;
    Label13: TLabel;
    cePorcentaje: TDBEdit;
    Label18: TLabel;
    Label12: TLabel;
    peDiaFactura: TDBComboBox;
    Label27: TLabel;
    peDiaEntrega: TDBComboBox;
    Label24: TLabel;
    Label28: TLabel;
    teDFDe: TDBEdit;
    Label25: TLabel;
    teDEDe: TDBEdit;
    teDEA: TDBEdit;
    Label26: TLabel;
    dtDFA: TDBEdit;
    Label29: TLabel;
    ceCongelarPago: TDBCheckBox;
    ceIncluirEnDeclaracion: TDBCheckBox;
    sbRefreshMonedas: TSpeedButton;
    sbRefreshClasificaciones: TSpeedButton;
    sbRefreshRecibir: TSpeedButton;
    sbFormaDePago: TSpeedButton;
    TCapturarTIPO_NACIONALIDAD: TIBStringField;
    Label16: TLabel;
    cbTipoNacionalidad: TDBComboBox;
    deUnidadesCompradas: TDBEdit;
    deEstatus: TDBComboBox;
    Label33: TLabel;
    TCapturarESTATUS: TIBStringField;
    tsMateriales: TTabSheet;
    qyMateriales: TIBQuery;
    dsMateriales: TDataSource;
    qyMaterialesR_ID: TIntegerField;
    qyMaterialesR_MATERIAL: TIntegerField;
    qyMaterialesR_MATERIAL_C: TIBStringField;
    qyMaterialesR_MATERIAL_D: TIBStringField;
    qyMaterialesR_MATERIAL_UB: TIntegerField;
    qyMaterialesR_MATERIAL_UB_C: TIBStringField;
    qyMaterialesR_MATERIAL_UB_D: TIBStringField;
    qyMaterialesR_PROVEEDOR: TIntegerField;
    qyMaterialesR_PROVEEDOR_C: TIBStringField;
    qyMaterialesR_PROVEEDOR_N: TIBStringField;
    qyMaterialesR_CLAVE: TIBStringField;
    qyMaterialesR_DESCRIPCION: TIBStringField;
    qyMaterialesR_CANTIDAD_MIN: TFloatField;
    qyMaterialesR_UNIDAD: TIntegerField;
    qyMaterialesR_UNIDAD_C: TIBStringField;
    qyMaterialesR_UNIDAD_D: TIBStringField;
    qyMaterialesR_FACTOR: TFloatField;
    qyMaterialesR_COSTO: TFloatField;
    qyMaterialesR_TIEMPO_ENT: TIntegerField;
    qyMaterialesR_DEVOLUCIONES: TFloatField;
    qyMaterialesR_INTERVIENE_EN_CALIDAD: TIBStringField;
    dgMateriales: TDBGrid;
    TCapturarAFECTA_CALIDAD: TIBStringField;
    TCapturarCALIFICACION_CALIDAD: TIntegerField;
    TCapturarBITACORA_CALIDAD: TBlobField;
    Label2: TLabel;
    edBitacoraCalidad: TDBMemo;
    cbAfectaCalidad: TDBCheckBox;
    Label20: TLabel;
    edCalificacion: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ibBancosClick(Sender: TObject);
    procedure ibNuevoBancoClick(Sender: TObject);
    procedure ibEliminarBancoClick(Sender: TObject);
    procedure ibReferenciasClick(Sender: TObject);
    procedure dsBancosDataChange(Sender: TObject; Field: TField);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure sbRefreshClasificacionesClick(Sender: TObject);
    procedure sbRefreshMonedasClick(Sender: TObject);
    procedure sbRefreshRecibirClick(Sender: TObject);
    procedure sbFormaDePagoClick(Sender: TObject);
    procedure cbAfectaCalidadChange(Sender: TObject);
  private
    { Private declarations }
    awrMBase : integer;
  protected
     procedure valores;override;
  public
    { Public declarations }
  end;

var
  frmCapturar_proveedores: TfrmCapturar_proveedores;

implementation

uses IBModulo, reglas_de_negocios, IBData, explorar_proveedores,
  seleccionar_bancos_proveedores;

{$R *.DFM}

procedure TfrmCapturar_proveedores.valores;
begin
  dsFuente.DataSet.FieldByName('CONGELAR_PAGO').AsString          := 'No';
  dsFuente.DataSet.FieldByName('INCLUIR_EN_DECLARACION').AsString := 'No';
  dsFuente.DataSet.FieldByName('PRIORIDAD').AsString              := 'Sin Clasificar';
  dsFuente.DataSet.FieldByName('DIA_FACTURA_REVISION').AsString   := 'Sin Clasificar';
  dsFuente.DataSet.FieldByName('DIA_ENTREGA_CHEQUES').AsString    := 'Sin Clasificar';
  dsFuente.DataSet.FieldByName('COMPRA_MINIMA').AsFloat           := 0.00;
  dsFuente.DataSet.FieldByName('ACUMULADO_COMPRA').AsFloat        := 0.00;
  dsFuente.DataSet.FieldByName('DESCUENTO_PORC').AsFloat          := 0.00;
  dsFuente.DataSet.FieldByName('MONEDA').AsInteger                := awrMBase;
  dsFuente.DataSet.FieldByName('TIPO_NACIONALIDAD').AsString      := 'Nacional';
  dsFuente.DataSet.FieldByName('AFECTA_CALIDAD').AsString         := 'No';
  dsFuente.DataSet.FieldByName('CALIFICACION_CALIDAD').AsInteger  := 0;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString                := 'Activo';
end;

procedure TfrmCapturar_proveedores.FormCreate(Sender: TObject);
begin
  reglas.refresh_IBQuery(qyMonedas);
  reglas.abrir_IBTabla(TClasificaciones);
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.refresh_IBQuery(qyMateriales);
  inherited;
  //fpBancosD.FoldStatus := fsCollapsed;

  //Moneda Base
  dmIBData.TPreferencias.Filter := 'ID = 3';
  awrMBase := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

end;

procedure TfrmCapturar_proveedores.ibBancosClick(Sender: TObject);
begin
  inherited;
  if qyBancos.State = dsInactive then
  begin
    reglas.refresh_IBQuery(qyBancos);
  end;
end;

procedure TfrmCapturar_proveedores.ibNuevoBancoClick(Sender: TObject);
var
   pnt : TPoint;
begin
  inherited;
  pnt := dgBancos.ClientToScreen(Point(0,0));
  frmSeleccionar_Bancos_Proveedores := TfrmSeleccionar_Bancos_Proveedores.Create(Application);
  frmSeleccionar_Bancos_Proveedores.dsDestino.Tag     := dsFuente.DataSet.FieldByName('ID').AsInteger;
  frmSeleccionar_Bancos_Proveedores.dsDestino.DataSet := qyBancos;
  frmSeleccionar_Bancos_Proveedores.coordenadas(0,pnt.x-6, width-7, pnt.y);
  frmSeleccionar_Bancos_Proveedores.ShowModal;
  frmSeleccionar_Bancos_Proveedores.Free;
  reglas.refresh_IBQuery(qyBancos);
end;

procedure TfrmCapturar_proveedores.ibEliminarBancoClick(Sender: TObject);
begin
  inherited;
  spDelBanco.ParamByName('P_BANCO').AsInteger := dsBancos.DataSet.FieldByName('R_ID').AsInteger;
  spDelBanco.ExecProc;
  spDelBanco.Transaction.CommitRetaining;
  reglas.refresh_IBQuery(qyBancos);
end;

procedure TfrmCapturar_proveedores.ibReferenciasClick(Sender: TObject);
begin
  inherited;
  if qyCondiciones_Comerciales.State = dsInactive then
  begin
    reglas.refresh_IBQuery(qyTransportistas);
    reglas.refresh_IBQuery(qyCondiciones_Comerciales);
  end;
end;

procedure TfrmCapturar_proveedores.dsBancosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;           
  if dsBancos.DataSet <> nil then
  begin
     ibNuevoBanco.Enabled    := not(dsFuente.DataSet.IsEmpty) and (dsFuente.DataSet.State in [dsEdit, dsBrowse]);
     ibEliminarBanco.Enabled := not(dsBancos.DataSet.IsEmpty) and (dsFuente.DataSet.State in [dsEdit, dsBrowse]);
  end;
end;

procedure TfrmCapturar_proveedores.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     tsReferencias.Enabled := dsFuente.DataSet.State = dsEdit;
  end;
end;

procedure TfrmCapturar_proveedores.sbRefreshClasificacionesClick(
  Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TClasificaciones);
end;

procedure TfrmCapturar_proveedores.sbRefreshMonedasClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyMonedas);
end;

procedure TfrmCapturar_proveedores.sbRefreshRecibirClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyTransportistas);
end;

procedure TfrmCapturar_proveedores.sbFormaDePagoClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyCondiciones_Comerciales);
end;

procedure TfrmCapturar_proveedores.cbAfectaCalidadChange(Sender: TObject);
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
  begin
     if dsFuente.DataSet.FieldByName('AFECTA_CALIDAD').AsString = 'No' then
        dsFuente.DataSet.FieldByName('CALIFICACION_CALIDAD').AsInteger := 0;
  end;
end;

end.
