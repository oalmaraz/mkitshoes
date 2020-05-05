unit UfrmSurtimiento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Db, IBX.IBCustomDataSet, IBX.IBQuery,  ExtCtrls,
  Buttons, Grids, DBGrids, IBX.IBStoredProc,  IBX.IBEvents;

type
  TfrmSurtimiento = class(TForm)
    Panel2: TPanel;
    qyPartidas: TIBQuery;
    dsPartidas: TDataSource;
    dgPedidos: TDBGrid;
    qyLiberados: TIBQuery;
    dsLiberados: TDataSource;
    Panel3: TPanel;
    Label2: TLabel;
    LMDDBSimpleLabel1: TLabel;
    Label1: TLabel;
    LMDDBSimpleLabel2: TLabel;
    Label4: TLabel;
    LMDDBSimpleLabel3: TLabel;
    buHoy: TBitBtn;
    buAyer: TBitBtn;
    buAmbos: TBitBtn;
    buTodos: TBitBtn;
    eventsSurtimiento: TIBEvents;
    spA_DESPACHADOR_SURTIMIENTO: TIBStoredProc;
    spA_SURTIMIENTO_MI: TIBStoredProc;
    Splitter1: TSplitter;
    Panel6: TPanel;
    Panel7: TPanel;
    buAvisoSi: TBitBtn;
    buAvisoNo: TBitBtn;
    Panel4: TPanel;
    buSalir: TBitBtn;
    spP_ADD_MI_PEDIDO: TIBStoredProc;
    qyLiberadosR_ROW: TIntegerField;
    qyLiberadosR_ID: TIntegerField;
    qyLiberadosR_PEDIDO: TIntegerField;
    qyLiberadosR_PEDIDO_CLAVE: TIBStringField;
    qyLiberadosR_CLIENTE: TIBStringField;
    qyLiberadosR_CLIENTE_NOMBRE: TIBStringField;
    qyLiberadosR_CLIENTE_RSOCIAL: TIBStringField;
    qyLiberadosR_EXTENSION: TIBStringField;
    qyLiberadosR_EXTENSION_NOMBRE: TIBStringField;
    qyLiberadosR_GRANTOTAL: TFloatField;
    qyLiberadosR_PRIORIDAD: TIBStringField;
    qyLiberadosR_FECHA: TDateTimeField;
    qyLiberadosR_NUM_PART: TIntegerField;
    qyLiberadosR_ESTATUS: TIBStringField;
    qyLiberadosR_VENDEDOR: TIntegerField;
    qyLiberadosR_VENDEDOR_C: TIBStringField;
    qyLiberadosR_VENDEDOR_N: TIBStringField;
    qyLiberadosR_ALMACEN: TIntegerField;
    qyPartidasR_ID: TIntegerField;
    qyPartidasR_PEDIDO: TIntegerField;
    qyPartidasR_MATERIAL: TIntegerField;
    qyPartidasR_CLAVE: TIBStringField;
    qyPartidasR_DESCRIPCION: TIBStringField;
    qyPartidasR_UNIDAD: TIntegerField;
    qyPartidasR_UNIDAD_C: TIBStringField;
    qyPartidasR_DESCRIPCION_UNIDAD: TIBStringField;
    qyPartidasR_CANTIDAD: TFloatField;
    qyPartidasR_CANTIDAD_ENTREGADA: TFloatField;
    qyPartidasR_CANTIDAD_PENDIENTE: TFloatField;
    qyPartidasR_ESTATUS: TIBStringField;
    qyPartidasR_CAJAS: TIntegerField;
    qyPartidasR_ROWS: TIntegerField;
    qyPartidasR_MATERIAL_CBARRAS: TIBStringField;
    qyPartidasR_MATERIAL_OBSERVACIONES: TBlobField;
    qyPartidasR_MATERIAL_FOTO: TBlobField;
    qyPartidasR_PZAS_X_CAJA: TIntegerField;
    qyPartidasR_COMENTARIO: TIBStringField;
    qyPartidasR_MEDIDA: TIntegerField;
    qyPartidasR_MEDIDA_DESCRIPCION: TIBStringField;
    qyPartidasR_COLOR: TIntegerField;
    qyPartidasR_COLOR_NOMBRE: TIBStringField;
    qyPartidasR_F_PROM_ENT: TDateTimeField;
    qyPartidasR_SERIE: TIBStringField;
    qyPartidasR_NUM_SERIE: TIBStringField;
    qyPartidasR_PRECIO: TFloatField;
    Label3: TLabel;
    buBuscar: TBitBtn;
    edFiltro: TEdit;
    buOcultarVer: TBitBtn;
    dgPartidas: TDBGrid;
    qyPartidasR_SEL: TIBStringField;
    qyPartidasR_SURTIDO_POR: TIntegerField;
    qyPartidasR_SURTIDO_POR_C: TIBStringField;
    qyPartidasR_SURTIDO_POR_N: TIBStringField;
    spM_SURTIMIENTO_USR: TIBStoredProc;
    buSelTodos: TBitBtn;
    spM_SURTIMIENTO_USR_TODOS: TIBStoredProc;
    buQuitarTodos: TBitBtn;
    procedure buSalirClick(Sender: TObject);
    procedure buHoyClick(Sender: TObject);
    procedure buAyerClick(Sender: TObject);
    procedure buAmbosClick(Sender: TObject);
    procedure buTodosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure eventsSurtimientoEventAlert(Sender: TObject; EventName: String;
      EventCount: Integer; var CancelAlerts: Boolean);
    procedure buAvisoSiClick(Sender: TObject);
    procedure buAvisoNoClick(Sender: TObject);
    procedure dgPedidosVALEButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure dgPedidosVERButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buBuscarClick(Sender: TObject);
    procedure edFiltroKeyPress(Sender: TObject; var Key: Char);
    procedure buOcultarVerClick(Sender: TObject);
    procedure dgPartidasSELButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure buSelTodosClick(Sender: TObject);
    procedure buQuitarTodosClick(Sender: TObject);
  private
    { Private declarations }
    procedure imprimirVale(p_mi : integer);
    procedure refreshLiberados;
//    function seleccionados : integer;
  public
    { Public declarations }
//    procedure llenarPartidas;
  end;

var
  frmSurtimiento: TfrmSurtimiento;

const
   caSUR = 4;
   caSEL = 2;

implementation

uses
  IBModulo, reglas_de_negocios, PRN_0029_MI,
  PRN_0027, UfrmAcceso, UfrmDespachadorSurtimiento;

{$R *.DFM}

{function TfrmSurtimiento.seleccionados : integer;
var
   i    : integer;
   cont : integer;
begin
   cont := 0;
   for i := 0 to dgPartidas.Count - 1 do
   begin
      if dgPartidas.Items[i].Values[caSel] = 'Si' then
         cont := cont + 1;
   end;

   result := cont;
end;}

procedure TfrmSurtimiento.refreshLiberados;
var
   id : integer;
begin
   id := qyLiberados.FieldByName('R_ID').asInteger;
   qyLiberados.Close;
   qyLiberados.Open;
   qyLiberados.locate('R_ID', id, [loCaseInsensitive]);
end;

procedure TfrmSurtimiento.imprimirVale(p_mi : integer);
begin
   try
      frmPRN_0029           := TfrmPRN_0029.Create(Application);
      frmPRN_0029.ID        := p_mi;
      frmPRN_0029.DameFolio := false;
      if frmPRN_0029.openFormato then
         frmPRN_0029.imprimir;
   finally
      frmPRN_0029.Release;
   end;
end;

{procedure TfrmSurtimiento.llenarPartidas;
var
   N : TdxTreeListNode;
begin
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
end;}

procedure TfrmSurtimiento.buSalirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmSurtimiento.buHoyClick(Sender: TObject);
begin
   qyLiberados.Close;
   qyLiberados.ParamByName('P_ID').AsInteger   := 0;
   qyLiberados.ParamByName('P_CLAVE').AsString := '';
   qyLiberados.ParamByName('P_HOY').AsString   := 'Si';
   qyLiberados.ParamByName('P_AYER').AsString  := 'No';
   qyLiberados.ParamByName('P_AMBOS').AsString := 'No';
   qyLiberados.Open;
end;

procedure TfrmSurtimiento.buAyerClick(Sender: TObject);
begin
   qyLiberados.Close;
   qyLiberados.ParamByName('P_ID').AsInteger   := 0;
   qyLiberados.ParamByName('P_CLAVE').AsString := '';
   qyLiberados.ParamByName('P_HOY').AsString   := 'No';
   qyLiberados.ParamByName('P_AYER').AsString  := 'Si';
   qyLiberados.ParamByName('P_AMBOS').AsString := 'No';
   qyLiberados.Open;
end;

procedure TfrmSurtimiento.buAmbosClick(Sender: TObject);
begin
   qyLiberados.Close;
   qyLiberados.ParamByName('P_ID').AsInteger   := 0;
   qyLiberados.ParamByName('P_CLAVE').AsString := '';
   qyLiberados.ParamByName('P_HOY').AsString   := 'No';
   qyLiberados.ParamByName('P_AYER').AsString  := 'No';
   qyLiberados.ParamByName('P_AMBOS').AsString := 'Si';
   qyLiberados.Open;
end;

procedure TfrmSurtimiento.buTodosClick(Sender: TObject);
begin
   qyLiberados.Close;
   qyLiberados.ParamByName('P_ID').AsInteger   := 0;
   qyLiberados.ParamByName('P_CLAVE').AsString := '';
   qyLiberados.ParamByName('P_HOY').AsString   := 'No';
   qyLiberados.ParamByName('P_AYER').AsString  := 'No';
   qyLiberados.ParamByName('P_AMBOS').AsString := 'No';
   qyLiberados.Open;
end;

procedure TfrmSurtimiento.FormCreate(Sender: TObject);
begin
   qyPartidas.Close;
   qyPartidas.Open;
   buTodosClick(Sender);
   eventsSurtimiento.Events.Add('PEDIDO_LIBERADO');
   eventsSurtimiento.RegisterEvents;
end;

procedure TfrmSurtimiento.eventsSurtimientoEventAlert(Sender: TObject;
  EventName: String; EventCount: Integer; var CancelAlerts: Boolean);
begin
{
   if (EventName = 'PEDIDO_LIBERADO') then
   begin
      if buAvisoSi.Visible then
         waveSonidos.Internals.Items[0].Play;
      refreshLiberados;
   end;
   }
end;

procedure TfrmSurtimiento.buAvisoSiClick(Sender: TObject);
begin
   buAvisoSi.Visible := false;
   buAvisoNo.Visible := true;
end;

procedure TfrmSurtimiento.buAvisoNoClick(Sender: TObject);
begin
   buAvisoSi.Visible := true;
   buAvisoNo.Visible := false;
end;

procedure TfrmSurtimiento.dgPedidosVALEButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   usr    : integer;
   rsp    : boolean;
begin
   frmAcceso := TfrmAcceso.Create(Self);
   try
      frmAcceso.Nivel  := 1;
      frmAcceso.Status := 'Generar Vale';
      frmAcceso.ShowModal;
      rsp := frmAcceso.Rsp;
      usr := frmAcceso.Usr;
   finally
      frmAcceso.Free;
   end;

   if rsp then
   begin
      spA_DESPACHADOR_SURTIMIENTO.ParamByName('P_ORIGEN').AsInteger      := dsLiberados.DataSet.FieldByName('R_ID').AsInteger;
      spA_DESPACHADOR_SURTIMIENTO.ParamByName('P_USUARIO').AsInteger     := usr;
      spA_DESPACHADOR_SURTIMIENTO.ParamByName('P_QUIEN').AsString        := 'P';
      spA_DESPACHADOR_SURTIMIENTO.ExecProc;
      spA_DESPACHADOR_SURTIMIENTO.Transaction.CommitRetaining;

      if spA_DESPACHADOR_SURTIMIENTO.ParamByName('R_PEDIDO').AsInteger <> 0 then
      begin
         spP_ADD_MI_PEDIDO.ParamByName('P_ID').AsInteger := spA_DESPACHADOR_SURTIMIENTO.ParamByName('R_PEDIDO').AsInteger;
         spP_ADD_MI_PEDIDO.ExecProc;
         spP_ADD_MI_PEDIDO.Transaction.CommitRetaining;

         if MessageDlg('�Imprimir Vale?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
         begin
            imprimirVale(spP_ADD_MI_PEDIDO.ParamByName('R_MI').AsInteger);
         end;
         reglas.refresh_IBQuery(qyPartidas);
      end
      else
      if spA_DESPACHADOR_SURTIMIENTO.ParamByName('R_CUANTOS').AsInteger = 0 then
      begin
        ShowMessage('El usuario que se identifico no tiene movimientos para generar Surtimiento.'+#13+
        '1) Revise sus materiales a surtir el nombre del que esta surtiendo, este usuario debe generar el vale.');
      end;
   end
   else
   begin
     ShowMessage('Debe identificarse para realizar este movimiento.');
   end;
end;

procedure TfrmSurtimiento.dgPedidosVERButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   rsp : boolean;
   usr : integer;
   nom : string;
begin
   frmAcceso := TfrmAcceso.Create(Self);
   try
      frmAcceso.Nivel  := 1;
      frmAcceso.Status := 'Ver Vale(s)';
      frmAcceso.ShowModal;
      rsp := frmAcceso.Rsp;
      usr := frmAcceso.Usr;
      nom := frmAcceso.Nom;
   finally
      frmAcceso.Free;
   end;

   if rsp then
   begin
      frmDespachadorSurtimiento := TfrmDespachadorSurtimiento.Create(Self);
      try
         frmDespachadorSurtimiento.ID      := dsLiberados.DataSet.FieldByName('R_ID').AsInteger;
         frmDespachadorSurtimiento.USUARIO := usr;
         frmDespachadorSurtimiento.NOMBRE  := nom;
         frmDespachadorSurtimiento.ShowModal;
      finally
         frmDespachadorSurtimiento.Free;
      end;

      reglas.abrir_IBQuery_seek('R_ID', dsLiberados.DataSet.FieldByName('R_ID').AsInteger, qyLiberados);
   end
   else
   begin
     ShowMessage('Debe identificarse para realizar este movimiento.');
   end;
end;

procedure TfrmSurtimiento.buBuscarClick(Sender: TObject);
begin
   qyLiberados.Close;
   qyLiberados.ParamByName('P_ID').AsInteger   := StrToInt(edFiltro.Text);
   qyLiberados.ParamByName('P_CLAVE').AsString := '';
   qyLiberados.ParamByName('P_HOY').AsString   := 'No';
   qyLiberados.ParamByName('P_AYER').AsString  := 'No';
   qyLiberados.ParamByName('P_AMBOS').AsString := 'No';
   qyLiberados.Open;
end;

procedure TfrmSurtimiento.edFiltroKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (edFiltro.Text <> '') then
   begin
      buBuscar.OnClick(Sender);
   end;
end;

procedure TfrmSurtimiento.buOcultarVerClick(Sender: TObject);
begin
   if dgPedidos.Visible then
   begin
      dgPedidos.Visible    := false;
      buOcultarVer.Caption := 'Mostrar Pedidos';
   end
   else
   begin
      dgPedidos.Visible    := true;
      buOcultarVer.Caption := 'Ocultar Pedidos';
   end
end;

procedure TfrmSurtimiento.dgPartidasSELButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   actual : integer;
begin
   //asignamos el usuario
   if (dsPartidas.DataSet.FieldByName('R_SURTIDO_POR').AsInteger = 0) then
   begin
      actual                                                 := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      spM_SURTIMIENTO_USR.ParamByName('P_ID').AsInteger      := actual;
      spM_SURTIMIENTO_USR.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
      spM_SURTIMIENTO_USR.ExecProc;
      spM_SURTIMIENTO_USR.Transaction.CommitRetaining;
      reglas.abrir_IBQuery_seek('R_ID', actual, qyPartidas);
   end
   else
   //se quita el usuario si es el que esta manejando su partida
   if (dsPartidas.DataSet.FieldByName('R_SURTIDO_POR').AsInteger <> 0) and
      (dsPartidas.DataSet.FieldByName('R_SURTIDO_POR').AsInteger = reglas.dame_usuario) then
   begin
      actual                                                 := dsPartidas.DataSet.FieldByName('R_ID').AsInteger;
      spM_SURTIMIENTO_USR.ParamByName('P_ID').AsInteger      := actual;
      spM_SURTIMIENTO_USR.ParamByName('P_USUARIO').AsInteger := 0;
      spM_SURTIMIENTO_USR.ExecProc;
      spM_SURTIMIENTO_USR.Transaction.CommitRetaining;
      reglas.abrir_IBQuery_seek('R_ID', actual, qyPartidas);
   end
   else
   begin
     //manda mensaje que no es posible modificar el usuario por que la partida la tiene otro usuario
     ShowMessage('En este momento esta surtiendo esta partida del pedido.'+#13+'Seleccione otra partida.');
   end;
end;

procedure TfrmSurtimiento.buSelTodosClick(Sender: TObject);
begin
   if not(dsPartidas.DataSet.IsEmpty) then
   begin
      if MessageDlg('�Seleccionar todos los registros?'+#13+
          'Nota: Si hay algun otro usuario que tenga registros asignados, se cambiaran.', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
         spM_SURTIMIENTO_USR_TODOS.ParamByName('P_ID').AsInteger      := dsLiberados.DataSet.FieldByName('R_ID').AsInteger;
         spM_SURTIMIENTO_USR_TODOS.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
         spM_SURTIMIENTO_USR_TODOS.ExecProc;

         reglas.refresh_IBQuery(qyPartidas);
      end;
   end
   else
   begin
     ShowMessage('meSinPartidas');
   end;
end;

procedure TfrmSurtimiento.buQuitarTodosClick(Sender: TObject);
begin
   if not(dsPartidas.DataSet.IsEmpty) then
   begin
      if MessageDlg('�Quitar seleccion de todos los registros?', mtConfirmation, [mbYes, mbNo], 0) = mrYes  then
      begin
         spM_SURTIMIENTO_USR_TODOS.ParamByName('P_ID').AsInteger      := dsLiberados.DataSet.FieldByName('R_ID').AsInteger;
         spM_SURTIMIENTO_USR_TODOS.ParamByName('P_USUARIO').AsInteger := 0;
         spM_SURTIMIENTO_USR_TODOS.ExecProc;

         reglas.refresh_IBQuery(qyPartidas);
      end;
   end
   else
   begin
     ShowMessage('No hay registro en partidas.');
   end;
end;

end.
