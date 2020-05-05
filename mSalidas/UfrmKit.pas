unit UfrmKit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,  IBX.IBStoredProc, Grids, DBGrids, Buttons, Db, IBX.IBCustomDataSet,
  IBX.IBQuery, ExtCtrls;

type
  TfrmKit = class(TForm)
    paBotones: TPanel;
    buAgregar: TBitBtn;
    buCancelar: TBitBtn;
    laMaterial: TLabel;
    edMaterial: TEdit;
    edDMaterial: TEdit;
    Label10: TLabel;
    dgPartidas: TDBGrid;
    qyBomIng: TIBQuery;
    dsBomIng: TDataSource;
    qyBomIngID: TIntegerField;
    qyBomIngMATERIAL: TIntegerField;
    qyBomIngCOLOR: TIntegerField;
    qyBomIngFECHA_ALTA: TDateTimeField;
    qyBomIngFECHA_ULT_ACT: TDateTimeField;
    qyBomIngOBSERVACIONES: TBlobField;
    qyBomIngESTATUS: TIBStringField;
    qyBomIngR_COLOR_N: TIBStringField;
    Label1: TLabel;
    edCantidad: TEdit;
    Label2: TLabel;
    spA_KIT_PEDIDO: TIBStoredProc;
    procedure edMaterialButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure edMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure buAgregarClick(Sender: TObject);
  private
    { Private declarations }
    awrPedido : integer;
  public
    { Public declarations }
  published
     property PEDIDO : integer read awrPedido write awrPedido;
  end;

var
  frmKit: TfrmKit;

implementation

uses
  UfrmSeleccionarMaterial, IBModulo, IBData, reglas_de_negocios;

{$R *.DFM}

procedure TfrmKit.edMaterialButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
begin
   case AbsoluteIndex of
     0: begin
           frmSeleccionarMaterial             := TfrmSeleccionarMaterial.Create(Application);
           frmSeleccionarMaterial.DATABASE    := dmIBModulo.ibSistema;
           frmSeleccionarMaterial.TRANSACTION := dmIBModulo.ibSistemaTransaccion;
           frmSeleccionarMaterial.CLAVE       := edMaterial.Text;
           if frmSeleccionarMaterial.abrirConsulta then
           begin
              frmSeleccionarMaterial.ShowModal;
              if frmSeleccionarMaterial.ACEPTAR then
              begin
                 edMaterial.Tag   := frmSeleccionarMaterial.ID;
                 edMaterial.Text  := frmSeleccionarMaterial.CLAVE;
                 edDMaterial.Text := frmSeleccionarMaterial.DESCRIPCION;
                 //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
              end;
           end
           else
              if frmSeleccionarMaterial.ID <> 0 then
              begin
                 edMaterial.Tag   := frmSeleccionarMaterial.ID;
                 edMaterial.Text  := frmSeleccionarMaterial.CLAVE;
                 edDMaterial.Text := frmSeleccionarMaterial.DESCRIPCION;
                 //edMaterial.SetSelection(Length(edMaterial.Text),Length(edMaterial.Text),false);
              end;
           frmSeleccionarMaterial.Free;
           frmSeleccionarMaterial := nil;

           if (edMaterial.Tag <> 0) then
           begin
              qyBomIng.Close;
              qyBomIng.ParamByName('P_MATERIAL').AsInteger := edMaterial.Tag;
              qyBomIng.Open;
           end;
        end;
     1: begin
           edMaterial.Clear;
           edDMaterial.Text := '';
           edMaterial.Tag   := 0;
        end;
   end;
end;

procedure TfrmKit.edMaterialKeyPress(Sender: TObject; var Key: Char);
begin
  if (key = #13) then
  begin
     //edMaterial.OnButtonClick(nil, 0);
  end;
end;

procedure TfrmKit.FormCreate(Sender: TObject);
var
   medida : boolean;
   color  : boolean;
begin
   reglas.abrir_IBTabla(dmIBData.TPreferencias);

   //Activar medidas
   dmIBData.TPreferencias.Filter := 'ID = 66';
   medida := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //Activar colores
   dmIBData.TPreferencias.Filter := 'ID = 69';
   color := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';

   //dgPartidasCOLORES.Visible := medida and color;
end;

procedure TfrmKit.buAgregarClick(Sender: TObject);
begin
   spA_KIT_PEDIDO.ParamByName('P_PEDIDO').AsInteger  := awrPedido;
   spA_KIT_PEDIDO.ParamByName('P_BOM_ING').AsInteger := dsBomIng.DataSet.FieldByName('ID').AsInteger;
   spA_KIT_PEDIDO.ParamByName('P_CANTIDAD').AsFloat  := StrToFloat(edCantidad.Text);
   spA_KIT_PEDIDO.ExecProc;
   spA_KIT_PEDIDO.Transaction.CommitRetaining;
end;

end.
