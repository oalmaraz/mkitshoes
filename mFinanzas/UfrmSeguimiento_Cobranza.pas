unit UfrmSeguimiento_Cobranza;

interface

uses
  UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
         Db,
  IBX.IBCustomDataSet, IBX.IBQuery,   ExtCtrls,
     StdCtrls,
    ComCtrls, Grids, DBGrids, Buttons,   
     DBCtrls;

type
  TSeguimiento = (seSemanal, seQuincenal, seMensual);

  TfrmSeguimiento_Cobranza = class(TForm)
    paTitulo: TPanel;
    paBotones: TPanel;
    qyMensual: TIBQuery;
    dsSemanal: TDataSource;
    dgMensual: TDBGrid;
    qyMensualR_CLIENTE: TIntegerField;
    qyMensualR_CLIENTE_CLAVE: TIBStringField;
    qyMensualR_CLIENTE_NOMBRE: TIBStringField;
    qyMensualR_EXTENSION: TIntegerField;
    qyMensualR_EXTENSION_NOMBRE: TIBStringField;
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
    edCliente: TEdit;
    dgSemanal: TDBGrid;
    qySemanal: TIBQuery;
    qySemanalR_CLIENTE: TIntegerField;
    qySemanalR_CLIENTE_CLAVE: TIBStringField;
    qySemanalR_CLIENTE_NOMBRE: TIBStringField;
    qySemanalR_EXTENSION: TIntegerField;
    qySemanalR_EXTENSION_NOMBRE: TIBStringField;
    qySemanalR_0_A_6: TFloatField;
    qySemanalR_7_A_13: TFloatField;
    qySemanalR_14_A_20: TFloatField;
    qySemanalR_21_A_27: TFloatField;
    qySemanalR_28_A_34: TFloatField;
    qySemanalR_MAS_DE_34: TFloatField;
    qySemanalR_TOTAL: TFloatField;
    qySemanalR_DOCUMENTOS: TIntegerField;
    dsMensual: TDataSource;
    buQuincenal: TBitBtn;
    qyQuincenal: TIBQuery;
    dsQuincenal: TDataSource;
    qyQuincenalR_CLIENTE: TIntegerField;
    qyQuincenalR_CLIENTE_CLAVE: TIBStringField;
    qyQuincenalR_CLIENTE_NOMBRE: TIBStringField;
    qyQuincenalR_EXTENSION: TIntegerField;
    qyQuincenalR_EXTENSION_NOMBRE: TIBStringField;
    qyQuincenalR_0_A_15: TFloatField;
    qyQuincenalR_16_A_30: TFloatField;
    qyQuincenalR_31_A_45: TFloatField;
    qyQuincenalR_46_A_60: TFloatField;
    qyQuincenalR_61_A_75: TFloatField;
    qyQuincenalR_76_A_90: TFloatField;
    qyQuincenalR_MAS_DE_90: TFloatField;
    qyQuincenalR_TOTAL: TFloatField;
    qyQuincenalR_DOCUMENTOS: TIntegerField;
    dgQuincenal: TDBGrid;
    buImprimirS: TBitBtn;
    qySemanalR_ROW: TIntegerField;
    qyQuincenalR_ROW: TIntegerField;
    qyMensualR_ROW: TIntegerField;
    qyMensualR_VENDEDOR: TIntegerField;
    qyMensualR_VENDEDOR_C: TIBStringField;
    qyMensualR_VENDEDOR_N: TIBStringField;
    qySemanalR_VENDEDOR: TIntegerField;
    qySemanalR_VENDEDOR_C: TIBStringField;
    qySemanalR_VENDEDOR_N: TIBStringField;
    qyQuincenalR_VENDEDOR: TIntegerField;
    qyQuincenalR_VENDEDOR_C: TIBStringField;
    qyQuincenalR_VENDEDOR_N: TIBStringField;
    qyMensualR_X_VENCER: TFloatField;
    qySemanalR_X_VENCER: TFloatField;
    qyQuincenalR_X_VENCER: TFloatField;
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
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
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
  frmSeguimiento_Cobranza: TfrmSeguimiento_Cobranza;

implementation

uses
  FileCtrl, IBModulo, UfrmEstadoDeCuentas, reglas_de_negocios, IBData,
  UfrmSeleccionarCliente, URPT_SEGUIMIENTO_SEM_DET;

{$R *.DFM}

procedure TfrmSeguimiento_Cobranza.cambiarFocus;
begin
   if edFecha.Focused then
   begin
      edCliente.SetFocus;
      edFecha.SetFocus;
   end;
end;


procedure TfrmSeguimiento_Cobranza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmSeguimiento_Cobranza.dgMensualBTN_CXCButtonClick(
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
          seSemanal: frmEstadoDeCuentas.Cliente := dsSemanal.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
        seQuincenal: frmEstadoDeCuentas.Cliente := dsQuincenal.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
          seMensual: frmEstadoDeCuentas.Cliente := dsMensual.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
      end;
   end
   else
     begin
        frmEstadoDeCuentas         := TfrmEstadoDeCuentas.Create(Application);
        frmEstadoDeCuentas.Tipo    := tfEstadoCtas;
        frmEstadoDeCuentas.Usuario := reglas.dame_usuario;
        frmEstadoDeCuentas.Nivel   := reglas.dameUsuarioNivel;
        frmEstadoDeCuentas.Show;
        case awrSeguimiento of
            seSemanal: frmEstadoDeCuentas.Cliente := dsSemanal.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
          seQuincenal: frmEstadoDeCuentas.Cliente := dsQuincenal.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
            seMensual: frmEstadoDeCuentas.Cliente := dsMensual.DataSet.FieldByName('R_CLIENTE_CLAVE').AsString;
        end;
     end
end;

procedure TfrmSeguimiento_Cobranza.buVerClick(Sender: TObject);
begin
   cambiarFocus;
   case awrSeguimiento of
       seSemanal: buSemanal.Click;
     seQuincenal: buQuincenal.Click;
       seMensual: buMensual.Click;
   end;
end;

procedure TfrmSeguimiento_Cobranza.FlatButton1Click(Sender: TObject);
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
                           fileName := tmp+'\ExportarCobranzaSemanal.xls';
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

procedure TfrmSeguimiento_Cobranza.FlatButton2Click(Sender: TObject);
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

procedure TfrmSeguimiento_Cobranza.FlatButton3Click(Sender: TObject);
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

procedure TfrmSeguimiento_Cobranza.FormCreate(Sender: TObject);
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

procedure TfrmSeguimiento_Cobranza.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
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
                 edCliente.Tag  := frmSeleccionarCliente.ID;
                 edCliente.Text := frmSeleccionarCliente.NOMBRE;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           end
           else
              begin
                 edCliente.Tag  := frmSeleccionarCliente.ID;
                 edCliente.Text := frmSeleccionarCliente.NOMBRE;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
              end;
           frmSeleccionarCliente.Free;
           frmSeleccionarCliente := nil;
        end;
    1 : begin
           edCliente.Tag  := 0;
           edCliente.Text := '';
        end;
  end;
end;

procedure TfrmSeguimiento_Cobranza.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
{
  if (Key = #13) then
     edCliente.OnButtonClick(Sender, 0);
     }
end;

procedure TfrmSeguimiento_Cobranza.buSemanalClick(
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
   qySemanal.ParamByName('P_FECHA').AsDate      := edFecha.Date;
   qySemanal.ParamByName('P_CLIENTE').AsInteger := edCliente.Tag;
   qySemanal.ParamByName('P_MONEDA').AsInteger  := cbMonedas.KeyValue;
   qySemanal.Open;
end;

procedure TfrmSeguimiento_Cobranza.buMensualClick(
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
   qyMensual.ParamByName('P_FECHA').AsDate      := edFecha.Date;
   qyMensual.ParamByName('P_CLIENTE').AsInteger := edCliente.Tag;
   qyMensual.ParamByName('P_MONEDA').AsInteger  := cbMonedas.KeyValue;
   qyMensual.Open;
end;

procedure TfrmSeguimiento_Cobranza.buQuincenalClick(Sender: TObject);
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
   qyQuincenal.ParamByName('P_FECHA').AsDate      := edFecha.Date;
   qyQuincenal.ParamByName('P_CLIENTE').AsInteger := edCliente.Tag;
   qyQuincenal.ParamByName('P_MONEDA').AsInteger  := cbMonedas.KeyValue;
   qyQuincenal.Open;
end;

procedure TfrmSeguimiento_Cobranza.buImprimirSClick(Sender: TObject);
begin
   cambiarFocus;
   RPT_SEGUIMIENTO_SEM_DET := TRPT_SEGUIMIENTO_SEM_DET.Create(Self);
   try
      RPT_SEGUIMIENTO_SEM_DET.FECHA   := edFecha.Date;
      RPT_SEGUIMIENTO_SEM_DET.CLIENTE := edCliente.Tag;
      RPT_SEGUIMIENTO_SEM_DET.open;
      RPT_SEGUIMIENTO_SEM_DET.imprimir;
      RPT_SEGUIMIENTO_SEM_DET.openResumen;
      RPT_SEGUIMIENTO_SEM_DET.imprimirResumen;
   finally
      RPT_SEGUIMIENTO_SEM_DET.Free;
   end;
end;

end.
