unit UfrmDespachador;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet,   Menus, IBX.IBStoredProc,
  IBX.IBQuery, IBX.IBTable, IBX.IBDatabase, ExtCtrls, ComCtrls, Buttons, StdCtrls,
  Grids, DBGrids;

type
  TfrmDespachador = class(TForm)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    TFiltroPreferencias: TIBTable;
    qyDetalle: TIBQuery;
    qyCorrida: TIBQuery;
    spFECHA_SERVIDOR: TIBStoredProc;
    pmCampos: TPopupMenu;
    itemID: TMenuItem;
    itemFOLIO: TMenuItem;
    itemCLAVE: TMenuItem;
    itemCLIENTE: TMenuItem;
    itemRSOCIAL: TMenuItem;
    paBusqueda: TPanel;
    buBusqueda: TBitBtn;
    edDel: TDateTimePicker;
    edAl: TDateTimePicker;
    buEjecutar: TBitBtn;
    edDato: TEdit;
    dgDetalle: TDBGrid;
    Panel1: TPanel;
    buPartidas: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    edPorcPedido: TEdit;
    edPorcFactura: TEdit;
    buPedido: TBitBtn;
    qyPedido: TIBQuery;
    edDespachador: TEdit;
    Label3: TLabel;
    spADD_DESPACHADOR: TIBStoredProc;
    fcImager2: TImage;
    dgSobrantes: TDBGrid;
    cbPedidos: TCheckBox;
    cbFacturas: TCheckBox;
    spDESPACHADOR_FACTURAS: TIBStoredProc;
    itemExtension: TMenuItem;
    itemExtensionNombre: TMenuItem;
    itemMPS: TMenuItem;
    qyDetalleCorrida: TIBQuery;
    buLimpiarP: TBitBtn;
    buVer: TBitBtn;
    buLimpiarF: TBitBtn;
    dgReporte: TDBGrid;
    qyMPS: TIBQuery;
    dsMPS: TDataSource;
    qyMPSID: TIntegerField;
    qyMPSFOLIO: TIntegerField;
    qyMPSCLAVE: TIBStringField;
    paMPSyPEDIDOS: TPanel;
    Splitter2: TSplitter;
    qyPedidos: TIBQuery;
    dsPedidos: TDataSource;
    paMPS: TPanel;
    Panel3: TPanel;
    dgMPS: TDBGrid;
    paPedidos: TPanel;
    dgPedidosEnc: TDBGrid;
    qyPedidosR_ID: TIntegerField;
    qyPedidosR_PEDIDO: TIntegerField;
    qyPedidosR_PEDIDO_CLAVE: TIBStringField;
    qyPedidosR_CLIENTE: TIBStringField;
    qyPedidosR_CLIENTE_NOMBRE: TIBStringField;
    qyPedidosR_CLIENTE_RSOCIAL: TIBStringField;
    qyPedidosR_EXTENSION: TIBStringField;
    qyPedidosR_EXTENSION_NOMBRE: TIBStringField;
    qyPedidosR_GRANTOTAL: TFloatField;
    qyPedidosR_PRIORIDAD: TIBStringField;
    qyPedidosR_ESTATUS: TIBStringField;
    qyMPSPedidos: TIBQuery;
    qyMPSPedidosR_ID: TIntegerField;
    qyMPSPedidosR_PEDIDO: TIntegerField;
    qyMPSPedidosR_PEDIDO_CLAVE: TIBStringField;
    qyMPSPedidosR_CLIENTE: TIBStringField;
    qyMPSPedidosR_CLIENTE_NOMBRE: TIBStringField;
    qyMPSPedidosR_CLIENTE_RSOCIAL: TIBStringField;
    qyMPSPedidosR_EXTENSION: TIBStringField;
    qyMPSPedidosR_EXTENSION_NOMBRE: TIBStringField;
    qyMPSPedidosR_GRANTOTAL: TFloatField;
    qyMPSPedidosR_PRIORIDAD: TIBStringField;
    qyMPSPedidosR_ESTATUS: TIBStringField;
    dsDetalle: TDataSource;
    dsDetalleCorrida: TDataSource;
    dgDetalleCorrida: TDBGrid;
    itemMPSFolio: TMenuItem;
    Panel6: TPanel;
    Panel5: TPanel;
    qyMedidasEnc: TIBQuery;
    dsMedidasEnc: TDataSource;
    qyDetalleID_DET: TIntegerField;
    qyDetalleMATERIAL: TIntegerField;
    qyDetalleR_MATERIAL: TIBStringField;
    qyDetalleR_MATERIAL_DESCRIPCION: TIBStringField;
    qyDetalleMEDIDA: TIntegerField;
    qyDetalleCOLOR: TIntegerField;
    qyDetalleCANTIDAD: TFloatField;
    qyDetalleCANTIDAD_ENTREGADA: TFloatField;
    qyDetallePENDIENTE: TFloatField;
    qyDetalleESTATUS: TIBStringField;
    qyDetalleR_MEDIDA: TIBStringField;
    qyDetalleR_COLOR: TIBStringField;
    qyDetallePRODUCIDOS: TFloatField;
    qyDetallePRECIO: TFloatField;
    laVista: TLabel;
    rbCorrida: TRadioButton;
    rbNormal: TRadioButton;
    qyDetalleCorridaR_MATERIAL: TIntegerField;
    qyDetalleCorridaR_MATERIAL_CLAVE: TIBStringField;
    qyDetalleCorridaR_MATERIAL_DESCRIPCION: TIBStringField;
    qyDetalleCorridaR_COLOR: TIntegerField;
    qyDetalleCorridaR_COLOR_NOMBRE: TIBStringField;
    qyDetalleCorridaR_ID1: TIntegerField;
    qyDetalleCorridaR_ID2: TIntegerField;
    qyDetalleCorridaR_ID3: TIntegerField;
    qyDetalleCorridaR_ID4: TIntegerField;
    qyDetalleCorridaR_ID5: TIntegerField;
    qyDetalleCorridaR_ID6: TIntegerField;
    qyDetalleCorridaR_ID7: TIntegerField;
    qyDetalleCorridaR_ID8: TIntegerField;
    qyDetalleCorridaR_ID9: TIntegerField;
    qyDetalleCorridaR_ID10: TIntegerField;
    qyDetalleCorridaR_ID11: TIntegerField;
    qyDetalleCorridaR_ID12: TIntegerField;
    qyDetalleCorridaR_ID13: TIntegerField;
    qyDetalleCorridaR_ID14: TIntegerField;
    qyDetalleCorridaR_ID15: TIntegerField;
    qyDetalleCorridaR_C1: TFloatField;
    qyDetalleCorridaR_C2: TFloatField;
    qyDetalleCorridaR_C3: TFloatField;
    qyDetalleCorridaR_C4: TFloatField;
    qyDetalleCorridaR_C5: TFloatField;
    qyDetalleCorridaR_C6: TFloatField;
    qyDetalleCorridaR_C7: TFloatField;
    qyDetalleCorridaR_C8: TFloatField;
    qyDetalleCorridaR_C9: TFloatField;
    qyDetalleCorridaR_C10: TFloatField;
    qyDetalleCorridaR_C11: TFloatField;
    qyDetalleCorridaR_C12: TFloatField;
    qyDetalleCorridaR_C13: TFloatField;
    qyDetalleCorridaR_C14: TFloatField;
    qyDetalleCorridaR_C15: TFloatField;
    qyDetalleCorridaR_PENDIENTE: TFloatField;
    qyDetalleCorridaR_PEDIDA: TFloatField;
    qyDetalleCorridaR_ENTREGADA: TFloatField;
    qyDetalleCorridaR_PRODUCIDA: TFloatField;
    qyDetalleCorridaR_PRECIO: TFloatField;
    qyDetalleCorridaR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyDetalleCorridaR_IDG1: TIntegerField;
    qyDetalleCorridaR_IDG2: TIntegerField;
    qyDetalleCorridaR_IDG3: TIntegerField;
    qyDetalleCorridaR_IDG4: TIntegerField;
    qyDetalleCorridaR_IDG5: TIntegerField;
    qyDetalleCorridaR_IDG6: TIntegerField;
    qyDetalleCorridaR_IDG7: TIntegerField;
    qyDetalleCorridaR_IDG8: TIntegerField;
    qyDetalleCorridaR_IDG9: TIntegerField;
    qyDetalleCorridaR_IDG10: TIntegerField;
    qyDetalleCorridaR_IDG11: TIntegerField;
    qyDetalleCorridaR_IDG12: TIntegerField;
    qyDetalleCorridaR_IDG13: TIntegerField;
    qyDetalleCorridaR_IDG14: TIntegerField;
    qyDetalleCorridaR_IDG15: TIntegerField;
    qyDetalleCorridaR_CG1: TFloatField;
    qyDetalleCorridaR_CG2: TFloatField;
    qyDetalleCorridaR_CG3: TFloatField;
    qyDetalleCorridaR_CG4: TFloatField;
    qyDetalleCorridaR_CG5: TFloatField;
    qyDetalleCorridaR_CG6: TFloatField;
    qyDetalleCorridaR_CG7: TFloatField;
    qyDetalleCorridaR_CG8: TFloatField;
    qyDetalleCorridaR_CG9: TFloatField;
    qyDetalleCorridaR_CG10: TFloatField;
    qyDetalleCorridaR_CG11: TFloatField;
    qyDetalleCorridaR_CG12: TFloatField;
    qyDetalleCorridaR_CG13: TFloatField;
    qyDetalleCorridaR_CG14: TFloatField;
    qyDetalleCorridaR_CG15: TFloatField;
    qyDetalleCorridaR_ENC_CUANTOS: TIntegerField;
    qyEncMedidas: TIBQuery;
    cbCantidad: TCheckBox;
    cbPrecio: TCheckBox;
    dgFacturas: TDBGrid;
    dgPedidos: TDBGrid;
    qyMPSPedidosR_FECHA: TDateTimeField;
    qyPedidosR_FECHA: TDateTimeField;
    qyDetalleCorridaR_GRUPO_MEDIDA: TIntegerField;
    procedure edPorcPedidoChange(Sender: TObject);
    procedure edPorcFacturaChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure itemIDClick(Sender: TObject);
    procedure itemFOLIOClick(Sender: TObject);
    procedure itemCLAVEClick(Sender: TObject);
    procedure itemCLIENTEClick(Sender: TObject);
    procedure itemRSOCIALClick(Sender: TObject);
    procedure itemMATERIALClick(Sender: TObject);
    procedure itemDESCRIPCIONClick(Sender: TObject);
    procedure FECHAPROMESAENTREGA1Click(Sender: TObject);
    procedure FECHAENTREGA1Click(Sender: TObject);
    procedure itemMedidaClick(Sender: TObject);
    procedure itemCOLORClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure buEjecutarClick(Sender: TObject);
    procedure buBusquedaClick(Sender: TObject);
    procedure edDatoKeyPress(Sender: TObject; var Key: Char);
    procedure buPartidasClick(Sender: TObject);
    procedure buPedidoClick(Sender: TObject);
    procedure dgPedidosELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgFacturasELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edDespachadorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure fcImager2DblClick(Sender: TObject);
    procedure cbPedidosChange(Sender: TObject);
    procedure cbFacturasChange(Sender: TObject);
    procedure itemExtensionClick(Sender: TObject);
    procedure itemExtensionNombreClick(Sender: TObject);
    procedure itemMPSClick(Sender: TObject);
    procedure buLimpiarPClick(Sender: TObject);
    procedure buLimpiarFClick(Sender: TObject);
    procedure buVerClick(Sender: TObject);
    procedure pmCamposChange(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure qyMPSAfterOpen(DataSet: TDataSet);
    procedure itemMPSFolioClick(Sender: TObject);
    procedure qyDetalleCorridaAfterOpen(DataSet: TDataSet);
    procedure dsMedidasEncDataChange(Sender: TObject; Field: TField);
    procedure qyPedidosAfterOpen(DataSet: TDataSet);
    procedure rbCorridaClick(Sender: TObject);
    procedure rbNormalClick(Sender: TObject);
    procedure dgReporteBTN_ELIMINARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgReporteBTN_ELIMINAR_PButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgReporteBTN_ELIMINAR_FButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    sqlMPS        : TSqlAnaliza;
    sqlMPSPedidos : TSqlAnaliza;
    sqlPedidos    : TSqlAnaliza;
    sql           : TSqlAnaliza;
    tmpComp       : integer;
    awrUsuario    : integer;
    procedure validarCampos;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure dividirSobrante;
    //procedure BeforePreview(Sender: TObject; AReportLink: TBasedxReportLink);
    procedure BusquedaMPS;
    procedure BusquedaMPSPedidos;
    procedure partidasConsolidadas;

    function getDespachado : integer;
  public
    { Public declarations }
    procedure Open;
  published
     property DATABASE      : TIBDatabase write setDatabase;
     property TRANSACTION   : TIBTransaction write setTransaction;
     property DESPACHADO    : integer read getDespachado;
     property USUARIO       : integer write awrUsuario;
  end;

var
  frmDespachador: TfrmDespachador;

implementation

uses UfrmScript, UfrmCambioPrecio;

{$R *.DFM}

procedure TfrmDespachador.BusquedaMPSPedidos;
var
   i, j   : integer;
   vCampo : string;
   vTipo  : TFieldType;
begin
   sqlMPSPedidos.LoadSemiOriginal;

   vCampo := buBusqueda.Caption;
   vTipo  := sqlMPSPedidos.dameTipoC(vCampo);

   if vTipo in [ftInteger] then
   begin
      j := sqlMPSPedidos.AddParamIndex('P_DATO');
      sqlMPSPedidos.setParam(j, edDato.Text, psCadena);
      sqlMPSPedidos.AddWhereExtra('AND ('+buBusqueda.Caption+' = :P_DATO)');
   end
   else
      begin
         j     := sqlMPSPedidos.AddParamIndex('P_DATO');
         sqlMPSPedidos.setParam(j, '%'+edDato.Text+'%', psCadena);
         sqlMPSPedidos.AddWhereExtra('AND (UPPER('+buBusqueda.Caption+') LIKE :P_DATO)');
      end;
   sqlMPSPedidos.construirExtra;

   qyMPSPedidos.SQL.Clear;
   qyMPSPedidos.SQL.AddStrings(sqlMPSPedidos.strSql);
   for i := 1 to sqlMPSPedidos.indexParam do
   begin
      qyMPSPedidos.ParamByName(sqlMPSPedidos.dameParam(i)).Value := sqlMPSPedidos.dameParamValor(i);
   end;
   qyMPSPedidos.Open;
end;

procedure TfrmDespachador.BusquedaMPS;
var
   i, j : integer;
begin
   sqlMPSPedidos.LoadOriginal;
   qyMPSPedidos.SQL.Clear;
   qyMPSPedidos.SQL.AddStrings(sqlMPSPedidos.strSql);

   sqlMPS.LoadOriginal;
   j := sqlMPS.AddParamIndex('P_MPS');
   sqlMPS.setParam(j, edDato.Text, psCadena);
   sqlMPS.AddWhereExtra('('+buBusqueda.Caption+' = :P_MPS)');
   sqlMPS.construirExtra;

   qyMPS.SQL.Clear;
   qyMPS.SQL.AddStrings(sqlMPS.strSql);
   for i := 1 to sqlMPS.indexParam do
   begin
      qyMPS.ParamByName(sqlMPS.dameParam(i)).Value := sqlMPS.dameParamValor(i);
   end;
   qyMPS.Open;
end;

{
procedure TfrmDespachador.BeforePreview(Sender: TObject; AReportLink: TBasedxReportLink);
begin
   TdxComponentPrinter(Sender).PreviewOptions.WindowState := wsMaximized;
end;
}
function TfrmDespachador.getDespachado : integer;
var
   tmp : integer;
begin
   tmp := 0;
   if edDespachador.Text <> '' then
   begin
      tmp := StrToInt(edDespachador.Text);
   end;

   result := tmp;
end;

procedure TfrmDespachador.Open;
begin
   spFECHA_SERVIDOR.ExecProc;
   edDel.Date := StrToDate(FormatDateTime('dd/mm/yyyy',spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime));
   edAl.Date  := StrToDate(FormatDateTime('dd/mm/yyyy',spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime));

   TFiltroPreferencias.Close;
   TFiltroPreferencias.Open;

   TFiltroPreferencias.Filter := 'ID = 66';
   {
   dgDetalleMEDIDA.Visible    := UpperCase(TFiltroPreferencias.FieldByName('VALOR').AsString) = 'SI';
   dgPedidosMEDIDAS.Visible   := dgDetalleMEDIDA.Visible;
   dgFacturasMEDIDAS.Visible  := dgDetalleMEDIDA.Visible;
   dgDetalleCorrida.Visible   := dgDetalleMEDIDA.Visible;
   dgDetalle.Visible          := not(dgDetalleMEDIDA.Visible);
   rbCorrida.Checked          := dgDetalleMEDIDA.Visible;
   }

   TFiltroPreferencias.Filter    := 'ID = 69';
   {
   dgDetalleCOLOR.Visible        :=(UpperCase(TFiltroPreferencias.FieldByName('VALOR').AsString) = 'SI') and dgDetalleMEDIDA.Visible;
   dgDetalleCorridaCOLOR.Visible := dgDetalleCOLOR.Visible;
   dgPedidosCOLORES.Visible      := dgDetalleCOLOR.Visible;
   dgFacturasCOLORES.Visible     := dgDetalleCOLOR.Visible;
   dgReporteG_COLOR.Visible      := dgDetalleCOLOR.Visible;

   dgDetalle.Align        := alClient;
   dgDetalleCorrida.Align := alClient;
   }
   sqlMPS.Database    := qyMPS.Database;
   sqlMPS.Transaction := qyMPS.Transaction;
   sqlMPS.AddStrings(qyMPS.SQL);

   sqlMPSPedidos.Database    := qyMPSPedidos.Database;
   sqlMPSPedidos.Transaction := qyMPSPedidos.Transaction;
   sqlMPSPedidos.AddStrings(qyMPSPedidos.SQL);

   sqlPedidos.Database    := qyPedidos.Database;
   sqlPedidos.Transaction := qyPedidos.Transaction;
   sqlPedidos.AddStrings(qyPedidos.SQL);
{   sql.DataBase    := qyBusqueda.Database;
   sql.Transaction := qyBusqueda.Transaction;
   sql.AddStrings(qyBusqueda.SQL);}
end;

procedure TfrmDespachador.setDatabase(valor : TIBDatabase);
begin
   qyCorrida.Database     := valor;
   qyPedido.Database      := valor;

   qyMPS.Database            := valor;
   qyMPSPedidos.Database     := valor;
   qyPedidos.Database        := valor;
   qyDetalle.Database        := valor;
   qyDetalleCorrida.Database := valor;
   qyMedidasEnc.Database     := valor;
   qyEncMedidas.Database     := valor;

   spFECHA_SERVIDOR.Database       := valor;
   spADD_DESPACHADOR.Database      := valor;
   spDESPACHADOR_FACTURAS.Database := valor;

   TFiltroPreferencias.Database := valor;
end;

procedure TfrmDespachador.setTransaction(valor : TIBTransaction);
begin
   qyCorrida.Transaction     := valor;
   qyPedido.Transaction      := valor;

   qyMPS.Transaction            := valor;
   qyMPSPedidos.Transaction     := valor;
   qyPedidos.Transaction        := valor;
   qyDetalle.Transaction        := valor;
   qyDetalleCorrida.Transaction := valor;
   qyMedidasEnc.Transaction     := valor;
   qyEncMedidas.Transaction     := valor;

   spFECHA_SERVIDOR.Transaction       := valor;
   spADD_DESPACHADOR.Transaction      := valor;
   spDESPACHADOR_FACTURAS.Transaction := valor;

   TFiltroPreferencias.Transaction := valor;
end;

procedure TfrmDespachador.dividirSobrante;
var
  fPedidos  : Extended;
  fFacturas : Extended;
  ePedidos  : integer;
  eFacturas : integer;
  fFracPed  : Extended;
  fFracFac  : Extended;
//  Node      : TdxTreeListNode;
  //N         : TdxTreeListNode;
  i, j      : integer;
  agregar   : boolean;
  sumar     : Variant;
begin
   {
   fPedidos   := dgSobrantes.Count * edPorcPedido.Value;
   fFacturas  := dgSobrantes.Count * edPorcFactura.Value;
   fPedidos   := fPedidos/100;
   fFacturas  := fFacturas/100;

   fFracPed   := Frac(fPedidos);
   fFracFac   := Frac(fFacturas);

   if cbPedidos.Checked then
   begin
      fPedidos  := fPedidos  + fFracFac;
      fFacturas := fFacturas - fFracFac;
   end
   else
      begin
         fPedidos  := fPedidos  - fFracPed;
         fFacturas := fFacturas + fFracPed;
      end;

   ePedidos  := StrToInt(FormatFloat('0',fPedidos));
   eFacturas := StrToInt(FormatFloat('0',fFacturas));

   for i := 1 to ePedidos do
   begin
      agregar := true;
      Node    := dgSobrantes.FocusedNode;

      dgPedidos.BeginUpdate;
      for j := 0 to dgPedidos.Count - 1 do
      begin
         if dgPedidos.Items[j].Values[1] = Node.Values[1] then
         begin
             sumar := Extended(dgPedidos.Items[j].Values[3]) + Extended(Node.Values[3]);
             dgPedidos.Items[j].Values[3] := sumar;
             agregar := false;
             break;
         end;
      end;
      dgPedidos.EndUpdate;

      if agregar then
      begin
         N           := dgPedidos.Add;
         N.Values[1] := Node.Values[1];
         N.Values[2] := Node.Values[2];
         N.Values[3] := Node.Values[3];
         N.Values[4] := Node.Values[4];
         N.Values[5] := Node.Values[5];
         N.Values[6] := Node.Values[6];
         N.Values[7] := Node.Values[7];
         N.Values[8] := Node.Values[8];
         N.Values[9] := Node.Values[9];
         N.Values[10]:= Node.Values[10];
      end;

      Node.Free;
   end;

   for i := 1 to eFacturas do
   begin
      agregar := true;
      Node    := dgSobrantes.FocusedNode;

      dgFacturas.BeginUpdate;
      for j := 0 to dgFacturas.Count - 1 do
      begin
         if dgFacturas.Items[j].Values[1] = Node.Values[1] then
         begin
            sumar := Extended(dgFacturas.Items[j].Values[3]) + Extended(Node.Values[3]);
            dgFacturas.Items[j].Values[3] := sumar;
            agregar := false;
            break;
         end;
      end;
      dgFacturas.EndUpdate;

      if agregar then
      begin
         N           := dgFacturas.Add;
         N.Values[1] := Node.Values[1];
         N.Values[2] := Node.Values[2];
         N.Values[3] := Node.Values[3];
         N.Values[4] := Node.Values[4];
         N.Values[5] := Node.Values[5];
         N.Values[6] := Node.Values[6];
         N.Values[7] := Node.Values[7];
         N.Values[8] := Node.Values[8];
         N.Values[9] := Node.Values[9];
         N.Values[10]:= Node.Values[10];
      end;

      Node.Free;
   end;
   }
end;

procedure TfrmDespachador.validarCampos;
var
   fechas : boolean;
begin
   fechas := sql.dameTipoC(buBusqueda.Caption) in [ftDate, ftDateTime];

   edDato.Visible := not(fechas);
   edDel.Visible  := fechas;
   edAl.Visible   := fechas;
end;

procedure TfrmDespachador.edPorcPedidoChange(Sender: TObject);
var
  porcentajePedido : double;
begin
   porcentajePedido :=  StrToFloat(edPorcPedido.Text);
   edPorcFactura.Text := FloatToStr(100 - porcentajePedido);
end;

procedure TfrmDespachador.edPorcFacturaChange(Sender: TObject);
var
  porcentajeFactura : double;
begin
   porcentajeFactura :=  StrToFloat(edPorcFactura.Text);
   edPorcPedido.Text :=  FloatToStr(100 - porcentajeFactura);
end;

procedure TfrmDespachador.FormCreate(Sender: TObject);
begin
   sqlMPS        := TSqlAnaliza.Create;
   sqlMPSPedidos := TSqlAnaliza.Create;
   sqlPedidos    := TSqlAnaliza.Create;
   sql           := TSqlAnaliza.Create;

   tmpComp := 0;
   {
   dgMPS.IniFileName := ExtractFilePath(ParamStr(0))+'\DespachadorMPS.ini';
   dgMPS.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\DespachadorMPS.ini');

   dgPedidosEnc.IniFileName := ExtractFilePath(ParamStr(0))+'\DespachadorPedidosEnc.ini';
   dgPedidosEnc.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\DespachadorPedidosEnc.ini');

   dgDetalle.IniFileName := ExtractFilePath(ParamStr(0))+'\DespachadorDetalle.ini';
   dgDetalle.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\DespachadorDetalle.ini');

   dgDetalleCorrida.IniFileName := ExtractFilePath(ParamStr(0))+'\DespachadorCorrida.ini';
   dgDetalleCorrida.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'\DespachadorCorrida.ini');

   dgPedidos.ClearNodes;
   dgFacturas.ClearNodes;
   dgSobrantes.ClearNodes;
   }
end;

procedure TfrmDespachador.itemIDClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.ID';
   validarCampos;
end;

procedure TfrmDespachador.itemFOLIOClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.CONSECUTIVO';
   validarCampos;
end;

procedure TfrmDespachador.itemCLAVEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'P.CLAVE';
   validarCampos;
end;

procedure TfrmDespachador.itemCLIENTEClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.NOMBRE';
   validarCampos;
end;

procedure TfrmDespachador.itemRSOCIALClick(Sender: TObject);
begin
   buBusqueda.Caption := 'S.RAZON_SOCIAL';
   validarCampos;
end;

procedure TfrmDespachador.itemMATERIALClick(Sender: TObject);
begin
   buBusqueda.Caption := 'M.CLAVE';
   validarCampos;
end;

procedure TfrmDespachador.itemDESCRIPCIONClick(Sender: TObject);
begin
   buBusqueda.Caption := 'M.DESCRIPCION';
   validarCampos;
end;

procedure TfrmDespachador.FECHAPROMESAENTREGA1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'PD.F_PROM_ENT';
   validarCampos;
end;

procedure TfrmDespachador.FECHAENTREGA1Click(Sender: TObject);
begin
   buBusqueda.Caption := 'P.FECHA_ENTREGA';
   validarCampos;
end;

procedure TfrmDespachador.itemMedidaClick(Sender: TObject);
begin
   buBusqueda.Caption := 'ME.DESCRIPCION';
   validarCampos;
end;

procedure TfrmDespachador.itemCOLORClick(Sender: TObject);
begin
   buBusqueda.Caption := 'C.NOMBRE';
   validarCampos;
end;

procedure TfrmDespachador.FormDestroy(Sender: TObject);
begin
   sqlMPS.Destroy;
   sqlMPSPedidos.Destroy;
   sqlPedidos.Destroy;
   sql.Destroy;
end;

procedure TfrmDespachador.buEjecutarClick(Sender: TObject);
var
  vCampo     : string;
  i, j       : integer;
  vTipo      : TFieldType;
begin
   if itemMPS.Checked or itemMPSFolio.Checked then
   begin
      if (buBusqueda.Caption = 'MPS.ID') or (buBusqueda.Caption = 'MPS.FOLIO') then
         BusquedaMPS
      else
         BusquedaMPSPedidos;
   end
   else
   begin
      sqlPedidos.LoadOriginal;

      vCampo := buBusqueda.Caption;
      vTipo  := sqlPedidos.dameTipoC(vCampo);

      if vTipo in [ftInteger] then
      begin
         j := sqlPedidos.AddParamIndex('P_DATO');
         sqlPedidos.setParam(j, edDato.Text, psCadena);
         sqlPedidos.AddWhereExtra('AND ('+vCampo+' = :P_DATO)');
      end
      else
         begin
            j := sqlPedidos.AddParamIndex('P_DATO');
            sqlPedidos.setParam(j, '%'+edDato.Text+'%', psCadena);
            sqlPedidos.AddWhereExtra('AND (UPPER('+vCampo+') LIKE :P_DATO)');
         end;
      sqlPedidos.construirExtra;

      qyPedidos.SQL.Clear;
      qyPedidos.SQL.AddStrings(sqlPedidos.strSql);
      for i := 1 to sqlPedidos.indexParam do
      begin
         qyPedidos.ParamByName(sqlPedidos.dameParam(i)).Value := sqlPedidos.dameParamValor(i);
      end;
      qyPedidos.Open;
   end;
   dgPedidosEnc.DataSource.DataSet.First;
end;

procedure TfrmDespachador.buBusquedaClick(Sender: TObject);
begin
  buEjecutar.Click;
end;

procedure TfrmDespachador.edDatoKeyPress(Sender: TObject; var Key: Char);
begin
   if (key = #13) and (edDato.Text <> '') then
      buEjecutar.Click;
end;

procedure TfrmDespachador.buPartidasClick(Sender: TObject);
var
   i,j : integer;
   L : TList;
   id_det    : string;
   id_mat    : string;
   id_color  : string;
   pedido    : string;
   materialC : string;
   materialD : string;
   medida    : string;
   color     : string;
   cantidad  : variant;
   precio    : string;
   tmp       : string;
   fCantidad : double;
   fPedido   : double;
   fFactura  : double;
   fFracPed  : Extended;
   fFracFac  : Extended;
   //grid
   //N : TdxTreeListNode;
   vAcum       : double;
   vCantCapt   : double;
   vCantOrig   : double;
   vPrecioCapt : double;
   romperFor   : boolean;
begin
   {
   if rbNormal.Checked then
   begin
      L := nil;
      try
         L := TList.Create;
         for i := 0 to dgDetalle.SelectedCount - 1 do
             L.Add(dgDetalle.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
         for i := 0 to (L.Count - 1) do
         begin
            vCantCapt := 0;
            if cbCantidad.Checked then
            begin
               idCantidad.Titulo  := TdxTreeListNode(L.Items[i]).Strings[3];
               idCantidad.Entrada := TdxTreeListNode(L.Items[i]).Strings[6];
               idCantidad.Execute;
               if idCantidad.Respuesta and (idCantidad.Entrada <> '') then
               begin
                  vCantCapt := StrToFloat(idCantidad.Entrada);
               end;
            end;

            vPrecioCapt := 0;//cero significa que toma el valor original
            if cbPrecio.Checked then
            begin
               try
                  Application.CreateForm(TfrmCambioPrecio, frmCambioPrecio);
                  frmCambioPrecio.MATERIAL   := TdxTreeListNode(L.Items[i]).Values[1];
                  frmCambioPrecio.MATERIAL_D := TdxTreeListNode(L.Items[i]).Strings[3];
                  frmCambioPrecio.PRECIO     := TdxTreeListNode(L.Items[i]).Values[9];
                  if frmCambioPrecio.ShowModal = mrOk then
                     vPrecioCapt := frmCambioPrecio.NUEVO
               finally
                  frmCambioPrecio.Destroy;
               end;
            end;

            pedido    := dsPedidos.DataSet.FieldByName('R_ID').AsString;

            id_det    := TdxTreeListNode(L.Items[i]).Strings[0];
            id_mat    := TdxTreeListNode(L.Items[i]).Strings[1];
            materialC := TdxTreeListNode(L.Items[i]).Strings[2];
            materialD := TdxTreeListNode(L.Items[i]).Strings[3];
            medida    := TdxTreeListNode(L.Items[i]).Strings[4];
            color     := TdxTreeListNode(L.Items[i]).Strings[5];
            cantidad  := TdxTreeListNode(L.Items[i]).Strings[6];

            if (cantidad = '') then
               cantidad := '0';

            id_color  := TdxTreeListNode(L.Items[i]).Strings[8];
            precio    := FloatToStr(vPrecioCapt);
            fCantidad := cantidad;

            //validacion de cuando capturan cantidad
            if (vCantCapt <> 0) then
            begin
               fCantidad := vCantCapt;
            end;

            fPedido   := fCantidad * edPorcPedido.Value;
            fFactura  := fCantidad * edPorcFactura.Value;
            fPedido   := fPedido/100;
            fFactura  := fFactura/100;

            fFracPed := Frac(fPedido);
            fFracFac := Frac(fFactura);

            fPedido  := fPedido  - fFracPed;
            fFactura := fFactura - fFracFac;

            if (fFracPed + fFracFac) > 0 then
            begin
               N           := dgSobrantes.Add;
               N.Values[1] := id_det;
               N.Values[2] := pedido;
               N.Values[3] := fFracPed + fFracFac;
               N.Values[4] := materialC;
               N.Values[5] := materialD;
               N.Values[6] := medida;
               N.Values[7] := color;
               N.Values[8] := precio;
               N.Values[9] := id_mat;
               N.Values[10]:= id_color;
            end;

            if fPedido <> 0 then
            begin
               N           := dgPedidos.Add;
               N.Values[1] := id_det;
               N.Values[2] := pedido;
               N.Values[3] := fPedido;
               N.Values[4] := materialC;
               N.Values[5] := materialD;
               N.Values[6] := medida;
               N.Values[7] := color;
               N.Values[8] := precio;
               N.Values[9] := id_mat;
               N.Values[10]:= id_color;
            end;

            if fFactura <> 0 then
            begin
               N           := dgFacturas.Add;
               N.Values[1] := id_det;
               N.Values[2] := pedido;
               N.Values[3] := fFactura;
               N.Values[4] := materialC;
               N.Values[5] := materialD;
               N.Values[6] := medida;
               N.Values[7] := color;
               N.Values[8] := precio;
               N.Values[9] := id_mat;
               N.Values[10]:= id_color;
            end;
         end;
      finally
         L.Free;
      end;

      dividirSobrante;
   end
   else
      if rbCorrida.Checked then
      begin
         L := nil;
         try
            L      := TList.Create;
            for i := 0 to dgDetalleCorrida.SelectedCount - 1 do
                L.Add(dgDetalleCorrida.SelectedNodes[i]);//no se hace directamente en el grid por que tiene bug, cuando son 2 registros
            for i := 0 to (L.Count - 1) do
            begin
               vCantOrig := 0;
               vCantCapt := 0;
               if cbCantidad.Checked then
               begin
                  idCantidad.Titulo  := TdxTreeListNode(L.Items[i]).Strings[63];
                  idCantidad.Entrada := TdxTreeListNode(L.Items[i]).Strings[65];
                  idCantidad.Execute;
                  if idCantidad.Respuesta and (idCantidad.Entrada <> '') then
                  begin
                     vCantOrig := StrToFloat(TdxTreeListNode(L.Items[i]).Strings[65]);
                     vCantCapt := StrToFloat(idCantidad.Entrada);
                  end;
               end;

               vPrecioCapt := 0;//cero significa que toma el valor original
               if cbPrecio.Checked then
               begin
                  try
                     Application.CreateForm(TfrmCambioPrecio, frmCambioPrecio);
                     frmCambioPrecio.MATERIAL   := TdxTreeListNode(L.Items[i]).Values[0];
                     frmCambioPrecio.MATERIAL_D := TdxTreeListNode(L.Items[i]).Strings[63];
                     frmCambioPrecio.PRECIO     := TdxTreeListNode(L.Items[i]).Values[69];
                     if frmCambioPrecio.ShowModal = mrOk then
                        vPrecioCapt := frmCambioPrecio.NUEVO
                  finally
                     frmCambioPrecio.Destroy;
                  end;
               end;

               qyEncMedidas.Close;
               qyEncMedidas.ParamByName('P_MATERIAL').AsString := TdxTreeListNode(L.Items[i]).Strings[0];
               qyEncMedidas.Open;

               vAcum     := 0;
               romperFor := false;
               for j := 1 to 30 do //columnas ocultas en el grid para saber cada partida que valor corresponde
               begin
                  tmp := TdxTreeListNode(L.Items[i]).Strings[j];
                  if tmp <> '0' then
                  begin
                     pedido    := dsPedidos.DataSet.FieldByName('R_ID').AsString;

                     id_det    := tmp;
                     id_mat    := TdxTreeListNode(L.Items[i]).Strings[0];
                     id_color  := TdxTreeListNode(L.Items[i]).Strings[61];
                     materialC := TdxTreeListNode(L.Items[i]).Strings[62];
                     materialD := TdxTreeListNode(L.Items[i]).Strings[63];
                     color     := TdxTreeListNode(L.Items[i]).Strings[64];
                     cantidad  := TdxTreeListNode(L.Items[i]).Strings[j + 30];

                     if cantidad = '' then
                        cantidad := '0';

                     if j in [1..15] then
                        medida := qyEncMedidas.FieldByName('R_COL_'+IntToStr(j)+'D').AsString
                     else
                        medida := '';
                     precio    := FloatToStr(vPrecioCapt);

                     fCantidad := cantidad;
                     vAcum     := vAcum + fCantidad;

                     //validacion de cuando capturan cantidad
                     if (vCantCapt <> 0) then
                     begin
                        if (vCantCapt < vCantOrig) and (vAcum >= vCantCapt) then //cuando la cantidad capturada es MENOR que el total de la corrida
                        begin
                           fCantidad := fCantidad - (vAcum - vCantCapt);
                           romperFor := true;
                        end
                        else
                           if (vCantCapt > vCantOrig) and (vAcum = vCantOrig) then //cuando la cantidad capturada es MAYOR que el total de la corrida
                           begin
                              fCantidad := fCantidad + (vCantCapt - vAcum);
                              romperFor := true; //pura formalidad es el ultimo registro :).
                           end;
                     end;

                     fPedido   := fCantidad * edPorcPedido.Value;
                     fFactura  := fCantidad * edPorcFactura.Value;
                     fPedido   := fPedido/100;
                     fFactura  := fFactura/100;

                     fFracPed := Frac(fPedido);
                     fFracFac := Frac(fFactura);

                     fPedido  := fPedido  - fFracPed;
                     fFactura := fFactura - fFracFac;

                     if (fFracPed + fFracFac) > 0 then
                     begin
                        N           := dgSobrantes.Add;
                        N.Values[1] := id_det;
                        N.Values[2] := pedido;
                        N.Values[3] := fFracPed + fFracFac;
                        N.Values[4] := materialC;
                        N.Values[5] := materialD;
                        N.Values[6] := medida;
                        N.Values[7] := color;
                        N.Values[8] := precio;
                        N.Values[9] := id_mat;
                        N.Values[10]:= id_color;
                     end;

                     if fPedido <> 0 then
                     begin
                        N           := dgPedidos.Add;
                        N.Values[1] := id_det;
                        N.Values[2] := pedido;
                        N.Values[3] := fPedido;
                        N.Values[4] := materialC;
                        N.Values[5] := materialD;
                        N.Values[6] := medida;
                        N.Values[7] := color;
                        N.Values[8] := precio;
                        N.Values[9] := id_mat;
                        N.Values[10]:= id_color;
                     end;

                     if fFactura <> 0 then
                     begin
                        N           := dgFacturas.Add;
                        N.Values[1] := id_det;
                        N.Values[2] := pedido;
                        N.Values[3] := fFactura;
                        N.Values[4] := materialC;
                        N.Values[5] := materialD;
                        N.Values[6] := medida;
                        N.Values[7] := color;
                        N.Values[8] := precio;
                        N.Values[9] := id_mat;
                        N.Values[10]:= id_color;
                     end;

                     if romperFor then
                        break;
                  end;
               end;
            end;
         finally
            L.Free;
         end;
         dividirSobrante;
      end;
   partidasConsolidadas;
   }
end;

procedure TfrmDespachador.buPedidoClick(Sender: TObject);
var
   id_det    : string;
   id_mat    : string;
   id_color  : string;
   pedido    : string;
   materialC : string;
   materialD : string;
   medida    : string;
   color     : string;
   cantidad  : string;
   precio    : string;
   fCantidad : double;
   fPedido   : double;
   fFactura  : double;
   fFracPed  : Extended;
   fFracFac  : Extended;
   //grid
   //N : TdxTreeListNode;
begin
   {
   if not(dsPedidos.DataSet.IsEmpty) then
   begin
      qyPedido.Close;
      qyPedido.ParamByName('P_ID').AsInteger := dsPedidos.DataSet.FieldByName('R_ID').AsInteger;
      qyPedido.Open;

      while not(qyPedido.Eof) do
      begin
         id_det    := qyPedido.FieldByName('R_ID').AsString;
         pedido    := qyPedido.FieldByName('R_PEDIDO_CLAVE').AsString;
         materialC := qyPedido.FieldByName('R_MATERIAL_CLAVE').AsString;
         materialD := qyPedido.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
         medida    := qyPedido.FieldByName('R_MEDIDA_DESCRIPCION').AsString;
         color     := qyPedido.FieldByName('R_COLOR_NOMBRE').AsString;
         cantidad  := qyPedido.FieldByName('R_CANTIDAD').AsString;
         id_mat    := qyPedido.FieldByName('R_MATERIAL').AsString;
         id_color  := qyPedido.FieldByName('R_COLOR').AsString;
         precio    := '0';
         fCantidad := qyPedido.FieldByName('R_CANTIDAD').AsFloat;
         fPedido   := fCantidad * edPorcPedido.Value;
         fFactura  := fCantidad * edPorcFactura.Value;
         fPedido   := fPedido/100;
         fFactura  := fFactura/100;

         fFracPed := Frac(fPedido);
         fFracFac := Frac(fFactura);

         fPedido  := fPedido  - fFracPed;
         fFactura := fFactura - fFracFac;

         if (fFracPed + fFracFac) > 0 then
         begin
            N           := dgSobrantes.Add;
            N.Values[1] := id_det;
            N.Values[2] := pedido;
            N.Values[3] := fFracPed + fFracFac;
            N.Values[4] := materialC;
            N.Values[5] := materialD;
            N.Values[6] := medida;
            N.Values[7] := color;
            N.Values[8] := precio;
            N.Values[9] := id_mat;
            N.Values[10]:= id_color;
         end;

         if fPedido <> 0 then
         begin
            N           := dgPedidos.Add;
            N.Values[1] := id_det;
            N.Values[2] := pedido;
            N.Values[3] := fPedido;
            N.Values[4] := materialC;
            N.Values[5] := materialD;
            N.Values[6] := medida;
            N.Values[7] := color;
            N.Values[8] := precio;
            N.Values[9] := id_mat;
            N.Values[10]:= id_color;
         end;

         if fFactura <> 0 then
         begin
            N           := dgFacturas.Add;
            N.Values[1] := id_det;
            N.Values[2] := pedido;
            N.Values[3] := fFactura;
            N.Values[4] := materialC;
            N.Values[5] := materialD;
            N.Values[6] := medida;
            N.Values[7] := color;
            N.Values[8] := precio;
            N.Values[9] := id_mat;
            N.Values[10]:= id_color;
         end;

         qyPedido.Next;
      end;
      
      dividirSobrante;
   end;
   partidasConsolidadas;
   }
end;

procedure TfrmDespachador.dgPedidosELIMINARButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
//var
  // Node : TdxTreeListNode;
begin
  {
   Node := dgPedidos.FocusedNode;
   Node.Free;
   }
end;

procedure TfrmDespachador.dgFacturasELIMINARButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
//var
  // Node : TdxTreeListNode;
begin
{
   Node := dgFacturas.FocusedNode;
   Node.Free;
   }
end;

procedure TfrmDespachador.edDespachadorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   i   : integer;
   tmp : integer;
begin
   case AbsoluteIndex of
     0 : begin
            Close;
         end;
     1 : begin
            if MessageDlg('Ejecutar proceso', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
            begin
               tmp := 0;
               if dgPedidos.Datasource.Dataset.RecordCount > 0 then
               begin
                  {
                  dgPedidos.BeginUpdate;
                  for i := 0 to dgPedidos.Count - 1 do
                  begin
                     spADD_DESPACHADOR.ParamByName('P_DESPACHADOR').AsInteger := tmp;
                     spADD_DESPACHADOR.ParamByName('P_DETALLE').AsInteger     := dgPedidos.Items[i].Values[1];
                     spADD_DESPACHADOR.ParamByName('P_CANTIDAD').AsFloat      := dgPedidos.Items[i].Values[3];
                     spADD_DESPACHADOR.ParamByName('P_PRECIO').AsFloat        := dgPedidos.Items[i].Values[8];
                     spADD_DESPACHADOR.ParamByName('P_USUARIO').AsInteger     := awrUsuario;
                     spADD_DESPACHADOR.ParamByName('P_QUIEN').AsString        := 'P';
                     spADD_DESPACHADOR.ExecProc;
                     spADD_DESPACHADOR.Transaction.CommitRetaining;
                     tmp := spADD_DESPACHADOR.ParamByName('R_DESPACHADOR').AsInteger;
                  end;
                  dgPedidos.EndUpdate;
                  }
               end;
               buLimpiarP.Click;

               if dgFacturas.Datasource.Dataset.RecordCount > 0 then
               begin
                  {
                  dgFacturas.BeginUpdate;
                  for i := 0 to dgFacturas.Count - 1 do
                  begin
                     spADD_DESPACHADOR.ParamByName('P_DESPACHADOR').AsInteger := tmp;
                     spADD_DESPACHADOR.ParamByName('P_DETALLE').AsInteger     := dgFacturas.Items[i].Values[1];
                     spADD_DESPACHADOR.ParamByName('P_CANTIDAD').AsFloat      := dgFacturas.Items[i].Values[3];
                     spADD_DESPACHADOR.ParamByName('P_PRECIO').AsFloat        := dgFacturas.Items[i].Values[8];
                     spADD_DESPACHADOR.ParamByName('P_USUARIO').AsInteger     := awrUsuario;
                     spADD_DESPACHADOR.ParamByName('P_QUIEN').AsString        := 'F';
                     spADD_DESPACHADOR.ExecProc;
                     spADD_DESPACHADOR.Transaction.CommitRetaining;
                     tmp := spADD_DESPACHADOR.ParamByName('R_DESPACHADOR').AsInteger;
                  end;
                  dgFacturas.EndUpdate;
                  }
               end;
               buLimpiarF.Click;

               edDespachador.Text := IntToStr(tmp);

               spDESPACHADOR_FACTURAS.ParamByName('P_ID').AsInteger := tmp;
               spDESPACHADOR_FACTURAS.ExecProc;
               spDESPACHADOR_FACTURAS.Transaction.CommitRetaining;
            end;
         end;
   end;
end;

procedure TfrmDespachador.fcImager2DblClick(Sender: TObject);
begin
  if sqlPedidos <> nil then
  begin
     try
        frmScript := TfrmScript.Create(Application);
        frmScript.AddStrings(sqlPedidos.strSql);
        frmScript.ShowModal;
     finally
        frmScript.Destroy;
     end;
  end;
end;

procedure TfrmDespachador.cbPedidosChange(Sender: TObject);
begin
   cbFacturas.Checked := not(cbPedidos.Checked);
end;

procedure TfrmDespachador.cbFacturasChange(Sender: TObject);
begin
   cbPedidos.Checked := not(cbFacturas.Checked);
end;

procedure TfrmDespachador.itemExtensionClick(Sender: TObject);
begin
   buBusqueda.Caption := 'CE.CLAVE';
   validarCampos;
end;

procedure TfrmDespachador.itemExtensionNombreClick(Sender: TObject);
begin
   buBusqueda.Caption := 'CE.NOMBRE';
   validarCampos;
end;

procedure TfrmDespachador.itemMPSClick(Sender: TObject);
begin
   itemMPS.Checked := not(itemMPS.Checked);
   if itemMPSFolio.Checked and itemMPS.Checked then
      itemMPSFolio.Checked := false;

   paMPS.Visible   := itemMPS.Checked;

   if itemMPS.Checked then
   begin
      buBusqueda.Caption := 'MPS.ID';
      dsPedidos.DataSet  := qyMPSPedidos;
   end
   else
   begin
      buBusqueda.Caption := 'S.NOMBRE';
      dsPedidos.DataSet  := qyPedidos;
   end;
   validarCampos;
end;

procedure TfrmDespachador.buLimpiarPClick(Sender: TObject);
begin
   //dgPedidos.ClearNodes;
   //dgSobrantes.ClearNodes;
   partidasConsolidadas;
end;

procedure TfrmDespachador.buLimpiarFClick(Sender: TObject);
begin
   //dgFacturas.ClearNodes;
   //dgSobrantes.ClearNodes;
   partidasConsolidadas;
end;

procedure TfrmDespachador.partidasConsolidadas;
var
 //  N       : TdxTreeListNode;
   i, j    : integer;
   agregar : boolean;
   sumar   : Variant;
   sumarP  : Variant;
   sumarF  : Variant;
begin
   //dgReporte.ClearNodes;

   //Acumular pedidos por: material, color para reporte
   {
   if dgPedidos.Datasource.Dataset.RecordCount > 0 then
   begin
      for i := 0 to dgPedidos.Datasource.Dataset.RecordCount - 1 do
      begin
         agregar := true;

         for j := 0 to dgReporte.Datasource.Dataset.RecordCount - 1 do
         begin
            if (dgReporte.Items[j].Values[1] = dgPedidos.Items[i].Values[9]) and
               (dgReporte.Items[j].Values[2] = dgPedidos.Items[i].Values[10]) then
            begin
                sumar := Extended(dgReporte.Items[j].Values[6]) + Extended(dgPedidos.Items[i].Values[3]);
                dgReporte.Items[j].Values[6] := sumar;
                agregar := false;
                break;
            end;
         end;
         if agregar then
         begin
            N           := dgReporte.Add;
            N.Values[1] := dgPedidos.Items[i].Values[9];
            N.Values[2] := dgPedidos.Items[i].Values[10];
            N.Values[3] := dgPedidos.Items[i].Values[4];
            N.Values[4] := dgPedidos.Items[i].Values[5];
            N.Values[5] := dgPedidos.Items[i].Values[7];
            N.Values[6] := dgPedidos.Items[i].Values[3];
         end;
      end;
   end;

   //Acumular facturas por: material, color para reporte
   if dgFacturas.Count > 0 then
   begin
      for i := 0 to dgFacturas.Count - 1 do
      begin
         agregar := true;

         for j := 0 to dgReporte.Count - 1 do
         begin
            if (dgReporte.Items[j].Values[1] = dgFacturas.Items[i].Values[9]) and
               (dgReporte.Items[j].Values[2] = dgFacturas.Items[i].Values[10]) then
            begin
               if dgReporte.Items[j].Strings[7] = '' then
                  sumar := Extended(dgFacturas.Items[i].Values[3])
               else
                  sumar := Extended(dgReporte.Items[j].Values[7]) + Extended(dgFacturas.Items[i].Values[3]);
                dgReporte.Items[j].Values[7] := sumar;
                agregar := false;
                break;
            end;
         end;

         if agregar then
         begin
            N           := dgReporte.Add;
            N.Values[1] := dgFacturas.Items[i].Values[9];
            N.Values[2] := dgFacturas.Items[i].Values[10];
            N.Values[3] := dgFacturas.Items[i].Values[4];
            N.Values[4] := dgFacturas.Items[i].Values[5];
            N.Values[5] := dgFacturas.Items[i].Values[7];
            N.Values[7] := dgFacturas.Items[i].Values[3];
         end;
      end;
   end;

   //Totales
   sumarP := 0;
   sumarF := 0;
   for j := 0 to dgReporte.Count - 1 do
   begin
      if dgReporte.Items[j].Strings[6] <> '' then
         sumarP := sumarP + Extended(dgReporte.Items[j].Values[6]);
      if dgReporte.Items[j].Strings[7] <> '' then
         sumarF := sumarF + Extended(dgReporte.Items[j].Values[7]);
   end;

   N           := dgReporte.Add;
   N.Values[4] := 'TOTALES';
   N.Values[6] := sumarP;
   N.Values[7] := sumarF;
   }
end;

procedure TfrmDespachador.buVerClick(Sender: TObject);
//var
   //tmp     : TBasedxReportLink;
   //cpPrint : TdxComponentPrinter;
begin
   //Visualizar
   {
   cpPrint := nil;
   try
      cpPrint := TdxComponentPrinter.Create(Application);
      cpPrint.OnBeforePreview := BeforePreview;
      tmp := cpPrint.AddLink(dgReporte);
      if tmp <> nil then
      begin
         tmp.ReportTitle.Font.Name  := 'Arial';
         tmp.ReportTitle.Font.Size  := 12;
         tmp.ReportTitle.Font.Style := [];

         tmp.PrinterPage.PageHeader.Font.Name := 'Arial';
         tmp.PrinterPage.PageHeader.Font.Size := 14;
         tmp.PrinterPage.PageHeader.CenterTitle.Add('Visualizar reparto');

         tmp.PrinterPage.PageFooter.LeftTitle.Add('Powered by AriesSoftware');
         tmp.PrinterPage.PageFooter.RightTitle.Add('[Date & Time Printed] Pag.[Page #] de [Total Pages]');
         tmp.ShrinkToPageWidth := true;
      end;
      cpPrint.Preview(True, nil);
   finally
      cpPrint.Free;
   end;
   }
end;

procedure TfrmDespachador.pmCamposChange(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
   if Self.Visible then
      if edDato.Visible and edDato.Enabled then
         edDato.SetFocus;
end;

procedure TfrmDespachador.qyMPSAfterOpen(DataSet: TDataSet);
begin
   qyMPSPedidos.Close;
   qyMPSPedidos.Open;
end;

procedure TfrmDespachador.itemMPSFolioClick(Sender: TObject);
begin
   itemMPSFolio.Checked := not(itemMPSFolio.Checked);
   if itemMPSFolio.Checked and itemMPS.Checked then
      itemMPS.Checked := false;

   paMPS.Visible   := itemMPSFolio.Checked;

   if itemMPSFolio.Checked then
   begin
      buBusqueda.Caption := 'MPS.FOLIO';
      dsPedidos.DataSet  := qyMPSPedidos;
   end
   else
   begin
      buBusqueda.Caption := 'S.NOMBRE';
      dsPedidos.DataSet  := qyPedidos;
   end;
   validarCampos;
end;

procedure TfrmDespachador.qyDetalleCorridaAfterOpen(DataSet: TDataSet);
begin
   qyMedidasEnc.Close;
   qyMedidasEnc.Open;
end;

procedure TfrmDespachador.dsMedidasEncDataChange(Sender: TObject;
  Field: TField);
var
   i : integer;
begin
   {
   if tmpComp <> dgDetalleCorrida.DataSource.DataSet.FieldByName('R_GRUPO_MEDIDA').asInteger then
   begin
      tmpComp := dsDetalleCorrida.DataSet.FieldByName('R_GRUPO_MEDIDA').asInteger;
      dgDetalleCorridaC1.Visible  := false;
      dgDetalleCorridaC2.Visible  := false;
      dgDetalleCorridaC3.Visible  := false;
      dgDetalleCorridaC4.Visible  := false;
      dgDetalleCorridaC5.Visible  := false;
      dgDetalleCorridaC6.Visible  := false;
      dgDetalleCorridaC7.Visible  := false;
      dgDetalleCorridaC8.Visible  := false;
      dgDetalleCorridaC9.Visible  := false;
      dgDetalleCorridaC10.Visible := false;
      dgDetalleCorridaC11.Visible := false;
      dgDetalleCorridaC12.Visible := false;
      dgDetalleCorridaC13.Visible := false;
      dgDetalleCorridaC14.Visible := false;
      dgDetalleCorridaC15.Visible := false;

      for i := 1 to dsDetalleCorrida.DataSet.FieldByName('R_ENC_CUANTOS').AsInteger do
      begin
         case i of
           1: begin
                 dgDetalleCorridaC1.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC1.Visible := true;
              end;
           2: begin
                 dgDetalleCorridaC2.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC2.Visible := true;
              end;
           3: begin
                 dgDetalleCorridaC3.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC3.Visible := true;
              end;
           4: begin
                 dgDetalleCorridaC4.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC4.Visible := true;
              end;
           5: begin
                 dgDetalleCorridaC5.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC5.Visible := true;
              end;
           6: begin
                 dgDetalleCorridaC6.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC6.Visible := true;
              end;
           7: begin
                 dgDetalleCorridaC7.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC7.Visible := true;
              end;
           8: begin
                 dgDetalleCorridaC8.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC8.Visible := true;
              end;
           9: begin
                 dgDetalleCorridaC9.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC9.Visible := true;
              end;
          10: begin
                 dgDetalleCorridaC10.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC10.Visible := true;
              end;
          11: begin
                 dgDetalleCorridaC11.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC11.Visible := true;
              end;
          12: begin
                 dgDetalleCorridaC12.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC12.Visible := true;
              end;
          13: begin
                 dgDetalleCorridaC13.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC13.Visible := true;
              end;
          14: begin
                 dgDetalleCorridaC14.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC14.Visible := true;
              end;
          15: begin
                 dgDetalleCorridaC15.Caption := qyMedidasEnc.FieldByName('R_COL_'+IntToStr(i)+'D').AsString;
                 dgDetalleCorridaC15.Visible := true;
              end;
         end;
      end;
   end;
   }
end;

procedure TfrmDespachador.qyPedidosAfterOpen(DataSet: TDataSet);
begin
   if rbCorrida.Checked then
   begin
      qyDetalle.Close;
      qyDetalleCorrida.Close;
      qyDetalleCorrida.Open;
   end
   else
      if rbNormal.Checked then
      begin
         qyDetalleCorrida.Close;
         qyDetalle.Close;
         qyDetalle.Open;
      end;
   dgDetalleCorrida.Visible := rbCorrida.Checked;
   dgDetalle.Visible        := rbNormal.Checked;
end;

procedure TfrmDespachador.rbCorridaClick(Sender: TObject);
begin
   if rbCorrida.Checked then
   begin
      qyDetalle.Close;
      qyDetalleCorrida.Close;
      qyDetalleCorrida.Open;
   end;
   dgDetalleCorrida.Visible := rbCorrida.Checked;
   dgDetalle.Visible        := not(rbCorrida.Checked);
end;

procedure TfrmDespachador.rbNormalClick(Sender: TObject);
begin
   if rbNormal.Checked then
   begin
      qyDetalleCorrida.Close;
      qyDetalle.Close;
      qyDetalle.Open;
   end;
   dgDetalle.Visible        := rbNormal.Checked;
   dgDetalleCorrida.Visible := not(rbNormal.Checked);
end;

procedure TfrmDespachador.dgReporteBTN_ELIMINARButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
  // Node : TdxTreeListNode;
  // N    : TdxTreeListNode;
   vMat : string;
   vCol : string;
   i    : integer;
begin
   {
   if dgReporte.FocusedNode <> nil then
   begin
      Node := dgReporte.FocusedNode;
      vMat := Node.Strings[1];
      vCol := Node.Strings[2];

      //eliminar partidas de los pedidos
      dgSobrantes.ClearNodes;
      if dgPedidos.Count > 0 then
      begin
         for i := 0 to dgPedidos.Count - 1 do
         begin
            if not((vMat = dgPedidos.Items[i].Strings[9]) and (vCol = dgPedidos.Items[i].Strings[10])) then
            begin
               N           := dgSobrantes.Add;
               N.Values[1] := dgPedidos.Items[i].Values[1];
               N.Values[2] := dgPedidos.Items[i].Values[2];
               N.Values[3] := dgPedidos.Items[i].Values[3];
               N.Values[4] := dgPedidos.Items[i].Values[4];
               N.Values[5] := dgPedidos.Items[i].Values[5];
               N.Values[6] := dgPedidos.Items[i].Values[6];
               N.Values[7] := dgPedidos.Items[i].Values[7];
               N.Values[8] := dgPedidos.Items[i].Values[8];
               N.Values[9] := dgPedidos.Items[i].Values[9];
               N.Values[10]:= dgPedidos.Items[i].Values[10];
            end;
         end;
      end;
      dgPedidos.ClearNodes;
      if dgSobrantes.Count > 0 then
      begin
         for i := 0 to dgSobrantes.Count - 1 do
         begin
            N           := dgPedidos.Add;
            N.Values[1] := dgSobrantes.Items[i].Values[1];
            N.Values[2] := dgSobrantes.Items[i].Values[2];
            N.Values[3] := dgSobrantes.Items[i].Values[3];
            N.Values[4] := dgSobrantes.Items[i].Values[4];
            N.Values[5] := dgSobrantes.Items[i].Values[5];
            N.Values[6] := dgSobrantes.Items[i].Values[6];
            N.Values[7] := dgSobrantes.Items[i].Values[7];
            N.Values[8] := dgSobrantes.Items[i].Values[8];
            N.Values[9] := dgSobrantes.Items[i].Values[9];
            N.Values[10]:= dgSobrantes.Items[i].Values[10];
         end;
      end;
      dgSobrantes.ClearNodes;

      //eliminar partidas de las facturas
      dgSobrantes.ClearNodes;
      if dgFacturas.Count > 0 then
      begin
         for i := 0 to dgFacturas.Count - 1 do
         begin
            if not((vMat = dgFacturas.Items[i].Strings[9]) and (vCol = dgFacturas.Items[i].Strings[10])) then
            begin
               N           := dgSobrantes.Add;
               N.Values[1] := dgFacturas.Items[i].Values[1];
               N.Values[2] := dgFacturas.Items[i].Values[2];
               N.Values[3] := dgFacturas.Items[i].Values[3];
               N.Values[4] := dgFacturas.Items[i].Values[4];
               N.Values[5] := dgFacturas.Items[i].Values[5];
               N.Values[6] := dgFacturas.Items[i].Values[6];
               N.Values[7] := dgFacturas.Items[i].Values[7];
               N.Values[8] := dgFacturas.Items[i].Values[8];
               N.Values[9] := dgFacturas.Items[i].Values[9];
               N.Values[10]:= dgFacturas.Items[i].Values[10];
            end;
         end;
      end;
      dgFacturas.ClearNodes;
      if dgSobrantes.Count > 0 then
      begin
         for i := 0 to dgSobrantes.Count - 1 do
         begin
            N           := dgFacturas.Add;
            N.Values[1] := dgSobrantes.Items[i].Values[1];
            N.Values[2] := dgSobrantes.Items[i].Values[2];
            N.Values[3] := dgSobrantes.Items[i].Values[3];
            N.Values[4] := dgSobrantes.Items[i].Values[4];
            N.Values[5] := dgSobrantes.Items[i].Values[5];
            N.Values[6] := dgSobrantes.Items[i].Values[6];
            N.Values[7] := dgSobrantes.Items[i].Values[7];
            N.Values[8] := dgSobrantes.Items[i].Values[8];
            N.Values[9] := dgSobrantes.Items[i].Values[9];
            N.Values[10]:= dgSobrantes.Items[i].Values[10];
         end;
      end;
      dgSobrantes.ClearNodes;

      partidasConsolidadas;
   end;
   }
end;

procedure TfrmDespachador.dgReporteBTN_ELIMINAR_PButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
//   Node : TdxTreeListNode;
  // N    : TdxTreeListNode;
   vMat : string;
   vCol : string;
   i    : integer;
begin
{
   if dgReporte.FocusedNode <> nil then
   begin
      Node := dgReporte.FocusedNode;
      vMat := Node.Strings[1];
      vCol := Node.Strings[2];

      //eliminar partidas de los pedidos
      dgSobrantes.ClearNodes;
      if dgPedidos.Count > 0 then
      begin
         for i := 0 to dgPedidos.Count - 1 do
         begin
            if not((vMat = dgPedidos.Items[i].Strings[9]) and (vCol = dgPedidos.Items[i].Strings[10])) then
            begin
               N           := dgSobrantes.Add;
               N.Values[1] := dgPedidos.Items[i].Values[1];
               N.Values[2] := dgPedidos.Items[i].Values[2];
               N.Values[3] := dgPedidos.Items[i].Values[3];
               N.Values[4] := dgPedidos.Items[i].Values[4];
               N.Values[5] := dgPedidos.Items[i].Values[5];
               N.Values[6] := dgPedidos.Items[i].Values[6];
               N.Values[7] := dgPedidos.Items[i].Values[7];
               N.Values[8] := dgPedidos.Items[i].Values[8];
               N.Values[9] := dgPedidos.Items[i].Values[9];
               N.Values[10]:= dgPedidos.Items[i].Values[10];
            end;
         end;
      end;
      dgPedidos.ClearNodes;
      if dgSobrantes.Count > 0 then
      begin
         for i := 0 to dgSobrantes.Count - 1 do
         begin
            N           := dgPedidos.Add;
            N.Values[1] := dgSobrantes.Items[i].Values[1];
            N.Values[2] := dgSobrantes.Items[i].Values[2];
            N.Values[3] := dgSobrantes.Items[i].Values[3];
            N.Values[4] := dgSobrantes.Items[i].Values[4];
            N.Values[5] := dgSobrantes.Items[i].Values[5];
            N.Values[6] := dgSobrantes.Items[i].Values[6];
            N.Values[7] := dgSobrantes.Items[i].Values[7];
            N.Values[8] := dgSobrantes.Items[i].Values[8];
            N.Values[9] := dgSobrantes.Items[i].Values[9];
            N.Values[10]:= dgSobrantes.Items[i].Values[10];
         end;
      end;
      dgSobrantes.ClearNodes;

      partidasConsolidadas;
   end;
   }
end;

procedure TfrmDespachador.dgReporteBTN_ELIMINAR_FButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
//   Node : TdxTreeListNode;
  // N    : TdxTreeListNode;
   vMat : string;
   vCol : string;
   i    : integer;
begin
{
   if dgReporte.FocusedNode <> nil then
   begin
      Node := dgReporte.FocusedNode;
      vMat := Node.Strings[1];
      vCol := Node.Strings[2];

      //eliminar partidas de las facturas
      dgSobrantes.ClearNodes;
      if dgFacturas.Count > 0 then
      begin
         for i := 0 to dgFacturas.Count - 1 do
         begin
            if not((vMat = dgFacturas.Items[i].Strings[9]) and (vCol = dgFacturas.Items[i].Strings[10])) then
            begin
               N           := dgSobrantes.Add;
               N.Values[1] := dgFacturas.Items[i].Values[1];
               N.Values[2] := dgFacturas.Items[i].Values[2];
               N.Values[3] := dgFacturas.Items[i].Values[3];
               N.Values[4] := dgFacturas.Items[i].Values[4];
               N.Values[5] := dgFacturas.Items[i].Values[5];
               N.Values[6] := dgFacturas.Items[i].Values[6];
               N.Values[7] := dgFacturas.Items[i].Values[7];
               N.Values[8] := dgFacturas.Items[i].Values[8];
               N.Values[9] := dgFacturas.Items[i].Values[9];
               N.Values[10]:= dgFacturas.Items[i].Values[10];
            end;
         end;
      end;
      dgFacturas.ClearNodes;
      if dgSobrantes.Count > 0 then
      begin
         for i := 0 to dgSobrantes.Count - 1 do
         begin
            N           := dgFacturas.Add;
            N.Values[1] := dgSobrantes.Items[i].Values[1];
            N.Values[2] := dgSobrantes.Items[i].Values[2];
            N.Values[3] := dgSobrantes.Items[i].Values[3];
            N.Values[4] := dgSobrantes.Items[i].Values[4];
            N.Values[5] := dgSobrantes.Items[i].Values[5];
            N.Values[6] := dgSobrantes.Items[i].Values[6];
            N.Values[7] := dgSobrantes.Items[i].Values[7];
            N.Values[8] := dgSobrantes.Items[i].Values[8];
            N.Values[9] := dgSobrantes.Items[i].Values[9];
            N.Values[10]:= dgSobrantes.Items[i].Values[10];
         end;
      end;
      dgSobrantes.ClearNodes;

      partidasConsolidadas;
   end;
   }
end;

end.
