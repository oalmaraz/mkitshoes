unit capturar_preferencias;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  capturarMDI, IBX.IBStoredProc, Db, IBX.IBCustomDataSet, IBX.IBTable,
  DBCtrls, StdCtrls, Mask,   Buttons, Grids, DBGrids, IBX.IBQuery, ExtCtrls;

type
  TfrmCapturar_preferencias = class(TfrmCapturarMDI)
    TCapturarID: TIntegerField;
    TCapturarNOMBRE: TIBStringField;
    TCapturarTIPO: TIBStringField;
    TCapturarVALOR: TIBStringField;
    dgExplorar: TDBGrid;
    deNombre: TDBEdit;
    meTipo: TDBComboBox;
    deValor: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ceId: TDBEdit;
    procedure dsFuenteDataChange(Sender: TObject; Field: TField);
    procedure ibNuevoClick(Sender: TObject);
    procedure ibModificarClick(Sender: TObject);
    procedure buInicioClick(Sender: TObject);
    procedure buAnteriorClick(Sender: TObject);
    procedure buSiguienteClick(Sender: TObject);
    procedure buFinClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCapturar_preferencias: TfrmCapturar_preferencias;

implementation

uses IBModulo;

{$R *.DFM}

procedure TfrmCapturar_preferencias.dsFuenteDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  ibEliminar.Visible := FALSE;
end;

procedure TfrmCapturar_preferencias.ibNuevoClick(Sender: TObject);
begin
  inherited;
  deNombre.SetFocus;
end;

procedure TfrmCapturar_preferencias.ibModificarClick(Sender: TObject);
begin
  inherited;
  deValor.SetFocus;
end;


procedure TfrmCapturar_preferencias.buInicioClick(Sender: TObject);
begin
//  inherited;
  dgExplorar.DataSource.DataSet.First;
end;

procedure TfrmCapturar_preferencias.buAnteriorClick(Sender: TObject);
begin
//  inherited;
  dgExplorar.DataSource.DataSet.Prior;
end;

procedure TfrmCapturar_preferencias.buSiguienteClick(Sender: TObject);
begin
//  inherited;
  dgExplorar.DataSource.DataSet.Next;
end;

procedure TfrmCapturar_preferencias.buFinClick(Sender: TObject);
begin
//  inherited;
  dgExplorar.DataSource.DataSet.Last;
end;

end.
