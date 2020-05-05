unit capturar_CierreDiario;

interface                           

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,   Db, IBX.IBCustomDataSet,  IBX.IBQuery, StdCtrls,
   IBX.IBStoredProc,  Grids, DBGrids, Buttons, ComCtrls;

type
  TfrmCapturar_CierreDiario = class(TfrmPadre)
    dgModulosFuncion: TDBGrid;
    qyModuloFolios: TIBQuery;
    dsModuloFolios: TDataSource;
    qyModulosFuncion: TIBQuery;
    dsModulosFuncion: TDataSource;
    dgFolios: TDBGrid;
    qyModulosFuncionID: TIntegerField;
    qyModulosFuncionMODULO: TIntegerField;
    qyModulosFuncionDESCRIPCION: TIBStringField;
    qyModulosFuncionINICIALIZACION_DIARIA: TIBStringField;
    Label1: TLabel;
    cbNo: TCheckBox;
    cbSi: TCheckBox;
    spFOLIOS_A_UNO: TIBStoredProc;
    edFecha: TDateTimePicker;
    laFecha: TLabel;
    Bevel1: TBevel;
    qyFecha: TIBQuery;
    spCIERRE_DIARIO: TIBStoredProc;
    buCierre: TBitBtn;
    buIniciar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibNuevoClick(Sender: TObject);
    procedure fcImageBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_CierreDiario: TfrmCapturar_CierreDiario;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_CierreDiario.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyModulosFuncion);
  reglas.refresh_IBQuery(qyModuloFolios);
  reglas.refresh_IBQuery(qyFecha);
  edFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',qyFecha.FieldByName('R_FECHA').AsDatetime));
end;

procedure TfrmCapturar_CierreDiario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmCapturar_CierreDiario.ibNuevoClick(Sender: TObject);
begin
  inherited;
  if cbSi.Checked then
  begin
     spFOLIOS_A_UNO.ParamByName('P_TIPO').AsString := 'Si';
     spFOLIOS_A_UNO.ExecProc;
     spFOLIOS_A_UNO.Transaction.CommitRetaining;
  end;
  if cbNo.Checked then
  begin
     spFOLIOS_A_UNO.ParamByName('P_TIPO').AsString := 'No';
     spFOLIOS_A_UNO.ExecProc;
     spFOLIOS_A_UNO.Transaction.CommitRetaining;
  end;
  reglas.refresh_IBQuery(qyModuloFolios);
end;

procedure TfrmCapturar_CierreDiario.fcImageBtn1Click(Sender: TObject);
begin
  inherited;
  if edFecha.Focused then
  begin
     cbSi.SetFocus;
     edFecha.SetFocus;
  end;
  if MessageDlg('Verifique que la fecha de cierre es la correcta, si es asi: oprimir boton aceptar, en caso contrario: oprimir boton cancelar y cambie la fecha.', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spCIERRE_DIARIO.ParamByName('P_FECHA').AsDate := edFecha.Date;
     spCIERRE_DIARIO.ExecProc;
     spCIERRE_DIARIO.Transaction.CommitRetaining;
     ShowMessage('Cierre terminado.');
  end;
end;

end.
