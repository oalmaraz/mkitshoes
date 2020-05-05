unit UfrmPOSVales;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   UMarcoTNumerico, Db, IBX.IBCustomDataSet, IBX.IBStoredProc, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmPOSVales = class(TForm)
    edImporte: TEdit;
    paBotones: TPanel;
    buSalir: TBitBtn;
    spM_POS_VALES: TIBStoredProc;
    Panel1: TPanel;
    fcImager1: TImage;
    fcImager2: TImage;
    fcImager3: TImage;
    fcImager5: TImage;
    fcImager7: TImage;
    fcImager6: TImage;
    MarcoTNumerico1: TMarcoTNumerico;
    procedure edImporteKeyPress(Sender: TObject; var Key: Char);
    procedure edImporteChange(Sender: TObject);
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
  private
    { Private declarations }
    awrPOS : integer;
  public
    { Public declarations }
  published
     property POS : integer read awrPOS write awrPOS;
  end;

var
  frmPOSVales: TfrmPOSVales;

implementation

uses
  IBModulo, teclado_numerico;

{$R *.DFM}

procedure TfrmPOSVales.edImporteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) and (edImporte.Text <> '') then
   begin
      MarcoTNumerico1.buIntro.Click;
   end;
end;

procedure TfrmPOSVales.edImporteChange(Sender: TObject);
begin
   MarcoTNumerico1.Numero   := edImporte.Text;
end;

procedure TfrmPOSVales.MarcoTNumerico1buIntroClick(Sender: TObject);
begin
   spM_POS_VALES.ParamByName('P_POS').AsInteger := awrPOS;
   spM_POS_VALES.ParamByName('P_MONTO').AsFloat := StrToFloat( edImporte.Text);
   spM_POS_VALES.ExecProc;
   spM_POS_VALES.Transaction.CommitRetaining;

   self.ModalResult := mrOk;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu7Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu7Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu8Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu8Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu9Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu9Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu4Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu4Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu5Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu5Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu6Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu6Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu1Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu1Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu2Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu2Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu3Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu3Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1bu0Click(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.bu0Click(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1buPuntoClick(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.buPuntoClick(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

procedure TfrmPOSVales.MarcoTNumerico1buBorrarClick(Sender: TObject);
begin
   MarcoTNumerico1.SelStart := edImporte.SelStart;
   MarcoTNumerico1.buBorrarClick(Sender);
   edImporte.Text     := MarcoTNumerico1.Numero;
   edImporte.SelStart := MarcoTNumerico1.SelStart;
end;

end.
