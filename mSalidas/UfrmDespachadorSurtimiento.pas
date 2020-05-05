unit UfrmDespachadorSurtimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, IBX.IBStoredProc, Grids, DBGrids, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, ExtCtrls;

type
  TfrmDespachadorSurtimiento = class(TForm)
    qyDespachadorSurtimiento: TIBQuery;
    dsDespachadorSurtimiento: TDataSource;
    paBotones: TPanel;
    buSalir: TBitBtn;
    qyDespachadorSurtimientoR_PEDIDO: TIntegerField;
    qyDespachadorSurtimientoR_DESPACHADOR: TIntegerField;
    qyDespachadorSurtimientoR_DESPACHADOR_U: TIntegerField;
    qyDespachadorSurtimientoR_DESPACHADOR_U_N: TIBStringField;
    qyDespachadorSurtimientoR_MI: TIntegerField;
    dgPedidos: TDBGrid;
    spP_DESPACHADOR_A_SURTIMIENTO: TIBStoredProc;
    Label1: TLabel;
    laNombre: TLabel;
    qyDespachadorSurtimientoR_ALMACEN: TIntegerField;
    procedure buSalirClick(Sender: TObject);
    procedure dgPedidosImprimirValeButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPedidosLEMPAQUEButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPedidosLISTOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure dgPedidosINVENTARIOButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    awrUsr : integer;
    procedure setID(p_id : integer);
    procedure setNombre(p_nombre : string);
  public
    { Public declarations }
  published
     property ID : integer write setID;
     property USUARIO : integer write awrUsr;
     property NOMBRE  : string write setNombre;
  end;

var
  frmDespachadorSurtimiento: TfrmDespachadorSurtimiento;

implementation

uses
  reglas_de_negocios, PRN_0029_MI, PRN_0027, IBModulo,
  UfrmInsuficienciasSurtimiento;

{$R *.DFM}

procedure TfrmDespachadorSurtimiento.setNombre(p_nombre : string);
begin
   laNombre.Caption := p_nombre;
end;

procedure TfrmDespachadorSurtimiento.setID(p_id : integer);
begin
   qyDespachadorSurtimiento.Close;
   qyDespachadorSurtimiento.ParamByName('P_ID').AsInteger := p_id;
   qyDespachadorSurtimiento.Open;
end;

procedure TfrmDespachadorSurtimiento.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDespachadorSurtimiento.dgPedidosImprimirValeButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   try
      frmPRN_0029           := TfrmPRN_0029.Create(Application);
      frmPRN_0029.ID        := dsDespachadorSurtimiento.DataSet.FieldByName('R_MI').AsInteger;
      frmPRN_0029.DameFolio := false;
      if frmPRN_0029.openFormato then
         frmPRN_0029.imprimir;
   finally
      frmPRN_0029.Release;
   end;
end;

procedure TfrmDespachadorSurtimiento.dgPedidosLEMPAQUEButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   try
      frmPRN_0027 := TfrmPRN_0027.CrearA(Application, dsDespachadorSurtimiento.DataSet.FieldByName('R_PEDIDO').AsInteger, true);
      frmPRN_0027.imprimir;
   finally
      frmPRN_0027.Release;
   end;
end;

procedure TfrmDespachadorSurtimiento.dgPedidosLISTOButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   if (dsDespachadorSurtimiento.DataSet.FieldByName('R_DESPACHADOR_U').AsInteger = awrUsr) then
   begin
      if MessageDlg('�Esta seguro de afectar surtimiento?'+#13+'Antes de Afectar verifique Su Lista de Empaque'+#13, mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
         spP_DESPACHADOR_A_SURTIMIENTO.ParamByName('P_ID').AsInteger := dsDespachadorSurtimiento.DataSet.FieldByName('R_DESPACHADOR').AsInteger;
         spP_DESPACHADOR_A_SURTIMIENTO.ExecProc;
         spP_DESPACHADOR_A_SURTIMIENTO.Transaction.CommitRetaining;

         reglas.refresh_IBQuery(qyDespachadorSurtimiento);
      end
   end
   else
   begin
      ShowMessage('Para poder continuar debe ser el mismo usuario que genero el surtimiento.');
   end;
end;

procedure TfrmDespachadorSurtimiento.FormCreate(Sender: TObject);
begin
   awrUsr := 0;
end;

procedure TfrmDespachadorSurtimiento.dgPedidosINVENTARIOButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  try
     frmInsuficienciasSurtimiento         := TfrmInsuficienciasSurtimiento.Create(Application);
     frmInsuficienciasSurtimiento.ID      := dsDespachadorSurtimiento.DataSet.FieldByName('R_PEDIDO').AsInteger;
     frmInsuficienciasSurtimiento.Almacen := dsDespachadorSurtimiento.DataSet.FieldByName('R_ALMACEN').AsInteger;
     frmInsuficienciasSurtimiento.ShowModal;
  finally
     frmInsuficienciasSurtimiento.Release;
  end;
end;

end.
