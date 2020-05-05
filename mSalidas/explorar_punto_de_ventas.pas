unit explorar_punto_de_ventas;

interface

uses
  capturar_punto_de_ventas_pagos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db, IBX.IBStoredProc, IBX.IBEvents,  ComCtrls, Grids, DBGrids, Buttons,
  ExtCtrls, Menus, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask, DBCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_punto_de_ventas = class(TfrmExplorarMDI)
    iePagos: TIBEvents;
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FOLIO_DE_VENTA: TIntegerField;
    qyExplorarR_SUBTOTAL: TFloatField;
    qyExplorarR_IVA: TFloatField;
    qyExplorarR_IEPS: TFloatField;
    qyExplorarR_IMPUESTO1: TFloatField;
    qyExplorarR_IMPUESTO2: TFloatField;
    qyExplorarR_TOTAL: TFloatField;
    qyExplorarR_DESCUENTO_GLOBAL_PORC: TFloatField;
    qyExplorarR_DESCUENTO_CANTIDAD_GLOBAL: TFloatField;
    qyExplorarR_DESCUENTO_CANTIDAD_PARCIAL: TFloatField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_CONDICION_COMERCIAL: TIntegerField;
    qyExplorarR_CAMBIO_ENTREGADO: TFloatField;
    qyExplorarR_TOTAL_REF_PAGOS: TFloatField;
    qyExplorarR_SALDO: TFloatField;
    qyExplorarR_CLIENTE: TIntegerField;
    qyExplorarR_NOMBRE_CLIENTE: TIBStringField;
    qyExplorarR_EXTENSION: TIntegerField;
    qyExplorarR_NOMBRE_EXTENSION: TIBStringField;
    qyExplorarR_MONEDA: TIntegerField;
    qyExplorarR_FOLIO_HISTORICO: TIntegerField;
    qyExplorarR_LIMITE_CREDITO: TFloatField;
    qyExplorarR_LIMITE_DISPONIBLE: TFloatField;
    qyExplorarR_CAJA: TIntegerField;
    qyExplorarR_CAJA_NOMBRE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    spACT_CLIENTE_PVTA: TIBStoredProc;
    ibReImpresionFactura: TBitBtn;
    ibReImpNV: TBitBtn;
    ibF10: TBitBtn;
    spNR2: TIBStoredProc;
    pmPVCobrar: TPopupMenu;
    itemF12: TMenuItem;
    qyExplorarR_MONEDA_CLAVE: TIBStringField;
    qyExplorarR_MONEDA_DESCRIPCION: TIBStringField;
    qyVer_Datos_Cajero: TIBQuery;
    qyVer_Datos_CajeroR_ID: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN: TIntegerField;
    qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField;
    qyVer_Datos_CajeroR_USUARIO: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField;
    qyVer_Datos_CajeroR_BAJA: TIBStringField;
    qyVer_Datos_CajeroR_ESTATUS: TIBStringField;
    qyVer_Datos_CajeroR_REGISTROS: TIntegerField;
    qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField;
    dsVer_Datos_Cajero: TDataSource;
    Label24: TLabel;
    Shape3: TShape;
    Label10: TLabel;
    Shape1: TShape;
    Shape4: TShape;
    Shape17: TShape;
    deAlmacen: TDBEdit;
    deUsuario: TDBEdit;
    Label12: TLabel;
    Shape6: TShape;
    deFHistorico: TDBEdit;
    Label4: TLabel;
    Shape10: TShape;
    edFecha: TEdit;
    Label3: TLabel;
    Shape7: TShape;
    Shape8: TShape;
    deCaja: TDBEdit;
    deFolio: TDBEdit;
    Shape15: TShape;
    Shape14: TShape;
    Label1: TLabel;
    Shape9: TShape;
    itemF10: TMenuItem;
    qyExplorarR_FOLIO_ALMACEN: TIntegerField;
    qyExplorarR_FOLIO_GENERAL: TIntegerField;
    qyExplorarR_CLIENTE_C: TIBStringField;
    qyExplorarR_CLIENTE_T: TIBStringField;
    edCambio: TEdit;
    Label11: TLabel;
    qyEstatus: TIBQuery;
    dsEstatus: TDataSource;
    spEstatus: TIBStoredProc;
    spT_MSJ_LIMITE_CREDITO: TIBStoredProc;
    qyVer_Datos_CajeroR_MONEDA: TIntegerField;
    buVentas: TBitBtn;
    Label2: TLabel;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_DE_VENTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_IEPS: TcxGridDBColumn;
    dgExplorarDBTableView1R_IMPUESTO1: TcxGridDBColumn;
    dgExplorarDBTableView1R_IMPUESTO2: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_GLOBAL_PORC: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_GLOBAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_DESCUENTO_CANTIDAD_PARCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_CONDICION_COMERCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAMBIO_ENTREGADO: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL_REF_PAGOS: TcxGridDBColumn;
    dgExplorarDBTableView1R_SALDO: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE_CLIENTE: TcxGridDBColumn;
    dgExplorarDBTableView1R_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE_EXTENSION: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_HISTORICO: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_CREDITO: TcxGridDBColumn;
    dgExplorarDBTableView1R_LIMITE_DISPONIBLE: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_MONEDA_DESCRIPCION: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_FOLIO_GENERAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE_C: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLIENTE_T: TcxGridDBColumn;
    procedure ibVerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibPantallaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure iePagosEventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure ibImprimirClick(Sender: TObject);
    procedure ibF10Click(Sender: TObject);
    procedure ibReImpresionFacturaClick(Sender: TObject);
    procedure ibReImpNVClick(Sender: TObject);
    procedure itemF12Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dgExplorarBTNEXTENSIONButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgExplorarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dgExplorarBTNCLIENTEButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgExplorarBTNF12ButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buVentasClick(Sender: TObject);
    procedure edExplorarValorKeyPress(Sender: TObject; var Key: Char);
    procedure ibExportarXLSClick(Sender: TObject);
    procedure ibExportarHTMLClick(Sender: TObject);
    procedure ibExportarXMLClick(Sender: TObject);
  private
    { Private declarations }
    clienteEfectivo : integer;
    awrNivel        : integer;
    FPagos          : TfrmCapturar_punto_de_ventas_pagos;
//    procedure leerArchivoIni;
//    procedure crearArchivoIni;
    procedure estatusInternoCancelado;
    procedure validarCredito;
    procedure encontrarID;
  public
    { Public declarations }
  end;

var
  frmExplorar_punto_de_ventas: TfrmExplorar_punto_de_ventas;

implementation

uses
   inifiles, reglas_de_negocios, IBModulo,  autorizacion,
  PRN_0003_FACTURAR, PRN_0004_NOTA_VENTA, PRN_0003_FACTURAR_TXT,
  PRN_0004_NOTA_VENTA_TXT, PRN_CORTE_CAJAS_PV, IBData,
  UfrmSeleccionarCliente, UfrmSeleccionarExtension, PRN_0008_Ventas,
  UfrmPOSPagos, UfrmAcceso, capturar_punto_de_venta_cancelacion;

{$R *.DFM}

{procedure TfrmExplorar_punto_de_ventas.leerArchivoIni;
var
   iniFile   : TIniFile;
   ruta      : string;
   i         : integer;
   tmp       : string;
   contador  : integer;
   almacen   : string;
begin
   tmp      := '';
   contador := 0;
   ruta := Application.ExeName;
   ruta := reglas.espejo(ruta);
   for i := 1 to length(ruta) do
      if ruta[i] = '\' then
         break
      else
         inc(contador);
   ruta := reglas.espejo(ruta);
   ruta := copy(ruta,1, (length(ruta) - contador));
   ruta := ruta + IntToStr(reglas.dame_usuario) + '.INI';

   iniFile := TIniFile.Create(ruta);
   almacen := iniFile.ReadString('ALMACEN','id','');
   iniFile.Free;
   if almacen = '' then
   begin
      if cbAlmacenes.Text <> '' then
      begin
         crearArchivoIni;
         qyExplorar.Close;
         qyExplorar.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
         qyExplorar.Open;
         cbAlmacenes.Enabled := false;
      end
      else
         begin
            meAlmacenes.Execute;
            cbAlmacenes.Enabled := true;
         end;
   end
   else
      begin
         qyExplorar.Close;
         qyExplorar.ParamByName('P_ALMACEN').AsInteger := StrToInt(almacen);
         qyExplorar.Open;
         cbAlmacenes.KeyValue := almacen;
         cbAlmacenes.Enabled  := false;
      end;
end;

procedure TfrmExplorar_punto_de_ventas.crearArchivoIni;
var
   iniFile   : TIniFile;
   ruta      : string;
   i         : integer;
   tmp       : string;
   contador  : integer;
begin
   tmp      := '';
   contador := 0;
   ruta := Application.ExeName;
   ruta := reglas.espejo(ruta);
   for i := 1 to length(ruta) do
      if ruta[i] = '\' then
         break
      else
         inc(contador);
   ruta := reglas.espejo(ruta);
   ruta := copy(ruta,1, (length(ruta) - contador));
   ruta := ruta + IntToStr(reglas.dame_usuario) + '.INI';

   iniFile := TIniFile.Create(ruta);
   iniFile.WriteString('ALMACEN','id',IntToStr(cbAlmacenes.KeyValue));
   iniFile.Free;
end;}

procedure TfrmExplorar_punto_de_ventas.encontrarID;
var
   encontro : boolean;
begin
   encontro := false;
   dsFuente.DataSet.First;
   while not(dsFuente.DataSet.Eof) do
   begin
      if (edExplorarValor.Text = dsFuente.DataSet.FieldByName('R_ID').AsString) then
      begin
         encontro := true;
         break;
      end;
      dsFuente.DataSet.Next;
   end;

   if encontro then
      ibPantalla.Click;
end;

procedure TfrmExplorar_punto_de_ventas.validarCredito;
var
  mensaje : string;
begin
   spT_MSJ_LIMITE_CREDITO.ParamByName('P_ID').AsInteger := qyExplorar.FieldByName('R_ID').AsInteger;
   spT_MSJ_LIMITE_CREDITO.ExecProc;
   if (spT_MSJ_LIMITE_CREDITO.ParamByName('R_DECIR_MSJ').AsString = 'Si') then
   begin
      mensaje := spT_MSJ_LIMITE_CREDITO.ParamByName('R_MSJ').AsString;
      mensaje := mensaje + #13 + 'De contado: ' + FormatFloat('###,###,##0.00', spT_MSJ_LIMITE_CREDITO.ParamByName('R_CONTADO').AsFloat);
      mensaje := mensaje + #13 + 'A credito: '  + FormatFloat('###,###,##0.00', spT_MSJ_LIMITE_CREDITO.ParamByName('R_CREDITO').AsFloat);
      mensaje := mensaje + #13 + 'Limite: '     + FormatFloat('###,###,##0.00', spT_MSJ_LIMITE_CREDITO.ParamByName('R_LIMITE').AsFloat);
      ShowMessage(mensaje);
   end;
end;

procedure TfrmExplorar_punto_de_ventas.estatusInternoCancelado;
var
   ejecutar   : boolean;
   vNivel     : integer;
   vAutorizar : boolean;
   vEstatus   : string;
   vStoreProc : string;
begin
   ejecutar := TRUE;

   qyEstatus.Close;
   qyEstatus.ParamByName('P_ESTATUS').AsString := 'Capturado';
   qyEstatus.Open;

   vAutorizar := qyEstatus.FieldByName('R_AUTORIZACION').AsString = 'Si';
   vNivel     := qyEstatus.FieldByName('R_NIVEL').AsInteger;
   vEstatus   := qyEstatus.FieldByName('R_ESTATUS').AsString;
   vStoreProc := qyEstatus.FieldByName('R_STOREPROC').AsString;

   if (vAutorizar) and (vNivel > reglas.dameUsuarioNivel) then
   begin
      try
         Application.CreateForm(TfrmAcceso, frmAcceso);
         frmAcceso.Nivel  := vNivel;
         frmAcceso.Status := vEstatus;
         frmAcceso.ShowModal;
         ejecutar := frmAcceso.Rsp;
      finally
         frmAcceso.Free;
      end;
   end;

  if ejecutar then
  begin
     spEstatus.Params.Clear;
     spEstatus.StoredProcName := vStoreProc;
     spEstatus.Params.CreateParam(ftInteger,'P_ID',ptInput);
     spEstatus.ParamByName('P_ID').AsInteger  := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
     spEstatus.ExecProc;
     spEstatus.Transaction.CommitRetaining;

     reglas.abrir_IBQuery_seek('R_ID', dsFuente.DataSet.FieldByName('R_ID').AsInteger, qyExplorar);
  end;
end;

procedure TfrmExplorar_punto_de_ventas.ibVerClick(Sender: TObject);
begin
//inherited;
   reglas.abrir_IBQuery_seek('R_ID', qyExplorar.FieldByName('R_ID').AsInteger, qyExplorar);

   edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.FormCreate(Sender: TObject);
var
  error : boolean;
begin
  error := False;
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  inherited;
  //datos que tienen que ver con el cajero y su caja
  qyVer_Datos_Cajero.Close;
  qyVer_Datos_Cajero.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyVer_Datos_Cajero.Open;
  Application.Title := 'apm/ERP ['+qyVer_Datos_Cajero.FieldByName('R_NOMBRE_USUARIO').AsString;
  edFecha.Text      := FormatDateTime('dd/mm/yyyy',reglas.dame_fecha);

  FPagos := TfrmCapturar_punto_de_ventas_pagos.Create(Application);
  //Clientes para ventas en efectivo
  dmIBData.TPreferencias.Filter := 'ID = 10';
  clienteEfectivo := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;

   if qyVer_Datos_Cajero.IsEmpty then
   begin
      error := True;
      ShowMessage('No tiene asignada ninguna caja para operar el punto de venta.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_BAJA').AsString = 'Si' then
   begin
      error := True;
      ShowMessage('Dado de baja, por el administrador del sistema.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_ESTATUS').AsString = 'Fuera de Operacion' then
   begin
      error := True;
      ShowMessage('Temporalmente fue suspendida la caja, consulte al administrador del sistema.');
   end;

   if qyVer_Datos_Cajero.FieldByName('R_REGISTROS').AsInteger > 1 then
   begin
      error := True;
      ShowMessage('El usuario tiene asignado a el, mas de una caja.');
   end;

  if error then
     Close
  else
  begin
     qyExplorar.Close;
     qyExplorar.ParamByName('P_ALMACEN').AsInteger := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;
     qyExplorar.Open;

     awrNivel := reglas.dameUsuarioNivel;
  end;
end;

procedure TfrmExplorar_punto_de_ventas.ibPantallaClick(Sender: TObject);
var
   res  : TModalResult;
   id   : integer;
   pntA : TPoint;
begin
//  inherited;
   iePagos.UnRegisterEvents;

   validarCredito;

   id := qyExplorar.FieldByName('R_ID').AsInteger;

{     FPagos.cbFacturar.Checked   := false;
     FPagos.dsEncabezado.DataSet := qyExplorar;
     FPagos.dsCliente.DataSet    := qyExplorar;
     FPagos.ALMACEN              := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN').AsInteger;
     //monedero electronico
     FPagos.CLIENTEN             := qyExplorar.FieldByName('R_NOMBRE_CLIENTE').AsString;
     FPagos.TELEFONO             := '';//qyExplorar.DataSet.FieldByName('R_CLIENTE_TELEFONO').AsString;
     FPagos.ShowModal;
//     frmCapturar_pvtas_formas_de_pago.Free;}

   //F12
   //pntA        := sbHijo.ClientToScreen(Point(0,0));
   frmPOSPagos := TfrmPOSPagos.Create(Application);
   try
     //frmPOSPagos.Top                  :=(pntA.y - frmPOSPagos.Height) + sbHijo.Height;
      frmPOSPagos.Left                 := pntA.x;
     // frmPOSPagos.Width                := sbHijo.Width;

      frmPOSPagos.dsEncabezado.DataSet := qyExplorar;
      frmPOSPagos.dsCliente.DataSet    := qyExplorar;
      frmPOSPagos.ALMACEN              := dsVer_Datos_Cajero.DataSet.FieldByName('R_ALMACEN').AsInteger;
      frmPOSPagos.CLIENTE              := qyExplorar.FieldByName('R_CLIENTE').AsInteger;
      frmPOSPagos.EXTENSION            := qyExplorar.FieldByName('R_EXTENSION').AsInteger;
      //monedero electronico datos
      frmPOSPagos.CLIENTEN             := qyExplorar.FieldByName('R_NOMBRE_CLIENTE').AsString;
      frmPOSPagos.TELEFONO             := qyExplorar.FieldByName('R_CLIENTE_T').AsString;
      res := frmPOSPagos.ShowModal;
   finally
      frmPOSPagos.Free;
   end;

   if res = mrOk then
   begin
      edCambio.Text := FormatFloat('###,###,##0.00', reglas.tmpDato1);
      
      reglas.abrir_IBQuery_seek('R_ID', id, qyExplorar);

      edExplorarValor.Clear;
   end;

   iePagos.RegisterEvents;

   edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.FormShow(Sender: TObject);
begin
  inherited;
  iePagos.Events.Add('CAMBIO_PUNTO');
  iePagos.RegisterEvents;
end;

procedure TfrmExplorar_punto_de_ventas.iePagosEventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
  inherited;
  if (EventName = 'CAMBIO_PUNTO') then
      reglas.abrir_IBQuery_seek('R_ID',qyExplorar.FieldByName('R_ID').AsInteger,qyExplorar);
end;

procedure TfrmExplorar_punto_de_ventas.ibImprimirClick(Sender: TObject);
var
   ejecutar     : boolean;
//   reportes     : TfrmPRN_CORTE_CAJA_PV;
   autNivel     : word;
   ruta         : string;
   archivo      : string;
   args         : string;
begin
  ejecutar := true;
  autNivel := 3;

  if (autNivel > reglas.dameUsuarioNivel) then
  begin
     try
        Application.CreateForm(TfrmAcceso, frmAcceso);
        frmAcceso.Nivel  := autNivel;
        frmAcceso.Status := 'Cortes';
        frmAcceso.ShowModal;
        ejecutar := frmAcceso.Rsp;
     finally
        frmAcceso.Free;
     end;
  end;

  if ejecutar then
  begin
     ruta    := ExtractFilePath(ParamStr(0))+'reportes\salidas\';
     archivo := 'CortesPuntoDeVta.exe';
     if FileExists(ruta + archivo) then
     begin
        args := IntToStr(reglas.dame_usuario) + ' ' +
                IntToStr(awrNivel)            + ' ' +
                qyVer_Datos_Cajero.FieldByName('R_ID').AsString      + ' ' +
                qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsString + ' ' +
                qyVer_Datos_Cajero.FieldByName('R_MONEDA').AsString;
                WinExec(PAnsiChar(ruta + archivo + ' ' + args), SW_SHOWDEFAULT)
     end
     else
        ShowMessage('Falta archivo CortesPuntoDeVta.exe en ..\reportes\salidas');
{     reportes := TfrmPRN_CORTE_CAJA_PV.Crear(Application, reglas.dame_fecha, qyVer_Datos_Cajero.FieldByName('R_ID').AsInteger, qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger);
     reportes.ShowModal;
     reportes.Destroy;}
     edExplorarValor.SetFocus;
  end;
end;

procedure TfrmExplorar_punto_de_ventas.ibF10Click(Sender: TObject);
var
   ejecutar : boolean;
begin
  inherited;
  iePagos.UnRegisterEvents;
{  frmAutorizacion := TfrmAutorizacion.Crear(Application, 5);
  frmAutorizacion.ShowModal;
  ejecutar := frmAutorizacion.dame_respuesta;
  frmAutorizacion.Free;
  if ejecutar then
  begin}
     estatusInternoCancelado;
//     spNR2.ParamByName('P_ID').AsInteger := qyExplorar.FieldByName('R_ID').AsInteger;
//     spNR2.ExecProc;
//     spNR2.Transaction.CommitRetaining;
//  end;
//  reglas.abrir_IBQuery_seek('R_ID',qyExplorar.FieldByName('R_ID').AsInteger,qyExplorar);
  iePagos.RegisterEvents;

  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.ibReImpresionFacturaClick(
  Sender: TObject);
begin
  inherited;
  try
     frmPRN_0003_TXT         := TfrmPRN_0003_TXT.Create(Application);
     frmPRN_0003_TXT.ALMACEN := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;
     if frmPRN_0003_TXT.OpenFormato then
        frmPRN_0003_TXT.ShowModal;
  finally
     frmPRN_0003_TXT.Free;
  end;

  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.ibReImpNVClick(Sender: TObject);
begin
  inherited;
  try
     frmPRN_0008         := TfrmPRN_0008.Create(Application);
     frmPRN_0008.CAJA    := 0;
     frmPRN_0008.ALMACEN := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;
     frmPRN_0008.ShowModal;
  finally
     frmPRN_0008.Free;
  end;

  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.itemF12Click(Sender: TObject);
begin
  inherited;
  if ibPantalla.Enabled and not(dsFuente.DataSet.IsEmpty) then
     ibPantalla.Click;
end;

procedure TfrmExplorar_punto_de_ventas.FormDestroy(Sender: TObject);
begin
  FPagos.Free;
  inherited;
end;

procedure TfrmExplorar_punto_de_ventas.dgExplorarBTNEXTENSIONButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  frmSeleccionarExtension             := TfrmSeleccionarExtension.Create(Application);
  frmSeleccionarExtension.DATABASE    := dmIBModulo.ibSistema;
  frmSeleccionarExtension.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
  frmSeleccionarExtension.CLAVE       := '';
  if frmSeleccionarExtension.abrirConsulta then
  begin
     frmSeleccionarExtension.ShowModal;
     if frmSeleccionarExtension.ACEPTAR then
     begin
        iePagos.UnRegisterEvents;
        spACT_CLIENTE_PVTA.ParamByName('P_ID').AsInteger        := qyExplorar.FieldByName('R_ID').AsInteger;
        spACT_CLIENTE_PVTA.ParamByName('P_CLIENTE').AsInteger   := frmSeleccionarExtension.CLIENTE;
        spACT_CLIENTE_PVTA.ParamByName('P_EXTENSION').AsInteger := frmSeleccionarExtension.EXTENSION;
        spACT_CLIENTE_PVTA.ExecProc;
        spACT_CLIENTE_PVTA.Transaction.CommitRetaining;
        reglas.abrir_IBQuery_seek('R_ID',qyExplorar.FieldByName('R_ID').AsInteger, qyExplorar);
        iePagos.RegisterEvents;
     end;
  end;
end;

procedure TfrmExplorar_punto_de_ventas.dgExplorarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  {
  with TdxDBGrid(Sender) do
    if (Key = VK_RETURN) and (Columns[GetFocusedAbsoluteIndex(FocusedColumn)]is TdxDBGridButtonColumn) then
    begin
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgExplorarBTNF12) then
          dgExplorarBTNF12.OnButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgExplorarCLIENTE   ) OR
          (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgExplorarBTNCLIENTE) then
          dgExplorarBTNCLIENTE.OnButtonClick(Sender, 0)
       else
       if (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgExplorarEXTENSION   ) OR
          (Columns[GetFocusedAbsoluteIndex(FocusedColumn)] = dgExplorarBTNEXTENSION) then
          dgExplorarBTNEXTENSION.OnButtonClick(Sender, 0);
    end;
    }
end;

procedure TfrmExplorar_punto_de_ventas.dgExplorarBTNCLIENTEButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  frmSeleccionarCliente := TfrmSeleccionarCliente.Create(Application);
  frmSeleccionarCliente.DATABASE    := dmIBModulo.ibSistema;
  frmSeleccionarCliente.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
  frmSeleccionarCliente.CLAVE       := '';
  if frmSeleccionarCliente.abrirConsulta then
  begin
     frmSeleccionarCliente.ShowModal;
     if frmSeleccionarCliente.ACEPTAR then
     begin
        iePagos.UnRegisterEvents;
        spACT_CLIENTE_PVTA.ParamByName('P_ID').AsInteger        := qyExplorar.FieldByName('R_ID').AsInteger;
        spACT_CLIENTE_PVTA.ParamByName('P_CLIENTE').AsInteger   := frmSeleccionarCliente.ID;
        spACT_CLIENTE_PVTA.ParamByName('P_EXTENSION').AsInteger := 0;
        spACT_CLIENTE_PVTA.ExecProc;
        spACT_CLIENTE_PVTA.Transaction.CommitRetaining;
        reglas.abrir_IBQuery_seek('R_ID',qyExplorar.FieldByName('R_ID').AsInteger, qyExplorar);
        iePagos.RegisterEvents;
     end;
  end;
end;

procedure TfrmExplorar_punto_de_ventas.dgExplorarBTNF12ButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  inherited;
  ibPantalla.Click;
end;

procedure TfrmExplorar_punto_de_ventas.buVentasClick(Sender: TObject);
begin
  inherited;
  frmCapturar_Punto_de_Venta_Cancelacion := TfrmCapturar_Punto_de_Venta_Cancelacion.Crear(Application, qyVer_Datos_Cajero.FieldByName('R_ID').AsInteger, qyVer_Datos_Cajero.FieldByName('R_USUARIO').AsInteger);
  frmCapturar_Punto_de_Venta_Cancelacion.ShowModal;
  frmCapturar_Punto_de_Venta_Cancelacion.Destroy;

  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.edExplorarValorKeyPress(
  Sender: TObject; var Key: Char);
begin
//  inherited;
   if key = #13 then
   begin
      encontrarID;
   end;
end;

procedure TfrmExplorar_punto_de_ventas.ibExportarXLSClick(Sender: TObject);
begin
  inherited;
  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.ibExportarHTMLClick(
  Sender: TObject);
begin
  inherited;
  edExplorarValor.SetFocus;
end;

procedure TfrmExplorar_punto_de_ventas.ibExportarXMLClick(Sender: TObject);
begin
  inherited;
  edExplorarValor.SetFocus;
end;

end.
