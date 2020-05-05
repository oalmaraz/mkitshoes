unit explorarMDI;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  explorar, Menus,   Db, IBX.IBCustomDataSet, IBX.IBQuery,
       StdCtrls,
   Mask, DBCtrls,
   jpeg,     ComCtrls,
  Buttons, Grids, DBGrids, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid;

type
  TfrmExplorarMDI = class(TfrmExplorar)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  frmExplorarMDI: TfrmExplorarMDI;}

implementation

{$R *.DFM}

end.
