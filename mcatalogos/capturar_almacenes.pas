unit capturar_almacenes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI,     Db,
     Buttons, StdCtrls, IBX.IBStoredProc, IBX.IBTable,
   IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls, Mask,
   jpeg,  ExtCtrls,  Menus,
  UfrmFrameMaterial,    ComCtrls, ImgList,
     Grids, DBGrids, System.ImageList;

type
  TfrmCapturar_almacenes = class(TfrmCapturarMDI)
    deClave: TDBEdit;
    deNombre: TDBEdit;
    deFechaAlta: TDBEdit;
    leResponsable: TDBLookupComboBox;
    dmObservaciones: TDBMemo;
    deSerieFactura: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarCOMPRA: TIBStringField;
    TCapturarVENDE: TIBStringField;
    TCapturarTRANSFORMA: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarRESPONSABLE: TIntegerField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarSERIE_FACTURA: TIBStringField;
    TCapturarCONSECUTIVO: TIntegerField;
    TCapturarFECHA_ULT_INV: TDateTimeField;
    TCapturarESTATUS: TIBStringField;
    meEstatus: TDBComboBox;
    Label9: TLabel;
    qyUsuarios: TIBQuery;
    dsUsuarios: TDataSource;
    TCapturarnombre_responsable: TIBStringField;
    qyUsuariosR_ID: TIntegerField;
    qyUsuariosR_NOMBRE: TIBStringField;
    qyUsuariosR_BAJA: TIBStringField;
    deSerieNotaCredito: TDBEdit;
    TCapturarSERIE_NC: TIBStringField;
    Label10: TLabel;
    deSerieNotaCargo: TDBEdit;
    Label11: TLabel;
    deNotaDeVenta: TDBEdit;
    deFechaUltInv: TDBEdit;
    TCapturarSERIE_NVENTA: TIBStringField;
    TCapturarSERIE_NCARGO: TIBStringField;
    sbUsuario: TSpeedButton;
    gbTipo: TGroupBox;
    cbCompra: TDBCheckBox;
    cbVende: TDBCheckBox;
    cbTransforma: TDBCheckBox;
    ilImagenes: TImageList;
    pcPrecios: TPageControl;
    tsListaDePrecios: TTabSheet;
    dgPartidas: TDBGrid;
    paLP: TPanel;
    buItemF7: TBitBtn;
    buItemF8: TBitBtn;
    buItemF9: TBitBtn;
    buitemF10: TBitBtn;
    buItemF11: TBitBtn;
    paPartidas: TPanel;
    ppFunciones: TPopupMenu;
    itemF7: TMenuItem;
    itemF8: TMenuItem;
    itemF9: TMenuItem;
    itemF10: TMenuItem;
    itemF11: TMenuItem;
    spADD_ITEMS_ALMACENES: TIBStoredProc;
    spDEL_ITEM_ALMACENES: TIBStoredProc;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_LINK: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_MATERIAL_CLAVE: TIBStringField;
    qyPartidasR_MATERIAL_DESCRIPCION: TIBStringField;
    qyPartidasR_MATERIAL_CBARRAS: TIBStringField;
    spVERIF_MAT_EN_ALM: TIBStoredProc;
    cbCtasContables: TDBLookupComboBox;
    laCtaContable: TLabel;
    buActCtas: TBitBtn;
    buLimCtas: TBitBtn;
    dsCuentas: TDataSource;
    qyCuentas: TIBQuery;
    TCapturarCUENTA: TIntegerField;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure sbUsuarioClick(Sender: TObject);
    procedure buItemF7Click(Sender: TObject);
    procedure buItemF8Click(Sender: TObject);
    procedure buItemF9Click(Sender: TObject);
    procedure buitemF10Click(Sender: TObject);
    procedure buItemF11Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TCapturarBeforeOpen(DataSet: TDataSet);
    procedure itemF7Click(Sender: TObject);
    procedure itemF8Click(Sender: TObject);
    procedure itemF9Click(Sender: TObject);
    procedure itemF10Click(Sender: TObject);
    procedure itemF11Click(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure buActCtasClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
  private
    { Private declarations }
    awrMBase : integer;
    edicionDetalle : boolean;//<-valida los botones
    procedure fijarBotonesD;overload;
    procedure fijarBotonesD(valor : boolean);overload;
  public
    { Public declarations }
  end;

var
  frmCapturar_almacenes: TfrmCapturar_almacenes;

implementation

uses IBModulo, explorar_almacenes, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmCapturar_almacenes.fijarBotonesD;
begin
   buItemF7.Enabled  := not edicionDetalle;
   buItemF8.Enabled  := not edicionDetalle and not(dsPartidas.DataSet.IsEmpty);
   buItemF9.Enabled  := edicionDetalle;
   buItemF10.Enabled := edicionDetalle;
   buItemF11.Enabled := not edicionDetalle and not(dsPartidas.DataSet.IsEmpty);
   dgPartidas.Enabled  := not edicionDetalle;

   itemF7.Enabled  := buItemF7.Enabled;
   itemF8.Enabled  := buItemF8.Enabled;
   itemF9.Enabled  := buItemF9.Enabled;
   itemF10.Enabled := buItemF10.Enabled;
   itemF11.Enabled := buItemF11.Enabled;

   //MarcoMateriales1.Visible   := edicionDetalle;
end;

procedure TfrmCapturar_almacenes.fijarBotonesD(valor : boolean);
begin
   edicionDetalle := valor;
   fijarBotonesD;
end;

procedure TfrmCapturar_almacenes.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDatetime    := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('FECHA_ULT_INV').AsDatetime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('CONSECUTIVO').AsInteger    := 0;
  dsFuente.DataSet.FieldByName('COMPRA').AsString          := 'No';
  dsFuente.DataSet.FieldByName('VENDE').AsString           := 'No';
  dsFuente.DataSet.FieldByName('TRANSFORMA').AsString      := 'No';
  dsFuente.DataSet.FieldByName('ESTATUS').AsString         := 'En Operacion';
  deClave.SetFocus;
end;

procedure TfrmCapturar_almacenes.ibModificarClick(Sender: TObject);
begin
  inherited;
  deClave.SetFocus;
end;

procedure TfrmCapturar_almacenes.ibGuardarClick(Sender: TObject);
begin
  if dsFuente.DataSet.State in [dsEdit] then
  begin
     dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime := StrtoDate(deFechaAlta.Text) + time;
  end;
  inherited;
end;

procedure TfrmCapturar_almacenes.sbUsuarioClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyUsuarios);
end;

procedure TfrmCapturar_almacenes.buItemF7Click(Sender: TObject);
begin
  inherited;
  fijarBotonesD(true);

  {
  MarcoMateriales1.paMateriales.Tag := 0;
  MarcoMateriales1.limpiar;
  MarcoMateriales1.MONEDA := awrMBase;

  MarcoMateriales1.edMaterial.SetFocus;
  }
end;

procedure TfrmCapturar_almacenes.buItemF8Click(Sender: TObject);
begin
  inherited;
  fijarBotonesD(true);

  {
  MarcoMateriales1.limpiar;
  MarcoMateriales1.paMateriales.Tag    := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
  MarcoMateriales1.edMaterial.Tag      := dsPartidas.DataSet.FieldByName('R_MATERIAL').AsInteger;
  MarcoMateriales1.edMaterial.Text     := dsPartidas.DataSet.FieldByName('R_MATERIAL_CLAVE').AsString;
  MarcoMateriales1.edDescripcion.Text  := dsPartidas.DataSet.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
  MarcoMateriales1.edCBarras.Text      := dsPartidas.DataSet.FieldByName('R_MATERIAL_CBARRAS').AsString;
  MarcoMateriales1.MONEDA              := awrMBase;

  MarcoMateriales1.edMaterial.SetFocus;
  }
end;

procedure TfrmCapturar_almacenes.buItemF9Click(Sender: TObject);
begin
  inherited;
  {
  spADD_ITEMS_ALMACENES.ParamByName('P_ID').AsInteger       := MarcoMateriales1.paMateriales.Tag;
  spADD_ITEMS_ALMACENES.ParamByName('P_LINK').AsInteger     := dsFuente.DataSet.FieldByName('ID').AsInteger;
  spADD_ITEMS_ALMACENES.ParamByName('P_MATERIAL').AsInteger := MarcoMateriales1.edMaterial.Tag;
  spADD_ITEMS_ALMACENES.ExecProc;
  spADD_ITEMS_ALMACENES.Transaction.CommitRetaining;

  if (spADD_ITEMS_ALMACENES.ParamByName('R_ID').AsInteger <> 0) then
  begin
     reglas.abrir_IBQuery_seek('R_ID', spADD_ITEMS_ALMACENES.ParamByName('R_ID').AsInteger, qyPartidas);
     fijarBotonesD(false);
  end;
  }
end;

procedure TfrmCapturar_almacenes.buitemF10Click(Sender: TObject);
begin
  inherited;
  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.buItemF11Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('�Eliminar registro?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
     spDEL_ITEM_ALMACENES.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     spDEL_ITEM_ALMACENES.ExecProc;
     spDEL_ITEM_ALMACENES.Transaction.CommitRetaining;
     reglas.refresh_IBQuery(qyPartidas);
  end;
end;

procedure TfrmCapturar_almacenes.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  //Moneda Base
  dmIBData.TPreferencias.Filter := 'ID = 3';
  awrMBase := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  inherited;
  {
  MarcoMateriales1.inicializar(false); //aqui pone eleccion en verdadero.
  MarcoMateriales1.ELECCION := false;  //respetar esta secuencia en la eleccion, para que busque todos los materiales.
   }
  reglas.refresh_IBQuery(qyCuentas);

  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.TCapturarBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_almacenes.itemF7Click(Sender: TObject);
begin
  inherited;
  buItemF7.Click;
end;

procedure TfrmCapturar_almacenes.itemF8Click(Sender: TObject);
begin
  inherited;
  buItemF8.Click;
end;

procedure TfrmCapturar_almacenes.itemF9Click(Sender: TObject);
begin
  inherited;
  buItemF9.Click;
end;

procedure TfrmCapturar_almacenes.itemF10Click(Sender: TObject);
begin
  inherited;
  buitemF10.Click;
end;

procedure TfrmCapturar_almacenes.itemF11Click(Sender: TObject);
begin
  inherited;
  buItemF11.Click;
end;

procedure TfrmCapturar_almacenes.buInicioClick(Sender: TObject);
begin
  inherited;
  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.buAnteriorClick(Sender: TObject);
begin
  inherited;
  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.buSiguienteClick(Sender: TObject);
begin
  inherited;
  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.buFinClick(Sender: TObject);
begin
  inherited;
  fijarBotonesD(false);
end;

procedure TfrmCapturar_almacenes.buActCtasClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyCuentas);
end;

procedure TfrmCapturar_almacenes.buLimCtasClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('CUENTA').AsVariant := 0;
end;

end.
