unit reglas_de_negocios;

interface

uses
   USqlAnaliza,    IBX.IBDatabase, IBX.IBTable, IBX.IBQuery, graphics, windows, Menus, forms, db, controls, comctrls,
   classes, extctrls, dbgrids, cxGrid,  cxGridDBTableView;

const
  ARREGLO_MENU = 300;
  IZQUIERDA    = 0;
  DERECHA      = 1;

type
   TSaveMethod = procedure (const FileName: String; ASaveAll: Boolean) of object;

   TMenus = record
      id       : integer;
      ejecutar : string;
      activo   : boolean;
      item     : TMenuItem;
   end;

   TReglas = class
   private
     empresa      : integer;
     usuario      : integer;
     usuarioTexto : string;
     usuarioNivel : integer;
     RLlave       : string;
     RServidor    : string;
     RBaseDeDatos : string;
     RDatabaseName: string;
     RFecha       : TDatetime;
     RRuta        : string;
     REntro       : boolean;
     RLinux       : boolean;
     REfectos     : boolean;
     menu         : array[0..ARREGLO_MENU] of TMenus;
     indiceMenu   : integer;
   protected
   public
     tmpSelect      : string;
     tmpSelect2     : string;
     tmpTabla       : string;
     tmpWhereAlways : string;
     tmpID          : string;
     tmpSQL         : TsqlAnaliza;
     tmpDato1       : double;
     tmpDato2       : double;
     tmpDato3       : double;
     tmpDato4       : double;
     tmpDato5       : double;
     constructor Create;overload;
     destructor Destroy;override;

     procedure fijar_registros;
     procedure fijar_entrada(valor : boolean);
     procedure fijar_fecha(valor : TDatetime);
     procedure abrir_base_de_datos(ibdatabase : TIBDatabase;llave, servidor, ruta, basededatos : string);
     procedure registro_aplicacion(llave, servidor, basededatos, ruta : string; preferencias : TIBTable; linux, efectos : boolean);
     procedure abrir_IBTabla(value : TIBTable);
     procedure abrir_IBQuery(value : TIBQuery);
     procedure abrir_IBQuery_seek(campo : string; actual : integer;consulta : TIBQuery);
     procedure refresh_IBQuery(value : TIBQuery);
     procedure crear_menu(consulta : TIBQuery; origen : TMainMenu);
     procedure crear_raiz(origen : TMainMenu; id : integer; ejecutar, caption, name : string);
     procedure item(buscar, id, imageindex : integer; ejecutar, caption, name, shortcut : string);
     procedure item_linea(buscar, id : integer; ejecutar, caption, name : string);
     procedure Click(Sender : TObject);
     procedure Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
     procedure destruir_menu;
     procedure cerrar_all;
     procedure marcar_menu(const objeto : string);
     procedure verifica_formato;
     procedure fijarUsuario(valor : integer);overload;
     procedure fijarUsuario(valor : string);overload;
     procedure fijarUsuarioNivel(valor : integer);
     procedure fijar_empresa(valor : integer);
     procedure cargar_imagenes(imagen : TImageList; vista : TListView; datos : TIBTable);
     procedure cargar_imagenes2(imagen : TImageList; datos : TIBQuery);
     procedure guarda_llave(valor : string);
     procedure imprimir_ticket(valor : integer);
     procedure solo_numeros(var k : char);
     procedure solo_numeros_y_punto(var k : char; texto : string);
     procedure separarFlotante(pFlotante : Double; var pEntero : string; var pFraccion : string);
     procedure imagenGuardar(consulta : TDataSource; archivo, campo : string; imagen : TImage);overload;
     //procedure imagenGuardar(consulta : TDataSource; archivo, campo : string; imagen : TfcImager);overload;
     //procedure imagenGuardar(archivo : string; imagen : TfcImager; var Stream : TMemoryStream);overload;
     procedure imagenVer(consulta : TDataSource; campo : string; imagen : TImage);overload;
     //procedure imagenVer(consulta : TDataSource; campo : string; imagen : TfcImager);overload;
     //procedure imagenVer(consulta : TDataSource; campo : string; imagen : TjvImage);overload;
     //procedure imagenVer(consulta : TDataSource; campo : string; imagen : TfcImager; var Stream : TMemoryStream);overload;
     procedure databaseName(valor : string);
     procedure grabarConexion;

     function rellenar(valor, cuantos : integer) : string;
     function dameUsuarioNivel : integer;
     function dameDatabaseName : string;
     function dameUsuario : string;
     function validacion_precio(valor, precio : double) : boolean;
     function validar_precio(capturado, minimo : double; nivel : integer) : boolean;
     function dame_llave : string;
     function dame_usuario : integer;
     function dame_empresa : integer;
     function RunControlPanelApplet(sAppletFileName : string) : integer;
     function solo_alfabeto(texto : string) : string;
     function buscar(valor : string) : integer;
     function find(valor : integer) : TMenuItem;
     function acceso(usuarios, complemento : TIBTable; usuario, clave: string) : boolean;
     function acceso2(usuarios, complemento : TIBTable; usuario, clave: string) : integer;
     function analiza_busqueda(valor : string) : string;
     function analiza_servidor(cadena : string) : string;
     function analiza_ruta(cadena : string) : string;
     function dame_servidor : string;
     function dame_basededatos : string;
     function dame_entro : boolean;
     function dame_ruta : string;
     function dame_indice : integer;
     function dame_fecha : TDatetime;
     function dame_efectos : boolean;
     function dame_id(cadena : string) : integer;
     function dame_id_corchete(cadena : string) : integer;
     function convertirOEM(cadena : string) : string;
//     function analiza_sql(p_sql : TStrings) : string;
     function encriptar(cadena : string) : string;
     function desencriptar(cadena : string) : string;
     function espejo(cadena : string) : string;
     function addCaracteres(cadena : string; cuantos : integer; caracter : char; orientacion : integer) : string;
     function activarElegirControladorImpresora(nombre : string) : boolean;
     function seEncontroForma(valor : string) : boolean;
     function EAN13(valor : string) : string;
     Function Check_HD : string;
     function espejoHex(valor : string) : string;
     function convertirHex(valor : string) : string;
     function desencriptarHex(valor : string) : string;
     function encriptarHex(valor : string) : string;
     function generarKeyMaq(key : string) : string;
     function generarKeySys(key : string) : string;
     function generarKey(HD, DH : string) : string;//Hard Disk - Disk Hard (mirror)
     function dameKey : string;
     function dameSys : string;
     function admitirStandalone : boolean;
     function workInStandalone : boolean;
     function dameCertificado : string;
     function encontrarCaracter(cadena, caracter : string) : integer;
     function copiarStr(cadena : string; pos : integer) : string;
   end;

procedure forma(const objeto : string); forward; overload;
procedure forma(const objeto : string; fuente : TcxGridDBTableView); forward; overload;
procedure cerrar(const objeto : string); forward;

var
   reglas : TReglas;

implementation

uses
   UfrmAcceso,  jpeg, inifiles, sysutils,  imglist, clases,  dialogs, autorizacion;

type
  TGraphType = (gtBitmap, gtIcon, gtMetafile, gtJpeg);

const
   colores = clWhite;


constructor TReglas.Create;
begin
   inherited;
   indiceMenu := -1;
   Randomize;
end;

destructor TReglas.Destroy;
begin
   inherited;
end;

function TReglas.copiarStr(cadena : string; pos : integer) : string;
var
   i   : integer;
   tmp : string;
begin
   tmp := '';
   for i := 1 to length(cadena) do
   begin
      tmp := tmp + cadena[i];
      if i = pos then
         break;
   end;
   result := tmp;
end;

function TReglas.encontrarCaracter(cadena, caracter : string) : integer;
var
   i   : integer;
   idx : integer;
begin
   idx := -1;
   for i := 1 to length(cadena) do
      if caracter = cadena[i] then
      begin
         idx := i;
         break;
      end;

   result := idx;
end;

function TReglas.workInStandalone : boolean;
var
   sys     : string;
   act     : string;
   tmp     : boolean;
   iniFile : TIniFile;
begin
   sys     := dameSys;
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   act     := iniFile.ReadString('STANDALONE','Activar','');
   iniFile.Free;
   tmp     := UpperCase(act) = 'SI';
   result := tmp;
end;

function TReglas.dameCertificado : string;
var
   sys     : string;
   maq     : string;
   tmp     : boolean;
   iniFile : TIniFile;
begin
   tmp     := false;
   sys     := dameSys;
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   maq     := iniFile.ReadString('STANDALONE','Certificado','');
   iniFile.Free;
   result := maq;
end;

function TReglas.admitirStandalone : boolean;
var
   sys     : string;
   maq     : string;
   tmp     : boolean;
   iniFile : TIniFile;
begin
   tmp     := false;
   sys     := dameSys;
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   maq     := iniFile.ReadString('STANDALONE','Certificado','');
   iniFile.Free;
   tmp     := sys = maq;
   result := tmp;
end;

Function TReglas.Check_HD : string;
Var
   VolumeNameBuffer : array [0..MAX_PATH -1] of Char;
   VolumeSerialNumber : DWord;
   MaximumComponentLength : DWord;
   FileSystemFlags : DWord;
Begin
   Result := '*';
   GetVolumeInformation( '\'
                           ,VolumeNameBuffer
                           ,DWORD(sizeof(VolumeNameBuffer))
                           ,@VolumeSerialNumber
                           ,MaximumComponentLength
                           ,FileSystemFlags
                           ,nil
                           ,0);
   Check_HD := IntToHEX(VolumeSerialNumber,8);
End;

function TReglas.espejoHex(valor : string) : string;
var
   tmp : string;
   i   : byte;
const
   HEX : array[0..15] of char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
   ESP : array[0..15] of char = ('F','E','D','C','B','A','9','8','7','6','5','4','3','2','1','0');
begin
   for i := 0 to 15 do
   begin
      if valor[1] = HEX[i] then
      begin
         tmp := ESP[i];
         break;
      end;
   end;
   result := tmp;
end;

function TReglas.convertirHex(valor : string) : string;
var
   tam : byte;
   i   : byte;
   tmp : string;
begin
   tmp := '';
   tam := Length(valor);
   for i := 1 to tam do
   begin
      tmp := tmp + espejoHex(valor[i]);
   end;
   result := tmp;
end;

function TReglas.desencriptarHex(valor : string) : string;
var
   tmp : string;
   i   : byte;
const
   HEX : array[0..15] of char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
   ESP : array[0..15] of char = ('I','J','K','L','M','N','X','Z','P','Q','R','S','T','Y','V','W');
begin
   for i := 0 to 15 do
   begin
      if valor[1] = ESP[i] then
      begin
         tmp := HEX[i];
         break;
      end;
   end;
   result := tmp;
end;

function TReglas.encriptarHex(valor : string) : string;
var
   tmp : string;
   i   : byte;
const
   HEX : array[0..15] of char = ('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F');
   ESP : array[0..15] of char = ('I','J','K','L','M','N','X','Z','P','Q','R','S','T','Y','V','W');
begin
   for i := 0 to 15 do
   begin
      if valor[1] = HEX[i] then
      begin
         tmp := ESP[i];
         break;
      end;
   end;
   result := tmp;
end;

function TReglas.generarKeyMaq(key : string) : string;
var
   tam : byte;
   i   : byte;
   tmp : string;
begin
   tmp := '';
   tam := Length(key);
   for i := 1 to tam do
   begin
      tmp := tmp + desencriptarHex(key[i]);
   end;
   result := tmp;
end;

function TReglas.generarKeySys(key : string) : string;
var
   tam : byte;
   i   : byte;
   tmp : string;
begin
   tmp := '';
   tam := Length(key);
   for i := 1 to tam do
   begin
      tmp := tmp + encriptarHex(key[i]);
   end;
   result := tmp;
end;

function TReglas.generarKey(HD, DH : string) : string;//Hard Disk - Disk Hard (mirror)
var
   key : string;
   c   : string;
   i   : byte;
   tam : byte;
begin
   key := '';
   tam := Length(HD);
   //Proceso Escalera
   for i := 1 to tam do
   begin
      c := '';
      if (i in [1,3,5,7]) then
        c := DH[i]
      else
      if (i in [2,4,6,8]) then
        c := c + HD[i];

      key := key + c;
   end;

   //Proceso Bajar
   for i := 1 to tam do
   begin
      c := '';
      if (i in [1,3,5,7]) then
        c := HD[i];

      key := key + c;
   end;

   //Proceso Subir
   for i := tam downto 1 do
   begin
      c := '';
      if (i in [2,4,6,8]) then
        c := DH[i];

      key := key + c;
   end;

   result := key;
end;

function TReglas.dameSys : string;
var
   a, b,c : string;
begin
   a := Check_HD;
   b := convertirHex(Check_HD);
   c := generarKey(a, b);
   result := c;
end;

function TReglas.dameKey : string;
var
   a, b,c,d : string;
begin
   a := Check_HD;
   b := convertirHex(Check_HD);
   c := generarKey(a, b);
   d := generarKeySys(c);
   result := d;
end;

function TReglas.dame_id_corchete(cadena : string) : integer;
var
   ini, fin : integer;
   cuantos  : integer;
begin
   ini := pos('[', cadena);
   fin := pos(']', cadena);
   cuantos := (fin - ini) -1;
   if cuantos = 0 then
      Result := 0
   else
      Result := StrToInt(copy(cadena, ini + 1, cuantos));
end;

function TReglas.EAN13(valor : string) : string;
var
   tmp  : string;
   tmp2 : integer;
   i    : integer;
   r    : integer;
   acum : integer;
const
   mult : array[1..12] of integer = (1,3,1,3,1,3,1,3,1,3,1,3);
begin
   acum  := 0;
   for i := 1 to 12 do
   begin
      tmp  := valor[i];
      tmp2 := StrToInt(tmp);
      r    := tmp2 * mult[i];
      acum := acum + r;
   end;
   // Extraer el valor de la derecha
   tmp2 := StrToInt(Copy(IntToStr(acum), Length(IntToStr(acum)),1));
   if tmp2 > 0 then
      tmp2 := 10 - tmp2;
   Result := valor + IntToStr(tmp2);
end;

function TReglas.rellenar(valor, cuantos : integer) : string;
var
   tmp  : string;
   long : integer;
   i    : integer;
begin
   tmp  := IntToStr(valor);
   long := Length(tmp);
   inc(long,1);
   for i := long to cuantos do
      tmp := '0' + tmp;
   result := tmp
end;


procedure forma(const objeto : string; fuente : TcxGridDBTableView);
var
   i       : integer;
   iFound  : integer;
begin
   iFound  := -1;
   for i := 0 to Screen.FormCount - 1 do
   begin
      if Screen.Forms[i].name = objeto then
      begin
         iFound := i;
         break;
      end;

   end;
   if iFound >= 0 then
      Screen.Forms[iFound].Show
   else
   begin
      if not( clase(objeto, fuente) ) then
      begin
            //'Sin Forma'
            ShowMessage('No hay objeto para crear');
      end;
   end;
end;


procedure forma(const objeto : string);
var
   i       : integer;
   iFound  : integer;
//   tmp     : TFormClass;
//   mensaje : TMensajes;
begin
   iFound := -1;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].name = objeto then
      begin
         iFound := i;
         break;
      end;

   if iFound >= 0 then
      Screen.Forms[iFound].Show
   else
      clase(objeto);
end;

function TReglas.seEncontroForma(valor : string) : boolean;
var
   i       : integer;
   iFound  : integer;
begin
   iFound := -1;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].name = valor then
      begin
         iFound := i;
         break;
      end;

   if iFound >= 0 then
      Result := true
   else
      Result := false;
end;

function TReglas.dameUsuarioNivel : integer;
begin
   Result := usuarioNivel;
end;

procedure TReglas.fijarUsuarioNivel(valor : integer);
begin
   usuarioNivel := valor;
end;

procedure TReglas.databaseName(valor : string);
begin
   RDatabaseName := valor;
end;

function TReglas.dameDatabaseName : string;
begin
   Result := RDatabaseName;
end;

procedure TReglas.grabarConexion;
var
   iniFile : TIniFile;
   ruta    : string;
begin
   ruta := ExtractFileDir(Application.ExeName) + '\';
   //PLUGIN: reportes genereales de entrada
   iniFile := TIniFile.Create(ruta+'reportes\entradas\'+'CONEXION.INI');
   try
      iniFile.WriteString('SERVIDOR','Nombre',RServidor);
      iniFile.WriteString('DATABASE','Nombre',RDatabaseName);
      iniFile.WriteString('DATABASE','Ruta',RRuta);
      iniFile.WriteString('DATABASE','InterBase',RLlave);
   except
   end;
   iniFile.Free;

   //PLUGIN: reportes generales de salida
   iniFile := TIniFile.Create(ruta+'reportes\salidas\'+'CONEXION.INI');
   try
      iniFile.WriteString('SERVIDOR','Nombre',RServidor);
      iniFile.WriteString('DATABASE','Nombre',RDatabaseName);
      iniFile.WriteString('DATABASE','Ruta',RRuta);
      iniFile.WriteString('DATABASE','InterBase',RLlave);
   except
   end;
   iniFile.Free;

   //CFD - Factura Electronica
   iniFile := TIniFile.Create(ruta+'CFD\'+'CONEXION.INI');
   try
      iniFile.WriteString('SERVIDOR','Nombre',RServidor);
      iniFile.WriteString('DATABASE','Nombre',RDatabaseName);
      iniFile.WriteString('DATABASE','Ruta',RRuta);
      iniFile.WriteString('DATABASE','InterBase',RLlave);
   except
   end;
   iniFile.Free;

   //POS
   iniFile := TIniFile.Create(ruta+'POS\'+'CONEXION.INI');
   try
      iniFile.WriteString('SERVIDOR','Nombre',RServidor);
      iniFile.WriteString('DATABASE','Nombre',RDatabaseName);
      iniFile.WriteString('DATABASE','Ruta',RRuta);
      iniFile.WriteString('DATABASE','InterBase',RLlave);
   except
   end;
   iniFile.Free;

   //PinPad
   iniFile := TIniFile.Create(ruta+'POS\PinPad\'+'CONEXION.INI');
   try
      iniFile.WriteString('SERVIDOR','Nombre',RServidor);
      iniFile.WriteString('DATABASE','Nombre',RDatabaseName);
      iniFile.WriteString('DATABASE','Ruta',RRuta);
      iniFile.WriteString('DATABASE','InterBase',RLlave);
   except
   end;
   iniFile.Free;
end;

function TReglas.dame_id(cadena : string) : integer;
var
   tmp : string;
   i   : integer;
begin
   tmp := '';
   if cadena <> '' then
   for i := 2 to length(cadena) do
   begin
      if cadena[i] = ')' then
         break
      else
         tmp := tmp + cadena[i];
   end;
   Result := StrToInt(tmp);
end;

{
procedure TReglas.imagenGuardar(consulta : TDataSource; archivo, campo : string; imagen : TfcImager);
var
  Jpg       : TJpegImage;
  Stream    : TMemoryStream;
  GraphType : TGraphType;
  extension : string;
begin
    Jpg    := nil;
    Stream := nil;
    try
      Stream    := TMemoryStream.Create;
      extension := LowerCase(ExtractFileExt(archivo));
      if (extension = '.bmp') or (extension = '.dib') then
      begin
        GraphType := gtBitmap;
        Stream.Write(GraphType, 1);
        with imagen.Picture.Bitmap do
        begin
          LoadFromFile(archivo);
          imagen.Picture.Bitmap.SaveToStream(Stream);
        end;
      end
      else
         if (extension = '.ico') then
         begin
            GraphType := gtIcon;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Icon do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
         end
         else
         if (extension = '.emf') or (extension = '.wmf') then
         begin
            GraphType := gtMetafile;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Metafile do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
            end
            else
               if (extension = '.jpg') or (extension = '.jpeg') or (extension = '.jpe') then
               begin
                  Jpg := TJpegImage.Create;
                  Jpg.LoadFromFile(archivo);
                  imagen.Picture.Assign(Jpg);
                  GraphType := gtJpeg;
                  Stream.Write(GraphType, 1);
                  Jpg.SaveToStream(Stream);
               end;
      if not(consulta.DataSet.State in [dsEdit, dsInsert]) then
         consulta.DataSet.Edit;
      Stream.Position := 0;
      TBlobField(consulta.DataSet.FieldByName(campo)).LoadFromStream(Stream);
    except
      jpg.Free;
      Stream.Free;
      raise;
    end;
    jpg.Free;
    Stream.Free;
end;
}

procedure TReglas.imagenGuardar(consulta : TDataSource; archivo, campo : string; imagen : TImage);
var
  Jpg       : TJpegImage;
  Stream    : TMemoryStream;
  GraphType : TGraphType;
  extension : string;
begin
    Jpg    := nil;
    Stream := nil;
    try
      Stream    := TMemoryStream.Create;
      extension := LowerCase(ExtractFileExt(archivo));
      if (extension = '.bmp') or (extension = '.dib') then
      begin
        GraphType := gtBitmap;
        Stream.Write(GraphType, 1);
        with imagen.Picture.Bitmap do
        begin
          LoadFromFile(archivo);
          imagen.Picture.Bitmap.SaveToStream(Stream);
        end;
      end
      else
         if (extension = '.ico') then
         begin
            GraphType := gtIcon;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Icon do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
         end
         else
         if (extension = '.emf') or (extension = '.wmf') then
         begin
            GraphType := gtMetafile;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Metafile do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
            end
            else
               if (extension = '.jpg') or (extension = '.jpeg') or (extension = '.jpe') then
               begin
                  Jpg := TJpegImage.Create;
                  Jpg.LoadFromFile(archivo);
                  imagen.Picture.Assign(Jpg);
                  GraphType := gtJpeg;
                  Stream.Write(GraphType, 1);
                  Jpg.SaveToStream(Stream);
               end;
      if not(consulta.DataSet.State in [dsEdit, dsInsert]) then
         consulta.DataSet.Edit;
      Stream.Position := 0;
      TBlobField(consulta.DataSet.FieldByName(campo)).LoadFromStream(Stream);
//      consulta.DataSet.Post;
    except
      jpg.Free;
      Stream.Free;
      raise;
    end;
    jpg.Free;
    Stream.Free;
end;
{

procedure TReglas.imagenGuardar(archivo : string; imagen : TfcImager; var Stream : TMemoryStream);
var
  Jpg       : TJpegImage;
  GraphType : TGraphType;
  extension : string;
begin
    Jpg    := nil;
    Stream.Clear;
    try
      extension := LowerCase(ExtractFileExt(archivo));
      if (extension = '.bmp') or (extension = '.dib') then
      begin
        GraphType := gtBitmap;
        Stream.Write(GraphType, 1);
        with imagen.Picture.Bitmap do
        begin
          LoadFromFile(archivo);
          imagen.Picture.Bitmap.SaveToStream(Stream);
        end;
      end
      else
         if (extension = '.ico') then
         begin
            GraphType := gtIcon;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Icon do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
         end
         else
         if (extension = '.emf') or (extension = '.wmf') then
         begin
            GraphType := gtMetafile;
            Stream.Write(GraphType, 1);
            with imagen.Picture.Metafile do
            begin
               LoadFromFile(archivo);
               imagen.Picture.Bitmap.SaveToStream(Stream);
            end;
            end
            else
               if (extension = '.jpg') or (extension = '.jpeg') or (extension = '.jpe') then
               begin
                  Jpg := TJpegImage.Create;
                  Jpg.LoadFromFile(archivo);
                  imagen.Picture.Assign(Jpg);
                  GraphType := gtJpeg;
                  Stream.Write(GraphType, 1);
                  Jpg.SaveToStream(Stream);
               end;
    except
      jpg.Free;
      raise;
    end;
    jpg.Free;
end;
}


{
procedure TReglas.imagenVer(consulta : TDataSource; campo : string; imagen : TjvImage);
var
  Stream    : TMemoryStream;
  Jpg       : TJpegImage;
  GraphType : TGraphType;
begin
  Jpg    := nil;
  Stream := nil;
  try
    Stream := TMemoryStream.Create;
    TBlobField(consulta.DataSet.FieldByName(campo)).SaveToStream(Stream);
    if Stream.Size > 0 then
    begin
      Stream.Position := 0;
      Stream.Read(GraphType, 1);
      case GraphType of
         gtBitmap   : imagen.Picture.Bitmap.LoadFromStream(Stream);
         gtIcon     : imagen.Picture.Icon.LoadFromStream(Stream);
         gtMetafile : imagen.Picture.Metafile.LoadFromStream(Stream);
         gtJpeg     : begin
                         Jpg := TJpegImage.Create;
                         Jpg.LoadFromStream(Stream);
                         imagen.Picture.Assign(Jpg);
                      end
      else
         imagen.Picture.Assign(nil);
      end;
    end
       else
          imagen.Picture.Assign(nil);
  except
    imagen.Picture.Assign(nil);
  end;
  jpg.Free;
  Stream.Free;
end;
}
{
procedure TReglas.imagenVer(consulta : TDataSource; campo : string; imagen : TfcImager; var Stream : TMemoryStream);
var
  Jpg       : TJpegImage;
  GraphType : TGraphType;
begin
  Jpg            := nil;
  imagen.Picture := nil;
  Stream.Clear;
  try
    TBlobField(consulta.DataSet.FieldByName(campo)).SaveToStream(Stream);
    if Stream.Size > 0 then
    begin
      Stream.Position := 0;
      Stream.Read(GraphType, 1);
      case GraphType of
         gtBitmap   : imagen.Picture.Bitmap.LoadFromStream(Stream);
         gtIcon     : imagen.Picture.Icon.LoadFromStream(Stream);
         gtMetafile : imagen.Picture.Metafile.LoadFromStream(Stream);
         gtJpeg     : begin
                         Jpg := TJpegImage.Create;
                         Jpg.LoadFromStream(Stream);
                         imagen.Picture.Assign(Jpg);
                      end
      else
         imagen.Picture.Assign(nil);
      end;
    end
       else
          imagen.Picture.Assign(nil);
  except
    imagen.Picture.Assign(nil);
  end;
  jpg.Free;
end;
}
{
procedure TReglas.imagenVer(consulta : TDataSource; campo : string; imagen : TfcImager);
var
  Stream    : TMemoryStream;
  Jpg       : TJpegImage;
  GraphType : TGraphType;
begin
  Jpg    := nil;
  Stream := nil;
  try
    Stream := TMemoryStream.Create;
    TBlobField(consulta.DataSet.FieldByName(campo)).SaveToStream(Stream);
    if Stream.Size > 0 then
    begin
      Stream.Position := 0;
      Stream.Read(GraphType, 1);
      case GraphType of
         gtBitmap   : imagen.Picture.Bitmap.LoadFromStream(Stream);
         gtIcon     : imagen.Picture.Icon.LoadFromStream(Stream);
         gtMetafile : imagen.Picture.Metafile.LoadFromStream(Stream);
         gtJpeg     : begin
                         Jpg := TJpegImage.Create;
                         Jpg.LoadFromStream(Stream);
                         imagen.Picture.Assign(Jpg);
                      end
      else
         imagen.Picture.Assign(nil);
      end;
    end
       else
          imagen.Picture.Assign(nil);
  except
    imagen.Picture.Assign(nil);
  end;
  jpg.Free;
  Stream.Free;
end;
}
procedure TReglas.imagenVer(consulta : TDataSource; campo : string; imagen : TImage);
var
  Stream    : TMemoryStream;
  Jpg       : TJpegImage;
  GraphType : TGraphType;
begin
  Jpg    := nil;
  Stream := nil;
  try
    Stream := TMemoryStream.Create;
    TBlobField(consulta.DataSet.FieldByName(campo)).SaveToStream(Stream);
    if Stream.Size > 0 then
    begin
      Stream.Position := 0;
      Stream.Read(GraphType, 1);
      case GraphType of
         gtBitmap   : imagen.Picture.Bitmap.LoadFromStream(Stream);
         gtIcon     : imagen.Picture.Icon.LoadFromStream(Stream);
         gtMetafile : imagen.Picture.Metafile.LoadFromStream(Stream);
         gtJpeg     : begin
                         Jpg := TJpegImage.Create;
                         Jpg.LoadFromStream(Stream);
                         imagen.Picture.Assign(Jpg);
                      end
      else
         imagen.Picture.Assign(nil);
      end;
    end
       else
          imagen.Picture.Assign(nil);
  except
    imagen.Picture.Assign(nil);
  end;
  jpg.Free;
  Stream.Free;
end;

function TReglas.activarElegirControladorImpresora(nombre : string) : boolean;
var
   iniFile       : TIniFile;
   StrPrinterNom : string;
   respuesta     : Boolean;
begin
   nombre := uppercase(nombre);
   iniFile       := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom := iniFile.ReadString(nombre,'ImpresoraNom1','');
   iniFile.Free;
   if strPrinterNom = '' then //load parametro de impresora
      respuesta := TRUE
   else
      respuesta := FALSE;
   Result := respuesta;
end;

procedure TReglas.separarFlotante(pFlotante : Double; var pEntero : string; var pFraccion : string);
var
   i           : integer;
   floatStr    : string;
   tmpEntero   : string;
   tmpFraccion : string;
   posicion    : integer;
   longitud    : integer;
   diferencia  : integer;
begin
   tmpEntero   := '';
   tmpFraccion := '';
   floatStr    := FloatToStr(pFlotante);
   longitud    := Length(floatStr);
   posicion    := longitud;
   for i := 1 to longitud do
   begin
      if floatStr[i] = '.' then
      begin
         posicion := i;
         break;
      end
      else
         tmpEntero := tmpEntero + floatStr[i];
   end;
   diferencia  := longitud - posicion;
   tmpFraccion := copy(floatStr, posicion + 1, diferencia);
   if (Length(tmpFraccion) > 2 ) then
      tmpFraccion := copy(tmpFraccion, 1, 2)
   else
      if (Length(tmpFraccion) < 2 ) then
      begin
         diferencia := 2 - length(tmpFraccion);
         for i := 1 to diferencia do
            tmpFraccion := tmpFraccion + '0';
      end;
   pEntero     := tmpEntero;
   pFraccion   := tmpFraccion;
end;

function TReglas.convertirOEM(cadena : string) : string;
type
   PTEXTO =  PAnsiChar ; //array[0..255] of CHAR;
var
   tmp   : PTEXTO;
   texto : string;
begin
   AnsiToOEM(PAnsiChar(cadena),tmp);
   texto := tmp;
   result := texto;
end;

procedure TReglas.fijarUsuario(valor : string);
begin
   usuarioTexto := valor;
end;

function TReglas.dameUsuario : string;
begin
   Result := usuarioTexto;
end;


function TReglas.addCaracteres(cadena : string; cuantos : integer; caracter : char; orientacion : integer) : string;
var
   i,
   longitud   : integer;
   tmp        : string;
   dif        : integer;
   caracteres : string;
begin
   caracteres := '';
   longitud   := length(cadena);
   if longitud > cuantos then
      tmp := copy(cadena,1,cuantos)
   else
      if longitud < cuantos then
      begin
         dif := cuantos - longitud;
         for i := 1 to dif do
            caracteres := caracteres + caracter;
         case orientacion of
           IZQUIERDA : tmp := caracteres + cadena;
           DERECHA   : tmp := cadena + caracteres;
         end;
      end
      else
         tmp := cadena;
   Result := tmp;
end;

function TReglas.validar_precio(capturado, minimo : double; nivel : integer) : boolean;
type
   PAutoriza = ^TfrmAcceso;
var
   autoriza  : PAutoriza;
   respuesta : boolean;
   autorizar : boolean;
begin
   if(capturado < minimo) then
   begin
      respuesta := false;
      if MessageDlg('�Autorizar Precio?'+#13+'El precio se modifico, precio minimo excedido.',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
        autorizar := true;
      end
      else
      begin
        autorizar := false;
      end;
   end
   else
      begin
         respuesta := true;
         autorizar := false;
      end;

   if autorizar then
   begin
      respuesta := true;
      if dameUsuarioNivel < nivel then
      begin
         new(autoriza);
         autoriza^        := TfrmAcceso.Create(Application);
         autoriza^.Nivel  := nivel;
         autoriza^.Status := FormatFloat('###,###,##0.00', minimo);
         autoriza^.ShowModal;
         respuesta := autoriza^.Rsp;
         autoriza^.Free;
         Dispose(autoriza);
      end;
   end;
   Result := respuesta;
end;

function TReglas.validacion_precio(valor, precio : double) : boolean;
{type
   PMensajes = ^TMensajes;
   PAutoriza = ^TfrmAcceso;
var
   mensaje   : PMensajes;
   autoriza  : PAutoriza;
   respuesta : boolean;
   autorizar : boolean;}
var
   respuesta : boolean;
begin
{   if(valor < precio) then
   begin
      respuesta      := false;
      new(mensaje);
      mensaje^  := TMensajes.Create(Application);
      mensaje^.Forma    := foPregunta;
      mensaje^.Mensaje1 := '�Autorizar Precio?';
      mensaje^.Mensaje2 := 'El precio se modifico, precio minimo excedido.';
      mensaje^.Execute;
      autorizar := mensaje^.Respuesta;
      mensaje^.Free;
      Dispose(mensaje);
   end
   else
      begin
         Respuesta := true;
         autorizar := false;
      end;

   if autorizar then
   begin
      respuesta := true;
      if dameUsuarioNivel < 5 then
      begin
         new(autoriza);
         autoriza^        := TfrmAcceso.Create(Application);
         autoriza^.Nivel  := 5;
         autoriza^.Status := 'Cambio de Precio';
         autoriza^.ShowModal;
         respuesta := autoriza^.Rsp;
         autoriza^.Free;
         Dispose(autoriza);
      end; }

   respuesta := true;
   if(valor < precio) then
   begin
      frmAcceso := TfrmAcceso.Create(Application);
      try
         frmAcceso.Nivel  := 5;
         frmAcceso.Status := 'Cambio de Precio, ' + FormatFloat('###,###,##0.00', valor);
         frmAcceso.ShowModal;
         respuesta := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

//   end;
   Result := respuesta;
end;

function TReglas.dame_efectos : boolean;
begin
   Result := REfectos;
end;

procedure TReglas.solo_numeros(var k : char);
begin
   case k of
     char(0)..char(7),char(9)..char(12),char(14)..char(47),char(58)..char(255): k:=char(nil);
   end;
end;

procedure TReglas.solo_numeros_y_punto(var k : char; texto : string);
   procedure verificar;
   var
      i : integer;
   begin
      for i := 1 to length(texto) do
         if texto[i] = '.' then
            k := char(nil);
   end;
begin
   if k = '.' then
      verificar;
   case k of
     char(0)..char(7),char(9)..char(12),char(14)..char(45),char(47),char(58)..char(255): k:=char(nil);
   end;
end;

procedure TReglas.imprimir_ticket(valor : integer);
begin
end;

procedure TReglas.guarda_llave(valor : string);
begin
   RLlave := valor;
end;

function TReglas.dame_llave : string;
begin
   Result := Desencriptar(RLLave);
end;

function TReglas.espejo(cadena : string) : string;
var
   longitud : integer;
   tmp      : string;
   i        : integer;
begin
   tmp      := '';
   longitud := length(cadena);
   for i := longitud downto 1 do
      tmp := tmp + cadena[i];
   Result := tmp;
end;

function TReglas.encriptar(cadena : string) : string;
var
  tmp       : string;
  longitud  : integer;
  i,j       : integer;
const
   abecedario : array[0..35] of char = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9');
   cambio     : array[0..35] of char = ('!','@','#','$','%','^','&','*','(','-',')','+','=',',','<','.','>','?','/',':',';','[',']','{','}','\','I','J','K','L','M','N','P','Q','R','S');
begin
   tmp    := '';
   cadena := espejo(cadena);
   cadena := UpperCase(cadena);
   longitud  := Length(cadena);
   for i := 1 to (longitud + 1) do
   begin
      for j := 0 to 35 do
      begin
         if cadena[i] = abecedario[j] then
         begin
            tmp := tmp + cambio[j];
            break;
         end;
      end;
   end;
   Result := tmp;
end;

function TReglas.desencriptar(cadena : string) : string;
var
  tmp       : string;
  longitud  : integer;
  i,j       : integer;
const
   abecedario : array[0..35] of char = ('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z','0','1','2','3','4','5','6','7','8','9');
   cambio     : array[0..35] of char = ('!','@','#','$','%','^','&','*','(','-',')','+','=',',','<','.','>','?','/',':',';','[',']','{','}','\','I','J','K','L','M','N','P','Q','R','S');
begin
   tmp      := '';
   longitud := Length(cadena);
   if longitud > 0 then
   begin
      cadena   := UpperCase(cadena);
      for i := 1 to (longitud + 1) do
      begin
         for j := 0 to 35 do
         begin
            if cadena[i] = cambio[j] then
            begin
               tmp := tmp + abecedario[j];
               break;
            end;
         end;
      end;
      tmp    := espejo(tmp);
      tmp    := LowerCase(tmp);
   end;
   Result := tmp;
end;

function TReglas.dame_empresa : integer;
begin
   Result := empresa;
end;

procedure TReglas.fijar_empresa(valor : integer);
begin
   empresa := valor;
end;

procedure TReglas.cargar_imagenes(imagen : TImageList; vista :TListView; datos : TIBTable);
var
   grafico : TBitmap;
   fuente  : TDataSource;
begin
   fuente         := TDataSource.Create(Application);
   fuente.DataSet := datos;
   {
   grafico        := TBitmap. Create(Application);
   grafico.DataSource := fuente;
   grafico.DataField  := 'ICONO';

   imagen.Clear;
   vista.Items.Clear;
   datos.First;
   while not(datos.Eof) do
   begin
      if datos.FieldByName('ICONO').AsString <> '' then
      begin
         imagen.InsertMasked(datos.FieldByName('INDICE').AsInteger, grafico.Picture.Bitmap, clInfoBk);

         vista.Items.Insert(datos.FieldByName('INDICE').AsInteger);
         vista.Items.Item[datos.FieldByName('INDICE').AsInteger].Caption    := datos.FieldByName('INDICE').AsString;
         vista.Items.Item[datos.FieldByName('INDICE').AsInteger].ImageIndex := datos.FieldByName('INDICE').AsInteger;
      end;
      datos.Next;
   end;
   fuente.DataSet := nil;
   fuente.Free;

   grafico.DataSource := nil;
   grafico.Free;
   }
end;

procedure TReglas.cargar_imagenes2(imagen : TImageList; datos : TIBQuery);
var
   // grafico : TdxDBGraphicEdit;
   fuente  : TDataSource;
begin
   {
   fuente         := TDataSource.Create(Application);
   fuente.DataSet := datos;
   grafico        := TdxDBGraphicEdit.Create(Application);
   grafico.DataSource := fuente;
   grafico.DataField  := 'ICONO';
   imagen.Clear;
   datos.First;
   while not(datos.Eof) do
   begin
      if datos.FieldByName('ICONO').AsString <> '' then
      begin
         imagen.InsertMasked(datos.FieldByName('INDICE').AsInteger,grafico.Picture.Bitmap,clInfoBk);
      end;
      datos.Next;
   end;
   fuente.Free;
   grafico.Free;
   }
end;

procedure TReglas.fijarUsuario(valor : integer);
begin
   usuario := valor;
end;

function TReglas.dame_usuario : integer;
begin
   Result := usuario;
end;

procedure TReglas.fijar_fecha(valor : TDatetime);
begin
   RFecha := valor;
end;

function TReglas.dame_fecha : TDatetime;
begin
   Result := RFecha;
end;

function TReglas.RunControlPanelApplet(sAppletFileName : string) : integer;
begin
   Result := WinExec(PAnsiChar('rundll32.exe shell32.dll,'+'Control_RunDLL'+sAppletFileName),SW_SHOWNORMAL);end;

procedure TReglas.verifica_formato;
var
   tmp1,
   tmp2 : string;
begin
   tmp1 := FormatDateTime('dd/mm/yyyy', dame_fecha);
   tmp2 := DateToStr(dame_fecha);
   if tmp1 <> tmp2 then
   begin
      if MessageDlg('Formato incorrecto.'+#13+'�Configurar fecha?' +#13 +
      'La configuraci�n de la fecha es incorrecta, debe ser:'+#13+#13+'Windows Espa�ol = dd/mm/aaaa'+#13+'Windows Ingles = dd/mm/yyyy.',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
         RunControlPanelApplet('intl.cpl');
      end;
   end;
end;

procedure TReglas.cerrar_all;
var
  i : integer;
begin
   for i := 0 to indiceMenu do
      if menu[i].activo then
        cerrar(menu[i].ejecutar);
end;

procedure cerrar(const objeto : string);
var
  i : integer;
begin
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].name = objeto then
      begin
        Screen.Forms[i].Close;
        break;
      end;
end;

procedure TReglas.marcar_menu(const objeto : string);
var
  i : integer;
begin
   for i := 0 to indiceMenu do
      if menu[i].ejecutar = objeto then
      begin
         menu[i].activo := TRUE;
         break;
      end;
end;

function TReglas.solo_alfabeto(texto : string) : string;
var
  i   : integer;
  tmp : string;
begin
  tmp := '';
  for i := 1 to length(texto) do
    if texto[i] in ['A'..'Z','a'..'z',' ','_'] then
       tmp := tmp + texto[i];
   Result := tmp;
end;

procedure TReglas.refresh_IBQuery(value : TIBQuery);
begin
  value.Close;
  value.Open;
end;

procedure TReglas.abrir_IBQuery_seek(campo : string; actual : integer;consulta : TIBQuery);
begin
   consulta.Close;
   consulta.Open;
   consulta.Locate(campo,  actual, [loCaseInsensitive]);
end;

function TReglas.dame_indice : integer;
begin
  Result := indiceMenu;
end;

procedure TReglas.destruir_menu;
var
   i : integer;
begin
   for i := indiceMenu downto 0 do
      menu[i].item.Free;
   indiceMenu := -1;
end;

procedure TReglas.Save(ADefaultExt, AFilter, AFileName: String; AMethod: TSaveMethod);
var
   SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(Application);
  with SaveDialog do
  begin
    DefaultExt := ADefaultExt;
    Filter := AFilter;
    FileName := AFileName;
    if Execute then
      AMethod(FileName, TRUE);
  end;
  SaveDialog.Free;
end;

procedure TReglas.Click(Sender : TObject);
var
   cual : word;
begin
   cual := buscar(TMenuItem(Sender).Name);
   if menu[cual].ejecutar <> 'noejecutar' then
   begin
      if menu[cual].ejecutar = 'comando' then
         comando(solo_alfabeto(menu[cual].item.Caption))
      else
        begin
           menu[cual].activo := TRUE;
           forma(menu[cual].ejecutar);
        end;
   end;
end;

function TReglas.buscar(valor : string) : integer;
var
   i    : integer;
   cual : integer;
begin
   cual := -1;
   for i := 0 to indiceMenu do
      if menu[i].item.Name = valor then
      begin
         cual := i;
         break;
      end;
   buscar := cual;
end;

function TReglas.find(valor : integer) : TMenuItem;
var
   i    : integer;
   cual : integer;
begin
   cual := -1;
   for i := 0 to indiceMenu do
      if menu[i].id = valor then
      begin
         cual := i;
         break;
      end;
   find := menu[cual].item;
end;

procedure TReglas.crear_menu(consulta : TIBQuery; origen : TMainMenu);
{var
   i,j : integer;}
begin
  with consulta do
  begin
    First;
    while not(Eof) do
    begin
       if FieldByName('R_NOMBRE_INTERNO').AsString = 'raiz' then
          crear_raiz(origen, FieldByName('R_MENU').AsInteger, FieldByName('R_NOMBRE_INTERNO').AsString, FieldByName('R_NOMBRE_EXTERNO').AsString, FieldByName('R_NAME').AsString)
       else
         if FieldByName('R_NOMBRE_INTERNO').AsString = 'linea' then
           item_linea(FieldByName('R_LINK').AsInteger, FieldByName('R_MENU').AsInteger, FieldByName('R_NOMBRE_INTERNO').AsString, FieldByName('R_NOMBRE_EXTERNO').AsString, FieldByName('R_NAME').AsString)
         else
            if FieldByName('R_NOMBRE_EXTERNO').AsString <> 'nocrear' then
            begin
               //menu
               item(FieldByName('R_LINK').AsInteger, FieldByName('R_MENU').AsInteger, FieldByName('R_IMAGEN').AsInteger, FieldByName('R_NOMBRE_INTERNO').AsString, FieldByName('R_NOMBRE_EXTERNO').AsString, FieldByName('R_NAME').AsString, FieldByName('R_SHORTCUT').AsString);
            end;
       Next;
    end;
  end;
end;

procedure TReglas.crear_raiz(origen : TMainMenu; id : integer; ejecutar, caption, name : string);
begin
  inc(indiceMenu);
  menu[indiceMenu].item                    := TMenuItem.Create(Application);
  menu[indiceMenu].item.Caption            := caption+'  ';
  menu[indiceMenu].item.Checked            := FALSE;
  menu[indiceMenu].item.Enabled            := TRUE;
  menu[indiceMenu].item.HelpContext        := 0;
  menu[indiceMenu].item.ImageIndex         := -1;
  menu[indiceMenu].item.Name               := name;
  menu[indiceMenu].item.ShortCut           := TextToShortCut('(None)');
  menu[indiceMenu].item.Tag                := 0;
  menu[indiceMenu].item.Visible            := TRUE;
  menu[indiceMenu].id                      := id;
  menu[indiceMenu].ejecutar                := ejecutar;
  origen.Items.Insert(indiceMenu,menu[indiceMenu].item);
end;

procedure TReglas.item(buscar, id, imageindex : integer; ejecutar, caption, name, shortcut : string);
var
   temporal : TMenuItem;
begin
  inc(indiceMenu);
  menu[indiceMenu].item                    := TMenuItem.Create(Application);
  menu[indiceMenu].item.Caption            := caption;
  menu[indiceMenu].item.Checked            := FALSE;
  menu[indiceMenu].item.Enabled            := TRUE;
  menu[indiceMenu].item.HelpContext        := 0;
  menu[indiceMenu].item.ImageIndex         := imageindex;
  menu[indiceMenu].item.Name               := name;
  menu[indiceMenu].item.ShortCut           := TextToShortCut(shortcut);
  menu[indiceMenu].item.Tag                := 0;
  menu[indiceMenu].item.Visible            := TRUE;
  menu[indiceMenu].id                      := id;
  menu[indiceMenu].ejecutar                := ejecutar;
  menu[indiceMenu].activo                  := false;
  if ejecutar <> 'item' then
    menu[indiceMenu].item.OnClick := click;
  temporal := find(buscar);
  temporal.Add(menu[indiceMenu].item);
end;

procedure TReglas.item_linea(buscar, id : integer; ejecutar, caption, name : string);
var
   temporal : TMenuItem;
begin
  inc(indiceMenu);
  menu[indiceMenu].item                    := TMenuItem.Create(Application);
  menu[indiceMenu].item.Caption            := '-';
  menu[indiceMenu].item.Hint               := caption;
  menu[indiceMenu].item.Name               := name;
  menu[indiceMenu].item.Tag                := random(colores);
  menu[indiceMenu].id                      := id;
  menu[indiceMenu].ejecutar                := ejecutar;
  temporal := find(buscar);
  temporal.Add(menu[indiceMenu].item);
end;

function TReglas.acceso(usuarios, complemento : TIBTable; usuario, clave: string) : boolean;
var
   entrar  : boolean;
begin
  entrar  := FALSE;
  usuarios.Filter := 'USUARIO = '''+usuario+'''';
  if not(usuarios.IsEmpty) then
  begin
     if usuarios.FieldByName('PSECRETA').Asstring = clave then
     begin
        if usuarios.FieldByName('BAJA').AsString = 'No' then
           entrar := TRUE
        else
        begin
           ShowMessage('Acceso denegado.' + #13+'El usuario fue temporalmente dado de baja, consulte a su administrador.');
        end;
     end
     else
     begin
       ShowMessage('Acceso denegado.' + #13+'Clave incorrecta');
     end;
  end
  else
     begin
       ShowMessage('Acceso denegado.' + #13+'Verifique que el nombre del usuario sea escrito correctamente (mayusculas y minusculas), si esta escrito correctamente, consulte al administrador del sistema.');
     end;
  Result := entrar;
end;

function TReglas.acceso2(usuarios, complemento : TIBTable; usuario, clave: string) : integer;
var
   tmp : integer;
begin
   //0=correcto
   //1=usuario dado de baja
   //2=Clave incorrecta
   //3=Usuario incorrecto
  usuarios.Filter := 'USUARIO = '''+usuario+'''';
  if not(usuarios.IsEmpty) then
  begin
     if usuarios.FieldByName('PSECRETA').Asstring = clave then
     begin
        if usuarios.FieldByName('BAJA').AsString = 'No' then
           tmp := 0
        else
           tmp := 1;
     end
     else
        tmp := 2;
  end
  else
     tmp := 3;
  Result := tmp;
end;

function TReglas.dame_ruta : string;
begin
   Result := RRuta;
end;

function TReglas.dame_entro : boolean;
begin
   Result := REntro;
end;

procedure TReglas.fijar_entrada(valor : boolean);
begin
   REntro := valor;
end;

procedure TReglas.abrir_IBQuery(value : TIBQuery);
var
   posicion : integer;//fijar posicion del registro
   entro    : boolean;//para posicionar si estaba en un registro
begin
  entro    := FALSE;
  posicion := 0;
  if not(value.State = dsInactive) and not(value.IsEmpty) then
  begin
    posicion := value.FieldByName('ID').AsInteger;
    entro    := TRUE;
  end;
   value.Close;
   value.Open;
   if entro then
     value.LocateNext('ID',posicion,[loCaseInsensitive]);
end;

procedure TReglas.abrir_IBTabla(value : TIBTable);
var
   posicion : integer;//fijar posicion del registro
   entro    : boolean;//para posicionar si estaba en un registro
begin
  entro    := FALSE;
  posicion := 0;
  if not(value.State = dsInactive) and not(value.IsEmpty) then
  begin
    posicion := value.FieldByName('ID').AsInteger;
    entro := TRUE;
  end;
   value.Close;
   value.Open;
   if entro then
     value.Locate('ID',posicion,[loCaseInsensitive]);
end;

function TReglas.dame_servidor : string;
begin
   Result := RServidor;
end;

function TReglas.dame_basededatos : string;
begin
   Result := RBaseDeDatos;
end;

procedure TReglas.registro_aplicacion(llave, servidor, basededatos, ruta : string; preferencias : TIBTable; linux, efectos : boolean);
var
   iniFile   : TIniFile;
   v_linux   : string;
   v_efectos : string;
begin
   RLlave       := encriptar(llave);
   RServidor    := servidor;
   RBaseDeDatos := basededatos;
   RRuta        := ruta;
   if(linux)then
      v_linux := 'Si'
   else
      v_linux := 'No';

   REfectos := efectos;
   if(efectos)then
      v_efectos := 'Si'
   else
      v_efectos := 'No';

   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   iniFile.WriteString('APLICACION','Empresa',preferencias.FieldByName('EMPRESA').AsString);
   iniFile.WriteString('APLICACION','Nombre',preferencias.FieldByName('NOMBRE').AsString);
   iniFile.WriteString('APLICACION','Version',preferencias.FieldByName('VERSION').AsString);
   iniFile.WriteString('APLICACION','Efectos',v_efectos);
   iniFile.WriteString('APLICACION','Creado',preferencias.FieldByName('CREADO').AsString);
   iniFile.WriteString('APLICACION','Actualizado',preferencias.FieldByName('ACTUALIZADO').AsString);
   iniFile.WriteString('APLICACION','HechoPor',preferencias.FieldByName('HECHO_POR').AsString);
   iniFile.WriteString('SERVIDOR','Nombre',servidor);
   iniFile.WriteString('DATABASE','Linux',v_linux);
   iniFile.WriteString('DATABASE','Nombre',basededatos);
   iniFile.WriteString('DATABASE','Ruta',ruta);
   iniFile.WriteString('DATABASE','InterBase',RLlave);
   iniFile.Free;
end;

procedure TReglas.abrir_base_de_datos(ibdatabase : TIBDatabase; llave, servidor, ruta, basededatos : string);
var
   tmp : string;
begin
   ibdatabase.Close;
   if servidor = '' then
      tmp := ruta
   else
      tmp := servidor+':'+ruta;

   ibdatabase.DatabaseName := tmp+basededatos;
   ibdatabase.Params.Clear;
   ibdatabase.Params.Add('user_name=SYSDBA');
   ibdatabase.Params.Add('password='+llave);
   ibdatabase.Open;
   ibdatabase.DefaultTransaction.Active := TRUE;
end;

function TReglas.analiza_ruta(cadena : string) : string;
var
   indice : integer;
begin
   indice := pos(':',cadena);
   Result := copy(cadena,indice + 1, length(cadena));
end;

function TReglas.analiza_servidor(cadena : string) : string;
var
   indice : integer;
begin
   indice := pos(':',cadena);
   Result := copy(cadena,1,indice - 1);
end;

function TReglas.analiza_busqueda(valor : string) : string;
var
   indice : integer;
begin
   if valor[1] = '\' then
   begin
      valor  := copy(valor,3,length(valor) - 2);
      indice := pos('\',valor);
      Delete(valor, indice, 1);
      Insert(':', valor, indice);
      indice := pos('\',valor);
      Insert(':', valor, indice);
   end;
   Result := valor;
end;

procedure TReglas.fijar_registros;
var
   iniFile : TIniFile;
   linux   : string;
   efectos : string;
//   llave   : string;
begin
   iniFile      := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   RServidor    := iniFile.ReadString('SERVIDOR','Nombre','');
   RBaseDeDatos := iniFile.ReadString('DATABASE','Nombre','');
   RRuta        := iniFile.ReadString('DATABASE','Ruta','');
   linux        := iniFile.ReadString('DATABASE','Linux','');
   RLlave       := iniFile.ReadString('DATABASE','InterBase','');
   efectos      := iniFile.ReadString('APLICACION','Efectos','');

   if (UpperCase(linux) = 'SI') then
      RLinux := True
   else
      RLinux := False;

   if (UpperCase(efectos) = 'SI') then
      REfectos := True
   else
      REfectos := False;
      
   iniFile.Free;
end;

{function TReglas.leer_llave : string;
var
   iniFile : TIniFile;
   tmp     : string;
begin
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   tmp     := iniFile.ReadString('DATABASE','InterBase','');
   iniFile.Free;
   guarda_llave(tmp);
   Result := desencriptar(tmp);
end;}

{initialization
  reglas := TReglas.Create;

finalization
  if Assigned(reglas) then
     reglas.Free;}

end.
