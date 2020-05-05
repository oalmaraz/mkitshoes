unit UfrmElegirCFNCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmCFNCredito = class(TForm)
    buCFI: TBitBtn;
    buCFD: TBitBtn;
    Label1: TLabel;
    qyContinuacion: TIBQuery;
    qyContinuacionR_CONSECUTIVO: TIntegerField;
    qyContinuacionR_ID: TIntegerField;
    qyContinuacionR_FACTURA: TIntegerField;
    qyContinuacionR_CUANTAS: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure buCFIClick(Sender: TObject);
    procedure buCFDClick(Sender: TObject);
  private
    { Private declarations }
    awrCF          : integer;
    awrMedidas     : boolean;
    awrID          : integer;
    awrEstatus     : string;
    awrSinIVA      : boolean;
    awrBtnCancelar : boolean;
    awrEnlazadas   : boolean;
    awrXML         : string;
    
    procedure impresionCFI;
    procedure impresionCFD;
    procedure previewCFI;
    procedure previewCFD;
    procedure previewCFD2;
  public
    { Public declarations }
    procedure impresion;
    procedure preview;
    procedure preview2;
  published
     property ID           : integer read awrID write awrID;
     property ESTATUS      : string read awrEstatus write awrEstatus;
     property SIN_IVA      : boolean read awrSinIVA write awrSinIVA;
     property BTN_CANCELAR : boolean read awrBtnCancelar write awrBtnCancelar;
     property ENLAZADAS    : boolean read awrEnlazadas write awrEnlazadas;
     property XML          : string read awrXML write awrXML;
  end;

var
  frmCFNCredito: TfrmCFNCredito;

implementation

uses
  IBData, reglas_de_negocios, PRN_0003_FACTURAR, PRN_0003_FACTURAR_TXT,
  PRN_0015_NC_TXT;

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
Las opciones de visibilidad son las típicas
en estos casos: SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
                SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
                SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
                SW_SHOWNOACTIVATE, SW_SHOWNORMAL
                Si necesitas más información sobre estas opciones
                busca la función ShowWindow en la ayuda del Api de
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

procedure TfrmCFNCredito.Impresion;
begin
   if awrCF = 0 then //Comprobante Fiscal Impreso
   begin
      impresionCFI;
   end
   else
   if awrCF = 1 then //Comprobante Fiscal Digital
   begin
      impresionCFD;
   end
   else
      Self.ShowModal;
end;

procedure TfrmCFNCredito.preview;
begin
   if awrCF = 0 then //Comprobante Fiscal Impreso
   begin
      previewCFI;
   end
   else
   if awrCF = 1 then //Comprobante Fiscal Digital
   begin
      previewCFD;
   end;
end;

procedure TfrmCFNCredito.preview2;
begin
   if awrCF = 0 then //Comprobante Fiscal Impreso
   begin
      previewCFI;
   end
   else
   if awrCF = 1 then //Comprobante Fiscal Digital
   begin
      previewCFD2;
   end;
end;

procedure TfrmCFNCredito.impresionCFI;
var
   enlazadas  : boolean;
   v_imprimir : boolean;
begin
   try
     frmPRN_0015_TXT := TfrmPRN_0015_TXT.CrearA(Application, awrID);
     frmPRN_0015_TXT.imprimir;
   finally
      frmPRN_0015_TXT.Free;
   end;

   Close;
end;

procedure TfrmCFNCredito.impresionCFD;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrNCEAPM.exe';
   if FileExists(arch) then
   begin
      v_args := IntToStr(awrID);
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFNCredito.previewCFI;
var
   v_imprimir : boolean;
begin
   try
     frmPRN_0015_TXT := TfrmPRN_0015_TXT.CrearA(Application, awrID);
     frmPRN_0015_TXT.preview;
   finally
      frmPRN_0015_TXT.Free;
   end;
end;

procedure TfrmCFNCredito.previewCFD;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrPreviewNCE.exe';
   if FileExists(arch) then
   begin
      v_args := awrXML;
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFNCredito.previewCFD2;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrPreviewNCE.exe';
   if FileExists(arch) then
   begin
      v_args := awrXML + ' 2';
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFNCredito.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);

   //CFI = 0, CFD = 1, AMBOS = 2
   dmIBData.TPreferencias.Filter := 'ID = 362';
   awrCF := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

   buCFI.Visible := awrCF = 2;
   buCFD.Visible := awrCF = 2;
end;

procedure TfrmCFNCredito.buCFIClick(Sender: TObject);
begin
   self.Hide;
   impresionCFI;
end;

procedure TfrmCFNCredito.buCFDClick(Sender: TObject);
begin
   self.Hide;
   impresionCFD;
end;

end.
