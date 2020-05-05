unit capturar_condiciones_comerciales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI,     Db,
     Buttons, StdCtrls, IBX.IBStoredProc, IBX.IBTable,
   IBX.IBCustomDataSet, IBX.IBQuery, Mask, DBCtrls,
   jpeg,  ExtCtrls;

type
  TfrmCapturar_condiciones_comerciales = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarTIPO: TIBStringField;
    TCapturarCLAVE: TIBStringField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarNUM_PAGOS: TIntegerField;
    TCapturarINTERVALO_ENTRE_PAGOS: TIntegerField;
    TCapturarDESPLAZAMIENTO_1_PAGO: TIntegerField;
    TCapturarDESCUENTO_PORCENTAJE: TFloatField;
    TCapturarFINANCIAMIENTO: TIntegerField;
    TCapturarMORATORIO: TIBStringField;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    deClave: TDBEdit;
    deNombre: TDBEdit;
    ceNumPagos: TDBEdit;
    ceInvtervalo: TDBEdit;
    ceDesplazamiento: TDBEdit;
    ceDescuentoPorcentaje: TDBEdit;
    TFinanciamientos: TIBTable;
    dsFinanciamientos: TDataSource;
    TCapturarPUNTO_DE_VENTA: TIBStringField;
    TCapturarREQUIERE_AUTORIZACION: TIBStringField;
    TCapturarREQUIERE_FOLIO: TIBStringField;
    TCapturarPAGOS: TIBStringField;
    sbRefresh: TSpeedButton;
    cbMoratorio: TDBCheckBox;
    cbPuntoVenta: TDBCheckBox;
    cbPagos: TDBCheckBox;
    cbAutorizacion: TDBCheckBox;
    cbFolio: TDBCheckBox;
    TCapturarREQUIERE_REFERENCIA: TIBStringField;
    TCapturarREQUIERE_FECHA: TIBStringField;
    TCapturarREQUIERE_BANCO: TIBStringField;
    cbFecha: TDBCheckBox;
    cbBanco: TDBCheckBox;
    cbReferencia: TDBCheckBox;
    TCapturarPAGOS_CXP: TIBStringField;
    cbPagosCXP: TDBCheckBox;
    ibCC: TBitBtn;
    spCAMBIO_GRAL_CCOMERCIAL: TIBStoredProc;
    cbPlanes: TDBCheckBox;
    TCapturarPLANES_DE_PAGO: TIBStringField;
    sbBorrar: TSpeedButton;
    cbFinanciamientos: TDBLookupComboBox;
    TFinanciamientosID: TIntegerField;
    TFinanciamientosCLAVE: TIBStringField;
    TFinanciamientosDESCRIPCION: TIBStringField;
    TFinanciamientosPORCENTAJE: TFloatField;
    TFinanciamientosdescripcion_corta: TIBStringField;
    TCapturarACTIVAR_ALMACEN: TIBStringField;
    cbActivarAlmacen: TDBCheckBox;
    TCapturarDAR_CAMBIO: TIBStringField;
    cbDarCambio: TDBCheckBox;
    TCapturarAPLICACION: TIBStringField;
    deAplicacion: TDBEdit;
    Label1: TLabel;
    deServicio: TDBEdit;
    Label9: TLabel;
    TCapturarSERVICIO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure sbRefreshClick(Sender: TObject);
    procedure ibCCClick(Sender: TObject);
    procedure sbBorrarClick(Sender: TObject);
    procedure TFinanciamientosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_condiciones_comerciales: TfrmCapturar_condiciones_comerciales;

implementation

uses IBModulo, explorar_condiciones_comerciales, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_condiciones_comerciales.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(TFinanciamientos);
  inherited;
end;

procedure TfrmCapturar_condiciones_comerciales.ibNuevoClick(
  Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('TIPO').AsString                   := 'Desconocida';
  dsFuente.DataSet.FieldByName('NUM_PAGOS').AsInteger             := 0;
  dsFuente.DataSet.FieldByName('INTERVALO_ENTRE_PAGOS').AsInteger := 0;
  dsFuente.DataSet.FieldByName('DESPLAZAMIENTO_1_PAGO').AsInteger := 0;
  dsFuente.DataSet.FieldByName('DESCUENTO_PORCENTAJE').AsInteger  := 0;

  dsFuente.DataSet.FieldByName('PUNTO_DE_VENTA').AsString         := 'No';
  dsFuente.DataSet.FieldByName('PAGOS').AsString                  := 'No';
  dsFuente.DataSet.FieldByName('PAGOS_CXP').AsString              := 'No';
  dsFuente.DataSet.FieldByName('REQUIERE_FECHA').AsString         := 'No';
  dsFuente.DataSet.FieldByName('REQUIERE_REFERENCIA').AsString    := 'No';
  dsFuente.DataSet.FieldByName('REQUIERE_AUTORIZACION').AsString  := 'No';
  dsFuente.DataSet.FieldByName('REQUIERE_BANCO').AsString         := 'No';
  dsFuente.DataSet.FieldByName('MORATORIO').AsString              := 'No';
  dsFuente.DataSet.FieldByName('REQUIERE_FOLIO').AsString         := 'No';
  dsFuente.DataSet.FieldByName('PLANES_DE_PAGO').AsString         := 'No';
  dsFuente.DataSet.FieldByName('ACTIVAR_ALMACEN').AsString        := 'No';
  dsFuente.DataSet.FieldByName('DAR_CAMBIO').AsString             := 'No';
  deClave.SetFocus;
end;

procedure TfrmCapturar_condiciones_comerciales.ibModificarClick(
  Sender: TObject);
begin
  inherited;
  deClave.SetFocus;
end;

procedure TfrmCapturar_condiciones_comerciales.sbRefreshClick(
  Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TFinanciamientos);
end;

procedure TfrmCapturar_condiciones_comerciales.ibCCClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('� Cambiar Forma de Pago de los CLIENTES por esta condicion comercial ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spCAMBIO_GRAL_CCOMERCIAL.ParamByName('P_CCOMERCIAL').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spCAMBIO_GRAL_CCOMERCIAL.ExecProc;
     spCAMBIO_GRAL_CCOMERCIAL.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_condiciones_comerciales.sbBorrarClick(
  Sender: TObject);
begin
  inherited;
//  cbFinanciamientos.KeyValue := null;
  dsFuente.DataSet.FieldByName('FINANCIAMIENTO').Value := 0;
end;

procedure TfrmCapturar_condiciones_comerciales.TFinanciamientosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
   DataSet.FieldByName('DESCRIPCION_CORTA').AsString := Copy(DataSet.FieldByName('DESCRIPCION').AsString, 1, 35);
end;

end.
