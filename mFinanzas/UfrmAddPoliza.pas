unit UfrmAddPoliza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls,     StdCtrls,
     Db, IBX.IBCustomDataSet, IBX.IBQuery,
  IBX.IBStoredProc, Buttons, DBCtrls, system.Variants;

type
  TfrmAddPoliza = class(TForm)
    qyCuentas: TIBQuery;
    dsCuentas: TDataSource;
    laCtaContable: TLabel;
    cbCtasContables: TDBLookupComboBox;
    buActCtas: TBitBtn;
    buLimCtas: TBitBtn;
    rgTipo: TRadioGroup;
    edMonto: TEdit;
    Label1: TLabel;
    paBotones: TPanel;
    buAgregar: TBitBtn;
    buCancelar: TBitBtn;
    edOrden: TEdit;
    Orden: TLabel;
    spA_POLIZA_E_DET: TIBStoredProc;
    procedure buCancelarClick(Sender: TObject);
    procedure buAgregarClick(Sender: TObject);
    procedure buActCtasClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
  private
    { Private declarations }
    awrDataSource : TDataSource;
    awrCheque     : integer;
    procedure Limpiar;
  public
    { Public declarations }
    procedure loadData;
  published
     property DataSource : TDataSource read awrDataSource write awrDataSource;
     property Cheque     : integer read awrCheque write awrCheque;
  end;

var
  frmAddPoliza: TfrmAddPoliza;

implementation

uses
  IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmAddPoliza.loadData;
begin
   edOrden.Text := '1';
   
   qyCuentas.Close;
   qyCuentas.Open;
end;

procedure TfrmAddPoliza.buCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmAddPoliza.Limpiar;
var
  lOrden : integer;
begin
   buLimCtas.Click;
   edMonto.Text    := '0';   +
   lOrden :=   StrToInt(edOrden.Text);
   edOrden.Text    := IntToStr(lOrden + 1);
   rgTipo.ItemIndex := -1;
end;

procedure TfrmAddPoliza.buAgregarClick(Sender: TObject);
var
   tipo : String;
begin
   if (cbCtasContables.KeyValue <> null) then
   begin
      tipo := 'C';
      if (rgTipo.ItemIndex = 1) then
         tipo := 'A';
      spA_POLIZA_E_DET.ParamByName('P_CHEQUE').AsInteger := awrCheque;
      spA_POLIZA_E_DET.ParamByName('P_CUENTA').AsInteger := cbCtasContables.KeyValue;
      spA_POLIZA_E_DET.ParamByName('P_TIPO').AsString    := tipo;
      spA_POLIZA_E_DET.ParamByName('P_MONTO').AsFloat    := StrToFloat(edMonto.Text);
      spA_POLIZA_E_DET.ParamByName('P_ORDEN').AsInteger  := StrToInt(edOrden.Text);
      spA_POLIZA_E_DET.ExecProc;
      spA_POLIZA_E_DET.Transaction.CommitRetaining;

      awrDataSource.DataSet.Close;
      awrDataSource.DataSet.Open;

      limpiar;
   end
   else
      ShowMessage('Falta capturar la cuenta contable.');
end;

procedure TfrmAddPoliza.buActCtasClick(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyCuentas);
end;

procedure TfrmAddPoliza.buLimCtasClick(Sender: TObject);
begin
   //cbCtasContables.Text := '';
//   dsSujetos.DataSet.FieldByName('CUENTA').AsVariant := null;
end;

end.
