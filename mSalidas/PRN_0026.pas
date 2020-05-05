unit PRN_0026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,
  ExtCtrls,  IBX.IBStoredProc;

type
  TfrmPRN_0026 = class(TForm)
    qyEncabezadoPedidos: TIBQuery;
    qyPartidasPedidos: TIBQuery;
    qyVerificarFolio: TIBQuery;
    qyVerificarFolioR_ACEPTADO: TIBStringField;
    spMODIFICAR_FOLIO_REMISION: TIBStoredProc;
    qyACTUALIZA_PEDIDO: TIBQuery;
    qyPartidasPedidosM: TIBQuery;
    spACT_FOLIO_PEDIDO: TIBStoredProc;
    spAUTO_FOLIO: TIBStoredProc;
    spVERIFICAR_FOLIO_EVENTO: TIBStoredProc;
    spACT_FOLIO_PEDIDO_E: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    awrID           : integer;
    awrEVENTO       : integer;
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    impresiones     : integer;
//    pedirFolio      : boolean;
    procedure loadImpresora;
    function Open(archivo : string; medidas : boolean) : boolean;
  public
    { Public declarations }
    function OpenN : boolean;//Normal
    function OpenP : boolean;//Prioridad
    function OpenA : boolean;//Apartado
    function OpenAP : boolean;//Apartado Prioridad
    function OpenMN : boolean;//Medidas Normal
    function OpenMP : boolean;//Medidas Prioridad
    function OpenE : boolean;//Evento
    function OpenEM : boolean;//Evento
    procedure imprimir;//imprimir normal
    procedure imprimirP;//imprimir prioridad
    procedure imprimirE;//imprimir evento
    procedure preview;
  published
     property ID : integer read awrID write awrID;
     property EVENTO : integer read awrEVENTO write awrEVENTO;
  end;

var
  frmPRN_0026: TfrmPRN_0026;

implementation

uses controladorImpresora, iniFiles, reglas_de_negocios, IBData, IBModulo,
  UfrmFolio;

{$R *.DFM}

function TfrmPRN_0026.Open(archivo : string; medidas : boolean) : boolean;
var
   SearchRec : TSearchRec;
   tmp : boolean;
begin
   tmp := true;
   qyEncabezadoPedidos.Close;
   qyEncabezadoPedidos.ParamByName('P_ID').AsInteger := awrID;
   qyEncabezadoPedidos.Open;

   if medidas then
   begin
      qyPartidasPedidosM.Close;
      qyPartidasPedidosM.ParamByName('P_ID').AsInteger := awrID;
      qyPartidasPedidosM.Open;
   end
   else
      begin
         qyPartidasPedidos.Close;
         qyPartidasPedidos.ParamByName('P_ID').AsInteger := awrID;
         qyPartidasPedidos.Open;
      end;

   //cargar archivo del directorio de reportes
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';
   if FindFirst(ruta+archivo, faAnyFile, SearchRec) = 0 then
      reporte := archivo
   else
      begin
         tmp := false;
         showmessage('Falta archivo: '+archivo);
      end;
   result := tmp;
end;

function TfrmPRN_0026.OpenN : boolean;
begin
   result := Open('win_pedido.prt', false);
end;

function TfrmPRN_0026.OpenP : boolean;
begin
   result := Open('win_pedidoR.prt', false);
end;

function TfrmPRN_0026.OpenE : boolean;
begin
   result := Open('win_pedidoEvento.prt', false);
end;

function TfrmPRN_0026.OpenEM : boolean;
begin
   result := Open('win_pedidoEventoM.prt', true);
end;

function TfrmPRN_0026.OpenMN : boolean;
begin
   result := Open('win_pedidoMedidas.prt', true);
end;

function TfrmPRN_0026.OpenMP : boolean;
begin
   result := Open('win_pedidoMedidasP.prt', true);
end;

function TfrmPRN_0026.OpenA : boolean;
begin
   result := Open('win_pedidoApartado.prt', false);
end;

function TfrmPRN_0026.OpenAP : boolean;
begin
   result := Open('win_pedidoApartadoP.prt', false);
end;

procedure TfrmPRN_0026.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('PEDIDOS') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boPedido;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('PEDIDOS','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('PEDIDOS','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('PEDIDOS','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

procedure TfrmPRN_0026.preview;
//var
  // prWINReporte : TprReport;
begin
{
   prWINReporte := TprReport.Create(Self);
   prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
   prWINReporte.PrinterName  := strImpresora;
   prWINReporte.PrepareReport;
   prWINReporte.PreviewPreparedReport(true);
   prWINReporte.Destroy;
   }
end;

procedure TfrmPRN_0026.imprimir;
//var
  // prWINReporte : TprReport;
begin
{
   prWINReporte := TprReport.Create(Self);
   prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
   prWINReporte.PrinterName  := strImpresora;
   prWINReporte.PrepareReport;
   prWINReporte.PrintPreparedReport;
   prWINReporte.Destroy;
   }
end;

procedure TfrmPRN_0026.imprimirE;//imprimir expo
var
   salir    : boolean;
   actPrint : boolean;
   i        : integer;
   _mr      : boolean;
   _folio   : integer;
begin
   actPrint := true;

   if qyEncabezadoPedidos.FieldByName('R_CONSECUTIVO').AsInteger = 0 then
   begin
      actPrint := false;
      repeat
         salir := true;
         spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := 21;
         spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := EVENTO;
         spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
         spAUTO_FOLIO.ExecProc;
         spAUTO_FOLIO.Transaction.CommitRetaining;

         try
            frmFolio        := TfrmFolio.Create(Application);
            frmFolio.Titulo := 'Expo-Pedido';
            frmFolio.Folio  := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
            frmFolio.ShowModal;
            _mr    := frmFolio.ModalResult;
            _folio := frmFolio.Folio;
         finally
            frmFolio.Release;
         end;

         if (_mr) and (_folio <> 0) then
         begin
            spVERIFICAR_FOLIO_EVENTO.ParamByName('P_PEDIDO').AsInteger := qyEncabezadoPedidos.FieldByName('R_ID').AsInteger;
            spVERIFICAR_FOLIO_EVENTO.ParamByName('P_FOLIO').AsInteger  := _folio;
            spVERIFICAR_FOLIO_EVENTO.ParamByName('P_EVENTO').AsInteger := EVENTO;
            spVERIFICAR_FOLIO_EVENTO.ExecProc;
            if spVERIFICAR_FOLIO_EVENTO.ParamByName('R_ACEPTADO').AsString = 'No' then
            begin
               salir := false;
               ShowMessage('Ya se encuentra este folio, para este evento.capturar otro folio.')
            end
            else
            begin
               actPrint := true;
               //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
               spACT_FOLIO_PEDIDO_E.ParamByName('P_FOLIO').AsInteger          := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
               spACT_FOLIO_PEDIDO_E.ParamByName('P_FOLIO_ACEPTADO').AsInteger := _folio;
               spACT_FOLIO_PEDIDO_E.ParamByName('P_ALMACEN').AsInteger        := EVENTO;
               spACT_FOLIO_PEDIDO_E.ParamByName('P_PEDIDO').AsInteger         := qyEncabezadoPedidos.FieldByName('R_ID').AsInteger;
               spACT_FOLIO_PEDIDO_E.ParamByName('P_USUARIO').AsInteger        := reglas.dame_usuario;
               spACT_FOLIO_PEDIDO_E.ExecProc;
               spACT_FOLIO_PEDIDO_E.Transaction.CommitRetaining;
               reglas.refresh_IBQuery(qyEncabezadoPedidos);
            end;
         end;
      until salir;
   end;

   if actPrint then
   begin
      for i := 1 to impresiones do
         imprimir;
   end;
end;

procedure TfrmPRN_0026.imprimirP;
var
   salir    : boolean;
   actPrint : boolean;
   i        : integer;
   _mr      : boolean;
   _folio   : integer;
begin
   actPrint := true;
   if qyEncabezadoPedidos.FieldByName('R_CONSECUTIVO').AsInteger = 0 then
   begin
      actPrint := false;
      repeat
         salir := true;
         spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := 13;
         spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyEncabezadoPedidos.FieldByName('R_ALMACEN').AsInteger;
         spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
         spAUTO_FOLIO.ExecProc;
         spAUTO_FOLIO.Transaction.CommitRetaining;

         try
            frmFolio        := TfrmFolio.Create(Application);
            frmFolio.Titulo := 'Pedidos';
            frmFolio.Folio  := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
            frmFolio.ShowModal;
            _mr    := frmFolio.ModalResult;
            _folio := frmFolio.Folio;
         finally
            frmFolio.Release;
         end;

         if (_mr) and (_folio <> 0) then
         begin
            qyVerificarFolio.Close;
            qyVerificarFolio.ParamByName('P_PEDIDO').AsInteger  := qyEncabezadoPedidos.FieldByName('R_ID').AsInteger;
            qyVerificarFolio.ParamByName('P_FOLIO').AsInteger   := _folio;
            qyVerificarFolio.ParamByName('P_ALMACEN').AsInteger := qyEncabezadoPedidos.FieldByName('R_ALMACEN').AsInteger;
            qyVerificarFolio.Open;
            if qyVerificarFolio.FieldByName('R_ACEPTADO').AsString = 'No' then
            begin
               salir := false;
               ShowMessage('Ya se encuentra este folio, para este almacen. capturar otro folio.');
            end
            else
            begin
               actPrint := true;
               //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
               spACT_FOLIO_PEDIDO.ParamByName('P_FOLIO').AsInteger          := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
               spACT_FOLIO_PEDIDO.ParamByName('P_FOLIO_ACEPTADO').AsInteger := _folio;
               spACT_FOLIO_PEDIDO.ParamByName('P_ALMACEN').AsInteger        := qyEncabezadoPedidos.FieldByName('R_ALMACEN').AsInteger;
               spACT_FOLIO_PEDIDO.ParamByName('P_PEDIDO').AsInteger         := qyEncabezadoPedidos.FieldByName('R_ID').AsInteger;
               spACT_FOLIO_PEDIDO.ParamByName('P_USUARIO').AsInteger        := reglas.dame_usuario;
               spACT_FOLIO_PEDIDO.ExecProc;
               spACT_FOLIO_PEDIDO.Transaction.CommitRetaining;
               reglas.refresh_IBQuery(qyEncabezadoPedidos);
            end;
         end;
      until salir;
   end;

   if actPrint then
   begin
      for i := 1 to impresiones do
         imprimir;
   end;
end;

procedure TfrmPRN_0026.FormCreate(Sender: TObject);
begin
   loadImpresora;
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   //Impresiones por pedido
   dmIBData.TPreferencias.Filter := 'ID = 74';
   impresiones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

end.
