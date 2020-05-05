unit UfrmSKU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,     Buttons, ExtCtrls,
  Db, IBX.IBCustomDataSet, IBX.IBStoredProc,  IBX.IBQuery, DBCtrls;

type
  TfrmSKU = class(TForm)
    paTitulo: TPanel;
    spSKU_CONFIRMACION_COMPLETA: TIBStoredProc;
    paBotones: TPanel;
    buSalir: TBitBtn;
    paMaterial: TPanel;
    Label2: TLabel;
    paCantidad: TPanel;
    Label7: TLabel;
    edSerie: TEdit;
    buGuardar: TBitBtn;
    qySKU: TIBQuery;
    laClave: TDBText;
    qySKUR_ID: TIntegerField;
    qySKUR_MATERIAL: TIntegerField;
    qySKUR_MATERIAL_C: TIBStringField;
    qySKUR_MATERIAL_D: TIBStringField;
    qySKUR_MATERIAL_CB: TIBStringField;
    qySKUR_MEDIDA: TIntegerField;
    qySKUR_COLOR: TIntegerField;
    qySKUR_COLOR_N: TIBStringField;
    qySKUR_CANTIDAD: TFloatField;
    dsSKU: TDataSource;
    Label1: TLabel;
    laDescripcion: TDBText;
    Label3: TLabel;
    laCBarras: TDBText;
    Label4: TLabel;
    laMedida: TDBText;
    Label5: TLabel;
    laColor: TDBText;
    Label6: TLabel;
    laCantidad: TDBText;
    qySKUR_MEDIDA_D: TIBStringField;
    procedure edSerieKeyPress(Sender: TObject; var Key: Char);
    procedure buGuardarClick(Sender: TObject);
  private
    { Private declarations }
    awrMI             : integer;
    awrAlmacen        : integer;
    awrDataSet        : TDataSet;
    awrActivarMedidas : Boolean;
    awrActivarColores : Boolean;

    procedure buscarMaterialVende;
    procedure limpiar;
  public
    { Public declarations }
  published
     property MI      : integer read awrMI write awrMI;
     property ALMACEN : integer read awrAlmacen write awrAlmacen;
     property DataSet : TDataSet read awrDataSet write awrDataSet;
  end;

var
  frmSKU: TfrmSKU;

implementation

uses
  IBModulo, UfrmSeleccionarMaterial, UfrmImagen, IBData;

{$R *.DFM}

procedure TfrmSKU.limpiar;
begin
end;

procedure TfrmSKU.buscarMaterialVende;
begin
end;

procedure TfrmSKU.edSerieKeyPress(Sender: TObject;
  var Key: Char);
var
   medida : integer;
   color  : integer;
begin
   if (Key = #13) and (edSerie.Text <> '') then
   begin
      qySKU.Close;
      qySKU.ParamByName('P_ALMACEN').AsInteger := awrAlmacen;
      qySKU.ParamByName('P_SKU').AsString      := edSerie.Text;
      qySKU.Open;

      if qySKU.FieldByName('R_ID').AsInteger = 0 then
         ShowMessage('No se encontro el registro en este Almacen.')
      else
         buGuardar.SetFocus;
   end;
end;

procedure TfrmSKU.buGuardarClick(Sender: TObject);
begin
   if not(qySKU.IsEmpty) then
   begin
      spSKU_CONFIRMACION_COMPLETA.ParamByName('P_MI').AsInteger       := awrMI;
      spSKU_CONFIRMACION_COMPLETA.ParamByName('P_MATERIAL').AsInteger := dsSKU.DataSet.FieldByName('R_MATERIAL').AsInteger;
      spSKU_CONFIRMACION_COMPLETA.ParamByName('P_MEDIDA').AsInteger   := dsSKU.DataSet.FieldByName('R_MEDIDA').AsInteger;
      spSKU_CONFIRMACION_COMPLETA.ParamByName('P_COLOR').AsInteger    := dsSKU.DataSet.FieldByName('R_COLOR').AsInteger;
      spSKU_CONFIRMACION_COMPLETA.ParamByName('P_SERIE').AsString     := edSerie.Text;
      spSKU_CONFIRMACION_COMPLETA.ExecProc;
      spSKU_CONFIRMACION_COMPLETA.Transaction.CommitRetaining;

      qySKU.Close;
      
      edSerie.Clear;
      edSerie.SetFocus;

      awrDataSet.Close;
      awrDataSet.Open;
   end;
end;

end.
