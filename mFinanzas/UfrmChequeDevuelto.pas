unit UfrmChequeDevuelto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls,
   Db, IBX.IBCustomDataSet, IBX.IBStoredProc, ExtCtrls, Buttons;

type
  TfrmChequeDevuelto = class(TForm)
    edReferencia: TEdit;
    Label1: TLabel;
    gbNotaDeCargo: TGroupBox;
    cbPorcentaje: TCheckBox;
    Label5: TLabel;
    edNCMonto: TEdit;
    edPorcentaje: TEdit;
    Label6: TLabel;
    ibEjecutar: TBitBtn;
    sbEstatus: TPanel;
    ibSalir: TBitBtn;
    spCHEQUE_DEVUELTO: TIBStoredProc;
    edMonto: TEdit;
    Label2: TLabel;
    procedure cbPorcentajeChange(Sender: TObject);
    procedure edMontoChange(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure edPorcentajeChange(Sender: TObject);
    procedure ibEjecutarClick(Sender: TObject);
  private
    { Private declarations }
    awrID      : integer;
    awrUsuario : integer;
    awrCheques : boolean;
    procedure setReferencia(valor : string);
    procedure setMonto(valor : double);
  public
    { Public declarations }
  published
     property ID_PAGO    : integer read awrID write awrID;
     property Usuario    : integer read awrUsuario write awrUsuario;
     property Referencia : string write setReferencia;
     property Monto      : double write setMonto;
     property Cheques    : boolean read awrCheques write awrCheques;
  end;

var
  frmChequeDevuelto: TfrmChequeDevuelto;

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TfrmChequeDevuelto.setMonto(valor : double);
begin
   edMonto.Text := FloatToStr(valor);
   edMontoChange(nil);
end;

procedure TfrmChequeDevuelto.setReferencia(valor : string);
begin
   edReferencia.Text := valor;
end;

procedure TfrmChequeDevuelto.cbPorcentajeChange(Sender: TObject);
begin
   edNCMonto.Enabled    := not(cbPorcentaje.Checked);
   edPorcentaje.Enabled := cbPorcentaje.Checked;
   if not(edPorcentaje.Enabled) then
   begin
      edPorcentaje.Text := '0';
   end;
   if not(edNCMonto.Enabled) then
   begin
      edNCMonto.Text := '0';
   end;
   if edPorcentaje.Enabled then
      edPorcentaje.SetFocus
   else
      edNCMonto.SetFocus;
end;

procedure TfrmChequeDevuelto.edMontoChange(Sender: TObject);
begin
   if cbPorcentaje.Checked and (edPorcentaje.text <> '0') then
   begin
      edPorcentajeChange(Sender);
   end
end;

procedure TfrmChequeDevuelto.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmChequeDevuelto.edPorcentajeChange(Sender: TObject);
var
  lMonto :double;
  lPorcentaje :double;
begin
   lMonto := StrToFloat(edMonto.Text);
   lPorcentaje := StrToFloat(edPorcentaje.Text);
   edNCMonto.Text := FloatToStr( lMonto * (lPorcentaje / 100));
end;

procedure TfrmChequeDevuelto.ibEjecutarClick(Sender: TObject);
var
   auto : string;
   msj  : string;
begin
   if cbPorcentaje.Checked then
      auto := 'Si'
   else
      auto := 'No';
   spCHEQUE_DEVUELTO.ParamByName('P_CXC_PAGO').AsInteger  := ID_PAGO;
   spCHEQUE_DEVUELTO.ParamByName('P_REFERENCIA').AsString := edReferencia.Text;
   spCHEQUE_DEVUELTO.ParamByName('P_MONTO').AsFloat       := StrToFloat(edMonto.Text);
   spCHEQUE_DEVUELTO.ParamByName('P_AUTO').AsString       := auto;
   spCHEQUE_DEVUELTO.ParamByName('P_NC_PORC').AsFloat     := StrToFloat(edPorcentaje.Text);
   spCHEQUE_DEVUELTO.ParamByName('P_NC_MONTO').AsFloat    := StrToFloat(edNCMonto.Text);
   spCHEQUE_DEVUELTO.ParamByName('P_USUARIO').AsInteger    := Usuario;
   spCHEQUE_DEVUELTO.ExecProc;
   spCHEQUE_DEVUELTO.Transaction.CommitRetaining;
   awrCheques := true;

   msj := 'Se genero con exito su nota de cargo 1, con id: '+spCHEQUE_DEVUELTO.ParamByName('R_ID_1').AsString;
   if spCHEQUE_DEVUELTO.ParamByName('R_ID_2').AsInteger <> 0 then
      msj := msj + #13 + 'Y tambien su cargo en nota de cargo 2, con id: '+spCHEQUE_DEVUELTO.ParamByName('R_ID_2').AsString;
   ShowMessage(msj);

   Close;
end;

end.
