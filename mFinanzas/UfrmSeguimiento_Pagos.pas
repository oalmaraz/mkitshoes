unit UfrmSeguimiento_Pagos;

interface

uses
  UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
         Db,
  IBX.IBCustomDataSet, IBX.IBQuery,   ExtCtrls,
     StdCtrls,
    Grids, DBGrids, ComCtrls, Buttons, DBCtrls;

type
  TSeguimiento = (seSemanal, seQuincenal, seMensual);

  TfrmSeguimiento_Pagos = class(TForm)
    paTitulo: TPanel;
    paBotones: TPanel;
    qyMensual: TIBQuery;
    dsSemanal: TDataSource;
    dgMensual: TDBGrid;
    qyMensualR_0_A_30: TFloatField;
    qyMensualR_31_A_60: TFloatField;
    qyMensualR_61_A_90: TFloatField;
    qyMensualR_91_A_120: TFloatField;
    qyMensualR_TOTAL: TFloatField;
    qyMensualR_DOCUMENTOS: TIntegerField;
    buImprimir: TBitBtn;
    buVer: TBitBtn;
    qyMensualR_121_A_150: TFloatField;
    qyMensualR_151_A_180: TFloatField;
    qyMensualR_181_A_210: TFloatField;
    qyMensualR_211_A_240: TFloatField;
    qyMensualR_241_A_270: TFloatField;
    qyMensualR_271_A_300: TFloatField;
    qyMensualR_301_A_330: TFloatField;
    qyMensualR_331_A_365: TFloatField;
    qyMensualR_MAS_DE_365: TFloatField;
    FlatButton1: TBitBtn;
    FlatButton2: TBitBtn;
    FlatButton3: TBitBtn;
    edFecha: TDateTimePicker;
    fcButtonGroup1: TPanel;
    buSemanal: TBitBtn;
    buMensual: TBitBtn;
    Label1: TLabel;
    Label3: TLabel;
    edProveedor: TEdit;
    dgSemanal: TDBGrid;
    qySemanal: TIBQuery;
    qySemanalR_0_A_6: TFloatField;
    qySemanalR_7_A_13: TFloatField;
    qySemanalR_14_A_20: TFloatField;
    qySemanalR_21_A_27: TFloatField;
    qySemanalR_28_A_34: TFloatField;
    qySemanalR_MAS_DE_34: TFloatField;
    qySemanalR_TOTAL: TFloatField;
    qySemanalR_DOCUMENTOS: TIntegerField;
    dsMensual: TDataSource;
    qyMensualR_PROVEEDOR: TIntegerField;
    qyMensualR_PROVEEDOR_CLAVE: TIBStringField;
    qyMensualR_PROVEEDOR_NOMBRE: TIBStringField;
    qySemanalR_PROVEEDOR: TIntegerField;
    qySemanalR_PROVEEDOR_CLAVE: TIBStringField;
    qySemanalR_PROVEEDOR_NOMBRE: TIBStringField;
    dgQuincenal: TDBGrid;
    buQuincenal: TBitBtn;
    qyQuincenal: TIBQuery;
    dsQuincenal: TDataSource;
    qyQuincenalR_PROVEEDOR: TIntegerField;
    qyQuincenalR_PROVEEDOR_CLAVE: TIBStringField;
    qyQuincenalR_PROVEEDOR_NOMBRE: TIBStringField;
    qyQuincenalR_0_A_15: TFloatField;
    qyQuincenalR_16_A_30: TFloatField;
    qyQuincenalR_31_A_45: TFloatField;
    qyQuincenalR_46_A_60: TFloatField;
    qyQuincenalR_61_A_75: TFloatField;
    qyQuincenalR_76_A_90: TFloatField;
    qyQuincenalR_MAS_DE_90: TFloatField;
    qyQuincenalR_TOTAL: TFloatField;
    qyQuincenalR_DOCUMENTOS: TIntegerField;
    buImprimirS: TBitBtn;
    qyMensualR_MONEDA: TIntegerField;
    qyMensualR_MONEDA_C: TIBStringField;
    qyMensualR_MONEDA_D: TIBStringField;
    qySemanalR_MONEDA: TIntegerField;
    qySemanalR_MONEDA_C: TIBStringField;
    qySemanalR_MONEDA_D: TIBStringField;
    qyQuincenalR_MONEDA: TIntegerField;
    qyQuincenalR_MONEDA_C: TIBStringField;
    qyQuincenalR_MONEDA_D: TIBStringField;
    Shape1: TShape;
    Label2: TLabel;
    Shape17: TShape;
    cbMonedas: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dgMensualBTN_CXCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buVerClick(Sender: TObject);
    procedure FlatButton1Click(Sender: TObject);
    procedure FlatButton2Click(Sender: TObject);
    procedure FlatButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edProveedorButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edProveedorKeyPress(Sender: TObject; var Key: Char);
    procedure buSemanalClick(Sender: TObject);
    procedure buMensualClick(Sender: TObject);
    procedure buQuincenalClick(Sender: TObject);
    procedure buImprimirSClick(Sender: TObject);
  private
    { Private declarations }
    awrSeguimiento : TSeguimiento;
    procedure cambiarFocus;
  public
    { Public declarations }
  end;

var
  frmSeguimiento_Pagos: TfrmSeguimiento_Pagos;

implementation

uses
  FileCtrl, IBModulo, UfrmEstadoDeCuentas, reglas_de_negocios, IBData,
  UfrmSeleccionarProveedor, UfrmCuentasPorPagar, URPT_SEGUIMIENTO_SEM_DET_PAGOS;

{$R *.DFM}

procedure TfrmSeguimiento_Pagos.cambiarFocus;
begin
   if edFecha.Focused then
   begin
      edProveedor.SetFocus;
      edFecha.SetFocus;
   end;
end;


procedure TfrmSeguimiento_Pagos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSeguimiento_Pagos.dgMensualBTN_CXCButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   i       : integer;
   iFound  : integer;
begin
   iFound := -1;
   for i := 0 to Screen.FormCount - 1 do
      if Screen.Forms[i].name = 'frmEstadoDeCuentas' then
      begin
         iFound := i;
         break;
      end;

   if iFound >= 0 then
   begin
      frmEstadoDeCuentas.Show;

      case awrSeguimiento of
          seSemanal: frmCuentasPorPagar.Proveedor := dsSemanal.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
        seQuincenal: frmCuentasPorPagar.Proveedor := dsQuincenal.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
          seMensual: frmCuentasPorPagar.Proveedor := dsMensual.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
      end;
   end
   else
     begin
        frmCuentasPorPagar         := TfrmCuentasPorPagar.Create(Application);
        frmCuentasPorPagar.Usuario := reglas.dame_usuario;
        frmCuentasPorPagar.Nivel   := reglas.dameUsuarioNivel;
        frmCuentasPorPagar.Show;
        case awrSeguimiento of
            seSemanal: frmCuentasPorPagar.Proveedor := dsSemanal.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
          seQuincenal: frmCuentasPorPagar.Proveedor := dsQuincenal.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
            seMensual: frmCuentasPorPagar.Proveedor := dsMensual.DataSet.FieldByName('R_PROVEEDOR_CLAVE').AsString;
        end;
     end
end;

procedure TfrmSeguimiento_Pagos.buVerClick(Sender: TObject);
begin
   case awrSeguimiento of
       seSemanal: buSemanal.Click;
     seQuincenal: buQuincenal.Click;
       seMensual: buMensual.Click;
   end;
end;

procedure TfrmSeguimiento_Pagos.FlatButton1Click(Sender: TObject);
var
   tmp : string;
   fileName : string;
begin
   if SelectDirectory('Seleccionar Directorio', '', tmp) then
   begin
      if tmp <> '' then
      begin
         case awrSeguimiento of
             seSemanal: begin
                           fileName := tmp+'\ExportarCobranzaSemanl.xls';
                           //dgSemanal.SaveToXLS(fileName, true);
                        end;
           seQuincenal: begin
                           fileName := tmp+'\ExportarCobranzaQuincenal.xls';
                           //dgQuincenal.SaveToXLS(fileName, true);
                        end;
             seMensual: begin
                           fileName := tmp+'\ExportarCobranzaMensual.xls';
                           //dgMensual.SaveToXLS(fileName, true);
                        end;
         end;
      end;
   end;
end;

procedure TfrmSeguimiento_Pagos.FlatButton2Click(Sender: TObject);
var
   tmp : string;
   fileName : string;
begin
   if SelectDirectory('Seleccionar Directorio', '', tmp) then
   begin
      if tmp <> '' then
      begin
         case awrSeguimiento of
             seSemanal: begin
                           fileName := tmp+'\ExportarCobranzaSemanal.xml';
                           //dgSemanal.SaveToXML(fileName, true);
                        end;
           seQuincenal: begin
                           fileName := tmp+'\ExportarCobranzaQuincenal.xml';
                           //dgQuincenal.SaveToXML(fileName, true);
                        end;
             seMensual: begin
                           fileName := tmp+'\ExportarCobranzaMensual.xml';
                           //dgMensual.SaveToXML(fileName, true);
                        end;
         end;
      end;
   end;
end;

procedure TfrmSeguimiento_Pagos.FlatButton3Click(Sender: TObject);
var
   tmp : string;
   fileName : string;
begin
   if SelectDirectory('Seleccionar Directorio', '', tmp) then
   begin
      if tmp <> '' then
      begin
         case awrSeguimiento of
             seSemanal: begin
                           fileName := tmp+'\ExportarCobranzaSemanal.htm';
                           //dgSemanal.SaveToHTML(fileName, true);
                        end;
           seQuincenal: begin
                           fileName := tmp+'\ExportarCobranzaQuincenal.htm';
                           //dgQuincenal.SaveToHTML(fileName, true);
                        end;
             seMensual: begin
                           fileName := tmp+'\ExportarCobranzaMensual.htm';
                           //dgMensual.SaveToHTML(fileName, true);
                        end;
         end;
      end;
   end;
end;

procedure TfrmSeguimiento_Pagos.FormCreate(Sender: TObject);
begin
   awrSeguimiento := seSemanal;
   
   dmIBData.spFECHA_SERVIDOR_SH.ExecProc;
   edFecha.Date := dmIBData.spFECHA_SERVIDOR_SH.ParamByName('R_FECHA').AsDate;

   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   reglas.refresh_IBQuery(dmIBData.qyMonedas);
   //Moneda base
   dmIBData.TPreferencias.Filter := 'ID = 3';
   cbMonedas.KeyValue := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

procedure TfrmSeguimiento_Pagos.edProveedorButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
  case AbsoluteIndex of
    0 : begin
           frmSeleccionarProveedor             := TfrmSeleccionarProveedor.Create(Application);
           frmSeleccionarProveedor.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarProveedor.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarProveedor.CLAVE       := edProveedor.Text;
           if frmSeleccionarProveedor.abrirConsulta then
           begin
              frmSeleccionarProveedor.ShowModal;
              if frmSeleccionarProveedor.ACEPTAR then
              begin
                 edProveedor.Tag  := frmSeleccionarProveedor.ID;
                 edProveedor.Text := frmSeleccionarProveedor.FACTURAR_A;
                //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           end
           else
              begin
                 edProveedor.Tag  := frmSeleccionarProveedor.ID;
                 edProveedor.Text := frmSeleccionarProveedor.FACTURAR_A;
                 //edProveedor.SetSelection(Length(edProveedor.Text),Length(edProveedor.Text),false);
              end;
           frmSeleccionarProveedor.Free;
           frmSeleccionarProveedor := nil;
        end;
    1 : begin
           edProveedor.Tag  := 0;
           edProveedor.Text := '';
        end;
  end;
end;

procedure TfrmSeguimiento_Pagos.edProveedorKeyPress(Sender: TObject;
  var Key: Char);
begin
{
  if (Key = #13) then
     edProveedor.OnButtonClick(Sender, 0);
     }
end;

procedure TfrmSeguimiento_Pagos.buSemanalClick(
  Sender: TObject);
begin
   awrSeguimiento      := seSemanal;

   dgSemanal.Align     := alClient;
   //buSemanal.Down      := true;
   dgSemanal.Visible   := true;

   //buQuincenal.Down    := false;
   dgQuincenal.Visible := false;

   //buMensual.Down      := false;
   dgMensual.Visible   := false;

   qySemanal.Close;
   qySemanal.ParamByName('P_FECHA').AsDate        := edFecha.Date;
   qySemanal.ParamByName('P_PROVEEDOR').AsInteger := edProveedor.Tag;
   qySemanal.ParamByName('P_MONEDA').AsInteger    := cbMonedas.KeyValue;
   qySemanal.Open;
end;

procedure TfrmSeguimiento_Pagos.buMensualClick(
  Sender: TObject);
begin
   awrSeguimiento      := seMensual;

   //buSemanal.Down      := false;
   dgSemanal.Visible   := false;

   //buQuincenal.Down    := false;
   dgQuincenal.Visible := false;

   dgMensual.Align     := alClient;
   //buMensual.Down      := true;
   dgMensual.Visible   := true;

   qyMensual.Close;
   qyMensual.ParamByName('P_FECHA').AsDate        := edFecha.Date;
   qyMensual.ParamByName('P_PROVEEDOR').AsInteger := edProveedor.Tag;
   qyMensual.ParamByName('P_MONEDA').AsInteger    := cbMonedas.KeyValue;
   qyMensual.Open;
end;

procedure TfrmSeguimiento_Pagos.buQuincenalClick(Sender: TObject);
begin
   awrSeguimiento      := seQuincenal;

   //buSemanal.Down      := false;
   dgSemanal.Visible   := false;

   dgQuincenal.Align   := alClient;
   //buQuincenal.Down    := true;
   dgQuincenal.Visible := true;

   //buMensual.Down      := false;
   dgMensual.Visible   := false;

   qyQuincenal.Close;
   qyQuincenal.ParamByName('P_FECHA').AsDate        := edFecha.Date;
   qyQuincenal.ParamByName('P_PROVEEDOR').AsInteger := edProveedor.Tag;
   qyQuincenal.ParamByName('P_MONEDA').AsInteger    := cbMonedas.KeyValue;
   qyQuincenal.Open;
end;

procedure TfrmSeguimiento_Pagos.buImprimirSClick(Sender: TObject);
begin
   cambiarFocus;
   RPT_SEGUIMIENTO_SEM_DET_PAGOS := TRPT_SEGUIMIENTO_SEM_DET_PAGOS.Create(Self);
   try
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.FECHA     := edFecha.Date;
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.PROVEEDOR := edProveedor.Tag;
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.open;
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.imprimir;
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.openResumen;
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.imprimirResumen;
   finally
      RPT_SEGUIMIENTO_SEM_DET_PAGOS.Free;
   end;
end;

end.
