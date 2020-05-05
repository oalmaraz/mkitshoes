unit capturar_cheques;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI,   Db,    DBCtrls,  StdCtrls,
  IBX.IBStoredProc, IBX.IBTable,  IBX.IBCustomDataSet, IBX.IBQuery, Mask,
  jpeg,  ExtCtrls, 
  Buttons, Grids, DBGrids, System.Variants;

type
  TfrmCapturar_cheques = class(TfrmCapturarMDI)
    dgCheques: TDBGrid;
    deTipo: TDBComboBox;
    deReferencia: TDBEdit;
    deAutorizacion: TDBEdit;
    deMonto: TDBEdit;
    deFechaAlta: TDBEdit;
    deFechaAplicacion: TDBEdit;
    dmObservaciones: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    TCapturarID: TIntegerField;
    TCapturarTIPO: TIBStringField;
    TCapturarREFERENCIA: TIBStringField;
    TCapturarAUTORIZACION: TIBStringField;
    TCapturarMONTO: TFloatField;
    TCapturarCLIENTE: TIntegerField;
    TCapturarCLIENTE_NOMBRE: TIBStringField;
    TCapturarEXTENSION: TIntegerField;
    TCapturarEXTENSION_NOMBRE: TIBStringField;
    TCapturarFECHA_ALTA: TDateTimeField;
    TCapturarFECHA_APLICACION: TDateTimeField;
    TCapturarBANCO: TIntegerField;
    TCapturarID_REFERENCIA: TIntegerField;
    TCapturarOBSERVACIONES: TBlobField;
    TCapturarSEL: TIBStringField;
    TCapturarESTATUS: TIBStringField;
    qyBancos: TIBQuery;
    qyBancosR_ID: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    dsBancos: TDataSource;
    cbBancos: TDBLookupComboBox;
    deCliente: TDBEdit;
    deExtension: TDBEdit;
    Label18: TLabel;
    spEstatus: TIBStoredProc;
    ibPantalla: TBitBtn;
    ibPrint: TBitBtn;
    laPanel: TBitBtn;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    cbEstatus: TDBLookupComboBox;
    buAplicar: TBitBtn;
    buLimpiar: TBitBtn;
    TCapturar_bancoNombre: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure ibNuevoClick(Sender: TObject);
    procedure deClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure deExtensionButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibModificarClick(Sender: TObject);
    procedure ibPantallaClick(Sender: TObject);
    procedure ibPrintClick(Sender: TObject);
    procedure dgChequesDblClick(Sender: TObject);
    procedure cbEstatusChange(Sender: TObject);
    procedure buAplicarClick(Sender: TObject);
    procedure buLimpiarClick(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_cheques: TfrmCapturar_cheques;

implementation

uses IBModulo, reglas_de_negocios, IBData, seleccionar_cliente,
  seleccionar_extension, autorizacion, capturar_busqueda_cheques,
  PRN_0011_Cheques, UfrmSeleccionarCliente, UfrmSeleccionarExtension,
  UfrmAcceso;

{$R *.DFM}

procedure TfrmCapturar_cheques.FormCreate(Sender: TObject);
begin
  reglas.abrir_IBTabla(dmIBData.TFiltroBancos);
  reglas.refresh_IBQuery(qyBancos);
  inherited;
  reglas.refresh_IBQuery(qyEstatus);
  dgCheques.DataSource.Dataset.First;
end;

procedure TfrmCapturar_cheques.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('FECHA_ALTA').AsDateTime       := reglas.dame_fecha;
  dsFuente.DataSet.FieldByName('FECHA_APLICACION').AsDateTime := reglas.dame_fecha;
  dsFuente.DataSet.FieldByName('TIPO').AsString               := 'Desconocido';
  dsFuente.DataSet.FieldByName('ESTATUS').AsString            := 'Por Cobrar';
  dsFuente.DataSet.FieldByName('SEL').AsString                := 'No';
  dsFuente.DataSet.FieldByName('MONTO').AsFloat               := 0.00;
  deFechaAplicacion.SetFocus;
end;

procedure TfrmCapturar_cheques.deClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
           frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarCliente.CLAVE       := deCliente.Text;
           if frmSeleccionarCliente.abrirConsulta then
           begin
              frmSeleccionarCliente.ShowModal;
              if frmSeleccionarCliente.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger       := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE_NOMBRE').AsString := frmSeleccionarCliente.NOMBRE;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger       := frmSeleccionarCliente.ID;
                 dsFuente.DataSet.FieldByName('CLIENTE_NOMBRE').AsString := frmSeleccionarCliente.NOMBRE;
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := null;
           dsFuente.DataSet.FieldByName('EXTENSION_NOMBRE').AsString := '';
        end;
    1 : begin
           dsFuente.DataSet.FieldByName('CLIENTE').AsVariant         := null;
           dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := null;
           dsFuente.DataSet.FieldByName('CLIENTE_NOMBRE').AsString   := '';
           dsFuente.DataSet.FieldByName('EXTENSION_NOMBRE').AsString := '';
        end;
  end;
end;

procedure TfrmCapturar_cheques.deExtensionButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  inherited;
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarExtension             := TfrmSeleccionarExtension.Create(Application);
           frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarExtension.CLAVE       := deExtension.Text;
           if frmSeleccionarExtension.abrirConsulta then
           begin
              frmSeleccionarExtension.ShowModal;
              if frmSeleccionarExtension.ACEPTAR then
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('CLIENTE_NOMBRE').AsString   := frmSeleccionarExtension.C_NOMBRE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('EXTENSION_NOMBRE').AsString := frmSeleccionarExtension.NOMBRE;
              end;
           end
           else
              begin
                 dsFuente.DataSet.FieldByName('CLIENTE').AsInteger         := frmSeleccionarExtension.CLIENTE;
                 dsFuente.DataSet.FieldByName('CLIENTE_NOMBRE').AsString   := frmSeleccionarExtension.C_NOMBRE;
                 dsFuente.DataSet.FieldByName('EXTENSION').AsVariant       := frmSeleccionarExtension.EXTENSION;
                 dsFuente.DataSet.FieldByName('EXTENSION_NOMBRE').AsString := frmSeleccionarExtension.NOMBRE;
              end;
           frmSeleccionarExtension.Free;
           frmSeleccionarExtension := nil;
        end;
    1 : begin
           //deCliente.OnButtonClick(sender, 1);
        end;
  end;
end;

procedure TfrmCapturar_cheques.ibModificarClick(Sender: TObject);
begin
  inherited;
  deFechaAplicacion.SetFocus;
end;


procedure TfrmCapturar_cheques.ibPantallaClick(Sender: TObject);
begin
  inherited;
  frmCapturar_busqueda_cheques := TfrmCapturar_busqueda_cheques.Create(Application);
  frmCapturar_busqueda_cheques.ShowModal;
  frmCapturar_busqueda_cheques.Free;
  reglas.abrir_IBTabla(TCapturar);
end;

procedure TfrmCapturar_cheques.ibPrintClick(Sender: TObject);
begin
  inherited;
  frmPRN_0011 := TfrmPRN_0011.Create(Application);
  frmPRN_0011.ShowModal;
  frmPRN_0011.Free;
end;


procedure TfrmCapturar_cheques.dgChequesDblClick(Sender: TObject);
begin
  inherited;
  if not(dsFuente.DataSet.IsEmpty) then
  begin
     try
        dsFuente.DataSet.DisableControls;
        dsFuente.DataSet.Edit;
        if dsFuente.DataSet.FieldByName('SEL').AsString = 'Si' then
           dsFuente.DataSet.FieldByName('SEL').AsString := 'No'
        else
           dsFuente.DataSet.FieldByName('SEL').AsString := 'Si';
        dsFuente.DataSet.Post;
     finally
        dsFuente.DataSet.EnableControls;
     end;
  end;
end;

procedure TfrmCapturar_cheques.cbEstatusChange(Sender: TObject);
begin
  inherited;
  if (cbEstatus.Text <> '') and (cbEstatus.Text <> awrStatus.EstatusSel) then
  begin
     awrStatus.estatusSel   := dsEstatus.DataSet.FieldByName('R_ESTATUS').AsString;
     awrStatus.autorizacion := dsEstatus.DataSet.FieldByName('R_AUTORIZACION').AsString = 'Si';
     awrStatus.storeproc    := dsEstatus.DataSet.FieldByName('R_STOREPROC').AsString;
     awrStatus.nivel        := dsEstatus.DataSet.FieldByName('R_NIVEL').AsInteger;

     buAplicar.Enabled := true;
  end;
end;

procedure TfrmCapturar_cheques.buAplicarClick(Sender: TObject);
var
   ejecutar  : boolean;
begin
  inherited;
  ejecutar := TRUE;
  if (awrStatus.autorizacion) and (awrStatus.nivel > reglas.dameUsuarioNivel) then
  begin
     try
        Application.CreateForm(TfrmAcceso, frmAcceso);
        frmAcceso.Nivel  := awrStatus.nivel;
        frmAcceso.Status := awrStatus.estatusSel;
        frmAcceso.ShowModal;
        ejecutar := frmAcceso.Rsp;
     finally
        frmAcceso.Free;
     end;
  end;

  if ejecutar then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := awrStatus.storeproc;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     spEstatus.ParamByName('P_ID').AsInteger := awrStatus.idEjecutar;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;

     awrStatus.estatusSel := '';

     cbEstatus.KeyValue := 0;
     buAplicar.Enabled := false;
     buLimpiar.Enabled := true;

     reglas.abrir_IBTabla(TCapturar);
     dgCheques.DataSource.DataSet.First;
  end;
end;

procedure TfrmCapturar_cheques.buLimpiarClick(Sender: TObject);
begin
  inherited;
  cbEstatus.KeyValue := 0;
  buAplicar.Enabled := false;
  buLimpiar.Enabled := true;
end;

procedure TfrmCapturar_cheques.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('_bancoNombre').AsString := '';
  if DataSet.FieldByName('BANCO').AsString <> '' then
  begin
     dmIBData.qyFiltroBancos.Close;
     dmIBData.qyFiltroBancos.ParamByName('P_ID').AsInteger := DataSet.FieldByName('BANCO').AsInteger;
     dmIBData.qyFiltroBancos.Open;
     DataSet.FieldByName('_bancoNombre').AsString := dmIBData.qyFiltroBancos.FieldByName('NOMBRE').AsString;
  end;
end;

end.
