unit UdmInventarios;

interface

uses
  URecords, UTipos, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Db, IBX.IBCustomDataSet, IBX.IBQuery, IBX.IBTable, USQLAnaliza;

type
  TdmInventarios = class(TDataModule)
    qyIBXAlmacenes: TIBQuery;
    qyIBXAlmacenesID: TIntegerField;
    qyIBXAlmacenesCLAVE: TIBStringField;
    qyIBXAlmacenesNOMBRE: TIBStringField;
    qyIBXAlmacenesCOMPRA: TIBStringField;
    qyIBXAlmacenesVENDE: TIBStringField;
    qyIBXAlmacenesTRANSFORMA: TIBStringField;
    qyIBXAlmacenesFECHA_ALTA: TDateTimeField;
    qyIBXAlmacenesRESPONSABLE: TIntegerField;
    qyIBXAlmacenesOBSERVACIONES: TBlobField;
    qyIBXAlmacenesSERIE_FACTURA: TIBStringField;
    qyIBXAlmacenesCONSECUTIVO: TIntegerField;
    qyIBXAlmacenesFECHA_ULT_INV: TDateTimeField;
    qyIBXAlmacenesESTATUS: TIBStringField;
    qyIBXAlmacenesSERIE_NC: TIBStringField;
    qyIBXAlmacenesSERIE_NVENTA: TIBStringField;
    qyIBXAlmacenesSERIE_NCARGO: TIBStringField;
    dsAlmacenes: TDataSource;
    TIBXPreferencias: TIBTable;
    TIBXPreferenciasID: TIntegerField;
    TIBXPreferenciasNOMBRE: TIBStringField;
    TIBXPreferenciasTIPO: TIBStringField;
    TIBXPreferenciasVALOR: TIBStringField;
    dsPreferencias: TDataSource;
    TIBXMonedas: TIBTable;
    TIBXMonedasID: TIntegerField;
    TIBXMonedasCLAVE: TIBStringField;
    TIBXMonedasDESCRIPCION: TIBStringField;
    TIBXMonedasFECHA_ULT_ACT: TDateTimeField;
    TIBXMonedasPARIDAD: TFloatField;
    dsMonedas: TDataSource;
    qyIBXInventario: TIBQuery;
    dsInventario: TDataSource;
    qyLineas: TIBQuery;
    qyLineasR_ID: TIntegerField;
    qyLineasR_DESCRIPCION: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
    monedaBase     : integer;
    activarMedidas : boolean;
    activarColores : boolean;
    awrSql         : TSqlAnaliza;
  public
    { Public declarations }
    procedure refreshAlmacenes;
    procedure refreshMonedas;
    function getMoneda : integer;
    function getActivarMedidas : boolean;
    function getActivarColores : boolean;
    procedure ejecutar(FDatos : _Inventarios);
  published
    property interno : TSqlAnaliza read awrSql;
  end;

implementation

uses IBModulo;

{$R *.DFM}

procedure TdmInventarios.DataModuleCreate(Sender: TObject);
begin
   awrSQL             := TSqlAnaliza.Create;
   awrSQL.DataBase    := qyIBXInventario.Database;
   awrSQL.Transaction := qyIBXInventario.Transaction;
   awrSQL.AddStrings(qyIBXInventario.SQL);
   awrSQL.AddParams;

   dsAlmacenes.DataSet               := qyIBXAlmacenes;
   dsPreferencias.DataSet            := TIBXPreferencias;
   dsMonedas.DataSet                 := TIBXMonedas;
   dsInventario.DataSet              := qyIBXInventario;
   
   if dsPreferencias.DataSet.State = dsInactive then
      dsPreferencias.DataSet.Open;
   //Moneda base
   dsPreferencias.DataSet.Filter := 'ID = 3';
   monedaBase := dsPreferencias.DataSet.FieldByName('VALOR').AsInteger;
   //Activar Medidas
   dsPreferencias.DataSet.Filter := 'ID = 66';
   if UpperCase(dsPreferencias.DataSet.FieldByName('VALOR').AsString) = 'SI' then
      activarMedidas := true
   else
      activarMedidas := false;
   //Activar Colores
   dsPreferencias.DataSet.Filter := 'ID = 69';
   if UpperCase(dsPreferencias.DataSet.FieldByName('VALOR').AsString) = 'SI' then
      activarColores := true
   else
      activarColores := false;
end;

procedure TdmInventarios.ejecutar(FDatos : _Inventarios);
var
  where   : boolean;
  i, j    : integer;
  vLogica : string;
begin
   if (FDatos.ALMACEN     = 0 ) and
      (FDatos.MATERIAL    = 0 ) and
      (FDatos.CLAVE       = '') and
      (FDatos.DESCRIPCION = '') and
      (FDatos.MEDIDA      = 0 ) and
      (FDatos.COLOR       = 0 ) and
      (FDatos.MONEDA      = 0 ) and
      (FDatos.LOTE        = '') and
      (FDatos.SERIE       = '') and
      (FDatos.ACTIVOFIJO  = '') and
      (FDatos.LINEA       = 0 ) then
      where := false
   else
      where := true;

               vLogica := ' ';
               awrSql.LoadOriginal;

               if FDatos.ALMACEN <> 0 then
               begin
                  j := awrSQL.AddParamIndex('P_ALMACEN');
                  awrSQL.setParam(j, FDatos.ALMACEN, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.ALMACEN = :P_ALMACEN)');
                  vLogica := ' AND ';
               end;

               if FDatos.MATERIAL <> 0 then
               begin
                  j := awrSQL.AddParamIndex('P_MATERIAL');
                  awrSQL.setParam(j, FDatos.MATERIAL, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.MATERIAL = :P_MATERIAL)');
                  vLogica := ' AND ';
               end
               else
                  begin
                     if FDatos.CLAVE <> '' then
                     begin
                        j := awrSQL.AddParamIndex('P_MATERIAL_C');
                        awrSQL.setParam(j, '%'+FDatos.CLAVE+'%', psCadena);
                        awrSQL.AddWhereExtra(vLogica+'(M.CLAVE LIKE :P_MATERIAL_C)');
                        vLogica := ' AND ';
                     end;
                     if FDatos.DESCRIPCION <> '' then
                     begin
                        j := awrSQL.AddParamIndex('P_MATERIAL_D');
                        awrSQL.setParam(j, '%'+FDatos.DESCRIPCION+'%', psCadena);
                        awrSQL.AddWhereExtra(vLogica+'(M.DESCRIPCION LIKE :P_MATERIAL_D)');
                        vLogica := ' AND ';
                     end;
                  end;

               if FDatos.MEDIDA <> 0 then
               begin
                  j := awrSQL.AddParamIndex('P_MEDIDA');
                  awrSQL.setParam(j, FDatos.MEDIDA, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.MEDIDA = :P_MEDIDA)');
                  vLogica := ' AND ';
               end;

               if FDatos.COLOR <> 0 then
               begin
                  j := awrSQL.AddParamIndex('P_COLOR');
                  awrSQL.setParam(j, FDatos.COLOR, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.COLOR = :P_COLOR)');
                  vLogica := ' AND ';
               end;

               if FDatos.MONEDA <> 0 then
               begin
                  j := awrSQL.AddParamIndex('P_MONEDA');
                  awrSQL.setParam(j, FDatos.MONEDA, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.MONEDA = :P_MONEDA)');
                  vLogica := ' AND ';
               end;

               if FDatos.LOTE <> '' then
               begin
                  j := awrSQL.AddParamIndex('P_LOTE');
                  awrSQL.setParam(j, FDatos.LOTE, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.LOTE = :P_LOTE)');
                  vLogica := ' AND ';
               end;

               if FDatos.SERIE <> '' then
               begin
                  j := awrSQL.AddParamIndex('P_SERIE');
                  awrSQL.setParam(j, FDatos.SERIE, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.SERIE = :P_SERIE)');
                  vLogica := ' AND ';
               end;

               if FDatos.ACTIVOFIJO <> '' then
               begin
                  j := awrSQL.AddParamIndex('P_ACTIVOF');
                  awrSQL.setParam(j, FDatos.ACTIVOFIJO, psCadena);
                  awrSQL.AddWhereExtra(vLogica+'(I.ACTIVO_FIJO = :P_ACTIVOF)');
                  vLogica := ' AND ';
               end;

               if FDatos.LINEA <> 0 then
               begin
                  qyLineas.Close;
                  qyLineas.ParamByName('P_LINEA').AsInteger := FDatos.LINEA;
                  qyLineas.Open;

                  vLogica := ' ';
                  awrSQL.AddWhereExtra('AND');
                  awrSQL.AddWhereExtra('(');
                  while not(qyLineas.Eof) do
                  begin
                     j := awrSQL.AddParamIndex('P_LINEA'+qyLineas.FieldByName('R_ID').AsString);
                     awrSQL.setParam(j, qyLineas.FieldByName('R_ID').AsInteger, psCadena);
                     awrSQL.AddWhereExtra(vLogica+'(M.LINEA = :P_LINEA'+qyLineas.FieldByName('R_ID').AsString+')');
                     vLogica := ' OR ';
                     qyLineas.Next;
                  end;
                  awrSQL.AddWhereExtra(')');
               end;

               awrSQL.construirExtra;

               qyIBXInventario.SQL.Clear;
               qyIBXInventario.SQL.AddStrings(awrSQL.strSql);
               for i := 1 to awrSQL.indexParam do
               begin
                  qyIBXInventario.ParamByName(awrSQL.dameParam(i)).Value := awrSQL.dameParamValor(i);
               end;
               qyIBXInventario.Open;
end;

function TdmInventarios.getMoneda : integer;
begin
   Result := monedaBase;
end;

function TdmInventarios.getActivarMedidas : boolean;
begin
   Result := activarMedidas;
end;

function TdmInventarios.getActivarColores : boolean;
begin
   Result := activarColores;
end;

procedure TdmInventarios.refreshMonedas;
begin
   if dsMonedas.DataSet.State = dsInactive then
   begin
      dsMonedas.DataSet.Close;
      dsMonedas.DataSet.Open;
   end
   else
      dsMonedas.DataSet.Refresh;
end;

procedure TdmInventarios.refreshAlmacenes;
begin
   dsAlmacenes.DataSet.Close;
   dsAlmacenes.DataSet.Open;
end;

procedure TdmInventarios.DataModuleDestroy(Sender: TObject);
begin
   awrSQL.Destroy;
end;

end.
