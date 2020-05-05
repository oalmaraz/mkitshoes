unit UfrmRTF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ExtCtrls, ComCtrls, IBModulo,
  Db, IBX.IBCustomDataSet, IBX.IBTable, IBX.IBStoredProc,  Menus, StdCtrls;

type
  TfrmRTF = class(TForm)
    paEditor: TPanel;
    paControles: TPanel;
    dbRTF: TDBRichEdit;
    cbColors: TComboBox;
    cbFonts: TComboBox;
    cbSizes: TComboBox;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    taRTF: TIBTable;
    dsRTF: TDataSource;
    spID: TIBStoredProc;
    Bevel5: TBevel;
    pmTeclas: TPopupMenu;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure buNegritasClick(Sender: TObject);
    procedure buCursivaClick(Sender: TObject);
    procedure buSubrayadoClick(Sender: TObject);
    procedure buF9EditorClick(Sender: TObject);
    procedure buF10EditorClick(Sender: TObject);
  private
    { Private declarations }
    awrID        : integer;
    awrArriba    : string;
    controlFocus : boolean;
    
    procedure verificaNKS;
    procedure setGenerador(valor : string);
    procedure setTableName(valor : string);
    procedure setId(valor : integer);
  public
    { Public declarations }
  published
     property Generador : string write setGenerador;
     property TableName : string write setTableName;
     property Id        : integer write setId;
     property Arriba    : string write awrArriba;
  end;

var
  frmRTF: TfrmRTF;

implementation

{$R *.DFM}

procedure TfrmRTF.setId(valor : integer);
begin
   awrID := valor;
   taRTF.Close;
   taRTF.Open;
   taRTF.Filter := '(LINK = ' + IntToStr(valor)+ ') AND (COLOCAR_ARRIBA = "'+awrArriba+'")';

   if taRTF.IsEmpty then
      taRTF.Append
   else
      begin
         taRTF.Edit;
         //buF11Editor.Enabled := true;
      end;
end;

procedure TfrmRTF.setTableName(valor : string);
begin
   taRTF.TableName := valor;
end;

procedure TfrmRTF.setGenerador(valor : string);
begin
   spID.ParamByName('P_QUIEN').AsString := valor;
end;

procedure TfrmRTF.verificaNKS;
begin
{
   rtfEditor.SelAttributes.Style := [];
   if buNegritas.Down then
      rtfEditor.SelAttributes.Style := [fsBold];
   if buCursiva.Down then
      rtfEditor.SelAttributes.Style := rtfEditor.SelAttributes.Style + [fsItalic];
   if buSubrayado.Down then
      rtfEditor.SelAttributes.Style := rtfEditor.SelAttributes.Style + [fsUnderline];
   rtfEditor.SetFocus;
   }
end;

procedure TfrmRTF.FormCreate(Sender: TObject);
begin
   controlFocus           := false;
end;

procedure TfrmRTF.FormShow(Sender: TObject);
begin
   controlFocus := true;
end;

procedure TfrmRTF.buNegritasClick(Sender: TObject);
begin
   verificaNKS;
end;

procedure TfrmRTF.buCursivaClick(Sender: TObject);
begin
   verificaNKS;
end;

procedure TfrmRTF.buSubrayadoClick(Sender: TObject);
begin
   verificaNKS;
end;

procedure TfrmRTF.buF9EditorClick(Sender: TObject);
begin
   if taRTF.State = dsInsert then
   begin
      spID.ExecProc;
      taRTF.FieldByName('ID').AsInteger            := spID.ParamByName('R_ID').AsInteger;
      taRTF.FieldByName('LINK').AsInteger          := awrID;
      taRTF.FieldByName('TOTAL').AsFloat           := 0;
      taRTF.FieldByName('COLOCAR_ARRIBA').AsString := awrArriba;
   end;
   taRTF.Post;
   taRTF.Transaction.CommitRetaining;
   Close;
end;

procedure TfrmRTF.buF10EditorClick(Sender: TObject);
begin
  taRTF.Cancel;
  taRTF.Transaction.CommitRetaining;
  Close;
end;

end.
