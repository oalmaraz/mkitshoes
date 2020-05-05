unit capturar_movimientos_clasificados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  hijo, Db, IBX.IBCustomDataSet, IBX.IBQuery,   DBCtrls,
  StdCtrls, Mask,  jpeg,  ExtCtrls,

  Buttons, Grids, DBGrids, ComCtrls;

type
  TfrmCapturar_Movimientos_Clasificados = class(TfrmHijo)
    qyMovimientos: TIBQuery;
    dgMovimientos: TDBGrid;
    qyMovimientosR_ID: TIntegerField;
    qyMovimientosR_FECHA_ALTA: TDateTimeField;
    qyMovimientosR_CHEQUERA: TIntegerField;
    qyMovimientosR_CUENTA_DE_CHEQUES: TIBStringField;
    qyMovimientosR_CC: TIntegerField;
    qyMovimientosR_CC_NOMBRE: TIBStringField;
    qyMovimientosR_TIPO: TIBStringField;
    qyMovimientosR_REFERENCIA: TIBStringField;
    qyMovimientosR_MONTO: TFloatField;
    qyMovimientosR_MONEDA: TIntegerField;
    qyMovimientosR_MONEDA_CLAVE: TIBStringField;
    qyMovimientosR_MONEDA_DESCRIPCION: TIBStringField;
    qyMovimientosR_AUTORIZO: TIntegerField;
    qyMovimientosR_AUTORIZO_NOMBRE: TIBStringField;
    qyMovimientosR_MOV_SIN_CLASIFICAR: TIntegerField;
    qyMovimientosR_ESTATUS: TIBStringField;
    qyMovimientosR_SEL: TIBStringField;
    qyMovimientosR_MONTO_CARGO: TFloatField;
    qyMovimientosR_MONTO_ABONO: TFloatField;
    Label1: TLabel;
    deFechaInicial: TDateTimePicker;
    Label2: TLabel;
    deFechaFinal: TDateTimePicker;
    ibImprimir: TBitBtn;
    ibExportarXLS: TBitBtn;
    ibExportarHTML: TBitBtn;
    ibExportarXML: TBitBtn;
    ibFiltrar: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ibExportarXLSClick(Sender: TObject);
    procedure ibExportarHTMLClick(Sender: TObject);
    procedure ibExportarXMLClick(Sender: TObject);
    procedure ibFiltrarClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_Movimientos_Clasificados: TfrmCapturar_Movimientos_Clasificados;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_Movimientos_Clasificados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCapturar_Movimientos_Clasificados.FormCreate(
  Sender: TObject);
begin
  inherited;
  deFechaInicial.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  deFechaFinal.Date   := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  qyMovimientos.Close;
  qyMovimientos.ParamByName('P_FECHA_INICIAL').AsString := FormatDateTime('dd/mm/yyyy',deFechaInicial.Date);
  qyMovimientos.ParamByName('P_FECHA_FINAL').AsString   := FormatDateTime('dd/mm/yyyy',deFechaInicial.Date);
  qyMovimientos.Open;
end;

procedure TfrmCapturar_Movimientos_Clasificados.ibExportarXLSClick(
  Sender: TObject);
begin
  inherited;
//  reglas.Save('xls', 'Microsoft Excel 4.0 Worksheet (*.xls)|*.xls', 'Movimientos_del_'+FormatDateTime('ddmmyyyy',deFechaInicial.Date)+'_al_'+FormatDateTime('ddmmyyyy',deFechaFinal.Date)+'.xls', dgMovimientos.SaveToXLS);
end;

procedure TfrmCapturar_Movimientos_Clasificados.ibExportarHTMLClick(
  Sender: TObject);
begin
  inherited;
//  reglas.Save('htm', 'HTML File (*.htm; *.html)|*.htm', 'Movimientos del '+FormatDateTime('dd/mm/yyyy',deFechaInicial.Date)+' al '+FormatDateTime('dd/mm/yyyy',deFechaFinal.Date)+'.htm', dgMovimientos.SaveToHTML);
end;

procedure TfrmCapturar_Movimientos_Clasificados.ibExportarXMLClick(
  Sender: TObject);
begin
  inherited;
//  reglas.Save('xml', 'XML File (*.xml)|*.xml', 'Movimientos del '+FormatDateTime('dd/mm/yyyy',deFechaInicial.Date)+' al '+FormatDateTime('dd/mm/yyyy',deFechaFinal.Date)+'.xml', dgMovimientos.SaveToXML);
end;


procedure TfrmCapturar_Movimientos_Clasificados.ibFiltrarClick(
  Sender: TObject);
begin
  inherited;
  qyMovimientos.Close;
  qyMovimientos.ParamByName('P_FECHA_INICIAL').AsString := FormatDateTime('dd/mm/yyyy',deFechaInicial.Date);
  qyMovimientos.ParamByName('P_FECHA_FINAL').AsString   := FormatDateTime('dd/mm/yyyy',deFechaFinal.Date);
  qyMovimientos.Open;
end;

procedure TfrmCapturar_Movimientos_Clasificados.buInicioClick(
  Sender: TObject);
begin
  inherited;
  dgMovimientos.DataSource.DataSet.First;
end;

procedure TfrmCapturar_Movimientos_Clasificados.buAnteriorClick(
  Sender: TObject);
begin
  inherited;
  dgMovimientos.DataSource.DataSet.Prior;
end;

procedure TfrmCapturar_Movimientos_Clasificados.buSiguienteClick(
  Sender: TObject);
begin
  inherited;
  dgMovimientos.DataSource.DataSet.Next;
end;

procedure TfrmCapturar_Movimientos_Clasificados.buFinClick(
  Sender: TObject);
begin
  inherited;
  dgMovimientos.DataSource.DataSet.Last;
end;

end.
