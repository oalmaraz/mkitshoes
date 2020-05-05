unit capturar_relacion_botones;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, ibx.IBStoredProc, Db, ibx.IBCustomDataSet, ibx.IBTable,
  DBCtrls, StdCtrls, Mask,    jpeg,
  ExtCtrls,
    ibx.IBQuery, ImgList, Buttons, ComCtrls, System.ImageList;

type
  TfrmCapturar_relacion_botones = class(TfrmCapturarMDI)
    Label1: TLabel;
    Label2: TLabel;
    leBotones: TDBLookupComboBox;
    TFormas: TIBTable;
    TBotones: TIBTable;
    dsFormas: TDataSource;
    dsBotones: TDataSource;
    TCapturarID: TIntegerField;
    TCapturarFORMA_: TIntegerField;
    TCapturarBOTON: TIntegerField;
    dtRelacionBotones: TTreeView;
    TArbolFormas: TIBTable;
    dsArbolFormas: TDataSource;
    dsItem: TDataSource;
    TArbolFormasID: TIntegerField;
    TArbolFormasNOMBRE: TIBStringField;
    TFormasID: TIntegerField;
    TFormasNOMBRE: TIBStringField;
    TCapturarnombre_forma: TIBStringField;
    TCapturarnombre_boton: TIBStringField;
    qyItem: TIBQuery;
    qyItemR_ID: TIntegerField;
    qyItemR_FORMA: TIntegerField;
    qyItemR_BOTON: TIntegerField;
    qyItemR_NOMBRE_BOTON: TIBStringField;
    ilArbol: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    {
    procedure dtRelacionBotonesCalcNodeAttributes(
      TreeView: TfcDBCustomTreeView; Node: TfcDBTreeNode);
    }
    procedure ibEliminarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_relacion_botones: TfrmCapturar_relacion_botones;

implementation

uses IBModulo, explorar_relacion_botones, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmCapturar_relacion_botones.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(dmIBData.TFiltroBotones);
  reglas.abrir_IBTabla(TFormas);
  reglas.abrir_IBTabla(TBotones);
  reglas.abrir_IBTabla(TArbolFormas);
  reglas.refresh_IBQuery(qyItem);
end;

procedure TfrmCapturar_relacion_botones.ibNuevoClick(Sender: TObject);
begin
  inherited;
  //leFormas.SetFocus;
end;

procedure TfrmCapturar_relacion_botones.ibModificarClick(Sender: TObject);
begin
  inherited;
  //leFormas.SetFocus;
end;

procedure TfrmCapturar_relacion_botones.ibGuardarClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyItem);
end;

{
procedure TfrmCapturar_relacion_botones.dtRelacionBotonesCalcNodeAttributes(
  TreeView: TfcDBCustomTreeView; Node: TfcDBTreeNode);
begin
  inherited;
  Node.ImageIndex := Node.Level;
end;
}
procedure TfrmCapturar_relacion_botones.ibEliminarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Borrado permanente',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     reglas.refresh_IBQuery(qyItem);
  end;


end;

end.
