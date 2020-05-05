unit capturar_tipos_de_salida;

interface                                 

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask, jpeg,
  Buttons, ExtCtrls;

type
  TfrmCapturar_tipos_de_salida = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarNCARGO_CXP: TIBStringField;
    Label1: TLabel;
    deDescripcion: TDBEdit;
    cbGenerar: TDBEdit;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_tipos_de_salida: TfrmCapturar_tipos_de_salida;

implementation

uses explorar_tipos_de_salida, reglas_de_negocios, IBModulo;

{$R *.DFM}

procedure TfrmCapturar_tipos_de_salida.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('NCARGO_CXP').AsString := 'No';
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_tipos_de_salida.ibModificarClick(Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

end.
