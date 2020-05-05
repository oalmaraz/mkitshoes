unit UfrmSeleccionMoneda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IBModulo,  jpeg,  StdCtrls,
   Db, IBX.IBCustomDataSet, IBX.IBQuery, Menus, ExtCtrls, Buttons;

type
  TfrmSeleccionMoneda = class(TForm)
    imBack: TImage;
    FlatGroupBox1: TGroupBox;
    rbMoneda1: TRadioButton;
    rbMoneda2: TRadioButton;
    rbMoneda3: TRadioButton;
    rbMoneda4: TRadioButton;
    rbMoneda5: TRadioButton;
    rbMoneda6: TRadioButton;
    rbMoneda7: TRadioButton;
    Label1: TLabel;
    Label2: TLabel;
    edMoneda1: TEdit;
    edMoneda2: TEdit;
    edMoneda3: TEdit;
    edMoneda4: TEdit;
    edMoneda5: TEdit;
    edMoneda6: TEdit;
    edMoneda7: TEdit;
    laIgual1: TLabel;
    laIgual2: TLabel;
    laIgual3: TLabel;
    laIgual4: TLabel;
    laIgual5: TLabel;
    laIgual6: TLabel;
    laIgual7: TLabel;
    buSalir: TBitBtn;
    buF12: TBitBtn;
    qyCXC_Verif_Moneda: TIBQuery;
    dsCXC_Verif_Moneda: TDataSource;
    pmFunciones: TPopupMenu;
    itemF12: TMenuItem;
    procedure buF12Click(Sender: TObject);
    procedure itemF12Click(Sender: TObject);
  private
    { Private declarations }
    awrCliente : integer;
    awrAlmacen : integer;
    awrMoneda  : integer;
    procedure propiedades(comp1 : TRadioButton; comp2 : TEdit; comp3 : TLabel);
  public
    { Public declarations }
    function loadMonedas : boolean;
  published
     property Cliente : integer read awrCliente write awrCliente;
     property Almacen : integer read awrAlmacen write awrAlmacen;
     property Moneda  : integer read awrMoneda write awrMoneda;
  end;

var
  frmSeleccionMoneda: TfrmSeleccionMoneda;

implementation

{$R *.DFM}

procedure TfrmSeleccionMoneda.propiedades(comp1 : TRadioButton; comp2 : TEdit; comp3 : TLabel);
begin
   comp1.Caption := qyCXC_Verif_Moneda.FieldByName('R_MONEDA_DESCRIPCION').AsString;
   comp1.Tag     := qyCXC_Verif_Moneda.FieldByName('R_MONEDA').AsInteger;
   comp1.Visible := true;

   comp2.Text   := qyCXC_Verif_Moneda.FieldByName('R_CONVERSION').AsString;
   comp2.Visible := true;

   comp3.Visible := true;

   if qyCXC_Verif_Moneda.FieldByName('R_BASE').AsString = 'SI' then
   begin
      comp1.Checked           := true;
      //comp1.ColorBorder       := $00D69F30;
      //comp2.Style.BorderColor := $00D69F30;
   end;
end;

function TfrmSeleccionMoneda.loadMonedas : boolean;
var
   abrir : boolean;
   count : integer;
   hay   : boolean;
begin
   qyCXC_Verif_Moneda.Close;
   qyCXC_Verif_Moneda.ParamByName('P_CLIENTE').AsInteger := awrCliente;
   qyCXC_Verif_Moneda.ParamByName('P_ALMACEN').AsInteger := awrAlmacen;
   qyCXC_Verif_Moneda.Open;

   count := 0;
   hay   := false;
   while not(qyCXC_Verif_Moneda.Eof) do
   begin
      if qyCXC_Verif_Moneda.FieldByName('R_BASE').AsString = 'SI' then
      begin
         propiedades(rbMoneda7, edMoneda7, laIgual7);
         hay := true;
      end
      else
      begin
         count := count + 1;
         case count of
           1: propiedades(rbMoneda1, edMoneda1, laIgual1);
           2: propiedades(rbMoneda2, edMoneda2, laIgual2);
           3: propiedades(rbMoneda3, edMoneda3, laIgual3);
           4: propiedades(rbMoneda4, edMoneda4, laIgual4);
           5: propiedades(rbMoneda5, edMoneda5, laIgual5);
           6: propiedades(rbMoneda6, edMoneda6, laIgual6);
         end;
      end;

      qyCXC_Verif_Moneda.Next;
   end;

   if hay then
      count := count + 1;//count nos indica el numero total de monedas que intervienen en el pago

   abrir := false;
   if count > 1 then
      abrir := true
   else
      awrMoneda := qyCXC_Verif_Moneda.FieldByName('R_MONEDA').AsInteger;

   result := abrir;
end;

procedure TfrmSeleccionMoneda.buF12Click(Sender: TObject);
begin
   if rbMoneda1.Checked then
      awrMoneda := rbMoneda1.Tag
   else
   if rbMoneda2.Checked then
      awrMoneda := rbMoneda2.Tag
   else
   if rbMoneda3.Checked then
      awrMoneda := rbMoneda3.Tag
   else
   if rbMoneda4.Checked then
      awrMoneda := rbMoneda4.Tag
   else
   if rbMoneda5.Checked then
      awrMoneda := rbMoneda5.Tag
   else
   if rbMoneda6.Checked then
      awrMoneda := rbMoneda6.Tag
   else
   if rbMoneda7.Checked then
      awrMoneda := rbMoneda7.Tag
end;

procedure TfrmSeleccionMoneda.itemF12Click(Sender: TObject);
begin
   buF12.Click;
end;

end.
