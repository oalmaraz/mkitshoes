unit UfrmKardex;

interface

uses
  USqlAnaliza, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls,  jpeg, Db,
  IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBDatabase, Buttons,  IBX.IBTable,
  Grids, DBGrids, DBCtrls, ComCtrls, StdCtrls;

type
  TfrmKardex = class(TForm)
    paDatos: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    laClienteDEL: TLabel;
    laMaterial: TLabel;
    Label10: TLabel;
    laAlmacenOrigen: TLabel;
    edFechaDEL: TDateTimePicker;
    edFechaAL: TDateTimePicker;
    edMIClave: TEdit;
    edMaterial: TEdit;
    edDMaterial: TEdit;
    cbMIEstatus: TDBLookupComboBox;
    Label1: TLabel;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    qyKardex: TIBQuery;
    dsKardex: TDataSource;
    qyKardextipo_descripcion: TIBStringField;
    qyKardexID: TIntegerField;
    qyKardexFECHA_ALTA: TDateTimeField;
    qyKardexTIPO: TIBStringField;
    qyKardexTE_DESCRIPCION: TIBStringField;
    qyKardexTS_DESCRIPCION: TIBStringField;
    qyKardexMI_CLAVE: TIBStringField;
    qyKardexMI_OBSERVACIONES: TIBStringField;
    qyKardexFOLIO_ORIGEN: TIntegerField;
    qyKardexFOLIO_DESTINO: TIntegerField;
    qyKardexAO_CLAVE: TIBStringField;
    qyKardexAO_NOMBRE: TIBStringField;
    qyKardexAD_CLAVE: TIBStringField;
    qyKardexAD_NOMBRE: TIBStringField;
    qyKardexM_CLAVE: TIBStringField;
    qyKardexM_DESCRIPCION: TIBStringField;
    qyKardexCANTIDAD: TFloatField;
    qyKardexMONEDA: TIBStringField;
    qyKardexUNIDAD: TIBStringField;
    qyKardexMEDIDA: TIBStringField;
    qyKardexCOLOR: TIBStringField;
    qyKardexLOTE: TIBStringField;
    qyKardexSERIE: TIBStringField;
    qyKardexLINEA: TIBStringField;
    qyKardexESTATUS: TIBStringField;
    Label5: TLabel;
    Label6: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    qyAlmacenes: TIBQuery;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    qyAlmacenesSERIE_NC: TIBStringField;
    qyAlmacenesSERIE_NVENTA: TIBStringField;
    qyAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    qyEstatusProcesos: TIBQuery;
    qyEstatusProcesosID: TIntegerField;
    qyEstatusProcesosNOMBRE: TIBStringField;
    qyEstatusProcesosFORMA: TIntegerField;
    qyEstatusProcesosESTATUS: TIBStringField;
    dsEstatusProcesos: TDataSource;
    cbTipo: TDBComboBox;
    sbBorrarEstatus: TSpeedButton;
    paTop: TPanel;
    fcImager2: TImage;
    paTopClient: TPanel;
    Panel6: TPanel;
    paBotones: TPanel;
    ibNuevo: TBitBtn;
    ibImprimir: TBitBtn;
    ibAyuda: TBitBtn;
    qyKardexcronos: TFloatField;
    qyExistencia: TIBQuery;
    fcLabel1: TLabel;
    edExistencia: TEdit;
    qyKardexID_DETALLE: TIntegerField;
    qyKardexAO_ID: TIntegerField;
    qyKardexAD_ID: TIntegerField;
    dgPartidas: TDBGrid;
    TPreferencias: TIBTable;
    TPreferenciasID: TIntegerField;
    TPreferenciasNOMBRE: TIBStringField;
    TPreferenciasTIPO: TIBStringField;
    TPreferenciasVALOR: TIBStringField;
    sbClearDel: TSpeedButton;
    sbClearAl: TSpeedButton;
    qyKardexID_REFERENCIA: TIntegerField;
    Label2: TLabel;
    edSerie: TEdit;
    Label8: TLabel;
    sbBorrarMoneda: TSpeedButton;
    cbMonedas: TDBLookupComboBox;
    sbRefreshMonedas: TSpeedButton;
    dsMonedas: TDataSource;
    TMonedas: TIBTable;
    TMonedasID: TIntegerField;
    TMonedasCLAVE: TIBStringField;
    TMonedasDESCRIPCION: TIBStringField;
    TMonedasFECHA_ULT_ACT: TDateTimeField;
    TMonedasPARIDAD: TFloatField;
    qyKardexTABLA_REFERENCIA: TIBStringField;
    qyKardexR_MONTO: TFloatField;
    procedure qyKardexCalcFields(DataSet: TDataSet);
    procedure ibNuevoClick(Sender: TObject);
    procedure edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edMIClaveButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure sbBorrarEstatusClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure fcImager2DblClick(Sender: TObject);
    procedure ibExportarHTMLClick(Sender: TObject);
    procedure ibExportarXMLClick(Sender: TObject);
    procedure sbBorrarMonedaClick(Sender: TObject);
  private
    { Private declarations }
     awrPrimero : boolean;
     awrAcum    : double;
     awrDif     : double;
     awrMBase   : integer;

     awrSql    : TSqlAnaliza;
    procedure setDatabase(valor : TIBDatabase);
    procedure setTransaction(valor : TIBTransaction);
    procedure LoadData;

    function calcularKardex : double;
  public
    { Public declarations }
     procedure Open;
  published
     property DATABASE      : TIBDatabase write setDatabase;
     property TRANSACTION   : TIBTransaction write setTransaction;
     property interno : TSqlAnaliza read awrSql;
  end;

var
  frmKardex: TfrmKardex;

implementation

uses  UfrmScript,
  UfrmSeleccionarMaterialTodos;

{$R *.DFM}


procedure TfrmKardex.Open;
begin
   TPreferencias.Close;
   TPreferencias.Open;

   qyAlmacenes.Close;
   qyAlmacenes.Open;

   qyEstatusProcesos.Close;
   qyEstatusProcesos.Open;

   TMonedas.Close;
   TMonedas.Open;

   cbMIEstatus.KeyValue := 'Afectado';

   //Moneda Base
   TPreferencias.Filter := 'ID = 3';
   awrMBase := TPreferencias.FieldByName('VALOR').AsInteger;
   cbMonedas.KeyValue := awrMBase;

   //Activar Medidas
   TPreferencias.Filter := 'ID = 66';
   //dgPartidasMEDIDA.Visible := UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   //Activar Colores
   TPreferencias.Filter := 'ID = 69';
   //dgPartidasCOLOR.Visible :=(UpperCase(TPreferencias.FieldByName('VALOR').AsString) = 'SI') and dgPartidasMEDIDA.Visible;

   awrSql.AddStrings(qyKardex.SQL);
end;

function TfrmKardex.calcularKardex : double;
var
   awrTipo : string;
   awrAct  : double;
begin
   awrTipo := qyKardex.FieldByName('TIPO').AsString;
   awrAct  := qyKardex.FieldByName('CANTIDAD').AsFloat;
   if awrPrimero then
   begin
      awrAcum    := qyExistencia.FieldByName('R_EXISTENCIA').AsFloat;
      awrPrimero := false;
   end;

   //Inventario Inicial
   if awrTipo = 'Inventario Inicial' then
   begin
      awrAcum := awrAct;
   end;
   //Otro Diferencias
   if awrTipo = 'Otro' then
   begin
      awrAcum := awrAct;
      awrDif  := awrAct;
   end;
   //Salida
   if awrTipo = 'Salida' then
   begin
      awrAcum := awrAcum + awrAct;
   end;
   //Entrada
   if awrTipo = 'Entrada' then
   begin
      awrAcum := awrAcum - awrAct;
   end;
   //Conteo
   if (awrTipo = 'Conteo') or (awrTipo = 'Conteo Parcial') then
   begin
      awrAcum := awrAct - awrDif;
      awrDif  := 0;
   end;
   //Ajuste Inventario
   if awrTipo = 'Ajuste Inventario' then
   begin
      awrAcum := awrAcum - awrAct;
   end;
   //Traspasos
   if awrTipo = 'Traspaso' then
   begin
      if qyKardex.FieldByName('AO_ID').AsInteger <> qyKardex.FieldByName('AD_ID').AsInteger then
      begin
         if cbAlmacenes.KeyValue = qyKardex.FieldByName('AO_ID').AsInteger then
            awrAcum := awrAcum + awrAct
         else
            awrAcum := awrAcum - awrAct;
      end;
   end;

   Result := awrAcum;
end;

procedure TfrmKardex.LoadData;
begin
end;

procedure TfrmKardex.setDatabase(valor : TIBDatabase);
begin
   qyKardex.Database          := valor;
   qyAlmacenes.Database       := valor;
   qyEstatusProcesos.Database := valor;
   qyExistencia.Database      := valor;
   TPreferencias.Database     := valor;
   TMonedas.Database          := valor;

   awrSql.DataBase            := valor;
end;

procedure TfrmKardex.setTransaction(valor : TIBTransaction);
begin
   qyKardex.Transaction          := valor;
   qyAlmacenes.Transaction       := valor;
   qyEstatusProcesos.Transaction := valor;
   qyExistencia.Transaction      := valor;
   TPreferencias.Transaction     := valor;
   TMonedas.Transaction          := valor;

   awrSql.Transaction            := valor;
end;

procedure TfrmKardex.qyKardexCalcFields(DataSet: TDataSet);
begin
   DataSet.FieldByName('tipo_descripcion').AsString := DataSet.FieldByName('TE_DESCRIPCION').AsString + DataSet.FieldByName('TS_DESCRIPCION').AsString;
end;

procedure TfrmKardex.ibNuevoClick(Sender: TObject);
var
   error   : boolean;
   vLogica : string;
   i, j    : integer;
begin
   error := false;
   if edMaterial.Tag = 0 then
   begin
      error := true;
      ShowMessage('Falta Capturar Material');
      edMaterial.SetFocus;
   end;
   //almacen
   if (cbAlmacenes.Text = '') and not(error) then
   begin
      error := true;
      ShowMessage('Falta Capturar Almacen');
      cbAlmacenes.SetFocus;
   end;

   if not(error) then
   begin
      qyExistencia.Close;
      qyExistencia.ParamByName('P_ALMACEN').AsInteger  := cbAlmacenes.KeyValue;
      qyExistencia.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
      qyExistencia.ParamByName('P_SERIE').AsString     := edSerie.Text;
      qyExistencia.ParamByName('P_MONEDA').AsInteger   := cbMonedas.KeyValue;
      qyExistencia.Open;
      edExistencia.Text := FloatToStr(qyExistencia.FieldByName('R_EXISTENCIA').AsFloat);

      vLogica := ' ';
      awrSql.LoadSemiOriginal;

      //Almacen
      j := awrSQL.AddParamIndex('P_ALMACEN');
      awrSQL.setParam(j, cbAlmacenes.KeyValue, psCadena);
      awrSQL.AddWhereExtra('( (MI.ALMACEN_ORIGEN = :P_ALMACEN) OR (MI.ALMACEN_DESTINO = :P_ALMACEN) )');

      if edMaterial.Tag <> 0 then
      begin
         j := awrSQL.AddParamIndex('P_MATERIAL');
         awrSQL.setParam(j, edMaterial.Tag, psCadena);
         awrSQL.AddWhereExtra('AND (MID.MATERIAL = :P_MATERIAL)');
      end;

      if edSerie.Text <> '' then
      begin
         j := awrSQL.AddParamIndex('P_SERIE');
         awrSQL.setParam(j, edSerie.Text, psCadena);
         awrSQL.AddWhereExtra('AND (MID.SERIE = :P_SERIE)');
      end;

      //Moneda
      j := awrSQL.AddParamIndex('P_MONEDA');
      awrSQL.setParam(j, cbMonedas.KeyValue, psCadena);
      awrSQL.AddWhereExtra('AND (MID.MONEDA = :P_MONEDA)');

      if cbMIEstatus.Text <> '' then
      begin
         j := awrSQL.AddParamIndex('P_ESTATUS');
         awrSQL.setParam(j, cbMIEstatus.KeyValue, psCadena);
         awrSQL.AddWhereExtra('AND (MI.ESTATUS = :P_ESTATUS)');
      end;

      if cbTipo.Text <> 'Todos' then
      begin
         j := awrSQL.AddParamIndex('P_TIPO');
         awrSQL.setParam(j, cbTipo.Text, psCadena);
         awrSQL.AddWhereExtra('AND (MI.TIPO = :P_TIPO)');
      end;

      if edMIClave.Text <> '' then
      begin
         j := awrSQL.AddParamIndex('P_MI');
         awrSQL.setParam(j, edMIClave.Text, psCadena);
         awrSQL.AddWhereExtra('AND (UPPER(MI.CLAVE) = :P_MI)');
      end;

      if edFechaDEL.Focused then
         edFechaAl.SetFocus;
      if edFechaAl.Focused then
         edFechaDEL.SetFocus;
      if (edFechaDEL.Date <> -700000) and (edFechaAl.Date <> -700000) then
      begin
         j := awrSQL.AddParamIndex('P_DEL');
         awrSQL.setParam(j, edFechaDEL.Date, psFecha);

         j := awrSQL.AddParamIndex('P_AL');
         awrSQL.setParam(j, edFechaAL.Date, psCadena);

         awrSQL.AddWhereExtra('AND (F_FECHA(MI.FECHA_HORA) BETWEEN :P_DEL AND :P_AL)');
      end;

      awrSQL.construirExtra;

      qyKardex.SQL.Clear;
      qyKardex.SQL.AddStrings(awrSQL.strSql);
      for i := 1 to awrSQL.indexParam do
      begin
         qyKardex.ParamByName(awrSQL.dameParam(i)).Value := awrSQL.dameParamValor(i);
      end;
      qyKardex.Open;

      LoadData;
//      ibExpander.Click;
//      dgPartidas.GotoFirst;
   end;
end;

procedure TfrmKardex.edMaterialButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   case AbsoluteIndex of
     0: begin
           frmSeleccionarMaterialTodos             := TfrmSeleccionarMaterialTodos.Create(Application);
           frmSeleccionarMaterialTodos.DATABASE    := qyKardex.Database;
           frmSeleccionarMaterialTodos.TRANSACTION := qyKardex.Transaction;
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
           frmSeleccionarMaterialTodos.Free;
           frmSeleccionarMaterialTodos := nil;
        end;
     1: begin
           edMaterial.Clear;
           edDMaterial.Text := '<FALTA>';
           edMaterial.Tag   := 0;
        end;
   end;
end;

procedure TfrmKardex.edMaterialKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
     //edMaterial.OnButtonClick(nil, 0);
  end;
end;

procedure TfrmKardex.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmKardex.edMIClaveButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   edMIClave.Clear;
end;

procedure TfrmKardex.sbBorrarEstatusClick(Sender: TObject);
begin
   cbMIEstatus.Keyvalue:=0;
end;

procedure TfrmKardex.FormCreate(Sender: TObject);
begin
   awrSql := TSqlAnaliza.Create;
end;

procedure TfrmKardex.FormDestroy(Sender: TObject);
begin
   awrSql.Destroy;
end;

procedure TfrmKardex.fcImager2DblClick(Sender: TObject);
begin
   try
      frmScript := TfrmScript.Create(Application);
      frmScript.AddStrings(awrSql.strSql);
      frmScript.ShowModal;
   finally
      frmScript.Destroy;
   end;
end;

procedure TfrmKardex.ibExportarHTMLClick(Sender: TObject);
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
//         dgPartidas.SaveToHTML(FileName, TRUE);
  end;
  SaveDialog.Destroy;
end;

procedure TfrmKardex.ibExportarXMLClick(Sender: TObject);
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
//         dgPartidas.SaveToXML(FileName, TRUE);
  end;
  SaveDialog.Destroy;
end;

procedure TfrmKardex.sbBorrarMonedaClick(Sender: TObject);
begin
   cbMonedas.KeyValue := 0;
   cbMonedas.KeyValue := 0;
end;

end.
