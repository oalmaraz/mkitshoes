unit URPT_SEGUIMIENTO_SEM_DET_PAGOS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TRPT_SEGUIMIENTO_SEM_DET_PAGOS = class(TForm)
    qyReporte: TIBQuery;
    qyEtiquetas: TIBQuery;
    qyEtiquetasR_ETIQ_0_A_6: TIBStringField;
    qyEtiquetasR_ETIQ_7_A_13: TIBStringField;
    qyEtiquetasR_ETIQ_14_A_20: TIBStringField;
    qyEtiquetasR_ETIQ_21_A_27: TIBStringField;
    qyEtiquetasR_ETIQ_28_A_34: TIBStringField;
    qyResumen: TIBQuery;
    qyResumenR_0_A_6: TFloatField;
    qyResumenR_7_A_13: TFloatField;
    qyResumenR_14_A_20: TFloatField;
    qyResumenR_21_A_27: TFloatField;
    qyResumenR_28_A_34: TFloatField;
    qyResumenR_MONEDA: TIntegerField;
    qyResumenR_MONEDA_C: TIBStringField;
    qyResumenR_MONEDA_D: TIBStringField;
    qyEtiquetasR_ETIQ_35_A_41: TIBStringField;
    qyEtiquetasR_ETIQ_42_A_48: TIBStringField;
    qyEtiquetasR_ETIQ_49_A_55: TIntegerField;
    qyResumenR_35_A_41: TFloatField;
    qyResumenR_42_A_48: TFloatField;
    qyResumenR_49_A_55: TFloatField;
    procedure QRDBText4Print(sender: TObject; var Value: String);
    procedure QRDBText5Print(sender: TObject; var Value: String);
    procedure QRDBText6Print(sender: TObject; var Value: String);
    procedure QRDBText7Print(sender: TObject; var Value: String);
    procedure QRDBText8Print(sender: TObject; var Value: String);
  private
     { Private declarations }
     colorea : boolean;
     procedure setFecha(valor : TDatetime);
  public
     { Public declarations }
     awrFecha     : TDatetime;
     awrProveedor : word;
     procedure open;
     procedure openResumen;
     procedure imprimir;
     procedure imprimirResumen;
  published
     property FECHA     : TDatetime write setFecha;
     property PROVEEDOR : word write awrProveedor;
  end;

var
  RPT_SEGUIMIENTO_SEM_DET_PAGOS: TRPT_SEGUIMIENTO_SEM_DET_PAGOS;

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.open;
begin
   qyEtiquetas.Close;
   qyEtiquetas.ParamByName('P_FECHA').AsDate := awrFecha;
   qyEtiquetas.Open;

   qyReporte.Close;
   qyReporte.ParamByName('P_FECHA').AsDate        := awrFecha;
   qyReporte.ParamByName('P_PROVEEDOR').AsInteger := awrProveedor;
   qyReporte.Open;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.openResumen;
begin
   qyEtiquetas.Close;
   qyEtiquetas.ParamByName('P_FECHA').AsDate := awrFecha;
   qyEtiquetas.Open;

   qyResumen.Close;
   qyResumen.ParamByName('P_FECHA').AsDate        := awrFecha;
   qyResumen.ParamByName('P_PROVEEDOR').AsInteger := awrProveedor;
   qyResumen.Open;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.imprimir;
begin
   //qrReporte.PreviewModal;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.imprimirResumen;
begin
   //qrResumen.PreviewModal;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.setFecha(valor : TDatetime);
begin
   awrFecha               := valor;
   //laFecha.Caption        := FormatDateTime('DD.MM.YYYY', awrFecha);
   //laFechaResumen.Caption := FormatDateTime('DD.MM.YYYY', awrFecha);
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.QRDBText4Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.QRDBText5Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.QRDBText6Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.QRDBText7Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;

procedure TRPT_SEGUIMIENTO_SEM_DET_PAGOS.QRDBText8Print(sender: TObject;
  var Value: String);
begin
   if Value = '0.00' then
      Value := '';
end;


end.
