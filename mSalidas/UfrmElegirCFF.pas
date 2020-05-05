unit UfrmElegirCFF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfrmCFF = class(TForm)
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
    procedure impresionCFISeries;
    procedure preview;
    procedure preview2;
    procedure previewCFISeries;
  published
     property ID           : integer read awrID write awrID;
     property ESTATUS      : string read awrEstatus write awrEstatus;
     property SIN_IVA      : boolean read awrSinIVA write awrSinIVA;
     property BTN_CANCELAR : boolean read awrBtnCancelar write awrBtnCancelar;
     property ENLAZADAS    : boolean read awrEnlazadas write awrEnlazadas;
     property XML          : string read awrXML write awrXML;
  end;

var
  frmCFF: TfrmCFF;

implementation

uses
  IBData, reglas_de_negocios, PRN_0003_FACTURAR, PRN_0003_FACTURAR_TXT;

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

procedure TfrmCFF.Impresion;
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

procedure TfrmCFF.preview;
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

procedure TfrmCFF.preview2;
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

procedure TfrmCFF.impresionCFI;
var
   enlazadas  : boolean;
   v_imprimir : boolean;
begin
   if not(awrMedidas) then //Sin Medidas
   begin
      enlazadas := false;

      qyContinuacion.Close;
      qyContinuacion.ParamByName('P_FACTURA').AsInteger := awrID;
      qyContinuacion.Open;

      if not(qyContinuacion.IsEmpty) AND (qyContinuacion.FieldByName('R_CUANTAS').AsInteger > 1) AND (awrEnlazadas) then
      begin
         if MessageDlg('Tiene varias facturas que continuan. � Imprimir todas ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
         begin
           enlazadas := true;
         end
         else
         begin
           enlazadas := false;
         end
      end;

      try
         frmPRN_0003_TXT            := TfrmPRN_0003_TXT.Create(Application);
         frmPRN_0003_TXT.BTN_CANCEL := awrBtnCancelar;
         frmPRN_0003_TXT.ESTATUS    := awrEstatus;
         frmPRN_0003_TXT.ID         := awrID;

         if awrSinIVA then
            v_imprimir := frmPRN_0003_TXT.OpenFormatoSinIVA
         else
            v_imprimir := frmPRN_0003_TXT.OpenFormato;

         if v_imprimir then
         begin
            if not(enlazadas) then
            begin
               frmPRN_0003_TXT.imprimir;
            end
            else//Metodo para facturas enlazadas.
            begin
               frmPRN_0003_TXT.BLOQUE := qyContinuacion;
               frmPRN_0003_TXT.imprimirEnlazada;
            end;
         end;
      finally
         frmPRN_0003_TXT.Free;
      end;
   end
   else //Con Medidas
   begin
      try
         frmPRN_0003_TXT            := TfrmPRN_0003_TXT.Create(Application);
         frmPRN_0003_TXT.BTN_CANCEL := awrBtnCancelar;
         frmPRN_0003_TXT.ESTATUS    := 'Medidas';
         frmPRN_0003_TXT.ID         := awrID;
         if frmPRN_0003_TXT.OpenFormatoM then//Medida Normal
            frmPRN_0003_TXT.imprimir;
      finally
         frmPRN_0003_TXT.Free;
      end;
   end;

   Close;
end;

procedure TfrmCFF.impresionCFISeries;
var
   enlazadas : boolean;
begin
   enlazadas := false;

   qyContinuacion.Close;
   qyContinuacion.ParamByName('P_FACTURA').AsInteger := awrID;
   qyContinuacion.Open;

   if not(qyContinuacion.IsEmpty) AND (qyContinuacion.FieldByName('R_CUANTAS').AsInteger > 1) then
   begin
      if MessageDlg('Tiene varias facturas que continuan. � Imprimir todas ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
        enlazadas := true;
      end
      else
      begin
        enlazadas := false;
      end
   end;

   try
      frmPRN_0003_TXT            := TfrmPRN_0003_TXT.Create(Application);
      frmPRN_0003_TXT.BTN_CANCEL := awrBtnCancelar;
      frmPRN_0003_TXT.ESTATUS    := 'SERIES';
      frmPRN_0003_TXT.ID         := awrID;

      if frmPRN_0003_TXT.OpenFormatoSeries then
      begin
         if enlazadas then//Metodo para facturas enlazadas.
         begin
            frmPRN_0003_TXT.BLOQUE := qyContinuacion;
            frmPRN_0003_TXT.imprimirEnlazada;
         end
         else
            frmPRN_0003_TXT.imprimir;
      end;
   finally
      frmPRN_0003_TXT.Free;
   end;
end;

procedure TfrmCFF.impresionCFD;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrFEAPM.exe';
   if FileExists(arch) then
   begin
      v_args := IntToStr(awrID);
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFF.previewCFI;
var
   v_imprimir : boolean;
begin
   if not(awrMedidas) then
   begin
      try
         frmPRN_0003_TXT         := TfrmPRN_0003_TXT.Create(Application);
         frmPRN_0003_TXT.ESTATUS := awrEstatus;
         frmPRN_0003_TXT.ID      := awrID;

         if awrSinIVA then
            v_imprimir := frmPRN_0003_TXT.OpenFormatoSinIVA
         else
            v_imprimir := frmPRN_0003_TXT.OpenFormato;

         if v_imprimir then
            frmPRN_0003_TXT.preview;
      finally
         frmPRN_0003_TXT.Free;
      end;
   end
   else
   begin
      try
         frmPRN_0003_TXT         := TfrmPRN_0003_TXT.Create(Application);
         frmPRN_0003_TXT.ESTATUS := 'Medidas';
         frmPRN_0003_TXT.ID      := awrID;
         if frmPRN_0003_TXT.OpenFormatoM then
            frmPRN_0003_TXT.preview;
      finally
         frmPRN_0003_TXT.Free;
      end;
   end;
end;

procedure TfrmCFF.previewCFISeries;
begin
   try
      frmPRN_0003_TXT         := TfrmPRN_0003_TXT.Create(Application);
      frmPRN_0003_TXT.ESTATUS := 'SERIES';
      frmPRN_0003_TXT.ID      := awrID;
      if frmPRN_0003_TXT.OpenFormatoSeries then
         frmPRN_0003_TXT.preview;
   finally
      frmPRN_0003_TXT.Free;
   end;
end;

procedure TfrmCFF.previewCFD;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrViewXMLCFD.exe';
   if FileExists(arch) then
   begin
      v_args := awrXML;
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFF.previewCFD2;
var
   v_ruta    : string;
   v_args    : string;
   arch      : string;
begin
   v_ruta := ExtractFileDir(Application.ExeName) + '\';
   arch   := v_ruta + 'CFD\' + 'awrViewXMLCFD.exe';
   if FileExists(arch) then
   begin
      v_args := awrXML + ' 2';
      WinExecAndWait32(arch + ' ' + v_args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo: '+ arch);
end;

procedure TfrmCFF.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);

   //Activar Medidas
   dmIBData.TPreferencias.Filter := 'ID = 66';
   awrMedidas := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //CFI = 0, CFD = 1, AMBOS = 2
   dmIBData.TPreferencias.Filter := 'ID = 362';
   awrCF := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

   buCFI.Visible := awrCF = 2;
   buCFD.Visible := awrCF = 2;
end;

procedure TfrmCFF.buCFIClick(Sender: TObject);
begin
   self.Hide;
   impresionCFI;
end;

procedure TfrmCFF.buCFDClick(Sender: TObject);
begin
   self.Hide;
   impresionCFD;
end;

end.
