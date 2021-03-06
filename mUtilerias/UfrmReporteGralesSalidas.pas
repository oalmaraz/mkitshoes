unit UfrmReporteGralesSalidas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  reglas_de_negocios, Buttons, ExtCtrls, ImgList, System.ImageList;

type
  TfrmReporteGralesSalidas = class(TForm)
    imagenEXE: TImageList;
    JvImageSquare2: TImage;
    JvImageSquare3: TImage;
    JvImageSquare4: TImage;
    JvImageSquare5: TImage;
    JvImageSquare6: TImage;
    JvImageSquare7: TImage;
    JvImageSquare8: TImage;
    JvImageSquare9: TImage;
    JvImageSquare10: TImage;
    JvImageSquare1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    JvImageSquare11: TImage;
    JvImageSquare12: TImage;
    JvImageSquare13: TImage;
    JvImageSquare14: TImage;
    JvImageSquare15: TImage;
    JvImageSquare16: TImage;
    JvImageSquare17: TImage;
    JvImageSquare18: TImage;
    JvImageSquare19: TImage;
    JvImageSquare20: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    fcStatusBar1: TPanel;
    ibSalir: TBitBtn;
    Label21: TLabel;
    JvImageSquare21: TImage;
    Label22: TLabel;
    JvImageSquare22: TImage;
    Label23: TLabel;
    JvImageSquare23: TImage;
    Label24: TLabel;
    JvImageSquare24: TImage;
    Label25: TLabel;
    JvImageSquare25: TImage;
    Label26: TLabel;
    JvImageSquare26: TImage;
    Label27: TLabel;
    JvImageSquare27: TImage;
    Label28: TLabel;
    JvImageSquare28: TImage;
    Label29: TLabel;
    JvImageSquare29: TImage;
    Label30: TLabel;
    JvImageSquare30: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
    procedure LoadFiles;
    procedure extraerIcono(const archivo : string);
    procedure Formato(const ruta, nombre : string; etiqueta : TLabel; imagen : TImage; indice : integer);
  public
    { Public declarations }
  end;

var
   frmReporteGralesSalidas: TfrmReporteGralesSalidas;

implementation

uses ShellAPI;

{$R *.DFM}


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

//function WinExecAndWait32(FileName:String; Visibility : integer):integer;
{Ejectuta el programa y espera a que termine.
Las opciones de visibilidad son las t�picas
en estos casos: SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
                SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
                SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
                SW_SHOWNOACTIVATE, SW_SHOWNORMAL
                Si necesitas m�s informaci�n sobre estas opciones
                busca la funci�n ShowWindow en la ayuda del Api de
                Windows}
{var
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
  if not CreateProcess(nil,
    zAppName,
    nil,
    nil,
    false,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcessInfo) then Result := -1 { pointer to PROCESS_INF }
//  else begin
//    WaitforSingleObject(ProcessInfo.hProcess,INFINITE);
//    GetExitCodeProcess(ProcessInfo.hProcess,Result);
//  end;
//end;


procedure TfrmReporteGralesSalidas.extraerIcono(const archivo : string);
var
  IconIndex: word;
  Buffer: array[0..2048] of char;
  IconHandle: HIcon;
begin
  StrCopy(@Buffer, PCHAR(archivo));
  IconIndex := 0;
  IconHandle := ExtractAssociatedIcon(HInstance, Buffer, IconIndex);
  if IconHandle <> 0 then
  begin
    Icon.Handle := IconHandle;
    imagenEXE.AddIcon(Icon);
  end;
end;

procedure TfrmReporteGralesSalidas.Formato(const ruta, nombre : string; etiqueta : TLabel; imagen : TImage; indice : integer);
var
//   version     : TJclFileVersionInfo;
   archivo     : string;
   descripcion : string;
begin
{
   archivo     := ruta + nombre;
   version     := TJclFileVersionInfo. Create(archivo);
   descripcion := version.FileDescription;
   version.Free;

   etiqueta.Caption  := descripcion;
   imagen.ImageIndex := indice;
   imagen.HiColor    := clActiveCaption;
   imagen.Enabled    := true;
   imagen.Hint       := archivo;
   }
end;

procedure TfrmReporteGralesSalidas.LoadFiles;
var
  SearchRec : TSearchRec;
  count     : integer;
  ruta      : string;
begin
   count := 1;
   ruta  := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   if FindFirst(ruta + '*.exe', faAnyFile, SearchRec) = 0 then
   begin
      extraerIcono(ruta + SearchRec.Name);
      Formato(ruta, SearchRec.Name, Label1, jvImageSquare1, count);
   end;
   while FindNext(SearchRec) = 0 do
   begin
      inc(count);
      extraerIcono(ruta + SearchRec.Name);
      case count of
          2: Formato(ruta, SearchRec.Name, Label2,  jvImageSquare2,  count);
          3: Formato(ruta, SearchRec.Name, Label3,  jvImageSquare3,  count);
          4: Formato(ruta, SearchRec.Name, Label4,  jvImageSquare4,  count);
          5: Formato(ruta, SearchRec.Name, Label5,  jvImageSquare5,  count);
          6: Formato(ruta, SearchRec.Name, Label6,  jvImageSquare6,  count);
          7: Formato(ruta, SearchRec.Name, Label7,  jvImageSquare7,  count);
          8: Formato(ruta, SearchRec.Name, Label8,  jvImageSquare8,  count);
          9: Formato(ruta, SearchRec.Name, Label9,  jvImageSquare9,  count);
         10: Formato(ruta, SearchRec.Name, Label10, jvImageSquare10, count);
         11: Formato(ruta, SearchRec.Name, Label11, jvImageSquare11, count);
         12: Formato(ruta, SearchRec.Name, Label12, jvImageSquare12, count);
         13: Formato(ruta, SearchRec.Name, Label13, jvImageSquare13, count);
         14: Formato(ruta, SearchRec.Name, Label14, jvImageSquare14, count);
         15: Formato(ruta, SearchRec.Name, Label15, jvImageSquare15, count);
         16: Formato(ruta, SearchRec.Name, Label16, jvImageSquare16, count);
         17: Formato(ruta, SearchRec.Name, Label17, jvImageSquare17, count);
         18: Formato(ruta, SearchRec.Name, Label18, jvImageSquare18, count);
         19: Formato(ruta, SearchRec.Name, Label19, jvImageSquare19, count);
         20: Formato(ruta, SearchRec.Name, Label20, jvImageSquare20, count);
         21: Formato(ruta, SearchRec.Name, Label21, jvImageSquare21, count);
         22: Formato(ruta, SearchRec.Name, Label22, jvImageSquare22, count);
         23: Formato(ruta, SearchRec.Name, Label23, jvImageSquare23, count);
         24: Formato(ruta, SearchRec.Name, Label24, jvImageSquare24, count);
         25: Formato(ruta, SearchRec.Name, Label25, jvImageSquare25, count);
         26: Formato(ruta, SearchRec.Name, Label26, jvImageSquare26, count);
         27: Formato(ruta, SearchRec.Name, Label27, jvImageSquare27, count);
         28: Formato(ruta, SearchRec.Name, Label28, jvImageSquare28, count);
         29: Formato(ruta, SearchRec.Name, Label29, jvImageSquare29, count);
         30: Formato(ruta, SearchRec.Name, Label30, jvImageSquare30, count);
      end;
   end;
   FindClose(SearchRec);
end;

procedure TfrmReporteGralesSalidas.FormCreate(Sender: TObject);
begin
   Label1.Caption  := 'vacio';
   Label2.Caption  := 'vacio';
   Label3.Caption  := 'vacio';
   Label4.Caption  := 'vacio';
   Label5.Caption  := 'vacio';
   Label6.Caption  := 'vacio';
   Label7.Caption  := 'vacio';
   Label8.Caption  := 'vacio';
   Label9.Caption  := 'vacio';
   Label10.Caption := 'vacio';
   Label11.Caption := 'vacio';
   Label12.Caption := 'vacio';
   Label13.Caption := 'vacio';
   Label14.Caption := 'vacio';
   Label15.Caption := 'vacio';
   Label16.Caption := 'vacio';
   Label17.Caption := 'vacio';
   Label18.Caption := 'vacio';
   Label19.Caption := 'vacio';
   Label20.Caption := 'vacio';
   Label21.Caption := 'vacio';
   Label22.Caption := 'vacio';
   Label23.Caption := 'vacio';
   Label24.Caption := 'vacio';
   Label25.Caption := 'vacio';
   Label26.Caption := 'vacio';
   Label27.Caption := 'vacio';
   Label28.Caption := 'vacio';
   Label29.Caption := 'vacio';
   Label30.Caption := 'vacio';
   LoadFiles;
end;

procedure TfrmReporteGralesSalidas.ibSalirClick(Sender: TObject);
begin
   Close;
end;

end.
