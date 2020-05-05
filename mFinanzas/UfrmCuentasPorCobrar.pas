unit UfrmCuentasPorCobrar;

interface

uses                           
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UfrmEstadoDeCuentas,   Menus,
  ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db,
  IBX.IBCustomDataSet, IBX.IBStoredProc, jpeg, Grids, DBGrids;

type
  TfrmCuentasPorCobrar = class(TfrmEstadoDeCuentas)
    procedure FormCreate(Sender: TObject);
    procedure dgPartidasESTATUSCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCuentasPorCobrar: TfrmCuentasPorCobrar;

implementation

uses
   UfrmAutorizar;

{$R *.DFM}

procedure TfrmCuentasPorCobrar.FormCreate(Sender: TObject);
begin
  inherited;
  //dgPartidas.IniFileName := ExtractFilePath(ParamStr(0))+'Cuentas por Cobrar.ini';
  //dgPartidas.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'Cuentas por Cobrar.ini');
end;

procedure TfrmCuentasPorCobrar.dgPartidasESTATUSCButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   ejecutar  : boolean;
   autorizar : TfrmAutorizar;
begin
   inherited;
   if MessageDlg('Desea Cancelar',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
   begin
      ejecutar := true;
      if NIVEL < 99 then
      begin
         autorizar := TfrmAutorizar.Crear(Application, 99);
         autorizar.ShowModal;
         ejecutar := autorizar.autorizacion;
         autorizar.Free;
      end;

      if ejecutar then
      begin
         EstadoDeCuentas.Cancelar;
         //por el saldo se vuelve a cargar tambien el encabezado
         //edCliente.OnButtonClick(Sender, 0);
      end;
   end;
end;

end.
