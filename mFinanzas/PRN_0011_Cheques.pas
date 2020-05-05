unit PRN_0011_Cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls,    StdCtrls,
  ComCtrls, Buttons;

type
  TfrmPRN_0011 = class(TfrmPadre)
    Label1: TLabel;
    deFecha: TDateTimePicker;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    cbTodos: TCheckBox;
    Label2: TLabel;
    cbEstatus: TDBLookupComboBox;
    qyEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    qyCheques: TIBQuery;
    qyChequesR_ID: TIntegerField;
    qyChequesR_TIPO: TIBStringField;
    qyChequesR_REFERENCIA: TIBStringField;
    qyChequesR_AUTORIZACION: TIBStringField;
    qyChequesR_MONTO: TFloatField;
    qyChequesR_CLIENTE: TIntegerField;
    qyChequesR_CLIENTE_NOMBRE: TIBStringField;
    qyChequesR_EXTENSION: TIntegerField;
    qyChequesR_EXTENSION_NOMBRE: TIBStringField;
    qyChequesR_FECHA_ALTA: TDateTimeField;
    qyChequesR_FECHA_APLICACION: TDateTimeField;
    qyChequesR_FECHA_APLICACION_REAL: TDateTimeField;
    qyChequesR_BANCO: TIntegerField;
    qyChequesR_BANCO_NOMBRE: TIBStringField;
    qyChequesR_ID_REFERENCIA: TIntegerField;
    qyChequesR_OBSERVACIONES: TBlobField;
    qyChequesESTATUS: TIBStringField;
    dsCheques: TDataSource;
    qyChequestotalCobrado: TFloatField;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure cbTodosChange(Sender: TObject);
    procedure qyChequesCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    cambio : boolean;
  public
    { Public declarations }
  end;

var
  frmPRN_0011: TfrmPRN_0011;

implementation

uses reglas_de_negocios;

{$R *.DFM}

procedure TfrmPRN_0011.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyEmpresa);
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyEstatusProcesos);
end;

procedure TfrmPRN_0011.cbTodosChange(Sender: TObject);
begin
  inherited;
  cbEstatus.Enabled := not(cbTodos.Checked);
end;


procedure TfrmPRN_0011.qyChequesCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('ESTATUS').AsString = 'Cobrado' then
     DataSet.FieldByName('TOTALCOBRADO').AsFloat := DataSet.FieldByName('R_MONTO').AsFloat
  else
     DataSet.FieldByName('TOTALCOBRADO').AsFloat := 0.00;
end;

end.
