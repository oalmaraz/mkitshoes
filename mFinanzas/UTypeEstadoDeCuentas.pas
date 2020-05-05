unit UTypeEstadoDeCuentas;

interface

uses
   UTipos, URecords, Forms, extctrls,  UdmEstadoDeCuentas, classes, db, IBX.IBDatabase,
   UfrmDetalleDeLaVenta, capturar_pagos_formas_de_pago,
  capturar_cxc_mensajes, UfrmDocumentoPagos, Vcl.Controls;

type
   TEstadoDeCuentas = class(TObject)
   private
     dmEstadoDeCuentas : TdmEstadoDeCuentas;
     FDatos            : _EstadoDeCuentas;
     awrForma          : TTypeForma;
     rptDetalleVtas    : TfrmDetalleDeLaVenta;
     mensajes          : TfrmCapturar_cxc_mensajes;
     docPagos          : TfrmDocumentoPagos;
     pago              : TfrmCapturar_Pagos_formas_de_pago;
     procedure setESTATUS(valor : String20);
     procedure setFECHA_ULT_COMPRA(valor : TDatetime);
     procedure setFECHA_ULT_PAGO(valor : TDatetime);
     procedure setCLIENTE(valor : integer);
     procedure setCLIENTE_CLAVE(valor : String50);
     procedure setCLIENTE_NOMBRE(valor : String100);
     procedure setLIMITE_CREDITO(valor : double);
     procedure setSALDO_CLIENTE(valor : double);
     procedure setSALDO_EXTENSION(valor : double);
     procedure setSALDO_T_VENCIDO(valor : double);
     procedure setSALDO_VENCIDO(valor : double);
     procedure setFOTO(valor : TMemoryStream);
     procedure setFIRMA(valor : TMemoryStream);
     procedure setALMACEN(valor : integer);
     procedure setALMACEN_NOMBRE(valor : String100);
     procedure setCAJA(valor : integer);
     procedure setCAJA_NOMBRE(valor : String100);
     procedure setIMPORTE_A_PAGAR(valor : double);
     procedure setUSUARIO(valor : integer);
     procedure setUSUARIO_NOMBRE(valor : String100);
     procedure setSALDO_TOTAL(valor : double);
     procedure setTODOS(valor : String2);
     procedure setRESTO(valor : double);
     procedure setTELEFONO(valor: String20);
     procedure setCAJAS(valor : integer);
     procedure setMONEDA(valor : integer);

     function getMONEDA : integer;
     function getCAJAS : integer;
     function getTELEFONO : String20;
     function getRESTO : double;
     function getTODOS : String2;
     function getSALDO_TOTAL : double;
     function getUSUARIO_NOMBRE   : String100;
     function getUSUARIO          : integer;
     function getESTATUS          : String20;
     function getFECHA_ULT_COMPRA : TDatetime;
     function getFECHA_ULT_PAGO   : TDatetime;
     function getCLIENTE          : integer;
     function getCLIENTE_CLAVE    : String50;
     function getCLIENTE_NOMBRE   : String100;
     function getLIMITE_CREDITO   : double;
     function getSALDO_CLIENTE    : double;
     function getSALDO_EXTENSION  : double;
     function getSALDO_T_VENCIDO  : double;
     function getSALDO_VENCIDO    : double;
     function getFOTO             : TMemoryStream;
     function getFIRMA            : TMemoryStream;
     function getALMACEN          : integer;
     function getALMACEN_NOMBRE   : String100;
     function getCAJA             : integer;
     function getCAJA_NOMBRE      : String100;
     function getIMPORTE_A_PAGAR  : double;

     function GetFecha : TDatetime;
     function GetVacio : Boolean;
     function GetDatabase : TIBDatabase;
     function GetTransaction : TIBTransaction;
     function getCajaVacio : Boolean;
     function getDataSourceDetalle : TDataSource;
     function getDiferentes : Boolean;
     function getMovCheques : Boolean;
   public
     constructor Create();overload;
     destructor Destroy; override;
     procedure LoadDatosCaja;
     procedure LoadDetalle;
     procedure imagenVer(dato : TMemoryStream; var imagen : TImage);
     procedure EjecutarAutomatico;
     procedure EjecutarManual;
     procedure EjecutarVencido;
     procedure EjecutarModificado;
     procedure EjecutarSeleccionado;
     procedure EjecutarSaldosMinimos;
     procedure rptDetalleDeVtas;
     procedure rptDetallePagos;
     procedure rptDetalleNCreditoSAfectar;
     procedure rptDetalleNCreditoAfectada;
     procedure rptDetalleNCargoSAfectar;
     procedure rptDetalleNCargoAfectada;
     procedure rptMensajes;
     procedure setForma(valor : TTypeForma);
     procedure pagoModificado(valor : string);
     function crearTipoPago(valor : string) : TModalResult;
     procedure Cancelar;
   published
      property ESTATUS          : String20 read getESTATUS write setESTATUS;
      property FECHA_ULT_COMPRA : TDatetime read getFECHA_ULT_COMPRA write setFECHA_ULT_COMPRA;
      property FECHA_ULT_PAGO   : TDatetime read getFECHA_ULT_PAGO write setFECHA_ULT_PAGO;
      property CLIENTE          : integer read getCLIENTE write setCLIENTE;
      property CLIENTE_CLAVE    : String50 read getCLIENTE_CLAVE write setCLIENTE_CLAVE;
      property CLIENTE_NOMBRE   : String100 read getCLIENTE_NOMBRE write setCLIENTE_NOMBRE;
      property LIMITE_CREDITO   : double read getLIMITE_CREDITO write setLIMITE_CREDITO;
      property SALDO_CLIENTE    : double read getSALDO_CLIENTE write setSALDO_CLIENTE;
      property SALDO_EXTENSION  : double read getSALDO_EXTENSION write setSALDO_EXTENSION;
      property SALDO_T_VENCIDO  : double read getSALDO_T_VENCIDO write setSALDO_T_VENCIDO;
      property SALDO_VENCIDO    : double read getSALDO_VENCIDO write setSALDO_VENCIDO;
      property SALDO_TOTAL      : double read getSALDO_TOTAL write setSALDO_TOTAL;
      property FOTO             : TMemoryStream read getFOTO write setFOTO;
      property FIRMA            : TMemoryStream read getFIRMA write setFIRMA;
      property ALMACEN          : integer read getALMACEN write setALMACEN;
      property ALMACEN_NOMBRE   : String100 read getALMACEN_NOMBRE write setALMACEN_NOMBRE;
      property CAJA             : integer read getCAJA write setCAJA;
      property CAJA_NOMBRE      : String100 read getCAJA_NOMBRE write setCAJA_NOMBRE;
      property IMPORTE_A_PAGAR  : double read getIMPORTE_A_PAGAR write setIMPORTE_A_PAGAR;
      property FECHA_SERVIDOR   : TDatetime read GetFecha;
      property DATABASE         : TIBDatabase read GetDatabase;
      property TRANSACTION      : TIBTransaction read GetTransaction;
      property USUARIO          : integer read getUSUARIO write setUSUARIO;
      property USUARIO_NOMBRE   : String100 read getUSUARIO_NOMBRE write setUSUARIO_NOMBRE;
      property TODOS            : String2 read getTODOS write setTODOS;
      property CAJA_VACIO       : Boolean read getCajaVacio;
      property dsDetalle        : TDataSource read getDataSourceDetalle;
      property DETALLE_VACIO    : Boolean read getVacio;
      property RESTO            : double read getRESTO write setRESTO;
      property PERMITIR_DIF     : Boolean read getDiferentes;
      property FORMA            : TTypeForma read awrForma write setForma;
      property TELEFONO         : String20 read getTELEFONO write setTELEFONO;
      property CAJAS            : integer read getCAJAS write setCAJAS;
      property MovCheques       : boolean read getMovCheques;
      property MONEDA           : integer read getMONEDA write setMONEDA;
   end;

implementation

uses
   jpeg,  UfrmDocumentoNCreditoSAfectar, UfrmDocumentoNCreditoAfectada,
  UfrmDocumentoNCargoSAfectar, UfrmDocumentoNCargoAfectada;

constructor TEstadoDeCuentas.Create();
begin
  inherited Create;
  dmEstadoDeCuentas := TdmEstadoDeCuentas.Create(nil);
  FDatos.FOTO       := TMemoryStream.Create;
  FDatos.FIRMA      := TMemoryStream.Create;
  rptDetalleVtas    := TfrmDetalleDeLaVenta.Create(nil);
  mensajes          := TfrmCapturar_cxc_mensajes.Create(nil);;
  docPagos          := TfrmDocumentoPagos.Create(nil);

  CLIENTE := 0;
  ESTATUS := 'Por Cobrar';
  ALMACEN := 0;
  TODOS   := 'No';
  RESTO   := 0;
end;

destructor TEstadoDeCuentas.Destroy;
begin
   if awrForma = tfCXC then
   begin
      pago.Free;
      pago := nil;
   end;

   docPagos.Free;
   docPagos := nil;
   mensajes.Free;
   mensajes := nil;
   rptDetalleVtas.Free;
   rptDetalleVtas := nil;
   FDatos.FOTO.Free;
   FDatos.FOTO := nil;
   FDatos.FIRMA.Free;
   FDatos.FIRMA := nil;
   dmEstadoDeCuentas.Free;
   dmEstadoDeCuentas := nil;
   inherited destroy;
end;

procedure TEstadoDeCuentas.setMONEDA(valor : integer);
begin
   FDatos.MONEDA := valor;
end;

function TEstadoDeCuentas.getMONEDA : integer;
begin
   Result := FDatos.MONEDA;
end;

procedure TEstadoDeCuentas.Cancelar;
begin
   dmEstadoDeCuentas.CancelarCXC;
end;

function TEstadoDeCuentas.getMovCheques : Boolean;
begin
   Result := docPagos.HayCheques;
end;

procedure TEstadoDeCuentas.rptDetalleNCargoSAfectar;
var
   ncargo : TfrmDocumentoNCargoSAfectar;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        ncargo := TfrmDocumentoNCargoSAfectar.Create(nil);
        ncargo.CXC := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        ncargo.ShowModal;
        ncargo.Free;
     end;
  end;
end;

procedure TEstadoDeCuentas.rptDetalleNCargoAfectada;
var
   ncargo : TfrmDocumentoNCargoAfectada;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        ncargo := TfrmDocumentoNCargoAfectada.Create(nil);
        ncargo.CXC := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        ncargo.ShowModal;
        ncargo.Free;
     end;
  end;
end;

procedure TEstadoDeCuentas.rptDetalleNCreditoSAfectar;
var
   ncredito : TfrmDocumentoNCreditoSAfectar;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        ncredito := TfrmDocumentoNCreditoSAfectar.Create(nil);
        ncredito.CXC := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        ncredito.ShowModal;
        ncredito.Free;
     end;
  end;
end;

procedure TEstadoDeCuentas.rptDetalleNCreditoAfectada;
var
   ncredito : TfrmDocumentoNCreditoAfectada;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        ncredito := TfrmDocumentoNCreditoAfectada.Create(nil);
        ncredito.CXC := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        ncredito.ShowModal;
        ncredito.Free;
     end;
  end;
end;

procedure TEstadoDeCuentas.rptDetallePagos;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        docPagos.HayCheques := false;
        docPagos.Usuario    := USUARIO;
        docPagos.CXC        := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        docPagos.ShowModal;
     end;
  end;
end;

procedure TEstadoDeCuentas.setCAJAS(valor : integer);
begin
   FDatos.CAJAS := valor;
end;

function TEstadoDeCuentas.getCAJAS : integer;
begin
   result := FDatos.CAJAS;
end;

procedure TEstadoDeCuentas.setTELEFONO(valor: String20);
begin
   FDatos.TELEFONO := valor;
end;

function TEstadoDeCuentas.getTELEFONO : String20;
begin
   Result := FDatos.TELEFONO;
end;

procedure TEstadoDeCuentas.pagoModificado(valor : string);
begin
   dmEstadoDeCuentas.pagoModificado(valor);
end;

procedure TEstadoDeCuentas.rptMensajes;
begin
   mensajes.CLIENTE := FDatos.CLIENTE;
   mensajes.ShowModal;
end;

procedure TEstadoDeCuentas.setForma(valor : TTypeForma);
begin
   awrForma := valor;
   if awrForma = tfCXC then
   begin
      pago := TfrmCapturar_Pagos_formas_de_pago.Create(nil);
   end;
end;

function TEstadoDeCuentas.crearTipoPago(valor : string) : TModalResult;
var
   tmp  : TModalResult;
   id   : integer;
begin
   id   := dmEstadoDeCuentas.crearTipoPago(valor, FDatos);
   pago.ID         := id;
   pago.CLIENTE    := CLIENTE;
   pago.CLIENTEN   := CLIENTE_NOMBRE;
   pago.TELEFONO   := TELEFONO;
   pago.CREDITO    := SALDO_TOTAL;
   pago.DISPONIBLE := LIMITE_CREDITO;
   pago.ALMACEN    := ALMACEN_NOMBRE;
   tmp  := pago.ShowModal;

   if tmp <> mrOK then
      dmEstadoDeCuentas.CancelarTipoPago(id);
   Result := tmp;
end;

procedure TEstadoDeCuentas.rptDetalleDeVtas;
begin
  if dsDetalle.DataSet <> nil then
  begin
     if not(DETALLE_VACIO) then
     begin
        rptDetalleVtas.ID := dsDetalle.DataSet.FieldByName('R_ID').AsInteger;
        rptDetalleVtas.ShowModal;
     end;
  end;
end;

procedure TEstadoDeCuentas.EjecutarSaldosMinimos;
begin
   dmEstadoDeCuentas.EjecutarSaldoMinimo;
end;

procedure TEstadoDeCuentas.EjecutarSeleccionado;
begin
   dmEstadoDeCuentas.EjecutarSeleccionado;
end;

function TEstadoDeCuentas.getDiferentes : Boolean;
begin
   Result := dmEstadoDeCuentas.DIFERENTES;
end;

procedure TEstadoDeCuentas.EjecutarAutomatico;
begin
   dmEstadoDeCuentas.EjecutarAutomatico(FDatos);
end;

procedure TEstadoDeCuentas.EjecutarManual;
begin
   dmEstadoDeCuentas.EjecutarManual(FDatos);
end;

procedure TEstadoDeCuentas.EjecutarVencido;
begin
   dmEstadoDeCuentas.EjecutarVencido(FDatos);
end;

procedure TEstadoDeCuentas.EjecutarModificado;
begin
   dmEstadoDeCuentas.EjecutarModificado(FDatos);
end;

procedure TEstadoDeCuentas.setRESTO(valor : double);
begin
   FDatos.RESTO := valor;
end;

function TEstadoDeCuentas.getRESTO : double;
begin
   Result := FDatos.RESTO;
end;

procedure TEstadoDeCuentas.LoadDetalle;
begin
   dmEstadoDeCuentas.Detalle(FDatos);
end;

function TEstadoDeCuentas.getDataSourceDetalle : TDataSource;
begin
   Result := dmEstadoDeCuentas.dsDetalle;
end;

function TEstadoDeCuentas.getCajaVacio : Boolean;
begin
   Result := dmEstadoDeCuentas.dsVer_Datos_Cajero.DataSet.IsEmpty;
end;

procedure TEstadoDeCuentas.setTODOS(valor : String2);
begin
   FDatos.TODOS := valor;
end;

function TEstadoDeCuentas.getTODOS : String2;
begin
   Result := FDatos.TODOS;
end;

procedure TEstadoDeCuentas.imagenVer(dato : TMemoryStream; var imagen : TImage);
type
  TGraphType = (gtBitmap, gtIcon, gtMetafile, gtJpeg);
var
  Jpg       : TJpegImage;
  GraphType : TGraphType;
begin
  Jpg    := nil;
  try
    if dato.Size > 0 then
    begin
      dato.Position := 0;
      dato.Read(GraphType, 1);
      case GraphType of
         gtBitmap   : imagen.Picture.Bitmap.LoadFromStream(dato);
         gtIcon     : imagen.Picture.Icon.LoadFromStream(dato);
         gtMetafile : imagen.Picture.Metafile.LoadFromStream(dato);
         gtJpeg     : begin
                         Jpg := TJpegImage.Create;
                         Jpg.LoadFromStream(dato);
                         imagen.Picture.Assign(Jpg);
                      end
      else
         imagen.Picture.Assign(nil);
      end;
    end
       else
          imagen.Picture.Assign(nil);
  except
    imagen.Picture.Assign(nil);
  end;
  jpg.Free;
end;

procedure TEstadoDeCuentas.LoadDatosCaja;
begin
   dmEstadoDeCuentas.DatosCaja(USUARIO);
   dmEstadoDeCuentas.LoadDatosCaja(FDatos);
end;

procedure TEstadoDeCuentas.setUSUARIO_NOMBRE(valor : String100);
begin
   FDatos.USUARIO_NOMBRE := valor;
end;

function TEstadoDeCuentas.getUSUARIO_NOMBRE   : String100;
begin
   Result := FDatos.USUARIO_NOMBRE;
end;

procedure TEstadoDeCuentas.setSALDO_TOTAL(valor : double);
begin
   FDatos.SALDO_TOTAL := valor;
end;

function TEstadoDeCuentas.getSALDO_TOTAL : double;
begin
   Result := FDatos.SALDO_TOTAL;
end;

procedure TEstadoDeCuentas.setUsuario(valor : integer);
begin
   FDatos.USUARIO := valor;
   dmEstadoDeCuentas.Usuario(valor);
   dmEstadoDeCuentas.LoadDatoUsuario(FDatos);
end;

function TEstadoDeCuentas.getUsuario : integer;
begin
   Result := FDatos.USUARIO;
end;

function TEstadoDeCuentas.GetDatabase : TIBDatabase;
begin
   Result := dmEstadoDeCuentas.qyEstadoDeCuentaEnc.Database;
end;

function TEstadoDeCuentas.GetTransaction : TIBTransaction;
begin
   Result := dmEstadoDeCuentas.qyEstadoDeCuentaEnc.Transaction;
end;

procedure TEstadoDeCuentas.setESTATUS(valor : String20);
begin
   FDatos.ESTATUS := valor;
end;

procedure TEstadoDeCuentas.setFECHA_ULT_COMPRA(valor : TDatetime);
begin
   FDatos.FECHA_ULT_COMPRA := valor;
end;

procedure TEstadoDeCuentas.setFECHA_ULT_PAGO(valor : TDatetime);
begin
   FDatos.FECHA_ULT_PAGO := valor;
end;

procedure TEstadoDeCuentas.setCLIENTE(valor : integer);
begin
   FDatos.CLIENTE := valor;
   if FORMA = tfCXC then
   begin
      dmEstadoDeCuentas.iniciarParametrosDetalle(FDatos);
   end;
   dmEstadoDeCuentas.Cliente(FDatos);
end;

procedure TEstadoDeCuentas.setCLIENTE_CLAVE(valor : String50);
begin
   FDatos.CLIENTE_CLAVE := valor;
end;

procedure TEstadoDeCuentas.setCLIENTE_NOMBRE(valor : String100);
begin
   FDatos.CLIENTE_NOMBRE := valor;
end;

procedure TEstadoDeCuentas.setLIMITE_CREDITO(valor : double);
begin
   FDatos.LIMITE_CREDITO := valor;
end;

procedure TEstadoDeCuentas.setSALDO_CLIENTE(valor : double);
begin
   FDatos.SALDO_CLIENTE := valor;
end;

procedure TEstadoDeCuentas.setSALDO_EXTENSION(valor : double);
begin
   FDatos.SALDO_EXTENSION := valor;
end;

procedure TEstadoDeCuentas.setSALDO_T_VENCIDO(valor : double);
begin
   FDatos.SALDO_T_VENCIDO := valor;
end;

procedure TEstadoDeCuentas.setSALDO_VENCIDO(valor : double);
begin
   FDatos.SALDO_VENCIDO := valor;
end;

procedure TEstadoDeCuentas.setFOTO(valor : TMemoryStream);
begin
   FDatos.FOTO := valor;
end;

procedure TEstadoDeCuentas.setFIRMA(valor : TMemoryStream);
begin
   FDatos.FIRMA := valor;
end;

procedure TEstadoDeCuentas.setALMACEN(valor : integer);
begin
   FDatos.ALMACEN := valor;
end;

procedure TEstadoDeCuentas.setALMACEN_NOMBRE(valor : String100);
begin
   FDatos.ALMACEN_NOMBRE := valor;
end;

procedure TEstadoDeCuentas.setCAJA(valor : integer);
begin
   FDatos.CAJA := valor;
end;

procedure TEstadoDeCuentas.setCAJA_NOMBRE(valor : String100);
begin
   FDatos.CAJA_NOMBRE := valor;
end;

procedure TEstadoDeCuentas.setIMPORTE_A_PAGAR(valor : double);
begin
   FDatos.IMPORTE_A_PAGAR := valor;
end;

function TEstadoDeCuentas.getESTATUS          : String20;
begin
   Result := FDatos.ESTATUS;
end;

function TEstadoDeCuentas.getFECHA_ULT_COMPRA : TDatetime;
begin
   Result := FDatos.FECHA_ULT_COMPRA;
end;

function TEstadoDeCuentas.getFECHA_ULT_PAGO   : TDatetime;
begin
   Result := FDatos.FECHA_ULT_PAGO;
end;

function TEstadoDeCuentas.getCLIENTE          : integer;
begin
   Result := FDatos.CLIENTE;
end;

function TEstadoDeCuentas.getCLIENTE_CLAVE    : String50;
begin
   Result := FDatos.CLIENTE_CLAVE;
end;

function TEstadoDeCuentas.getCLIENTE_NOMBRE   : String100;
begin
   Result := FDatos.CLIENTE_NOMBRE;
end;

function TEstadoDeCuentas.getLIMITE_CREDITO   : double;
begin
   Result := FDatos.LIMITE_CREDITO;
end;

function TEstadoDeCuentas.getSALDO_CLIENTE    : double;
begin
   Result := FDatos.SALDO_CLIENTE;
end;

function TEstadoDeCuentas.getSALDO_EXTENSION  : double;
begin
   Result := FDatos.SALDO_EXTENSION;
end;

function TEstadoDeCuentas.getSALDO_T_VENCIDO  : double;
begin
   Result := FDatos.SALDO_T_VENCIDO;
end;

function TEstadoDeCuentas.getSALDO_VENCIDO    : double;
begin
   Result := FDatos.SALDO_VENCIDO;
end;

function TEstadoDeCuentas.getFOTO             : TMemoryStream;
begin
   Result := FDatos.FOTO;
end;

function TEstadoDeCuentas.getFIRMA            : TMemoryStream;
begin
   Result := FDatos.FIRMA;
end;

function TEstadoDeCuentas.getALMACEN          : integer;
begin
   Result := FDatos.ALMACEN;
end;

function TEstadoDeCuentas.getALMACEN_NOMBRE   : String100;
begin
   Result := FDatos.ALMACEN_NOMBRE;
end;

function TEstadoDeCuentas.getCAJA             : integer;
begin
   Result := FDatos.CAJA;
end;

function TEstadoDeCuentas.getCAJA_NOMBRE      : String100;
begin
   Result := FDatos.CAJA_NOMBRE;
end;

function TEstadoDeCuentas.getIMPORTE_A_PAGAR  : double;
begin
   Result := FDatos.IMPORTE_A_PAGAR;
end;

function TEstadoDeCuentas.GetFecha : TDatetime;
begin
   Result := dmEstadoDeCuentas.FECHA;
end;

function TEstadoDeCuentas.GetVacio : Boolean;
begin
   Result := dmEstadoDeCuentas.dsDetalle.DataSet.IsEmpty;
end;

end.
