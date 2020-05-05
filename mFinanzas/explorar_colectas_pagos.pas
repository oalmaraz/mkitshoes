unit explorar_colectas_pagos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorarMDI, Db,    DBCtrls,
   Menus,   IBX.IBCustomDataSet, IBX.IBQuery,
  StdCtrls,    Mask,
     jpeg,  ExtCtrls,
   ComCtrls, Grids, DBGrids, Buttons, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmExplorar_colectas_pagos = class(TfrmExplorarMDI)
    qyAlmacenes: TIBQuery;
    qyAlmacenesID: TIntegerField;
    qyAlmacenesCLAVE: TIBStringField;
    qyAlmacenesNOMBRE: TIBStringField;
    qyAlmacenesCOMPRA: TIBStringField;
    qyAlmacenesVENDE: TIBStringField;
    qyAlmacenesTRANSFORMA: TIBStringField;
    qyAlmacenesFECHA_ALTA: TDateTimeField;
    qyAlmacenesRESPONSABLE: TIntegerField;
    qyAlmacenesOBSERVACIONES: TBlobField;
    qyAlmacenesSERIE_FACTURA: TIBStringField;
    qyAlmacenesCONSECUTIVO: TIntegerField;
    qyAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyAlmacenesESTATUS: TIBStringField;
    dsAlmacenes: TDataSource;
    laAlmacen: TLabel;
    cbAlmacenes: TDBLookupComboBox;
    deFecha: TDateTimePicker;
    Label1: TLabel;
    dsVer_Datos_Cajero: TDataSource;
    qyVer_Datos_Cajero: TIBQuery;
    qyVer_Datos_CajeroR_ID: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN: TIntegerField;
    qyVer_Datos_CajeroR_ALMACEN_CLAVE: TIBStringField;
    qyVer_Datos_CajeroR_ALMACEN_OBSERVACIONES: TBlobField;
    qyVer_Datos_CajeroR_USUARIO: TIntegerField;
    qyVer_Datos_CajeroR_NOMBRE_USUARIO: TIBStringField;
    qyVer_Datos_CajeroR_BAJA: TIBStringField;
    qyVer_Datos_CajeroR_ESTATUS: TIBStringField;
    qyVer_Datos_CajeroR_REGISTROS: TIntegerField;
    qyVer_Datos_CajeroR_MODULO_FUNCION: TIntegerField;
    qyExplorarR_ID: TIntegerField;
    qyExplorarR_FECHA: TDateTimeField;
    qyExplorarR_CAJA: TIntegerField;
    qyExplorarR_CAJA_NOMBRE: TIBStringField;
    qyExplorarR_TIPO: TIBStringField;
    qyExplorarR_ALMACEN: TIntegerField;
    qyExplorarR_ALMACEN_NOMBRE: TIBStringField;
    qyExplorarR_USUARIO: TIntegerField;
    qyExplorarR_USUARIO_NOMBRE: TIBStringField;
    qyExplorarR_REFERENCIA: TIBStringField;
    qyExplorarR_ESTATUS: TIBStringField;
    qyExplorarR_TOTAL: TFloatField;
    dgExplorarDBTableView1R_ID: TcxGridDBColumn;
    dgExplorarDBTableView1R_FECHA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA: TcxGridDBColumn;
    dgExplorarDBTableView1R_CAJA_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_TIPO: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN: TcxGridDBColumn;
    dgExplorarDBTableView1R_ALMACEN_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_USUARIO: TcxGridDBColumn;
    dgExplorarDBTableView1R_USUARIO_NOMBRE: TcxGridDBColumn;
    dgExplorarDBTableView1R_REFERENCIA: TcxGridDBColumn;
    dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn;
    dgExplorarDBTableView1R_TOTAL: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure cbAlmacenesClick(Sender: TObject);
    procedure ibVerClick(Sender: TObject);
    procedure ibPantallaClick(Sender: TObject);
    procedure ibImprimirClick(Sender: TObject);
  private
    { Private declarations }
    procedure leerArchivoIni;
    procedure crearArchivoIni;
  public
    { Public declarations }
  end;

var
  frmExplorar_colectas_pagos: TfrmExplorar_colectas_pagos;

implementation

uses inifiles, reglas_de_negocios, IBData, autorizacion,
  PRN_0010_Colectas_pagos;

{$R *.DFM}

procedure TfrmExplorar_colectas_pagos.leerArchivoIni;
var
   iniFile   : TIniFile;
   ruta      : string;
   i         : integer;
   tmp       : string;
   contador  : integer;
   almacen   : string;
begin
   tmp      := '';
   contador := 0;
   ruta := Application.ExeName;
   ruta := reglas.espejo(ruta);
   for i := 1 to length(ruta) do
      if ruta[i] = '\' then
         break
      else
         inc(contador);
   ruta := reglas.espejo(ruta);
   ruta := copy(ruta,1, (length(ruta) - contador));
   ruta := ruta + IntToStr(reglas.dame_usuario) + '.INI';

   iniFile := TIniFile.Create(ruta);
   almacen := iniFile.ReadString('ALMACEN','id','');
   iniFile.Free;
   if almacen = '' then
   begin
      if cbAlmacenes.Text <> '' then
      begin
         crearArchivoIni;

{         qyExplorar.Close;
         qyExplorar.ParamByName('P_CAJA').AsInteger    := 0;
         qyExplorar.ParamByName('P_TIPO').AsString     := 'Ventas';
         qyExplorar.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',reglas.dame_fecha);
         qyExplorar.ParamByName('P_ALMACEN').AsInteger := cbAlmacenes.KeyValue;
         qyExplorar.Open;}
         cbAlmacenes.Enabled := false;
      end
      else
         begin
            cbAlmacenes.Enabled := true;
         end;
   end
   else
      begin
         cbAlmacenes.KeyValue := almacen;
         cbAlmacenes.Enabled  := false;

{         qyExplorar.Close;
         qyExplorar.ParamByName('P_CAJA').AsInteger    := 0;
         qyExplorar.ParamByName('P_TIPO').AsString     := 'Ventas';
         qyExplorar.ParamByName('P_FECHA').AsString    := FormatDateTime('dd/mm/yyyy',reglas.dame_fecha);
         qyExplorar.ParamByName('P_ALMACEN').AsInteger := StrToInt(almacen);
         qyExplorar.Open;}
      end;
end;

procedure TfrmExplorar_colectas_pagos.crearArchivoIni;
var
   iniFile   : TIniFile;
   ruta      : string;
   i         : integer;
   tmp       : string;
   contador  : integer;
begin
   tmp      := '';
   contador := 0;
   ruta := Application.ExeName;
   ruta := reglas.espejo(ruta);
   for i := 1 to length(ruta) do
      if ruta[i] = '\' then
         break
      else
         inc(contador);
   ruta := reglas.espejo(ruta);
   ruta := copy(ruta,1, (length(ruta) - contador));
   ruta := ruta + IntToStr(reglas.dame_usuario) + '.INI';

   iniFile := TIniFile.Create(ruta);
   iniFile.WriteString('ALMACEN','id',IntToStr(cbAlmacenes.KeyValue));
   iniFile.Free;
end;

procedure TfrmExplorar_colectas_pagos.FormCreate(Sender: TObject);
begin
  inherited;
  deFecha.Date := StrToDate(FormatDateTime('dd/mm/yyyy',reglas.dame_fecha));
  reglas.refresh_IBQuery(qyAlmacenes);
  qyVer_Datos_Cajero.Close;
  qyVer_Datos_Cajero.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyVer_Datos_Cajero.Open;

  select := separarCampos('C.ID R_ID, C.FECHA R_FECHA, CA.NOMBRE R_CAJA_NOMBRE, C.TOTAL R_TOTAL, S.NOMBRE R_USUARIO_NOMBRE, C.REFERENCIA R_REFERENCIA, C.ESTATUS R_ESTATUS, A.CLAVE R_ALMACEN_CLAVE, A.NOMBRE R_ALMACEN_CLAVE');
  tabla  := 'COLECTAS C, CAJAS CA, SUJETOS_USUARIOS SU, SUJETOS S, ALMACENES A';
  whereAlways := '(C.TIPO = "Pagos" AND C.CAJA = CA.ID AND C.USUARIO = SU.ID AND SU.SUJETO = S.ID AND C.ALMACEN = A.ID) AND';

  if qyVer_Datos_Cajero.IsEmpty then
  begin
     leerArchivoIni;
     whereIfThen := '(C.FECHA BETWEEN :P_FECHA_INICIAL AND :P_FECHA_FINAL AND C.ALMACEN = :P_ALMACEN)';
  end
  else
     begin
        cbAlmacenes.KeyValue := qyVer_Datos_Cajero.FieldByName('R_ALMACEN').AsInteger;
        cbAlmacenes.Enabled  := false;

        whereIfThen := '(C.FECHA BETWEEN :P_FECHA_INICIAL AND :P_FECHA_FINAL AND C.ALMACEN = :P_ALMACEN AND C.CAJA = :P_CAJA)';
        qyExplorar.ParamByName('P_CAJA').AsInteger := qyVer_Datos_Cajero.FieldByName('R_ID').AsInteger;
     end;

  qyExplorar.Close;
  qyExplorar.SQL.Clear;
  qyExplorar.SQL.Add('SELECT '+select);
  qyExplorar.SQL.Add('FROM '+tabla);
  qyExplorar.SQL.Add('WHERE '+whereAlways+whereIfThen);
  ibVer.Click;

  FForma := 'frmCapturar_colectas_pagos';
end;

procedure TfrmExplorar_colectas_pagos.cbAlmacenesClick(Sender: TObject);
begin
  inherited;
  leerArchivoIni;
end;

procedure TfrmExplorar_colectas_pagos.ibVerClick(Sender: TObject);
begin
//  inherited;
   qyExplorar.Close;
   qyExplorar.ParamByName('P_FECHA_INICIAL').AsString := FormatDateTime('dd/mm/yyyy', deFecha.Date);
   qyExplorar.ParamByName('P_FECHA_FINAL').AsString   := FormatDateTime('dd/mm/yyyy', (deFecha.Date + 1));
   qyExplorar.ParamByName('P_ALMACEN').AsInteger      := cbAlmacenes.KeyValue;
   qyExplorar.Open;
end;

procedure TfrmExplorar_colectas_pagos.ibPantallaClick(Sender: TObject);
begin
  if cbAlmacenes.Text <> '' then
  begin
     reglas.abrir_IBTabla(dmIBData.TFiltroAlmacenes);
     inherited;
  end
  else
    ShowMessage('Seleccione el Almacen para crear archivo de configuracion');
end;

procedure TfrmExplorar_colectas_pagos.ibImprimirClick(Sender: TObject);
begin
  inherited;
  frmPRN_0010 := TfrmPRN_0010.Crear(Application, qyVer_Datos_Cajero.FieldByName('R_ID').AsInteger, cbAlmacenes.KeyValue);
  frmPRN_0010.ShowModal;
  frmPRN_0010.Free;
end;

end.
