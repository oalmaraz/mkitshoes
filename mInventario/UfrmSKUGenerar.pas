unit UfrmSKUGenerar;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  Buttons, ExtCtrls,
  Db, IBX.IBCustomDataSet, IBX.IBStoredProc,  IBX.IBQuery, DBCtrls, System.Variants;

type
  TfrmSKUGenerar = class(TForm)
    paTitulo: TPanel;
    spSKU_GENERAR: TIBStoredProc;
    paBotones: TPanel;
    buGuardar: TBitBtn;
    buSalir: TBitBtn;
    qyMateriales_Medidas: TIBQuery;
    qyMateriales_MedidasR_ID: TIntegerField;
    qyMateriales_MedidasR_ID_MEDIDA: TIntegerField;
    qyMateriales_MedidasR_DESCRIPCION: TIBStringField;
    qyMateriales_MedidasR_CODIGO_BARRAS: TIBStringField;
    qyMateriales_Colores: TIBQuery;
    dsColores: TDataSource;
    dsMateriales_Medidas: TDataSource;
    paMaterial: TPanel;
    Label1: TLabel;
    edCBarras: TEdit;
    Label2: TLabel;
    edDescripcion: TEdit;
    edMaterial: TEdit;
    paMedidas: TPanel;
    laMedida: TLabel;
    cbMedidas: TDBLookupComboBox;
    sbRefreshMedidas: TSpeedButton;
    laColor: TLabel;
    sbRefreshColores: TSpeedButton;
    cbColores: TDBLookupComboBox;
    paCantidad: TPanel;
    Label3: TLabel;
    edCantidad: TEdit;
    qyMateriales_ColoresR_ORDEN: TIntegerField;
    qyMateriales_ColoresR_ID: TIntegerField;
    qyMateriales_ColoresR_COLOR: TIntegerField;
    qyMateriales_ColoresR_COLOR_NOMBRE: TIBStringField;
    procedure edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buGuardarClick(Sender: TObject);
    procedure edMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbRefreshMedidasClick(Sender: TObject);
    procedure sbRefreshColoresClick(Sender: TObject);
  private
    { Private declarations }
    awrMI             : integer;
    awrImagen         : TMemoryStream;
    awrDataSet        : TDataSet;
    awrActivarMedidas : Boolean;
    awrActivarColores : Boolean;

    procedure buscarMaterialVende;
    procedure limpiar;
  public
    { Public declarations }
  published
     property MI : integer read awrMI write awrMI;
     property DataSet : TDataSet read awrDataSet write awrDataSet;
  end;

var
  frmSKUGenerar: TfrmSKUGenerar;

implementation

uses
  IBModulo, UfrmSeleccionarMaterial, UfrmImagen, IBData;

{$R *.DFM}

procedure TfrmSKUGenerar.limpiar;
begin
   edMaterial.Tag := 0;
   edMaterial.Clear;
   edDescripcion.Clear;
{   edCantidad.Clear;
   cbUnidades.Clear;
   edPrecioCosto.Clear;
   edSubTotal.Clear;
   edIVA.Clear;
   edIEPS.Clear;
   edImpuesto1.Clear;
   edImpuesto2.Clear;
   edDescuentoPorc.Clear;}

{   cbColores.ClearValue;
   cbMedidas.ClearValue;}

{   edPU.Clear;
   edExistencia.Clear;}
   edCBarras.Clear;
//   edOtros.Text := '0.0000';
   awrImagen.Clear;
//   awrObserv.Clear;
{   edPPC.Clear;
   edComentario.Clear;
   edObservaciones.Lines.Clear;}
   edCantidad.Clear;
end;

procedure TfrmSKUGenerar.buscarMaterialVende;
begin
   frmSeleccionarMaterial             := TfrmSeleccionarMaterial.Create(Application);
   frmSeleccionarMaterial.DATABASE    := dmIBModulo.ibSistema;
   frmSeleccionarMaterial.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
   frmSeleccionarMaterial.CLAVE       := edMaterial.Text;
{   if CAMPO <> '' then
      frmSeleccionarMaterial.CAMPO := CAMPO;}
   if frmSeleccionarMaterial.abrirConsulta then
   begin
      frmSeleccionarMaterial.ShowModal;
      if frmSeleccionarMaterial.ACEPTAR then
      begin
         edMaterial.Tag     := frmSeleccionarMaterial.ID;
         edMaterial.Text    := frmSeleccionarMaterial.CLAVE;
         edDescripcion.Text := frmSeleccionarMaterial.DESCRIPCION;
//         edPPC.Value        := frmSeleccionarMaterial.PZASXCAJA;
         edCBarras.Text     := frmSeleccionarMaterial.CODIGO_BARRAS;
         //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);

{         tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
         ivaPorc        := frmSeleccionarMaterial.IVA_PORC;
         iepsPorc       := frmSeleccionarMaterial.IEPS_PORC;
         impuesto1Porc  := frmSeleccionarMaterial.IMPUESTO1_PORC;
         impuesto2Porc  := frmSeleccionarMaterial.IMPUESTO2_PORC;
         COSTOULTCOMPRA := frmSeleccionarMaterial.COSTO_ULT_COMP;
         awrNumSerie    := frmSeleccionarMaterial.SERIE;}

         frmSeleccionarMaterial.LoadFoto(awrImagen);

         //Carga las observaciones en el campo memo
{         tmpOb := TMemoryStream.Create;
         frmSeleccionarMaterial.LoadObservaciones(tmpOb);
         tmpOb.Position := 0;
         edObservaciones.Lines.LoadFromStream(tmpOb);
         tmpOb.Free;}
      end;
   end
   else
      if frmSeleccionarMaterial.ID <> 0 then
      begin
         edMaterial.Tag     := frmSeleccionarMaterial.ID;
         edMaterial.Text    := frmSeleccionarMaterial.CLAVE;
         edDescripcion.Text := frmSeleccionarMaterial.DESCRIPCION;
//         edPPC.Value        := frmSeleccionarMaterial.PZASXCAJA;
         edCBarras.Text     := frmSeleccionarMaterial.CODIGO_BARRAS;
         //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);

{         tmpUnidadBase  := dameUnidadPivote(edMaterial.Tag);
         ivaPorc        := frmSeleccionarMaterial.IVA_PORC;
         iepsPorc       := frmSeleccionarMaterial.IEPS_PORC;
         impuesto1Porc  := frmSeleccionarMaterial.IMPUESTO1_PORC;
         impuesto2Porc  := frmSeleccionarMaterial.IMPUESTO2_PORC;
         COSTOULTCOMPRA := frmSeleccionarMaterial.COSTO_ULT_COMP;
         awrNumSerie    := frmSeleccionarMaterial.SERIE;}

         frmSeleccionarMaterial.LoadFoto(awrImagen);

         //Carga las observaciones en el campo memo
{         tmpOb := TMemoryStream.Create;
         frmSeleccionarMaterial.LoadObservaciones(tmpOb);
         tmpOb.Position := 0;
         edObservaciones.Lines.LoadFromStream(tmpOb);
         tmpOb.Free;}
      end;
   frmSeleccionarMaterial.Free;
end;

procedure TfrmSKUGenerar.edMaterialButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
//   tmpUnidadBase := 0;
   case AbsoluteIndex of
     0: begin
           buscarMaterialVende;
           if edMaterial.Tag <> 0 then
           begin
               if awrActivarMedidas then
               begin
                  qyMateriales_Medidas.Close;
                  qyMateriales_Medidas.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
                  qyMateriales_Medidas.Open;

                  qyMateriales_Colores.Close;
                  qyMateriales_Colores.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
                  qyMateriales_Colores.Open;

                  if not(qyMateriales_Medidas.IsEmpty) then
                     cbMedidas.KeyValue := qyMateriales_Medidas.FieldByName('R_ID_MEDIDA').AsInteger;

                  if not(qyMateriales_Colores.IsEmpty) then
                     cbColores.KeyValue := qyMateriales_Colores.FieldByName('R_COLOR').AsInteger;
                     
               end;

               if awrActivarMedidas then
                  cbMedidas.SetFocus
               else
                  edCantidad.SetFocus;
           end;
        end;
     1: begin
           limpiar;
        end;
     2: begin
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

procedure TfrmSKUGenerar.buGuardarClick(Sender: TObject);
var
   medida : integer;
   color  : integer;
begin
   if (edMaterial.Tag <> 0) and (StrToInt(edCantidad.Text) <> 0) then
   begin
      medida := 0;
      color  := 0;
      if awrActivarMedidas then
      begin
         if (cbMedidas.KeyValue <> null) then
            medida := cbMedidas.KeyValue
      end;
      if awrActivarColores then
      begin
         if (cbColores.KeyValue <> null) then
            color := cbColores.KeyValue;
      end;

      spSKU_GENERAR.ParamByName('P_MI').AsInteger       := awrMI;
      spSKU_GENERAR.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
      spSKU_GENERAR.ParamByName('P_CANTIDAD').AsInteger := StrToInt(edCantidad.Text);
      spSKU_GENERAR.ParamByName('P_MEDIDA').AsInteger   := medida;
      spSKU_GENERAR.ParamByName('P_COLOR').AsInteger    := color;
      spSKU_GENERAR.ExecProc;
      spSKU_GENERAR.Transaction.CommitRetaining;

      awrDataSet.Close;
      awrDataSet.Open;

      //edMaterial.OnButtonClick(Sender, 1);

      edMaterial.SetFocus;
   end
   else
   if (edMaterial.Tag = 0) then
   begin
      ShowMessage('Falta seleccionar material, para generacion de  sku.');
   end
   else
   if (edCantidad.text = '0') then
   begin
      ShowMessage('Para la generacion de sku, la cantidad debe ser mayor a cero.');
   end;
end;

procedure TfrmSKUGenerar.edMaterialKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (key = #13) then
  begin
     //edMaterial.OnButtonClick(nil, 0);
  end;
end;

procedure TfrmSKUGenerar.FormCreate(Sender: TObject);
begin
   awrImagen := TMemoryStream.Create;
   
   dmIBData.TPreferencias.Open;

   //Activar medidas
   dmIBData.TPreferencias.Filter := 'ID = 66';
   awrActivarMedidas := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   //Activar Colores
   dmIBData.TPreferencias.Filter := 'ID = 69';
   awrActivarColores := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   awrActivarColores := awrActivarColores and awrActivarMedidas;

   paMedidas.Visible        := awrActivarMedidas;
   laColor.Visible          := awrActivarColores;
   cbColores.Visible        := awrActivarColores;
   sbRefreshColores.Visible := awrActivarColores;

{   if awrActivarColores then
   begin
      qyMateriales_Colores.Open;

      if not(qyMateriales_Colores.IsEmpty) then
         cbColores.KeyValue := qyMateriales_Colores.FieldByName('ID').AsInteger;
   end}
end;

procedure TfrmSKUGenerar.FormDestroy(Sender: TObject);
begin
   awrImagen.Free;
end;

procedure TfrmSKUGenerar.sbRefreshMedidasClick(Sender: TObject);
begin
   qyMateriales_Medidas.Close;
   qyMateriales_Medidas.Open;
end;

procedure TfrmSKUGenerar.sbRefreshColoresClick(Sender: TObject);
begin
   qyMateriales_Colores.Close;
   qyMateriales_Colores.Open;
end;

end.
