unit URPT_SEGUIMIENTO_SEM_DET;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ExtCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TRPT_SEGUIMIENTO_SEM_DET = class(TForm)
    qyReporte: TIBQuery;
    qyEtiquetas: TIBQuery;
    qyResumen: TIBQuery;
    qyResumenR_0_A_6: TFloatField;
    qyResumenR_7_A_13: TFloatField;
    qyResumenR_14_A_20: TFloatField;
    qyResumenR_21_A_27: TFloatField;
    qyResumenR_28_A_34: TFloatField;
    qyResumenR_MONEDA: TIntegerField;
    qyResumenR_MONEDA_C: TIBStringField;
    qyResumenR_MONEDA_D: TIBStringField;
    qyEtiquetasR_ETIQ_0_A_6: TIBStringField;
    qyEtiquetasR_ETIQ_7_A_13: TIBStringField;
    qyEtiquetasR_ETIQ_14_A_20: TIBStringField;
    qyEtiquetasR_ETIQ_21_A_27: TIBStringField;
    qyEtiquetasR_ETIQ_28_A_34: TIBStringField;
    qyEtiquetasR_ETIQ_35_A_41: TIBStringField;
    qyEtiquetasR_ETIQ_42_A_48: TIBStringField;
    qyEtiquetasR_ETIQ_49_A_55: TIBStringField;
  private
     { Private declarations }
     colorea : boolean;
     procedure setFecha(valor : TDatetime);
  public
     { Public declarations }
     awrFecha   : TDatetime;
     awrCliente : word;
     procedure open;
     procedure openResumen;
     procedure imprimir;
     procedure imprimirResumen;
  published
     property FECHA   : TDatetime write setFecha;
     property CLIENTE : word write awrCliente;
  end;

var
  RPT_SEGUIMIENTO_SEM_DET: TRPT_SEGUIMIENTO_SEM_DET;

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TRPT_SEGUIMIENTO_SEM_DET.open;
begin
   qyEtiquetas.Close;
   qyEtiquetas.ParamByName('P_FECHA').AsDate := awrFecha;
   qyEtiquetas.Open;

   qyReporte.Close;
   qyReporte.ParamByName('P_FECHA').AsDate      := awrFecha;
   qyReporte.ParamByName('P_CLIENTE').AsInteger := awrCliente;
   qyReporte.Open;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET.openResumen;
begin
   qyEtiquetas.Close;
   qyEtiquetas.ParamByName('P_FECHA').AsDate := awrFecha;
   qyEtiquetas.Open;

   qyResumen.Close;
   qyResumen.ParamByName('P_FECHA').AsDate      := awrFecha;
   qyResumen.ParamByName('P_CLIENTE').AsInteger := awrCliente;
   qyResumen.Open;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET.imprimir;
begin
   //qrReporte.PreviewModal;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET.imprimirResumen;
begin
   //qrResumen.PreviewModal;
end;

procedure TRPT_SEGUIMIENTO_SEM_DET.setFecha(valor : TDatetime);
begin
   awrFecha               := valor;
   //laFecha.Caption        := FormatDateTime('DD.MM.YYYY', awrFecha);
   //laFechaResumen.Caption := FormatDateTime('DD.MM.YYYY', awrFecha);
end;

end.
