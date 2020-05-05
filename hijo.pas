unit hijo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  padre,   Db, IBX.IBCustomDataSet, IBX.IBQuery, StdCtrls, Mask,
  DBCtrls,  jpeg,  ExtCtrls,  ComCtrls,
  Buttons;

type
  TfrmHijo = class(TfrmPadre)
    dsFuente: TDataSource;
    qyBotones: TIBQuery;
    qyBotonesID: TIntegerField;
    qyBotonesR_ACTIVO: TIBStringField;
    qyBotonesR_NOMBRE: TIBStringField;
    Panel2: TPanel;
    buInicio: TBitBtn;
    buAnterior: TBitBtn;
    buFin: TBitBtn;
    buSiguiente: TBitBtn;
    ibSalir: TBitBtn;
    deID: TDBEdit;
    procedure ibSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    ver       : boolean;
    construir : boolean;
    imprimir  : boolean;
    capturar  : boolean;
    xls       : boolean;
    html      : boolean;
    xml       : boolean;
    nuevo     : boolean;
    modificar : boolean;
    guardar   : boolean;
    cancelar  : boolean;
    eliminar  : boolean;
    ayuda     : boolean;
  public
    { Public declarations }
  end;

{var
  frmHijo: TfrmHijo;}

implementation

uses IBData, reglas_de_negocios,  IBModulo;

{$R *.DFM}

procedure TfrmHijo.ibSalirClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmHijo.FormCreate(Sender: TObject);
var
   i                : integer;
   nombre_impuesto1 : string;
   nombre_impuesto2 : string;
begin
  inherited;
  ver       := TRUE;
  construir := TRUE;
  imprimir  := TRUE;
  capturar  := TRUE;
  xls       := TRUE;
  html      := TRUE;
  xml       := TRUE;
  nuevo     := TRUE;
  modificar := TRUE;
  guardar   := TRUE;
  cancelar  := TRUE;
  eliminar  := TRUE;
  ayuda     := TRUE;

  qyBotones.Close;
  qyBotones.ParamByName('P_FORMA').AsString    := self.Name;
  qyBotones.ParamByName('P_USUARIO').AsInteger := reglas.dame_usuario;
  qyBotones.Open;



  //fpPadre.Title := Caption;
  reglas.abrir_IBTabla(dmIBData.TPreferencias);
  dmIBData.TPreferencias.Filter := 'ID = 5'; //Etiqueta para impuesto 1
  nombre_impuesto1 := dmIBData.TPreferencias.FieldByName('VALOR').AsString;
  dmIBData.TPreferencias.Filter := 'ID = 6'; //Etiqueta para impuesto 2
  nombre_impuesto2 := dmIBData.TPreferencias.FieldByName('VALOR').AsString;
  for i := 0 to ComponentCount-1 do
  begin
     //activar botones
     if Components[i] is TBitBtn then
     begin
        qyBotones.First;
        while not(qyBotones.Eof) do
        begin
           if qyBotones.FieldByName('R_NOMBRE').AsString = TBitBtn(Components[i]).Name then
           begin
              if qyBotones.FieldByName('R_ACTIVO').AsString = 'No' then
              begin
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibVer' then
                    ver := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibConstructor' then
                    construir := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibImprimir' then
                    imprimir := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibPantalla' then
                    capturar := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibExportarXLS' then
                    xls := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibExportarHTML' then
                    html := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibExportarXML' then
                    xml := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibNuevo' then
                    nuevo := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibGuardar' then
                    guardar := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibModificar' then
                    modificar := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibCancelar' then
                    cancelar := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibEliminar' then
                    eliminar := FALSE
                 else
                 if qyBotones.FieldByName('R_NOMBRE').AsString = 'ibAyuda' then
                    ayuda := FALSE
              end;
           end;
           qyBotones.Next;
        end;
     end;

     if Components[i] is TLabel then
     begin
        if Components[i].Name = 'laImpuesto1' then
           TLabel(Components[i]).Caption := nombre_impuesto1;
        if Components[i].Name = 'laImpuesto2' then
           TLabel(Components[i]).Caption := nombre_impuesto2;
     end;
     {
     if Components[i] is TColumn then
     begin
        if Components[i].Name = 'coIMPUESTO1' then
           TColumn(Components[i]).Caption := nombre_impuesto1;
        if Components[i].Name = 'coIMPUESTO2' then
           TColumn(Components[i]).Caption := nombre_impuesto2;
     end;
     }
  end;
end;

end.
