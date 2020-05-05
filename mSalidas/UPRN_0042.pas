unit UPRN_0042;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
    Db, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TPRN_0042 = class(TForm)
    qyPagare: TIBQuery;
    qyPagareCantidades: TIBQuery;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    ruta            : string;
    reporte         : string;
    strImpresora    : string;
    strEscImpresora : string;
    procedure loadImpresora;
    procedure setID(valor : integer);
  public
    { Public declarations }
    procedure imprimir;
  published
    property ID : integer write setID;
  end;

var
  PRN_0042: TPRN_0042;

implementation

uses
  controladorImpresora, IniFiles, IBModulo, reglas_de_negocios;

{$R *.DFM}

procedure TPRN_0042.imprimir;
//var
  // prWINReporte : TprReport;
begin
   //impresion WIN
   {
   prWINReporte := TprReport.Create(Self);
   prWINReporte.LoadTemplateFromFile(ruta+reporte,false);
   prWINReporte.PrinterName  := strImpresora;
   prWINReporte.PrepareReport;
   prWINReporte.PrintPreparedReport;
   prWINReporte.Destroy;
   }
end;

procedure TPRN_0042.loadImpresora;
var
   iniFile        : TIniFile;
   strPrinterNom1 : string;
   strPrinterVal1 : string;
   strEscModel1   : string;
begin
   if reglas.activarElegirControladorImpresora('PAGARE') then
   begin
      frmControladorImpresoras := TfrmControladorImpresoras.Create(Application);
      frmControladorImpresoras.BOTON := boPagare;
      frmControladorImpresoras.ShowModal;
      frmControladorImpresoras.Destroy;
   end;
   iniFile        := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   strPrinterNom1 := iniFile.ReadString('PAGARE','ImpresoraNom1','');
   strPrinterVal1 := iniFile.ReadString('PAGARE','ImpresoraVal1','');
   strEscModel1   := iniFile.ReadString('PAGARE','EscModel1'    ,'');
   strImpresora    := strPrinterNom1;
   strEscImpresora := strEscModel1;
   iniFile.Destroy;
end;

procedure TPRN_0042.setID(valor : integer);
var
   enteroStr : string;
   fracStr   : string;
   total     : string;
   pagos     : string;
begin
   //cantidades
   qyPagareCantidades.Close;
   qyPagareCantidades.ParamByName('P_ID').AsInteger := valor;
   qyPagareCantidades.Open;
   //cantidades con letras
   //total
   reglas.separarFlotante(qyPagareCantidades.FieldByName('R_TOTAL').AsFloat, enteroStr, fracStr);
   //leCantidad.Numero := StrToInt(enteroStr);
   //leCantidad.Moneda := qyPagareCantidades.FieldByName('R_MONEDA_DESCRIPCION').AsString;
   //total := leCantidad.AsString + ' ' + fracStr + '/100 ' + qyPagareCantidades.FieldByName('R_MONEDA_CLAVE').AsString;
   //pagos
   reglas.separarFlotante(qyPagareCantidades.FieldByName('R_IMPORTE_PRIMERO').AsFloat, enteroStr, fracStr);
   //leCantidad.Numero := StrToInt(enteroStr);
   //leCantidad.Moneda := qyPagareCantidades.FieldByName('R_MONEDA_DESCRIPCION').AsString;
   //pagos := leCantidad.AsString + ' ' + fracStr + '/100 ' + qyPagareCantidades.FieldByName('R_MONEDA_CLAVE').AsString;

   qyPagare.Close;
   qyPagare.ParamByName('P_ID').AsInteger       := valor;
   qyPagare.ParamByName('P_CCL_TOTAL').AsString := total;
   qyPagare.ParamByName('P_CCL_PAGOS').AsString := pagos;
   qyPagare.Open;
end;

procedure TPRN_0042.FormCreate(Sender: TObject);
var
   SearchRec : TSearchRec;
begin
  loadImpresora;
  //cargar archivo del directorio de reportes
  ruta := ExtractFilePath(ParamStr(0))+'reportes\';
  if FindFirst(ruta+'win_Pagare.prt', faAnyFile, SearchRec) = 0 then
     reporte := 'win_Pagare.prt'
  else
  begin
     ShowMessage( 'No se encontro reporte: win_Pagare.prt');
  end
end;

end.
