unit UfrmCambioPrecio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBX.IBStoredProc, Menus, Buttons, Db, IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls, ExtCtrls;

type
  TfrmCambioPrecio = class(TForm)
    qyCalculoImpuestos: TIBQuery;
    Panel3: TPanel;
    paDescuento: TPanel;
    laDescuento: TLabel;
    edDescuento: TEdit;
    paActual: TPanel;
    laPrecioCosto: TLabel;
    laPU: TLabel;
    edPU: TEdit;
    edPrecio: TEdit;
    Bevel1: TBevel;
    paCambio: TPanel;
    Label1: TLabel;
    fcLabel1: TLabel;
    edPUCambio: TEdit;
    edCambio: TEdit;
    buSalir: TBitBtn;
    paBotones: TPanel;
    buF12: TBitBtn;
    Label4: TLabel;
    Label2: TLabel;
    spCALCULA_IMPUESTOS: TIBStoredProc;
    spDESCUENTO: TIBStoredProc;
    spCALCULA_IMPUESTOS_COSTO: TIBStoredProc;
    rbPorcentaje: TRadioButton;
    rbMonto: TRadioButton;
    pmFunciones: TPopupMenu;
    itemF12: TMenuItem;
    paEncabezado: TPanel;
    Bevel2: TBevel;
    procedure FormCreate(Sender: TObject);
    procedure edDescuentoChange(Sender: TObject);
    procedure edPrecioChange(Sender: TObject);
    procedure rbPorcentajeClick(Sender: TObject);
    procedure rbMontoClick(Sender: TObject);
    procedure itemF12Click(Sender: TObject);
  private
    { Private declarations }
    awrPrecioAnt : double;
    awrPrecioNvo : double;
    awrMaterial  : integer;
    procedure setPrecioAnt(valor : double);
    procedure setMaterialD(valor : string);
    function getPrecioNvo : double;
    procedure calcularActual;
    procedure calcularDescuento;
  public
    { Public declarations }
  published
     property MATERIAL   : integer read awrMaterial write awrMaterial;
     property PRECIO     : double read awrPrecioAnt write setPrecioAnt;
     property NUEVO      : double read getPrecioNvo;
     property MATERIAL_D : string write setMaterialD;
  end;

var
  frmCambioPrecio: TfrmCambioPrecio;

implementation

{$R *.DFM}

procedure TfrmCambioPrecio.setMaterialD(valor : string);
begin
   paEncabezado.Caption := valor;
end;

function TfrmCambioPrecio.getPrecioNvo : double;
begin
   Result := StrToFloat(edCambio.Text);
end;

procedure TfrmCambioPrecio.calcularActual;
begin
      spCALCULA_IMPUESTOS.ParamByName('P_MATERIAL').AsInteger   := awrMaterial;
      spCALCULA_IMPUESTOS.ParamByName('P_CANTIDAD').AsFloat     := 1;
      spCALCULA_IMPUESTOS.ParamByName('P_PRECIO_VENTA').AsFloat := StrToFloat(edPrecio.Text);
      spCALCULA_IMPUESTOS.ExecProc;

      edPU.Text        := spCALCULA_IMPUESTOS.ParamByName('R_PRECIO').AsString;

   calcularDescuento;
end;

procedure TfrmCambioPrecio.calcularDescuento;
begin
   if edDescuento.Text <> '0' then
   begin
      if rbPorcentaje.Checked then
      begin
         spDESCUENTO.ParamByName('P_SUBTOTAL').AsFloat   := StrToFloat(edPU.Text);
         spDESCUENTO.ParamByName('P_PORCENTAJE').AsFloat := StrToFloat(edDescuento.Text);
         spDESCUENTO.ExecProc;
         edPUCambio.Text :=  FloatToStr (StrToFloat(edPU.Text) - spDESCUENTO.ParamByName('R_DESCUENTO').AsFloat);
      end
      else
      if rbMonto.Checked then
      begin
         edPUCambio.Text := FloatToStr(  StrToFloat(edPU.Text) - StrToFloat(edDescuento.Text));
      end;

      spCALCULA_IMPUESTOS_COSTO.ParamByName('P_MATERIAL').AsInteger := awrMaterial;
      spCALCULA_IMPUESTOS_COSTO.ParamByName('P_CANTIDAD').AsFloat   := 1;
      spCALCULA_IMPUESTOS_COSTO.ParamByName('P_COSTO').AsFloat      := StrToFloat(edPUCambio.Text);
      spCALCULA_IMPUESTOS_COSTO.ExecProc;

      edCambio.Text := spCALCULA_IMPUESTOS_COSTO.ParamByName('R_COSTO').AsString;
   end
   else
      begin
         edPUCambio.Text := edPU.Text;
         edCambio.Text   := edPrecio.Text;
      end;
end;

procedure TfrmCambioPrecio.setPrecioAnt(valor : double);
begin
   awrPrecioAnt   := valor;
   awrPrecioNvo   := valor;
   edPrecio.Text  := FloatToStr(valor);
   if awrMaterial <> 0 then
      calcularActual;
end;

procedure TfrmCambioPrecio.FormCreate(Sender: TObject);
begin
   awrMaterial := 0;
end;

procedure TfrmCambioPrecio.edDescuentoChange(Sender: TObject);
begin
   calcularDescuento;
end;

procedure TfrmCambioPrecio.edPrecioChange(Sender: TObject);
begin
   calcularActual;
end;

procedure TfrmCambioPrecio.rbPorcentajeClick(Sender: TObject);
begin
   if rbPorcentaje.Checked then
   begin
      calcularDescuento;
      edDescuento.SetFocus;
   end;
end;

procedure TfrmCambioPrecio.rbMontoClick(Sender: TObject);
begin
   if rbMonto.Checked then
   begin
      calcularDescuento;
      edDescuento.SetFocus;
   end;
end;

procedure TfrmCambioPrecio.itemF12Click(Sender: TObject);
begin
   buF12.Click;
end;

end.
