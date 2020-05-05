unit capturar_chequeras;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, IBX.IBTable,  Db, IBX.IBCustomDataSet,
  StdCtrls, DBCtrls, IBX.IBQuery, Mask, Buttons, ExtCtrls, System.Variants;

type
  TfrmCapturar_chequeras = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarBANCO: TIntegerField;
    TCapturarFECHA_ULT_CHEQUE_IMP: TDateTimeField;
    TCapturarSALDO: TFloatField;
    TCapturarFOLIO_CHEQUE_INICIAL: TIBStringField;
    TCapturarREPORTE_CHEQUES: TIBStringField;
    TCapturarREPORTE_DEPOSITOS: TIBStringField;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    deFolio: TDBEdit;
    Label7: TLabel;
    deCheques: TDBEdit;
    dePoliza: TDBEdit;
    Label8: TLabel;
    beBanco: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    cbImpresoras: TDBComboBox;
    cbCaracteres: TDBComboBox;
    TCapturarIMPRESORANOM: TIBStringField;
    TCapturarIMPRESORAVAL: TIBStringField;
    TCapturarESCMODEL: TIBStringField;
    deFecha: TDBEdit;
    deSaldo: TDBEdit;
    deCuenta: TDBEdit;
    Label1: TLabel;
    deSucursal: TDBEdit;
    Label11: TLabel;
    deMoneda: TDBEdit;
    Label12: TLabel;
    TCapturarsucursal: TStringField;
    TCapturarcuenta: TStringField;
    TCapturarmDescripcion: TStringField;
    TCapturarbNombre: TStringField;
    Label2: TLabel;
    deDepositos: TDBEdit;
    TCapturarREPORTE_POLIZA: TIBStringField;
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure beBancoButtonClick(Sender: TObject; AbsoluteIndex: Integer);
    procedure FormCreate(Sender: TObject);
    procedure TCapturarCalcFields(DataSet: TDataSet);
    procedure cbImpresorasChange(Sender: TObject);
    procedure beBancoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_chequeras: TfrmCapturar_chequeras;

implementation

uses Printers, explorar_chequeras, IBModulo, seleccionar_banco_gral,
  reglas_de_negocios, IBData;

{$R *.DFM}

procedure TfrmCapturar_chequeras.ibNuevoClick(Sender: TObject);
begin
  inherited;
  dsFuente.DataSet.FieldByName('SALDO').AsFloat := 0;
  deCuenta.SetFocus;
end;

procedure TfrmCapturar_chequeras.ibModificarClick(Sender: TObject);
begin
  inherited;
  deCuenta.SetFocus;
end;

procedure TfrmCapturar_chequeras.beBancoButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var
   pUno : TPoint;
   pDos : TPoint;
   y2   : integer;
begin
  inherited;
  case AbsoluteIndex of
    0: begin
          pUno   := paLienzo.ClientToScreen(Point(0,0));
          //pDos   := sbHijo.ClientToScreen(Point(0,0));
          y2     := pDos.y - pUno.y;
          pDos.x := paLienzo.Width;
          pDos.y := y2;
          frmSeleccionar_bancos_gral := TfrmSeleccionar_bancos_gral.Crear(Application, pUno, pDos,1);
          frmSeleccionar_bancos_gral.dsDestino.DataSet := TCapturar;
          frmSeleccionar_bancos_gral.ShowModal;
          frmSeleccionar_bancos_gral.Free;
       end;
    1: dsFuente.DataSet.FieldByName('BANCO').AsVariant := null;
  end;
end;

procedure TfrmCapturar_chequeras.FormCreate(Sender: TObject);
begin
  cbImpresoras.Items.assign(Printer.Printers);
  reglas.abrir_IBTabla(dmIBData.TFiltroBancos);
  reglas.abrir_IBTabla(dmIBData.TFiltroMonedas);
  inherited;
end;

procedure TfrmCapturar_chequeras.TCapturarCalcFields(DataSet: TDataSet);
begin
  inherited;
  if DataSet.FieldByName('BANCO').AsString <> '' then
  begin
     dmIBData.TFiltroBancos.Filter                := 'ID = '+DataSet.FieldByName('BANCO').AsString;

     DataSet.FieldByName('bNombre').AsString  := dmIBData.TSujetosBanco.FieldByName('NOMBRE').AsString;
     DataSet.FieldByName('cuenta').AsString   := dmIBData.TFiltroBancos.FieldByName('CUENTA').AsString;
     DataSet.FieldByName('sucursal').AsString := dmIBData.TFiltroBancos.FieldByName('SUCURSAL').AsString;

     if dmIBData.TFiltroBancos.FieldByName('MONEDA').AsString <> '' then
     begin
        dmIBData.TFiltroMonedas.Filter               := 'ID = '+dmIBData.TFiltroBancos.FieldByName('MONEDA').AsString;
        DataSet.FieldByName('mDescripcion').AsString := dmIBData.TFiltroMonedas.FieldByName('DESCRIPCION').AsString;
     end
     else
        DataSet.FieldByName('mDescripcion').AsString := '';
  end
  else
     begin
        DataSet.FieldByName('bNombre').AsString      := '';
        DataSet.FieldByName('cuenta').AsString       := '';
        DataSet.FieldByName('sucursal').AsString     := '';
        DataSet.FieldByName('mDescripcion').AsString := '';
     end;
end;

procedure TfrmCapturar_chequeras.cbImpresorasChange(Sender: TObject);
begin
  inherited;
  if cbImpresoras.Text <> '' then
     dsFuente.DataSet.FieldByName('IMPRESORAVAL').AsString := IntToStr(cbImpresoras.ItemIndex);
end;

procedure TfrmCapturar_chequeras.beBancoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
     beBancoButtonClick(Sender, 0);
end;

end.
