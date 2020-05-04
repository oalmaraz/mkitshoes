program Mkitshoes;

uses
  Vcl.Forms,
  unit1 in 'unit1.pas' {Form6};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
