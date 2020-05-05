unit frmBusqueda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons,  DB, Grids, DBGrids,
  Menus, IBX.IBCustomDataSet, IBX.IBQuery;

type
  TfmBusquedas = class(TForm)
    DsBusquedas: TDataSource;
    dbgVisitante: TDBGrid;
    EdCadenaBuscar: TEdit;
    bbBuscar: TBitBtn;
    cbBusqueda: TComboBox;
    Label15: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    bbSalir: TBitBtn;
    bbSeleccionar: TBitBtn;
    PopupMenu1: TPopupMenu;
    Seleccionar1: TMenuItem;
    Salir1: TMenuItem;
    QyBusquedas: TIBQuery;
    bbNinguno: TBitBtn;
    Ninguno1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure DsBusquedasStateChange(Sender: TObject);
    procedure dbgVisitanteDblClick(Sender: TObject);
    procedure dbgVisitanteKeyPress(Sender: TObject; var Key: Char);
    procedure EdCadenaBuscarKeyPress(Sender: TObject; var Key: Char);
    procedure bbBuscarClick(Sender: TObject);
    procedure cbBusquedaKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure bbSeleccionarClick(Sender: TObject);
    procedure bbSalirClick(Sender: TObject);
    procedure Seleccionar1Click(Sender: TObject);
    procedure Salir1Click(Sender: TObject);
    procedure bbNingunoClick(Sender: TObject);
    procedure Ninguno1Click(Sender: TObject);
  private
    { Private declarations }
    vIdBuscar : integer;
    vNombreTabla : string;
    vSentenciaSelect : string;
    vSentenciaWhere : string;
    vDosTablas   : integer;
  public
    { Public declarations }
    function  vRegresaID : integer;
    procedure vParametros (aNombreTabla : string);    overload;
    procedure vParametros (aSentenciaSelect : string; aSentenciaWhere : string); overload;
    procedure vAddIdClave;

  end;

var
  fmBusquedas: TfmBusquedas;

implementation

uses IBModulo, reglas_de_negocios;


{$R *.DFM}

function TfmBusquedas.vRegresaID : integer;
begin
   Result := vIdBuscar;
end;


procedure TfmBusquedas.FormCreate(Sender: TObject);
begin
  vIdBuscar        := 0;
  vDosTablas       := 0;
  vSentenciaWhere  := '';
  cbBusqueda.ItemIndex := 0 ;

end;


procedure TfmBusquedas.vAddIdClave;
begin
  cbBusqueda.Clear;
  cbBusqueda.Items.Add('Identificador');
  cbBusqueda.Items.Add('Clave');
  cbBusqueda.ItemIndex := 0 ;
end;

procedure TfmBusquedas.vParametros (aNombreTabla : string);
begin
  vDosTablas := 0;
  vNombreTabla := aNombreTabla;
  vSentenciaWhere :=  '';
  vSentenciaSelect := '';

end;



procedure TfmBusquedas.vParametros (aSentenciaSelect : string; aSentenciaWhere : string);
begin
  vDosTablas      :=  1;
  vNombreTabla    :=  '';
  vSentenciaWhere :=  aSentenciaWhere;
  vSentenciaSelect := aSentenciaSelect;
end;


procedure TfmBusquedas.DsBusquedasStateChange(Sender: TObject);
begin
   if DsBusquedas.DataSet <> nil then
   begin
      if DsBusquedas.DataSet.State <> dsInactive then
      begin
         bbSeleccionar.Enabled := DsBusquedas.DataSet.RecordCount > 0;
         dbgVisitante.Enabled    := DsBusquedas.DataSet.RecordCount > 0;
      end;
   end;

end;

procedure TfmBusquedas.dbgVisitanteDblClick(Sender: TObject);
begin
   bbSeleccionar.OnClick(Sender);

end;

procedure TfmBusquedas.dbgVisitanteKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
      bbSeleccionar.OnClick(Sender);
end;

procedure TfmBusquedas.EdCadenaBuscarKeyPress(Sender: TObject;
  var Key: Char);
begin
   if  cbBusqueda.ItemIndex = 0 then  //Identificador  (Numerico)
   begin
     reglas.solo_numeros(key);
   end;

   if (key = #13) and (bbBuscar.Enabled)then
   begin
      bbBuscar.Click;
   end;

end;

procedure TfmBusquedas.bbBuscarClick(Sender: TObject);
begin
   QyBusquedas.Close;
   QyBusquedas.Sql.Clear;
   case cbBusqueda.ItemIndex of
     0: begin     //Identificador  (Numerico)
          if EdCadenaBuscar.Text = '' then
          begin
            if vDosTablas = 1 then
            begin
              QyBusquedas.sql.Add(vSentenciaSelect);
              QyBusquedas.sql.Add(vSentenciaWhere);
            end
            else
            begin
              QyBusquedas.sql.Add('Select * from ' + vNombreTabla);
            end;
            QyBusquedas.sql.Add(' order by ID  ');
          end
          else
          begin
            if vDosTablas = 1 then
            begin
              QyBusquedas.sql.Add(vSentenciaSelect);
              QyBusquedas.sql.Add(vSentenciaWhere);
              QyBusquedas.sql.Add(' and ID = :ID');
            end
            else
            begin
              QyBusquedas.sql.Add('Select * from '+ vNombreTabla+' where ID = :ID');
            end;
            QyBusquedas.ParamByName('ID').asString   := EdCadenaBuscar.Text;
          end;
        end;
     1: begin     //Clave (cadena)
            if vDosTablas = 1 then
            begin
              QyBusquedas.sql.Add(vSentenciaSelect);
              QyBusquedas.sql.Add(vSentenciaWhere);
              QyBusquedas.sql.Add('and  clave  like :clave');
            end
            else
            begin
              QyBusquedas.sql.Add('Select * from '+ vNombreTabla+' where clave  like :clave');
            end;
          QyBusquedas.sql.Add(' order by clave  ');
          QyBusquedas.ParamByName('clave').asString   := '%'+EdCadenaBuscar.Text+'%';
        end;
     2: begin     //Nombre (cadena)
            if vDosTablas = 1 then
            begin
              QyBusquedas.sql.Add(vSentenciaSelect);
              QyBusquedas.sql.Add(vSentenciaWhere);
              QyBusquedas.sql.Add('and  Nombre  like :Nombre ');
            end
            else
            begin
              QyBusquedas.sql.Add('Select * from '+ vNombreTabla+' where Nombre  like :Nombre');
            end;
          QyBusquedas.sql.Add(' order by Nombre  ');
          QyBusquedas.ParamByName('Nombre').asString   := '%'+EdCadenaBuscar.Text+'%';
        end;
   end;
   QyBusquedas.Open;
end;

procedure TfmBusquedas.cbBusquedaKeyPress(Sender: TObject;
  var Key: Char);
begin
   EdCadenaBuscar.SetFocus;
end;

procedure TfmBusquedas.FormActivate(Sender: TObject);
begin
   if  cbBusqueda.Enabled then
   begin
     bbBuscar.Click;
     cbBusqueda.Setfocus;
   end;
end;

procedure TfmBusquedas.bbSeleccionarClick(Sender: TObject);
begin
   vIdBuscar := DsBusquedas.DataSet.FieldByName('ID').asInteger;
   Close;
end;

procedure TfmBusquedas.bbSalirClick(Sender: TObject);
begin
   vIdBuscar := 0;
   Close;

end;

procedure TfmBusquedas.Seleccionar1Click(Sender: TObject);
begin
  bbSeleccionar.OnClick(Sender);
end;

procedure TfmBusquedas.Salir1Click(Sender: TObject);
begin
  bbSalir.OnClick(Sender);
end;

procedure TfmBusquedas.bbNingunoClick(Sender: TObject);
begin
   vIdBuscar := -1;
   Close;

end;

procedure TfmBusquedas.Ninguno1Click(Sender: TObject);
begin
  bbNinguno.OnClick(Sender);

end;

end.
