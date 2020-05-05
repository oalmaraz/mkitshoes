unit generar_reporte_lista_de_precios;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, Db, IBX.IBStoredProc, IBX.IBCustomDataSet, IBX.IBQuery, Menus, StdCtrls,
    Buttons, jpeg,
  ExtCtrls,  Grids, DBGrids, Mask, DBCtrls, ComCtrls, CheckLst;

type
  TfrmGenerarReporteListaPrecios = class(TfrmPadre)
    Label3: TLabel;
    deFecha: TDateTimePicker;
    Label1: TLabel;
    beCliente: TDBEdit;
    Label21: TLabel;
    beExtension: TDBEdit;
    Label2: TLabel;
    sbMateriales: TSpeedButton;
    dgPartidas: TDBGrid;
    pmTeclas: TPopupMenu;
    NuevaPartida1: TMenuItem;
    EliminarPartida1: TMenuItem;
    qyMateriales: TIBQuery;
    dsMateriales: TDataSource;
    qyMaterialesR_MATERIAL: TIntegerField;
    qyMaterialesR_MATERIAL_CLAVE: TIBStringField;
    qyMaterialesR_MATERIAL_DESCRIPCION: TIBStringField;
    paBotones: TPanel;
    ibNuevaPartida: TBitBtn;
    ibEliminarPartida: TBitBtn;
    fcImager1: TImage;
    spADD_MANUAL_LISTA_PRECIO: TIBStoredProc;
    qyManual_Lista: TIBQuery;
    dsManual_Lista: TDataSource;
    qyManual_ListaR_ID: TIntegerField;
    qyManual_ListaR_FECHA_ALTA: TDateTimeField;
    qyManual_ListaR_CLIENTE: TIntegerField;
    qyManual_ListaR_CLIENTE_CLAVE: TIBStringField;
    qyManual_ListaR_CLIENTE_NOMBRE: TIBStringField;
    qyManual_ListaR_EXTENSION: TIntegerField;
    qyManual_ListaR_EXTENSION_CLAVE: TIBStringField;
    qyManual_ListaR_EXTENSION_NOMBRE: TIBStringField;
    qyManual_ListaR_FECHA_COMPRA: TDateTimeField;
    qyManual_ListaR_MATERIAL: TIntegerField;
    qyManual_ListaR_MATERIAL_CLAVE: TIBStringField;
    qyManual_ListaR_MATERIAL_DESCRIPCION: TIBStringField;
    qyManual_ListaR_CANTIDAD: TFloatField;
    qyManual_ListaR_UNIDAD: TIntegerField;
    qyManual_ListaR_UNIDAD_DESCRIPCION: TIBStringField;
    qyManual_ListaR_PRECIO: TFloatField;
    spDEL_MANUAL_LISTA_PRECIO: TIBStoredProc;
    qyCliente: TIBQuery;
    qyClienteR_ID: TIntegerField;
    qyClienteR_CLAVE: TIBStringField;
    qyClienteR_NOMBRE: TIBStringField;
    qyClienteR_RAZON_SOCIAL: TIBStringField;
    qyClienteR_CLASIFICACION: TIBStringField;
    qyClienteR_TELEFONO: TIBStringField;
    qyClienteR_FACTURAR_A: TIBStringField;
    qyClienteR_RFC: TIBStringField;
    qyClienteR_DOMICILIO: TIBStringField;
    qyClienteR_CIUDAD: TIBStringField;
    qyClienteR_OBSERVACIONES: TBlobField;
    qyClienteR_FOTO: TBlobField;
    qyClienteR_FIRMA: TBlobField;
    qyClienteR_ESTATUS: TIBStringField;
    qyClienteR_LIMITE_CREDITO: TFloatField;
    qyClienteR_LIMITE_DISPONIBLE: TFloatField;
    qyClienteR_CP: TIBStringField;
    qyClienteR_FORMA_DE_PAGO: TIntegerField;
    qyClienteR_FORMA_DE_PAGO_NOMBRE: TIBStringField;
    qyClienteR_NUM_EXT: TIBStringField;
    qyClienteR_NUM_INT: TIBStringField;
    qyClienteR_LETRA: TIBStringField;
    qyClienteR_COLONIA: TIBStringField;
    dsCliente: TDataSource;
    qyExtension: TIBQuery;
    qyExtensionR_ID_EXTENSION: TIntegerField;
    qyExtensionR_ID_CLIENTE: TIntegerField;
    qyExtensionR_CLAVE: TIBStringField;
    qyExtensionR_NOMBRE: TIBStringField;
    qyExtensionR_FOTO: TBlobField;
    qyExtensionR_FIRMA: TBlobField;
    qyExtensionR_LIMITE_CREDITO: TFloatField;
    qyExtensionR_ESTATUS: TIBStringField;
    dsExtension: TDataSource;
    ibImprimir: TBitBtn;
    Imprimir1: TMenuItem;
    cbMateriales: TCheckListBox;
    cbListaBlanco: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure sbMaterialesClick(Sender: TObject);
    procedure ibNuevaPartidaClick(Sender: TObject);
    procedure ibEliminarPartidaClick(Sender: TObject);
    procedure beClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure beExtensionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure deFechaDateChange(Sender: TObject);
    procedure beClienteKeyPress(Sender: TObject; var Key: Char);
    procedure beExtensionKeyPress(Sender: TObject; var Key: Char);
    procedure dsManual_ListaDataChange(Sender: TObject; Field: TField);
    procedure NuevaPartida1Click(Sender: TObject);
    procedure EliminarPartida1Click(Sender: TObject);
    procedure Imprimir1Click(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure loadMateriales;
    procedure loadManual;
  public
    { Public declarations }
  end;

var
  frmGenerarReporteListaPrecios: TfrmGenerarReporteListaPrecios;

implementation

uses reglas_de_negocios, IBModulo, seleccionar_cliente,
  seleccionar_extension, IBData, PRN_0024_Manual_lista_precios;

{$R *.DFM}

procedure TfrmGenerarReporteListaPrecios.loadManual;
begin
  qyManual_Lista.Close;
  qyManual_Lista.ParamByName('P_FECHA').AsDateTime := deFecha.Date;
  qyManual_Lista.Open;
end;

procedure TfrmGenerarReporteListaPrecios.loadMateriales;
begin
   cbMateriales.Items.Clear;
   qyMateriales.Close;
   qyMateriales.Open;
   while not(qyMateriales.Eof) do
   begin
      cbMateriales.Items.Add('(' + qyMateriales.FieldByName('R_MATERIAL').AsString + ') ' + qyMateriales.FieldByName('R_MATERIAL_CLAVE').AsString + ', ' +qyMateriales.FieldByName('R_MATERIAL_DESCRIPCION').AsString);
      qyMateriales.Next;
   end;
end;

procedure TfrmGenerarReporteListaPrecios.FormCreate(Sender: TObject);
begin
  inherited;
  deFecha.Date := reglas.dame_fecha;
//  loadManual;
  loadMateriales;
end;

procedure TfrmGenerarReporteListaPrecios.sbMaterialesClick(
  Sender: TObject);
begin
  inherited;
  loadMateriales;
end;

procedure TfrmGenerarReporteListaPrecios.ibNuevaPartidaClick(
  Sender: TObject);
var
   i  : integer;
   id : integer;
begin
  inherited;

  for i := 0 to (cbMateriales.Items.Count - 1) do
  begin
     if cbMateriales.Checked[i] then
     begin
        id := reglas.dame_id(cbMateriales.Items.Strings[i]);
        spADD_MANUAL_LISTA_PRECIO.ParamByName('P_FECHA').AsDateTime    := StrToDate(FormatDateTime('dd/mm/yyy',deFecha.Date)) + time;
        spADD_MANUAL_LISTA_PRECIO.ParamByName('P_CLIENTE').AsInteger   := dsCliente.DataSet.FieldByName('R_ID').AsInteger;
        spADD_MANUAL_LISTA_PRECIO.ParamByName('P_EXTENSION').AsInteger := dsExtension.DataSet.FieldByName('R_ID_EXTENSION').AsInteger;
        spADD_MANUAL_LISTA_PRECIO.ParamByName('P_MATERIAL').AsInteger  := id;
        spADD_MANUAL_LISTA_PRECIO.ExecProc;
        spADD_MANUAL_LISTA_PRECIO.Transaction.CommitRetaining;
     end;
  end;
  loadManual;
end;

procedure TfrmGenerarReporteListaPrecios.ibEliminarPartidaClick(
  Sender: TObject);
begin
  inherited;
  spDEL_MANUAL_LISTA_PRECIO.ParamByName('P_ID').AsInteger := dsManual_Lista.DataSet.FieldByName('R_ID').AsInteger;
  spDEL_MANUAL_LISTA_PRECIO.ExecProc;
  spDEL_MANUAL_LISTA_PRECIO.Transaction.CommitRetaining;
  loadManual;
end;

procedure TfrmGenerarReporteListaPrecios.beClienteButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   pnt : TPoint;
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           pnt := fpPadre.ClientToScreen(Point(0,0));
           frmSeleccionar_cliente                   := TfrmSeleccionar_cliente.CrearObj(Application, pnt.x, pnt.y, fpPadre.width, fpPadre.Height + cbMateriales.Height);
           frmSeleccionar_cliente.dsDestino.DataSet := qyCliente;
           frmSeleccionar_cliente.ShowModal;
           frmSeleccionar_cliente.Free;
           qyExtension.Close;
        end;
    1 : begin
           qyCliente.Close;
           qyExtension.Close;
        end;
  end;
  reglas.refresh_IBQuery(qyManual_Lista);
end;

procedure TfrmGenerarReporteListaPrecios.beExtensionButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   pnt : TPoint;
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           pnt := fpPadre.ClientToScreen(Point(0,0));
           frmSeleccionar_extension                   := TfrmSeleccionar_extension.CrearObj(Application, pnt.x, pnt.y, fpPadre.Width, fpPadre.Height + fpPadre.Height);
           frmSeleccionar_extension.dsDestino.DataSet := qyExtension;
           frmSeleccionar_extension.ShowModal;
           frmSeleccionar_extension.Free;
           if not(qyExtension.IsEmpty) then
           begin
              qyCliente.Close;
              qyCliente.ParamByName('P_CLIENTE').AsInteger := qyExtension.FieldByName('R_ID_CLIENTE').AsInteger;
              qyCliente.Open;
           end;
        end;
    1 : begin
           qyExtension.Close;
        end;
  end;
end;

procedure TfrmGenerarReporteListaPrecios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmGenerarReporteListaPrecios.deFechaDateChange(
  Sender: TObject);
begin
  inherited;
  loadManual;
end;

procedure TfrmGenerarReporteListaPrecios.beClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     beClienteButtonClick(Sender, 0);
end;

procedure TfrmGenerarReporteListaPrecios.beExtensionKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
     beExtensionButtonClick(Sender, 0);
end;

procedure TfrmGenerarReporteListaPrecios.dsManual_ListaDataChange(
  Sender: TObject; Field: TField);
begin
  inherited;
  if dsManual_Lista.DataSet <> nil then
  begin
     ibEliminarPartida.Enabled := not(dsManual_Lista.DataSet.IsEmpty);
  end;
end;

procedure TfrmGenerarReporteListaPrecios.NuevaPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibNuevaPartida.Enabled then
     ibNuevaPartida.Click;
end;

procedure TfrmGenerarReporteListaPrecios.EliminarPartida1Click(
  Sender: TObject);
begin
  inherited;
  if ibEliminarPartida.Enabled then
     ibEliminarPartida.Click;
end;

procedure TfrmGenerarReporteListaPrecios.Imprimir1Click(Sender: TObject);
begin
  inherited;
  ibImprimir.Click;
end;

procedure TfrmGenerarReporteListaPrecios.ibImprimirClick(Sender: TObject);
begin
  inherited;
  frmPRN_0024_Manual_lista_precios := TfrmPRN_0024_Manual_lista_precios.Crear(Application, deFecha.Date);
  //frmPRN_0024_Manual_lista_precios.qrManual.Preview;
  // cbListaBlanco.Checked then
  //   frmPRN_0024_Manual_lista_precios.qrVacia.Preview;
  frmPRN_0024_Manual_lista_precios.Free;
end;

end.
