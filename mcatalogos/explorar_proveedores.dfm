inherited frmExplorar_proveedores: TfrmExplorar_proveedores
  Left = 299
  Top = 79
  Caption = 'Explorar Proveedores'
  ClientHeight = 620
  ClientWidth = 906
  ExplicitWidth = 922
  ExplicitHeight = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited fpPadre: TPanel
    Width = 906
    ExplicitWidth = 906
    inherited Panel1: TPanel
      Width = 906
      ExplicitWidth = 906
    end
  end
  inherited Panel2: TPanel
    Top = 598
    Width = 906
    ExplicitTop = 598
    ExplicitWidth = 906
  end
  inherited dgExplorar: TcxGrid
    Width = 906
    Height = 509
    ExplicitWidth = 906
    ExplicitHeight = 509
    inherited dgExplorarDBTableView1: TcxGridDBTableView
      object dgExplorarDBTableView1R_ID: TcxGridDBColumn
        DataBinding.FieldName = 'R_ID'
      end
      object dgExplorarDBTableView1R_FECHA: TcxGridDBColumn
        DataBinding.FieldName = 'R_FECHA'
      end
      object dgExplorarDBTableView1R_P_CLAVE: TcxGridDBColumn
        DataBinding.FieldName = 'R_P_CLAVE'
      end
      object dgExplorarDBTableView1R_PROVEEDOR: TcxGridDBColumn
        DataBinding.FieldName = 'R_PROVEEDOR'
      end
      object dgExplorarDBTableView1R_RAZON_SOCIAL: TcxGridDBColumn
        DataBinding.FieldName = 'R_RAZON_SOCIAL'
      end
      object dgExplorarDBTableView1R_CODIGO_PAIS: TcxGridDBColumn
        DataBinding.FieldName = 'R_CODIGO_PAIS'
      end
      object dgExplorarDBTableView1R_CODIGO_ESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'R_CODIGO_ESTADO'
      end
      object dgExplorarDBTableView1R_TELEFONO: TcxGridDBColumn
        DataBinding.FieldName = 'R_TELEFONO'
      end
      object dgExplorarDBTableView1R_RFC: TcxGridDBColumn
        DataBinding.FieldName = 'R_RFC'
      end
      object dgExplorarDBTableView1R_CURP: TcxGridDBColumn
        DataBinding.FieldName = 'R_CURP'
      end
      object dgExplorarDBTableView1R_MINIMA: TcxGridDBColumn
        DataBinding.FieldName = 'R_MINIMA'
      end
      object dgExplorarDBTableView1R_CALLE: TcxGridDBColumn
        DataBinding.FieldName = 'R_CALLE'
      end
      object dgExplorarDBTableView1R_ENTRE: TcxGridDBColumn
        DataBinding.FieldName = 'R_ENTRE'
      end
      object dgExplorarDBTableView1R_Y: TcxGridDBColumn
        DataBinding.FieldName = 'R_Y'
      end
      object dgExplorarDBTableView1R_NUM_EXT: TcxGridDBColumn
        DataBinding.FieldName = 'R_NUM_EXT'
      end
      object dgExplorarDBTableView1R_LETRA: TcxGridDBColumn
        DataBinding.FieldName = 'R_LETRA'
      end
      object dgExplorarDBTableView1R_NUM_INT: TcxGridDBColumn
        DataBinding.FieldName = 'R_NUM_INT'
      end
      object dgExplorarDBTableView1R_COLONIA: TcxGridDBColumn
        DataBinding.FieldName = 'R_COLONIA'
      end
      object dgExplorarDBTableView1R_CP: TcxGridDBColumn
        DataBinding.FieldName = 'R_CP'
      end
      object dgExplorarDBTableView1R_CIUDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_CIUDAD'
      end
      object dgExplorarDBTableView1R_ESTADO: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTADO'
      end
      object dgExplorarDBTableView1R_PAIS: TcxGridDBColumn
        DataBinding.FieldName = 'R_PAIS'
      end
      object dgExplorarDBTableView1R_TIPO_NAC: TcxGridDBColumn
        DataBinding.FieldName = 'R_TIPO_NAC'
      end
      object dgExplorarDBTableView1R_AFECTA_CALIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_AFECTA_CALIDAD'
      end
      object dgExplorarDBTableView1R_CALIFICACION_CALIDAD: TcxGridDBColumn
        DataBinding.FieldName = 'R_CALIFICACION_CALIDAD'
      end
      object dgExplorarDBTableView1R_ESTATUS: TcxGridDBColumn
        DataBinding.FieldName = 'R_ESTATUS'
      end
    end
  end
  inherited paExplorarBusqueda: TPanel
    Width = 906
    ExplicitWidth = 906
  end
  inherited qyExplorar: TIBQuery
    SQL.Strings = (
      'SELECT SP.ID R_ID,'
      '       S.FECHA_ALTA R_FECHA,'
      '       S.CLAVE R_P_CLAVE,'
      '       S.NOMBRE R_PROVEEDOR,'
      '       S.RAZON_SOCIAL R_RAZON_SOCIAL,'
      '       P.CODIGO_TEL R_CODIGO_PAIS,'
      '       E.CODIGO_TEL R_CODIGO_ESTADO,'
      '       S.TEL_PRINCIPAL R_TELEFONO,'
      '       S.RFC R_RFC,'
      '       S.CURP R_CURP,'
      '       SP.COMPRA_MINIMA R_MINIMA,'
      '       D.CALLE R_CALLE,'
      '       D.ENTRE_CALLE R_ENTRE,'
      '       D.Y_CALLE R_Y,'
      '       D.NUM_EXT R_NUM_EXT,'
      '       D.LETRA R_LETRA,'
      '       D.NUM_INT R_NUM_INT,'
      '       D.COLONIA R_COLONIA,'
      '       D.CP R_CP,'
      '       C.DESCRIPCION R_CIUDAD,'
      '       E.DESCRIPCION R_ESTADO,'
      '       P.DESCRIPCION R_PAIS,'
      '       SP.TIPO_NACIONALIDAD R_TIPO_NAC,'
      '       SP.AFECTA_CALIDAD R_AFECTA_CALIDAD,'
      '       SP.CALIFICACION_CALIDAD R_CALIFICACION_CALIDAD,'
      '       SP.ESTATUS R_ESTATUS'
      
        'FROM (SUJETOS_PROVEEDORES SP LEFT JOIN SUJETOS S ON SP.SUJETO = ' +
        'S.ID)'
      '     LEFT JOIN DOMICILIOS D ON S.DOMICILIO = D.ID'
      '     LEFT JOIN ENTIDAD_GEOGRAFICA C ON D.CIUDAD = C.ID'
      '     LEFT JOIN ENTIDAD_GEOGRAFICA E ON C.LINK   = E.ID'
      '     LEFT JOIN ENTIDAD_GEOGRAFICA P ON E.LINK   = P.ID'
      'WHERE SP.ID = 0')
    object qyExplorarR_ID: TIntegerField
      FieldName = 'R_ID'
      Origin = 'SUJETOS_PROVEEDORES.ID'
      Required = True
    end
    object qyExplorarR_FECHA: TDateTimeField
      FieldName = 'R_FECHA'
      Origin = 'SUJETOS.FECHA_ALTA'
    end
    object qyExplorarR_P_CLAVE: TIBStringField
      FieldName = 'R_P_CLAVE'
      Origin = 'SUJETOS.CLAVE'
      Size = 50
    end
    object qyExplorarR_PROVEEDOR: TIBStringField
      FieldName = 'R_PROVEEDOR'
      Origin = 'SUJETOS.NOMBRE'
      Size = 100
    end
    object qyExplorarR_RAZON_SOCIAL: TIBStringField
      FieldName = 'R_RAZON_SOCIAL'
      Origin = 'SUJETOS.RAZON_SOCIAL'
      Size = 100
    end
    object qyExplorarR_CODIGO_PAIS: TIBStringField
      FieldName = 'R_CODIGO_PAIS'
      Origin = 'ENTIDAD_GEOGRAFICA.CODIGO_TEL'
      Size = 10
    end
    object qyExplorarR_CODIGO_ESTADO: TIBStringField
      FieldName = 'R_CODIGO_ESTADO'
      Origin = 'ENTIDAD_GEOGRAFICA.CODIGO_TEL'
      Size = 10
    end
    object qyExplorarR_TELEFONO: TIBStringField
      FieldName = 'R_TELEFONO'
      Origin = 'SUJETOS.TEL_PRINCIPAL'
    end
    object qyExplorarR_RFC: TIBStringField
      FieldName = 'R_RFC'
      Origin = 'SUJETOS.RFC'
    end
    object qyExplorarR_CURP: TIBStringField
      FieldName = 'R_CURP'
      Origin = 'SUJETOS.CURP'
    end
    object qyExplorarR_MINIMA: TFloatField
      FieldName = 'R_MINIMA'
      Origin = 'SUJETOS_PROVEEDORES.COMPRA_MINIMA'
    end
    object qyExplorarR_CALLE: TIBStringField
      FieldName = 'R_CALLE'
      Origin = 'DOMICILIOS.CALLE'
      Size = 100
    end
    object qyExplorarR_ENTRE: TIBStringField
      FieldName = 'R_ENTRE'
      Origin = 'DOMICILIOS.ENTRE_CALLE'
      Size = 50
    end
    object qyExplorarR_Y: TIBStringField
      FieldName = 'R_Y'
      Origin = 'DOMICILIOS.Y_CALLE'
      Size = 50
    end
    object qyExplorarR_NUM_EXT: TIBStringField
      FieldName = 'R_NUM_EXT'
      Origin = 'DOMICILIOS.NUM_EXT'
      Size = 10
    end
    object qyExplorarR_LETRA: TIBStringField
      FieldName = 'R_LETRA'
      Origin = 'DOMICILIOS.LETRA'
      Size = 10
    end
    object qyExplorarR_NUM_INT: TIBStringField
      FieldName = 'R_NUM_INT'
      Origin = 'DOMICILIOS.NUM_INT'
      Size = 10
    end
    object qyExplorarR_COLONIA: TIBStringField
      FieldName = 'R_COLONIA'
      Origin = 'DOMICILIOS.COLONIA'
      Size = 50
    end
    object qyExplorarR_CP: TIBStringField
      FieldName = 'R_CP'
      Origin = 'DOMICILIOS.CP'
      Size = 10
    end
    object qyExplorarR_CIUDAD: TIBStringField
      FieldName = 'R_CIUDAD'
      Origin = 'ENTIDAD_GEOGRAFICA.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_ESTADO: TIBStringField
      FieldName = 'R_ESTADO'
      Origin = 'ENTIDAD_GEOGRAFICA.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_PAIS: TIBStringField
      FieldName = 'R_PAIS'
      Origin = 'ENTIDAD_GEOGRAFICA.DESCRIPCION'
      Size = 100
    end
    object qyExplorarR_TIPO_NAC: TIBStringField
      FieldName = 'R_TIPO_NAC'
      Origin = 'SUJETOS_PROVEEDORES.TIPO_NACIONALIDAD'
      Size = 11
    end
    object qyExplorarR_AFECTA_CALIDAD: TIBStringField
      FieldName = 'R_AFECTA_CALIDAD'
      Origin = 'SUJETOS_PROVEEDORES.AFECTA_CALIDAD'
      FixedChar = True
      Size = 2
    end
    object qyExplorarR_CALIFICACION_CALIDAD: TIntegerField
      FieldName = 'R_CALIFICACION_CALIDAD'
      Origin = 'SUJETOS_PROVEEDORES.CALIFICACION_CALIDAD'
    end
    object qyExplorarR_ESTATUS: TIBStringField
      FieldName = 'R_ESTATUS'
      Origin = 'SUJETOS_PROVEEDORES.ESTATUS'
    end
  end
end
