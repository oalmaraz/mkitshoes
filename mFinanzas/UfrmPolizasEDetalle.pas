unit UfrmPolizasEDetalle;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,
       StdCtrls,
    ExtCtrls,  IBX.IBStoredProc, Buttons, Grids,
  DBGrids;

type
  TfrmPolizasEDetalle = class(TForm)
    dgPartidas: TDBGrid;
    qyPolizas: TIBQuery;
    dsPolizas: TDataSource;
    qyPolizasR_ID: TIntegerField;
    qyPolizasR_CHEQUE: TIntegerField;
    qyPolizasR_CUENTA: TIntegerField;
    qyPolizasR_CUENTA_C: TIBStringField;
    qyPolizasR_CUENTA_N: TIBStringField;
    qyPolizasR_ORDEN: TIntegerField;
    qyPolizasR_CARGO: TFloatField;
    qyPolizasR_ABONO: TFloatField;
    Label1: TLabel;
    laCheque: TLabel;
    paBotones: TPanel;
    buAgregar: TBitBtn;
    buImprimir: TBitBtn;
    buPrepoliza: TBitBtn;
    spE_POLIZAS_E_DET: TIBStoredProc;
    procedure ibSalirClick(Sender: TObject);
    procedure buImprimirClick(Sender: TObject);
    procedure buAgregarClick(Sender: TObject);
    procedure dgPartidasELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buPrepolizaClick(Sender: TObject);
  private
    { Private declarations }
    awrCheque  : integer;
    awrFolio   : integer;
    awrMonto   : double;
    awrMonedaC : string;
    awrMonedaD : string;
  public
    { Public declarations }
    procedure loadData;
  published
     property Cheque   : integer read awrCheque  write awrCheque;
     property Folio    : integer read awrFolio   write awrFolio;
     property Monto    : double  read awrMonto   write awrMonto;
  end;

var
  frmPolizasEDetalle: TfrmPolizasEDetalle;

implementation

uses
  IBModulo, PRN_0018_CHEQUES_TXT, UfrmAddPoliza, reglas_de_negocios,
  UfrmAddPrepoliza;

{$R *.DFM}

procedure TfrmPolizasEDetalle.loadData;
begin
   laCheque.Caption := IntToStr(awrFolio) + ', ' + FormatFloat('$ ###,###,##0.00', awrMonto);

   qyPolizas.Close;
   qyPolizas.ParamByName('P_CHEQUE').AsInteger := awrCheque;
   qyPolizas.Open;
end;

procedure TfrmPolizasEDetalle.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPolizasEDetalle.buImprimirClick(Sender: TObject);
begin
   try
      frmPRN_0018_TXT    := TfrmPRN_0018_TXT.Create(Application);
      frmPRN_0018_TXT.ID := awrCheque;
      frmPRN_0018_TXT.imprimirPoliza;
   finally
      frmPRN_0018_TXT.Release;
   end;
end;

procedure TfrmPolizasEDetalle.buAgregarClick(Sender: TObject);
begin
   try
      frmAddPoliza            := TfrmAddPoliza.Create(Application);
      frmAddPoliza.Cheque     := awrCheque;
      frmAddPoliza.DataSource := dsPolizas;
      frmAddPoliza.loadData;
      frmAddPoliza.ShowModal;
   finally
      frmAddPoliza.Release;
   end;
end;

procedure TfrmPolizasEDetalle.dgPartidasELIMINARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  if MessageDlg('¿ Eliminar Registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      spE_POLIZAS_E_DET.ParamByName('P_ID').AsInteger := dgPartidas.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      spE_POLIZAS_E_DET.ExecProc;
      spE_POLIZAS_E_DET.Transaction.CommitRetaining;

      reglas.refresh_IBQuery(qyPolizas);
   end;
end;

procedure TfrmPolizasEDetalle.buPrepolizaClick(Sender: TObject);
begin
   try
      frmAddPrePoliza            := TfrmAddPrePoliza.Create(Application);
      frmAddPrePoliza.Cheque     := awrCheque;
      frmAddPrePoliza.DataSource := dsPolizas;
      frmAddPrePoliza.loadData;
      frmAddPrePoliza.ShowModal;
   finally
      frmAddPrePoliza.Release;
   end;

end;

end.
