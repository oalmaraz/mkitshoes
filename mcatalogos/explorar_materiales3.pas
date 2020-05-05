unit explorar_materiales3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, explorar_materiales, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  IBX.IBStoredProc, Vcl.Menus, IBX.IBCustomDataSet, IBX.IBQuery, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons;

type
  TfrmExplorar_materiales3 = class(TfrmExplorar_materiales)
    procedure FormCreate(Sender: TObject);
    procedure ibVerClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_materiales3: TfrmExplorar_materiales3;

implementation

{$R *.dfm}

procedure TfrmExplorar_materiales3.FormCreate(Sender: TObject);
begin
  inherited;
  clasifacionMaterial := 3;

end;

procedure TfrmExplorar_materiales3.ibVerClick(Sender: TObject);
begin
//  inherited;
  qyExplorar.close;
  qyExplorar.sql.Clear;
  qyExplorar.sql.add(' SELECT M.ID R_ID, M.CLAVE R_CLAVE, M.DESCRIPCION R_DESCRIPCION, M.CANTIDAD_MINIMA R_CANTIDAD_MINIMA, M.CANTIDAD_MAXIMA  R_CANTIDAD_MAXIMA, ');
  qyExplorar.sql.add(' M.PUNTO_DE_REORDEN R_PREORDEN, M.UNIDADES_X_CAJA R_X_CAJA,  M.ESTATUS R_ST, M.COSTO_ULT_COMPRA R_COSTO, M.CODIGO_BARRAS R_CB, M.ESPRODUCTO R_ESPRODUCTO,  ');
  qyExplorar.sql.add(' M.SUJETO_A_MEDIDA R_SUJETO_A_MED , M.AFECTA_INVENTARIO R_AFECTA_INVENTARIO, M.POS_DESC_CORTA R_POS_CORTA, ');
  qyExplorar.sql.add(' M.POS_ES_CATEGORIA R_ES_CATEGORIA, M.POS_ES_MODIFICADOR R_ES_MODIFICADOR, M.POS_NIVEL R_POS_NIVEL,  ');
  qyExplorar.sql.add(' M.LARGO R_LARGO, M.ALTO R_ALTO, M.ANCHO R_ANCHO, M.CALIBRE R_CALIBRE,  ');
  qyExplorar.sql.add(' L.DESCRIPCION R_LINEA_D  ');
  qyExplorar.sql.add(' FROM MATERIALES M LEFT JOIN LINEAS L ON M.LINEA = L.ID  ');
  qyExplorar.sql.add(' WHERE M.POS_NIVEL = 3  order by M.DESCRIPCION ');
  qyExplorar.Open;
end;

end.
