unit capturar_conceptos_descuentos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls,
   Buttons;

type
  TfrmCapturar_conceptos_descuentos = class(TfrmCapturarMDI)
    deClave: TDBEdit;
    deDescripcion: TDBEdit;
    ceDescuento: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    TCapturarID: TIntegerField;
    TCapturarCLAVE: TIBStringField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarDESCUENTO_PORC: TFloatField;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_conceptos_descuentos: TfrmCapturar_conceptos_descuentos;

implementation

uses IBModulo, explorar_conceptos_descuentos_nc;

{$R *.DFM}

procedure TfrmCapturar_conceptos_descuentos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('DESCUENTO_PORC').AsFloat := 0.00;
  deClave.SetFocus;
end;

procedure TfrmCapturar_conceptos_descuentos.ibModificarClick(
  Sender: TObject);
begin
  inherited;
  deClave.SetFocus;
end;

end.
