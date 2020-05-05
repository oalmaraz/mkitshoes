unit capturar_mis_listas_de_precios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, IBX.IBTable, Db, IBX.IBCustomDataSet, IBX.IBQuery,

    DBCtrls,  StdCtrls, jpeg,
  ExtCtrls,  Buttons, Grids, DBGrids, Mask;

type
  TfrmCapturar_mis_listas_de_precios = class(TForm)
    fpPadre: TPanel;
    imBottom: TBitBtn;
    Label5: TLabel;
    Label1: TLabel;
    edFechaFinal: TEdit;
    cbUsuarios: TDBLookupComboBox;
    qyListasDePrecios: TIBQuery;
    qyListasDePreciosR_ID: TIntegerField;
    qyListasDePreciosR_DESCRIPCION: TIBStringField;
    qyListasDePreciosR_VIGENCIA_DIAS: TIntegerField;
    qyListasDePreciosR_USUARIO: TIntegerField;
    qyListasDePreciosR_ID_DETALLE: TIntegerField;
    qyListasDePreciosR_MATERIAL: TIntegerField;
    qyListasDePreciosR_FECHA: TDateTimeField;
    qyListasDePreciosR_PRECIO_MINIMO: TFloatField;
    qyListasDePreciosR_PRECIO_MAXIMO: TFloatField;
    qyListasDePreciosR_USUARIO_NOMBRE: TIBStringField;
    qyListasDePreciosR_CONCEPTO: TIBStringField;
    qyListasDePreciosR_MATERIAL_DESCRIPCION: TIBStringField;
    dsListasDePrecios: TDataSource;
    dgPrecios: TDBGrid;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibBuscar: TBitBtn;
    ibVigencia: TBitBtn;
    paCaptura: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    Label3: TLabel;
    cePrecio_Minimo: TEdit;
    deFecha: TDBEdit;
    cePrecio_Maximo: TEdit;
    TLista_Precios: TIBTable;
    TLista_PreciosID: TIntegerField;
    TLista_PreciosNOMBRE_LISTA_PRECIO: TIntegerField;
    TLista_PreciosMATERIAL: TIntegerField;
    TLista_PreciosFECHA: TDateTimeField;
    TLista_PreciosPRECIO_MINIMO: TFloatField;
    TLista_PreciosPRECIO_MAXIMO: TFloatField;
    dsLista_Precios: TDataSource;
    ibCopia: TBitBtn;
    deMaterial: TDBEdit;
    qyUsuarios: TIBQuery;
    dsUsuarios: TDataSource;
    qyUsuariosR_ID: TIntegerField;
    qyUsuariosR_NOMBRE: TIBStringField;
    qyUsuariosR_BAJA: TIBStringField;
    edFechaInicial: TEdit;
    Label2: TLabel;
    deVigencia: TDBEdit;
    Label4: TLabel;
    spCOPIAR_VIGENCIA: TIBStoredProc;
    spGENERAR_VIGENCIA: TIBStoredProc;
    ibImprimir: TBitBtn;
    TLista_PreciosUSUARIO: TIntegerField;
    sbLimpiar: TBitBtn;
    Label6: TLabel;
    deGrupo: TDBEdit;
    {
    procedure dgPreciosCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
      ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
      var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
      var ADone: Boolean);
    }
    procedure FormCreate(Sender: TObject);
    procedure ibBuscarClick(Sender: TObject);
    procedure dsListasDePreciosDataChange(Sender: TObject; Field: TField);
    procedure dsLista_PreciosDataChange(Sender: TObject; Field: TField);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibCopiaClick(Sender: TObject);
    procedure ibVigenciaClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure sbLimpiarClick(Sender: TObject);
    procedure cePrecio_MinimoKeyPress(Sender: TObject; var Key: Char);
    procedure cePrecio_MinimoChange(Sender: TObject);
  private
    { Private declarations }
    //procedure BeforePreview(Sender: TObject; AReportLink: TBasedxReportLink);
  public
    { Public declarations }
  end;

var
  frmCapturar_mis_listas_de_precios: TfrmCapturar_mis_listas_de_precios;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

{
procedure TfrmCapturar_mis_listas_de_precios.dgPreciosCustomDrawCell(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; ANode: TdxTreeListNode; AColumn: TdxTreeListColumn;
  ASelected, AFocused, ANewItemRow: Boolean; var AText: String;
  var AColor: TColor; AFont: TFont; var AAlignment: TAlignment;
  var ADone: Boolean);
begin
  if AColumn = dgPreciosUsuario then
  begin
     if ANode.Values[dgPreciosUsuario.Index] = reglas.dameUsuario then
     begin
        AFont.Color := clWhite;
        AColor      := clRed;
        AFont.Style := AFont.Style + [fsBold];
     end
     else
        begin
           AFont.Color := clBlack;
           AColor      := clWhite;
        end;
  end
  else
     begin
        AFont.Style := AFont.Style - [fsBold];
        AFont.Color := clBlack;
        AColor      := clWhite;
     end;

  if AColumn = dgPreciosUsuarios then
     AColor := $00E3DED5;
  if AColumn = dgPreciosGrupos then
     AColor := clYellow;
end;
}
procedure TfrmCapturar_mis_listas_de_precios.FormCreate(Sender: TObject);
begin
{
  cpImpresion.AddLink(dgPrecios);
  cpImpresion.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Add('Listas de Precios');
  cpImpresion.ReportLink[0].PrinterPage.PageHeader.Font.Name  := 'Arial';
  cpImpresion.ReportLink[0].PrinterPage.PageHeader.Font.Size  := 14;
  cpImpresion.CurrentLink := cpImpresion.ReportLink[0];
 }
  reglas.abrir_IBTabla(TLista_Precios);
  reglas.refresh_IBQuery(qyUsuarios);

  edFechaInicial.Text := (FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  edFechaFinal.Text   := (FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  cbUsuarios.KeyValue := reglas.dame_usuario;

  qyListasDePrecios.Close;
  qyListasDePrecios.ParamByName('P_USUARIO').AsInteger      := 0;
  qyListasDePrecios.ParamByName('P_FECHA_INICIAL').AsString := edFechaInicial.Text;
  qyListasDePrecios.ParamByName('P_FECHA_FINAL').AsString   := edFechaFinal.Text;
  qyListasDePrecios.Open;
  
  //dgPrecios.FullExpand;
end;

procedure TfrmCapturar_mis_listas_de_precios.ibBuscarClick(
  Sender: TObject);
var
   usuario : integer;
begin
  if cbUsuarios.Text = '' then
     usuario := 0
  else
     usuario := cbUsuarios.KeyValue;
  qyListasDePrecios.Close;
  qyListasDePrecios.ParamByName('P_USUARIO').AsInteger      := usuario;
  qyListasDePrecios.ParamByName('P_FECHA_INICIAL').AsString := edFechaInicial.Text;
  qyListasDePrecios.ParamByName('P_FECHA_FINAL').AsString   := edFechaFinal.Text;
  qyListasDePrecios.Open;
  //dgPrecios.FullExpand;
  dgPrecios.Datasource.Dataset.First;
end;

procedure TfrmCapturar_mis_listas_de_precios.dsListasDePreciosDataChange(
  Sender: TObject; Field: TField);
begin
//   TLista_Precios.Filter := 'ID = '+ dsListasDePrecios.DataSet.FieldByName('R_ID_DETALLE').AsString;
end;

procedure TfrmCapturar_mis_listas_de_precios.dsLista_PreciosDataChange(
  Sender: TObject; Field: TField);
begin
   if dsLista_Precios.DataSet <> nil then
   begin
      ibModificarPartida.Enabled :=(dsLista_Precios.DataSet.State in [dsBrowse]) and not(dsListasDePrecios.DataSet.IsEmpty) and (dsListasDePrecios.DataSet.FieldByName('R_USUARIO').AsInteger = reglas.dame_usuario);
      ibGuardarPartida.Enabled   := dsLista_Precios.DataSet.State in [dsEdit];
      ibCancelarPartida.Enabled  := dsLista_Precios.DataSet.State in [dsEdit];
      paCaptura.Visible          := dsLista_Precios.DataSet.State in [dsEdit];
      ibVigencia.Enabled         :=(dsLista_Precios.DataSet.State in [dsBrowse]) and not(dsListasDePrecios.DataSet.IsEmpty);
      ibCopia.Enabled            :=(dsLista_Precios.DataSet.State in [dsBrowse]) and not(dsListasDePrecios.DataSet.IsEmpty);
   end;
end;

procedure TfrmCapturar_mis_listas_de_precios.ibModificarPartidaClick(
  Sender: TObject);
begin
   dsLista_Precios.DataSet.Edit;
   cePrecio_Minimo.SetFocus;
end;

procedure TfrmCapturar_mis_listas_de_precios.ibGuardarPartidaClick(
  Sender: TObject);
var
   id_detalle : integer;
   indice     : integer;
begin
   //indice := dgPrecios.TopIndex;
   id_detalle := qyListasDePrecios.FieldByName('R_ID_DETALLE').AsInteger;
   dsLista_Precios.DataSet.Post;
   TLista_Precios.Transaction.CommitRetaining;
   reglas.refresh_IBQuery(qyListasDePrecios);

   {dgPrecios.FullExpand;
   dgPrecios.GotoFirst;
   while not(dgPrecios.IsEOF) do
   begin
      if qyListasDePrecios.FieldByName('R_ID_DETALLE').AsInteger = id_detalle then
      begin
         break;
      end;
      dgPrecios.GotoNext(true);
   end;
   dgPrecios.TopIndex := indice;
   }
end;

procedure TfrmCapturar_mis_listas_de_precios.ibCancelarPartidaClick(
  Sender: TObject);
begin
   dsLista_Precios.DataSet.Cancel;
end;

procedure TfrmCapturar_mis_listas_de_precios.ibCopiaClick(Sender: TObject);
begin
  if edFechaFinal.Text <> '' then
  begin
     spCOPIAR_VIGENCIA.ParamByName('P_PADRE').AsInteger  := dsListasDePrecios.DataSet.FieldByName('R_ID').AsInteger;
     spCOPIAR_VIGENCIA.ParamByName('P_FECHA').AsString   := edFechaFinal.Text;
     spCOPIAR_VIGENCIA.ExecProc;
     spCOPIAR_VIGENCIA.Transaction.CommitRetaining;
     edFechaInicial.Text := (FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
     edFechaFinal.Text   := (FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
     ibBuscar.Click;
  end;
end;

procedure TfrmCapturar_mis_listas_de_precios.ibVigenciaClick(
  Sender: TObject);
begin
   spGENERAR_VIGENCIA.ParamByName('P_PADRE').AsInteger  := dsListasDePrecios.DataSet.FieldByName('R_ID').AsInteger;
   spGENERAR_VIGENCIA.ParamByName('P_FECHA').AsString   := edFechaFinal.Text;
   spGENERAR_VIGENCIA.ParamByName('P_DIAS').AsInteger   := dsListasDePrecios.DataSet.FieldByName('R_VIGENCIA_DIAS').AsInteger;
   spGENERAR_VIGENCIA.ExecProc;
   spGENERAR_VIGENCIA.Transaction.CommitRetaining;
end;

{
procedure TfrmCapturar_mis_listas_de_precios.BeforePreview(Sender: TObject; AReportLink: TBasedxReportLink);
begin
   TdxComponentPrinter(Sender).PreviewOptions.WindowState := wsMaximized;
end;
 }
procedure TfrmCapturar_mis_listas_de_precios.ibImprimirClick(
  Sender: TObject);
{
var
   cpPrint : TdxComponentPrinter;
}
begin
{
   cpPrint := TdxComponentPrinter.Create(Application);
   cpPrint.OnBeforePreview := BeforePreview;
   cpPrint.AddLink(dgPrecios);
   cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Name  := 'Arial';
   cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Size  := 14;
 //  cpPrint.CurrentLink := cpImpresion.ReportLink[0];

   cpPrint.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Add(fpPadre.Title);
   cpPrint.ReportLink[0].ShrinkToPageWidth := true;
   cpPrint.Preview(True, nil);
   cpPrint.Free;
   dgPrecios.OptionsDB := [edgoCancelOnExit,edgoCanDelete,edgoCanInsert,edgoCanNavigation,edgoConfirmDelete,edgoUseBookmarks];
 }
end;

procedure TfrmCapturar_mis_listas_de_precios.sbLimpiarClick(
  Sender: TObject);
begin
   cbUsuarios.KeyValue := 0;
end;

procedure TfrmCapturar_mis_listas_de_precios.cePrecio_MinimoKeyPress(
  Sender: TObject; var Key: Char);
var
   id : integer;
begin
   if Key = #13 then
   begin
      id := dsLista_Precios.DataSet.FieldByName('ID').AsInteger;
      if ibGuardarPartida.Enabled then
         ibGuardarPartida.Click;
         {
      while not(dgPrecios.IsEOF) do
      begin
         if id <> dsLista_Precios.DataSet.FieldByName('ID').AsInteger then
            break;
         dgPrecios.GotoNext(true);
      end;
          }
      if ibModificarPartida.Enabled then
         ibModificarPartida.Click;
   end;
end;

procedure TfrmCapturar_mis_listas_de_precios.cePrecio_MinimoChange(
  Sender: TObject);
begin
   dsLista_Precios.DataSet.FieldByName('PRECIO_MAXIMO').AsFloat := StrToFloat(cePrecio_Minimo.Text);
//   cePrecio_Maximo.SetFocus;
//   cePrecio_Minimo.SetFocus;
end;

end.
