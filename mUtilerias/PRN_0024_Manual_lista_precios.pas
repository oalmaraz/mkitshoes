unit PRN_0024_Manual_lista_precios;

interface
                                        
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  Db, IBX.IBCustomDataSet,
  IBX.IBQuery,    Grids, DBGrids, StdCtrls;

type
  TfrmPRN_0024_Manual_lista_precios = class(TfrmPadre)
    qyManual: TIBQuery;
    qyManualR_FECHA: TDateTimeField;
    qyManualR_CLIENTE: TIntegerField;
    qyManualR_CLIENTE_CLAVE: TIBStringField;
    qyManualR_CLIENTE_NOMBRE: TIBStringField;
    qyManualR_EXTENSION: TIntegerField;
    qyManualR_EXTENSION_CLAVE: TIBStringField;
    qyManualR_EXTENSION_NOMBRE: TIBStringField;
    qyManualR_ULTIMA_COMPRA: TDateTimeField;
    qyManualR_MATERIAL_PRECIO_1: TFloatField;
    qyManualR_MATERIAL_PRECIO_2: TFloatField;
    qyManualR_MATERIAL_PRECIO_3: TFloatField;
    qyManualR_MATERIAL_PRECIO_4: TFloatField;
    qyManualR_MATERIAL_PRECIO_5: TFloatField;
    qyManualR_MATERIAL_PRECIO_6: TFloatField;
    qyManualR_MATERIAL_PRECIO_7: TFloatField;
    qyManualR_MATERIAL_PRECIO_8: TFloatField;
    qyManualR_MATERIAL_PRECIO_9: TFloatField;
    qyManualR_MATERIAL_PRECIO_10: TFloatField;
    qyManualR_MATERIAL_PRECIO_11: TFloatField;
    qyManualR_MATERIAL_PRECIO_12: TFloatField;
    qyManualR_MATERIAL_PRECIO_13: TFloatField;
    qyManualR_MATERIAL_PRECIO_14: TFloatField;
    qyManualR_MATERIAL_PRECIO_15: TFloatField;
    qyManualR_MATERIAL_PRECIO_16: TFloatField;
    qyManualR_MATERIAL_PRECIO_17: TFloatField;
    qyManualR_MATERIAL_PRECIO_18: TFloatField;
    qyManualR_MATERIAL_PRECIO_19: TFloatField;
    qyManualR_MATERIAL_PRECIO_20: TFloatField;
    qyMateriales: TIBQuery;
    qyMaterialesR_MATERIAL: TIntegerField;
    qyMaterialesR_MATERIAL_CLAVE: TIBStringField;
    qyMaterialesR_MATERIAL_DESCRIPCION: TIBStringField;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresausuario: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; pFecha : TDateTime);
  end;

var
  frmPRN_0024_Manual_lista_precios: TfrmPRN_0024_Manual_lista_precios;

implementation

uses IBModulo, reglas_de_negocios;

{$R *.DFM}

constructor TfrmPRN_0024_Manual_lista_precios.Crear(AOwner : TComponent; pFecha : TDateTime);
begin
   Create(AOwner);
   qyManual.Close;
   qyManual.ParamByName('P_FECHA').AsDateTime := pFecha;
   qyManual.Open;
end;

procedure TfrmPRN_0024_Manual_lista_precios.FormCreate(Sender: TObject);
begin
  inherited;
//  cambio := TRUE;
  reglas.refresh_IBQuery(qyEmpresa);
end;

end.
