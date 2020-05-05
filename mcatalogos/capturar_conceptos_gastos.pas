unit capturar_conceptos_gastos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls,    jpeg,
   ExtCtrls,
   Buttons;

type
  TfrmCapturar_Conceptos_Gastos = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarCONCEPTO: TIBStringField;
    TCapturarPORC: TFloatField;
    deConcepto: TDBEdit;
    Label7: TLabel;
    Label23: TLabel;
    dePorc: TDBEdit;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_Conceptos_Gastos: TfrmCapturar_Conceptos_Gastos;

implementation

uses
  explorar_conceptos_gastos, IBModulo;

{$R *.DFM}

procedure TfrmCapturar_Conceptos_Gastos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('PORC').AsFloat := 0.00;
  deConcepto.SetFocus;
end;

procedure TfrmCapturar_Conceptos_Gastos.ibModificarClick(Sender: TObject);
begin
  inherited;
  deConcepto.SetFocus;
end;

end.
