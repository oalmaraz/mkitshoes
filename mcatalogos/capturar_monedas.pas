unit capturar_monedas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, Db,
    DBCtrls, StdCtrls, IBX.IBStoredProc, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery, Mask,    jpeg,
   ExtCtrls,  Buttons, Grids, DBGrids;

type
  TfrmCapturar_monedas = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarFECHA_ULT_ACT: TDateTimeField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    deClave: TDBEdit;
    deDescripcion: TDBEdit;
    dgHistorico: TDBGrid;
    qyMonedas_Historico: TIBQuery;
    dsMonedas_Historico: TDataSource;
    deParidad: TDBEdit;
    spADD_MONEDAS_HISTORICO: TIBStoredProc;
    edMonedaBase: TEdit;
    edMonedaInternacional: TEdit;
    dePDescripcion: TDBEdit;
    deFUltAct: TDBEdit;
    Label9: TLabel;
    buMBase: TSpeedButton;
    qyMonedas_HistoricoR_ID: TIntegerField;
    qyMonedas_HistoricoR_MONEDA: TIntegerField;
    qyMonedas_HistoricoR_FECHA_CAMBIO: TDateTimeField;
    qyMonedas_HistoricoR_MBASE: TIntegerField;
    qyMonedas_HistoricoR_MBASE_PARIDAD: TFloatField;
    qyMonedas_HistoricoR_MBASE_CLAVE: TIBStringField;
    qyMonedas_HistoricoR_ROW: TIntegerField;
    dxDBCurrencyEdit1: TDBEdit;
    TCapturarPARIDAD: TFloatField;
    TCapturarPARIDAD_FALSA: TFloatField;
    qyMonedas_HistoricoR_PARIDAD: TFloatField;
    qyMonedas_HistoricoR_PARIDAD_FALSA: TFloatField;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure buMBaseClick(Sender: TObject);
    procedure deParidadChange(Sender: TObject);
  private
    { Private declarations }
    paridad          : double;
    falsa            : double;
    awrMBaseC        : string;
    awrInternacional : integer;
  public
    { Public declarations }
  end;

var
  frmCapturar_monedas: TfrmCapturar_monedas;

implementation

uses IBModulo, explorar_monedas, IBData, reglas_de_negocios, UfrmValor;

{$R *.DFM}

procedure TfrmCapturar_monedas.FormActivate(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  reglas.abrir_IBTabla(dmIBData.TFiltroMonedas);
  dmIBData.TPreferencias.Filter  := 'ID = 3';//Moneda Base
  dmIBData.TFiltroMonedas.Filter := 'ID = '+IntToStr(dmIBData.TPreferencias.FieldByName('VALOR').AsInteger);
  awrMBaseC                      := dmIBData.TFiltroMonedas.FieldByName('CLAVE').AsString;
  edMonedaBase.Text              := '1 ' + dmIBData.TFiltroMonedas.FieldByName('DESCRIPCION').AsString;
  dmIBData.TPreferencias.Filter  := 'ID = 4';//Moneda Internacional
  dmIBData.TFiltroMonedas.Filter := 'ID = '+IntToStr(dmIBData.TPreferencias.FieldByName('VALOR').AsInteger);
  edMonedaInternacional.Text     := dmIBData.TFiltroMonedas.FieldByName('DESCRIPCION').AsString;
end;

procedure TfrmCapturar_monedas.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  //moneda internacional
  dmIBData.TPreferencias.Filter := 'ID = 4';
  awrInternacional := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

  inherited;
  reglas.refresh_IBQuery(qyMonedas_Historico);
end;

procedure TfrmCapturar_monedas.ibNuevoClick(Sender: TObject);
begin
  inherited;
  falsa := 0;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('FECHA_ULT_ACT').AsDatetime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('PARIDAD').AsFloat          := 0.00;
  dsFuente.DataSet.FieldByName('PARIDAD_FALSA').AsFloat    := 0.00;
  deClave.SetFocus;
end;

procedure TfrmCapturar_monedas.ibModificarClick(Sender: TObject);
begin
  inherited;
  paridad := dsFuente.DataSet.FieldByName('PARIDAD').AsFloat;
  falsa   := dsFuente.DataSet.FieldByName('PARIDAD_FALSA').AsFloat;
  deParidad.SetFocus;
end;

procedure TfrmCapturar_monedas.ibGuardarClick(Sender: TObject);
var
   estado : TDataSetState;
   paridad : double;
begin
  estado := dsFuente.DataSet.State;
  if estado in [dsEdit] then
  begin
     dmIBData.spFECHA_SERVIDOR.ExecProc;
     dsFuente.DataSet.FieldByName('FECHA_ULT_ACT').AsDatetime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  end;
  inherited;
  if estado = dsEdit then
  begin
     paridad :=  StrToFloat(deParidad.text) ;
     if paridad <> paridad then
     begin
        spADD_MONEDAS_HISTORICO.ParamByName('P_ID').AsInteger          := dsFuente.DataSet.FieldByName('ID').AsInteger;
        spADD_MONEDAS_HISTORICO.ParamByName('P_PARIDAD').AsFloat       := paridad;
        spADD_MONEDAS_HISTORICO.ParamByName('P_PARIDAD_FALSA').AsFloat := falsa;
        spADD_MONEDAS_HISTORICO.ExecProc;
        spADD_MONEDAS_HISTORICO.Transaction.CommitRetaining;
        reglas.refresh_IBQuery(qyMonedas_Historico);
     end;
  end;
end;

procedure TfrmCapturar_monedas.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyMonedas_Historico);
end;

procedure TfrmCapturar_monedas.buMBaseClick(Sender: TObject);
var
   rsp   : boolean;
   tc    : double;
   valor : double;
begin
  inherited;
  try
     frmValor         := TfrmValor.Create(Application);
     frmValor.TITULO  := '1 '+dsFuente.DataSet.FieldByName('CLAVE').AsString+' = ? '+awrMBaseC;
     frmValor.ShowModal;
     rsp   := frmValor.Result;
     valor := frmValor.VALOR;
  finally
     frmValor.Free;
  end;

  if (rsp) then
  begin
     tc := 0;
     if valor <> 0 then
        tc := 1 / valor;
     dsFuente.DataSet.FieldByName('PARIDAD').AsFloat       := tc;
     dsFuente.DataSet.FieldByName('PARIDAD_FALSA').AsFloat := valor;
     ibGuardar.Click;
  end;
end;

procedure TfrmCapturar_monedas.deParidadChange(Sender: TObject);
var
  paridad : double;
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
  begin
     dsFuente.DataSet.FieldByName('PARIDAD_FALSA').AsFloat := 0;
     paridad := StrToFloat(deParidad.Text);
     if paridad <> 0 then
     begin
        dsFuente.DataSet.FieldByName('PARIDAD_FALSA').AsFloat := 1 / paridad;
     end;
  end;
end;

end.
