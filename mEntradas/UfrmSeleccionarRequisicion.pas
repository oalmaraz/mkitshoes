unit UfrmSeleccionarRequisicion;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, Db, Menus, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase,
    Grids, DBGrids, Buttons, StdCtrls,  ExtCtrls;

type
  TfrmSeleccionarRequisicion = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyBusqueda: TIBQuery;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemCLAVE: TMenuItem;
    itemDEPARTAMENTO: TMenuItem;
    dsBusqueda: TDataSource;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    buEjecutar: TBitBtn;
    edDato: TEdit;
    dgEncabezado: TDBGrid;
    Splitter1: TSplitter;
    qyBusquedaID: TIntegerField;
    qyBusquedaFECHA_ALTA: TDateTimeField;
    qyBusquedaCLAVE: TIBStringField;
    qyBusquedaDESCRIPCION: TIBStringField;
    qyBusquedaPRIORIDAD: TIBStringField;
    qyBusquedaESTATUS: TIBStringField;
    fcImager2: TImage;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_REQUISICION: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    spADD_REQ_REQCOT: TIBStoredProc;
    Panel6: TPanel;
    Panel5: TPanel;
    dgCarrito: TDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    buAdd: TBitBtn;
    buPedido: TBitBtn;
    buPartidas: TBitBtn;
    dgDetalle: TDBGrid;
    qyPedido: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buBusquedaClick(Sender: TObject);
    procedure fcImager2DblClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure qyBusquedaAfterOpen(DataSet: TDataSet);
    procedure itemIDClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemDEPARTAMENTOClick(Sender: TObject);
    procedure buAddClick(Sender: TObject);
    procedure buPartidasClick(Sender: TObject);
    procedure buPedidoClick(Sender: TObject);
    procedure dgCarritoELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
      {
    procedure dgDetalleCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
      }
  private
    { Private declarations }
    sqlReq     : TSqlAnaliza;
    awrRC      : integer;//RC = Requisicion Cotizacion
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
  public
    { Public declarations }
    procedure open;
  published
     property DATABASE    : TIBDatabase write setDatabase;
     property TRANSACTION : TIBTransaction write setTransaction;
     property RC          : integer read awrRC write awrRC;
  end;

var
  frmSeleccionarRequisicion: TfrmSeleccionarRequisicion;

implementation

uses UfrmScript;

{$R *.DFM}

procedure TfrmSeleccionarRequisicion.open;
begin
   sqlReq.Database    := qyBusqueda.Database;
   sqlReq.Transaction := qyBusqueda.Transaction;
   sqlReq.AddStrings(qyBusqueda.SQL);
end;

procedure TfrmSeleccionarRequisicion.setDatabase(valor : TIBDatabase);
begin
   qyBusqueda.Database       := valor;
   qyPartidas.Database       := valor;
   spADD_REQ_REQCOT.Database := valor;
   qyPedido.Database         := valor;
end;

procedure TfrmSeleccionarRequisicion.setTransaction(valor : TIBTransaction);
begin
   qyBusqueda.Transaction       := valor;
   qyPartidas.Transaction       := valor;
   spADD_REQ_REQCOT.Transaction := valor;
   qyPedido.Transaction         := valor;
end;

procedure TfrmSeleccionarRequisicion.FormCreate(Sender: TObject);
begin
   sqlReq := TSqlAnaliza.Create;

  // dgEncabezado.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarRequisicionesEnc.ini';
  // dgEncabezado.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarRequisicionesEnc.ini');

  // dgDetalle.IniFileName := ExtractFilePath(ParamStr(0))+'\SeleccionarRequisicionesDet.ini';
  // dgDetalle.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\SeleccionarRequisicionesDet.ini');

  // dgCarrito.ClearNodes;
end;

procedure TfrmSeleccionarRequisicion.buEjecutarClick(Sender: TObject);
var
  vCampo     : string;
  i, j       : integer;
  vTipo      : TFieldType;
begin
   sqlReq.LoadOriginal;

   vCampo := buBusqueda.Caption;
   vTipo  := sqlReq.dameTipoC(vCampo);

   if vTipo in [ftInteger] then
   begin
      j := sqlReq.AddParamIndex('P_DATO');
      sqlReq.setParam(j, edDato.Text, psCadena);
      sqlReq.AddWhereExtra('('+vCampo+' = :P_DATO)');
   end
   else
      begin
         j := sqlReq.AddParamIndex('P_DATO');
         sqlReq.setParam(j, '%'+edDato.Text+'%', psCadena);
         sqlReq.AddWhereExtra('(UPPER('+vCampo+') LIKE :P_DATO)');
      end;
   sqlReq.construirExtra;

   qyBusqueda.SQL.Clear;
   qyBusqueda.SQL.AddStrings(sqlReq.strSql);
   for i := 1 to sqlReq.indexParam do
   begin
      qyBusqueda.ParamByName(sqlReq.dameParam(i)).Value := sqlReq.dameParamValor(i);
   end;
   qyBusqueda.Open;

   dgEncabezado.DataSource.DataSet.First;
end;

procedure TfrmSeleccionarRequisicion.edDatoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) then
      buEjecutar.Click;
end;

procedure TfrmSeleccionarRequisicion.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
  edDato.Setfocus;
end;

procedure TfrmSeleccionarRequisicion.fcImager2DblClick(Sender: TObject);
begin
  if sqlReq <> nil then
  begin
     try
        frmScript := TfrmScript.Create(Application);
        frmScript.AddStrings(sqlReq.strSql);
        frmScript.ShowModal;
     finally
        frmScript.Destroy;
     end;
  end;
end;

procedure TfrmSeleccionarRequisicion.FormDestroy(Sender: TObject);
begin
   sqlReq.Destroy;
end;

procedure TfrmSeleccionarRequisicion.qyBusquedaAfterOpen(
  DataSet: TDataSet);
begin
   qyPartidas.Close;
   qyPartidas.Open;
end;

procedure TfrmSeleccionarRequisicion.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'R.ID';
end;

procedure TfrmSeleccionarRequisicion.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'R.CLAVE';
end;

procedure TfrmSeleccionarRequisicion.itemDEPARTAMENTOClick(
  Sender: TObject);
begin
   buBusqueda.Caption := 'D.DESCRIPCION';
end;

procedure TfrmSeleccionarRequisicion.buAddClick(Sender: TObject);
var
   i      : integer;
begin
  //partidas agregadas al mps
  if dgCarrito.DataSource.DataSet.RecordCount > 0 then
  begin
     {
     dgCarrito.BeginUpdate;
     for i := 0 to dgCarrito.DataSource.DataSet.RecordCount - 1 do
     begin
        spADD_REQ_REQCOT.ParamByName('P_ID').AsInteger     := awrRC;
        spADD_REQ_REQCOT.ParamByName('P_PARTIDA').AsString := dgCarrito.Items[i].Strings[1];
        spADD_REQ_REQCOT.ExecProc;
        spADD_REQ_REQCOT.Transaction.CommitRetaining;
     end;
     dgCarrito.EndUpdate;
     dgCarrito.ClearNodes;
     }
  end;
{  if DATASET <> nil then
  begin
     DATASET.Close;
     DATASET.Open;
  end;}
  qyPartidas.Close;
  qyPartidas.Open;
end;

procedure TfrmSeleccionarRequisicion.buPartidasClick(Sender: TObject);
var
   i,j : integer;
   L : TList;
   id_det    : string;
   pedido    : string;
   materialC : string;
   materialD : string;
   medida    : string;
   color     : string;
   cantidad  : string;
   tmp       : string;
   estatus   : string;
   //grid
   //N : TdxTreeListNode;
begin
   L := nil;
   try
      L := TList.Create;
      {
      for i := 0 to dgDetalle.SelectedCount - 1 do
          L.Add(dgDetalle.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
      for i := 0 to (L.Count - 1) do
      begin
         estatus := TdxTreeListNode(L.Items[i]).Strings[5];
         if (estatus = 'Sin Afectar') or (estatus = 'En Proceso') then
         begin
            pedido    := dsBusqueda.DataSet.FieldByName('CLAVE').AsString;

            id_det    := TdxTreeListNode(L.Items[i]).Strings[0];
            materialC := TdxTreeListNode(L.Items[i]).Strings[2];
            materialD := TdxTreeListNode(L.Items[i]).Strings[3];
            cantidad  := TdxTreeListNode(L.Items[i]).Strings[4];

            N := dgCarrito.Add;
            N.Values[1] := id_det;
            N.Values[2] := pedido;
            N.Values[3] := materialC;
            N.Values[4] := materialD;
            N.Values[5] := cantidad;
         end;
      end;
      }
   finally
      L.Free;
   end;
end;

procedure TfrmSeleccionarRequisicion.buPedidoClick(Sender: TObject);
var
   id_det    : string;
   pedido    : string;
   materialC : string;
   materialD : string;
   medida    : string;
   color     : string;
   cantidad  : string;
   //grid
  // N : TdxTreeListNode;
begin
   if not(dsBusqueda.DataSet.IsEmpty) then
   begin
      qyPedido.Close;
      qyPedido.ParamByName('P_ID').AsInteger := dsBusqueda.DataSet.FieldByName('ID').AsInteger;
      qyPedido.Open;

      while not(qyPedido.Eof) do
      begin
         id_det    := qyPedido.FieldByName('R_ID').AsString;
         pedido    := qyPedido.FieldByName('R_PEDIDO_CLAVE').AsString;
         materialC := qyPedido.FieldByName('R_MATERIAL_CLAVE').AsString;
         materialD := qyPedido.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
         cantidad  := qyPedido.FieldByName('R_CANTIDAD').AsString;

         {
         N := dgCarrito.Add;
         N.Values[1] := id_det;
         N.Values[2] := pedido;
         N.Values[3] := materialC;
         N.Values[4] := materialD;
         N.Values[5] := cantidad;
          }
         qyPedido.Next;
      end;
   end;
end;

procedure TfrmSeleccionarRequisicion.dgCarritoELIMINARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
//var
  // Node : TdxTreeListNode;
begin
  // Node := dgCarrito.FocusedNode;
  // Node.Free;
end;

{
procedure TfrmSeleccionarRequisicion.dgDetalleCustomDrawCell(
  Sender: TObject; ACanvas: TCanvas; ARect: TRect; ANode: TdxTreeListNode;
  AColumn: TdxTreeListColumn; ASelected, AFocused, ANewItemRow: Boolean;
  var AText: String; var AColor: TColor; AFont: TFont;
  var AAlignment: TAlignment; var ADone: Boolean);
begin
  if ANode.Values[dgDetalleESTATUS.Index] = 'Cancelado' then
  begin
     AColor := clRed;
  end
  else
     if (ANode.Values[dgDetalleESTATUS.Index] = 'Sin Surtir') or
        (ANode.Values[dgDetalleESTATUS.Index] = 'Surtido') or
        (ANode.Values[dgDetalleESTATUS.Index] = 'Parcialmente Surtido') then
     begin
        AColor := $00FDD284;
     end
     else
        begin
           if ASelected then
              AColor := clHighlight
           else
              AColor := clInfoBk;
        end;

  if (AColor = $00FDD284) and (ANode.Values[dgDetalleESTATUS.Index] = 'Surtido') then
  begin
     AFont.Color := clTeal;
     AFont.Style := [fsBold];
  end
  else
     if (AColor = clRed) and (ANode.Values[dgDetalleESTATUS.Index] = 'Cancelado') then
     begin
        AFont.Color := clBlack;
     end
     else
        if (AColor = clInfoBk) and (ANode.Values[dgDetalleESTATUS.Index] = 'En Proceso') then
           AFont.Color := clBlue;
end;
}
end.
