unit explorar_cotizaciones_estatus;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db, Menus, IBX.IBCustomDataSet,
  IBX.IBQuery, ComCtrls, StdCtrls, Grids, DBGrids, Mask, DBCtrls, Buttons,
  ExtCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmExplorar_cotizaciones_estatus = class(TfrmExplorarMDI)
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_CLAVE: TIBStringField;
    qyExplorarR_FECHA_ALTA: TDateTimeField;
    qyExplorarR_NOMBRE: TIBStringField;
    qyExplorarR_RAZON_SOCIAL: TIBStringField;
    qyExplorarR_FECHA_VALIDEZ: TDateTimeField;
    qyExplorarR_GRANTOTAL: TFloatField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_SEGURO_SUBTOTAL: TFloatField;
    qyExplorarR_SEGURO_IVA: TFloatField;
    qyExplorarseguro: TFloatField;
    qyExplorarsupertotal: TFloatField;
    qyEsVendedor: TIBQuery;
    qyExplorarR_PROYECTO: TIBStringField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_CLAVE: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_ALTA: TcxGridDBColumn;
    dgExplorarDBTableView1R_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA_VALIDEZ: TcxGridDBColumn;
    dgExplorarDBTableView1R_GRANTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_SUBTOTAL: TcxGridDBColumn;
    dgExplorarDBTableView1R_SEGURO_IVA: TcxGridDBColumn;
    dgExplorarDBTableView1R_PROYECTO: TcxGridDBColumn;
    dgExplorarDBTableView1seguro: TcxGridDBColumn;
    dgExplorarDBTableView1supertotal: TcxGridDBColumn;
    qyExplorarR_CONSECUTIVO: TIntegerField;
    dgExplorarDBTableView1R_CONSECUTIVO: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure qyExplorarCalcFields(DataSet: TDataSet);
    procedure ibPantallaClick(Sender: TObject);
  private
    { Private declarations }
    awrEstatus : String;

    procedure leerConfiguracion;
    procedure guardarConfiguracion;
  protected
    procedure Parametros; override;
  public
    { Public declarations }
  end;

var
  frmExplorar_cotizaciones_estatus: TfrmExplorar_cotizaciones_estatus;

implementation

uses IniFiles, USQLAnaliza, IBData, IBModulo, reglas_de_negocios, UfrmTLEstatus,
  capturar_cotizaciones;

{$R *.DFM}

procedure TfrmExplorar_cotizaciones_estatus.leerConfiguracion;
var
   iniFile : TIniFile;
   ruta    : String;
begin
   ruta := ExtractFilePath(ParamStr(0));
   iniFile    := TIniFile.Create(ruta + 'ESTATUS.INI');
   awrEstatus := iniFile.ReadString('COTIZACIONES','Estatus','');
   iniFile.Free;
end;

procedure TfrmExplorar_cotizaciones_estatus.guardarConfiguracion;
var
   iniFile : TIniFile;
   ruta    : String;
begin
   ruta := ExtractFilePath(ParamStr(0));
   iniFile := TIniFile.Create(ruta + 'ESTATUS.INI');
   iniFile.WriteString('COTIZACIONES','Estatus',awrEstatus);
   iniFile.Free;
end;

procedure TfrmExplorar_cotizaciones_estatus.Parametros;
var
   v_opc : integer;
begin
   v_opc := 0;
   if awrEstatus = 'Todos' then
      v_opc := 1;

   sqlExp.setParam(sqlExp.dameParam('P_ESTATUS1'), awrEstatus, psCadena);
   sqlExp.setParam(sqlExp.dameParam('P_OPCION1'), v_opc, psCadena);
   sqlExp.setParam(sqlExp.dameParam('P_OPCION2'), v_opc, psCadena);
end;

procedure TfrmExplorar_cotizaciones_estatus.FormCreate(Sender: TObject);
var
   awrSeguro : Boolean;
begin
  inherited;

  leerConfiguracion;
  if awrEstatus = '' then
  begin
     frmTLEstatus := TfrmTLEstatus.Create(Application);
     try
        frmTLEstatus.FORMA := 10;
        if frmTLEstatus.ShowModal = mrOk then
        begin
           awrEstatus := frmTLEstatus.ESTATUS;
           if awrEstatus = '' then
             self.Close
           else
              guardarConfiguracion
        end;
     finally
        frmTLEstatus.Free;
     end;
  end;

  self.Caption := 'Explorar Cotizaciones ('+awrEstatus+')';;

  EXP_NVO     := true;
  CAMPO_FECHA := 'R_FECHA_ALTA';
  FForma      := 'frmCapturar_cotizaciones';

  reglas.abrir_IBTabla(dmIBData.TPreferencias);

  //Activar Seguro
  dmIBData.TPreferencias.Filter := 'ID = 157';
  awrSeguro := UpperCase(dmIBData.TPreferencias.FieldByName('VALOR').AsString) = 'SI';
//  dgExplorarGRANTOTAL.Visible := awrSeguro;
  //dgExplorarSEGURO.Visible    := awrSeguro;

  Parametros;
end;

procedure TfrmExplorar_cotizaciones_estatus.qyExplorarCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('seguro').AsFloat     := DataSet.FieldByName('R_SEGURO_SUBTOTAL').AsFloat + DataSet.FieldByName('R_SEGURO_IVA').AsFloat;
  DataSet.FieldByName('supertotal').AsFloat := DataSet.FieldByName('R_GRANTOTAL').AsFloat + DataSet.FieldByName('seguro').AsFloat;
end;

procedure TfrmExplorar_cotizaciones_estatus.ibPantallaClick(
  Sender: TObject);
begin
  inherited;
  frmCapturar_cotizaciones.TCapturar.MasterSource := frmExplorar_cotizaciones_estatus.dsFuente;
  frmCapturar_cotizaciones.deID.DataSource        := frmExplorar_cotizaciones_estatus.dsFuente;
  frmCapturar_cotizaciones.TCapturar.Close;
  frmCapturar_cotizaciones.TCapturar.Open;
end;

end.
