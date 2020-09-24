unit fQueryMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SQLiteEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SQLite, Grids, DBGrids, StdCtrls, ExtCtrls,
  Buttons, ComCtrls;

type
  TfrmMasterDetail = class(TfrmMainQueryBase)
    mmoComment: TMemo;
    pnl2: TPanel;
    btnRefreshMaster: TButton;
    btnRefreshDetails: TButton;
    dbgrd1: TDBGrid;
    spl1: TSplitter;
    dbgrd2: TDBGrid;
    dsCustomers: TDataSource;
    dsOrders: TDataSource;
    SQLiteQueryCustomers: TSQLiteQuery;
    SQLiteQueryOrders: TSQLiteQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnRefreshMasterClick(Sender: TObject);
    procedure btnRefreshDetailsClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMasterDetail: TfrmMasterDetail;

implementation

{$R *.dfm}

procedure TfrmMasterDetail.btnRefreshMasterClick(Sender: TObject);
begin
  SQLiteQueryCustomers.Refresh;
end;

procedure TfrmMasterDetail.btnRefreshDetailsClick(Sender: TObject);
begin
  SQLiteQueryOrders.Refresh;
end;

procedure TfrmMasterDetail.btnConnectClick(Sender: TObject);
begin
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
  SQLiteQueryOrders.Close;
  SQLiteQueryCustomers.Close;
  inherited;
  SQLiteQueryCustomers.Open;
  SQLiteQueryOrders.Open;
  btnRefreshMaster.Enabled := True;
  btnRefreshDetails.Enabled := True;
end;

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SQLiteQueryCustomers);
  RegisterDS(SQLiteQueryOrders);
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
end;

end.



