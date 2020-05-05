unit capturar_prepolizas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,   Buttons, Grids,
  DBGrids, Db, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls, ExtCtrls;

type
  TfrmCapturar_prepolizas = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarESTATUS: TIBStringField;
    Label7: TLabel;
    edClave: TDBEdit;
    Label1: TLabel;
    edDescripcion: TDBEdit;
    cbEstatus: TDBEdit;
    Label33: TLabel;
    dgPartidas: TDBGrid;
    paItems: TPanel;
    ibNuevaPartida: TBitBtn;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PREPOLIZA: TIntegerField;
    qyPartidasR_CUENTA_CONTABLE: TIntegerField;
    qyPartidasR_CARGO_ABONO: TIBStringField;
    qyPartidasR_TIPO_A_D: TIBStringField;
    qyPartidasR_PORCENTAJE: TFloatField;
    qyPartidasR_TRAER_PROVEEDOR: TIBStringField;
    qyPartidasR_ORDEN: TIntegerField;
    qyPartidasR_CUENTA_CONTABLE_C: TIBStringField;
    qyPartidasR_CUENTA_CONTABLE_N: TIBStringField;
    spE_PREPOLIZA_DET: TIBStoredProc;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure dgPartidasMODIFICARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_prepolizas: TfrmCapturar_prepolizas;

implementation

uses
  IBModulo, explorar_prepolizas, reglas_de_negocios, UfrmPrepolizas;

{$R *.DFM}

procedure TfrmCapturar_prepolizas.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString := 'Activo';
  edClave.SetFocus;
end;

procedure TfrmCapturar_prepolizas.ibModificarClick(Sender: TObject);
begin
  inherited;
  edClave.SetFocus;
end;

procedure TfrmCapturar_prepolizas.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_prepolizas.ibNuevaPartidaClick(Sender: TObject);
begin
  inherited;
  try
     frmPrepolizas            := TfrmPrepolizas.Create(Application);
     frmPrepolizas.ID         := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmPrepolizas.DataSource := dsPartidas;
     frmPrepolizas.ShowModal;
  finally
     frmPrepolizas.Release;
  end;
end;

procedure TfrmCapturar_prepolizas.dgPartidasMODIFICARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  try
     frmPrepolizas            := TfrmPrepolizas.Create(Application);
     frmPrepolizas.MODIFICAR  := true; 
     frmPrepolizas.ID         := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     frmPrepolizas.CC         := dsPartidas.DataSet.FieldByName('R_CUENTA_CONTABLE').AsInteger;
     frmPrepolizas.TIPO       := dsPartidas.DataSet.FieldByName('R_CARGO_ABONO').AsString;
     frmPrepolizas.IMPUESTO   := dsPartidas.DataSet.FieldByName('R_TIPO_A_D').AsString;
     frmPrepolizas.PROVEEDOR  := dsPartidas.DataSet.FieldByName('R_CARGO_ABONO').AsString;
     frmPrepolizas.PORCENTAJE := dsPartidas.DataSet.FieldByName('R_PORCENTAJE').AsFloat;
     frmPrepolizas.ORDEN      := dsPartidas.DataSet.FieldByName('R_ORDEN').AsInteger;
     frmPrepolizas.DataSource := dsPartidas;
     frmPrepolizas.ShowModal;
  finally
     frmPrepolizas.Release;
  end;

end;

procedure TfrmCapturar_prepolizas.dgPartidasELIMINARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  if MessageDlg('¿ Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spE_PREPOLIZA_DET.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     spE_PREPOLIZA_DET.ExecProc;
     spE_PREPOLIZA_DET.Transaction.CommitRetaining;

     reglas.refresh_IBQuery(qyPartidas);
  end;
end;

end.


