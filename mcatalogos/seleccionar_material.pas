unit seleccionar_material;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  seleccionar,     IBX.IBStoredProc, Menus, Db,
  IBX.IBCustomDataSet, IBX.IBQuery,   DBCtrls, StdCtrls, Mask,
       jpeg,
  ExtCtrls,  Grids, DBGrids, Buttons;

type
  TfrmSeleccionar_material = class(TfrmSeleccionar)
    qySeleccionarR_ID: TIntegerField;
    qySeleccionarR_CLAVE: TIBStringField;
    qySeleccionarR_DESCRIPCION: TIBStringField;
    qySeleccionarR_UNIDAD_BASE: TIntegerField;
    qySeleccionarR_DESCRIPCION_UNIDAD: TIBStringField;
    qySeleccionarR_CODIGO_BARRAS: TIBStringField;
    ibAceptar: TBitBtn;
    ibTeclado: TBitBtn;
    ibCancelar: TBitBtn;
    qySeleccionarR_IVA_PORC: TFloatField;
    qySeleccionarR_IEPS_PORC: TFloatField;
    qySeleccionarR_IMPUESTO1_PORC: TFloatField;
    qySeleccionarR_IMPUESTO2_PORC: TFloatField;
    qySeleccionarR_COSTO_ULT_COMPRA: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure ibTecladoClick(Sender: TObject);
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    touchScreen : boolean;
    material    : integer;
    clave       : string;
    codigo      : string;
    descripcion : string;
    unidadBase  : integer;
    iva : double;
    ieps : double;
    impuesto1 : double;
    impuesto2 : double;
    costo_ult_compra : double;
    proceso   : integer;
  protected
    procedure agregar; override;
    procedure buscar; override;
  public
    { Public declarations }
    constructor CrearTouchScreen(AOwner : TComponent; x1, y1 , x2, y2 : integer);
    constructor Crear(AOwner : TComponent; x1, y1 , x2, y2 : integer; p_campo : string);
    constructor CrearA(AOwner : TComponent; p_proceso : integer);
    function dameMaterial : integer;
    function dameClave  : string;
    function dameCodigo : string;
    function dameDescripcion : string;
    function dameUnidadBase : integer;
    function dameIVA_PORC : double;
    function dameIEPS_PORC : double;
    function dameIMPUESTO1_PORC : double;
    function dameIMPUESTO2_PORC : double;
    function dameCOSTO : double;
  end;

var
  frmSeleccionar_material: TfrmSeleccionar_material;

implementation

uses IBModulo, IBX.IBTable, reglas_de_negocios, IBData, teclado;

{$R *.DFM}

constructor TfrmSeleccionar_material.CrearA(AOwner : TComponent; p_proceso : integer);
begin
   Create(AOwner);
   Self.WindowState  := wsMaximized;
   ibAceptar.Visible := true;
   proceso           := p_proceso;
end;

constructor TfrmSeleccionar_material.Crear(AOwner : TComponent; x1, y1 , x2, y2 : integer; p_campo : string);
begin
   CrearObj(AOwner, x1, y1, x2, y2);
   ibAceptar.Visible  := true;
   ibCancelar.Visible := true;
   campo              := p_campo;
end;

constructor TfrmSeleccionar_material.CrearTouchScreen(AOwner : TComponent; x1, y1 , x2, y2 : integer);
begin
   CrearObj(AOwner, x1, y1, x2, y2);
   touchScreen       := true;

  ibAceptar.Visible  := true;
  ibTeclado.Visible  := true;
  ibCancelar.Visible := true;

   //Tama�o de letra en pantallas TouchScreen
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   dmIBData.TPreferencias.Filter := 'ID = 17';
   dgExplorar.Font.Size          := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

function TfrmSeleccionar_material.dameCOSTO : double;
begin
   Result := costo_ult_compra;
end;

function TfrmSeleccionar_material.dameMaterial : integer;
begin
   Result := material;
end;

function TfrmSeleccionar_material.dameIVA_PORC : double;
begin
   Result := iva;
end;

function TfrmSeleccionar_material.dameIEPS_PORC : double;
begin
   Result := ieps;
end;

function TfrmSeleccionar_material.dameIMPUESTO1_PORC : double;
begin
   Result := impuesto1;
end;

function TfrmSeleccionar_material.dameIMPUESTO2_PORC : double;
begin
   Result := impuesto2;
end;

function TfrmSeleccionar_material.dameCodigo : string;
begin
   Result := codigo;
end;

procedure TfrmSeleccionar_material.buscar;
begin
   qySeleccionar.Close;
   qySeleccionar.ParamByName('P_CAMPO').AsString := reglas.solo_alfabeto(laCampo.Caption);
   qySeleccionar.ParamByName('P_VALOR').AsString := meValor.Text;
   qySeleccionar.Open;
end;

function TfrmSeleccionar_material.dameClave :string;
begin
   Result := clave;
end;

function TfrmSeleccionar_material.dameDescripcion : string;
begin
   Result := descripcion;
end;

function TfrmSeleccionar_material.dameUnidadBase : integer;
begin
   Result := unidadBase;
end;

procedure TfrmSeleccionar_material.agregar;
begin
   case proceso of
     1: begin
           TIBTable(dsDestino.DataSet).FieldByName(campo).AsInteger := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
        end;
   end;
   material    := dsFuente.DataSet.FieldByName('R_ID').AsInteger;
   clave       := dsFuente.DataSet.FieldByName('R_CLAVE').AsString;
   codigo      := dsFuente.DataSet.FieldByName('R_CODIGO_BARRAS').AsString;
   descripcion := dsFuente.DataSet.FieldByName('R_DESCRIPCION').AsString;
   unidadBase  := dsFuente.DataSet.FieldByName('R_UNIDAD_BASE').AsInteger;
   iva         := dsFuente.DataSet.FieldByName('R_IVA_PORC').AsInteger;
   ieps        := dsFuente.DataSet.FieldByName('R_IEPS_PORC').AsInteger;
   impuesto1   := dsFuente.DataSet.FieldByName('R_IMPUESTO1_PORC').AsInteger;
   impuesto2   := dsFuente.DataSet.FieldByName('R_IMPUESTO2_PORC').AsInteger;
   costo_ult_compra := dsFuente.DataSet.FieldByName('R_COSTO_ULT_COMPRA').AsFloat;
   Close;
end;

procedure TfrmSeleccionar_material.FormCreate(Sender: TObject);
begin
  material := 0;
  proceso  := 1;
  touchScreen       := false;
  campo := 'material';
  ibAceptar.Visible  := false;
  ibTeclado.Visible  := false;
  ibCancelar.Visible := false;
  todos := '';
  tabla := 'VER_MATERIAL_ES(:P_CAMPO, :P_VALOR)';
  qySeleccionar.ParamByName('P_CAMPO').AsString := '';
  qySeleccionar.ParamByName('P_VALOR').AsString := '';
  inherited;
  //Campo busqueda
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  dmIBData.TPreferencias.Filter := 'ID = 62';
  laCampo.Caption := dmIBData.TPreferencias.FieldByName('VALOR').AsString;
end;

procedure TfrmSeleccionar_material.ibTecladoClick(Sender: TObject);
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

procedure TfrmSeleccionar_material.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  if dsFuente.DataSet <> nil then
     ibAceptar.Enabled := not(dsFuente.DataSet.IsEmpty);
end;

procedure TfrmSeleccionar_material.FormShow(Sender: TObject);
begin
  inherited;
  if touchScreen then
     ibTeclado.Click
  else
     if meValor.Text <> '' then
     begin
        ibBuscar.Click;
     end;
end;

procedure TfrmSeleccionar_material.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsDestino.DataSet := nil;
  inherited;
end;

end.
