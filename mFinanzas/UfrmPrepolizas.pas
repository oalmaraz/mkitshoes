unit UfrmPrepolizas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,   ExtCtrls,
  Buttons,  IBX.IBStoredProc, DBCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery, System.Variants ;

type
  TfrmPrepolizas = class(TForm)
    qyCuentas: TIBQuery;
    dsCuentas: TDataSource;
    laCtaContable: TLabel;
    cbCtasContables: TDBLookupComboBox;
    buActCtas: TBitBtn;
    buLimCtas: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    edPorcentaje: TEdit;
    Label4: TLabel;
    paBotones: TPanel;
    buGuardar: TBitBtn;
    buCancelar: TBitBtn;
    spA_PREPOLIZA_DET: TIBStoredProc;
    edOrden: TEdit;
    Label7: TLabel;
    rgTipo: TRadioGroup;
    rgImpuestos: TRadioGroup;
    rgProveedores: TRadioGroup;
    spM_PREPOLIZA_DET: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
    procedure buActCtasClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure buGuardarClick(Sender: TObject);
    procedure buCancelarClick(Sender: TObject);
  private
    { Private declarations }
    awrID        : integer;
    awrModificar : Boolean;
    dsPartidas : TDataSource;
    procedure limpiar;
    procedure setCC(valor : integer);
    procedure setTIPO(valor : string);
    procedure setIMPUESTO(valor : string);
    procedure setPROVEEDOR(valor : string);
    procedure setPORCENTAJE(valor : double);
    procedure setORDEN(valor : integer);
  public
    { Public declarations }
  published
     property ID         : integer read awrID write awrID;
     property CC         : integer write setCC;
     property TIPO       : string write setTIPO;
     property IMPUESTO   : string write setIMPUESTO;
     property PROVEEDOR  : string write setPROVEEDOR;
     property PORCENTAJE : double write setPORCENTAJE;
     property ORDEN      : integer write setORDEN;
     property DataSource : TDataSource write dsPartidas;
     property MODIFICAR  : Boolean write awrModificar;
  end;

var
  frmPrepolizas: TfrmPrepolizas;

implementation

uses
  reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmPrepolizas.setCC(valor : integer);
begin
   cbCtasContables.keyvalue := 0;
   if (valor <> 0) then
      cbCtasContables.KeyValue := valor;
end;

procedure TfrmPrepolizas.setTIPO(valor : string);
begin
   rgTipo.ItemIndex := 0;
   if (valor = 'A') then
      rgTipo.ItemIndex := 1
end;

procedure TfrmPrepolizas.setIMPUESTO(valor : string);
begin
   rgImpuestos.ItemIndex := 0;
   if (valor = 'D') then
      rgImpuestos.ItemIndex := 1
end;

procedure TfrmPrepolizas.setPROVEEDOR(valor : string);
begin
   rgProveedores.ItemIndex := 0;
   if (valor = 'Si') then
      rgProveedores.ItemIndex := 1
end;

procedure TfrmPrepolizas.setPORCENTAJE(valor : double);
begin
   edPorcentaje.Text := FloatToStr(valor);
end;

procedure TfrmPrepolizas.setORDEN(valor : integer);
begin
   edOrden.Text := FloatToStr(valor);
end;

procedure TfrmPrepolizas.limpiar;
begin
   cbCtasContables.KeyValue := 0;
   rgTipo.ItemIndex        := 0;
   rgImpuestos.ItemIndex   := 0;
   rgProveedores.ItemIndex := 0;
   edPorcentaje.Text      := '0';
end;

procedure TfrmPrepolizas.FormCreate(Sender: TObject);
begin
   awrID        := 0;
   awrModificar := false;
   reglas.refresh_IBQuery(qyCuentas);
   limpiar;
end;

procedure TfrmPrepolizas.buActCtasClick(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyCuentas);
end;

procedure TfrmPrepolizas.buLimCtasClick(Sender: TObject);
begin
   cbCtasContables.KeyValue := 0;
end;

procedure TfrmPrepolizas.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrepolizas.buGuardarClick(Sender: TObject);
var
   v_cc        : integer;
   v_tipo      : string;
   v_impuesto  : string;
   v_proveedor : string;
begin
   if (cbCtasContables.KeyValue = null) then
      v_cc := 0
   else
      v_cc := cbCtasContables.KeyValue;

   if (rgTipo.ItemIndex = 0) then
      v_tipo := 'C'
   else
      v_tipo := 'A';

   if (rgImpuestos.ItemIndex = 0) then
      v_impuesto := 'A'
   else
      v_impuesto := 'D';

   if (rgProveedores.ItemIndex = 0) then
      v_proveedor := 'No'
   else
      v_proveedor := 'Si';

   if (awrModificar) then
   begin
      spM_PREPOLIZA_DET.ParamByName('P_ID').AsInteger             := ID;
      spM_PREPOLIZA_DET.ParamByName('P_CC').AsInteger             := v_cc;
      spM_PREPOLIZA_DET.ParamByName('P_CARGO_ABONO').AsString     := v_tipo;
      spM_PREPOLIZA_DET.ParamByName('P_TIPO_A_D').AsString        := v_impuesto;
      spM_PREPOLIZA_DET.ParamByName('P_PORCENTAJE').AsFloat       := StrToFloat(edPorcentaje.Text);
      spM_PREPOLIZA_DET.ParamByName('P_TRAER_PROVEEDOR').AsString := v_proveedor;
      spM_PREPOLIZA_DET.ParamByName('P_ORDEN').AsInteger          := StrToInt(edOrden.Text);
      spM_PREPOLIZA_DET.ExecProc;
      spA_PREPOLIZA_DET.Transaction.CommitRetaining;
   end
   else
   begin
      spA_PREPOLIZA_DET.ParamByName('P_ID').AsInteger             := ID;
      spA_PREPOLIZA_DET.ParamByName('P_CC').AsInteger             := v_cc;
      spA_PREPOLIZA_DET.ParamByName('P_CARGO_ABONO').AsString     := v_tipo;
      spA_PREPOLIZA_DET.ParamByName('P_TIPO_A_D').AsString        := v_impuesto;
      spA_PREPOLIZA_DET.ParamByName('P_PORCENTAJE').AsFloat       := StrToFloat(edPorcentaje.Text);;
      spA_PREPOLIZA_DET.ParamByName('P_TRAER_PROVEEDOR').AsString := v_proveedor;
      spA_PREPOLIZA_DET.ParamByName('P_ORDEN').AsInteger          := StrToInt(edOrden.Text);
      spA_PREPOLIZA_DET.ExecProc;
      spA_PREPOLIZA_DET.Transaction.CommitRetaining;
   end;

   dsPartidas.DataSet.Close;
   dsPartidas.DataSet.Open;

   if (awrModificar) then
      close
   else
   begin
      limpiar;
      cbCtasContables.SetFocus;
   end;
end;

procedure TfrmPrepolizas.buCancelarClick(Sender: TObject);
begin
   Close;
end;

end.
