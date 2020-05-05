unit PRN_0018_CHEQUES_TXT;

interface

uses
   Windows,  SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre,   IBX.IBStoredProc,
   Db, IBX.IBCustomDataSet, IBX.IBQuery, jpeg,  ExtCtrls,
   StdCtrls,   Mask, DBCtrls, Buttons, dbgrids;

type
  TfrmPRN_0018_TXT = class(TfrmPadre)
    qyDatosReporte: TIBQuery;
    qyEmpresa: TIBQuery;
    qyEmpresaR_CLAVE: TIBStringField;
    qyEmpresaR_NOMBRE: TIBStringField;
    qyEmpresaR_RAZON_SOCIAL: TIBStringField;
    qyEmpresaR_TELEFONO: TIBStringField;
    qyEmpresaR_RFC: TIBStringField;
    qyEmpresaR_CURP: TIBStringField;
    qyEmpresaR_CIUDAD_DESCRIPCION: TIBStringField;
    dsEmpresa: TDataSource;
    qyEncabezadoCG: TIBQuery;
    dsEncabezado: TDataSource;
    spAUTO_FOLIO: TIBStoredProc;
    spMODIFICAR_FOLIO: TIBStoredProc;
    spACTUALIZA_CHEQUE_GIRADO: TIBStoredProc;
    dsBloque: TDataSource;
    qyPolizaCtas: TIBQuery;
    laCtaContable: TLabel;
    cbBancos: TDBLookupComboBox;
    buActBancos: TBitBtn;
    Label14: TLabel;
    Label1: TLabel;
    qyBancos: TIBQuery;
    qyBancosR_ID: TIntegerField;
    qyBancosR_CLAVE: TIBStringField;
    qyBancosR_NOMBRE: TIBStringField;
    qyBancosR_RAZON_SOCIAL: TIBStringField;
    qyBancosR_CUENTA: TIBStringField;
    qyBancosR_SUCURSAL: TIBStringField;
    dsBancos: TDataSource;
    edCuenta: TDBEdit;
    edSucursal: TDBEdit;
    qyChqsGirados: TIBQuery;
    dsChqsGirados: TDataSource;
    buImprimir: TBitBtn;
    buSalir: TBitBtn;
    qyBancosR_REPORTE_CHEQUES: TIBStringField;
    edReporte: TDBEdit;
    Label2: TLabel;
    qyBancosR_CHEQUERA: TIntegerField;
    spM_CHQ_GIRADOS: TIBStoredProc;
    Label3: TLabel;
    edImpresora: TDBEdit;
    qyBancosR_IMPRESORA: TIBStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qyEncabezadoCGAfterOpen(DataSet: TDataSet);
    procedure buActBancosClick(Sender: TObject);
    procedure buSalirClick(Sender: TObject);
    procedure buImprimirClick(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    poliza          : string;
    strImpresora    : string;
    strEscImpresora : string;
    pedirFolio      : boolean;
    soyImpresora    : string;
    soyReporte      : string;
    soyPrimero      : boolean;
    awrRejilla      : TDBGrid;
    awrID           : integer;
    awrMONTO        : double;
    awrMONEDAC      : string;
    awrMONEDAD      : string;
    impresiones     : integer;
    function loadImpresora(p_chequera : integer) : boolean;
    procedure setID(valor : integer);
    procedure imprimirBloqueContinuo;
  public
    { Public declarations }
    procedure OpenContinuos;
    procedure imprimir;
    procedure imprimirBloque;
    procedure imprimirPoliza;
    procedure imprimirBloquePoliza;
  published
     property Rejilla : TDBGrid read awrRejilla write awrRejilla;
     property ID      : integer read awrID write setID;
  end;

var
  frmPRN_0018_TXT: TfrmPRN_0018_TXT;

implementation

uses IBModulo, reglas_de_negocios, IBData, UfrmFolio;

{$R *.DFM}

procedure TfrmPRN_0018_TXT.OpenContinuos;
begin
   reglas.refresh_IBQuery(qyBancos);
   if not(qyBancos.IsEmpty) then
   begin
      cbBancos.KeyValue := dsBancos.DataSet.FieldByName('R_ID').AsInteger;
   end;
end;

procedure TfrmPRN_0018_TXT.setID(valor : integer);
begin
   awrID := valor;
   if valor <> 0 then
   begin
      qyEncabezadoCG.Close;
      qyEncabezadoCG.ParamByName('P_ID').AsInteger := valor;
      qyEncabezadoCG.Open;
   end;
end;

procedure TfrmPRN_0018_TXT.imprimirBloqueContinuo;
begin
end;

procedure TfrmPRN_0018_TXT.imprimirBloque;
var
   index    : integer;
   indexPos : integer;
begin
   if Rejilla <> nil then
   begin
      ID       := 0;
      // index    := Rejilla.TopIndex;
      indexPos := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      //Rejilla.FullExpand;
      Rejilla.DataSource.DataSet.First;
      //para imprimir los seleccionados.
      while not(Rejilla.DataSource.DataSet.Eof) do
      begin
         if (Rejilla.DataSource.DataSet.FieldByName('R_SEL').AsString = 'Si') and //Tiene que estar el registro seleccionado
            (ID <> Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger)then //Si existe alguna agrupacion, que no repita el primer registro.
         begin
            ID      := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
            imprimir;
         end;
         Rejilla.DataSource.DataSet.Next;
      end;

      //verifica el ultimo registro,
      // puesto que el grid trae un bug y no pasa por este, en el bluque de arriba
      if Rejilla.DataSource.DataSet.FieldByName('R_SEL').AsString = 'Si' then
      begin
         ID      := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
         imprimir;
      end;

      //para encontrar la posicion inicial de la rejilla.
      Rejilla.DataSource.DataSet.First;
      while not(Rejilla.DataSource.DataSet.Eof) do
      begin
         if Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger = IndexPos then
         begin
            break;
         end;
         Rejilla.DataSource.DataSet.Next;
      end;
      //Rejilla.TopIndex := index;
   end;
end;

procedure TfrmPRN_0018_TXT.imprimirBloquePoliza;
var
   index    : integer;
   indexPos : integer;
begin
   if Rejilla <> nil then
   begin
      ID       := 0;
      //index    := Rejilla.TopIndex;
      indexPos := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
      //Rejilla.FullExpand;
      Rejilla.DataSource.DataSet.First;
      //para imprimir los seleccionados.
      while not(Rejilla.DataSource.DataSet.Eof) do
      begin
         if (Rejilla.DataSource.DataSet.FieldByName('R_SEL').AsString = 'Si') and //Tiene que estar el registro seleccionado
            (ID <> Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger)then //Si existe alguna agrupacion, que no repita el primer registro.
         begin
            ID      := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
            imprimirPoliza;
         end;
         Rejilla.DataSource.DataSet.Next;
      end;

      //verifica el ultimo registro,
      // puesto que el grid trae un bug y no pasa por este, en el bluque de arriba
      if Rejilla.DataSource.DataSet.FieldByName('R_SEL').AsString = 'Si' then
      begin
         ID      := Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger;
         imprimirPoliza;
      end;

      //para encontrar la posicion inicial de la rejilla.
      Rejilla.DataSource.DataSet.First;
      while not(Rejilla.DataSource.DataSet.Eof) do
      begin
         if Rejilla.DataSource.DataSet.FieldByName('R_ID').AsInteger = IndexPos then
         begin
            break;
         end;
         Rejilla.DataSource.DataSet.Next;
      end;
      //Rejilla.TopIndex := index;
   end;
end;

function TfrmPRN_0018_TXT.loadImpresora(p_chequera : integer) : boolean;
var
   resp : boolean;
   SearchRec : TSearchRec;
begin
   qyDatosReporte.Close;
   qyDatosReporte.ParamByName('P_ID').AsInteger := p_chequera;
   qyDatosReporte.Open;
   reporte         := UpperCase(qyDatosReporte.FieldByName('REPORTE_CHEQUES').AsString);
   poliza          := UpperCase(qyDatosReporte.FieldByName('REPORTE_POLIZA').AsString);
   strImpresora    := UpperCase(qyDatosReporte.FieldByName('IMPRESORANOM').AsString);
   strEscImpresora := UpperCase(qyDatosReporte.FieldByName('ESCMODEL').AsString);

   if soyPrimero then
   begin
      soyImpresora := strImpresora;
      soyReporte   := reporte;
      soyPrimero   := false;
   end
   else
      begin
         if (soyImpresora = strImpresora) and (soyReporte <> reporte) then
         begin
            soyImpresora := strImpresora;
            soyReporte   := reporte;
            ShowMessage('Cambio reporte de impresion cheques, debe cambiar el papel para nuevo formato.');
         end;
      end;

   if FindFirst(ruta+reporte, faAnyFile, SearchRec) = 0 then
   begin
      resp := true;
   end
   else
      begin
         resp := false;
         ShowMessage('No se encuentra el formato de cheque, verifique nombre en chequeras y en directorio de reportes.');
      end;
   result := resp;
end;

procedure TfrmPRN_0018_TXT.FormCreate(Sender: TObject);
begin
   pedirFolio := true;
   soyPrimero := true;
   reglas.abrir_IBTabla(dmIBData.TPreferencias);
   inherited;
   ruta := ExtractFilePath(ParamStr(0))+'reportes\';
   reglas.refresh_IBQuery(qyEmpresa);

   //Numero de copias al imprimir la poliza de cheque
   dmIBData.TPreferencias.Filter := 'ID = 108';
   impresiones := dmIBData.TPreferencias.FieldByName('VALOR').AsInteger;
end;

procedure TfrmPRN_0018_TXT.imprimir;
begin
end;

procedure TfrmPRN_0018_TXT.imprimirPoliza;
begin
end;

procedure TfrmPRN_0018_TXT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dsBloque.DataSet := nil;
  inherited;
end;

procedure TfrmPRN_0018_TXT.qyEncabezadoCGAfterOpen(DataSet: TDataSet);
begin
  inherited;
  reglas.refresh_IBQuery(qyPolizaCtas);
end;

procedure TfrmPRN_0018_TXT.buActBancosClick(Sender: TObject);
begin
  inherited;
  reglas.refresh_IBQuery(qyBancos);
end;

procedure TfrmPRN_0018_TXT.buSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRN_0018_TXT.buImprimirClick(Sender: TObject);
begin
  inherited;
  qyChqsGirados.Close;
  qyChqsGirados.ParamByName('P_BANCO').AsInteger := cbBancos.KeyValue;
  qyChqsGirados.Open;

  imprimirBloqueContinuo;
end;

end.
