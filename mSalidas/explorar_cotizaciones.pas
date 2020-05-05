unit explorar_cotizaciones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db, ComCtrls, Grids, DBGrids, Buttons,
  Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils,
  dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon, dxPScxPageControlProducer,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxPSCore, dxPScxCommon;

type
  TfrmExplorar_cotizaciones = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_FECHA_VALIDEZ: TDateTimeField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_SEGURO_SUBTOTAL: TFloatField;
    qyExplorarR_SEGURO_IVA: TFloatField;
    qyExplorarseguro: TFloatField;
    qyExplorarsupertotal: TFloatField;
    qyEsVendedor: TIBQuery;
    qyExplorarR_PROYECTO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_VALIDEZ: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1Column1: TcxGridDBColumn;
    qyExplorarR_VENDEDOR: TIntegerField;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    BitBtn1: TBitBtn;
    Panel3: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button1: TButton;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    Panel4: TPanel;
    rgEstatus: TRadioGroup;
    CBNoAutriza: TComboBox;
    BitBtn2: TBitBtn;
    Button2: TButton;
    Button3: TButton;
    ibGuarda_com_cotizacion: TIBQuery;
    Label2: TLabel;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    Button4: TButton;
    procedure FormCreate(Sender: TObject);
    procedure qyExplorarCalcFields(DataSet: TDataSet);
    procedure dgExplorarDBTableView1DblClick(Sender: TObject);
    procedure ibVerClick(Sender: TObject);
    procedure ibExportarXMLClick(Sender: TObject);
    procedure WinExecNoWait32(FileName:String; Visibility : integer);
    procedure Button1Click(Sender: TObject);
    function LeftStr(InValue: String; Len: Integer): String;
    function RightStr(InValue: String; Len: Integer): String;
    procedure BitBtn2Click(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
    procedure Parametros; override;
  public
    { Public declarations }
  end;

var
  frmExplorar_cotizaciones: TfrmExplorar_cotizaciones;

implementation

uses USQLAnaliza, IBData, IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmExplorar_cotizaciones.Parametros;
begin
   sqlExp.setParam(1, reglas.dame_usuario, psCadena);
   sqlExp.setParam(2, reglas.dame_usuario, psCadena);
   sqlExp.setParam(3, reglas.dame_usuario, psCadena);
end;

procedure TfrmExplorar_cotizaciones.BitBtn2Click(Sender: TObject);
begin
  inherited;
  panel4.Visible:=True;
end;

procedure TfrmExplorar_cotizaciones.Button1Click(Sender: TObject);
var
   ruta      : string;
   archivo   : string;
   args      : string;
   Year, Month, Day     : Word;
   Year1, Month1, Day1  : Word;

begin
  SysUtils.DecodeDate(DateTimePicker1.Date, Year, Month, Day);
  SysUtils.DecodeDate(DateTimePicker2.Date, Year1, Month1, Day1);

  panel3.Visible:=False;
//   inherited;
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\estadisticos\';
   archivo := 'ReporteEstadisticos.exe';
   if FileExists(ruta + archivo) then
   begin
      args := ' 1 ' +  RightStr('0' + IntToStr(DAY),2 ) + '-' + RightStr('0' + IntToStr(MONTH),2) + '-' + IntToStr(YEAR) + ' ' + RightStr('0' + IntToStr(DAY1),2) + '-' + RightStr('0' + IntToStr(MONTH1),2) + '-' + IntToStr(YEAR1);
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
       // right('0' + IntToStr(DAY),2 )
   end
   else
      ShowMessage('Falta archivo: '+ruta+archivo);

{   try
      frmFR_0003         := TfrmFR_0003.Create(Application);
      frmFR_0003.ID      := dsFuente.DataSet.FieldByName('ID').AsInteger;
      frmFR_0003.FOLIO   := true;
      frmFR_0003.USUARIO := reglas.dame_usuario;
      if frmFR_0003.Open then
         frmFR_0003.imprimir;
   finally
      frmFR_0003.Free;
   end;}
//    reglas.abrir_IBTabla(TCapturar);


end;

procedure TfrmExplorar_cotizaciones.Button2Click(Sender: TObject);
begin
  inherited;
  ibGuarda_com_cotizacion.Close;
  ibGuarda_com_cotizacion.ParamByName('p_cotizacion').AsInteger      := qyExplorar.FieldByName('r_id').AsInteger;
  if (rgEstatus.ItemIndex = 0 ) then
    begin
      ibGuarda_com_cotizacion.ParamByName('p_estatus').AsString :='Declinado';
      ibGuarda_com_cotizacion.ParamByName('p_causa').AsString :=CBNoAutriza.Text;
    end
  else
    begin
      ibGuarda_com_cotizacion.ParamByName('p_estatus').AsString :='Aceptado';
      ibGuarda_com_cotizacion.ParamByName('p_causa').AsString :=CBNoAutriza.Text;
    end;
  ibGuarda_com_cotizacion.Open;
  ibGuarda_com_cotizacion.Transaction.CommitRetaining;

  panel4.Visible:=False;
end;

procedure TfrmExplorar_cotizaciones.Button3Click(Sender: TObject);
begin
  inherited;
  panel4.Visible:=False;
end;

procedure TfrmExplorar_cotizaciones.Button4Click(Sender: TObject);
begin
  inherited;
  dxComponentPrinter1.Preview();
end;

procedure TfrmExplorar_cotizaciones.dgExplorarDBTableView1DblClick(
  Sender: TObject);
begin
 //  ShowMessage( IntToStr(reglas.dame_usuario) );
 //  ShowMessage( IntToStr(reglas.dameUsuarioNivel) );
 //  ShowMessage( qyExplorar.FieldByName('R_Vendedor').AsString) ;
   if ((reglas.dame_usuario) = qyExplorar.FieldByName('R_Vendedor').AsInteger) or ((reglas.dameUsuarioNivel) > 60) then
     begin
      inherited;
     end;
end;

procedure TfrmExplorar_cotizaciones.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  panel4.Visible:=False;
end;

procedure TfrmExplorar_cotizaciones.FormCreate(Sender: TObject);
var
   awrSeguro : Boolean;
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_cotizaciones';

  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';

  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
  {
  dgExplorarGRANTOTAL.Visible := awrSeguro;
  dgExplorarSEGURO.Visible    := awrSeguro;
   }
{  qyEsVendedor.Close;
  qyEsVendedor.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyEsVendedor.Open;}
  Parametros;
end;

procedure TfrmExplorar_cotizaciones.FormShow(Sender: TObject);
begin
  inherited;
   if ((reglas.dame_usuario) = qyExplorar.FieldByName('R_Vendedor').AsInteger) or ((reglas.dameUsuarioNivel) > 60) then
     begin
       BitBtn2.Visible:=True;
     end
   else
     begin
       BitBtn2.Visible:=False;
     end;
end;

procedure TfrmExplorar_cotizaciones.ibExportarXMLClick(Sender: TObject);
begin
// sdfsfdgd
  panel3.Visible:= true;
end;

procedure TfrmExplorar_cotizaciones.ibVerClick(Sender: TObject);
begin
  inherited;
  TNumericField(qyExplorar.Fields[6]).DisplayFormat:=',0.';
end;

procedure TfrmExplorar_cotizaciones.qyExplorarCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('R_SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('R_SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('R_GRANTOTAL').AsFloat + DataSet.FieldByName('seguro').AsFloat;
end;

procedure TfrmExplorar_cotizaciones.WinExecNoWait32(FileName:String; Visibility : integer);
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

    if ProcessInfo.hProcess <> 0 then
       WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
end;

function TfrmExplorar_cotizaciones.LeftStr(InValue: String; Len: Integer): String;
 begin
   Result := Copy(InValue, 1, Len);
 end;

function TfrmExplorar_cotizaciones.RightStr(InValue: String; Len: Integer): String;
 begin
   Result := Copy(InValue, Length(InValue)-(Len - 1), Len);
 end;

end.
