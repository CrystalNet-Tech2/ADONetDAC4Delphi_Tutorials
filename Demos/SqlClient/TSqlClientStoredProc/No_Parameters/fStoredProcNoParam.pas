unit fStoredProcNoParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DBCtrls,
  Grids, DBGrids, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, Buttons, StdCtrls, ComCtrls,
  ExtCtrls;

type
  TfrmStoredProcNoParams = class(TfrmMainQueryBase)
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;
    dsCategories: TDataSource;
    SqlClientStoredProc1: TSqlClientStoredProc;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStoredProcNoParams: TfrmStoredProcNoParams;

implementation

{$R *.dfm}
uses
  CNClrLib.ADONet.Enums, TypInfo;

procedure TfrmStoredProcNoParams.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientStoredProc1.Open;
end;

procedure TfrmStoredProcNoParams.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SqlClientStoredProc1);
end;

end.
