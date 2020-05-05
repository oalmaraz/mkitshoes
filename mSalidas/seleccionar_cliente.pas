unit seleccionar_cliente;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,  Grids, DBGrids, Buttons, IBX.IBStoredProc, Menus, Db,
  IBX.IBCustomDataSet, IBX.IBQuery, Mask, DBCtrls, StdCtrls, ExtCtrls;

type
  TfrmSeleccionar_cliente = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_NOMBRE: TIBStringField;
    qySeleccionarR_RAZON_SOCIAL: TIBStringField;
    qySeleccionarR_CLASIFICACION: TIBStringField;
    qySeleccionarR_TELEFONO: TIBStringField;
    ibAceptar: TBitBtn;
    ibTeclado: TBitBtn;
    ibCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure ibTecladoClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    proceso     : integer;
    touchScreen : boolean;
    nombre      : string;
  protected
    procedure agregar; override;
    procedure buscar; override;
  public
    { Public declarations }
    constructor crear(AOwner : TComponent; pntX, pntY : TPoint;  p_proceso : integer);
    constructor crearTouchScreen(AOwner : TComponent; x1, y1, x2, y2 : integer);
    function dameNombre : string;
  end;

var
  frmSeleccionar_cliente: TfrmSeleccionar_cliente;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios, IBData, teclado;

{$R *.DFM}

constructor TfrmSeleccionar_cliente.crear(AOwner : TComponent; pntX, pntY : TPoint;  p_proceso : integer);
begin
   CrearObj(AOwner, pntX.x, pntX.y, pntY.x, pntY.y);
   proceso := p_proceso;
end;

function TfrmSeleccionar_cliente.dameNombre : string;
begin
   Result := nombre;
end;

procedure TfrmSeleccionar_cliente.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

procedure TfrmSeleccionar_cliente.agregar;
begin
   case proceso of
     1 : begin
            TIBTable(dsDestino.DataSet).FieldByName('CLIENTE').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
         end;
     2 : begin
            valor  := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
            nombre := dsFuente.DataSet.FieldByName('R_NOMBRE').AsString;
         end
   else
      begin
         if dsDestino.DataSet <> nil then
         begin
            TIBQuery(dsDestino.DataSet).Close;
            TIBQuery(dsDestino.DataSet).ParamByName('P_CLIENTE').AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
            TIBQuery(dsDestino.DataSet).Open;
         end;
      end;
   end;
   Close;
end;

constructor TfrmSeleccionar_cliente.crearTouchScreen(AOwner : TComponent; x1, y1, x2, y2 : integer);
begin
   proceso := 2;
   CrearObj(AOwner, x1, y1, x2, y2);
   touchScreen        := true;
   ibAceptar.Visible  := true;
   ibTeclado.Visible  := true;
   ibCancelar.Visible := true;
   //Tama�o de letra en pantallas TouchScreen
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   dmIBData.TPreferencias.Filter := 'ID = 17';
   dgExplorar.Font.Size          := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

procedure TfrmSeleccionar_cliente.FormCreate(Sender: TObject);
begin
  touchScreen        := false;
  ibAceptar.Visible  := false;
  ibTeclado.Visible  := false;
  ibCancelar.Visible := false;
  nombre  := '';

  todos := '';
  tabla := 'VER_CLIENTE_S(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  laCampo.Caption := 'R_NOMBRE';
end;

procedure TfrmSeleccionar_cliente.ibTecladoClick(Sender: TObject);
var
   resultado : TModalResult;
   dato      : string;
begin
  inherited;
  frmTeclado := TfrmTeclado.Create(Application);
  resultado  := frmTeclado.ShowModal;
  dato       := frmTeclado.edCaptura.Text;
  frmTeclado.Free;

  if resultado = mrOk then
  begin
     meValor.Text     := dato;
     meValor.SelStart := length(dato);
     ibBuscar.Click;
  end;
end;

procedure TfrmSeleccionar_cliente.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
     ibAceptar.Enabled := not(dsFuente.DataSet.IsEmpty);
end;

procedure TfrmSeleccionar_cliente.FormShow(Sender: TObject);
begin
  inherited;
  if touchScreen then
  begin
     ibTeclado.Click;
     ibBuscar.Click;
  end;
end;

end.
