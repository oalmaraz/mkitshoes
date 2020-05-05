unit UfrmMInventarioLoad;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids,
   StdCtrls, Buttons,  ExtCtrls;

type
  TfrmMInventarioLoad = class(TForm)
    fcStatusBar1: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buSiguiente: TBitBtn;
    buFin: TBitBtn;
    ibSalir: TBitBtn;
    paEncabezado: TPanel;
    ibCargar: TBitBtn;
    ibCancelar: TBitBtn;
    ibLimpiar: TBitBtn;
    sgDatos: TStringGrid;
    odCargar: TOpenDialog;
    ibReAgrupar: TBitBtn;
    ibGuardar: TBitBtn;
    procedure ibSalirClick(Sender: TObject);
    procedure ibCargarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ibLimpiarClick(Sender: TObject);
    procedure ibCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ibReAgruparClick(Sender: TObject);
    procedure ibGuardarClick(Sender: TObject);
  private
    { Private declarations }
    awrActiva : boolean;
    function dameCantidad(valor : string) : string;
    function dameCodigo(valor : string) : string;
  public
    { Public declarations }
    procedure acomodarPantalla;
  published
     property EstaActiva : boolean read awrActiva write awrActiva;
  end;

var
  frmMInventarioLoad: TfrmMInventarioLoad;

implementation

uses
   FileCtrl, reglas_de_negocios;

{$R *.DFM}

procedure TfrmMInventarioLoad.acomodarPantalla;
var
   Ancho  : integer;
   Altura : integer;
   PosY   : integer;
   alturaTitle : integer;
begin
  Ancho  := GetSystemMetrics(SM_CXSCREEN);
  Altura := GetSystemMetrics(SM_CYSCREEN);
  alturaTitle := GetSystemMetrics(SM_CYSIZE) + 4;
  posY   := Ancho - Self.Width;

  Self.Top    := 0;
  Self.Height := Altura - alturaTitle;
  Self.Left   := PosY;
end;

procedure TfrmMInventarioLoad.ibSalirClick(Sender: TObject);
begin
   Close;
end;

function TfrmMInventarioLoad.dameCodigo(valor : string) : string;
var
   p   : integer;
   tmp : string;
begin
   p := Pos(',', valor);
   if (p <> 0) then
      tmp := copy(valor, 1, p - 1)
   else
      tmp := copy(valor, 1, length(valor));

   result := tmp;
end;

function TfrmMInventarioLoad.dameCantidad(valor : string) : string;
var
   p   : integer;
   tmp : string;
begin
   p   := Pos(',', valor);
   tmp := '1';
   if (p <> 0) then
   begin
      tmp := Trim(copy(valor, p + 1, length(valor)));
   end;

   result := tmp;
end;

procedure TfrmMInventarioLoad.ibCargarClick(Sender: TObject);
var
  i: Integer;
  archivo : TextFile;
  lectura : string;
begin
  if odCargar.Execute then
  begin
     //paEncabezado.Title := 'Archivo: '+odCargar.FileName;
     if odCargar.FileName <> '' then
     begin
        AssignFile(archivo, odCargar.FileName);
        try
           Reset(archivo);
           i := 1;
           ibLimpiar.Click;
           while not Eof(archivo) do
           begin
              ReadLn(archivo,lectura);
              sgDatos.Cells[0,i] := dameCodigo(lectura);
              sgDatos.Cells[1,i] := 'X';
              sgDatos.Cells[2,i] := 'Sin Afectar';
              sgDatos.Cells[3,i] := dameCantidad(lectura);
              sgDatos.RowCount   := sgDatos.RowCount + 1;
              inc(i);
           end;
           CloseFile(archivo);
           if i > 1 then
              sgDatos.RowCount := sgDatos.RowCount - 1;
           ibReAgrupar.Click;
        except
           on EInOutError do
              showmessage('No se encontro archivo: '+odCargar.FileName);
        end;
     end;
  end;
end;

procedure TfrmMInventarioLoad.FormCreate(Sender: TObject);
begin
   sgDatos.Cells[0,0] := 'Codigo';
   sgDatos.Cells[1,0] := 'Est.';
   sgDatos.Cells[2,0] := 'Observaciones';
   sgDatos.Cells[3,0] := 'Cant.';
end;

procedure TfrmMInventarioLoad.ibLimpiarClick(Sender: TObject);
var
   i : integer;
begin
   for i := 1 to sgDatos.RowCount do
      sgDatos.Rows[i].Clear;
   sgDatos.RowCount := 2;
end;

procedure TfrmMInventarioLoad.ibCancelarClick(Sender: TObject);
begin
   ibLimpiar.Click;
   Close;
end;

procedure TfrmMInventarioLoad.FormShow(Sender: TObject);
begin
   EstaActiva := true;
end;

procedure TfrmMInventarioLoad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   EstaActiva := false;
end;

procedure TfrmMInventarioLoad.ibReAgruparClick(Sender: TObject);
var
  i, j : Integer;
  dato : string;
  cnt  : integer;
  del  : integer;
begin
//   cnt := 0;
   del := 0;
   for i := 1 to sgDatos.RowCount do
   begin
      //[columna, renglon]
      dato := sgDatos.Cells[0,i];
      if dato <> '' then
      begin
         cnt := StrToInt(sgDatos.Cells[3,i]);
         for j := (i + 1) to sgDatos.RowCount do
         begin
            if (dato = sgDatos.Cells[0,j]) then
            begin
               cnt := cnt + StrToInt(sgDatos.Cells[3,j]);
               sgDatos.Rows[j].Clear;
               inc(del);
            end;
         end;
         sgDatos.Cells[3,i] := IntToStr(cnt);
      end;
   end;

   for i := 1 to sgDatos.RowCount do
   begin
      //[columna, renglon]
      dato := sgDatos.Cells[0,i];
      if dato = '' then
      begin
         for j := (i + 1) to sgDatos.RowCount do
         begin
            if (sgDatos.Cells[0,j] <> '') then
            begin
               sgDatos.Cells[0,i] := sgDatos.Cells[0,j];
               sgDatos.Cells[1,i] := sgDatos.Cells[1,j];
               sgDatos.Cells[2,i] := sgDatos.Cells[2,j];
               sgDatos.Cells[3,i] := sgDatos.Cells[3,j];
               sgDatos.Rows[j].Clear;
               break;
            end;
         end
      end;
   end;
   sgDatos.RowCount := sgDatos.RowCount - del;
end;

procedure TfrmMInventarioLoad.ibGuardarClick(Sender: TObject);
var
   archivo : TextFile;
   i : integer;
   arch  : string;
   new   : string;
   SaveDialog : TSaveDialog;
begin
   SaveDialog := TSaveDialog.Create(Application);
   with SaveDialog do
   begin
      DefaultExt := 'txt';
      Filter := 'Archivo de texto (*.txt)|*.txt';
      new   := '';
      arch := odCargar.FileName;
      arch := reglas.espejo(arch);
      for i := 1 to length(arch) do
         if arch[i] = '\' then
            break
         else
            new := new + arch[i];
      arch := reglas.espejo(new);
      arch := copy(arch,1, length(arch) - 4);
      arch := arch + '_err.txt';
      FileName := arch;
      if Execute then
      begin
         AssignFile(archivo, FileName);
         ReWrite(archivo);
         if sgDatos.RowCount > 1 then
         begin
            for i := 1 to sgDatos.RowCount do
            begin
               if sgDatos.Cells[1,i] = 'X' then
               begin
                  WriteLn(archivo, sgDatos.Cells[0,i]);
               end;
            end
         end;
         CloseFile(archivo);
      end;
  end;
  SaveDialog.Destroy;
end;

end.
