unit UfrmSKUConfirmar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Buttons,    Db,
  IBX.IBCustomDataSet, IBX.IBStoredProc;

type
  TfrmSKUConfirmar = class(TForm)
    Panel1: TPanel;
    paBotones: TPanel;
    buSalir: TBitBtn;
    edSerie: TEdit;
    Label7: TLabel;
    spSKU_CONFIRMAR: TIBStoredProc;
    procedure edSerieKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    awrMI      : integer;
    awrDataSet : TDataSet;
  public
    { Public declarations }
  published
     property MI : integer read awrMI write awrMI;
//     property DataSet : TDataSet read awrDataSet write awrDataSet;
  end;

var
  frmSKUConfirmar: TfrmSKUConfirmar;

implementation

uses
  IBModulo;

{$R *.DFM}

procedure TfrmSKUConfirmar.edSerieKeyPress(Sender: TObject; var Key: Char);
begin
   if (Key = #13) and (edSerie.Text <> '') then
   begin
      spSKU_CONFIRMAR.ParamByName('P_MI').AsInteger   := awrMI;
      spSKU_CONFIRMAR.ParamByName('P_SERIE').AsString := edSerie.Text;
      spSKU_CONFIRMAR.ExecProc;
      spSKU_CONFIRMAR.Transaction.CommitRetaining;

      if spSKU_CONFIRMAR.ParamByName('R_ID').AsInteger <> 0 then
      begin
         edSerie.Clear;
         edSerie.SetFocus;
{
         awrDataSet.Close;
         awrDataSet.Open;}
      end
      else
         ShowMessage('No se encontro numero de serie en movimiento de inventario.');
   end;
end;

end.
