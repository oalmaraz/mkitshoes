unit scripts;

interface


uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ImgList, ToolWin, IBX.IBScript, Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids,
  DBGrids, ExtCtrls, Buttons, System.ImageList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomView, cxClasses, cxGridLevel,
  cxGrid;

type
  TfrmScripts = class(TForm)
    ImageList1: TImageList;
    StatusBar1: TStatusBar;
    ibScript: TIBScript;
    EDITOR: TMemo;
    DataSource1: TDataSource;
    IBDataSet1: TIBDataSet;
    Splitter1: TSplitter;
    dgVista: TcxGrid;
    Label5: TLabel;
    paBotones: TPanel;
    buEjeutar: TBitBtn;
    buSalir: TBitBtn;
    buXLS: TBitBtn;
    dgVistaLevel1: TcxGridLevel;
    dgVistaDBTableView1: TcxGridDBTableView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buEjeutarClick(Sender: TObject);
    procedure buSalirClick(Sender: TObject);
    procedure buXLSClick(Sender: TObject);
  private
    { Private declarations }
    procedure limpiar;
  public
    { Public declarations }
  end;

var
  frmScripts: TfrmScripts;

implementation

uses
  IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TfrmScripts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmScripts.limpiar;
var
   i : integer;
begin
{
   for i := 0 to 99 do
   begin
      dgVista.Columns[i].Caption   := '';
      dgVista.Columns[i].FieldName := '';
      dgVista.Columns[i].Visible   := false;
   end;
   }
end;

procedure TfrmScripts.buEjeutarClick(Sender: TObject);
var
   i      : integer;
   campos : integer;
begin
   ibScript.Script.Clear;
   ibScript.Script.AddStrings(EDITOR.Lines);
   if ibScript.ValidateScript then
   begin
      ibScript.ExecuteScript;

      limpiar;
      if IBDataSet1.Fields.Count > 100 then
          campos := 100
      else
          campos := IBDataSet1.Fields.Count;
          {
      for i := 0 to campos - 1 do
      begin
         dgVista.Columns[i].Caption   := IBDataSet1.Fields[i].FieldName;
         dgVista.Columns[i].FieldName := IBDataSet1.Fields[i].FieldName;
         dgVista.Columns[i].Visible   := true;
      end;
      }
   end
   else
      showmessage('revisar script');
end;

procedure TfrmScripts.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmScripts.buXLSClick(Sender: TObject);
begin
  //reglas.Save('xls', 'Microsoft Excel 4.0 Worksheet (*.xls)|*.xls', 'script.xls', dgVista.SaveToXLS);
end;

end.
