unit capturar_mensajes;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery, StdCtrls, Mask, DBCtrls,    jpeg,
   ExtCtrls,  Buttons;

type
  TfrmCapturar_mensajes = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarMENSAJE: TBlobField;
    TCapturarEXTRA: TBlobField;
    TCapturarESPECIFICAR_FECHA: TIBStringField;
    TCapturarEN_FECHA: TDateTimeField;
    TCapturarMODULO: TIBStringField;
    TCapturarMOMENTO: TIBStringField;
    TCapturarPARA: TIBStringField;
    TCapturarQUIEN: TIntegerField;

    TCapturarPRIVADO: TIBStringField;
    edMensaje: TDBMemo;
    laObservaciones: TLabel;
    Label1: TLabel;
    edExtra: TDBMemo;
    cbFecha: TDBCheckBox;
    edFecha: TDBEdit;
    cbMomento: TDBEdit;
    Label9: TLabel;
    Label2: TLabel;
    cbModulo: TDBEdit;
    Label3: TLabel;
    cbPara: TDBEdit;
    laNombre: TLabel;
    edCliente: TEdit;
    edNombre: TDBEdit;
    laTelefono: TLabel;
    edTelefono: TDBEdit;
    cbUsuarios: TDBLookupComboBox;
    Label4: TLabel;
    cbEstatus: TDBEdit;
    TCapturarESTATUS: TIBStringField;
    qyUsuarios: TIBQuery;
    dsUsuarios: TDataSource;
    qyUsuariosID: TIntegerField;
    qyUsuariosCLAVE: TIBStringField;
    qyUsuariosNOMBRE: TIBStringField;
    TCapturarnombre: TStringField;
    TCapturartelefono: TStringField;
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edUsuarioButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure cbFechaChange(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure cbParaChange(Sender: TObject);
    procedure cbModuloChange(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    procedure validarFecha;
    procedure validarPersonal;
    procedure verfificarFecha;
  public
    { Public declarations }
  end;

var
  frmCapturar_mensajes: TfrmCapturar_mensajes;

implementation

uses
  explorar_mensajes, IBModulo, UfrmSeleccionarCliente, IBData, reglas_de_negocios;

{$R *.DFM}

procedure TfrmCapturar_mensajes.validarFecha;
begin
   edFecha.Visible := cbFecha.Checked;
end;

procedure TfrmCapturar_mensajes.verfificarFecha;
var
   fraccion   : Real;
   entero     : Real;
begin
   //validacion fecha alta
   if edFecha.Focused then
      edMensaje.SetFocus;
   entero   := Int(StrToDate(edFecha.Text));
   fraccion := Frac(StrToDate(edFecha.Text));
   if entero > 0 then
   begin
      if fraccion = 0 then
         dsFuente.DataSet.FieldByName('EN_FECHA').AsDateTime := StrToDate(edFecha.Text) + time;
   end;
end;

procedure TfrmCapturar_mensajes.validarPersonal;
var
   ver : integer;
begin
{
0.SISTEMA
1.POS
2.PUNTO DE VENTA
3.PEDIDOS
4.FACTURACION
}
  ver := 0;
  {
  case cbModulo.ItemIndex of
              0 : ver := 1;
     1, 2, 3, 4 : ver := 2;
  end;
  laNombre.Visible   := (cbPara.ItemIndex = 1) and ((ver = 1) OR (ver = 2));
  edNombre.Visible   := (cbPara.ItemIndex = 1) and ((ver = 1) OR (ver = 2)) and (dsFuente.State = dsBrowse);
  laTelefono.Visible := (cbPara.ItemIndex = 1) and ((ver = 1) OR (ver = 2)) and (dsFuente.State = dsBrowse);
  edTelefono.Visible := (cbPara.ItemIndex = 1) and ((ver = 1) OR (ver = 2)) and (dsFuente.State = dsBrowse);
  cbUsuarios.Visible := (cbPara.ItemIndex = 1) and (ver = 1) and (dsFuente.State in [dsInsert, dsEdit]);
  edCliente.Visible  := (cbPara.ItemIndex = 1) and (ver = 2) and (dsFuente.State in [dsInsert, dsEdit]);
      }
  edCliente.Text := '';
  if dsFuente.State = dsEdit then
     edCliente.Text := dsFuente.DataSet.FieldByName('nombre').AsString;
       

end;

procedure TfrmCapturar_mensajes.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 edCliente.Text                                  := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('QUIEN').AsInteger := frmSeleccionarCliente.ID;
                // edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                                  := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('QUIEN').AsInteger := frmSeleccionarCliente.ID;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('QUIEN').AsVariant   := 0;
        end;
  end;
end;

procedure TfrmCapturar_mensajes.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  //if Key = #13 then
  //   edCliente.OnButtonClick(Sender, 0);
end;

procedure TfrmCapturar_mensajes.edUsuarioButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente             := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE       := edCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 edCliente.Text                                                := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger              := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Text                                                := frmSeleccionarCliente.NOMBRE;
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger             := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CONDICION_COMERCIAL').AsInteger := frmSeleccionarCliente.CCOMERCIAL;
                 dsFuente.DataSet.FieldByName('DESCUENTO_GLOBAL_PORC').AsFloat := frmSeleccionarCliente.DESC_PORC;
                 dsFuente.DataSet.FieldByName('MONEDA').AsInteger              := frmSeleccionarCliente.MONEDA;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant   := 0;
        end;
  end;
end;

procedure TfrmCapturar_mensajes.cbFechaChange(Sender: TObject);
begin
  inherited;
  validarFecha;
end;

procedure TfrmCapturar_mensajes.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dmIBData.spFECHA_SERVIDOR.ExecProc;

  dsFuente.DataSet.FieldByName('ESPECIFICAR_FECHA').AsString := 'No';
  dsFuente.DataSet.FieldByName('EN_FECHA').AsDateTime        :=   dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDateTime;
  dsFuente.DataSet.FieldByName('PRIVADO').AsString           := 'No';
  dsFuente.DataSet.FieldByName('ESTATUS').AsString           := 'Activo';
  edMensaje.SetFocus;
end;

procedure TfrmCapturar_mensajes.ibModificarClick(Sender: TObject);
begin
  inherited;
  edMensaje.SetFocus;
end;

procedure TfrmCapturar_mensajes.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  validarPersonal;
  validarFecha;
end;

procedure TfrmCapturar_mensajes.cbParaChange(Sender: TObject);
begin
  inherited;
  validarPersonal;
end;

procedure TfrmCapturar_mensajes.cbModuloChange(Sender: TObject);
begin
  inherited;
  validarPersonal;
end;

procedure TfrmCapturar_mensajes.ibGuardarClick(Sender: TObject);
begin
  if dsFuente.DataSet.FieldByName('ESPECIFICAR_FECHA').AsString = 'No' then
     dsFuente.DataSet.FieldByName('EN_FECHA').AsVariant := 0
  else
     verfificarFecha;

  if dsFuente.DataSet.FieldByName('PARA').AsString = 'TODOS' then
     dsFuente.DataSet.FieldByName('QUIEN').AsVariant := 0;

  inherited;
end;

procedure TfrmCapturar_mensajes.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyUsuarios);
  reglas.abrir_IBTabla(dmIBData.TFiltroUsuarios);
  reglas.abrir_IBTabla(dmIBData.TFiltroClientes);
end;

procedure TfrmCapturar_mensajes.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('nombre').AsString   := '';
  DataSet.FieldByName('telefono').AsString := '';
  if DataSet.FieldByName('QUIEN').AsString <> '' then
  begin
    if DataSet.FieldByName('PARA').AsString = 'PERSONAL' then
    begin
       if DataSet.FieldByName('MODULO').AsString = 'SISTEMA' then
       begin
          laNombre.Caption                         := 'Usuario';
          dmIBData.TFiltroUsuarios.Filter          := 'ID = ' + DataSet.FieldByName('QUIEN').AsString;
          DataSet.FieldByName('nombre').AsString   := dmIBData.TSujetos.FieldByName('NOMBRE').AsString;
          DataSet.FieldByName('telefono').AsString := dmIBData.TSujetos.FieldByName('TEL_PRINCIPAL').AsString;
       end
       else
       begin
          laNombre.Caption                         := 'Cliente';
          dmIBData.TFiltroClientes.Filter          := 'ID = ' + DataSet.FieldByName('QUIEN').AsString;
          DataSet.FieldByName('nombre').AsString   := dmIBData.TSujetosCliente.FieldByName('NOMBRE').AsString;
          DataSet.FieldByName('telefono').AsString := dmIBData.TSujetosCliente.FieldByName('TEL_PRINCIPAL').AsString;
       end;
    end;
  end;
end;

end.
