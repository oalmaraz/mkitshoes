unit UfrmAddPartNCredito;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,      ExtCtrls, Db,
  IBX.IBCustomDataSet, IBX.IBQuery, jpeg;

type

  TfrmAddPartNCredito = class(TForm)
    laTitulo: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Label2: TLabel;
    edCantidad: TEdit;
    laPrecio: TLabel;
    edPrecio: TEdit;
    laPNC: TLabel;
    edPNC: TEdit;
    edDiferencia: TEdit;
    laDiferencia: TLabel;
    buCancelar: TButton;
    buAceptar: TButton;
    qyLP_NC: TIBQuery;
    qyLP_NCR_PRECIO_MINIMO: TFloatField;
    qyLP_NCR_PRECIO_MAXIMO: TFloatField;
    fcImager2: TImage;
    fcImager3: TImage;
    fcImager1: TImage;
    fcImager4: TImage;
    procedure FormCreate(Sender: TObject);
    procedure edPNCChange(Sender: TObject);
  private
    { Private declarations }
    awrPNC        : boolean;
    awrPNC_Minimo : double;
    awrPNC_Maximo : double;

  public
    { Public declarations }
    procedure setMaterial(material, cliente, extension : integer);
  end;

var
  frmAddPartNCredito: TfrmAddPartNCredito;

implementation

uses IBData;

{$R *.DFM}

procedure TfrmAddPartNCredito.setMaterial(material, cliente, extension : integer);
begin
   if (material <> 0) and awrPNC then
   begin
      qyLP_NC.Close;
      qyLP_NC.ParamByName('P_MATERIAL').AsInteger  := material;
      qyLP_NC.ParamByName('P_CLIENTE').AsInteger   := cliente;
      qyLP_NC.ParamByName('P_EXTENSION').AsInteger := extension;
      qyLP_NC.Open;

      awrPNC_Minimo := qyLP_NC.FieldByName('R_PRECIO_MINIMO').AsFloat;
      awrPNC_Maximo := qyLP_NC.FieldByName('R_PRECIO_MAXIMO').AsFloat;

      edPNC.Text := FloatToStr(awrPNC_Maximo);
   end;
end;

procedure TfrmAddPartNCredito.FormCreate(Sender: TObject);
var
   pnc : boolean;
begin
   edPrecio.Text  := '0';
   edPNC.Text    := '0';

   //Pedidos, activar PNC (Precio Nota de Credito).
   dmIBData.TPreferencias.Filter := 'ID = 135';
   awrPNC := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
   laPNC.Visible         := awrPNC;
   laDiferencia.Visible  := awrPNC;
   edPNC.Visible         := awrPNC;
   edDiferencia.Visible  := awrPNC;
end;

procedure TfrmAddPartNCredito.edPNCChange(Sender: TObject);
var
  lDiferencia : double;
  lPrecio : double;
  lPNC : double;
begin
   lPrecio := StrToFloat (edPrecio.Text);
   lPNC := StrToFloat (edPNC.Text);
   lDiferencia := lPrecio - lPNC;
   edDiferencia.Text :=  FloatToStr(lDiferencia);
   if lPNC > lPrecio then
      edDiferencia.Text := '0';
end;

end.
