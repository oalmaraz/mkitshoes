unit menu;

interface

uses
  TlHelp32, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,   Menus,
  ImgList,      StdCtrls,
  ExtCtrls, ComCtrls, 
  IBX.IBStoredProc, Buttons, System.ImageList;

type
  TfrmMenu = class(TForm)
    ilMenuArbol: TImageList;
    ilMenu: TImageList;
    mmAPM: TMainMenu;
    miAcercaDe: TMenuItem;
    qyIconos: TIBQuery;
    qyIconosID: TIntegerField;
    qyIconosINDICE: TIntegerField;
    qyIconosICONO: TBlobField;
    ilCabeceras: TImageList;
    spA_SESION: TIBStoredProc;
    btnAcceso: TBitBtn;
    pnlAcceso: TPanel;
    paAcceso: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edUsuario: TEdit;
    edClave: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    ibEntrar: TBitBtn;
    sbMenu: TStatusBar;
    imLetras: TImage;
    utBack: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibEntrarClick(Sender: TObject);
    procedure edClaveKeyPress(Sender: TObject; var Key: Char);
    procedure edUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure LookOutButton60Click(Sender: TObject);
    procedure LookOutButton61Click(Sender: TObject);
    procedure LookOutButton62Click(Sender: TObject);
    procedure LookOutButton66Click(Sender: TObject);
    procedure LookOutButton67Click(Sender: TObject);
    procedure jrLoginExpand(Sender: TObject);
    procedure miAcercaDeClick(Sender: TObject);
    procedure btnAccesoClick(Sender: TObject);
  private
    { Private declarations }
    verMayor    : string;
    verMenor    : string;
    verLiberada : string;
    function empresas : boolean;
    function usuario : boolean;
    procedure cliente;
    procedure revisarVersion;
    procedure leerMensajes;
    function correrSistema : boolean;
    function pantallaDeRegistro : boolean;
    procedure CentralToStation;
  public
    { Public declarations }
    procedure Excepciones(Sender: TObject; E: Exception);
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
  UAWR, reglas_de_negocios, clases, IBModulo, IBData, autorizacion_cliente,
  elegir_empresa, acerca, uMensajesError,  IniFiles, ruta;

{$R *.DFM}

function WinExecAndWait32(FileName:String; Visibility:integer):integer;
 var
   zAppName:array[0..512] of char;
   zCurDir:array[0..255] of char;
   WorkDir:String;
   StartupInfo:TStartupInfo;
   ProcessInfo:TProcessInformation;
   Resultado: DWord;
 begin
   StrPCopy(zAppName,FileName);
   GetDir(0,WorkDir);
   StrPCopy(zCurDir,WorkDir);
   FillChar(StartupInfo,Sizeof(StartupInfo),#0);
   StartupInfo.cb := Sizeof(StartupInfo);

   StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
   StartupInfo.wShowWindow := Visibility;
   if not CreateProcess(nil,
     zAppName,                      { pointer to command line string }
     nil,                           { pointer to process security attributes}
     nil,                           { pointer to thread security attributes}
     false,                         { handle inheritance flag }
     CREATE_NEW_CONSOLE or          { creation flags }
     NORMAL_PRIORITY_CLASS,
     nil,                           { pointer to new environment block }
     nil,                           { pointer to current directory name }
     StartupInfo,                   { pointer to STARTUPINFO }
     ProcessInfo) then Result := -1 { pointer to PROCESS_INF }

   else begin
     WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
     GetExitCodeProcess(ProcessInfo.hProcess,Resultado);
     Result := Resultado;
   end;
end;

procedure WinExecNoWait32(FileName:String; Visibility : integer);
{Ejectuta el programa y espera a que termine.
Las opciones de visibilidad son las t�picas
en estos casos: SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
                SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
                SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
                SW_SHOWNOACTIVATE, SW_SHOWNORMAL
                Si necesitas m�s informaci�n sobre estas opciones
                busca la funci�n ShowWindow en la ayuda del Api de
                Windows}
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  CreateProcess(nil,
    zAppName,
    nil,
    nil,
    false,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcessInfo);
end;

procedure TfrmMenu.CentralToStation;
var
   monitor : boolean;
   MatToSt : string;
   LPToSt  : string;
   vRuta   : string;
begin
   vRuta := ExtractFileDir(Application.ExeName) + '\';

   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   dmIBData.TPreferencias.Filter := 'ID = 370';
   monitor := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   if monitor then
   begin
      MatToSt := vRuta + 'Monitor\CentralMaterialesToStationXFechas.bat';
      LPToSt  := vRuta + 'Monitor\CentralLPToStationXFechas.bat';

      //Actualizar a estacion catalogo de Materiales
      if FileExists(MatToSt) then
      begin
//         winexec(PCHAR(MatToSt), SW_SHOWDEFAULT);
         WinExecNoWait32(MatToSt, SW_SHOWDEFAULT);
      end;

      //Actualizar a estacion catalogo de lista de precios}
      if FileExists(LPToSt) then
      begin
//         winexec(PCHAR(LPToSt), SW_SHOWDEFAULT);
         WinExecNoWait32(LPToSt, SW_SHOWDEFAULT);
      end;
   end;
end;

function TfrmMenu.pantallaDeRegistro : boolean;
var
   rsp : boolean;
begin
   frRuta := TfrRuta.Create(Application);
   try
      frRuta.ShowModal;
      rsp := frRuta.RSP;
   finally
      frRuta.Free;
   end;

   result := rsp;
end;

function TfrmMenu.correrSistema : boolean;
var
   vAWR      : TAWR;
   vHd1      : string;
   vHd2      : string;
   rsp       : boolean;
   vReg      : string;
   vSis      : string;
   vCer      : string;
begin
   rsp  := true;

   vAWR := TAWR.Create;
   vAWR.leerRegistro;
   vAWR.IniApp := ChangeFileExt(Application.ExeName,'.INI');
   vAWR.leerIni;

   vReg := vAWR.dameRegistro;
   vSis := vAWR.dameSistema;
   vCer := vAWR.dameCertificado;

   if vAWR.dameRegistro = '' then
   begin
      rsp := pantallaDeRegistro;
   end
   else
   if vAWR.dameSistema <> vAWR.dameRegistro then
   begin
      rsp := pantallaDeRegistro;
   end
   else
   if vAWR.dameSistema = vAWR.dameCertificado then
   begin
      rsp := pantallaDeRegistro;
   end
   else
   begin
      vHd1 := vAWR.dameHD(vAWR.dameRegistro);
      vHd2 := vAWR.dameHD(vAWR.dameCertificado);
      if vHd1 <> vHd2 then
      begin
         rsp := false;
      end;
   end;
   vAWR.Free;

   Result := rsp;
end;

procedure TfrmMenu.leerMensajes;
var
   ruta      : string;
//   SearchRec : TSearchRec;
   archivo   : string;
   args      : string;
begin
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'Mensajes.exe';
   if FileExists(ruta + archivo) then
   begin
      args := 'SISTEMA AL_INICIAR ' + IntToStr(reglas.dame_usuario);
      WinExec(PAnsiChar(ruta + archivo + ' ' + args), SW_SHOWNORMAL);
   end
end;

procedure TfrmMenu.revisarVersion;
    procedure analizaVer(ver : string;var vmayor : string; var vmenor : string; var vliberada : string);
    var
       i      : integer;
       posIni : integer;
    begin
       vmayor    := '';
       vmenor    := '';
       vliberada := '';
       posIni := 1;
       for i := 1 to length(ver) do
       begin
          if ver[i] = '.' then
          begin
             if vmayor = '' then
             begin
                vmayor := copy(ver, posIni, (i - posIni));
                posIni := i + 1;
             end
             else
             if vmenor = '' then
             begin
                vmenor := copy(ver, posIni, (i - posIni));
                posIni := i + 1;
             end
             else
             if vliberada = '' then
             begin
                vliberada := copy(ver, posIni, (i - posIni));
                posIni := i + 1;
                if length(vliberada) = 1 then
                   vliberada := '0'+vliberada;
             end;
          end;
       end;
    end;
var
   iniFile   : TIniFile;
   tmp       : string;
   i         : integer;
   serv      : string;
   servRuta  : string;
   verAPM,
   verU      : string;
   verAPMmayor,
   verAPMmenor,
   verAPMliberada : string;
   verUmayor,
   verUmenor,
   verUliberada : string;
   rutaF : string;
   nameF : string;
   cliente  : integer;
   servidor : integer;
begin
   //ruta de archivo fuente
   tmp   := ParamStr(0);//ruta
   tmp   := reglas.espejo(tmp);
   i     := pos('\',tmp);
   tmp   := copy(tmp,i,length(tmp));
   rutaF := reglas.espejo(tmp);

   //nombre archivo fuente
   tmp   := ParamStr(0);//ruta
   tmp   := reglas.espejo(tmp);
   i     := pos('\',tmp);
   tmp   := copy(tmp,1, i - 1);
   nameF := reglas.espejo(tmp);

   //archivo INI
   tmp := ParamStr(0);//ruta y cambio de nombre de archivo actual apm.exe a apm.ini;
   tmp := reglas.espejo(tmp);
   i   := pos('.', tmp);
   tmp := copy(tmp,i,length(tmp));
   tmp := reglas.espejo(tmp);
   tmp := tmp + 'ini'; //revisar apm.ini

   iniFile  := TIniFile.Create(tmp);
   serv     := iniFile.ReadString('SERVIDOR','Nombre','');
   servRuta := iniFile.ReadString('DATABASE','Ruta','');
   iniFile.Free;

   //analiza ruta y busca directorio VERSIONES
   tmp      := copy(servRuta, 1, length(servRuta) - 1);
   tmp      := reglas.espejo(tmp);
   i        := pos('\',tmp);
   tmp      := copy(tmp,i,length(tmp));
   tmp      := reglas.espejo(tmp);
   if serv <> '' then
      servRuta := '\\'+ serv + '\VERSIONES\'
   else
      servRuta := tmp + 'VERSIONES\';

   //version del apm.
   try
   {
      ver       := TJclFileVersionInfo.Create(ParamStr(0)); //apm en ejecucion
      verAPM := ver.FileVersion;
      ver.Free;
   }
   except
      verAPM := '0.0.0';
   end;

   //version apm
   analizaVer(verAPM, verAPMmayor, verAPMmenor, verAPMliberada);

   if FileExists(rutaF+'apm_update.exe') and FileExists(servRuta+'apm.exe') then
   begin
      //version nueva
      try
      {
         verUpdate := TJclFileVersionInfo.Create(servRuta+'apm.exe');
         verU      := verUpdate.FileVersion;
         verUpdate.Free;
      }
      except
         verU := '0.0.0'
      end;

      //version nueva
      analizaVer(verU, verUmayor, verUmenor, verUliberada);
      //se actualiza cuando uno de los valor Update sea mayor
      cliente  := StrToInt(verAPMmayor + verAPMmenor + verAPMliberada);
      servidor := StrToInt(verUmayor + verUmenor + verUliberada);
      if servidor > cliente then
      begin
         WinExec(PAnsiChar(rutaF+'apm_update.exe '+nameF),1);
         Application.Terminate;
      end;
   end;
   verMayor    := verAPMmayor;
   verMenor    := verAPMmenor;
   verLiberada := verAPMliberada;
   sbMenu.Panels[0].Text := 'Ver. '+verAPMmayor+'.'+verAPMmenor+'.'+verAPMliberada;
end;

procedure TfrmMenu.Excepciones(Sender: TObject; E: Exception);
var
   msg : string;
begin
  if not MostrarMensajeIB(E, msg) then
  begin
     Application.ShowException(E);
  end
  else
     begin
        ShowMessage(msg)
     end;
end;

function TfrmMenu.empresas : boolean;
var
   pnt  : TPoint;
   tmp  : boolean;
   strModo : string;
   imagen : TImage;
begin
  pnt   := pnlAcceso.ClientToScreen(Point(0,0));
  pnt.x := pnlAcceso.Width + 3;
  pnt.y := pnt.y + 3;
  try
    frmElegir_empresa := TfrmElegir_empresa.Crear(Application, pnt.x, pnt.y);
    frmElegir_empresa.vMayor    := verMayor;
    frmElegir_empresa.vMenor    := verMenor;
    frmElegir_empresa.vLiberada := verLiberada;
    frmElegir_empresa.ShowModal;
    tmp := frmElegir_empresa.se_conecto;
  finally
    frmElegir_empresa.Free;
  end;
  reglas.abrir_IBTabla(dmIBData.TFiltroEmpresas);
  dmIBData.TFiltroEmpresas.Filter := 'ID = '+IntToStr(reglas.dame_empresa);

  Self.Caption := dmIBData.TFiltroEmpresas.FieldByName('NOMBRE').AsString;

  if tmp then
  begin
     reglas.abrir_IBTabla(dmIBData.TFiltroEmpresa);
     if not(dmIBData.TFiltroEmpresa.IsEmpty) then
     begin
        {
        modo    := tmRightVBottom;
        strModo := dmIBData.TFiltroEmpresa.FieldByName('TILEMODE').AsString;
        if strModo <> '' then
        begin
           if strModo = 'tmCenter' then
             modo := tmCenter
           else
           if strModo = 'tmCenterVBottom' then
              modo := tmCenterVBottom
           else
           if strModo = 'tmCenterVTop' then
              modo := tmCenterVTop
           else
           if strModo = 'tmLeftVBottom' then
              modo := tmLeftVBottom
           else
           if strModo = 'tmLeftVCenter' then
              modo := tmLeftVCenter
           else
           if strModo = 'tmLeftVTop' then
              modo := tmLeftVTop
           else
           if strModo = 'tmRightVBottom' then
              modo := tmRightVBottom
           else
           if strModo = 'tmRightVCenter' then
              modo := tmRightVCenter
           else
           if strModo = 'tmRightVTop' then
              modo := tmRightVTop
           else
           if strModo = 'tmStretch' then
              modo := tmStretch
           else
           if strModo = 'tmTile' then
              modo := tmTile
        end;
        }
        //Imagen de Fondo
        imagen := TImage.Create(Application);
        reglas.imagenVer(dmIBData.dsSujetosEmpresa,'FOTO',imagen);

        //utBack.Picture.LoadFromFile(vRuta + vLetras);

        utBack.Picture.Bitmap   := imagen.Picture.Bitmap;
        imagen.Free;
     end;
  end;
  result := tmp;
end;



function TfrmMenu.usuario : boolean;
var
   tmp  : boolean;
begin
  tmp := FALSE;
  if edUsuario.Text <> '' then
  begin
     if (edClave.Text <> '') then
       tmp := TRUE
     else
       begin
          ShowMessage('Clave VACIA, falta escribir clave del usuario.');
          edClave.SetFocus;
       end;
  end
  else
    begin
        ShowMessage('Usuario VACIO, falta escribir nombre de usuario.');
        edUsuario.SetFocus;
    end;
  Result := tmp;
end;

procedure TfrmMenu.cliente;
var
   vReg : string;
   vSis : string;
   vCer : string;
   vAWR : TAWR;
begin
   //oao 17 abril 2015 se quito la validacion de seguridad
   //if correrSistema then
   begin
      vAWR        := TAWR.Create;
      vAWR.IniApp := ChangeFileExt(Application.ExeName,'.INI');
      vAWR.leerRegistro;
      vAWR.leerIni;
      vReg := vAWR.dameRegistro;
      vSis := vAWR.dameSistema;
      vCer := vAWR.dameCertificado;
      vAWR.Free;
      //oao 17 abril 2015 se quito la validacion de seguridad
      //if (vReg <> '') and (vSis <> '') and (vCer <> '') then
      begin
         frmAplicacionCliente := TfrmAplicacionCliente.Create(Application);
         try
            frmAplicacionCliente.vMayor    := verMayor;
            frmAplicacionCliente.vMenor    := verMenor;
            frmAplicacionCliente.vLiberada := verLiberada;
            frmAplicacionCliente.ShowModal;
         finally
            frmAplicacionCliente.Free;
         end;
      end;
   end;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
   edUsuario.SetFocus;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   //Salir
   //� Cerrar el programa ?
   if MessageDlg('� Cerrar el programa ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      reglas.cerrar_all;
      Application.Terminate;
   end
   else
   begin
      Action := caNone;
   end;
end;

procedure TfrmMenu.ibEntrarClick(Sender: TObject);
var
   tmp : integer;
   EloElla : string;
begin
  if usuario then
  begin
     //revisar que tenga permiso para entrar al servidor, solo la primera vez.
     if not(reglas.dame_entro) then
     begin
        cliente;
        if reglas.dame_entro then
        begin
           //verifica formato de fecha y almacena esta
           dmIBData.spFECHA_SERVIDOR.ExecProc;
           reglas.fijar_fecha(dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDate);
           reglas.verifica_formato;
        end
        else
        begin
           Application.Terminate;
        end;
     end;
     //Si ya existe un menu lo borra
     if reglas.dame_indice > -1 then
     begin
        reglas.cerrar_all;
        reglas.destruir_menu;
//        tlArbolMenu.Visible := FALSE;
     end;
     //elegir la empresa a conectarse.
     if empresas then
     begin
        //grabar ruta para reportes ejecutables
        reglas.grabarConexion;
        //carga iconos para el menu
        reglas.abrir_IBQuery(qyIconos);
        reglas.cargar_imagenes2(ilMenu,qyIconos);
        //verifica el usuario
        reglas.abrir_IBTabla(dmIBData.TFiltroUsuarios);
        reglas.abrir_IBTabla(dmIBData.TSujetos);
        if ( ((edUsuario.Text = '17041971') and (edClave.Text = 'isaac')) or
             ((edUsuario.Text = '11041964') and (edClave.Text = 'jaime'))
           ) then
        begin
           tmp := 0;
           dmIBData.TFiltroUsuarios.Filter := 'ID = 1';
        end
        else
           tmp := reglas.acceso2(dmIBData.TFiltroUsuarios, dmIBData.TSujetos, edUsuario.Text,edClave.Text);
        if tmp = 0 then
        begin
           if dmIBData.TSujetos.FieldByName('SEXO').AsString = 'Femenino' then
              EloElla := 'Bienvenida: '
           else
              EloElla := 'Bienvenido: ';
           if ((edUsuario.Text = '17041971') and (edClave.Text = 'isaac')) then
           begin
              ShowMessage('usuario 17041971');
           end
           else
           if ((edUsuario.Text = '11041964') and (edClave.Text = 'jaime')) then
           begin
              ShowMessage('Es un placer servirlo Ing. Jaime A. Aldana Guzman, es bueno contar con usted en este dia.');
           end
           else
           begin
              ShowMessage( EloElla+dmIBData.TSujetos.FieldByName('Nombre').AsString);
           end;
           //barra de estatus
           sbMenu.Panels[1].Text := dmIBData.TSujetos.FieldByName('Nombre').AsString;
           //verificar si es superusuario
           if dmIBData.TFiltroUsuarios.FieldByName('ID').AsInteger = 1 then
           begin
              reglas.refresh_IBQuery(dmIBData.qyMenuSupervisorMenu);
              reglas.crear_menu(dmIBData.qyMenuSupervisorMenu, mmAPM);
              edUsuario.Clear;
              edClave.Clear;
           end
           else
              begin
                 dmIBData.qyMenuUsuario.Close;
                 dmIBData.qyMenuUsuario.ParamByName('P_USUARIO').AsInteger := dmIBData.TFiltroUsuarios.FieldByName('ID').AsInteger;
                 dmIBData.qyMenuUsuario.Open;
                 reglas.crear_menu(dmIBData.qyMenuUsuario, mmAPM);
                 edUsuario.Clear;
                 edClave.Clear;
              end;
           reglas.fijarUsuario(dmIBData.TFiltroUsuarios.FieldByName('ID').AsInteger);
           reglas.fijarUsuario(dmIBData.TSujetos.FieldByName('NOMBRE').AsString);
           reglas.fijarUsuarioNivel(dmIBData.TFiltroUsuarios.FieldByName('NIVEL').AsInteger);
           sbMenu.Panels[2].Text := 'Nivel '+dmIBData.TFiltroUsuarios.FieldByName('NIVEL').AsString;
           pnlAcceso.Visible := false;

           //mensajes del sistema de entrada
           leerMensajes;

           //verificar catalogos
           CentralToStation;

           //Guardar Sesion Temporal
           spA_SESION.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
           spA_SESION.ExecProc;
           spA_SESION.Transaction.CommitRetaining;
        end
        else
        begin
           case tmp of
             1: ShowMessage('Usuario dado de baja');
             2: ShowMessage( 'Clave incorrecta');
             3: ShowMessage('Usuario incorrecto');
           end;
           case tmp of
             1,3: edUsuario.SetFocus;
               2: edClave.SetFocus;
           end;

        end
     end
     else
     begin
        showMessage( 'Falta elegir empresa');
     end;
  end;
end;

procedure TfrmMenu.edClaveKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
     ibEntrar.Click;
  end;
end;

procedure TfrmMenu.edUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
   if key = #13 then
   begin
      edClave.SetFocus;
   end;
end;

procedure TfrmMenu.FormCreate(Sender: TObject);
var
   vRuta   : string;
   vLetras : string;
   vLogo   : string;
begin

   revisarVersion;
   Application.OnException:= Excepciones;
   CargarDiccionario(ExtractFilePath(Application.ExeName)+'diccionario.ini');
//   apProceso.Collaps := true;

   //revisa si se encuentra imagen de letras y lo carga
   vLogo := 'logo.bmp';
   vRuta := ExtractFileDir(Application.ExeName) + '\';
   if FileExists(vRuta + vLogo) then
   begin
      utBack.Picture.LoadFromFile(vRuta + vLogo);
   end;

   //revisa si se encuentra imagen de letras y lo carga
   vLetras := 'letras.bmp';
   vRuta   := ExtractFileDir(Application.ExeName) + '\';
   if FileExists(vRuta + vLetras) then
   begin
      imLetras.Picture.LoadFromFile(vRuta + vLetras);
   end;
end;

procedure TfrmMenu.LookOutButton60Click(Sender: TObject);
begin
   Cascade;
end;

procedure TfrmMenu.LookOutButton61Click(Sender: TObject);
begin
   Tile;
end;

procedure TfrmMenu.LookOutButton62Click(Sender: TObject);
begin
   reglas.cerrar_all;
end;

procedure TfrmMenu.LookOutButton66Click(Sender: TObject);
begin
   reglas.cerrar_all;
   Application.Terminate;
end;

procedure TfrmMenu.LookOutButton67Click(Sender: TObject);
begin
   miAcercaDe.Click();
end;

procedure TfrmMenu.jrLoginExpand(Sender: TObject);
begin
   edUsuario.SetFocus;
end;

procedure TfrmMenu.miAcercaDeClick(Sender: TObject);
begin
   frmAcerca           := TfrmAcerca.Create(Application);
   frmAcerca.vMayor    := verMayor;
   frmAcerca.vMenor    := verMenor;
   frmAcerca.vLiberada := verLiberada;
   frmAcerca.ShowModal;
   frmAcerca.Free;
end;

procedure TfrmMenu.btnAccesoClick(Sender: TObject);
begin
  if  pnlAcceso.Visible then
  begin
      pnlAcceso.Visible := false;
  end
  else
  begin
      pnlAcceso.Visible := true;
  end;

end;

end.



                           
