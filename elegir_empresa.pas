unit elegir_empresa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre, jpeg,  ExtCtrls,  StdCtrls, DBCtrls, Db,
       Grids, DBGrids,
       IBX.IBCustomDataSet,
  IBX.IBTable;

type
  TfrmElegir_Empresa = class(TfrmPadre)
    dsEmpresa: TDataSource;
    TEmpresas: TIBTable;
    TEmpresasID: TIntegerField;
    TEmpresasNOMBRE: TIBStringField;
    TEmpresasNOMBRE_AWR: TIBStringField;
    Label1: TLabel;
    cbEmpresas: TDBLookupComboBox;
    Label3: TLabel;
    laVersion: TLabel;
    buAceptar: TButton;
    buCancelar: TButton;
    dtNombre: TDBText;
    fcLabel1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure buAceptarClick(Sender: TObject);
  private
    { Private declarations }
    conecto : boolean;
    verMayor    : string;
    verMenor    : string;
    verLiberada : string;
    procedure ultima_entrada;
    procedure grabar_entrada;
    procedure setLiberada(valor : string);
  public
    { Public declarations }
    constructor Crear(AOwner : TComponent; x, y : integer);
    function se_conecto : boolean;
    { Public declarations }
  published
    property vMayor    : string read verMayor write verMayor;
    property vMenor    : string read verMenor write verMenor;
    property vLiberada : string read verLiberada write setLiberada;
  end;

var
  frmElegir_Empresa: TfrmElegir_Empresa;

implementation

uses inifiles, IBModulo, reglas_de_negocios, IBX.IB;

{$R *.DFM}

procedure TfrmElegir_Empresa.setLiberada(valor : string);
begin
   verLiberada       := valor;
   laVersion.Caption := verMayor+'.'+verMenor+'.'+valor;
end;

procedure TfrmElegir_Empresa.grabar_entrada;
var
   iniArchivo : TIniFile;
begin
   iniArchivo := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   iniArchivo.WriteString('ENTRADA', 'Empresa', dsEmpresa.DataSet.FieldByName('ID').AsString);
   iniArchivo.Free;
end;

procedure TfrmElegir_Empresa.ultima_entrada;
var
   iniFile : TIniFile;
   emp : string;
begin
   iniFile := TIniFile.Create(ChangeFileExt(Application.ExeName,'.INI'));
   emp     := iniFile.ReadString('ENTRADA','Empresa','');
   iniFile.Free;
   
   if emp <> '' then
      cbEmpresas.KeyValue := StrToInt(emp)
   else
      cbEmpresas.KeyValue := dsEmpresa.DataSet.FieldByName('ID').AsInteger;
end;

constructor TfrmElegir_Empresa.Crear(AOwner : TComponent; x, y : integer);
begin
   Create(AOwner);
   Top     := y;
   Left    := x;
   conecto := FALSE;
end;

function TfrmElegir_Empresa.se_conecto : boolean;
begin
   Result := conecto;
end;

procedure TfrmElegir_Empresa.FormCreate(Sender: TObject);
begin
  inherited;
  reglas.abrir_IBTabla(TEmpresas);
//  dmIBData.TFiltroEmpresas.Filter := 'ID > 0';
{  dmIBData.TFiltroEmpresas.First;
  while not(dmIBData.TFiltroEmpresas.Eof) do
  begin
     clEmpresas.Items.Add('('+dmIBData.TFiltroEmpresas.FieldByName('ID').AsString+') '+dmIBData.TFiltroEmpresas.FieldByName('NOMBRE').AsString);
     dmIBData.TFiltroEmpresas.Next;
  end;
  clEmpresas.ItemIndex := 0;}

  ultima_entrada;
end;

procedure TfrmElegir_Empresa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  grabar_entrada;
  inherited;
end;

procedure TfrmElegir_Empresa.buAceptarClick(Sender: TObject);
begin
  inherited;
  try
    if reglas.dame_empresa <> dsEmpresa.DataSet.FieldByName('ID').AsInteger then
    begin
       reglas.fijar_empresa(dsEmpresa.DataSet.FieldByName('ID').AsInteger);
       reglas.databaseName(dsEmpresa.DataSet.FieldByName('NOMBRE_AWR').AsString);
       reglas.abrir_base_de_datos(dmIBModulo.ibSistema, reglas.dame_llave, reglas.dame_servidor, reglas.dame_ruta, reglas.dameDatabaseName);
    end;
    conecto := TRUE;
    Close;
  except
    on EIBInterBaseError do
    begin
       ShowMessage('Error en conexion con base de datos');
    end;
  end;
end;

end.
