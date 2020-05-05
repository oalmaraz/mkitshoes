unit capturar_cxc_mensajes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturar,     Db,
      StdCtrls, IBX.IBStoredProc, IBX.IBTable,
  IBX.IBCustomDataSet, IBX.IBQuery, DBCtrls, Mask,
   jpeg,  ExtCtrls,   Menus, 
  Buttons, Grids, DBGrids;

type
  TfrmCapturar_cxc_mensajes = class(TfrmCapturar)
    dgMensajes: TDBGrid;
    TCapturarID: TIntegerField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarMENSAJE: TBlobField;
    TCapturarFECHA: TDateTimeField;
    spFECHA_SERVIDOR: TIBStoredProc;
    meMensaje: TDBMemo;
    Label1: TLabel;
    TCapturarPROMESA_PAGO: TDateTimeField;
    Label2: TLabel;
    dePromesa: TDBEdit;
    ppCerrar: TPopupMenu;
    Cerrar1: TMenuItem;
    TCapturarTIPO: TIntegerField;
    TCapturarUSUARIO: TIntegerField;
    TCapturarESTATUS: TIBStringField;
    TCapturarVER_CLIENTE: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibModificarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Cerrar1Click(Sender: TObject);
    procedure ibEliminarClick(Sender: TObject);
  private
    { Private declarations }
    awrCliente : integer;
    procedure setCLIENTE(valor : integer);
  public
    { Public declarations }
  published
    property CLIENTE : integer read awrCLIENTE write setCLIENTE;
  end;

  const NIVEL = 5;

var
  frmCapturar_cxc_mensajes: TfrmCapturar_cxc_mensajes;

implementation

uses IBModulo, reglas_de_negocios, UfrmAcceso;

{$R *.DFM}

procedure TfrmCapturar_cxc_mensajes.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cxc_mensajes.setCLIENTE(valor : integer);
begin
   awrCliente       := valor;
   TCapturar.Filter := 'CLIENTE = '+IntToStr(awrCliente);
end;

procedure TfrmCapturar_cxc_mensajes.ibNuevoClick(Sender: TObject);
begin
  inherited;
  spFECHA_SERVIDOR.ExecProc;
  dsFuente.DataSet.FieldByName('CLIENTE').AsInteger       := awrCliente;
  dsFuente.DataSet.FieldByName('FECHA').AsDateTime        := spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('PROMESA_PAGO').AsDateTime := spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('ESTATUS').AsString        := 'Activo';
  dsFuente.DataSet.FieldByName('VER_CLIENTE').AsString    := 'No';

  meMensaje.SetFocus;
end;

procedure TfrmCapturar_cxc_mensajes.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
  begin
     paLienzo.Visible := dsFuente.DataSet.State in [dsInsert, dsEdit];
  end;
end;

procedure TfrmCapturar_cxc_mensajes.ibModificarClick(Sender: TObject);
var
   ejecutar : boolean;
begin
   ejecutar := true;
   if (NIVEL > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel  := NIVEL;
         frmAcceso.Status := 'Modificar';
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

   if ejecutar then
   begin
      inherited;
      meMensaje.SetFocus;
   end;
end;

procedure TfrmCapturar_cxc_mensajes.FormShow(Sender: TObject);
begin
  inherited;
  dgMensajes.DataSource.DataSet.First;
end;

procedure TfrmCapturar_cxc_mensajes.ibGuardarClick(Sender: TObject);
begin
  if dsFuente.DataSet.State in [dsEdit] then
  begin
  {
     if dePromesa.IsSelected then//esta linea de codigo es para que el componente registre la fecha en el campo asignado
        meMensaje.SetFocus;
     dsFuente.DataSet.FieldByName('PROMESA_PAGO').AsDateTime := dePromesa.Date + time;
     }
  end;
  inherited;
end;


procedure TfrmCapturar_cxc_mensajes.ibImprimirClick(Sender: TObject);

begin
  inherited;
  {
  cpPrint := TdxComponentPrinter.Create(Application);
  cpPrint.OnBeforePreview := BeforePreview;
  cpPrint.AddLink(dgMensajes);
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Name  := 'Arial';
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Size  := 14;
//  cpPrint.CurrentLink := cpImpresion.ReportLink[0];

  cpPrint.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Add(fpPadre.Title);
  cpPrint.ReportLink[0].ShrinkToPageWidth := true;
  cpPrint.Preview(True, nil);
  cpPrint.Free;

  dgMensajes.OptionsDB := [edgoCancelOnExit,edgoCanDelete,edgoCanInsert,edgoCanNavigation,edgoConfirmDelete,edgoUseBookmarks];
  }
end;

procedure TfrmCapturar_cxc_mensajes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  inherited; no tomar en cuenta lo heredado.
end;

procedure TfrmCapturar_cxc_mensajes.Cerrar1Click(Sender: TObject);
begin
  inherited;
   Close;
end;

procedure TfrmCapturar_cxc_mensajes.ibEliminarClick(Sender: TObject);
var
   ejecutar : boolean;
begin
   ejecutar := true;
   if (NIVEL > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel  := NIVEL;
         frmAcceso.Status := 'Elimnar';
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

   if ejecutar then
   begin
      inherited;
   end;
end;

end.
