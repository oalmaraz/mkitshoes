unit MAIL;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,   IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery, ExtCtrls;

type
  TfrmMail = class(TForm)
    paEncabezado: TPanel;
    Label7: TLabel;
    edServidor: TEdit;
    edPuerto: TEdit;
    Label8: TLabel;
    Bevel1: TBevel;
    Label9: TLabel;
    edClave: TEdit;
    paBotones: TPanel;
    buGuardar: TBitBtn;
    buSalir: TBitBtn;
    Label1: TLabel;
    edUsuario: TEdit;
    spCFG_MAIL: TIBStoredProc;
    qyMail: TIBQuery;
    qyMailID: TIntegerField;
    qyMailMAIL_SERVER: TIBStringField;
    qyMailUSER_NAME: TIBStringField;
    qyMailUSER_PASS: TIBStringField;
    qyMailPORT: TIntegerField;
    procedure buGuardarClick(Sender: TObject);
    procedure buSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure guardar;
    function validacion : boolean;
  public
    { Public declarations }
  end;

var
  frmMail: TfrmMail;

implementation

uses
  IBModulo, reglas_de_negocios;

{$R *.DFM}

function TfrmMail.validacion : boolean;
var
   tmp   : Boolean;
begin
   tmp   := false;

   if (edServidor.Text <> '') and
      (edUsuario.Text  <> '') and
      (edClave.Text    <> '') and
      (edPuerto.Text   <> '') then
   begin
      tmp := true;
   end
   else
      if (edServidor.Text = '') then
      begin
         ShowMessage('Falta Capturar el Servidor de Correos');
         edServidor.SetFocus;
      end
      else
      if (edUsuario.Text = '') then
      begin
         ShowMessage('Falta Capturar el Usuario');
         edUsuario.SetFocus;
      end
      else
      if (edClave.Text = '') then
      begin
         ShowMessage('Falta Capturar  la Clave');
         edClave.SetFocus;
      end
      else
      if (edPuerto.Text = '') then
      begin
         ShowMessage('Falta Capturar el  Puerto.');
         edPuerto.SetFocus;
      end;

   result := tmp;
end;

procedure TfrmMail.buGuardarClick(Sender: TObject);
begin
   if validacion then
   begin
      guardar;
   end;
end;

procedure TfrmMail.guardar;
begin
   spCFG_MAIL.ParamByName('P_SERVIDOR').AsString := edServidor.Text;
   spCFG_MAIL.ParamByName('P_USUARIO').AsString  := edUsuario.Text;
   spCFG_MAIL.ParamByName('P_CLAVE').AsString    := edClave.Text;
   spCFG_MAIL.ParamByName('P_PUERTO').AsString   := edPuerto.Text;
   spCFG_MAIL.ExecProc;
   spCFG_MAIL.Transaction.CommitRetaining;

   Close;
end;

procedure TfrmMail.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmMail.FormCreate(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyMail);

   edServidor.Text := qyMail.FieldByName('MAIL_SERVER').AsString;
   edUsuario.Text  := qyMail.FieldByName('USER_NAME').AsString;
   edClave.Text    := qyMail.FieldByName('USER_PASS').AsString;
   edPuerto.Text   := qyMail.FieldByName('PORT').AsString;
end;

end.
