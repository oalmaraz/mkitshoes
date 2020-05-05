unit capturar_nombre_lista_precios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, DBCtrls, StdCtrls, Mask,    jpeg,
   ExtCtrls, Buttons, Grids, DBGrids, Menus, ImgList,  ComCtrls,
  System.ImageList;

type
  TfrmCapturar_nombre_lista_precios = class(TfrmCapturarMDI)
    Label1: TLabel;
    Label2: TLabel;
    deDescripcion: TDBEdit;
    ceVigencia: TDBEdit;
    TCapturarID: TIntegerField;
    TCapturarDESCRIPCION: TIBStringField;
    TCapturarVIGENCIA_DIAS: TIntegerField;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_NOMBRE_LISTA_PRECIO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_MATERIAL_CLAVE: TIBStringField;
    qyPartidasR_MATERIAL_DESCRIPCION: TIBStringField;
    qyPartidasR_MATERIAL_UNIDAD_BASE: TIntegerField;
    qyPartidasR_MATERIAL_UNIDAD_DESC: TIBStringField;
    qyPartidasR_FECHA: TDateTimeField;
    qyPartidasR_PRECIO_MINIMO: TFloatField;
    qyPartidasR_PRECIO_MAXIMO: TFloatField;
    dsDetalle: TDataSource;
    TDetalle: TIBTable;
    TDetalleID: TIntegerField;
    TDetalleNOMBRE_LISTA_PRECIO: TIntegerField;
    TDetalleMATERIAL: TIntegerField;
    TDetalleFECHA: TDateTimeField;
    TDetallePRECIO_MINIMO: TFloatField;
    TDetallePRECIO_MAXIMO: TFloatField;
    TDetalledescripcion_material: TStringField;
    spID2: TIBStoredProc;
    spDEL_PARTIDA_LISTA_PRECIOS: TIBStoredProc;
    pcPrecios: TPageControl;
    tsListaDePrecios: TTabSheet;
    tsClientesExtensiones: TTabSheet;
    fpCaptura: TPanel;
    ibModificarPartida: TBitBtn;
    ibGuardarPartida: TBitBtn;
    ibCancelarPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    ibNuevaPartida: TBitBtn;
    paCaptura: TPanel;
    dgPartidas: TDBGrid;
    fpUnidades: TPanel;
    dgExtensiones: TDBGrid;
    ibExtensionNueva: TBitBtn;
    ibExtensionEliminar: TBitBtn;
    qyExtensiones: TIBQuery;
    dsExtensiones: TDataSource;
    qyUsuarios: TIBQuery;
    qyUsuariosR_ID: TIntegerField;
    qyUsuariosR_NOMBRE: TIBStringField;
    qyUsuariosR_BAJA: TIBStringField;
    dsUsuarios: TDataSource;
    qyExtensionesR_ID: TIntegerField;
    qyExtensionesR_CLIENTE_EXTENSION: TIntegerField;
    qyExtensionesR_CLAVE: TIBStringField;
    qyExtensionesR_NOMBRE: TIBStringField;
    spDel: TIBStoredProc;
    Label5: TLabel;
    spGENERAR_VIGENCIA: TIBStoredProc;
    spELIMINAR_VIGENCIA: TIBStoredProc;
    spCOPIAR_VIGENCIA: TIBStoredProc;
    ibVigencia: TBitBtn;
    ibCopia: TBitBtn;
    ibBuscar: TBitBtn;
    ibLimpiarFecha: TBitBtn;
    ibEliminarFecha: TBitBtn;
    Label4: TLabel;
    qyPartidasR_USUARIO: TIntegerField;
    qyPartidasR_USUARIO_NOMBRE: TIBStringField;
    TDetalleUSUARIO: TIntegerField;
    ilImagenes: TImageList;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    ModificarPartida1: TMenuItem;
    GuardarPartida1: TMenuItem;
    CancelarPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    qyPartidasR_INCLUIR: TIBStringField;
    TDetalleINCLUIR: TIBStringField;
    paMaterial: TPanel;
    Label6: TLabel;
    edClave: TEdit;
    Label9: TLabel;
    deFecha: TDBEdit;
    Label14: TLabel;
    cePrecio_Minimo: TDBEdit;
    cePrecio_Maximo: TDBEdit;
    Label3: TLabel;
    paDescripcion: TPanel;
    Label22: TLabel;
    edDescripcion: TEdit;
    cbIncluir: TDBCheckBox;
    dsMateriales: TDataSource;
    qyIBXMateriales: TIBQuery;
    qyIBXMaterialesID: TIntegerField;
    qyIBXMaterialesCLAVE: TIBStringField;
    qyIBXMaterialesDESCRIPCION: TIBStringField;
    qyIBXMaterialesUNIDAD_BASE: TIntegerField;
    qyIBXMaterialesLINEA: TIntegerField;
    qyIBXMaterialesUNIDADES_COMPRADAS: TFloatField;
    qyIBXMaterialesUNIDADES_VENDIDAS: TFloatField;
    qyIBXMaterialesUNIDADES_PRODUCIDAS: TFloatField;
    qyIBXMaterialesLARGO: TFloatField;
    qyIBXMaterialesANCHO: TFloatField;
    qyIBXMaterialesALTO: TFloatField;
    qyIBXMaterialesUNIDAD_LAA: TIntegerField;
    qyIBXMaterialesLOTE: TIBStringField;
    qyIBXMaterialesNUM_SERIE: TIBStringField;
    qyIBXMaterialesCONSOLIDADO: TIBStringField;
    qyIBXMaterialesCOSTO_PROMEDIO: TIBStringField;
    qyIBXMaterialesCOSTO_PEPS: TIBStringField;
    qyIBXMaterialesCOSTO_UEPS: TIBStringField;
    qyIBXMaterialesFECHA_CERO_EXIST: TDateTimeField;
    qyIBXMaterialesFECHA_ULTIMA_COMPRA: TDateTimeField;
    qyIBXMaterialesCODIGO_BARRAS: TIBStringField;
    qyIBXMaterialesIVA_PORC: TFloatField;
    qyIBXMaterialesIEPS_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_1_PORC: TFloatField;
    qyIBXMaterialesIMPUESTO_2_PORC: TFloatField;
    qyIBXMaterialesOBSERVACIONES: TBlobField;
    qyIBXMaterialesFOTO: TBlobField;
    qyIBXMaterialesDIAS_DE_VIGENCIA: TIntegerField;
    qyIBXMaterialesCOSTO_ULT_COMPRA: TFloatField;
    qyIBXMaterialesNUM_ETIQUETAS: TIntegerField;
    qyIBXMaterialesACTIVO_FIJO: TIBStringField;
    qyIBXMaterialesCALIDAD: TIntegerField;
    sbRefreshUsuarios: TSpeedButton;
    sbDel: TSpeedButton;
    TDetalleESTATUS: TIBStringField;
    edFecha: TDateTimePicker;
    cbUsuarios: TDBLookupComboBox;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibModificarPartidaClick(Sender: TObject);
    procedure ibGuardarPartidaClick(Sender: TObject);
    procedure ibCancelarPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibExtensionNuevaClick(Sender: TObject);
    procedure ibExtensionEliminarClick(Sender: TObject);
    procedure dsPartidasDataChange(Sender: TObject;
      Field: TField);
    procedure ibVigenciaClick(Sender: TObject);
    procedure ibCopiaClick(Sender: TObject);
    procedure ibBuscarClick(Sender: TObject);
    procedure ibLimpiarFechaClick(Sender: TObject);
    procedure ibEliminarFechaClick(Sender: TObject);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure ModificarPartida1Click(Sender: TObject);
    procedure GuardarPartida1Click(Sender: TObject);
    procedure CancelarPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure paCapturaEnter(Sender: TObject);
    procedure edClaveButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure edClaveKeyPress(Sender: TObject; var Key: Char);
    procedure ibGuardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure deFechaEnter(Sender: TObject);
    procedure sbRefreshUsuariosClick(Sender: TObject);
    procedure sbDelClick(Sender: TObject);
    procedure cePrecio_MaximoEnter(Sender: TObject);
  private
    { Private declarations }
    edicionDetalle : boolean;//<-valida los botones
    procedure fijarBotonesDetalle;
  public
    { Public declarations }
  end;

var
  frmCapturar_nombre_lista_precios: TfrmCapturar_nombre_lista_precios;

implementation

uses IBModulo, explorar_nombre_lista_precios, IBData, reglas_de_negocios,
  seleccionar_material, seleccionar_extensiones, PRN_0023_Lista_Precios,
  UfrmAltaRapidaMateriales;

{$R *.DFM}

procedure TfrmCapturar_nombre_lista_precios.fijarBotonesDetalle;
begin
  ibNuevaPartida.Enabled     := not edicionDetalle;
  ibModificarPartida.Enabled := not edicionDetalle and not(dsPartidas.DataSet.IsEmpty);
  ibEliminarPartida.Enabled  := not edicionDetalle and not(dsPartidas.DataSet.IsEmpty);
  ibGuardarPartida.Enabled   := edicionDetalle;
  ibCancelarPartida.Enabled  := edicionDetalle;
  paCaptura.Visible          := edicionDetalle;
end;

procedure TfrmCapturar_nombre_lista_precios.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('VIGENCIA_DIAS').AsInteger := 0;
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_nombre_lista_precios.ibModificarClick(
  Sender: TObject);
begin
  inherited;
  deDescripcion.SetFocus;
end;

procedure TfrmCapturar_nombre_lista_precios.dsFuenteDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     ibVigencia.Enabled      := (dsFuente.DataSet.State = dsBrowse) and not(dsFuente.DataSet.IsEmpty);
     ibCopia.Enabled         := (dsFuente.DataSet.State = dsBrowse) and not(dsFuente.DataSet.IsEmpty);
     ibBuscar.Enabled        := (dsFuente.DataSet.State = dsBrowse) and not(dsFuente.DataSet.IsEmpty);
     ibLimpiarFecha.Enabled  := (dsFuente.DataSet.State = dsBrowse) and not(dsFuente.DataSet.IsEmpty);
     ibEliminarFecha.Enabled := (dsFuente.DataSet.State = dsBrowse) and not(dsFuente.DataSet.IsEmpty);
     
     qyPartidas.Close;
     qyPartidas.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyPartidas.ParamByName('P_FECHA').AsString       := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     qyPartidas.ParamByName('P_FILTRAR').AsString     := 'Si';
     qyPartidas.Open;
     FijarBotonesDetalle;
     dgPartidas.DataSource.DataSet.First;
     

     qyExtensiones.Close;
     qyExtensiones.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyExtensiones.Open;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.ibNuevaPartidaClick(
  Sender: TObject);
begin
  inherited;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
  edClave.Clear;
  edDescripcion.Clear;
  cbUsuarios.Keyvalue:=0;
  dmIBData.spFECHA_SERVIDOR.ExecProc;
  spID2.ExecProc;
  dsDetalle.DataSet.Insert;
  dsDetalle.DataSet.FieldByName('ID').AsInteger                  := spID2.ParamByName('R_ID').AsInteger;
  dsDetalle.DataSet.FieldByName('NOMBRE_LISTA_PRECIO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  dsDetalle.DataSet.FieldByName('FECHA').AsDateTime              := StrToDate(FormatDateTime('dd/mm/yyy',dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime));
  dsDetalle.DataSet.FieldByName('PRECIO_MINIMO').AsFloat         := 0.00;
  dsDetalle.DataSet.FieldByName('PRECIO_MAXIMO').AsFloat         := 0.00;
  dsDetalle.DataSet.FieldByName('INCLUIR').AsString              := 'No';
  dsDetalle.DataSet.FieldByName('ESTATUS').AsString              := 'Activo';
  edClave.SetFocus;
end;

procedure TfrmCapturar_nombre_lista_precios.ibModificarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     edicionDetalle := not edicionDetalle;
     fijarBotonesDetalle;
     TDetalle.Filter := 'ID = '+dsPartidas.DataSet.FieldByName('R_ID').AsString;
     dsDetalle.DataSet.Edit;
     edClave.Text              := dsPartidas.DataSet.FieldByName('R_MATERIAL_CLAVE').AsString;
     edDescripcion.Text        := dsPartidas.DataSet.FieldByName('R_MATERIAL_DESCRIPCION').AsString;
     cbUsuarios.KeyValue := dsPartidas.DataSet.FieldByName('R_USUARIO').AsInteger;
     cePrecio_Minimo.SetFocus;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.ibGuardarPartidaClick(
  Sender: TObject);
var
   fraccion   : Real;
   entero     : Real;
begin
  inherited;
   if deFecha.Focused then
      cePrecio_Minimo.SetFocus;
   entero   := Int(StrToDateTime(deFecha.Text));
   fraccion := Frac(StrToDateTime(deFecha.Text));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsDetalle.DataSet.FieldByName('FECHA').AsDateTime := StrToDateTime(deFecha.Text) + time;
   end;
   if (cbUsuarios.Text <> '') then
      dsDetalle.DataSet.FieldByName('USUARIO').AsInteger := cbUsuarios.KeyValue
   else
      dsDetalle.DataSet.FieldByName('USUARIO').AsVariant := 0;
  dsDetalle.DataSet.Post;
  TDetalle.Transaction.CommitRetaining;
  edicionDetalle := not edicionDetalle;
  FijarBotonesDetalle;
  reglas.abrir_IBQuery_seek('R_ID',dsDetalle.DataSet.FieldByName('ID').AsInteger,qyPartidas);
end;

procedure TfrmCapturar_nombre_lista_precios.ibCancelarPartidaClick(
  Sender: TObject);
begin
  inherited;
  dsDetalle.DataSet.Cancel;
  edicionDetalle := not edicionDetalle;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_nombre_lista_precios.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spDEL_PARTIDA_LISTA_PRECIOS.ParamByName('P_ID').AsInteger := qyPartidas.FieldByName('R_ID').AsInteger;
     spDEL_PARTIDA_LISTA_PRECIOS.ExecProc;
     spDEL_PARTIDA_LISTA_PRECIOS.Transaction.CommitRetaining;
     reglas.refresh_IBQuery(qyPartidas);
     fijarBotonesDetalle;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.FormCreate(Sender: TObject);
begin
  edFecha.Date := reglas.dame_fecha;
  inherited;
  reglas.refresh_IBQuery(qyPartidas);
  reglas.abrir_IBTabla(TDetalle);
end;

procedure TfrmCapturar_nombre_lista_precios.ibExtensionNuevaClick(
  Sender: TObject);
var
   pUno : TPoint;
   pDos : TPoint;
   y2   : integer;
begin
  inherited;
  pUno                                         := fpPadre.ClientToScreen(Point(0,0));
  pDos                                         := dgExtensiones.ClientToScreen(Point(0,0));
  y2                                           := pDos.y - pUno.y;
  pDos.x                                       := fpPadre.Width;
  pDos.y                                       := y2;
  frmSeleccionar_Extensiones                   := TfrmSeleccionar_Extensiones.Crear(Application, pUno, pDos, dsFuente.DataSet.FieldByName('ID').AsInteger, 1);
  frmSeleccionar_Extensiones.dsDestino.DataSet := qyExtensiones;
  frmSeleccionar_Extensiones.ShowModal;
  frmSeleccionar_Extensiones.Free;
end;

procedure TfrmCapturar_nombre_lista_precios.ibExtensionEliminarClick(
  Sender: TObject);
begin
  inherited;
  spDel.ParamByName('P_ID').AsInteger := dsExtensiones.DataSet.FieldByName('R_ID').AsInteger;
  spDel.ExecProc;
  spDel.Transaction.CommitRetaining;
  reglas.refresh_IBQuery(qyExtensiones);
end;

procedure TfrmCapturar_nombre_lista_precios.dsPartidasDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
{  if qyListaPreciosPartidas.IsEmpty then
     TLista_Precios.Filter := 'ID = 0'
  else
     TLista_Precios.Filter := 'ID = ' + qyListaPreciosPartidas.FieldByName('R_ID').AsString;}
end;

procedure TfrmCapturar_nombre_lista_precios.ibVigenciaClick(
  Sender: TObject);
begin
  inherited;
  if edFecha.DateTime <> 0 then
  begin
     spGENERAR_VIGENCIA.ParamByName('P_PADRE').AsInteger  := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spGENERAR_VIGENCIA.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     spGENERAR_VIGENCIA.ParamByName('P_DIAS').AsInteger   := dsFuente.DataSet.FieldByName('VIGENCIA_DIAS').AsInteger;
     spGENERAR_VIGENCIA.ExecProc;
     spGENERAR_VIGENCIA.Transaction.CommitRetaining;
     qyPartidas.Close;
     qyPartidas.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyPartidas.ParamByName('P_FECHA').AsString       := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     qyPartidas.ParamByName('P_FILTRAR').AsString     := 'Si';
     qyPartidas.Open;
     FijarBotonesDetalle;
     dgPartidas.DataSource.DataSet.First;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.ibCopiaClick(Sender: TObject);
begin
  inherited;
  if edFecha.DateTime <> 0 then
  begin
     spCOPIAR_VIGENCIA.ParamByName('P_PADRE').AsInteger  := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spCOPIAR_VIGENCIA.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     spCOPIAR_VIGENCIA.ExecProc;
     spCOPIAR_VIGENCIA.Transaction.CommitRetaining;
     edFecha.Date := reglas.dame_fecha;
     ibBuscar.Click;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.ibBuscarClick(Sender: TObject);
begin
  inherited;
  qyPartidas.Close;
  qyPartidas.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyPartidas.ParamByName('P_FECHA').AsString       := FormatDateTime('dd/mm/yyyy',edFecha.Date);
  qyPartidas.ParamByName('P_FILTRAR').AsString     := 'Si';
  qyPartidas.Open;
  FijarBotonesDetalle;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_nombre_lista_precios.ibLimpiarFechaClick(
  Sender: TObject);
begin
  inherited;
  edFecha.DateTime := 0;
  qyPartidas.Close;
  qyPartidas.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
  qyPartidas.ParamByName('P_FECHA').AsDateTime     := edFecha.Date + time;
  qyPartidas.ParamByName('P_FILTRAR').AsString     := 'No';
  qyPartidas.Open;
  FijarBotonesDetalle;
  dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmCapturar_nombre_lista_precios.ibEliminarFechaClick(
  Sender: TObject);
begin
  inherited;
  if MessageDlg('� Eliminar ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
  begin
     spELIMINAR_VIGENCIA.ParamByName('P_PADRE').AsInteger  := dsFuente.DataSet.FieldByName('ID').AsInteger;
     spELIMINAR_VIGENCIA.ParamByName('P_FECHA').AsString   := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     spELIMINAR_VIGENCIA.ExecProc;
     spELIMINAR_VIGENCIA.Transaction.CommitRetaining;
     qyPartidas.Close;
     qyPartidas.ParamByName('P_ENCABEZADO').AsInteger := dsFuente.DataSet.FieldByName('ID').AsInteger;
     qyPartidas.ParamByName('P_FECHA').AsString       := FormatDateTime('dd/mm/yyyy',edFecha.Date);
     qyPartidas.ParamByName('P_FILTRAR').AsString     := 'Si';
     qyPartidas.Open;
     FijarBotonesDetalle;
     dgPartidas.DataSource.DataSet.First;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.NuevaPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmCapturar_nombre_lista_precios.ModificarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibModificarPartida.Enabled then
     ibModificarPartida.Click;
end;

procedure TfrmCapturar_nombre_lista_precios.GuardarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibGuardarPartida.Enabled then
     ibGuardarPartida.Click;
end;

procedure TfrmCapturar_nombre_lista_precios.CancelarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibCancelarPartida.Enabled then
     ibCancelarPartida.Click;
end;

procedure TfrmCapturar_nombre_lista_precios.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmCapturar_nombre_lista_precios.ibImprimirClick(
  Sender: TObject);
var
   pnt : TPoint;
begin
  inherited;
  pnt := paLienzo.ClientToScreen(Point(0,0));
  frmPRN_0023_Lista_Precios := TfrmPRN_0023_Lista_Precios.Crear(Application, dsFuente.DataSet.FieldByName('ID').AsInteger, pnt);
  frmPRN_0023_Lista_Precios.ShowModal;
  frmPRN_0023_Lista_Precios.Free;
end;

procedure TfrmCapturar_nombre_lista_precios.paCapturaEnter(
  Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyUsuarios);
end;

procedure TfrmCapturar_nombre_lista_precios.edClaveButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   pnt : TPoint;
   tmpClave       : string;
   tmpDescripcion : string;
begin
  inherited;
  pnt := tsListaDePrecios.ClientToScreen(Point(0,0));
  frmSeleccionar_material := TfrmSeleccionar_material.Create(Application);
  frmSeleccionar_material.dsDestino.DataSet := TDetalle;
  frmSeleccionar_material.coordenadas(pnt.y, pnt.x, tsListaDePrecios.width, tsListaDePrecios.Height);
  frmSeleccionar_material.ShowModal;
  tmpClave       := frmSeleccionar_material.dameClave;
  tmpDescripcion := frmSeleccionar_material.dameDescripcion;
  frmSeleccionar_material.Free;
  if dsDetalle.DataSet.FieldByName('MATERIAL').AsString <> '' then
  begin
     edClave.Text       := tmpClave;
     edDescripcion.Text := tmpDescripcion;
  end;
end;

procedure TfrmCapturar_nombre_lista_precios.edClaveKeyPress(
  Sender: TObject; var Key: Char);
var
   AltaRapidaMaterial : TfrmAltaRapidaMateriales;
   tmpMaterial : integer;
   tmpClave : string;
   tmpDescripcion : string;
begin
  inherited;
  if (key = #13) and (edClave.Text <> '') then
  begin
     qyIBXMateriales.Close;
     qyIBXMateriales.ParamByName('P_CLAVE').AsString   := edClave.Text;
     qyIBXMateriales.Open;
     if not(qyIBXMateriales.IsEmpty) then
     begin
        edDescripcion.Text := qyIBXMateriales.FieldByName('DESCRIPCION').AsString;
        dsDetalle.DataSet.FieldByName('MATERIAL').AsInteger := qyIBXMateriales.FieldByName('ID').AsInteger;
     end
     else
        begin
           if MessageDlg('El material no existe.  �Desea agregarlo?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
           begin
              AltaRapidaMaterial := TfrmAltaRapidaMateriales.Create(Application);
              AltaRapidaMaterial.edClave.Text := edClave.Text;
              AltaRapidaMaterial.ShowModal;
              tmpMaterial    := AltaRapidaMaterial.dameMaterial;
              tmpClave       := AltaRapidaMaterial.edClave.Text;
              tmpDescripcion := AltaRapidaMaterial.edDescripcion.Text;
              AltaRapidaMaterial.Free;
              if tmpMaterial <> 0 then
              begin
                 dsDetalle.DataSet.FieldByName('MATERIAL').AsInteger := tmpMaterial;
                 edClave.Text       := tmpClave;
                 edDescripcion.Text := tmpDescripcion;
              end;
           end;
        end;
  end
  else
     if (key = #13) and (edClave.Text = '') then
     begin
        //edClave.OnButtonClick(nil,0);
     end;
end;

procedure TfrmCapturar_nombre_lista_precios.ibGuardarClick(
  Sender: TObject);
begin
  inherited;
  FijarBotonesDetalle;
end;

procedure TfrmCapturar_nombre_lista_precios.FormShow(Sender: TObject);
begin
  inherited;
  fijarBotonesDetalle;
end;

procedure TfrmCapturar_nombre_lista_precios.deFechaEnter(Sender: TObject);
begin
  inherited;
  deFecha.Text := (FormatDateTime('dd/mm/yyyy',dsDetalle.DataSet.FieldByName('FECHA').AsDateTime));
end;

procedure TfrmCapturar_nombre_lista_precios.sbRefreshUsuariosClick(
  Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyUsuarios);
end;

procedure TfrmCapturar_nombre_lista_precios.sbDelClick(Sender: TObject);
begin
  inherited;
  cbUsuarios.KeyValue := 0; 
end;

procedure TfrmCapturar_nombre_lista_precios.cePrecio_MaximoEnter(
  Sender: TObject);
begin
  inherited;
  if dsDetalle.DataSet.State = dsInsert then
     dsDetalle.DataSet.FieldByName('PRECIO_MAXIMO').AsFloat := dsDetalle.DataSet.FieldByName('PRECIO_MINIMO').AsFloat;
end;

end.
