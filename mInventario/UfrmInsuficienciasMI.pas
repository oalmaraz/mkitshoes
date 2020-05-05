unit UfrmInsuficienciasMI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBModulo, Db, IBX.IBCustomDataSet, IBX.IBQuery, Grids,
  DBGrids, ExtCtrls,   StdCtrls, Buttons;

type
  TfrmInsuficienciasMI = class(TForm)
    dgPartidas: TDBGrid;
    sbHijo: TPanel;
    ibSalir: TBitBtn;
    qyInsuficientes: TIBQuery;
    qyInsuficientesR_MATERIAL: TIntegerField;
    qyInsuficientesR_MATERIAL_CB: TIBStringField;
    qyInsuficientesR_MATERIAL_C: TIBStringField;
    qyInsuficientesR_MATERIAL_D: TIBStringField;
    qyInsuficientesR_CANTIDAD: TFloatField;
    qyInsuficientesR_INVENTARIO: TFloatField;
    qyInsuficientesR_UNIDAD: TIntegerField;
    qyInsuficientesR_ROW: TIntegerField;
    dsInsuficientes: TDataSource;
    qyInsuficientesR_UNIDAD_C: TIBStringField;
    qyInsuficientesR_UNIDAD_D: TIBStringField;
    qyInsuficientesR_MATERIAL_S: TIBStringField;
  private
    { Private declarations }
    procedure setID(valor : integer);
  public
    { Public declarations }
  published
     property ID : integer write setID;
  end;

var
  frmInsuficienciasMI: TfrmInsuficienciasMI;

implementation

{$R *.DFM}

procedure TfrmInsuficienciasMI.setID(valor : integer);
begin
   qyInsuficientes.Close;
   qyInsuficientes.ParamByName('P_ID').AsInteger := valor;
   qyInsuficientes.Open;
end;

end.
