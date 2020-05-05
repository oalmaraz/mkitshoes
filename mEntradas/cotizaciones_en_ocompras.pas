unit cotizaciones_en_ocompras;

interface

uses
  Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, Grids, DBGrids, Buttons, ExtCtrls;

type
  TfrmCotizaciones_en_ocompras = class(TfrmPadre)
    ibActualizar: TBitBtn;
    ibEliminar: TBitBtn;
    dgCotizaciones: TDBGrid;
    qyCotizaciones: TIBQuery;
    dsCotizaciones: TDataSource;
    spELIMINAR_COTIZACION_EN_OC: TIBStoredProc;
    spACTUALIZAR_COTIZACION_EN_OC: TIBStoredProc;
    qyCotizacionesR_COTIZACION: TIntegerField;
    ibSalir: TBitBtn;
    dsOrigen: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure ibEliminarClick(Sender: TObject);
    procedure ibActualizarClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; x, y, altura : integer);
  end;

var
  frmCotizaciones_en_ocompras: TfrmCotizaciones_en_ocompras;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios;

{$R *.DFM}

constructor TfrmCotizaciones_en_ocompras.Crear(AOwner : TComponent; x, y, altura : integer);
begin
   Create(AOwner);
   Top     := y;
   Left    := x;
   height  := altura;
end;

procedure TfrmCotizaciones_en_ocompras.FormShow(Sender: TObject);
begin
  inherited;
//  qyCotizaciones.Close;
//  qyCotizaciones.ParamByName('COMPRA').AsInteger := tag;
  reglas.refresh_IBQuery(qyCotizaciones);
end;

procedure TfrmCotizaciones_en_ocompras.ibEliminarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgCotizaciones.DataSource.DataSet.RecordCount - 1 do
  begin
  {
     if dgCotizaciones.Items[i].Selected then
     begin
        spELIMINAR_COTIZACION_EN_OC.ParamByName('P_COTIZACION').AsInteger := dgCotizaciones.Items[i].Values[0];
        spELIMINAR_COTIZACION_EN_OC.ParamByName('P_OCOMPRA').AsInteger    := Tag;
        spELIMINAR_COTIZACION_EN_OC.ExecProc;
        spELIMINAR_COTIZACION_EN_OC.Transaction.CommitRetaining;
     end;
     }
  end;
  reglas.refresh_IBQuery(qyCotizaciones);
  reglas.abrir_IBTabla(TIBTable(dsOrigen.DataSet));
end;

procedure TfrmCotizaciones_en_ocompras.ibActualizarClick(Sender: TObject);
var
   i : integer;
begin
  inherited;
  for i := 0 to dgCotizaciones.DataSource.DataSet.RecordCount - 1 do
  begin
  {
     if dgCotizaciones.Items[i].Selected then
     begin
        spACTUALIZAR_COTIZACION_EN_OC.ParamByName('P_COTIZACION').AsInteger := dgCotizaciones.Items[i].Values[0];
        spACTUALIZAR_COTIZACION_EN_OC.ParamByName('P_OCOMPRA').AsInteger    := Tag;
        spACTUALIZAR_COTIZACION_EN_OC.ExecProc;
        spACTUALIZAR_COTIZACION_EN_OC.Transaction.CommitRetaining;
     end
     }
  end;
  reglas.refresh_IBQuery(qyCotizaciones);
  reglas.abrir_IBTabla(TIBTable(dsOrigen.DataSet));
end;

procedure TfrmCotizaciones_en_ocompras.ibSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
