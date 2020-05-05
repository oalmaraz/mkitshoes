unit PRN_0029_MI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBX.IBCustomDataSet, IBX.IBQuery,   Grids, DBGrids,
  IBX.IBStoredProc;

type
  TImpresion = record
    impresora    : string;
    escImpresora : string;
    idImpresora  : integer;
    cajon        : string;
    puerto       : string;
    caracteres   : string;
    cutter       : string;
    autoCutter   : string;
  end;

  TImpresionComun = record
    impresiones : integer;
    cuantas     : integer;
    modo        : string;
  end;

  TfrmPRN_0029 = class(TForm)
    qyMIEnc: TIBQuery;
    qyMIDet: TIBQuery;
    spFOLIO_MI: TIBStoredProc;
    qyVerificarFolioOrigen: TIBQuery;
    qyVerificarFolioOrigenR_ACEPTADO: TIBStringField;
    qyVerificarFolioDestino: TIBQuery;
    IBStringField1: TIBStringField;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_MI_ORIGEN: TIBStoredProc;
    spACTUALIZA_MI_DESTINO: TIBStoredProc;
    spAUTO_FOLIO: TIBStoredProc;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    pedirFolio      : boolean;

    //Impresiones
    print1          : TImpresion;
    printC          : TImpresionComun;
    print2          : TImpresion;

    procedure print;
    procedure loadImpresora;
    procedure setID(valor : integer);
  public
    { Public declarations }
    function openFormato : boolean;
    procedure imprimir;
    procedure preview;
  published
     property DameFolio : boolean read pedirFolio write pedirFolio;
     property ID        : integer write setID; 
  end;

var
  frmPRN_0029: TfrmPRN_0029;

implementation

uses iniFiles, IBModulo, controladorImpresora, reglas_de_negocios, UfrmFolio;

{$R *.DFM}

procedure TfrmPRN_0029.setID(valor : integer);
begin
   qyMIEnc.Close;
   qyMIEnc.ParamByName('P_ID').AsInteger := valor;
   qyMIEnc.Open;

   qyMIDet.Close;
   qyMIDet.ParamByName('P_ID').AsInteger := valor;
   qyMIDet.Open;
end;

function TfrmPRN_0029.openFormato : boolean;
var
   tmp : boolean;
begin
   tmp := true;
   if printC.modo = 'DOS' then
   begin
      reporte := 'dos_movimiento_de_inventario.prt';
   end
   else
      if printC.modo = 'WIN' then
      begin
         reporte := 'win_movimiento_de_inventario.prt';
      end;

   if not(FileExists(ruta+reporte)) then
   begin
      tmp := false;
      ShowMessage('Falta archivo: '+reporte);
   end;

   result := tmp;
end;

{procedure TfrmPRN_0029.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('MOV_INVENTARIO') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boMI;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('MOV_INVENTARIO','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;
}
procedure TfrmPRN_0029.loadImpresora;
var
   iniFile        : TIniFile;
   //grupo 1
   v_ImpresoraNom1 : string;
   v_ImpresoraVal1 : string;
   v_EscModel1     : string;
   v_Cajon1        : string;
   v_Puerto1       : string;
   v_Caracteres1   : string;
   v_Cutter1       : string;
   v_AutoCutter1   : string;
   //grupo 2
   v_ImpresoraNom2 : string;
   v_ImpresoraVal2 : string;
   v_EscModel2     : string;
   v_Cajon2        : string;
   v_Puerto2       : string;
   v_Caracteres2   : string;
   v_Cutter2       : string;
   v_AutoCutter2   : string;
   //comun
   v_Impresiones   : string;
   v_Cuantas       : string;
   v_Modo          : string;
begin
   if reglas.activarElegirControladorImpresora('MOV_INVENTARIO') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boMI;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Free;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   v_ImpresoraNom1 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraNom1','');
   v_ImpresoraVal1 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraVal1','');
   v_EscModel1     := iniFile.ReadString('MOV_INVENTARIO','EscModel1',    '');
   v_Cajon1        := iniFile.ReadString('MOV_INVENTARIO','Cajon1',       '');
   v_Puerto1       := iniFile.ReadString('MOV_INVENTARIO','Puerto1',      '');
   v_Caracteres1   := iniFile.ReadString('MOV_INVENTARIO','Caracteres1',  '');
   v_Cutter1       := iniFile.ReadString('MOV_INVENTARIO','Cutter1',      '');
   v_AutoCutter1   := iniFile.ReadString('MOV_INVENTARIO','AutoCutter1',  '');
   v_Impresiones   := iniFile.ReadString('MOV_INVENTARIO','Impresiones',  '');
   v_Cuantas       := iniFile.ReadString('MOV_INVENTARIO','Cuantas',      '');
   v_ImpresoraNom2 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraNom2','');
   v_ImpresoraVal2 := iniFile.ReadString('MOV_INVENTARIO','ImpresoraVal2','');
   v_EscModel2     := iniFile.ReadString('MOV_INVENTARIO','EscModel2',    '');
   v_Cajon2        := iniFile.ReadString('MOV_INVENTARIO','Cajon2',       '');
   v_Puerto2       := iniFile.ReadString('MOV_INVENTARIO','Puerto2',      '');
   v_Caracteres2   := iniFile.ReadString('MOV_INVENTARIO','Caracteres2',  '');
   v_Cutter2       := iniFile.ReadString('MOV_INVENTARIO','Cutter2',      '');
   v_AutoCutter2   := iniFile.ReadString('MOV_INVENTARIO','AutoCutter2',  '');
   v_Modo          := iniFile.ReadString('MOV_INVENTARIO','Modo',         '');

   if v_Cuantas = '' then
      v_Cuantas := '0';
   if v_Impresiones = '' then
      v_Impresiones := '0';

   //cargar valores en print1
   print1.impresora       := v_ImpresoraNom1;
   print1.escImpresora    := v_EscModel1;
   print1.idImpresora     := StrtoInt(v_ImpresoraVal1);
   print1.cajon           := v_Cajon1;
   print1.puerto          := v_Puerto1;
   print1.caracteres      := v_Caracteres1;
   print1.cutter          := v_Cutter1;
   print1.autoCutter      := v_AutoCutter1;
   //carga valores comun
   printC.impresiones     := StrToInt(v_Impresiones);
   printC.cuantas         := StrToInt(v_Cuantas);
   printC.modo            := v_Modo;
   //carga valores print2
   print2.impresora       := v_ImpresoraNom2;
   print2.escImpresora    := v_EscModel2;
   print2.idImpresora     := StrtoInt(v_ImpresoraVal2);
   print2.cajon           := v_Cajon2;
   print2.puerto          := v_Puerto2;
   print2.caracteres      := v_Caracteres2;
   print2.cutter          := v_Cutter2;
   print2.autoCutter      := v_AutoCutter2;
   iniFile.Free;
end;

procedure TfrmPRN_0029.imprimir;
var
   ClickedOK  : boolean;
   NewString  : string;
   NewValor   : integer;
   NewValor2  : integer;
   salirFolio : boolean;

   // prWINReporte : TprReport;
   salir      : boolean;
   _mrO       : boolean;
   _mrD       : boolean;
   _folioO    : integer;
   _folioD    : integer;
   moduloO    : integer; //O = Origen
   moduloD    : integer; //D = Destino

   actPrint   : boolean;
begin
   {
   moduloO := 0;
   moduloD := 0;
   _folioO := 0;
   _folioD := 0;
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Salida' then
      moduloO := 25
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Entrada' then
      moduloO := 26
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Traspaso' then
   begin
      moduloO := 38;
      moduloD := 39;
   end
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Inventario Inicial' then
      moduloO := 40
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Ajuste Inventario' then
      moduloO := 41
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Conteo' then
      moduloO := 42
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Conteo Parcial' then
      moduloO := 43
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Otro' then
      moduloO := 44
   else
   if qyMIEnc.FieldByName('R_TIPO').AsString = 'Desconocido' then
      moduloO := 45;

   actPrint := true;
   if qyMIEnc.FieldByName('R_FOLIO_ALMACEN_ORIGEN').AsInteger = 0 then
   begin
      actPrint := false;
      repeat
         salir := true;

         spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := moduloO;
         spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyMIEnc.FieldByName('R_ALMACEN_ORIGEN').AsInteger;
         spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
         spAUTO_FOLIO.ExecProc;
         spAUTO_FOLIO.Transaction.CommitRetaining;

         try
            frmFolio        := TfrmFolio.Create(Application);
            frmFolio.Titulo := 'Movimientos de Inventario';
            frmFolio.Folio  := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
            frmFolio.ShowModal;
            _mrO    := frmFolio.ModalResult;
            _folioO := frmFolio.Folio;
         finally
            frmFolio.Free;
         end;

         if (_mrO) and (_folioO <> 0) then
         begin
            qyVerificarFolioOrigen.Close;
            qyVerificarFolioOrigen.ParamByName('P_ID').AsInteger      := qyMIEnc.FieldByName('R_ID').AsInteger;
            qyVerificarFolioOrigen.ParamByName('P_FOLIO').AsInteger   := _folioO;
            qyVerificarFolioOrigen.Open;
            salir := (qyVerificarFolioOrigen.FieldByName('R_ACEPTADO').AsString = 'Si');
            if qyVerificarFolioOrigen.FieldByName('R_ACEPTADO').AsString = 'No' then
            begin
               ShowMessage('Ya se encuentra este folio, con el tipo de movimiento y para este almacen. Capturar otro folio.');
            end
            else
            begin
               actPrint := true;
               spACTUALIZA_MI_ORIGEN.ParamByName('P_ID').AsInteger    := qyMIEnc.FieldByName('R_ID').AsInteger;
               spACTUALIZA_MI_ORIGEN.ParamByName('P_FOLIO').AsInteger := _folioO;
               spACTUALIZA_MI_ORIGEN.ExecProc;
               spACTUALIZA_MI_ORIGEN.Transaction.CommitRetaining;

               if qyMIEnc.FieldByName('R_TIPO').AsString = 'Traspaso' then
               begin
                  spACTUALIZA_MI_DESTINO.ParamByName('P_ID').AsInteger    := qyMIEnc.FieldByName('R_ID').AsInteger;
                  spACTUALIZA_MI_DESTINO.ParamByName('P_FOLIO').AsInteger := _folioD;
                  spACTUALIZA_MI_DESTINO.ExecProc;
                  spACTUALIZA_MI_DESTINO.Transaction.CommitRetaining;
               end;
               reglas.refresh_IBQuery(qyMIEnc);
            end;
         end;
      until salir;


      if (_mrO) and (_folioO <> 0) then
      begin
         //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
         if _folioO <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger then
         begin
            spMODIFICAR_FOLIO.ParamByName('P_MODULO').AsInteger      := moduloO;
            spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger    := qyMIEnc.FieldByName('R_ALMACEN_ORIGEN').AsInteger;
            spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsInteger := _folioO;
            spMODIFICAR_FOLIO.ExecProc;
            spMODIFICAR_FOLIO.Transaction.CommitRetaining;
         end;

         spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := moduloO;
         spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyMIEnc.FieldByName('R_ALMACEN_ORIGEN').AsInteger;
         spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'Si';
         spAUTO_FOLIO.ExecProc;
         spAUTO_FOLIO.Transaction.CommitRetaining;
      end;

      if qyMIEnc.FieldByName('R_TIPO').AsString = 'Traspaso' then
      begin
         repeat
            salir := true;

            spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := moduloD;
            spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyMIEnc.FieldByName('R_ALMACEN_DESTINO').AsInteger;
            spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'No';
            spAUTO_FOLIO.ExecProc;
            spAUTO_FOLIO.Transaction.CommitRetaining;

            try
               frmFolio        := TfrmFolio.Create(Application);
               frmFolio.Titulo := 'Movimientos de Inventario';
               frmFolio.Folio  := spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger;
               frmFolio.ShowModal;
               _mrD    := frmFolio.ModalResult;
               _folioD := frmFolio.Folio;
            finally
               frmFolio.Free;
            end;

            if (_mrD) and (_folioD <> 0) then
            begin
               qyVerificarFolioDestino.Close;
               qyVerificarFolioDestino.ParamByName('P_ID').AsInteger      := qyMIEnc.FieldByName('R_ID').AsInteger;
               qyVerificarFolioDestino.ParamByName('P_FOLIO').AsInteger   := _folioD;
               qyVerificarFolioDestino.Open;
               salir := (qyVerificarFolioDestino.FieldByName('R_ACEPTADO').AsString = 'Si');
               if qyVerificarFolioDestino.FieldByName('R_ACEPTADO').AsString = 'No' then
               begin
                  ShowMessage('Ya se encuentra este folio, con el tipo de movimiento y para este almacen. Capturar otro folio.');
               end
               else
               begin
                  //se actualiza el folio, si es diferente al que el sistema asigno, para que coincida con el de su consecutivo
                  if _folioD <> spAUTO_FOLIO.ParamByName('R_FOLIO').AsInteger then
                  begin
                     spMODIFICAR_FOLIO.ParamByName('P_MODULO').AsInteger      := moduloD;
                     spMODIFICAR_FOLIO.ParamByName('P_SUBCLASE').AsInteger    := qyMIEnc.FieldByName('R_ALMACEN_DESTINO').AsInteger;
                     spMODIFICAR_FOLIO.ParamByName('P_CONSECUTIVO').AsInteger := _folioD;
                     spMODIFICAR_FOLIO.ExecProc;
                     spMODIFICAR_FOLIO.Transaction.CommitRetaining;
                  end;

                  spAUTO_FOLIO.ParamByName('P_MODULO').AsInteger   := moduloD;
                  spAUTO_FOLIO.ParamByName('P_SUBCLASE').AsInteger := qyMIEnc.FieldByName('R_ALMACEN_DESTINO').AsInteger;
                  spAUTO_FOLIO.ParamByName('P_AFECTAR').AsString   := 'Si';
                  spAUTO_FOLIO.ExecProc;
                  spAUTO_FOLIO.Transaction.CommitRetaining;
               end;
            end;
         until salir;
      end;
   end;

   if actPrint then
   begin
      print;
   end;
   }
end;

procedure TfrmPRN_0029.print;
//var
   //prDOS : TprTxReport;
  // prWIN : TprReport;
begin
{
   //impresion
   if printC.modo = 'DOS' then
   begin
      prDOS := TprTxReport.Create(Self);
      prDOS.LoadTemplateFromFile(ruta+reporte,false);
      prDOS.PrinterName  := print1.impresora;
      prDOS.ESCModelName := print1.escImpresora;
      prDOS.PrepareReport;
      prDOS.PrintPreparedReport;
      prDOS.Destroy;
   end
   else
      if printC.modo = 'WIN' then
      begin
         prWIN := TprReport.Create(Self);
         prWIN.LoadTemplateFromFile(ruta+reporte,false);
         prWIN.PrinterName := print1.impresora;
         prWIN.PrepareReport;
         prWIN.PrintPreparedReport;
         prWIN.Destroy;
      end;
}
end;

procedure TfrmPRN_0029.preview;
//var
  // prDOS : TprTxReport;
   //prWIN : TprReport;
begin
   //impresion
   {
   if printC.modo = 'DOS' then
   begin
      prDOS := TprTxReport.Create(Self);
      prDOS.LoadTemplateFromFile(ruta+reporte,false);
      prDOS.PrinterName  := print1.impresora;
      prDOS.ESCModelName := print1.escImpresora;
      prDOS.PrepareReport;
      prDOS.PreviewPreparedReport(true);
      prDOS.Destroy;
   end
   else
      if printC.modo = 'WIN' then
      begin
         prWIN := TprReport.Create(Self);
         prWIN.LoadTemplateFromFile(ruta+reporte,false);
         prWIN.PrinterName := print1.impresora;
         prWIN.PrepareReport;
         prWIN.PreviewPreparedReport(true);
         prWIN.Destroy;
      end;
      }
end;

procedure TfrmPRN_0029.FormCreate(Sender: TObject);
{var
   SearchRec : TSearchRec;}
begin
   loadImpresora;
   pedirFolio := true;
   ruta       := ExtractFilePath(ParamStr(0))+'reportes\';
end;

end.
