unit capturar_base_sujetos;

interface

uses                  
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, ImgList,  Db,

    StdCtrls, ComCtrls,  IBX.IBStoredProc, IBX.IBTable,
   IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls, Mask,
   jpeg,  ExtCtrls,  ExtDlgs,
  Menus, Buttons,
     Grids, DBGrids, System.ImageList;

type
  TfrmCapturar_base_sujetos = class(TfrmCapturarMDI)
    TSujetos: TIBTable;
    dsSujetos: TDataSource;
    TSujetosID: TIntegerField;
    TSujetosCLAVE: TIBStringField;
    TSujetosNOMBRE: TIBStringField;
    TSujetosRAZON_SOCIAL: TIBStringField;
    TSujetosRFC: TIBStringField;
    TSujetosCURP: TIBStringField;
    TSujetosDOMICILIO: TIntegerField;
    TSujetosTELEFONOS: TIntegerField;
    TSujetosCONTACTOS: TIntegerField;
    TSujetosFECHA_ALTA: TDateTimeField;
    TSujetosFACTURAR_A: TIBStringField;
    TSujetosE_MAIL: TIBStringField;
    TSujetosWWWW: TIBStringField;
    TSujetosOBSERVACIONES: TBlobField;
    TSujetosSEXO: TIBStringField;
    TSujetosFOTO: TBlobField;
    TTelefonos: TIBTable;
    dsTelefonos: TDataSource;
    TTelefonosID: TIntegerField;
    TTelefonosPERTENECE: TIntegerField;
    TTelefonosTELEFONO: TIBStringField;
    TTelefonosES_FAX: TIBStringField;
    TDomicilios: TIBTable;
    dsDomicilios: TDataSource;
    TDomiciliosID: TIntegerField;
    TDomiciliosCALLE: TIBStringField;
    TDomiciliosENTRE_CALLE: TIBStringField;
    TDomiciliosY_CALLE: TIBStringField;
    TDomiciliosNUM_EXT: TIBStringField;
    TDomiciliosNUM_INT: TIBStringField;
    TDomiciliosLETRA: TIBStringField;
    TDomiciliosCP: TIBStringField;
    TDomiciliosCOLONIA: TIBStringField;
    TDomiciliosCIUDAD: TIntegerField;
    TDomiciliosZONA: TIBStringField;
    TContactos: TIBTable;
    dsContactos: TDataSource;
    TContactosID: TIntegerField;
    TContactosPERTENECE: TIntegerField;
    TContactosNOMBRE: TIBStringField;
    TContactosPUESTO: TIBStringField;
    TContactosDESDE: TDateTimeField;
    TContactosTELEFONOS: TIntegerField;
    TContactosE_MAIL: TIBStringField;
    TContactosWWW: TIBStringField;
    TTelefonosContactos: TIBTable;
    dsTelefonosContactos: TDataSource;
    TTelefonosContactosID: TIntegerField;
    TTelefonosContactosPERTENECE: TIntegerField;
    TTelefonosContactosTELEFONO: TIBStringField;
    TTelefonosContactosES_FAX: TIBStringField;
    qyCiudades: TIBQuery;
    dsCiudades: TDataSource;
    qyCiudadesR_ID: TIntegerField;
    qyCiudadesR_DESCRIPCION: TIBStringField;
    TDomiciliosdescripcion_ciudad: TStringField;
    spIDContactos: TIBStoredProc;
    fpMasDatos: TPanel;
    fpMasDatoDentro: TPanel;
    pcSujetos: TPageControl;
    tsDatos: TTabSheet;
    fpDatos: TPanel;
    Label1: TLabel;
    Label3: TLabel;
    Label9: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label6: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    deFechaAlta: TDBEdit;
    deClave: TDBEdit;
    deNombre: TDBEdit;
    peFacturar: TDBComboBox;
    peSexo: TDBComboBox;
    deRazon: TDBEdit;
    deRFC: TDBEdit;
    deCURP: TDBEdit;
    dmObservaciones: TDBMemo;
    deCTelefono: TDBEdit;
    dgTelefonos: TDBGrid;
    ibAdd: TBitBtn;
    ibDel: TBitBtn;
    ibCanc: TBitBtn;
    ibAcep: TBitBtn;
    deWeb: TDBEdit;
    deEMail: TDBEdit;
    tsDomicilio: TTabSheet;
    fpDomicilio: TPanel;
    laCalle: TLabel;
    laEntreCalle: TLabel;
    laYCalle: TLabel;
    laColonia: TLabel;
    laCP: TLabel;
    laLetra: TLabel;
    laNumInt: TLabel;
    laNumExt: TLabel;
    laCiudad: TLabel;
    laZona: TLabel;
    deCalle: TDBEdit;
    deEntreCalle: TDBEdit;
    deYCalle: TDBEdit;
    deColonia: TDBEdit;
    deCP: TDBEdit;
    deLetra: TDBEdit;
    deNumInt: TDBEdit;
    deNumExt: TDBEdit;
    leCiudades: TDBLookupComboBox;
    tsContactos: TTabSheet;
    paContactos: TPanel;
    laNombreContacto: TLabel;
    laDesdeContacto: TLabel;
    laFaxContacto: TLabel;
    laTelefonoContacto: TLabel;
    laPuestoContacto: TLabel;
    lsEMailContacto: TLabel;
    laWebContacto: TLabel;
    deNombreContactos: TDBEdit;
    deDesdeContactos: TDBEdit;
    ibAddTelefonos: TBitBtn;
    ibDelTelefonos: TBitBtn;
    ibCancTelefonos: TBitBtn;
    ibAcepTelefonos: TBitBtn;
    dgTelefonosContactos: TDBGrid;
    deTelefonoContactos: TDBEdit;
    ceFaxContactos: TDBCheckBox;
    dePuestoContactos: TDBEdit;
    leWWWContactos: TDBEdit;
    deEMailContactos: TDBEdit;
    fpContacto: TPanel;
    fpContactos: TPanel;
    ibNuevoContactos: TBitBtn;
    ibModificarContactos: TBitBtn;
    ibGuardarContactos: TBitBtn;
    ibCancelarContactos: TBitBtn;
    ibEliminarContactos: TBitBtn;
    fpContactosDetalle: TPanel;
    dgContactos: TDBGrid;
    ilImagenes: TImageList;
    opImagen: TOpenPictureDialog;
    pmImagen: TPopupMenu;
    Cargar1: TMenuItem;
    Limpiar1: TMenuItem;
    sbRefreshCiudad: TSpeedButton;
    laClave: TBitBtn;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    paFoto: TPanel;
    imFoto: TImage;
    spDAME_TEL_PRINCIPAL: TIBStoredProc;
    TSujetosTEL_PRINCIPAL: TIBStringField;
    TSujetosCUENTA: TIntegerField;
    laCtaContable: TLabel;
    cbCtasContables: TDBLookupComboBox;
    buActCtas: TBitBtn;
    buLimCtas: TBitBtn;
    qyCuentas: TIBQuery;
    dsCuentas: TDataSource;
    cbZonas: TDBLookupComboBox;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qyZonas_: TIBQuery;
    dsZonas_: TDataSource;
    TDomiciliosZONA_: TIntegerField;
    TTelefonosTIPO: TIntegerField;
    qyTelefonosTipos: TIBQuery;
    dsTelefonosTipos: TDataSource;
    qyTelefonosTiposID: TIntegerField;
    qyTelefonosTiposTIPO: TIBStringField;
    sbRefreshTelefonosTipos: TSpeedButton;
    cbTelefonosTipos: TDBLookupComboBox;
    laTelefonoTipo: TLabel;
    TTelefonostipo_n: TStringField;
    TSujetosSEP_NOMBRE: TIBStringField;
    TSujetosSEP_APATERNO: TIBStringField;
    TSujetosSEP_AMATERNO: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure ibAddClick(Sender: TObject);
    procedure ibDelClick(Sender: TObject);
    procedure ibCancClick(Sender: TObject);
    procedure ibAcepClick(Sender: TObject);
    procedure dsTelefonosDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoContactosClick(Sender: TObject);
    procedure ibModificarContactosClick(Sender: TObject);
    procedure dsContactosDataChange(Sender: TObject; Field: TField);
    procedure dsTelefonosContactosDataChange(Sender: TObject;
      Field: TField);
    procedure ibGuardarContactosClick(Sender: TObject);
    procedure ibCancelarContactosClick(Sender: TObject);
    procedure ibEliminarContactosClick(Sender: TObject);
    procedure ibAddTelefonosClick(Sender: TObject);
    procedure ibDelTelefonosClick(Sender: TObject);
    procedure ibCancTelefonosClick(Sender: TObject);
    procedure ibAcepTelefonosClick(Sender: TObject);
    procedure TTelefonosAfterInsert(DataSet: TDataSet);
    procedure TTelefonosContactosAfterInsert(DataSet: TDataSet);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoClick(Sender: TObject);
    procedure tsContactosShow(Sender: TObject);
    procedure Cargar1Click(Sender: TObject);
    procedure Limpiar1Click(Sender: TObject);
    procedure deFechaAltaDateChange(Sender: TObject);
    procedure TSujetosAfterEdit(DataSet: TDataSet);
    procedure ibCancelarClick(Sender: TObject);
    procedure sbRefreshCiudadClick(Sender: TObject);
    procedure TCapturarAfterEdit(DataSet: TDataSet);
    procedure laClaveClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure imFotoDblClick(Sender: TObject);
    procedure TTelefonosAfterPost(DataSet: TDataSet);
    procedure TTelefonosAfterDelete(DataSet: TDataSet);
    procedure buActCtasClick(Sender: TObject);
    procedure buLimCtasClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure sbRefreshTelefonosTiposClick(Sender: TObject);
    procedure TTelefonosCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    tmFotoH  : integer;
    tmFotoW  : integer;
    procedure foto;
    procedure load;
  protected
    procedure borrar; override;
    procedure valores; virtual;
  public
    { Public declarations }
  end;

var
  frmCapturar_base_sujetos: TfrmCapturar_base_sujetos;

implementation

uses IBModulo, reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmCapturar_base_sujetos.foto;
begin
   paFoto.Height := tmFotoH;
   paFoto.Width  := tmFotoW;

   imFoto.AutoSize  := false;
   imFoto.Align     := alClient;
  // imFoto.DrawStyle := dsProportional;
end;

procedure TfrmCapturar_base_sujetos.load;
begin
   reglas.imagenVer(dsSujetos, 'FOTO', imFoto);
   foto;
end;

procedure TfrmCapturar_base_sujetos.valores;
begin
   //para inicializar valores en clase derivada.
end;

procedure TfrmCapturar_base_sujetos.borrar;
begin
   TSujetos.Delete;
   TSujetos.Transaction.CommitRetaining;
   if TCapturar.DataSource.DataSet <> nil then
   begin
      TIBQuery(TCapturar.DataSource.DataSet).Close;
      TIBQuery(TCapturar.DataSource.DataSet).Open;
   end;
end;

procedure TfrmCapturar_base_sujetos.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(dmIBData.TFiltroTelefonosTipos);
  reglas.abrir_IBTabla(TSujetos);
  reglas.abrir_IBTabla(TTelefonos);
  reglas.abrir_IBTabla(TDomicilios);
  reglas.refresh_IBQuery(qyCiudades);
  reglas.refresh_IBQuery(qyCuentas);
  reglas.refresh_IBQuery(qyZonas_);
  reglas.refresh_IBQuery(qyTelefonosTipos);

  //fpContacto.FoldStatus         := fsCollapsed;
 // fpContactosDetalle.FoldStatus := fsCollapsed;
  pcSujetos.ActivePage := tsDatos;
  
  tmFotoH  := paFoto.Height;
  tmFotoW  := paFoto.Width;
end;

procedure TfrmCapturar_base_sujetos.ibModificarClick(Sender: TObject);
begin
  inherited;
{  TSujetos.Edit;
  TDomicilios.Edit;}
  case pcSujetos.ActivePageIndex of
     0 : deClave.SetFocus;
     1 : deCalle.SetFocus;
  end;
end;

procedure TfrmCapturar_base_sujetos.ibAddClick(Sender: TObject);
begin
  inherited;
  dsTelefonos.DataSet.Insert;
  dsTelefonos.DataSet.FieldByName('PERTENECE').AsInteger := dsSujetos.DataSet.FieldByName('TELEFONOS').AsInteger;
end;

procedure TfrmCapturar_base_sujetos.ibDelClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     dsTelefonos.DataSet.Delete;
     TTelefonos.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_base_sujetos.ibCancClick(Sender: TObject);
begin
  inherited;
  dsTelefonos.DataSet.Cancel;
end;

procedure TfrmCapturar_base_sujetos.ibAcepClick(Sender: TObject);
begin
  inherited;
  dsTelefonos.DataSet.Post;
  TTelefonos.Transaction.CommitRetaining;
end;

procedure TfrmCapturar_base_sujetos.dsTelefonosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsTelefonos.DataSet <> nil then
  begin
     ibAdd.Enabled  := (TDataSource(Sender).DataSet.State = dsBrowse) and (dsSujetos.DataSet.State = dsEdit);
     ibDel.Enabled  := (TDataSource(Sender).DataSet.State = dsBrowse) and not(TDataSource(Sender).DataSet.IsEmpty);
     ibCanc.Enabled := TDataSource(Sender).DataSet.State in [dsInsert, dsEdit];
     ibAcep.Enabled := TDataSource(Sender).DataSet.State in [dsInsert, dsEdit];
  end;
end;

procedure TfrmCapturar_base_sujetos.ibNuevoContactosClick(Sender: TObject);
begin
  inherited;
  TContactos.Insert;
  spIDContactos.ExecProc;
  TContactos.FieldByName('ID').AsInteger     := spIDContactos.ParamByName('R_ID').AsInteger;
  TContactos.FieldByName('DESDE').AsDateTime := reglas.dame_fecha;
  deNombreContactos.SetFocus;
end;

procedure TfrmCapturar_base_sujetos.ibModificarContactosClick(
  Sender: TObject);
begin
  inherited;
  TContactos.Edit;
  deNombreContactos.SetFocus;
end;

procedure TfrmCapturar_base_sujetos.dsContactosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if TDataSource(sender).DataSet <> nil then
  begin
    ibNuevoContactos.Enabled     := (TDataSource(sender).DataSet.State = dsBrowse) and not(dsSujetos.DataSet.IsEmpty);
    ibModificarContactos.Enabled := (TDataSource(sender).DataSet.State = dsBrowse) and not(TDataSource(sender).DataSet.IsEmpty);
    ibGuardarContactos.Enabled   := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
    ibCancelarContactos.Enabled  := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
    ibEliminarContactos.Enabled  := (TDataSource(sender).DataSet.State = dsBrowse) and not(TDataSource(sender).DataSet.IsEmpty);
    paContactos.Enabled          := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
    deTelefonoContactos.Enabled  := (TDataSource(sender).DataSet.State in [dsEdit, dsBrowse]);
    ceFaxContactos.Enabled       := (TDataSource(sender).DataSet.State in [dsEdit, dsBrowse]);
    dgTelefonosContactos.Enabled := (TDataSource(sender).DataSet.State in [dsEdit, dsBrowse]);
  end;
end;

procedure TfrmCapturar_base_sujetos.dsTelefonosContactosDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsTelefonosContactos.DataSet <> nil then
  begin
     ibAddTelefonos.Enabled  := (TDataSource(Sender).DataSet.State = dsBrowse) and (dsContactos.DataSet.State = dsEdit);
     ibDelTelefonos.Enabled  := (TDataSource(Sender).DataSet.State = dsBrowse) and not(TDataSource(Sender).DataSet.IsEmpty);
     ibCancTelefonos.Enabled := TDataSource(Sender).DataSet.State in [dsInsert, dsEdit];
     ibAcepTelefonos.Enabled := TDataSource(Sender).DataSet.State in [dsInsert, dsEdit];
  end;
end;

procedure TfrmCapturar_base_sujetos.ibGuardarContactosClick(
  Sender: TObject);
var
   estado : TDataSetState;
begin
  inherited;
  estado := dsContactos.DataSet.State;
  dsContactos.DataSet.FieldByName('DESDE').AsDateTime := StrToDateTime(deDesdeContactos.Text) + time;
  TContactos.Post;
  TContactos.Transaction.CommitRetaining;
  if estado = dsInsert then
     reglas.abrir_IBTabla(TContactos);
end;

procedure TfrmCapturar_base_sujetos.ibCancelarContactosClick(
  Sender: TObject);
begin
  inherited;
  TContactos.Cancel;
end;

procedure TfrmCapturar_base_sujetos.ibEliminarContactosClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     TContactos.Delete;
     TContactos.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_base_sujetos.ibAddTelefonosClick(Sender: TObject);
begin
  inherited;
  dsTelefonosContactos.DataSet.Insert;
end;

procedure TfrmCapturar_base_sujetos.ibDelTelefonosClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar registro ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     dsTelefonosContactos.DataSet.Delete;
     TTelefonosContactos.Transaction.CommitRetaining;
  end;
end;

procedure TfrmCapturar_base_sujetos.ibCancTelefonosClick(Sender: TObject);
begin
  inherited;
  dsTelefonosContactos.DataSet.Cancel;
end;

procedure TfrmCapturar_base_sujetos.ibAcepTelefonosClick(Sender: TObject);
begin
  inherited;
  dsTelefonosContactos.DataSet.Post;
  TTelefonosContactos.Transaction.CommitRetaining;
end;

procedure TfrmCapturar_base_sujetos.TTelefonosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  dsTelefonos.DataSet.FieldByName('ES_FAX').AsString := 'No';
  deCTelefono.SetFocus;
end;

procedure TfrmCapturar_base_sujetos.TTelefonosContactosAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  dsTelefonosContactos.DataSet.FieldByName('PERTENECE').AsInteger := dsContactos.DataSet.FieldByName('TELEFONOS').AsInteger;
  dsTelefonosContactos.DataSet.FieldByName('ES_FAX').AsString     := 'No';
  deTelefonoContactos.SetFocus;
end;

procedure TfrmCapturar_base_sujetos.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     paLienzo.Enabled        := TRUE;
     tsDatos.Enabled         := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
     tsDomicilio.Enabled     := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
     fpMasDatoDentro.Enabled := (TDataSource(sender).DataSet.State in [dsInsert, dsEdit]);
  end;
end;

procedure TfrmCapturar_base_sujetos.ibNuevoClick(Sender: TObject);
begin
  inherited;
  pcSujetos.ActivePage := tsDatos;
  valores;
  ibGuardar.Click;
  ibModificar.Click;
  //limpiar imagen al agregar un nuevo registro.
  reglas.imagenVer(dsSujetos, 'FOTO', imFoto);
  foto;
  dsSujetos.DataSet.FieldByName('FACTURAR_A').AsString := 'Nombre';
end;

procedure TfrmCapturar_base_sujetos.tsContactosShow(Sender: TObject);
begin
  inherited;
  if TContactos.State = dsInactive then
  begin
    reglas.abrir_IBTabla(TContactos);
    reglas.abrir_IBTabla(TTelefonosContactos);
  end;
end;

procedure TfrmCapturar_base_sujetos.Cargar1Click(Sender: TObject);
var
   grabar : boolean;
begin
  inherited;
  if  not(dsSujetos.DataSet.IsEmpty) then
  begin
     if opImagen.Execute then
     begin
        grabar := dsSujetos.DataSet.State = dsBrowse;
        if grabar then
           dsSujetos.DataSet.Edit;
        reglas.imagenGuardar(dsSujetos, opImagen.FileName, 'FOTO', imFoto);
        if grabar then
           dsSujetos.DataSet.Post;
     end;
  end;
end;

procedure TfrmCapturar_base_sujetos.Limpiar1Click(Sender: TObject);
begin
  inherited;
  if not(dsFuente.DataSet.IsEmpty) then
  begin
     dsSujetos.DataSet.Edit;
     dsSujetos.DataSet.FieldByName('FOTO').AsVariant := 0;
     dsSujetos.DataSet.Post;
     //limpiar imagen al agregar un nuevo registro.
     reglas.imagenVer(dsSujetos, 'FOTO', imFoto);
     foto;
     dsSujetos.DataSet.Edit;
  end;
end;

procedure TfrmCapturar_base_sujetos.deFechaAltaDateChange(Sender: TObject);
begin
  inherited;
  dsSujetos.DataSet.FieldByName('FECHA_ALTA').AsDateTime := StrToDateTime(deFechaAlta.Text) + time;
end;

procedure TfrmCapturar_base_sujetos.TSujetosAfterEdit(DataSet: TDataSet);
begin
  inherited;
  TDomicilios.Edit;
end;

procedure TfrmCapturar_base_sujetos.ibCancelarClick(Sender: TObject);
begin
  TDomicilios.Cancel;
  TSujetos.Cancel;
  inherited;
end;

procedure TfrmCapturar_base_sujetos.sbRefreshCiudadClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyCiudades);
end;

procedure TfrmCapturar_base_sujetos.TCapturarAfterEdit(DataSet: TDataSet);
begin
  inherited;
  TSujetos.Edit;
end;

procedure TfrmCapturar_base_sujetos.laClaveClick(Sender: TObject);
var
   tmp  : string;
   sc   : integer;
   i    : integer;
begin
  inherited;
  sc := 0;
  tmp := UpperCase(Self.Caption);
  for i := 0 to length(tmp) do
     sc := sc + ord(tmp[i]);
  spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := sc;
  spAUTO_FOLIO.ExecProc;
  spAUTO_FOLIO.Transaction.CommitRetaining;
  {
  idClave.Entrada := spAUTO_FOLIO.ParamByName('R_FOLIO').AsString;
  idClave.Execute;
  if idClave.Respuesta and (idClave.Entrada <> '') then
  begin
     //Longitud claves automaticas
     reglas.abrir_IBTabla(dmIBData.TPreferencias);
     dmIBData.TPreferencias.Filter := 'ID = 98';
     if idClave.Entrada <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsString then
     begin
        spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger   := sc;
        spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsString := idClave.Entrada;
        spMODIFICAR_FOLIO.ExecProc;
        spMODIFICAR_FOLIO.Transaction.CommitRetaining;
     end;
     dsSujetos.DataSet.FieldByName('CLAVE').AsString := reglas.rellenar(StrToInt(idClave.Entrada), dmIBData.TPreferencias.FieldByName('VALOR').AsInteger);
  end;
  }
end;

procedure TfrmCapturar_base_sujetos.buInicioClick(Sender: TObject);
begin
  inherited;
  load;
end;

procedure TfrmCapturar_base_sujetos.buAnteriorClick(Sender: TObject);
begin
  inherited;
  load;
end;

procedure TfrmCapturar_base_sujetos.buSiguienteClick(Sender: TObject);
begin
  inherited;
  load;
end;

procedure TfrmCapturar_base_sujetos.buFinClick(Sender: TObject);
begin
  inherited;
  load;
end;

procedure TfrmCapturar_base_sujetos.FormActivate(Sender: TObject);
begin
  inherited;
  Load;
end;

procedure TfrmCapturar_base_sujetos.imFotoDblClick(Sender: TObject);
begin
  inherited;
  if tmFotoH = paFoto.Height then
  begin
     imFoto.Align     := alNone;
     //imFoto.DrawStyle := dsNormal;
     imFoto.AutoSize  := true;

     paFoto.Height    := imFoto.Height + 4;
     paFoto.Width     := imFoto.Width + 4;
     paFoto.BringToFront;
  end
  else
     foto;
end;

procedure TfrmCapturar_base_sujetos.TTelefonosAfterPost(DataSet: TDataSet);
begin
  inherited;
  spDAME_TEL_PRINCIPAL.ParamByName('P_ID').AsInteger := dsSujetos.DataSet.FieldByName('ID').AsInteger;
  spDAME_TEL_PRINCIPAL.ExecProc;
  dsSujetos.DataSet.FieldByName('TEL_PRINCIPAL').AsString := spDAME_TEL_PRINCIPAL.ParamByName('R_TELEFONO').AsString;
end;

procedure TfrmCapturar_base_sujetos.TTelefonosAfterDelete(
  DataSet: TDataSet);
begin
  inherited;
  spDAME_TEL_PRINCIPAL.ParamByName('P_ID').AsInteger := dsSujetos.DataSet.FieldByName('ID').AsInteger;
  spDAME_TEL_PRINCIPAL.ExecProc;
  dsSujetos.DataSet.FieldByName('TEL_PRINCIPAL').AsString := spDAME_TEL_PRINCIPAL.ParamByName('R_TELEFONO').AsString;
end;

procedure TfrmCapturar_base_sujetos.buActCtasClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyCuentas);
end;

procedure TfrmCapturar_base_sujetos.buLimCtasClick(Sender: TObject);
begin
  inherited;
  dsSujetos.DataSet.FieldByName('CUENTA').AsVariant := 0;
end;

procedure TfrmCapturar_base_sujetos.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyZonas_);
end;

procedure TfrmCapturar_base_sujetos.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dsDomicilios.DataSet.FieldByName('ZONA_').AsVariant := 0;
end;

procedure TfrmCapturar_base_sujetos.sbRefreshTelefonosTiposClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyTelefonosTipos);
end;

procedure TfrmCapturar_base_sujetos.TTelefonosCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('tipo_n').AsString := '';
  if DataSet.FieldByName('TIPO').AsString <> '' then
  begin
     dmIBData.TFiltroTelefonosTipos.Filter  := 'ID = '+DataSet.FieldByName('TIPO').AsString;
     DataSet.FieldByName('tipo_n').AsString := dmIBData.TFiltroTelefonosTipos.FieldByName('TIPO').AsString;
  end;
end;

end.
