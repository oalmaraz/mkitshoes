unit PRN_0020_MOV_SC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg, Db, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Buttons, DBCtrls,
  ComCtrls, ExtCtrls ;

type
  TfrmPRN_0020 = class(TfrmPadre)
    qyEstatusProcesos: TIBQuery;
    dsEstatusProcesos: TDataSource;
    Label1: TLabel;
    deFecha: TDateTimePicker;
    cbTodos: TCheckBox;
    Label2: TLabel;
    cbEstatus: TDBLookupComboBox;
    ibImprimir: TBitBtn;
    ibCerrar: TBitBtn;
    dsCheques: TDataSource;
    qyMovimientosResumen: TIBQuery;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyMovimientos: TIBQuery;
    IntegerField1: TIntegerField;
    DateTimeField1: TDateTimeField;
    IntegerField2: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    FloatField1: TFloatField;
    IntegerField3: TIntegerField;
    IBStringField4: TIBStringField;
    IBStringField5: TIBStringField;
    IntegerField4: TIntegerField;
    IBStringField6: TIBStringField;
    IBStringField7: TIBStringField;
    IntegerField5: TIntegerField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    DateTimeField2: TDateTimeField;
    FloatField2: TFloatField;
    qyMovimientosResumenR_MONTO: TFloatField;
    qyMovimientosResumenR_MONEDA_DESCRIPCION: TIBStringField;
    procedure cbTodosChange(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure qyMovimientosResumenCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    cambio : boolean;
  public
    { Public declarations }
  end;

var
  frmPRN_0020: TfrmPRN_0020;

implementation

uses reglas_de_negocios;

{$R *.DFM}

procedure TfrmPRN_0020.cbTodosChange(Sender: TObject);
begin
  inherited;
  cbEstatus.Enabled := not(cbTodos.Checked);
end;

procedure TfrmPRN_0020.ibImprimirClick(Sender: TObject);
begin
  inherited;
   {
  if laEstatus.Caption <> '' then
  begin
     qyMovimientos.Close;
     qyMovimientos.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',deFecha.Date);
     qyMovimientos.ParamByName('P_ESTATUS').AsString := laEstatus.Caption;
     qyMovimientos.Open;

     qyMovimientosResumen.Close;
     qyMovimientosResumen.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',deFecha.Date);
     qyMovimientosResumen.ParamByName('P_ESTATUS').AsString := laEstatus.Caption;
     qyMovimientosResumen.Open;

     crUnion.Preview;
  end
  else
     ShowMessage('Requiere dato de estatus, para imprimir el reporte');
      }
end;

procedure TfrmPRN_0020.qyMovimientosResumenCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('R_ESTATUS').AsString = 'Afectado' then
     DataSet.FieldByName('TOTALAFECTADO').AsFloat := DataSet.FieldByName('R_MONTO').AsFloat
  else
     DataSet.FieldByName('TOTALAFECTADO').AsFloat := 0.00;
end;



procedure TfrmPRN_0020.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyMovimientos);
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyEstatusProcesos);
end;


end.
