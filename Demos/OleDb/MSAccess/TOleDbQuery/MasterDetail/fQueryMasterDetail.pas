unit fQueryMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OleDbEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OleDb, Grids, DBGrids, StdCtrls, ExtCtrls,
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
    OleDbQueryCustomers: TOleDbQuery;
    OleDbQueryOrders: TOleDbQuery;
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
  OleDbQueryCustomers.Refresh;
end;

procedure TfrmMasterDetail.btnRefreshDetailsClick(Sender: TObject);
begin
  OleDbQueryOrders.Refresh;
end;

procedure TfrmMasterDetail.btnConnectClick(Sender: TObject);
begin
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
  OleDbQueryOrders.Close;
  OleDbQueryCustomers.Close;
  inherited;
  OleDbQueryCustomers.Open;
  OleDbQueryOrders.Open;
  btnRefreshMaster.Enabled := True;
  btnRefreshDetails.Enabled := True;
end;

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OleDbQueryCustomers);
  RegisterDS(OleDbQueryOrders);
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
end;

end.
