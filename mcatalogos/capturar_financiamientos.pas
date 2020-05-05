unit capturar_financiamientos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI,     StdCtrls,
  IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBTable,  DBCtrls, Mask,
     jpeg,  ExtCtrls,
  IBX.IBQuery,  Buttons;

type
  TfrmCapturar_financiamientos = class(TfrmCapturarMDI)
    Label1: TLabel;
    deClave: TDBEdit;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    deDescripcion: TDBEdit;
    Label2: TLabel;
    dePorcentaje: TDBEdit;
    Label3: TLabel;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarPORCENTAJE: TFloatField;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_financiamientos: TfrmCapturar_financiamientos;

implementation

uses IBModulo, explorar_financiamientos;

{$R *.DFM}

procedure TfrmCapturar_financiamientos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('PORCENTAJE').AsFloat := 0.00;
  deClave.SetFocus;
end;

procedure TfrmCapturar_financiamientos.ibModificarClick(Sender: TObject);
begin
  inherited;
  deClave.SetFocus;
end;

end.
