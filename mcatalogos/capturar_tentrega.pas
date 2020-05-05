unit capturar_tentrega;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls, ImgList,  Buttons, ExtCtrls,
  Grids, DBGrids, ComCtrls, System.ImageList;

type
  TfrmCapturar_tentrega = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarPESO: TFloatField;
    TCapturarUNIDAD: TIntegerField;
    TCapturarTARIFA: TFloatField;
    TCapturarMONEDA: TIntegerField;
    TCapturarTRANSPORTISTA: TIntegerField;
    Label2: TLabel;
    deDescripcion: TDBEdit;
    ilImagenes: TImageList;
    pcPrecios: TPageControl;
    tsListaDePrecios: TTabSheet;
    dgPartidas: TDBGrid;
    paLP: TPanel;
    fcImager1: TImage;
    buItemF7: TBitBtn;
    paPartidas: TPanel;
    Label16: TLabel;
    cbUnidades: TDBLookupComboBox;
    sbRefreshVendedor: TSpeedButton;
    sbLimpiarVendedor: TSpeedButton;
    dePeso: TDBEdit;
    Label1: TLabel;
    Label3: TLabel;
    cbMonedas: TDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    cbTransportistas: TDBLookupComboBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_ROW: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_CONCEPTO: TIBStringField;
    qyPartidasR_TARIFA: TFloatField;
    spE_TE_TARIFAS: TIBStoredProc;
    qyPartidasR_PORC: TIBStringField;
    TCapturarEXCEDENTE_X_KG: TFloatField;
    Label5: TLabel;
    edExcedente: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure sbRefreshVendedorClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure sbLimpiarVendedorClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure buItemF7Click(Sender: TObject);
    procedure dgPartidasELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_tentrega: TfrmCapturar_tentrega;

implementation

uses IBModulo, explorar_tentrega, reglas_de_negocios, IBData,
  USeleccionarConceptosGastos, menu;

{$R *.DFM}

procedure TfrmCapturar_tentrega.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(dmIBData.qyUnidades);
  reglas.refresh_IBQuery(dmIBData.qyMonedas);
  reglas.refresh_IBQuery(dmIBData.qyTransportistas);
end;

procedure TfrmCapturar_tentrega.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('TARIFA').AsFloat         := 0.00;
  dsFuente.DataSet.FieldByName('EXCEDENTE_X_KG').AsFloat := 0.00;

  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_tentrega.ibModificarClick(Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_tentrega.sbRefreshVendedorClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(dmIBData.qyUnidades);
end;

procedure TfrmCapturar_tentrega.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(dmIBData.qyMonedas);
end;

procedure TfrmCapturar_tentrega.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(dmIBData.qyTransportistas);
end;

procedure TfrmCapturar_tentrega.sbLimpiarVendedorClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('UNIDAD').AsVariant := 0;
end;

procedure TfrmCapturar_tentrega.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('MONEDA').AsVariant := 0;
end;

procedure TfrmCapturar_tentrega.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('TRANSPORTISTA').AsVariant := 0;
end;

procedure TfrmCapturar_tentrega.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_tentrega.buItemF7Click(Sender: TObject);
var
   pnt : TPoint;
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
     ibGuardar.Click;

  try
     pnt   := dgPartidas.ClientToScreen(Point(0,0));
     pnt.x := frmMenu.Width - 2;
     frmSeleccionarConceptosGastos              := TfrmSeleccionarConceptosGastos.Create(Application);
     frmSeleccionarConceptosGastos.DATABASE     := dmIBModulo.ibSistema;
     frmSeleccionarConceptosGastos.TRANSACTION  := dmIBModulo.ibSistemaTransaccion;
     frmSeleccionarConceptosGastos.Y            := pnt;
     frmSeleccionarConceptosGastos.DATASET      := qyPartidas;
     frmSeleccionarConceptosGastos.PADRE        := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmSeleccionarConceptosGastos.CUALSPROC    := 4;

     frmSeleccionarConceptosGastos.buTodos.Click;
     frmSeleccionarConceptosGastos.ShowModal;
  finally
     frmSeleccionarConceptosGastos.Release;
  end;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_tentrega.dgPartidasELIMINARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spE_TE_TARIFAS.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     spE_TE_TARIFAS.ExecProc;
     spE_TE_TARIFAS.Transaction.CommitRetaining;
     reglas.abrir_IBTabla(TCapturar);
  end;
end;

end.
