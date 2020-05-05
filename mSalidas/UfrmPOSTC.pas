unit UfrmPOSTC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db,
  IBX.IBCustomDataSet, IBX.IBStoredProc, UMarcoTNumerico;

type
  TfrmPOSTC = class(TForm)
    edImporte: TEdit;
    paBotones: TPanel;
    buSalir: TBitBtn;
    spM_POS_TC: TIBStoredProc;
    fcImager5: TImage;
    fcImager6: TImage;
    fcImager7: TImage;
    MarcoTNumerico1: TMarcoTNumerico;
    Panel1: TPanel;
    fcImager1: TImage;
    fcImager2: TImage;
    fcImager3: TImage;
    procedure edImporteKeyPress(Sender: TObject; var Key: Char);
    procedure MarcoTNumerico1buIntroClick(Sender: TObject);
    procedure MarcoTNumerico1bu7Click(Sender: TObject);
    procedure MarcoTNumerico1bu8Click(Sender: TObject);
    procedure MarcoTNumerico1bu9Click(Sender: TObject);
    procedure MarcoTNumerico1bu4Click(Sender: TObject);
    procedure MarcoTNumerico1bu5Click(Sender: TObject);
    procedure MarcoTNumerico1bu6Click(Sender: TObject);
    procedure MarcoTNumerico1bu1Click(Sender: TObject);
    procedure MarcoTNumerico1bu2Click(Sender: TObject);
    procedure MarcoTNumerico1bu3Click(Sender: TObject);
    procedure MarcoTNumerico1bu0Click(Sender: TObject);
    procedure MarcoTNumerico1buPuntoClick(Sender: TObject);
    procedure MarcoTNumerico1buBorrarClick(Sender: TObject);
    procedure edImporteChange(Sender: TObject);
  private
    { Private declarations }
    awrPOS : integer;
  public
    { Public declarations }
  published
     property POS : integer read awrPOS write awrPOS;
  end;

var
  frmPOSTC: TfrmPOSTC;

implementation

uses
  IBModulo, teclado_numerico;

{$R *.DFM}

procedure TfrmPOSTC.edImporteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) and (edImporte.Text <> '') then
   begin
      MarcoTNumerico1.buIntro.Click;
   end;
end;

procedure TfrmPOSTC.MarcoTNumerico1buIntroClick(Sender: TObject);
begin
   spM_POS_TC.ParamByName('P_POS').AsInteger := awrPOS;
   spM_POS_TC.ParamByName('P_MONTO').AsFloat := StrToFloat(edImporte.Text);
   spM_POS_TC.ExecProc;
   spM_POS_TC.Transaction.CommitRetaining;

   self.ModalResult := mrOk;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu7Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu7Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu8Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu8Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu9Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu9Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu4Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu4Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu5Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu5Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu6Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu6Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu1Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu1Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu2Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu2Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu3Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu3Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1bu0Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu0Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1buPuntoClick(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.buPuntoClick(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.MarcoTNumerico1buBorrarClick(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.buBorrarClick(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSTC.edImporteChange(Sender: TObject);
begin
   MarcoTNumerico1.Numero   := edImporte.Text;
end;

end.
