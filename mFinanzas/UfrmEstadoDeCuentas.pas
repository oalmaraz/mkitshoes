unit UfrmEstadoDeCuentas;

interface

uses
  UTipos, UTypeEstadoDeCuentas, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus,
  ExtCtrls,   StdCtrls, Mask, DBCtrls, jpeg, Db,
  IBX.IBCustomDataSet, IBX.IBStoredProc, Grids, DBGrids, Buttons, FileCtrl,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxButtonEdit;

type
  TfrmEstadoDeCuentas = class(TForm)
    Panel2: TPanel;
    paLienzo: TPanel;
    laAlmacen: TLabel;
    laCaja: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    laImporte: TLabel;
    ibPagos: TBitBtn;
    ibColapsar: TBitBtn;
    ibExpandir: TBitBtn;
    Label11: TLabel;
    Label17: TLabel;
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    laPago: TLabel;
    shPago: TShape;
    shLinea2: TShape;
    cbEstatus: TDBComboBox;
    edFUltimaCompra: TEdit;
    edCliente: TEdit;
    edFUltimoPago: TEdit;
    edNombre: TEdit;
    edLimite: TEdit;
    edSaldoCliente: TEdit;
    edSaldoExtension: TEdit;
    edSaldoVencido: TEdit;
    edAlmacen: TEdit;
    edCaja: TEdit;
    edVencido: TEdit;
    cbTodos: TCheckBox;
    edImporte: TEdit;
    Shape3: TShape;
    Shape4: TShape;
    Label3: TLabel;
    laVencido: TLabel;
    shLinea3: TShape;
    shVencido: TShape;
    Bevel1: TBevel;
    Label4: TLabel;
    Shape5: TShape;
    Shape6: TShape;
    edFecha: TEdit;
    Label6: TLabel;
    edSaldoTotal: TEdit;
    paFoto: TPanel;
    imFoto: TImage;
    paFirma: TPanel;
    imFirma: TImage;
    dgPartidas: TDBGrid;
    sbHijo: TPanel;
    Label8: TLabel;
    deID: TDBEdit;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    Shape9: TShape;
    Label18: TLabel;
    Shape10: TShape;
    tiCerrar: TTimer;
    ppFunciones: TPopupMenu;
    ImpresionRejilla1: TMenuItem;
    ImpresionDetalle1: TMenuItem;
    Verdetalledelaventa1: TMenuItem;
    Vermensajescliente1: TMenuItem;
    Verdetalledelpago1: TMenuItem;
    Shape12: TShape;
    hlF3: TBitBtn;
    hlF4: TBitBtn;
    hlF5: TBitBtn;
    ReImpresion1: TMenuItem;
    Ejecutar1: TMenuItem;
    hlEstatus: TBitBtn;
    ibExportar: TBitBtn;
    Shape11: TShape;
    Shape13: TShape;
    Label2: TLabel;
    edTelefono: TEdit;
    ibPrintRejilla: TBitBtn;
    ibDetalle: TBitBtn;
    ibCorte: TBitBtn;
    Label10: TLabel;
    Label20: TLabel;
    Shape14: TShape;
    Shape15: TShape;
    ibReImprimir: TBitBtn;
    ibEjecutar: TBitBtn;
    edUsuario: TEdit;
    paFPago: TPanel;
    imBack: TImage;
    buGrupo: TPanel;
    buAutomatico: TBitBtn;
    buVencido: TBitBtn;
    buManual: TBitBtn;
    buModificado: TBitBtn;
    laPanel: TBitBtn;
    ibSaldos: TBitBtn;
    Shape7: TShape;
    Label5: TLabel;
    Shape8: TShape;
    edMoneda: TEdit;
    buChqRecibidos: TBitBtn;
    paDepositos: TPanel;
    Label23: TLabel;
    laMonto: TLabel;
    laMoneda: TLabel;
    beTC: TBevel;
    laTC: TLabel;
    beMBase: TBevel;
    laMBase: TLabel;
    laMBaseD: TLabel;
    edMonto: TEdit;
    edTC: TEdit;
    edMBase: TEdit;
    spCONVERSION_MONEDA_BASE: TIBStoredProc;
    buMonto: TBitBtn;
    cxPartidas: TcxGrid;
    cxPartidasDBTableView1: TcxGridDBTableView;
    cxPartidasLevel1: TcxGridLevel;
    cxPartidasDBTableView1Column1: TcxGridDBColumn;
    cxPartidasDBTableView1Column3: TcxGridDBColumn;
    cxPartidasDBTableView1Column4: TcxGridDBColumn;
    cxPartidasDBTableView1Column5: TcxGridDBColumn;
    cxPartidasDBTableView1Column6: TcxGridDBColumn;
    cxPartidasDBTableView1Column7: TcxGridDBColumn;
    cxPartidasDBTableView1Column2: TcxGridDBColumn;
    cxPartidasDBTableView1Column8: TcxGridDBColumn;
    cxPartidasDBTableView1Column9: TcxGridDBColumn;
    cxPartidasDBTableView1Column10: TcxGridDBColumn;
    cxPartidasDBTableView1Column11: TcxGridDBColumn;
    cxPartidasDBTableView1Column12: TcxGridDBColumn;
    cxPartidasDBTableView1Column13: TcxGridDBColumn;
    cxPartidasDBTableView1Column14: TcxGridDBColumn;
    cxPartidasDBTableView1Column15: TcxGridDBColumn;
    cxPartidasDBTableView1Column16: TcxGridDBColumn;
    cxPartidasDBTableView1Column17: TcxGridDBColumn;
    cxPartidasDBTableView1Column18: TcxGridDBColumn;
    cxPartidasDBTableView1Column19: TcxGridDBColumn;
    cxPartidasDBTableView1Column20: TcxGridDBColumn;
    cxPartidasDBTableView1Column21: TcxGridDBColumn;
    cxPartidasDBTableView1Column22: TcxGridDBColumn;
    cxPartidasDBTableView1Column23: TcxGridDBColumn;
    r_color: TcxGridDBColumn;
    cxPartidasDBTableView1Column25: TcxGridDBColumn;
    r_seleccion: TcxGridDBColumn;
    ComboBox1: TComboBox;
    procedure edClienteButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edClienteKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imFotoDblClick(Sender: TObject);
    procedure imFirmaDblClick(Sender: TObject);
    procedure ibSalirClick(Sender: TObject);
    procedure tiCerrarTimer(Sender: TObject);
    procedure edSaldoVencidoButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edSaldoVencidoKeyPress(Sender: TObject; var Key: Char);
    procedure ibPagosClick(Sender: TObject);
    procedure edImporteChange(Sender: TObject);
    procedure edImporteKeyPress(Sender: TObject; var Key: Char);
    procedure cbTodosChange(Sender: TObject);
    procedure cbEstatusChange(Sender: TObject);
    procedure dgPartidasDblClick(Sender: TObject);
    procedure dgPartidasKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
    procedure hlF3Click(Sender: TObject);
    procedure hlF4Click(Sender: TObject);
    procedure dgPartidasMODIFICARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure hlF5Click(Sender: TObject);
    procedure hlEstatusClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ibExportarClick(Sender: TObject);
    procedure dgPartidasNCREDITOSINAFECTARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasNCREDITOAFECTADASButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasNCARGOSINAFECTARButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasNCARGOAFECTADASButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibPrintRejillaClick(Sender: TObject);
    procedure ibDetalleClick(Sender: TObject);
    procedure ibCorteClick(Sender: TObject);
    procedure ibReImprimirClick(Sender: TObject);
    procedure ibEjecutarClick(Sender: TObject);
    procedure buAutomaticoClick(Sender: TObject);
    procedure buVencidoClick(Sender: TObject);
    procedure buManualClick(Sender: TObject);
    procedure buModificadoClick(Sender: TObject);
    procedure laPanelDblClick(Sender: TObject);
    procedure dgPartidasF3ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasF4ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasF5ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure ibSaldosClick(Sender: TObject);
    procedure buChqRecibidosClick(Sender: TObject);
    procedure buMontoClick(Sender: TObject);
    procedure cxPartidasDBTableView1Column4PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxPartidasDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure cxPartidasDBTableView1CellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    cuantos  : integer;
    tmFotoH  : integer;
    tmFotoW  : integer;
    tmFirmaH : integer;
    tmFirmaW : integer;
    awrForma   : TTypeForma;
    awrUsuario : integer;
    awrNivel   : integer;
    awrMBase    : integer;
    awrDeposito : integer;
    procedure setPantalla(valor : TTypeForma);
    procedure setUsuario(valor : integer);
    function getPantalla : TTypeForma;
    procedure habilitarComponentes;
    procedure CargarDatosCaja;
    procedure CargarDatoUsuario;
    procedure CargarEncabezado;
    procedure Foto;
    procedure Firma;
    procedure setCliente(valor : string);
  protected
    EstadoDeCuentas : TEstadoDeCuentas;
  public
    { Public declarations }
    procedure preview_depositos_y_anticipos(p_monto : double; p_moneda : Integer);
  published
    property Tipo     : TTypeForma read getPantalla write setPantalla;
    property Usuario  : integer read awrUsuario write setUsuario;
    property Nivel    : integer read awrNivel write awrNivel;
    property Cliente  : string write setCliente;
    property DEPOSITO : integer read awrDeposito write awrDeposito;
  end;

var
  frmEstadoDeCuentas: TfrmEstadoDeCuentas;

implementation

uses
  UfrmVencidos,  IBData,
  reglas_de_negocios, UfrmSeleccionMoneda,
  PRN_CORTE_CAJAS_CtasXCobrar, capturar_busqueda_pagos, PRN_0007_Pagos,
  UfrmAcceso, UfrmChequesR, UfrmSeleccionarCliente_, UfrmBusquedaMontosCXC;

{$R *.DFM}

procedure TfrmEstadoDeCuentas.preview_depositos_y_anticipos(p_monto : double; p_moneda : Integer);
var
   ver : boolean;
begin
   paDepositos.Visible := true;
   edMonto.Text       := FloatToStr(p_monto);
   ver                 := awrMBase <> p_moneda;

   beTC.Visible := ver;
   laTC.Visible := ver;
   edTC.Visible := ver;

   beMBase.Visible  := ver;
   laMBase.Visible  := ver;
   edMBase.Visible  := ver;
   laMBaseD.Visible := ver;
   laMBaseD.Caption := edMoneda.Text;

   //Tipo de Cambio
   spCONVERSION_MONEDA_BASE.ParamByName('P_MONEDA').AsInteger := p_moneda;
   spCONVERSION_MONEDA_BASE.ParamByName('P_CANTIDAD').AsFloat := 1;
   spCONVERSION_MONEDA_BASE.ExecProc;
   edTC.Text := spCONVERSION_MONEDA_BASE.ParamByName('R_RESULTADO').AsString;
   //Moneda Secundaria
   spCONVERSION_MONEDA_BASE.ParamByName('P_MONEDA').AsInteger := p_moneda;
   spCONVERSION_MONEDA_BASE.ParamByName('P_CANTIDAD').AsFloat := p_monto;
   spCONVERSION_MONEDA_BASE.ExecProc;
   edMBase.Text := spCONVERSION_MONEDA_BASE.ParamByName('R_RESULTADO').AsString;

   dmIBData.TFiltroMonedas.Filter := 'ID = ' + IntToStr(p_moneda);
   laMoneda.Caption := dmIBData.TFiltroMonedas.FieldByName('DESCRIPCION').AsString;
end;

procedure TfrmEstadoDeCuentas.setCliente(valor : string);
begin
   edCliente.Text := valor;
   edClienteButtonClick(nil, 0);
   edCliente.SetFocus;
end;

procedure TfrmEstadoDeCuentas.Foto;
begin
   paFoto.Height   := tmFotoH;
   paFoto.Width    := tmFotoW;

   imFoto.AutoSize  := false;
   imFoto.Align     := alClient;
   //imFoto.DrawStyle := dsProportional;
end;

procedure TfrmEstadoDeCuentas.Firma;
begin
   paFirma.Height := tmFirmaH;
   paFirma.Width  := tmFirmaW;

   imFirma.AutoSize  := false;
   imFirma.Align     := alClient;
   //imFirma.DrawStyle := dsProportional;
end;

procedure TfrmEstadoDeCuentas.CargarEncabezado;
begin
   Foto;
   Firma;
   edFUltimaCompra.Text  := FormatDateTime('dd/mm/yyyy',EstadoDeCuentas.FECHA_ULT_COMPRA);
   edFUltimoPago.Text    := FormatDateTime('dd/mm/yyyy',EstadoDeCuentas.FECHA_ULT_PAGO);
   edLimite.Text         := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.LIMITE_CREDITO);
   edSaldoCliente.Text   := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.SALDO_CLIENTE);
   edSaldoExtension.Text := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.SALDO_EXTENSION);
   edSaldoTotal.Text     := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.SALDO_TOTAL);
   edSaldoVencido.Text   := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.SALDO_T_VENCIDO);
   edVencido.Text        := FormatFloat('$ ###,###,##0.00',EstadoDeCuentas.SALDO_VENCIDO);
   edTelefono.Text       := EstadoDeCuentas.TELEFONO;
   EstadoDeCuentas.imagenVer(EstadoDeCuentas.FOTO, imFoto);
   EstadoDeCuentas.imagenVer(EstadoDeCuentas.FIRMA, imFirma);
   ibExpandir.Click;

   dgPartidas.DataSource.DataSet.First;

   if edImporte.Visible and (EstadoDeCuentas.CLIENTE <> -3) and (EstadoDeCuentas.SALDO_TOTAL > 0) then
   begin
      edImporte.Text       := '0.00';
      ibEjecutar.Enabled   := false;
      //buAutomatico.Down    := true;
      edImporte.SetFocus;
   end;
end;

procedure TfrmEstadoDeCuentas.CargarDatoUsuario;
begin
   edUsuario.Tag  := EstadoDeCuentas.USUARIO;
   edUsuario.Text := EstadoDeCuentas.USUARIO_NOMBRE;
end;

procedure TfrmEstadoDeCuentas.CargarDatosCaja;
begin
   edAlmacen.Tag  := EstadoDeCuentas.ALMACEN;
   edAlmacen.Text := EstadoDeCuentas.ALMACEN_NOMBRE;
   edCaja.Tag     := EstadoDeCuentas.CAJA;
   edCaja.Text    := EstadoDeCuentas.CAJA_NOMBRE;
end;

procedure TfrmEstadoDeCuentas.setUsuario(valor : integer);
begin
   EstadoDeCuentas.Usuario := valor;
   CargarDatoUsuario;

   if awrForma = tfCXC then
   begin
      EstadoDeCuentas.LoadDatosCaja;
      CargarDatosCaja;
      if EstadoDeCuentas.CAJAS = 0 then
      begin
         ShowMessage('Verificar cajas. No hay caja para este usuario asignada. Cuentas por cobrar se cerrara en 1 segundos.');
         tiCerrar.Enabled := true;
      end;
      if EstadoDeCuentas.CAJAS > 1 then
      begin
         ShowMessage('Verificar cajas. El usuario tiene mas de una caja asignada. Cuentas por cobrar se cerrara en 1 segundos.');
         tiCerrar.Enabled := true;
      end
   end
   else
      begin
         EstadoDeCuentas.TODOS   := 'Si';
      end;
end;

procedure TfrmEstadoDeCuentas.habilitarComponentes;
begin
   laPago.Visible       := awrForma = tfCXC;
   shPago.Visible       := awrForma = tfCXC;
   shLinea2.Visible     := awrForma = tfCXC;
   ibCorte.Visible      := awrForma = tfCXC;
   ibPagos.Visible      := awrForma = tfCXC;
   ibSaldos.Visible     := awrForma = tfCXC;
   laAlmacen.Visible    := awrForma = tfCXC;
   cbTodos.Visible      := awrForma = tfCXC;
   edAlmacen.Visible    := awrForma = tfCXC;
   laCaja.Visible       := awrForma = tfCXC;
   edCaja.Visible       := awrForma = tfCXC;
   paFPago.Visible      := awrForma = tfCXC;
   laVencido.Visible    := awrForma = tfCXC;
   shVencido.Visible    := awrForma = tfCXC;
   shLinea3.Visible     := awrForma = tfCXC;
   edVencido.Visible    := awrForma = tfCXC;
   laImporte.Visible    := awrForma = tfCXC;
   edImporte.Visible    := awrForma = tfCXC;
   ibEjecutar.Visible   := awrForma = tfCXC;
   ibReImprimir.Visible := awrForma = tfCXC;
   cbEstatus.Enabled    := awrForma = tfEstadoCtas;
   ReImpresion1.Visible := awrForma = tfCXC;
   Ejecutar1.Visible    := awrForma = tfCXC;
   //dgPartidasMODIFICAR.Buttons[0].Visible := awrForma = tfCXC;

   //Permitir pagar cxc de diferentes almacenes
   dmIBData.TPreferencias.Filter := 'ID = 51';
   cbTodos.Checked               := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
end;

procedure TfrmEstadoDeCuentas.setPantalla(valor : TTypeForma);
begin
   awrForma := valor;
   EstadoDeCuentas.FORMA := valor;
   habilitarComponentes;
end;

function TfrmEstadoDeCuentas.getPantalla : TTypeForma;
begin
   Result := awrForma;
end;

procedure TfrmEstadoDeCuentas.edClienteButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   case AbsoluteIndex of
     0: begin
           frmSeleccionarCliente_             := TfrmSeleccionarCliente_.Create(Application);
           frmSeleccionarCliente_.DATABASE    := EstadoDeCuentas.DATABASE;
           frmSeleccionarCliente_.TRANSACTION := EstadodeCuentas.TRANSACTION;
           frmSeleccionarCliente_.CLAVE       := edCliente.Text;
           EstadoDeCuentas.CLIENTE_CLAVE      := edCliente.Text;

           if frmSeleccionarCliente_.abrirConsulta then
           begin
              frmSeleccionarCliente_.ShowModal;
              if frmSeleccionarCliente_.ACEPTAR then
              begin
                 EstadoDeCuentas.CLIENTE        := frmSeleccionarCliente_.ID;
                 EstadoDeCuentas.CLIENTE_CLAVE  := frmSeleccionarCliente_.CLAVE;
                 EstadoDeCuentas.CLIENTE_NOMBRE := frmSeleccionarCliente_.NOMBRE;

                 edCliente.Text := frmSeleccionarCliente_.CLAVE;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
                 edNombre.Text  := frmSeleccionarCliente_.NOMBRE;
                 CargarEncabezado;
              end;
           end
           else
              begin
                 EstadoDeCuentas.CLIENTE        := frmSeleccionarCliente_.ID;
                 EstadoDeCuentas.CLIENTE_CLAVE  := frmSeleccionarCliente_.CLAVE;
                 EstadoDeCuentas.CLIENTE_NOMBRE := frmSeleccionarCliente_.NOMBRE;

                 edCliente.Text := frmSeleccionarCliente_.CLAVE;
                 //edCliente.SetSelection(Length(edCliente.Text),Length(edCliente.Text),false);
                 edNombre.Text  := frmSeleccionarCliente_.NOMBRE;
                 CargarEncabezado;
              end;
           frmSeleccionarCliente_.Free;
           frmSeleccionarCliente_ := nil;
        end;
     1: begin
           edCliente.Clear;
           edNombre.Text := '<FALTA>';

           EstadoDeCuentas.CLIENTE        := 0;
           EstadoDeCuentas.CLIENTE_NOMBRE := '<FALTA>';
           CargarEncabezado;
        end;
   end;
end;

procedure TfrmEstadoDeCuentas.edClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   begin
      edClienteButtonClick(Sender, 0);
   end;
end;                                      

procedure TfrmEstadoDeCuentas.FormCreate(Sender: TObject);
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   reglas.abrir_IBTabla(dmIBData.TFiltroMonedas);

   EstadoDeCuentas := TEstadoDeCuentas.Create;
   //dgPartidas.IniFileName := ExtractFilePath(ParamStr(0))+'Estado de Cuentas.ini';
   //dgPartidas.LoadFromIniFile(ExtractFilePath(ParamStr(0))+'Estado de Cuentas.ini');

   edFecha.Text := FormatDateTime('dd/mm/yyyy',EstadoDeCuentas.FECHA_SERVIDOR);
   tmFotoH  := paFoto.Height;
   tmFotoW  := paFoto.Width;
   tmFirmaH := paFirma.Height;
   tmFirmaW := paFirma.Width;
   cuantos  := 0;

   //Moneda base
   dmIBData.TPreferencias.Filter  := 'ID = 3';
   awrMBase := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
   dmIBData.TFiltroMonedas.Filter := 'ID = '+IntToStr(awrMBase);
   edMoneda.Text := dmIBData.TFiltroMonedas.FieldByName('CLAVE').AsString;

   dgPartidas.DataSource := EstadoDeCuentas.dsDetalle;
   deID.DataSource       := EstadoDeCuentas.dsDetalle;

   cxPartidasDBTableView1.DataController.DataSource :=     EstadoDeCuentas.dsDetalle;

   end;

procedure TfrmEstadoDeCuentas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfrmEstadoDeCuentas.imFotoDblClick(Sender: TObject);
begin
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
      Foto;
end;

procedure TfrmEstadoDeCuentas.imFirmaDblClick(Sender: TObject);
begin
   if tmFirmaH = paFirma.Height then
   begin
      imFirma.Align     := alNone;
      //imFirma.DrawStyle := dsNormal;
      imFirma.AutoSize  := true;

      paFirma.Height    := imFirma.Height + 4;
      paFirma.Width     := imFirma.Width + 4;
      paFirma.BringToFront;
   end
   else
      Firma;
end;

procedure TfrmEstadoDeCuentas.ibSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmEstadoDeCuentas.tiCerrarTimer(Sender: TObject);
begin
   if cuantos = 1 then
   begin
      Close;
   end;
   inc(cuantos,1);
end;

procedure TfrmEstadoDeCuentas.edSaldoVencidoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   try
      frmVencidos := TfrmVencidos.Crear(Application, EstadoDeCuentas.CLIENTE);
      frmVencidos.ShowModal;
   finally
      frmVencidos.Destroy;
   end;
end;

procedure TfrmEstadoDeCuentas.edSaldoVencidoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key = #13 then
     edSaldoVencidoButtonClick(nil, 0);
end;



procedure TfrmEstadoDeCuentas.ibPagosClick(Sender: TObject);
begin
   frmCapturar_busqueda_pagos := TfrmCapturar_busqueda_pagos.Create(Application);
   try
      frmCapturar_busqueda_pagos.CAJA    := EstadoDeCuentas.CAJA;
      frmCapturar_busqueda_pagos.USUARIO := EstadoDeCuentas.USUARIO;
      frmCapturar_busqueda_pagos.LoadData;
      frmCapturar_busqueda_pagos.ShowModal;
   finally
      frmCapturar_busqueda_pagos.Free;
   end;

   //por el saldo se vuelve a cargar tambien el encabezado
   if EstadoDeCuentas.CLIENTE <> 0 then
   begin
      edClienteButtonClick(Sender, 0);
      edCliente.SetFocus;
   end;
end;

procedure TfrmEstadoDeCuentas.edImporteChange(Sender: TObject);
begin
   EstadoDeCuentas.IMPORTE_A_PAGAR := StrToFloat(edImporte.Text);
   ibEjecutar.Enabled := FALSE;
end;

procedure TfrmEstadoDeCuentas.edImporteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (Key = #13) then
   begin
   {
      if buAutomatico.Down and (edImporte.Value > 0) then
         buAutomaticoClick(Sender)
      else
      if buVencido.Down then
         buVencidoClick(Sender)
      else
      if buManual.Down then
         buManualClick(Sender)
      else
      if buModificado.Down then
         buModificadoClick(Sender);
         }
   end;
end;

procedure TfrmEstadoDeCuentas.cbTodosChange(Sender: TObject);
begin
   if cbTodos.Checked then
      EstadoDeCuentas.TODOS := 'Si'
   else
      EstadoDeCuentas.TODOS := 'No';
   EstadoDeCuentas.LoadDetalle;
   ibExpandir.Click;
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmEstadoDeCuentas.ComboBox1Change(Sender: TObject);
begin
   EstadoDeCuentas.ESTATUS := cbEstatus.Text;
   EstadoDeCuentas.LoadDetalle;
   ibExpandir.Click;
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmEstadoDeCuentas.cxPartidasDBTableView1CellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
var
  index    : integer;
  indexPos : integer;
  seleccionar : boolean;
begin
   if awrForma = tfCXC then
   begin
      if EstadoDeCuentas.dsDetalle.DataSet <> nil then
      begin
         if not(EstadoDeCuentas.DETALLE_VACIO) then
         begin
            ibEjecutar.Enabled := false;
            seleccionar := true;
            if cbTodos.Checked and not(EstadoDeCuentas.PERMITIR_DIF) and
               (EstadoDeCuentas.ALMACEN <> EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ALMACEN').AsInteger) then
               seleccionar := false;
            if seleccionar then
            begin
               // index    := dgPartidas.TopIndex;
               indexPos := EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
               EstadoDeCuentas.EjecutarSeleccionado;
               ibExpandir.Click;
               //TcxCustomDataController.GotoFirst;

               // while not( TcxCustomDataController.IsEOF ) do
               begin
                  if EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger = IndexPos then
                  begin
                     // break;
                  end;
                  //TcxCustomDataController.GotoNext(true);
               end;
               //TcxCustomDataController.TopIndex := index;
            end
            else
               // meCobro.Execute;     mensaje de error
         end;
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.cxPartidasDBTableView1Column4PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  ShowMessage('On click del boton ');
end;

procedure TfrmEstadoDeCuentas.cxPartidasDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  if   (AViewInfo.GridRecord.Values[r_color.Index] = 'BLANCO') then
    begin
       ACanvas.Brush.Color := $00FDD284;
       ACanvas.Font.Color := clBlack;
    end
    else
    begin
       ACanvas.Brush.Color := clWhite;
       ACanvas.Font.Color := clBlack;
    end;

     if (AViewInfo.GridRecord.Values[r_SELECCION.Index] = 'Si' ) then
     begin
        ACanvas.Font.Color  := clWhite;
        ACanvas.Brush.Color := clRed;
     end;

end;



procedure TfrmEstadoDeCuentas.cbEstatusChange(Sender: TObject);
begin
   EstadoDeCuentas.ESTATUS := cbEstatus.Text;
   EstadoDeCuentas.LoadDetalle;
   ibExpandir.Click;
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmEstadoDeCuentas.dgPartidasDblClick(Sender: TObject);
var
  index    : integer;
  indexPos : integer;
  seleccionar : boolean;
begin
   if awrForma = tfCXC then
   begin
      if EstadoDeCuentas.dsDetalle.DataSet <> nil then
      begin
         if not(EstadoDeCuentas.DETALLE_VACIO) then
         begin
            ibEjecutar.Enabled := false;
            seleccionar := true;
            if cbTodos.Checked and not(EstadoDeCuentas.PERMITIR_DIF) and
               (EstadoDeCuentas.ALMACEN <> EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ALMACEN').AsInteger) then
               seleccionar := false;
            if seleccionar then
            begin
               //index    := dgPartidas.TopIndex;
               indexPos := EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
               EstadoDeCuentas.EjecutarSeleccionado;
               ibExpandir.Click;
               dgPartidas.DataSource.DataSet.First;
               while not(   dgPartidas.DataSource.DataSet.EOF ) do
               begin
                  if EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger = IndexPos then
                  begin
                     break;
                  end;
                  dgPartidas.DataSource.DataSet.Next;
               end;
               //dgPartidas.TopIndex := index;
            end
            else
            begin
              ShowMessage('Diferentes Almacenes. Unicamente puede cobrar de su almacen.');
            end;
         end;
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.dgPartidasKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 32 then//barra espaciadora
  begin
     dgPartidasDblClick(nil);
  end;

  {
  with TdxDBGrid(Sender) do
    if (Key = VK_RETURN) and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)]is TdxDBGridButtonColumn) then
    begin
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasF3) then
          hlF3.Click
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasF4) then
          hlF4.Click
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasF5) then
          hlF5.Click
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasMODIFICAR) then
          dgPartidasMODIFICARButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasNCREDITOSINAFECTAR) then
          dgPartidasNCREDITOSINAFECTARButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasNCREDITOAFECTADAS) then
          dgPartidasNCREDITOAFECTADASButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasNCARGOSINAFECTAR) then
          dgPartidasNCARGOSINAFECTARButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgPartidasNCARGOAFECTADAS) then
          dgPartidasNCARGOAFECTADASButtonClick(Sender, 0)
    end;
    }
end;

procedure TfrmEstadoDeCuentas.buInicioClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.First;
end;

procedure TfrmEstadoDeCuentas.buAnteriorClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Prior;
end;

procedure TfrmEstadoDeCuentas.buSiguienteClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Next;
end;

procedure TfrmEstadoDeCuentas.buFinClick(Sender: TObject);
begin
   dgPartidas.DataSource.DataSet.Last;
end;

procedure TfrmEstadoDeCuentas.hlF3Click(Sender: TObject);
begin
   EstadoDeCuentas.rptDetalleDeVtas;
end;

procedure TfrmEstadoDeCuentas.hlF4Click(Sender: TObject);
begin
   EstadoDeCuentas.rptMensajes;
end;

procedure TfrmEstadoDeCuentas.dgPartidasMODIFICARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   index    : integer;
   indexRec : integer;
begin
   if EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_SEL').AsString = 'No' then
      dgPartidasDblClick(nil);

  if EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_SEL').AsString = 'Si' then
  begin
     {
     idModificado.Entrada := EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_PAGO_MODIFICADO').AsString;
     idModificado.Execute;
     if idModificado.Respuesta then
     begin
        index    := dgPartidas.TopIndex;
        indexRec := EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        EstadoDeCuentas.pagoModificado(idModificado.Entrada);
        //busqueda del registro modificado
        ibExpandir.Click;
        dgPartidas.DataSource.DataSet.First;
        while not(dgPartidas.IsEOF) do
        begin
           if indexRec = EstadoDeCuentas.dsDetalle.DataSet.FieldByName('R_ID').AsInteger then
           begin
              break;
           end;
           dgPartidas.GotoNext(true);
        end;
        dgPartidas.TopIndex := index;
     end;
     }
  end;
end;

procedure TfrmEstadoDeCuentas.hlF5Click(Sender: TObject);
begin
   EstadoDeCuentas.rptDetallePagos;
   if EstadoDeCuentas.MovCheques then
   begin
      //por el saldo se vuelve a cargar tambien el encabezado
      edClienteButtonClick(Sender, 0);
      edCliente.SetFocus;
   end;
end;

procedure TfrmEstadoDeCuentas.hlEstatusClick(Sender: TObject);
var
   ejecutar  : boolean;
   awrNivel  : integer;
begin
   if cbEstatus.Enabled then
      cbEstatus.Enabled := false
   else
   begin
      ejecutar := true;
      awrNivel := 3;

      if (awrNivel > reglas.dameUsuarioNivel) then
      begin
         try
            Application.CreateForm(TfrmAcceso, frmAcceso);
            frmAcceso.Nivel := awrNivel;
            frmAcceso.ShowModal;
            ejecutar := frmAcceso.Rsp;
         finally
            frmAcceso.Free;
         end;
      end;

      if ejecutar then
      begin
         cbEstatus.Enabled := true;
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.FormDestroy(Sender: TObject);
begin
//   dgPartidas.SaveToIniFile(awrFileIni);
   EstadoDeCuentas.Free;
   EstadoDeCuentas := nil;
end;

procedure TfrmEstadoDeCuentas.ibExportarClick(Sender: TObject);
var
   tmp : string;
   fileName : string;
begin
   if SelectDirectory('Seleccionar Directorio', '', tmp) then
   begin
      if tmp <> '' then
      begin
         fileName := tmp+'\EdoCta '+edCliente.Text+'.xls';
         //dgPartidas.SaveToXLS(fileName, TRUE);
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.dgPartidasNCREDITOSINAFECTARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   EstadoDeCuentas.rptDetalleNCreditoSAfectar;
end;

procedure TfrmEstadoDeCuentas.dgPartidasNCREDITOAFECTADASButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   EstadoDeCuentas.rptDetalleNCreditoAfectada;
end;

procedure TfrmEstadoDeCuentas.dgPartidasNCARGOSINAFECTARButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   EstadoDeCuentas.rptDetalleNCargoSAfectar;
end;

procedure TfrmEstadoDeCuentas.dgPartidasNCARGOAFECTADASButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   EstadoDeCuentas.rptDetalleNCargoAfectada;
end;

procedure TfrmEstadoDeCuentas.ibPrintRejillaClick(Sender: TObject);
//var
//   cpPrint : TdxComponentPrinter;
//   tmp     : TdxDBGridOptionsDB;
begin
  {
  tmp := dgPartidas.OptionsDB;
  cpPrint := TdxComponentPrinter.Create(Application);
  cpPrint.OnBeforePreview := BeforePreview;
  cpPrint.AddLink(dgPartidas);
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Name  := 'Arial';
  cpPrint.ReportLink[0].PrinterPage.PageHeader.Font.Size  := 14;
  cpPrint.ReportLink[0].PrinterPage.Orientation           := poLandscape;

  cpPrint.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Add(Self.Caption);
  cpPrint.ReportLink[0].ShrinkToPageWidth := true;
  cpPrint.Preview(True, nil);
  cpPrint.Destroy;

  dgPartidas.OptionsDB := tmp;
  }
end;

procedure WinExecNoWait32(FileName:String; Visibility : integer);
{Ejectuta el programa y espera a que termine.
Las opciones de visibilidad son las típicas
en estos casos: SW_HIDE, SW_MAXIMIZE, SW_MINIMIZE, SW_RESTORE,
                SW_SHOW, SW_SHOWDEFAULT, SW_SHOWMAXIMIZED,
                SW_SHOWMINIMIZED, SW_SHOWMINNOACTIVE, SW_SHOWNA,
                SW_SHOWNOACTIVATE, SW_SHOWNORMAL
                Si necesitas más información sobre estas opciones
                busca la función ShowWindow en la ayuda del Api de
                Windows}
var
  zAppName:array[0..512] of char;
  zCurDir:array[0..255] of char;
  WorkDir:String;
  StartupInfo:TStartupInfo;
  ProcessInfo:TProcessInformation;
begin
  StrPCopy(zAppName,FileName);
  GetDir(0,WorkDir);
  StrPCopy(zCurDir,WorkDir);
  FillChar(StartupInfo,Sizeof(StartupInfo),#0);
  StartupInfo.cb := Sizeof(StartupInfo);

  StartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  StartupInfo.wShowWindow := Visibility;
  CreateProcess(nil,
    zAppName,
    nil,
    nil,
    false,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS,
    nil,
    nil,
    StartupInfo,
    ProcessInfo);
end;

procedure TfrmEstadoDeCuentas.ibDetalleClick(Sender: TObject);
var
   ruta      : string;
   SearchRec : TSearchRec;
   archivo   : string;
   args      : string;
begin
   ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
   archivo := 'EdosCtasCXC.exe';
   if FindFirst(ruta + archivo, faAnyFile, SearchRec) = 0 then
   begin
      args := IntToStr(reglas.dame_usuario) + ' ' + edCliente.Text;
      WinExecNoWait32(ruta + archivo + ' ' + args, SW_SHOWDEFAULT);
   end
   else
      ShowMessage('Falta archivo EdosCtasCXC.exe en ..\reportes\salidas');
end;

procedure TfrmEstadoDeCuentas.ibCorteClick(Sender: TObject);
var
   ejecutar  : boolean;
   awrNivel  : integer;
begin
   ejecutar := true;
   awrNivel := 3;

   if (awrNivel > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel := awrNivel;
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

   if ejecutar then
   begin
      try
         Application.CreateForm(TfrmPRN_CORTE_CAJA_CtasXCobrar, frmPRN_CORTE_CAJA_CtasXCobrar);
         frmPRN_CORTE_CAJA_CtasXCobrar.ALMACEN := EstadoDeCuentas.ALMACEN;
         frmPRN_CORTE_CAJA_CtasXCobrar.CAJA    := EstadoDeCuentas.CAJA;
         frmPRN_CORTE_CAJA_CtasXCobrar.ShowModal;
      finally
         frmPRN_CORTE_CAJA_CtasXCobrar.Free;
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.ibReImprimirClick(Sender: TObject);
begin
   if ibReImprimir.Enabled then
   begin
      try
         Application.CreateForm(TfrmPRN_0007, frmPRN_0007);
         frmPRN_0007.CAJA    := EstadoDeCuentas.CAJA;
         frmPRN_0007.ALMACEN := EstadoDeCuentas.ALMACEN;
         frmPRN_0007.ACTIVAR := false;
         frmPRN_0007.ShowModal;
      finally
         frmPRN_0007.Free;
      end;
   end;
end;

procedure TfrmEstadoDeCuentas.ibEjecutarClick(Sender: TObject);
var
   cual   : string;
   pagar  : boolean;
begin
   pagar := true;

   if ibEjecutar.Enabled then
   begin
      try
         frmSeleccionMoneda         := TfrmSeleccionMoneda.Create(Application);
         frmSeleccionMoneda.Cliente := EstadoDeCuentas.CLIENTE;
         frmSeleccionMoneda.Almacen := EstadoDeCuentas.ALMACEN;
         if frmSeleccionMoneda.loadMonedas then
         begin
            if frmSeleccionMoneda.ShowModal = mrOk then
               EstadoDeCuentas.MONEDA := frmSeleccionMoneda.Moneda
            else
               pagar := false;
         end
         else
            EstadoDeCuentas.MONEDA := frmSeleccionMoneda.Moneda;
      finally
         frmSeleccionMoneda.Destroy;
      end;

      if pagar then
      begin
         {
         if buAutomatico.Down then
            cual := 'AUTOMATICO'
         else
         if buVencido.Down or buManual.Down then
            cual := 'MANUAL'
         else
         if buModificado.Down then
            cual := 'MODIFICADO';
         if EstadoDeCuentas.crearTipoPago(cual) = mrOk then
         begin
            //por el saldo se vuelve a cargar tambien el encabezado
            edClienteButtonClick(Sender, 0);
            edCliente.SetFocus;
         end;
         }
      cual := 'MANUAL';
      if EstadoDeCuentas.crearTipoPago(cual) = mrOk then
      begin
         //por el saldo se vuelve a cargar tambien el encabezado
         edClienteButtonClick(Sender, 0);
         edCliente.SetFocus;
      end;

      end;
   end;
end;

procedure TfrmEstadoDeCuentas.buAutomaticoClick(Sender: TObject);
var
  lImporte : double;
begin
  lImporte := StrToFloat(  edImporte.Text);
  if (lImporte > 0) and (EstadoDeCuentas.CLIENTE <> -3) then
  begin
     EstadoDeCuentas.EjecutarAutomatico;
     ibExpandir.Click;
     dgPartidas.DataSource.DataSet.First;
     ibEjecutar.Enabled := true;
     ibEjecutar.SetFocus;
  end
  else
     begin
        ibEjecutar.Enabled := false;
     end;
end;

procedure TfrmEstadoDeCuentas.buVencidoClick(Sender: TObject);
var
  lImporte : double;
begin
   EstadoDeCuentas.EjecutarVencido;
   edImporte.Text := FloatToStr(EstadoDeCuentas.IMPORTE_A_PAGAR);
   lImporte := EstadoDeCuentas.IMPORTE_A_PAGAR;
   ibExpandir.Click;
   dgPartidas.DataSource.DataSet.First;
   if lImporte > 0 then
   begin
      ibEjecutar.Enabled := true;
      ibEjecutar.SetFocus;
   end
   else
      begin
         ibEjecutar.Enabled := false;
      end;
end;

procedure TfrmEstadoDeCuentas.buManualClick(Sender: TObject);
var
  lImporte : double;
begin
   EstadoDeCuentas.EjecutarManual;
   lImporte :=   EstadoDeCuentas.IMPORTE_A_PAGAR;
   edImporte.Text := FloatToStr(EstadoDeCuentas.IMPORTE_A_PAGAR);
   if lImporte > 0 then
   begin
      ibEjecutar.Enabled := true;
      ibEjecutar.SetFocus;
   end
   else
      begin
         ibEjecutar.Enabled := false;
      end;
end;

procedure TfrmEstadoDeCuentas.buModificadoClick(Sender: TObject);
var
  lImporte : double;
begin
   EstadoDeCuentas.EjecutarModificado;
   lImporte :=   EstadoDeCuentas.IMPORTE_A_PAGAR;
   edImporte.Text := FloatToStr(EstadoDeCuentas.IMPORTE_A_PAGAR);
   if lImporte > 0 then
   begin
      ibEjecutar.Enabled := true;
      ibEjecutar.SetFocus;
   end
   else
      ibEjecutar.Enabled := false;
end;

procedure TfrmEstadoDeCuentas.laPanelDblClick(Sender: TObject);
begin
   //dgPartidas.ShowGroupPanel := not(dgPartidas.ShowGroupPanel);
end;

procedure TfrmEstadoDeCuentas.dgPartidasF3ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   hlF3.Click;
end;

procedure TfrmEstadoDeCuentas.dgPartidasF4ButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   hlF4.Click;
end;

procedure TfrmEstadoDeCuentas.dgPartidasF5ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
   hlF5.Click;
end;

procedure TfrmEstadoDeCuentas.ibSaldosClick(Sender: TObject);
begin
   EstadoDeCuentas.EjecutarSaldosMinimos;
end;

procedure TfrmEstadoDeCuentas.buChqRecibidosClick(Sender: TObject);
begin
   frmChequesR          := TfrmChequesR.Create(Application);
   frmChequesR.PAGO     := 0;
   frmChequesR.Cliente  := EstadoDeCuentas.CLIENTE;
   frmChequesR.ClienteN := EstadoDeCuentas.CLIENTE_NOMBRE;
   frmChequesR.ShowModal;
   frmChequesR.Free;
end;

procedure TfrmEstadoDeCuentas.buMontoClick(Sender: TObject);
var
   id    : integer;
   clave : string;
begin
   id := 0;
   frmBusquedaMontos := TfrmBusquedaMontos.Create(Self);
   try
      if frmBusquedaMontos.ShowModal = mrOk then
      begin
         id    := frmBusquedaMontos.ID;
         clave := frmBusquedaMontos.CLAVE;
      end

   finally
      frmBusquedaMontos.Free;
   end;

   if id <> 0 then
   begin
      edCliente.Text := clave;
      edClienteButtonClick(Sender, 0);

      
   end;
end;

end.
