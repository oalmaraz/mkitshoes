unit explorar_mensajes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Menus, ComCtrls, Grids, DBGrids, Buttons, Db,
      IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls,
  Mask, DBCtrls, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_mensajes = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_MENSAJE: TBlobField;
    qyExplorarR_EXTRA: TBlobField;
    qyExplorarR_ESPECIFICAR_FECHA: TIBStringField;
    qyExplorarR_EN_FECHA: TDateTimeField;
    qyExplorarR_MODULO: TIBStringField;
    qyExplorarR_MOMENTO: TIBStringField;
    qyExplorarR_PARA: TIBStringField;
    qyExplorarR_QUIEN: TIntegerField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarnombre: TStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_MENSAJE: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTRA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESPECIFICAR_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_EN_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_MODULO: TcxGridDBColumn;
    dgExplorarDBTableView1R_MOMENTO: TcxGridDBColumn;
    dgExplorarDBTableView1R_PARA: TcxGridDBColumn;
    dgExplorarDBTableView1R_QUIEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1nombre: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure qyExplorarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_mensajes: TfrmExplorar_mensajes;

implementation

uses IBData, reglas_de_negocios;

{$R *.DFM}

procedure TfrmExplorar_mensajes.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroUsuarios);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_EN_FECHA';
  FForma      := 'frmCapturar_mensajes';
end;

procedure TfrmExplorar_mensajes.qyExplorarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('nombre').AsString   := '';
  if DataSet.FieldByName('R_PARA').AsString = 'PERSONAL' then
  begin
     if DataSet.FieldByName('R_MODULO').AsString = 'SISTEMA' then
     begin
        dmIBData.TFiltroUsuarios.Filter          := 'ID = ' + DataSet.FieldByName('R_QUIEN').AsString;
        DataSet.FieldByName('nombre').AsString   := 'Usuario: '+dmIBData.TSujetos.FieldByName('NOMBRE').AsString;
     end
     else
     begin
        dmIBData.TFiltroClientes.Filter          := 'ID = ' + DataSet.FieldByName('R_QUIEN').AsString;
        DataSet.FieldByName('nombre').AsString   := 'Cliente: '+dmIBData.TSujetosCliente.FieldByName('NOMBRE').AsString;
     end;
  end;
end;

end.
