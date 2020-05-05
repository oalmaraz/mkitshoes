unit UfrmChequesR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
       StdCtrls,
  ExtCtrls, CheckLst, IBModulo, Db, IBX.IBCustomDataSet, IBX.IBQuery,
       IBX.IBStoredProc, Buttons,
  Grids, DBGrids;

type
  TfrmChequesR = class(TForm)
    paBotones: TPanel;
    Label15: TLabel;
    buSalir: TBitBtn;
    edCliente: TEdit;
    qyCheques: TIBQuery;
    dgSeleccionados: TDBGrid;
    paSeleccion: TPanel;
    buQuitar: TBitBtn;
    buSeleccion: TBitBtn;
    dgCheques: TDBGrid;
    dsCheques: TDataSource;
    qySeleccionados: TIBQuery;
    dsSeleccionados: TDataSource;
    spADD_CXC_CHEQUES: TIBStoredProc;
    qyChequesR_ID: TIntegerField;
    qyChequesR_REFERENCIA: TIBStringField;
    qyChequesR_FECHA_APLICACION: TDateTimeField;
    qyChequesR_MONTO: TFloatField;
    qySeleccionadosR_ID: TIntegerField;
    qySeleccionadosR_REFERENCIA: TIBStringField;
    qySeleccionadosR_FECHA_APLICACION: TDateTimeField;
    qySeleccionadosR_MONTO: TFloatField;
    spDEL_CXC_CHEQUES: TIBStoredProc;
    procedure buSalirClick(Sender: TObject);
    procedure buSeleccionClick(Sender: TObject);
    procedure buQuitarClick(Sender: TObject);
  private
    { Private declarations }
    awrPago : integer;
    procedure setCliente(valor : integer);
    procedure setClienteN(valor : string);
    procedure setPago(valor : integer);
  public
    { Public declarations }
  published
     property Cliente  : integer write setCliente;
     property ClienteN : string write setClienteN;
     property PAGO     : integer read awrPago write setPago;
  end;

var
  frmChequesR: TfrmChequesR;

implementation

uses
  reglas_de_negocios;

{$R *.DFM}

procedure TfrmChequesR.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmChequesR.setPago(valor : integer);
begin
   awrPago := valor;
   dgSeleccionados.Visible := valor <> 0;
   paSeleccion.Visible     := dgSeleccionados.Visible;

   if dgSeleccionados.Visible then
   begin
      qySeleccionados.Close;
      qySeleccionados.ParamByName('P_ID').AsInteger := valor;
      qySeleccionados.Open;
   end;
end;

procedure TfrmChequesR.setCliente(valor : integer);
begin
   qyCheques.Close;
   qyCheques.ParamByName('P_CLIENTE').AsInteger := valor;
   qyCheques.Open;
end;

procedure TfrmChequesR.setClienteN(valor : string);
begin
   edCliente.Text := valor;
end;

procedure TfrmChequesR.buSeleccionClick(Sender: TObject);
var
   i  : integer;
   L  : TList;
   id : string;
begin
   L := nil;
   try
      L := TList.Create;
      {
      for i := 0 to dgCheques.SelectedCount - 1 do
          L.Add(dgCheques.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
      for i := 0 to (L.Count - 1) do
      begin
         id := TdxTreeListNode(L.Items[i]).Strings[0];
         try
            spADD_CXC_CHEQUES.ParamByName('P_ID').AsInteger    := PAGO;
            spADD_CXC_CHEQUES.ParamByName('P_CHEQUE').AsString := id;
            spADD_CXC_CHEQUES.ExecProc;
            spADD_CXC_CHEQUES.Transaction.CommitRetaining;
         except //No me interesa la excepcion cuando es por el mismo cheque agregado al mismo pago
         end;
      end;
      }
   finally
      L.Free;
   end;
   reglas.refresh_IBQuery(qySeleccionados);
end;

procedure TfrmChequesR.buQuitarClick(Sender: TObject);
var
   i  : integer;
   L  : TList;
   id : string;
begin
   L := nil;
   try
      L := TList.Create;
      {
      for i := 0 to dgSeleccionados.SelectedCount - 1 do
          L.Add(dgSeleccionados.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
      for i := 0 to (L.Count - 1) do
      begin
         id := TdxTreeListNode(L.Items[i]).Strings[0];
         spDEL_CXC_CHEQUES.ParamByName('P_ID').AsString := id;
         spDEL_CXC_CHEQUES.ExecProc;
         spDEL_CXC_CHEQUES.Transaction.CommitRetaining;
      end;
      }
   finally
      L.Free;
   end;
   reglas.refresh_IBQuery(qySeleccionados);
end;

end.
