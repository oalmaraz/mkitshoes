unit UfrmSurtimientoListaEmpaque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery,  ExtCtrls, Grids, DBGrids, Buttons,
  IBX.IBStoredProc;

type
  TfrmSurtimientoListaEmpaque = class(TForm)
    Panel2: TPanel;
    qyPedido: TIBQuery;
    dsSurtidos: TDataSource;
    spA_DESPACHADOR_SURTIMIENTO: TIBStoredProc;
    spA_SURTIMIENTO_MI: TIBStoredProc;
    Panel6: TPanel;
    spP_ADD_MI_PEDIDO: TIBStoredProc;
    qyPedidoR_ROW: TIntegerField;
    qyPedidoR_ID: TIntegerField;
    qyPedidoR_PEDIDO: TIntegerField;
    qyPedidoR_PEDIDO_CLAVE: TIBStringField;
    qyPedidoR_CLIENTE: TIBStringField;
    qyPedidoR_CLIENTE_NOMBRE: TIBStringField;
    qyPedidoR_CLIENTE_RSOCIAL: TIBStringField;
    qyPedidoR_EXTENSION: TIBStringField;
    qyPedidoR_EXTENSION_NOMBRE: TIBStringField;
    qyPedidoR_GRANTOTAL: TFloatField;
    qyPedidoR_PRIORIDAD: TIBStringField;
    qyPedidoR_FECHA: TDateTimeField;
    qyPedidoR_NUM_PART: TIntegerField;
    qyPedidoR_ESTATUS: TIBStringField;
    qyPedidoR_VENDEDOR: TIntegerField;
    qyPedidoR_VENDEDOR_C: TIBStringField;
    qyPedidoR_VENDEDOR_N: TIBStringField;
    qyPedidoR_ALMACEN: TIntegerField;
    Label3: TLabel;
    paTotales: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel7: TPanel;
    Panel9: TPanel;
    dgPromocionales: TDBGrid;
    qyTiempos: TIBQuery;
    dsTiempos: TDataSource;
    qyTiemposR_ID: TIntegerField;
    qyTiemposR_DESCRIPCION: TIBStringField;
    qyTiemposR_PESO: TFloatField;
    qyTiemposR_UNIDAD: TIntegerField;
    qyTiemposR_UNIDAD_C: TIBStringField;
    qyTiemposR_UNIDAD_D: TIBStringField;
    qyTiemposR_TARIFA: TFloatField;
    qyTiemposR_MONEDA: TIntegerField;
    qyTiemposR_MONEDA_C: TIBStringField;
    qyTiemposR_MONEDA_D: TIBStringField;
    qyTiemposR_TRANSPORTISTA: TIntegerField;
    qyTiemposR_TRANSPORTISTA_C: TIBStringField;
    qyTiemposR_TRANSPORTISTA_N: TIBStringField;
    qyTiemposR_EXCEDENTE_X_KG: TFloatField;
    qyPromocionales: TIBQuery;
    dsPromocionales: TDataSource;
    qyPromocionalesR_ID: TIntegerField;
    qyPromocionalesR_CLAVE: TIBStringField;
    qyPromocionalesR_DESCRIPCION: TIBStringField;
    qyPromocionalesR_PRECIO: TFloatField;
    laPorcentaje: TLabel;
    Panel10: TPanel;
    buSalir: TBitBtn;
    Label5: TLabel;
    laTotal: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    laPromocionales: TLabel;
    Panel8: TPanel;
    dgPaqueterias: TDBGrid;
    Splitter1: TSplitter;
    Panel12: TPanel;
    buLEmpaque: TBitBtn;
    Panel3: TPanel;
    Label2: TLabel;
    laCliente: TLabel;
    Label1: TLabel;
    laRSocial: TLabel;
    Label4: TLabel;
    laVendedor: TLabel;
    Panel13: TPanel;
    edFiltro: TEdit;
    buBuscar: TBitBtn;
    EncartaButton1: TBitBtn;
    dgPartidas: TDBGrid;
    qyPartidas: TIBQuery;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_CANTIDAD_ENTREGADA: TFloatField;
    qyPartidasR_PRECIO: TFloatField;
    qyPartidasR_SUBTOTAL: TFloatField;
    qyPartidasR_IVA: TFloatField;
    qyPartidasR_IEPS: TFloatField;
    qyPartidasR_IMPUESTO1: TFloatField;
    qyPartidasR_IMPUESTO2: TFloatField;
    qyPartidasR_TOTAL: TFloatField;
    qyPartidasR_DESCUENTO_PORC: TFloatField;
    qyPartidasR_DP: TFloatField;
    qyPartidasR_DG: TFloatField;
    qyPartidasR_GT: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    qyPartidasR_COTIZACION: TIntegerField;
    qyPartidasR_CLAVE_COTIZACION: TIBStringField;
    qyPartidasR_PRECIO_SIN_IMPUESTOS: TFloatField;
    qyPartidasR_CAJAS: TIntegerField;
    qyPartidasR_IVA_PORC: TFloatField;
    qyPartidasR_IEPS_PORC: TFloatField;
    qyPartidasR_IMPUESTO1_PORC: TFloatField;
    qyPartidasR_IMPUESTO2_PORC: TFloatField;
    qyPartidasR_MATERIAL_CBARRAS: TIBStringField;
    qyPartidasR_MATERIAL_OBSERVACIONES: TBlobField;
    qyPartidasR_MATERIAL_FOTO: TBlobField;
    qyPartidasR_PZAS_X_CAJA: TIntegerField;
    qyPartidasR_COMENTARIO: TIBStringField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    qyPartidasR_CLIENTE_MAT_C: TIBStringField;
    qyPartidasR_CLIENTE_MAT_D: TIBStringField;
    qyPartidasR_F_PROM_ENT: TDateTimeField;
    qyPartidasR_PNC: TFloatField;
    qyPartidasR_CANTIDAD_PENDIENTE: TFloatField;
    qyPartidasR_SERIE: TIBStringField;
    qyPartidasR_NUM_SERIE: TIBStringField;
    qyPartidasR_COSTO_ULT_COMPRA: TFloatField;
    qyPartidasR_DG_PORC: TFloatField;
    dsPartidas: TDataSource;
    qyCajas: TIBQuery;
    spMODIFICAR_CAJAS_PEDIDO: TIBStoredProc;
    laAutorizarPorcentaje: TLabel;
    qyPedidoR_CLIENTE_T: TIBStringField;
    Label6: TLabel;
    laTelefono: TLabel;
    Panel5: TPanel;
    Label9: TLabel;
    laPaqueteria: TLabel;
    Panel11: TPanel;
    Label12: TLabel;
    laSeleccionados: TLabel;
    laAutorizarPromocionales: TLabel;
    spA_DOCUMENTO_SURTIMIENTO: TIBStoredProc;
    spADD_PARTIDA_PEDIDO: TIBStoredProc;
    spADD_PARTIDA_FACTURA: TIBStoredProc;
    qyPromocionalesR_UBASE: TIntegerField;
    procedure buSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsSurtidosDataChange(Sender: TObject; Field: TField);
    procedure buBuscarClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure buLEmpaqueClick(Sender: TObject);
    procedure dgPromocionalesBOTONSButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPromocionalesBOTONCButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasCAJASButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPartidasSELButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure EncartaButton1Click(Sender: TObject);
    procedure laPorcentajeClick(Sender: TObject);
    procedure laSeleccionadosClick(Sender: TObject);
    procedure dgTiemposBTNVALORButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
  private
    { Private declarations }
    awrPorcentaje    : double;
    awrPromocionales : double;
    awrSeleccionados : double;
    awrPaqueterias   : double;
    awrCajas         : integer;

    procedure formatoPorcentaje(valor : double);
    procedure formatoPromocionales(valor : double);
    procedure formatoPaqueterias;
    procedure formatoSeleccionados;
    procedure totalPromocionales;
    procedure totalSeleccionados;
    procedure totalPaqueterias;
    procedure loadPromocionales;
    procedure loadPaqueterias;
    procedure limpiarSeleccionados;
    procedure limpiarTiempos;
    procedure addPartidasPedido(valor : integer);
    procedure addPartidasFactura(valor : integer);
    procedure limpiar;
  public
    { Public declarations }
    procedure llenarPartidas;
  end;

var
  frmSurtimientoListaEmpaque: TfrmSurtimientoListaEmpaque;

const
//promocionales
   caID  = 0;//Identificador
   caPRE = 1;//Precio
   caUBA = 2;//Unidad Base
   caSEL = 3;//Seleccionar
   caCAN = 4;//Cantidad
//tiempos
   tiID  = 0;//Identificador
   tiPRE = 1;//Precio
   tiSEL = 2;//Seleccionar
   tiCAN = 3;//Cantidad

implementation

uses
  IBModulo, reglas_de_negocios, PRN_0029_MI,
  PRN_0027, UfrmAcceso, UfrmDespachadorSurtimiento, IBData;

{$R *.DFM}

procedure TfrmSurtimientoListaEmpaque.limpiar;
begin
   awrPromocionales := 0;
   awrPaqueterias   := 0;
   awrSeleccionados := 0;
   awrCajas         := 0;
   laAutorizarPorcentaje.Visible    := false;
   laAutorizarPromocionales.Visible := false;

   formatoPaqueterias;
   formatoSeleccionados;
   limpiarSeleccionados;
   limpiarTiempos;
   totalPromocionales;
   totalPaqueterias;
end;

procedure TfrmSurtimientoListaEmpaque.addPartidasPedido(valor : integer);
var
   i : integer;
begin
   dmIBData.spFECHA_SERVIDOR.ExecProc;
   for i := 0 to dgPromocionales.DataSource.Dataset.recordCount - 1 do
   begin
      {
      if dgPromocionales.Items[i].Values[caSEL] = 'Si' then
      begin
         spADD_PARTIDA_PEDIDO.ParamByName('P_ID').AsInteger          := valor;
         spADD_PARTIDA_PEDIDO.ParamByName('P_MATERIAL').AsInteger    := StrToInt(dgPromocionales.Items[i].Values[caID]);
         spADD_PARTIDA_PEDIDO.ParamByName('P_CANTIDAD').AsInteger    := StrToInt(dgPromocionales.Items[i].Values[caCAN]);
         spADD_PARTIDA_PEDIDO.ParamByName('P_PRECIO').AsFloat        := 0.01;
         spADD_PARTIDA_PEDIDO.ParamByName('P_UNIDAD').AsInteger      := StrToInt(dgPromocionales.Items[i].Values[caUBA]);
         spADD_PARTIDA_PEDIDO.ParamByName('P_COMENTARIO').AsString   := '';
         spADD_PARTIDA_PEDIDO.ParamByName('P_F_PROM_ENT').AsDatetime := dmIBData.spFECHA_SERVIDOR.ParamByName('R_FECHA').AsDatetime;
         spADD_PARTIDA_PEDIDO.ExecProc;
         spADD_PARTIDA_PEDIDO.Transaction.CommitRetaining;
      end;
      }
   end;
end;

procedure TfrmSurtimientoListaEmpaque.addPartidasFactura(valor : integer);
var
   i : integer;
begin
   {
   for i := 0 to dgPromocionales.Count - 1 do
   begin
      if dgPromocionales.Items[i].Values[caSEL] = 'Si' then
      begin
         spADD_PARTIDA_FACTURA.ParamByName('P_ID').AsInteger        := valor;
         spADD_PARTIDA_FACTURA.ParamByName('P_DETALLE').AsInteger   := 0;
         spADD_PARTIDA_FACTURA.ParamByName('P_MATERIAL').AsInteger  := StrToInt(dgPromocionales.Items[i].Values[caID]);
         spADD_PARTIDA_FACTURA.ParamByName('P_CANTIDAD').AsInteger  := StrToInt(dgPromocionales.Items[i].Values[caCAN]);
         spADD_PARTIDA_FACTURA.ParamByName('P_PRECIO').AsFloat      := 0.01;
         spADD_PARTIDA_FACTURA.ParamByName('P_UNIDAD').AsInteger    := StrToInt(dgPromocionales.Items[i].Values[caUBA]);
         spADD_PARTIDA_FACTURA.ParamByName('P_MEDIDA').AsInteger    := 0;
         spADD_PARTIDA_FACTURA.ParamByName('P_COLOR').AsInteger     := 0;
         spADD_PARTIDA_FACTURA.ParamByName('P_PORC_DP').AsFloat     := 0.00;
         spADD_PARTIDA_FACTURA.ParamByName('P_COMENTARIO').AsString := '';
         spADD_PARTIDA_FACTURA.ParamByName('P_SERIE').AsString      := '';
         spADD_PARTIDA_FACTURA.ExecProc;
         spADD_PARTIDA_FACTURA.Transaction.CommitRetaining;
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.totalSeleccionados;
var
   i : integer;
begin
   awrSeleccionados := 0;
   {
   for i := 0 to dgPromocionales.Count - 1 do
   begin
      if dgPromocionales.Items[i].Values[caSEL] = 'Si' then
      begin
         awrSeleccionados := awrSeleccionados + (StrToInt(dgPromocionales.Items[i].Values[caCAN]) * StrToFloat(dgPromocionales.Items[i].Values[caPRE]));
      end;
   end;
   }
   formatoSeleccionados;
end;

procedure TfrmSurtimientoListaEmpaque.totalPaqueterias;
var
   i : integer;
begin
   awrPaqueterias := 0;
   {
   for i := 0 to dgPaqueterias.Count - 1 do
   begin
      if dgPaqueterias.Items[i].Values[tiSEL] = 'Si' then
      begin
         awrPaqueterias := awrPaqueterias + (StrToInt(dgPaqueterias.Items[i].Values[tiCAN]) * StrToFloat(dgPaqueterias.Items[i].Values[tiPRE]));
      end;
   end;
   }
   formatoPaqueterias;
end;

procedure TfrmSurtimientoListaEmpaque.limpiarSeleccionados;
var
   i : integer;
begin
   {
   for i := 0 to dgPromocionales.Count - 1 do
   begin
      if dgPromocionales.Items[i].Values[caSEL] = 'Si' then
      begin
         dgPromocionales.Items[i].Values[caCAN] := '1';
         dgPromocionales.Items[i].Values[caSEL] := '';
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.limpiarTiempos;
var
   i : integer;
begin
   awrPaqueterias := 0;

   {
   for i := 0 to dgPaqueterias.Count - 1 do
   begin
      if dgPaqueterias.Items[i].Values[tiSEL] = 'Si' then
      begin
         dgPaqueterias.Items[i].Values[tiSEL] := '';
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.loadPaqueterias;
//var
  // N : TdxTreeListNode;
begin
   {
   if dsTiempos.DataSet.State = dsBrowse then
   begin
      dgPaqueterias.ClearNodes;
      dsTiempos.DataSet.First;
      while not(dsTiempos.DataSet.Eof) do
      begin
         N            := dgPaqueterias.Add;
         N.Values[0]  := dsTiempos.DataSet.FieldByName('R_ID').AsString;
         N.Values[1]  := dsTiempos.DataSet.FieldByName('R_TARIFA').AsString;
         N.Values[2]  := '';
         N.Values[3]  := 0;
         N.Values[5]  := dsTiempos.DataSet.FieldByName('R_DESCRIPCION').AsString;
         N.Values[6]  := FormatFloat('###,###,##0.00',dsTiempos.DataSet.FieldByName('R_TARIFA').AsFloat);
         dsTiempos.DataSet.Next;
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.loadPromocionales;
//var
  // N : TdxTreeListNode;
begin
   {
   if dsPromocionales.DataSet.State = dsBrowse then
   begin
      dgPromocionales.ClearNodes;
      dsPromocionales.DataSet.First;
      while not(dsPromocionales.DataSet.Eof) do
      begin
         N            := dgPromocionales.Add;
         N.Values[0]  := dsPromocionales.DataSet.FieldByName('R_ID').AsString;
         N.Values[1]  := dsPromocionales.DataSet.FieldByName('R_PRECIO').AsString;
         N.Values[2]  := dsPromocionales.DataSet.FieldByName('R_UBASE').AsString;
         N.Values[3]  := '';
         N.Values[4]  := 1;
         N.Values[6]  := dsPromocionales.DataSet.FieldByName('R_CLAVE').AsString;
         N.Values[7]  := dsPromocionales.DataSet.FieldByName('R_DESCRIPCION').AsString;
         N.Values[8]  := FormatFloat('###,###,##0.00',dsPromocionales.DataSet.FieldByName('R_PRECIO').AsFloat);
         dsPromocionales.DataSet.Next;
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.formatoSeleccionados;
begin
   laSeleccionados.Caption := FormatFloat('$ ###,###,##0.00',awrSeleccionados);
end;

procedure TfrmSurtimientoListaEmpaque.formatoPaqueterias;
begin
   laPaqueteria.Caption := FormatFloat('$ ###,###,##0.00',awrPaqueterias);
end;

procedure TfrmSurtimientoListaEmpaque.formatoPromocionales(valor : double);
begin
   awrPromocionales        := valor;
   laPromocionales.Caption := FormatFloat('$ ###,###,##0.00',awrPromocionales);
end;

procedure TfrmSurtimientoListaEmpaque.totalPromocionales;
var
   total : double;
begin
   total   := qyPedido.FieldByName('R_GRANTOTAL').AsFloat * (awrPorcentaje/ 100);
   formatoPromocionales(total);
end;

procedure TfrmSurtimientoListaEmpaque.formatoPorcentaje(valor : double);
begin
   awrPorcentaje        := valor;
   laPorcentaje.Caption := FormatFloat('##0.00 %',awrPorcentaje);
end;

procedure TfrmSurtimientoListaEmpaque.llenarPartidas;
//var
  // N : TdxTreeListNode;
begin
   {
   if dsPartidas.DataSet.State = dsBrowse then
   begin
      dgPartidas.ClearNodes;
      dsPartidas.DataSet.First;
      while not(dsPartidas.DataSet.Eof) do
      begin
         N            := dgPartidas.Add;
         N.Values[0]  := dsPartidas.DataSet.FieldByName('R_ID').AsString;
         N.Values[1]  := dsPartidas.DataSet.FieldByName('R_MATERIAL').AsString;
         N.Values[2]  := dsPartidas.DataSet.FieldByName('R_PRECIO').AsString;
         N.Values[3]  := dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsString;
         N.Values[4]  := dsPartidas.DataSet.FieldByName('R_SURTIENDO').AsString;
         N.Values[5]  := dsPartidas.DataSet.FieldByName('R_ROWS').AsString;
         N.Values[6]  := '';
         N.Values[7]  := FormatFloat('###,###,##0',dsPartidas.DataSet.FieldByName('R_CANTIDAD').AsInteger);
         N.Values[8]  := dsPartidas.DataSet.FieldByName('R_UNIDAD_C').AsString;
         N.Values[9]  := dsPartidas.DataSet.FieldByName('R_CLAVE').AsString;
         N.Values[10]  := dsPartidas.DataSet.FieldByName('R_DESCRIPCION').AsString;
         N.Values[11] := dsPartidas.DataSet.FieldByName('R_SURTIENDO_N').AsString;

         dsPartidas.DataSet.Next;
      end;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSurtimientoListaEmpaque.FormCreate(Sender: TObject);
begin
   reglas.refresh_IBQuery(qyPartidas);
   reglas.refresh_IBQuery(qyPromocionales);
   reglas.refresh_IBQuery(qyTiempos);
   reglas.abrir_IBTabla(dmIBData.TPreferencias);

   //Factor de Porcentaje para Promocionales
   dmIBData.TPreferencias.Filter:= 'ID = 196';
   formatoPorcentaje(dmIBData.TPreferencias.FieldByName('VALOR').AsFloat);

   loadPromocionales;
   loadPaqueterias;

   limpiar;
end;

procedure TfrmSurtimientoListaEmpaque.dsSurtidosDataChange(Sender: TObject;
  Field: TField);
begin
//   llenarPartidas;
end;

procedure TfrmSurtimientoListaEmpaque.buBuscarClick(Sender: TObject);
begin
   qyPedido.Close;
   qyPedido.ParamByName('P_ID').AsInteger   := StrToInt(edFiltro.Text);
   qyPedido.ParamByName('P_CLAVE').AsString := '';
   qyPedido.ParamByName('P_HOY').AsString   := 'No';
   qyPedido.ParamByName('P_AYER').AsString  := 'No';
   qyPedido.ParamByName('P_AMBOS').AsString := 'No';
   qyPedido.Open;

   limpiar;

   if qyPedido.IsEmpty then
   begin
      ShowMessage('No se encontro el pedido.');
   end;
end;

procedure TfrmSurtimientoListaEmpaque.edFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edFiltro.Text <> '') then
   begin
      buBuscar.OnClick(Sender);
   end;
end;

procedure TfrmSurtimientoListaEmpaque.buLEmpaqueClick(Sender: TObject);
begin
   try
      frmPRN_0027 := TfrmPRN_0027.CrearA(Application, dsSurtidos.DataSet.FieldByName('R_ID').AsInteger, true);
      frmPRN_0027.imprimir;
   finally
      frmPRN_0027.Release;
   end;
end;

procedure TfrmSurtimientoListaEmpaque.dgPromocionalesBOTONSButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  {
   if not(qyPedido.IsEmpty) then
   begin
      if dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caSel] = '' then
         dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caSel] := 'Si'
      else
      begin
         dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caSel] := '';
         dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caCAN] := '1';
      end;

      totalSeleccionados;
   end
   else
   begin
      ShowMessage('Falta seleccionar Pedido.');
      edFiltro.SetFocus;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.dgPromocionalesBOTONCButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   cant   : integer;
   precio : double;
   ant    : double;
   nvo    : double;
begin
   {
   if dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caSel] = 'Si' then
   begin
      cant   := StrToInt(dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caCAN]);
      precio := StrToFloat(dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caPRE]);
      ant    := cant * precio;

      case AbsoluteIndex of
         0 : inc(cant);
         1 : if cant > 1 then
             begin
                dec(cant);
             end;
         2 : begin
                idCantidad.Execute;
                if idCantidad.Respuesta and (idCantidad.Entrada <> '') then
                begin
                   cant := StrToInt(idCantidad.Entrada);
                end;
             end;
      end;

      dgPromocionales.Items[dgPromocionales.FocusedNumber].Values[caCAN] := IntToStr(cant);
      awrSeleccionados := awrSeleccionados - ant;
      nvo              := cant * precio;
      awrSeleccionados := awrSeleccionados + nvo;
      formatoSeleccionados;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.dgPartidasCAJASButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   index      : integer;
   indexRec   : integer;
begin
  {
  if not(dsPartidas.DataSet.IsEmpty) then
  begin
     idCajas.Titulo  := dsPartidas.DataSet.FieldByName('R_DESCRIPCION').AsString;
     idCajas.Entrada := FormatFloat('########0',dsPartidas.DataSet.FieldByName('R_CAJAS').AsInteger);
     idCajas.Execute;
     if idCajas.Respuesta and (idCajas.Entrada <> '') then
     begin
        index    := dgPartidas.TopIndex;
        indexRec := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;

        spMODIFICAR_CAJAS_PEDIDO.ParamByName('P_ID').AsInteger := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
        spMODIFICAR_CAJAS_PEDIDO.ParamByName('P_CUANTAS').AsString  := idCajas.Entrada;
        spMODIFICAR_CAJAS_PEDIDO.ExecProc;
        spMODIFICAR_CAJAS_PEDIDO.Transaction.CommitRetaining;

        reglas.refresh_IBQuery(qyPartidas);
        dgPartidas.FullExpand;
        //busqueda del registro modificado
        dgPartidas.GotoFirst;
        while not(dgPartidas.IsEOF) do
        begin
           if indexRec = qyPartidas.FieldByName('R_ID').AsInteger then
           begin
              break;
           end;
           dgPartidas.GotoNext(true);
        end;
        dgPartidas.TopIndex := index;
     end;
     dgPartidas.GotoNext(true);
//     totalPaqueterias;
  end;
  }
end;

procedure TfrmSurtimientoListaEmpaque.dgPartidasSELButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
begin
  {
   if not(qyPedido.IsEmpty) then
   begin
      if dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiSel] = '' then
         dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiSel] := 'Si'
      else
      begin
         dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiSel] := '';
         dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiCAN] := '0';
      end;

      totalPaqueterias;
   end
   else
   begin
      ShowMessage('Falta seleccionar Pedido.');
      edFiltro.SetFocus;
   end;
   }
end;

procedure TfrmSurtimientoListaEmpaque.EncartaButton1Click(Sender: TObject);
begin
   if not(qyPedido.IsEmpty) then
   begin
      if awrPaqueterias <> 0 then
      begin
         if (awrPromocionales < awrSeleccionados) and not(laAutorizarPromocionales.Visible) then
         begin
            ShowMessagE('El monto seleccionado de promocionales es mayor a la promocion.'+#13+' Solucion:'+#13+
            'a) Disminuir seleccionados.'+#13+
            'b) Autorizar seleccionados.'+#13+
            'c) Autorizar un porcentaje mayor de promocion.');
         end
         else
         begin
            if MessageDlg('�Generar Documento ?',  mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
            begin
               spA_DOCUMENTO_SURTIMIENTO.ParamByName('P_ID').AsInteger      := StrToInt(edFiltro.Text);
               spA_DOCUMENTO_SURTIMIENTO.ParamByName('P_PRECIO').AsFloat    := awrPaqueterias;
               spA_DOCUMENTO_SURTIMIENTO.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
               spA_DOCUMENTO_SURTIMIENTO.ExecProc;
               spA_DOCUMENTO_SURTIMIENTO.Transaction.CommitRetaining;

               if spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_TIPO').AsString = 'Pedido' then
               begin
                  addPartidasPedido(spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_ID').AsInteger);
                  ShowMessage('Pedido Generado con exito ('+spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_ID').AsString+')');
               end
               else
               if spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_TIPO').AsString = 'Factura' then
               begin
                  addPartidasFactura(spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_ID').AsInteger);
                  ShowMessage( 'Factura Generado con exito ('+spA_DOCUMENTO_SURTIMIENTO.ParamByName('R_ID').AsString+')');
               end;

               qyPedido.Close;
               qyPedido.ParamByName('P_ID').AsInteger := -1;
               qyPedido.Open;
               limpiar;
               edFiltro.Clear;
               edFiltro.SetFocus;
            end;
         end;
      end
      else
      begin
        ShowMessage('Falta seleccionar Paqueteria.');
      end
   end
   else
   begin
      ShowMessage('Falta seleccionar Pedido');
      edFiltro.SetFocus;
   end;
end;

procedure TfrmSurtimientoListaEmpaque.laPorcentajeClick(Sender: TObject);
var
   rsp : boolean;
//   usr : integer;
//   nom : string;
begin
   frmAcceso := TfrmAcceso.Create(Self);
   try
      frmAcceso.Nivel  := 10;
      frmAcceso.Status := 'Porcentaje';
      frmAcceso.ShowModal;
      rsp := frmAcceso.Rsp;
//      usr := frmAcceso.Usr;
//      nom := frmAcceso.Nom;
   finally
      frmAcceso.Free;
   end;

   if rsp then
   begin
      {
      idPorcentaje.Entrada := FormatFloat('##0.00',awrPorcentaje);
      idPorcentaje.Execute;

      if idPorcentaje.Respuesta and (idPorcentaje.Entrada <> '') then
      begin
         formatoPorcentaje(StrToFloat(idPorcentaje.Entrada));
         totalPromocionales;
         laAutorizarPorcentaje.Visible := true;
      end;
      }
   end;
end;

procedure TfrmSurtimientoListaEmpaque.laSeleccionadosClick(
  Sender: TObject);
var
   rsp : boolean;
//   usr : integer;
//   nom : string;
begin
   frmAcceso := TfrmAcceso.Create(Self);
   try
      frmAcceso.Nivel  := 10;
      frmAcceso.Status := 'Monto';
      frmAcceso.ShowModal;
      rsp := frmAcceso.Rsp;
//      usr := frmAcceso.Usr;
//      nom := frmAcceso.Nom;
   finally
      frmAcceso.Free;
   end;

   if rsp then
   begin
      laAutorizarPromocionales.Visible := true;
   end;
end;

procedure TfrmSurtimientoListaEmpaque.dgTiemposBTNVALORButtonClick(
  Sender: TObject; AbsoluteIndex: Integer);
var
   cant   : integer;
   precio : double;
   ant    : double;
   nvo    : double;
begin
{
   if dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiSel] = 'Si' then
   begin
      cant   := StrToInt(dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiCAN]);
      precio := StrToFloat(dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiPRE]);
      ant    := cant * precio;

      idCajas.Execute;
      if idCajas.Respuesta and (idCajas.Entrada <> '') then
      begin
         cant := StrToInt(idCajas.Entrada);
      end;

      dgPaqueterias.Items[dgPaqueterias.FocusedNumber].Values[tiCAN] := IntToStr(cant);
      awrPaqueterias := awrPaqueterias - ant;
      nvo            := cant * precio;
      awrPaqueterias := awrPaqueterias + nvo;
      formatoPaqueterias;
   end;
   }
end;

end.
