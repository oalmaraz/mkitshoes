unit ruta;

interface

uses
  UAWR, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    StdCtrls,
       Buttons;

type
  TfrRuta = class(TForm)
    Label1: TLabel;
    Label4: TLabel;
    edNombreServidor: TEdit;
    edRuta: TEdit;
    edLlave: TEdit;
    Label2: TLabel;
    cbRemoto: TCheckBox;
    cbLocal: TCheckBox;
    edGen1: TEdit;
    edGen2: TEdit;
    edGen3: TEdit;
    edGen4: TEdit;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edAct1: TEdit;
    edAct2: TEdit;
    edAct3: TEdit;
    edAct4: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    laC: TLabel;
    laA: TLabel;
    buCopiar: TButton;
    ibBuscar: TBitBtn;
    ibServidor: TBitBtn;
    buCertificar: TBitBtn;
    ibCerrar: TBitBtn;
    procedure ibBuscarClick(Sender: TObject);
    procedure ibServidorClick(Sender: TObject);
    procedure ibCerrarClick(Sender: TObject);
    procedure cbStandaloneChange(Sender: TObject);
    procedure buCertificarClick(Sender: TObject);
    procedure cbRemotoChange(Sender: TObject);
    procedure cbLocalChange(Sender: TObject);
    procedure buCopiarClick(Sender: TObject);
    procedure edAct1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    vAWR        : TAWR;
    vAceptarCer : boolean;
    vAceptarCon : boolean;
    procedure guardarCertificado;
    procedure validaCertificado;
    function getRsp : boolean;
  public
    { Public declarations }
  published
     property RSP : boolean read getRsp;
  end;

var
   frRuta: TfrRuta;

implementation

uses
   Clipbrd, iniFiles, filectrl, reglas_de_negocios, IBModulo, IBData, IBX.IB;

{$R *.DFM}

function TfrRuta.getRsp : boolean;
begin
   result := vAceptarCer and vAceptarCon;
end;

procedure TfrRuta.validaCertificado;
var
   vHd1 : string;
   vHd2 : string;
begin
   laA.Visible := false;
   laC.Visible := false;
   vHd1        := vAWR.dameHD(vAWR.dameSistema);
   vHd2        := vAWR.dameHD(vAWR.dameCertificado);
   if vHd1 <> vHd2 then
   begin
      laC.Visible := true;
   end
   else
   begin
      guardarCertificado;
      laA.Visible := true;
      vAceptarCer := true;

      edRuta.SetFocus;
   end
end;

procedure TfrRuta.guardarCertificado;
var
   iniFile : TIniFile;
   maq     : string;
   sys     : string;
begin
   sys := edGen1.Text + ' - ' +  edGen2.Text + ' - ' +  edGen3.Text + ' - ' +  edGen4.Text;
   maq := edAct1.Text + ' - ' +  edAct2.Text + ' - ' +  edAct3.Text + ' - ' +  edAct4.Text;
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   iniFile.WriteString('STANDALONE','Activar','Si');
   iniFile.WriteString('STANDALONE','Sistema', sys);
   iniFile.WriteString('STANDALONE','Certificado', maq);
   iniFile.Free;

   vAWR.guardarRegistro;
end;

procedure TfrRuta.ibBuscarClick(Sender: TObject);
var
   tmp : string;
begin
   if SelectDirectory('Seleccionar Directorio', '', tmp) then
   begin
      if tmp <> '' then
      begin
         if cbLocal.Checked then
         begin
            edNombreServidor.Text := '';
            edRuta.Text           := reglas.analiza_busqueda(tmp);
         end
         else
            begin
               tmp                   := reglas.analiza_busqueda(tmp);
               edNombreServidor.Text := reglas.analiza_servidor(tmp);
               edRuta.Text           := reglas.analiza_ruta(tmp);
            end;
      end;
   end;
end;

procedure TfrRuta.ibServidorClick(Sender: TObject);
   function cambiar_diagonal : string;
   var
      i      : integer;
      tmp    : string;
      cadena : string;
   begin
      cadena := edRuta.Text;
      for i := 1 to length(cadena) do
      begin
         if cadena[i] = '\' then
            tmp := tmp + '/'
         else
            tmp := tmp + cadena[i];
      end;
      Result := tmp;
   end;
var
   ruta : string;
   conn : boolean;
begin
   conn := true;
{   if cbStandalone.Checked then
   begin
      conn := reglas.admitirStandalone;
      if not(conn) then
         meCertificado.Execute;
   end;}

{   if conn then
   begin}
      try
         if edRuta.Text <> '' then
         begin
            ruta := edRuta.Text;
            if not(ruta[length(ruta)] = '\') then
               edRuta.Text := edRuta.Text + '\';
{            if (cbLinux.Checked) then
               edRuta.Text := cambiar_diagonal;}
        end;
        reglas.abrir_base_de_datos(dmIBModulo.ibInformar, edLlave.Text, edNombreServidor.Text, edRuta.Text, 'informar.awr');
        reglas.abrir_IBTabla(dmIBData.taPreferencias);
        reglas.registro_aplicacion(edLlave.Text, edNombreServidor.Text,'informar.awr',edRuta.Text,dmIBData.taPreferencias, false, false);
        vAceptarCon := true;
        Close;
      except
         on EIBInterBaseError do
         begin
           ShowMessage('Error de Base de datos');
         end
      end;
//   end;
end;

procedure TfrRuta.ibCerrarClick(Sender: TObject);
begin
   Close;
end;

procedure TfrRuta.cbStandaloneChange(Sender: TObject);
var
   sys : string;
begin
{   edAct1.Enabled := cbStandalone.Checked;
   edAct2.Enabled := cbStandalone.Checked;
   edAct3.Enabled := cbStandalone.Checked;
   edAct4.Enabled := cbStandalone.Checked;

   if (cbStandalone.Checked) then
   begin
      sys := reglas.dameKey;
      edGen1.Text := copy(sys, 1, 4);
      edGen2.Text := copy(sys, 5, 4);
      edGen3.Text := copy(sys, 9, 4);
      edGen4.Text := copy(sys, 13,4);
   end;}
end;

procedure TfrRuta.buCertificarClick(Sender: TObject);
begin
   vAWR.Registro    := vAWR.dameSistema;
   vAWR.Certificado := edAct1.Text + edAct2.Text + edAct3.Text + edAct4.Text;
   if vAWR.dameSistema <> vAWR.dameCertificado then
   begin
      validaCertificado;
   end;
end;

procedure TfrRuta.cbRemotoChange(Sender: TObject);
begin
   cbLocal.Checked := not(cbRemoto.Checked);
   if cbRemoto.Checked then
   begin
      edNombreServidor.Enabled := TRUE;
      edNombreServidor.SetFocus;
   end;
end;

procedure TfrRuta.cbLocalChange(Sender: TObject);
begin
   cbRemoto.Checked := not(cbLocal.Checked);
   if cbLocal.Checked then
   begin
     edNombreServidor.Clear;
     edNombreServidor.Enabled := FALSE;
     edRuta.SetFocus;
   end;
end;

procedure TfrRuta.buCopiarClick(Sender: TObject);
var
   tmp : string;
begin
   tmp := edGen1.Text + ' - ' +  edGen2.Text + ' - ' +  edGen3.Text + ' - ' +  edGen4.Text;
   ClipBoard.SetTextBuf(PCHAR(tmp));
end;

procedure TfrRuta.edAct1Change(Sender: TObject);
var
   tmp : string;
begin
   if length(edAct1.Text) > 6 then
   begin
      tmp := vAWR.limpiarCadena(edAct1.Text);

      edAct1.Text := copy(tmp,  1, 6);
      edAct2.Text := copy(tmp,  7, 6);
      edAct3.Text := copy(tmp, 13, 6);
      edAct4.Text := copy(tmp, 19, 6);
   end;
end;

procedure TfrRuta.FormCreate(Sender: TObject);
begin
   vAceptarCer := false;
   vAceptarCon := false;
   vAWR     := TAWR.Create;
   vAWR.armarLicencia;
   edGen1.Text := vAWR.dameBloqueSis1;
   edGen2.Text := vAWR.dameBloqueSis2;
   edGen3.Text := vAWR.dameBloqueSis3;
   edGen4.Text := vAWR.dameBloqueSis4;
end;

procedure TfrRuta.FormDestroy(Sender: TObject);
begin
   vAWR.Free;
end;

end.


