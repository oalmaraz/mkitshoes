
unit UfrmAddPrepoliza;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,     ExtCtrls,
  Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBStoredProc, Buttons,
    DBCtrls , system.Variants;

type
  TfrmAddPrepoliza = class(TForm)
    laCtaContable: TLabel;
    cbPrepolizas: TDBLookupComboBox;
    buActCtas: TBitBtn;
    buLimCtas: TBitBtn;
    qyPrepolizas: TIBQuery;
    dsPrepolizas: TDataSource;
    paBotones: TPanel;
    buAgregar: TBitBtn;
    buCancelar: TBitBtn;
    qyAdd: TIBQuery;
    procedure buCancelarClick(Sender: TObject);
    procedure buActCtasClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
    procedure buAgregarClick(Sender: TObject);
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
  frmAddPrepoliza: TfrmAddPrepoliza;

implementation

uses
  IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmAddPrepoliza.loadData;
begin
   qyPrepolizas.Close;
   qyPrepolizas.Open;
end;

procedure TfrmAddPrepoliza.Limpiar;
begin
   buLimCtas.Click;
end;

procedure TfrmAddPrepoliza.buCancelarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmAddPrepoliza.buActCtasClick(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyPrepolizas);
end;

procedure TfrmAddPrepoliza.buLimCtasClick(Sender: TObject);
begin
//   cbPrepolizas.Value := '';
end;

procedure TfrmAddPrepoliza.buAgregarClick(Sender: TObject);
begin
   if (cbPrepolizas.KeyValue <> null) then
   begin
      qyAdd.Close;
      qyAdd.ParamByName('P_CHEQUE').AsInteger    := awrCheque;
      qyAdd.ParamByName('P_PREPOLIZA').AsInteger := cbPrepolizas.KeyValue;
      qyAdd.Open;

      awrDataSource.DataSet.Close;
      awrDataSource.DataSet.Open;
      
      limpiar;
   end
   else
      ShowMessage('Falta capturar la Pre-Poliza.');
end;

end.
