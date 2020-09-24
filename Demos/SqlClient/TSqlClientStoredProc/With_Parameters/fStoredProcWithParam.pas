unit fStoredProcWithParam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DBCtrls,
  Grids, DBGrids, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, Buttons, StdCtrls, ComCtrls,
  ExtCtrls;

type
  TfrmStoredProcWithParams = class(TfrmMainQueryBase)
    dbgrd1: TDBGrid;
    pnl2: TPanel;
    dbnvgr1: TDBNavigator;
    dsCategories: TDataSource;
    SqlClientStoredProc1: TSqlClientStoredProc;
    dsCustomers: TDataSource;
    SqlClientQueryCustomers: TSqlClientQuery;
    dbgrd2: TDBGrid;
    spl1: TSplitter;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStoredProcWithParams: TfrmStoredProcWithParams;

implementation

{$R *.dfm}
uses
  CNClrLib.ADONet.Enums, TypInfo;

procedure TfrmStoredProcWithParams.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryCustomers.Open;
  SqlClientStoredProc1.Open;
end;

procedure TfrmStoredProcWithParams.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SqlClientQueryCustomers);
  RegisterDS(SqlClientStoredProc1);
end;

end.
