unit capturar_zonas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls,    jpeg,
  DBGrids, ImgList, ExtCtrls, Grids, ComCtrls, Buttons, System.ImageList;

type
  TfrmCapturar_zonas = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarDESCRIPCION: TIBStringField;
    deDescripcion: TDBEdit;
    Label2: TLabel;
    ilImagenes: TImageList;
    pcPrecios: TPageControl;
    tsListaDePrecios: TTabSheet;
    dgPartidas: TDBGrid;
    paLP: TPanel;
    fcImager1: TImage;
    buItemF7: TBitBtn;
    paPartidas: TPanel;
    qyPartidas: TIBQuery;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_TARIFA: TFloatField;
    qyPartidasR_T_CLAVE: TIBStringField;
    qyPartidasR_T_NOMBRE: TIBStringField;
    qyPartidasR_ROW: TIntegerField;
    dsPartidas: TDataSource;
    spE_Z_TE: TIBStoredProc;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure TCapturarAfterOpen(DataSet: TDataSet);
    procedure buItemF7Click(Sender: TObject);
    procedure dgPartidasELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_zonas: TfrmCapturar_zonas;

implementation

uses IBModulo, explorar_zonas, reglas_de_negocios, IBData, menu,
  UfrmSeleccionarTEntrega;

{$R *.DFM}

procedure TfrmCapturar_zonas.ibNuevoClick(Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_zonas.ibModificarClick(Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_zonas.TCapturarAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
end;

procedure TfrmCapturar_zonas.buItemF7Click(Sender: TObject);
var
   pnt : TPoint;
begin
  inherited;
  if dsFuente.DataSet.State in [dsInsert, dsEdit] then
     ibGuardar.Click;

  try
     pnt   := dgPartidas.ClientToScreen(Point(0,0));
     pnt.x := frmMenu.Width - 2;
     frmSeleccionarTEntrega              := TfrmSeleccionarTEntrega.Create(Application);
     frmSeleccionarTEntrega.DATABASE     := dmIBModulo.ibSistema;
     frmSeleccionarTEntrega.TRANSACTION  := dmIBModulo.ibSistemaTransaccion;
     frmSeleccionarTEntrega.Y            := pnt;
     frmSeleccionarTEntrega.DATASET      := qyPartidas;
     frmSeleccionarTEntrega.PADRE        := dsFuente.DataSet.FieldByName('ID').AsInteger;
     frmSeleccionarTEntrega.CUALSPROC    := 1;
     frmSeleccionarTEntrega.buTodos.Click;
     frmSeleccionarTEntrega.ShowModal;
  finally
     frmSeleccionarTEntrega.Release;
  end;
end;

procedure TfrmCapturar_zonas.dgPartidasELIMINARButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  if MessageDlg('� Eliminar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spE_Z_TE.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
     spE_Z_TE.ExecProc;
     spE_Z_TE.Transaction.CommitRetaining;
     reglas.refresh_IBQuery(qyPartidas);
  end;
end;

end.
