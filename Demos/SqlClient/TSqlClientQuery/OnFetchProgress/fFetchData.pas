unit fFetchData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, Grids, DBGrids, ComCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, Buttons, StdCtrls,
  ExtCtrls;

type
  TfrmFetchData = class(TfrmMainQueryBase)
    pbProgress: TProgressBar;
    lblProgress: TLabel;
    dbgrd1: TDBGrid;
    dsOrders: TDataSource;
    SqlClientQueryOrders: TSqlClientQuery;
    procedure SqlClientQueryOrdersFetchComplete(Sender: TObject;
      TotalRecords: Integer);
    procedure SqlClientQueryOrdersFetchProgress(Sender: TObject; RecordsFetched,
      MaxRecordsToFetch: Integer);
    procedure btnConnectClick(Sender: TObject);
    procedure btnFetchAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SqlClientConnection1AfterConnect(Sender: TObject);
    procedure SqlClientConnection1AfterDisconnect(Sender: TObject);
  private
    procedure InitialiseCounters;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFetchData: TfrmFetchData;

implementation

{$R *.dfm}

uses
  Math;

procedure TfrmFetchData.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryOrders.Open;
end;

procedure TfrmFetchData.btnFetchAllClick(Sender: TObject);
begin
  if not SqlClientQueryOrders.Active then
    SqlClientQueryOrders.Open;

  SqlClientQueryOrders.Last;
end;

procedure TfrmFetchData.FormCreate(Sender: TObject);
begin
  inherited;
  InitialiseCounters;
  RegisterDS(SqlClientQueryOrders);
end;

procedure TfrmFetchData.SqlClientConnection1AfterConnect(Sender: TObject);
begin
  lblProgress.Visible := True;
  pbProgress.Visible := True;
end;

procedure TfrmFetchData.SqlClientConnection1AfterDisconnect(Sender: TObject);
begin
  lblProgress.Visible := False;
  pbProgress.Visible := False;
end;

procedure TfrmFetchData.SqlClientQueryOrdersFetchComplete(Sender: TObject;
  TotalRecords: Integer);
begin
  lblProgress.Visible := False;
  pbProgress.Visible := False;
end;

procedure TfrmFetchData.SqlClientQueryOrdersFetchProgress(Sender: TObject;
  RecordsFetched, MaxRecordsToFetch: Integer);
begin
  lblProgress.Caption := FormatFloat('0.00', (RecordsFetched/MaxRecordsToFetch) * 100) + '%';
  pbProgress.Max := MaxRecordsToFetch;
  pbProgress.Position := RecordsFetched;
  Application.ProcessMessages;
end;

procedure TfrmFetchData.InitialiseCounters;
begin
  lblProgress.Caption := '0.00%';
  pbProgress.Position := 0;
  pbProgress.Max := 100;
end;

end.
