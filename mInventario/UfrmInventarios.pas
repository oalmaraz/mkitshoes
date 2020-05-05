unit UfrmInventarios;

interface

uses
  UTypeInventarios, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UfrmFrameMaterial,  Buttons, StdCtrls,
  ExtCtrls, jpeg, Db, IBX.IBCustomDataSet, IBX.IBQuery,  IBX.IBStoredProc,
  ComCtrls, DBCtrls, Grids, DBGrids;

type
  TfrmInventarios = class(TForm)
    sbHijo: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    dgPartidas: TDBGrid;
    FashionPanel1: TPanel;
    fcImager2: TImage;
    ibNuevo: TBitBtn;
    ibImprimir: TBitBtn;
    ibExportarXLS: TBitBtn;
    ibExportarHTML: TBitBtn;
    ibExportarXML: TBitBtn;
    ibAyuda: TBitBtn;
    ibColapsar: TBitBtn;
    ibExpander: TBitBtn;
    Bevel1: TBevel;
    paAlmacen: TPanel;
    laAlmacenOrigen: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    sbBorrarAlmacen: TSpeedButton;
    sbRefreshAlmOrigen: TSpeedButton;
    laMaterial: TLabel;
    edMaterial: TEdit;
    edDMaterial: TEdit;
    Label10: TLabel;
    Label3: TLabel;
    sbBorrarMoneda: TSpeedButton;
    cbMonedas: TDBLookupComboBox;
    sbRefreshMonedas: TSpeedButton;
    Label1: TLabel;
    sbBorrarLinea: TSpeedButton;
    edLinea: TEdit;
    Label2: TLabel;
    edLote: TEdit;
    edSerie: TEdit;
    Label6: TLabel;
    cbActivoFijo: TEdit;
    laMedida: TLabel;
    sbRefreshMedidas: TSpeedButton;
    cbMedidas: TDBLookupComboBox;
    cbColores: TDBLookupComboBox;
    laColor: TLabel;
    sbRefreshColores: TSpeedButton;
    qyColores: TIBQuery;
    qyColoresID: TIntegerField;
    qyColoresNOMBRE: TIBStringField;
    dsColores: TDataSource;
    dsMateriales_Medidas: TDataSource;
    qyMateriales_Medidas: TIBQuery;
    qyMateriales_MedidasR_ID: TIntegerField;
    qyMateriales_MedidasR_ID_MEDIDA: TIntegerField;
    qyMateriales_MedidasR_DESCRIPCION: TIBStringField;
    qyMateriales_MedidasR_CODIGO_BARRAS: TIBStringField;
    sbLimpiarMedida: TSpeedButton;
    sbLimpiarColor: TSpeedButton;
    qyInventario: TIBQuery;
    dsInventario: TDataSource;
    qySecundarias: TIBQuery;
    Panel6: TPanel;
    laVista: TLabel;
    rbCorrida: TRadioButton;
    rbNormal: TRadioButton;
    dgPartidasCorrida: TDBGrid;
    qyInventarioCorrida: TIBQuery;
    dsInventarioCorrida: TDataSource;
    spA_INVENTARIO_CORRIDA: TIBStoredProc;
    gbCorrida: TGroupBox;
    cbIncluir: TEdit;
    Label4: TLabel;
    deFecha: TDateTimePicker;
    deAl: TDateTimePicker;
    Label5: TLabel;
    qyFecha: TIBQuery;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sbRefreshAlmOrigenClick(Sender: TObject);
    procedure sbBorrarAlmacenClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbRefreshMonedasClick(Sender: TObject);
    procedure sbBorrarMonedaClick(Sender: TObject);
    procedure edLineaButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edLineaKeyPress(Sender: TObject; var Key: Char);
    procedure sbBorrarLineaClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure ibExportarXLSClick(Sender: TObject);
    procedure ibExportarHTMLClick(Sender: TObject);
    procedure ibExportarXMLClick(Sender: TObject);
    procedure ibColapsarClick(Sender: TObject);
    procedure ibExpanderClick(Sender: TObject);
    procedure fcImager2DblClick(Sender: TObject);
    procedure edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure sbLimpiarMedidaClick(Sender: TObject);
    procedure sbLimpiarColorClick(Sender: TObject);
    procedure rbNormalClick(Sender: TObject);
    procedure rbCorridaClick(Sender: TObject);
    procedure dsInventarioCorridaDataChange(Sender: TObject;
      Field: TField);
    procedure cbIncluirChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    awrMedidas  : Boolean;
    awrColores  : Boolean;
    Inventarios : TInventarios;
    tmpComp     : integer;
    tmpIncluir  : Boolean;
    awrImagen   : TMemoryStream;
  public
    { Public declarations }
  end;

var
  frmInventarios: TfrmInventarios;  

implementation

uses  lineas, UfrmAltaRapidaMateriales, reglas_de_negocios,
  UfrmScript, UfrmSeleccionarMaterialTodos, IBData, IBModulo, UfrmImagen;

{$R *.DFM}

procedure TfrmInventarios.FormShow(Sender: TObject);
begin
   cbAlmacenes.ListSource   := Inventarios.DSALMACENES;
   Inventarios.refreshAlmacenes;

   cbMonedas.ListSource     := Inventarios.DSMONEDAS;
//   dgPartidas.DataSource    := Inventarios.DSINVENTARIO;
   Inventarios.refreshMonedas;
   cbMonedas.KeyValue := Inventarios.MBASE;
end;

procedure TfrmInventarios.FormCreate(Sender: TObject);
var
   i   : integer;
   sec : integer;
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   Inventarios := TInventarios.Create;
   awrImagen   := TMemoryStream.Create;

   tmpComp    := 0;
   tmpIncluir := false;

   dgPartidas.Align        := alClient;
   dgPartidasCorrida.Align := alClient;

   //Activar medidas
   dmIBData.TPreferencias.Filter := 'ID = 66';
   awrMedidas := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //Activar colores
   dmIBData.TPreferencias.Filter := 'ID = 69';
   awrColores := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   awrColores := awrColores and awrMedidas;

   //Activar columna Medidas
   //dgPartidasMEDIDAS.Visible := awrMedidas;
   laMedida.Visible          := awrMedidas;
   sbLimpiarMedida.Visible   := awrMedidas;
   sbRefreshMedidas.Visible  := awrMedidas;
   cbMedidas.Visible         := awrMedidas;

   //Activar columna colores
   //dgPartidasCOLORES.Visible := awrColores;
   laColor.Visible           := awrColores;
   sbLimpiarColor.Visible    := awrColores;
   sbRefreshColores.Visible  := awrColores;
   cbColores.Visible         := awrColores;

   if (awrColores) then
   begin
      qyColores.Close;
      qyColores.Open;
   end;

   //Numero de columnas, para unidades secundarias
   dmIBData.TPreferencias.Filter := 'ID = 192';
   sec := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
   if sec <> 0 then
   begin
      qySecundarias.Close;
      qySecundarias.Open;

      i := 0;
      while not(qySecundarias.Eof) do
      begin
         i := i + 1;
         if i = 1 then
         begin
            //dgPartidasPRIMERA.Caption := qySecundarias.FieldByName('R_DESCRIPCION').AsString;
            //dgPartidasPRIMERA.Visible := true;
         end;
         qySecundarias.Next;
      end
   end;

   qyFecha.Close;
   qyFecha.Open;

   deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',qyFecha.FieldByName('R_FECHA').AsDatetime));
   deAl.Date    := StrToDate(FormatDateTime('dd/mm/yyyy',qyFecha.FieldByName('R_FECHA').AsDatetime));
end;

procedure TfrmInventarios.sbRefreshAlmOrigenClick(Sender: TObject);
begin
   Inventarios.refreshAlmacenes;
end;

procedure TfrmInventarios.sbBorrarAlmacenClick(Sender: TObject);
begin
   cbAlmacenes.KeyValue := 0;
//   cbAlmacenes.KeyValue := null;
end;

procedure TfrmInventarios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Inventarios.Free;
  Inventarios:=nil;

  Action := caFree;
end;

procedure TfrmInventarios.sbRefreshMonedasClick(Sender: TObject);
begin
   Inventarios.refreshMonedas;
end;

procedure TfrmInventarios.sbBorrarMonedaClick(Sender: TObject);
begin
   cbMonedas.Keyvalue:=0;
end;

procedure TfrmInventarios.edLineaButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pnt  : TPoint;
   tmp  : integer;
   tmp2 : string;
begin
  if AbsoluteIndex = 0 then
  begin
    pnt       := edLinea.ClientToScreen(Point(0,0));
    frmLineas := TfrmLineas.Create(Application);
    frmLineas.coordenadas(pnt.x, pnt.y + edLinea.Height);
    frmLineas.ShowModal;
    tmp  := frmLineas.dame_seleccion;
    tmp2 := frmLineas.dame_strSeleccion;
    frmLineas.Destroy;
    if tmp <> 0 then
    begin
       edLinea.Tag  := tmp;
       edLinea.Text := tmp2;
    end;
  end;
end;

procedure TfrmInventarios.edLineaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      edLineaButtonClick(nil, 0);
   end
end;

procedure TfrmInventarios.sbBorrarLineaClick(Sender: TObject);
begin
   edLinea.Tag := -3;
   edLinea.Clear;
end;

procedure TfrmInventarios.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmInventarios.ibNuevoClick(Sender: TObject);
var
   v_vacio   : Boolean;
   v_buscar  : Boolean;
   v_incluir : string;
begin
   v_vacio  := true;
   v_buscar := true;

   //almacen
   if cbAlmacenes.Text = '' then
      Inventarios.ALMACEN := 0
   else
   begin
      Inventarios.ALMACEN := cbAlmacenes.KeyValue;
      v_vacio             := false;
   end;

   //material
   Inventarios.MATERIAL    := edMaterial.Tag;
   Inventarios.CLAVE       := edMaterial.Text;
   Inventarios.DESCRIPCION := edDMaterial.Text;
   if edMaterial.Tag <> 0 then
      v_vacio := false;

   //medida
   if cbMedidas.Text = '' then
      Inventarios.MEDIDA := 0
   else
   begin
      Inventarios.MEDIDA := cbMedidas.KeyValue;
      v_vacio            := false;
   end;

   //color
   if cbColores.Text = '' then
      Inventarios.COLOR := 0
   else
   begin
      Inventarios.COLOR := cbColores.KeyValue;
      v_vacio           := false;
   end;

   //moneda
   if cbMonedas.Text = '' then
      Inventarios.MONEDA := 0
   else
   begin
      Inventarios.MONEDA := cbMonedas.KeyValue;
   end;

   //lote
   if edLote.Text <> '' then
   begin
      Inventarios.LOTE := edLote.Text;
      v_vacio          := false;
   end
   else
      Inventarios.LOTE := '';

   //serie
   if edSerie.Text <> '' then
   begin
      Inventarios.SERIE := edSerie.Text;
      v_vacio           := false;
   end
   else
      Inventarios.SERIE := '';

   //activo fijo
   {
   if cbActivoFijo.State = cbsGrayed then
      Inventarios.ACTIVOFIJO := ''
   else
   begin
      if cbActivoFijo.Checked then
         Inventarios.ACTIVOFIJO := 'Si'
      else
         Inventarios.ACTIVOFIJO := 'No';
   end;
   }
   //linea/sub-linea
   if edLinea.Text <> '' then
      Inventarios.LINEA := edLinea.Tag
   else
      Inventarios.LINEA := 0;

   if rbNormal.Checked then
   begin
      qyInventario.Close;
      qyInventario.ParamByName('P_ALMACEN').AsInteger    := Inventarios.ALMACEN;
      qyInventario.ParamByName('P_MATERIAL').AsInteger   := Inventarios.MATERIAL;
      qyInventario.ParamByName('P_MEDIDA').AsInteger     := Inventarios.MEDIDA;
      qyInventario.ParamByName('P_COLOR').AsInteger      := Inventarios.COLOR;
      qyInventario.ParamByName('P_MONEDA').AsInteger     := Inventarios.MONEDA;
      qyInventario.ParamByName('P_LINEA').AsInteger      := Inventarios.LINEA;
      qyInventario.ParamByName('P_LOTE').AsString        := Inventarios.LOTE;
      qyInventario.ParamByName('P_SERIE').AsString       := Inventarios.SERIE;
      qyInventario.ParamByName('P_ACTIVO_FIJO').AsString := Inventarios.ACTIVOFIJO;
      qyInventario.Open;

      ibExpander.Click;

      dgPartidas.DataSource.DataSet.First;
   end
   else
   if rbCorrida.Checked then
   begin
      if (v_vacio) then
      begin
         v_buscar := false;
         if MessageDlg('No Hay opciones de busqueda, este proceso puede tardar varios minutos.  ¿Desea buscar?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
            v_buscar := true;
      end;

      if (v_buscar) then
      begin
         v_incluir := 'NO';
         if cbIncluir.Text = 'Si' then
         begin
            v_incluir := 'SI';
            if deFecha.Focused then
               deAl.SetFocus;
            if deAl.Focused then
               deFecha.SetFocus;
         end;

         spA_INVENTARIO_CORRIDA.ParamByName('P_USUARIO').AsInteger    := reglas.dame_usuario;
         spA_INVENTARIO_CORRIDA.ParamByName('P_MODULO').AsString      := self.Caption;
         spA_INVENTARIO_CORRIDA.ParamByName('P_ALMACEN').AsInteger    := Inventarios.ALMACEN;
         spA_INVENTARIO_CORRIDA.ParamByName('P_MATERIAL').AsInteger   := Inventarios.MATERIAL;
         spA_INVENTARIO_CORRIDA.ParamByName('P_MEDIDA').AsInteger     := Inventarios.MEDIDA;
         spA_INVENTARIO_CORRIDA.ParamByName('P_COLOR').AsInteger      := Inventarios.COLOR;
         spA_INVENTARIO_CORRiDA.ParamByName('P_MONEDA').AsInteger     := Inventarios.MONEDA;
         spA_INVENTARIO_CORRIDA.ParamByName('P_LINEA').AsInteger      := Inventarios.LINEA;
         spA_INVENTARIO_CORRIDA.ParamByName('P_LOTE').AsString        := Inventarios.LOTE;
         spA_INVENTARIO_CORRIDA.ParamByName('P_X_FECHAS').AsString    := v_incluir;
         spA_INVENTARIO_CORRIDA.ParamByName('P_VTAS_DE').AsDateTime   := deFecha.Date;
         spA_INVENTARIO_CORRIDA.ParamByName('P_VTAS_AL').AsDateTime   := deAl.Date;
         spA_INVENTARIO_CORRIDA.ExecProc;
         spA_INVENTARIO_CORRIDA.Transaction.CommitRetaining;

         qyInventarioCorrida.Close;
         qyInventarioCorrida.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
         qyInventarioCorrida.ParamByName('P_MODULO').AsString   := self.Caption;
         qyInventarioCorrida.Open;

         dgPartidasCorrida.DataSource.DataSet.First;
      end;
   end;
end;


procedure TfrmInventarios.buInicioClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmInventarios.buAnteriorClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Prior;
end;

procedure TfrmInventarios.buSiguienteClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Next;
end;

procedure TfrmInventarios.buFinClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Last;
end;

procedure TfrmInventarios.ibExportarXLSClick(Sender: TObject);
var
   SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(Application);
  with SaveDialog do
  begin
     DefaultExt := 'xls';
     Filter := 'Microsoft Excel 4.0 Worksheet (*.xls)|*.xls';
     FileName := 'inventario.xls';
     if Execute then
     begin
        if rbNormal.Checked then
           //dgPartidas.SaveToXLS(FileName, TRUE)
        else
        if rbCorrida.Checked then
           //dgPartidasCorrida.SaveToXLS(FileName, TRUE);
     end;
  end;
  SaveDialog.Destroy;
end;

procedure TfrmInventarios.ibExportarHTMLClick(Sender: TObject);
var
   SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(Application);
  with SaveDialog do
  begin
      DefaultExt := 'htm';
      Filter := 'HTML File (*.htm; *.html)|*.htm';
      FileName := 'inventario.htm';
      if Execute then
      begin
      {
        if rbNormal.Checked then
           dgPartidas.SaveToHTML(FileName, TRUE)
        else
        if rbCorrida.Checked then
           dgPartidasCorrida.SaveToHTML(FileName, TRUE);
           }
      end;
  end;
  SaveDialog.Destroy;
end;

procedure TfrmInventarios.ibExportarXMLClick(Sender: TObject);
var
   SaveDialog : TSaveDialog;
begin
  SaveDialog := TSaveDialog.Create(Application);
  with SaveDialog do
  begin
      DefaultExt := 'xml';
      Filter := 'XML File (*.xml)|*.xml';
      FileName := 'inventario.xml';
      if Execute then
      begin
      {
        if rbNormal.Checked then
           dgPartidas.SaveToXML(FileName, TRUE)
        else
        if rbCorrida.Checked then
           dgPartidasCorrida.SaveToXML(FileName, TRUE);
           }
      end;
  end;
  SaveDialog.Destroy;
end;

procedure TfrmInventarios.ibColapsarClick(Sender: TObject);
begin
//  if not(dgPartidas.DataSource.DataSet.IsEmpty) then
  //   dgPartidas.FullCollapse;
end;

procedure TfrmInventarios.ibExpanderClick(Sender: TObject);
begin
//  if not(dgPartidas.DataSource.DataSet.IsEmpty) then
  //   dgPartidas.FullExpand;
end;

procedure TfrmInventarios.fcImager2DblClick(Sender: TObject);
begin
   try
      frmScript := TfrmScript.Create(Application);
      frmScript.AddStrings(Inventarios.interno.strSql);
      frmScript.ShowModal;
   finally
      frmScript.Destroy;
   end;
end;

procedure TfrmInventarios.edMaterialButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   case AbsoluteIndex of
     0: begin
           frmSeleccionarMaterialTodos             := TfrmSeleccionarMaterialTodos.Create(Application);
           frmSeleccionarMaterialTodos.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarMaterialTodos.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarMaterialTodos.CLAVE       := edMaterial.Text;
           if frmSeleccionarMaterialTodos.abrirConsulta then
           begin
              frmSeleccionarMaterialTodos.ShowModal;
              if frmSeleccionarMaterialTodos.ACEPTAR then
              begin
                 edMaterial.Tag   := frmSeleccionarMaterialTodos.ID;
                 edMaterial.Text  := frmSeleccionarMaterialTodos.CLAVE;
                 edDMaterial.Text := frmSeleccionarMaterialTodos.DESCRIPCION;
                 //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
              end;
           end
           else
              if frmSeleccionarMaterialTodos.ID <> 0 then
              begin
                 edMaterial.Tag   := frmSeleccionarMaterialTodos.ID;
                 edMaterial.Text  := frmSeleccionarMaterialTodos.CLAVE;
                 edDMaterial.Text := frmSeleccionarMaterialTodos.DESCRIPCION;
                 //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
              end;

           //Foto
           if frmSeleccionarMaterialTodos.ID <> 0 then
           begin
              frmSeleccionarMaterialTodos.LoadFoto(awrImagen);
           end;

           frmSeleccionarMaterialTodos.Free;
           frmSeleccionarMaterialTodos := nil;

           if (edMaterial.Tag <> 0) and (awrMedidas) then
           begin
              qyMateriales_Medidas.Close;
              qyMateriales_Medidas.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
              qyMateriales_Medidas.Open;
           end;
        end;
     1: begin
           edMaterial.Clear;
           edDMaterial.Text := '';
           edMaterial.Tag   := 0;
        end;
     2: begin
           if edMaterial.Tag <> 0 then
           begin
              try
                 Application.CreateForm(TfrmImagen, frmImagen);
                 frmImagen.LoadImagen(awrImagen);
                 frmImagen.ShowModal;
              finally
                 frmImagen.Free;
              end;
           end;
        end;
   end;
end;

procedure TfrmInventarios.edMaterialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
     //.OnButtonClick(nil, 0);
  end;
end;

procedure TfrmInventarios.sbLimpiarMedidaClick(Sender: TObject);
begin
   cbMedidas.keyValue :=0;
end;

procedure TfrmInventarios.sbLimpiarColorClick(Sender: TObject);
begin
   cbColores.keyValue :=0;
end;

procedure TfrmInventarios.rbNormalClick(Sender: TObject);
begin
{   if rbNormal.Checked then
   begin
      ibNuevo.Click;
   end;}
   dgPartidas.Visible          := rbNormal.Checked;
   dgPartidasCorrida.Visible   := not(rbNormal.Checked);
   gbCorrida.Visible           := not(rbNormal.Checked);
end;

procedure TfrmInventarios.rbCorridaClick(Sender: TObject);
begin
{   if rbCorrida.Checked then
   begin
      ibNuevo.Click;
   end;}
   dgPartidasCorrida.Visible   := rbCorrida.Checked;
   dgPartidas.Visible          := not(rbCorrida.Checked);
   gbCorrida.Visible           := rbCorrida.Checked;
end;

procedure TfrmInventarios.dsInventarioCorridaDataChange(Sender: TObject;
  Field: TField);
var
   i : integer;
begin
   if (tmpComp <> dgPartidasCorrida.DataSource.DataSet.FieldByName('R_GM').asInteger) OR (tmpIncluir <> (cbIncluir.Text='Si')) then
   begin
      tmpComp    := dsInventarioCorrida.DataSet.FieldByName('R_GM').asInteger;
      tmpIncluir := cbIncluir.Text='Si';
      //Inventario
      {
      dgPartidasCorridaC1.Visible  := false;
      dgPartidasCorridaC2.Visible  := false;
      dgPartidasCorridaC3.Visible  := false;
      dgPartidasCorridaC4.Visible  := false;
      dgPartidasCorridaC5.Visible  := false;
      dgPartidasCorridaC6.Visible  := false;
      dgPartidasCorridaC7.Visible  := false;
      dgPartidasCorridaC8.Visible  := false;
      dgPartidasCorridaC9.Visible  := false;
      dgPartidasCorridaC10.Visible := false;
      dgPartidasCorridaC11.Visible := false;
      dgPartidasCorridaC12.Visible := false;
      dgPartidasCorridaC13.Visible := false;
      dgPartidasCorridaC14.Visible := false;
      dgPartidasCorridaC15.Visible := false;
      dgPartidasCorridaC16.Visible := false;
      dgPartidasCorridaC17.Visible := false;
      dgPartidasCorridaC18.Visible := false;
      dgPartidasCorridaC19.Visible := false;
      dgPartidasCorridaC20.Visible := false;
      //Ventas
      dgPartidasCorridaO1.Visible  := false;
      dgPartidasCorridaO2.Visible  := false;
      dgPartidasCorridaO3.Visible  := false;
      dgPartidasCorridaO4.Visible  := false;
      dgPartidasCorridaO5.Visible  := false;
      dgPartidasCorridaO6.Visible  := false;
      dgPartidasCorridaO7.Visible  := false;
      dgPartidasCorridaO8.Visible  := false;
      dgPartidasCorridaO9.Visible  := false;
      dgPartidasCorridaO10.Visible := false;
      dgPartidasCorridaO11.Visible := false;
      dgPartidasCorridaO12.Visible := false;
      dgPartidasCorridaO13.Visible := false;
      dgPartidasCorridaO14.Visible := false;
      dgPartidasCorridaO15.Visible := false;
      dgPartidasCorridaO16.Visible := false;
      dgPartidasCorridaO17.Visible := false;
      dgPartidasCorridaO18.Visible := false;
      dgPartidasCorridaO19.Visible := false;
      dgPartidasCorridaO20.Visible := false;

      for i := 1 to dsInventarioCorrida.DataSet.FieldByName('R_CUANTAS').AsInteger do
      begin
         case i of
           1: begin
                 dgPartidasCorridaC1.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC1.Visible := true;
                 dgPartidasCorridaO1.Visible := cbIncluir.Checked;
              end;
           2: begin
                 dgPartidasCorridaC2.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC2.Visible := true;
                 dgPartidasCorridaO2.Visible := cbIncluir.Checked;
              end;
           3: begin
                 dgPartidasCorridaC3.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC3.Visible := true;
                 dgPartidasCorridaO3.Visible := cbIncluir.Checked;
              end;
           4: begin
                 dgPartidasCorridaC4.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC4.Visible := true;
                 dgPartidasCorridaO4.Visible := cbIncluir.Checked;
              end;
           5: begin
                 dgPartidasCorridaC5.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC5.Visible := true;
                 dgPartidasCorridaO5.Visible := cbIncluir.Checked;
              end;
           6: begin
                 dgPartidasCorridaC6.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC6.Visible := true;
                 dgPartidasCorridaO6.Visible := cbIncluir.Checked;
              end;
           7: begin
                 dgPartidasCorridaC7.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC7.Visible := true;
                 dgPartidasCorridaO7.Visible := cbIncluir.Checked;
              end;
           8: begin
                 dgPartidasCorridaC8.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC8.Visible := true;
                 dgPartidasCorridaO8.Visible := cbIncluir.Checked;
              end;
           9: begin
                 dgPartidasCorridaC9.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC9.Visible := true;
                 dgPartidasCorridaO9.Visible := cbIncluir.Checked;
              end;
          10: begin
                 dgPartidasCorridaC10.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC10.Visible := true;
                 dgPartidasCorridaO10.Visible := cbIncluir.Checked;
              end;
          11: begin
                 dgPartidasCorridaC11.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC11.Visible := true;
                 dgPartidasCorridaO11.Visible := cbIncluir.Checked;
              end;
          12: begin
                 dgPartidasCorridaC12.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC12.Visible := true;
                 dgPartidasCorridaO12.Visible := cbIncluir.Checked;
              end;
          13: begin
                 dgPartidasCorridaC13.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC13.Visible := true;
                 dgPartidasCorridaO13.Visible := cbIncluir.Checked;
              end;
          14: begin
                 dgPartidasCorridaC14.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC14.Visible := true;
                 dgPartidasCorridaO14.Visible := cbIncluir.Checked;
              end;
          15: begin
                 dgPartidasCorridaC15.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC15.Visible := true;
                 dgPartidasCorridaO15.Visible := cbIncluir.Checked;
              end;
          16: begin
                 dgPartidasCorridaC16.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC16.Visible := true;
                 dgPartidasCorridaO16.Visible := cbIncluir.Checked;
              end;
          17: begin
                 dgPartidasCorridaC17.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC17.Visible := true;
                 dgPartidasCorridaO17.Visible := cbIncluir.Checked;
              end;
          18: begin
                 dgPartidasCorridaC18.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC18.Visible := true;
                 dgPartidasCorridaO18.Visible := cbIncluir.Checked;
              end;
          19: begin
                 dgPartidasCorridaC19.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC19.Visible := true;
                 dgPartidasCorridaO19.Visible := cbIncluir.Checked;
              end;
          20: begin
                 dgPartidasCorridaC20.Caption := qyInventarioCorrida.FieldByName('R_E'+IntToStr(i)).AsString;
                 dgPartidasCorridaC20.Visible := true;
                 dgPartidasCorridaO20.Visible := cbIncluir.Checked;
              end;
         end;
      end;
      }
   end;
end;

procedure TfrmInventarios.cbIncluirChange(Sender: TObject);
begin
  // dgPartidasCorridaOT.Visible := rbCorrida.Checked and cbIncluir.Checked;
end;

procedure TfrmInventarios.FormDestroy(Sender: TObject);
begin
   if awrImagen <> nil then
   begin
      awrImagen.Free;
      awrImagen := nil;
   end;
end;

end.
