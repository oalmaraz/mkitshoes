unit capturar_tipos_de_entrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,  jpeg,
  ExtCtrls,  Buttons;

type
  TfrmCapturar_tipos_de_entrada = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarNCREDITO: TIBStringField;
    deDescripcion: TDBEdit;
    cbGenerar: TDBEdit;
    Label1: TLabel;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_tipos_de_entrada: TfrmCapturar_tipos_de_entrada;

implementation

uses explorar_tipos_de_entrada, reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmCapturar_tipos_de_entrada.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('NCREDITO').AsString := 'No';
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_tipos_de_entrada.ibModificarClick(Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

end.
