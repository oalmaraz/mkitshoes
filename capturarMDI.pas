unit capturarMDI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturar, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, Mask, DBCtrls,    jpeg,
  ExtCtrls,  ComCtrls, Buttons;

type
  TfrmCapturarMDI = class(TfrmCapturar)
  private
    { Private declarations }
  protected
    procedure borrar;override;
  public
    { Public declarations }
  end;

var
  frmCapturarMDI: TfrmCapturarMDI;

implementation

{$R *.DFM}

procedure TfrmCapturarMDI.borrar;
begin
   inherited borrar;
end;

end.
