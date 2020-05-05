unit UfrmCFD;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
     ExtCtrls, StdCtrls, Buttons, 
  ComCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmCFD = class(TForm)
    Panel1: TPanel;
    buGuardar: TBitBtn;
    buCancelar: TBitBtn;
    edNumAprobacion: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edSerie: TEdit;
    Label3: TLabel;
    edAnio: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    edInicial: TEdit;
    edFinal: TEdit;
    Label6: TLabel;
    edSSL: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    edCer: TEdit;
    edKey: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    edNumCertificado: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edNombre: TEdit;
    edCalle: TEdit;
    edColonia: TEdit;
    edCiudad: TEdit;
    edCP: TEdit;
    edRFC: TEdit;
    buSSL: TBitBtn;
    buCer: TBitBtn;
    buKey: TBitBtn;
    odSSL: TOpenDialog;
    opCer: TOpenDialog;
    opKey: TOpenDialog;
    Image1: TImage;
    edClave: TEdit;
    meCertificado: TMemo;
    mePKEY: TMemo;
    edVigenciaInicial: TDateTimePicker;
    edVigenciaFinal: TDateTimePicker;
    procedure buSSLClick(Sender: TObject);
    procedure buCerClick(Sender: TObject);
    procedure buKeyClick(Sender: TObject);
  private
    { Private declarations }
    procedure revisarCertificado;
    function remplazaStr(busca, remplaza, Str : string) : string;
    procedure setNombre(valor : string);
    procedure setCalle(valor : string);
    procedure setColonia(valor : string);
    procedure setCiudad(valor : string);
    procedure setCP(valor : string);
    procedure setRFC(valor : string);
    procedure setANIO(valor : string);
    procedure setNUM(valor : string);
    procedure setSERIE(valor : string);
    procedure setINI(valor : integer);
    procedure setFIN(valor : integer);
    procedure setSSL(valor : string);
    procedure setCER(valor : string);
    procedure setKEY(valor : string);
    procedure setNUM_CER(valor : string);
    procedure setINICIAL(valor : TDatetime);
    procedure setFINAL(valor : TDatetime);
    procedure setCLAVE(valor : string);
    procedure setCERTIFICADO(valor : TStrings);
    procedure setPKEY(valor : TStrings);
    function dameLinea(buscar : string; memo : TStrings) : integer;
  public
    { Public declarations }
  published
     property ANIO        : string write setANIO;
     property NUM         : string write setNUM;
     property SERIE       : string write setSERIE;
     property F_INI       : integer write setINI;
     property F_FIN       : integer write setFIN;
     property SSL         : string write setSSL;
     property CER         : string write setCER;
     property KEY         : string write setKEY;
     property NUM_CER     : string write setNUM_CER;
     property INICIAL     : TDatetime write setINICIAL;
     property FINAL       : TDatetime write setFINAL;
     property NOMBRE      : string write setNombre;
     property CALLE       : string write setCalle;
     property COLONIA     : string write setColonia;
     property CIUDAD      : string write setCiudad;
     property CP          : string write setCP;
     property RFC         : string write setRFC;
     property CLAVE       : string write setCLAVE;
     property CERTIFICADO : TStrings write setCERTIFICADO;
     property PKEY        : TStrings write setPKEY;
  end;

var
  frmCFD: TfrmCFD;

implementation

uses
   ShellApi;

{$R *.DFM}

procedure TfrmCFD.setCERTIFICADO(valor : TStrings);
begin
   meCertificado.Lines := valor;
end;

procedure TfrmCFD.setPKEY(valor : TStrings);
begin
   mePKEY.Lines := valor;
end;

function TfrmCFD.dameLinea(buscar : string; memo : TStrings) : integer;
var
   i   : integer;
   idx : integer;
   str : string;

begin
   idx := -1;
   for i := 0 to memo.Count - 1 do
   begin
      str := memo.Strings[i];
      if StrPos(PCHAR(str), PCHAR(buscar)) <> nil  then
      begin
         idx := i;
         break;
      end
   end;
   result := idx;
end;

procedure TfrmCFD.setCLAVE(valor : string);
begin
   edClave.Text := valor;
end;

procedure TfrmCFD.setANIO(valor : string);
begin
   edAnio.Text := valor;
end;

procedure TfrmCFD.setNUM(valor : string);
begin
   edNumAprobacion.Text := valor;
end;

procedure TfrmCFD.setSERIE(valor : string);
begin
   edSerie.Text := valor;
end;

procedure TfrmCFD.setINI(valor : integer);
begin
   edInicial.Text := IntToStr(valor);
end;

procedure TfrmCFD.setFIN(valor : integer);
begin
   edFinal.Text := IntToStr(valor);
end;

procedure TfrmCFD.setSSL(valor : string);
begin
   edSSL.Text := valor;
end;

procedure TfrmCFD.setCER(valor : string);
begin
   edCer.Text := valor;
end;

procedure TfrmCFD.setKEY(valor : string);
begin
   edKey.Text := valor;
end;

procedure TfrmCFD.setNUM_CER(valor : string);
begin
   edNumCertificado.Text := valor;
end;

procedure TfrmCFD.setINICIAL(valor : TDatetime);
begin
   edVigenciaInicial.Date := valor;
end;

procedure TfrmCFD.setFINAL(valor : TDatetime);
begin
   edVigenciaFinal.Date := valor;
end;

procedure TfrmCFD.setNombre(valor : string);
begin
   edNombre.Text := valor;
end;

procedure TfrmCFD.setCalle(valor : string);
begin
   edCalle.Text := valor;
end;

procedure TfrmCFD.setColonia(valor : string);
begin
   edColonia.Text := valor;
end;

procedure TfrmCFD.setCiudad(valor : string);
begin
   edCiudad.Text := valor;
end;

procedure TfrmCFD.setCP(valor : string);
begin
   edCP.Text := valor;
end;

procedure TfrmCFD.setRFC(valor : string);
begin
   edRFC.Text := valor;
end;

function TfrmCFD.remplazaStr(busca, remplaza, Str : string) : string;
begin
   while Pos(busca,Str) > 0 do
   begin
      insert(remplaza, Str, Pos(busca,Str));
      delete(Str, Pos(busca,Str), Length(busca));
   end;
   result := Str;
end;

procedure TfrmCFD.revisarCertificado;
var
   tmp         : TStringList;
   BatName     : string;
   n           : integer;
   ruta        : string;
   iniVigencia : TDatetime;
   timeIniVig  : TDatetime;
   finVigencia : TDatetime;
   timeFinVig  : TDatetime;
   serie       : string;

   function TP(posicion : integer) : integer;
   begin
      if (posicion = 0) then
      begin
	if Pos('JAN',tmp.Text) > 0 then
           result := 1
        else
	if Pos('FEB',tmp.Text) > 0 then
           result := 2
        else
        if Pos('MAR',tmp.Text) > 0 then
           result := 3
        else
	if Pos('APR',tmp.Text) > 0 then
           result := 4
        else
	if Pos('MAY',tmp.Text) > 0 then
           result := 5
        else
	if Pos('JUN',tmp.Text) > 0 then
           result := 6
        else
	if Pos('JUL',tmp.Text) > 0 then
           result := 7
        else
	if Pos('AUG',tmp.Text) > 0 then
            result := 8
        else
	if Pos('SEP',tmp.Text) > 0 then
            result := 9
        else
	if Pos('OCT',tmp.Text) > 0 then
            result := 10
        else
	if Pos('NOV',tmp.Text) > 0 then
           result := 11
        else
	if Pos('DEC',tmp.Text) > 0 then
           result := 12
        else
	   result := 0; //error
      end
      else
         Result := StrToIntDef(tmp.Strings[posicion],1);
   end;
begin
   if (edSSL.Text <> '') and
      (edCer.Text <> '') and
      (edKey.Text <> '')  then
   begin
      if FileExists(edSSL.Text) and
         FileExists(edCer.Text) and
         FileExists(edKey.Text) then
      begin
         meCertificado.Lines.Clear;
         mePKEY.Lines.Clear;

         ruta    := ExtractFileDir(edKey.Text) + '\';
         BatName := ruta + 'OpenSSL.bat';
	 tmp     := TStringList.Create;
	 tmp.Clear;
	 //Abre la llave privada y lo graba en formato PEM

	edClave.Text := InputBox('Se requiere la clave','Introduzca su Clave Privada del Certificado','');
	if edClave.Text <> '' then
        begin
           tmp.Add(edSSL.Text + ' pkcs8 -inform DER -in "' + edKey.Text + '" -passin pass:' + edClave.Text + ' -out "' + ruta + 'pkey.key.pem"');
           //Certificado - Inicio de Vigencia
           tmp.Add(edSSL.Text + ' x509 -inform DER -in "'  + edCer.Text + '" -noout -startdate > "' + ruta + 'vigenciaInicial.txt"');
           //Certificado - Fin de Vigencia
           tmp.Add(edSSL.Text + ' x509 -inform DER -in "'  + edCer.Text + '" -noout -enddate > "'   + ruta + 'vigenciaFinal.txt"');
           //Certificado - No. de Serie
           tmp.Add(edSSL.Text + ' x509 -inform DER -in "'  + edCer.Text + '" -noout -serial > "'    + ruta + 'serial.txt"');
           //Certificado - Expresarlo en base64
           tmp.Add(edSSL.Text + ' x509 -inform DER -in "'  + edCer.Text + '" > "' + ruta + 'certificado.txt"');
           tmp.SaveToFile(BatName);

           ShellExecute(Self.Handle, PChar('Open'), PChar(BatName), nil, nil, SW_HIDE);
           sleep(1000);

           if FileExists(ruta + 'certificado.txt') then
           begin
              meCertificado.Lines.LoadFromFile(ruta + 'certificado.txt');
              meCertificado.Lines.Delete(dameLinea('-----', meCertificado.Lines));
              meCertificado.Lines.Delete(dameLinea('-----', meCertificado.Lines));
              if length(meCertificado.Lines.Text) < 10 then
              begin
                 ShowMessage('El certificado es incorrecto.');
              end;
           end
           else
           begin
              ShowMessage('No se pudo crear certificado.txt');
           end;

           if FileExists(ruta + 'pkey.key.pem') then
           begin
              mePKEY.Lines.LoadFromFile(ruta + 'pkey.key.pem');
              mePKEY.Lines.Delete(dameLinea('-----', mePKEY.Lines));
              mePKEY.Lines.Delete(dameLinea('-----', mePKEY.Lines));
              if length(mePKEY.Lines.Text) < 10 then
              begin
                 ShowMessage('La Clave Privada es incorrecta.');
              end;
           end
           else
           begin
              ShowMessage('No se pudo crear pkey.key.pem');
           end;

           if FileExists(ruta + 'vigenciaInicial.txt') then
           begin
              tmp.LoadFromFile(ruta + 'vigenciaInicial.txt');
              tmp.Text := UpperCase(tmp.Text);
              tmp.Text := remplazaStr('  ',   ' ', tmp.Text);
              tmp.Text := remplazaStr(' ', #13#10, tmp.Text);
              tmp.Text := remplazaStr(':', #13#10, tmp.Text);
              try
                 iniVigencia := EncodeDate(TP(5),TP(0),TP(1));
                 timeIniVig  := EncodeTime(TP(2),TP(3),TP(4),0);
                 iniVigencia := iniVigencia + timeIniVig;
                 edVigenciaInicial.Date := iniVigencia;
              except
                 ShowMessage('Inicio de Vigencia (Decode)');
              end;
           end
           else
           begin
              ShowMessage('Inicio de Vigencia (Arch. no encontrado)');
           end;

           if FileExists(ruta + 'vigenciaFinal.txt') then
           begin
              tmp.LoadFromFile(ruta + 'vigenciaFinal.txt');
              tmp.Text := UpperCase(tmp.Text);
              tmp.Text := remplazaStr('  ',   ' ', tmp.Text);
              tmp.Text := remplazaStr(' ', #13#10, tmp.Text);
              tmp.Text := remplazaStr(':', #13#10, tmp.Text);
              try
                 finVigencia := EncodeDate(TP(5),TP(0),TP(1));
                 timeFinVig  := EncodeTime(TP(2),TP(3),TP(4),0);
                 finVigencia := finVigencia + timeFinVig;
                 edVigenciaFinal.Date := finVigencia;
              except
                 ShowMessage('Fin de Vigencia (Decode)');
              end;
           end
           else
           begin
              ShowMessage('Fin de Vigencia (Arch. no encontrado)');
           end;

           if FileExists(ruta + 'serial.txt') then
           begin
              tmp.LoadFromFile(ruta + 'serial.txt');
              Serie := ''; n := 9;
              while n < length(tmp.Text) do
              begin
                 Serie := Serie + tmp.Text[n];
                 n := n + 2;
              end;
              if length(Serie) <> 20 then
              begin
                 ShowMessage('Numero de Serie (longitud <> 20)');
              end
              else
                 edNumCertificado.Text := serie;
           end
           else
           begin
              ShowMessage('Numero de Serie (Arch. no encontrado)');
           end;

           tmp.Free;

           DeleteFile(BatName);
           DeleteFile(ruta + 'vigenciaInicial.txt');
           DeleteFile(ruta + 'vigenciaFinal.txt');
           DeleteFile(ruta + 'serial.txt');
           RenameFile(ruta + 'Certificado.txt', ruta + Serie + '.txt');
        end
        else
           ShowMessage('Error de llave');
      end;
   end;
end;

procedure TfrmCFD.buSSLClick(Sender: TObject);
begin
   if odSSL.Execute then
   begin
      edSSL.Text := odSSL.Files.Strings[0];
   end;
   revisarCertificado;
end;

procedure TfrmCFD.buCerClick(Sender: TObject);
begin
   if opCer.Execute then
   begin
      edCer.Text := opCer.Files.Strings[0];
   end;
   revisarCertificado;
end;

procedure TfrmCFD.buKeyClick(Sender: TObject);
begin
   if opKey.Execute then
   begin
      edKey.Text := opKey.Files.Strings[0];
   end;
   revisarCertificado;
end;

end.
