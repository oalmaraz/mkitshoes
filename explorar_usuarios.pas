unit explorar_usuarios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI,    Menus,   Db,
  IBX.IBCustomDataSet, IBX.IBQuery,  StdCtrls,
     Mask, DBCtrls,
     jpeg,  ExtCtrls,
      ComCtrls, Buttons, Grids,
  DBGrids, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_Usuarios = class(TfrmExplorarMDI)
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_BAJA: TcxGridDBColumn;
    dgExplorarDBTableView1R_NIVEL: TcxGridDBColumn;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarCLAVE: TIBStringField;
    qyExplorarTEL_PRINCIPAL: TIBStringField;
    dgExplorarDBTableView1CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1TEL_PRINCIPAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmExplorar_Usuarios: TfrmExplorar_Usuarios;

implementation

{$R *.DFM}

procedure TfrmExplorar_Usuarios.FormCreate(Sender: TObject);
begin
  inherited;
  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA';
  FForma := 'frmCapturar_usuarios';
end;

end.
