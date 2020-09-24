unit fQueryMasterDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.VistaDBEventArgs, DB, CNClrLib.ADONet.Client,
  Grids, DBGrids, StdCtrls, ExtCtrls, Buttons, ComCtrls,
  CNClrLib.ADONet.VistaDB;

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
    VistaDBQueryCustomers: TVistaDBQuery;
    VistaDBQueryOrders: TVistaDBQuery;
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
  VistaDBQueryCustomers.Refresh;
end;

procedure TfrmMasterDetail.btnRefreshDetailsClick(Sender: TObject);
begin
  VistaDBQueryOrders.Refresh;
end;

procedure TfrmMasterDetail.btnConnectClick(Sender: TObject);
begin
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
  VistaDBQueryOrders.Close;
  VistaDBQueryCustomers.Close;
  inherited;
  VistaDBQueryCustomers.Open;
  VistaDBQueryOrders.Open;
  btnRefreshMaster.Enabled := True;
  btnRefreshDetails.Enabled := True;
end;

procedure TfrmMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(VistaDBQueryCustomers);
  RegisterDS(VistaDBQueryOrders);
  btnRefreshMaster.Enabled := False;
  btnRefreshDetails.Enabled := False;
end;

end.



