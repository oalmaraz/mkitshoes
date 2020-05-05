unit explorar_proveedores;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
      ComCtrls, Grids, DBGrids,
  Buttons, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_proveedores = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_P_CLAVE: TIBStringField;
    qyExplorarR_PROVEEDOR: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_CODIGO_PAIS: TIBStringField;
    qyExplorarR_CODIGO_ESTADO: TIBStringField;
    qyExplorarR_TELEFONO: TIBStringField;
    qyExplorarR_RFC: TIBStringField;
    qyExplorarR_CURP: TIBStringField;
    qyExplorarR_MINIMA: TFloatField;
    qyExplorarR_CALLE: TIBStringField;
    qyExplorarR_ENTRE: TIBStringField;
    qyExplorarR_Y: TIBStringField;
    qyExplorarR_NUM_EXT: TIBStringField;
    qyExplorarR_LETRA: TIBStringField;
    qyExplorarR_NUM_INT: TIBStringField;
    qyExplorarR_COLONIA: TIBStringField;
    qyExplorarR_CP: TIBStringField;
    qyExplorarR_CIUDAD: TIBStringField;
    qyExplorarR_ESTADO: TIBStringField;
    qyExplorarR_PAIS: TIBStringField;
    qyExplorarR_TIPO_NAC: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_AFECTA_CALIDAD: TIBStringField;
    qyExplorarR_CALIFICACION_CALIDAD: TIntegerField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_P_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROVEEDOR: TcxGridDBColumn;
    dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_CODIGO_PAIS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CODIGO_ESTADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn;
    dgExplorarDBTableView1R_RFC: TcxGridDBColumn;
    dgExplorarDBTableView1R_CURP: TcxGridDBColumn;
    dgExplorarDBTableView1R_MINIMA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CALLE: TcxGridDBColumn;
    dgExplorarDBTableView1R_ENTRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_Y: TcxGridDBColumn;
    dgExplorarDBTableView1R_NUM_EXT: TcxGridDBColumn;
    dgExplorarDBTableView1R_LETRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_NUM_INT: TcxGridDBColumn;
    dgExplorarDBTableView1R_COLONIA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CP: TcxGridDBColumn;
    dgExplorarDBTableView1R_CIUDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PAIS: TcxGridDBColumn;
    dgExplorarDBTableView1R_TIPO_NAC: TcxGridDBColumn;
    dgExplorarDBTableView1R_AFECTA_CALIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_CALIFICACION_CALIDAD: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_proveedores: TfrmExplorar_proveedores;

implementation

{$R *.DFM}

procedure TfrmExplorar_proveedores.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma      := 'frmCapturar_proveedores';
end;

end.
