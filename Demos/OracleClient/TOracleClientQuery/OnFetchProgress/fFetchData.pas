unit fFetchData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OracleClient, ComCtrls, Grids, DBGrids,
  StdCtrls, ExtCtrls, Buttons;

type
  TfrmFetchData = class(TfrmMainQueryBase)
    pbProgress: TProgressBar;
    lblProgress: TLabel;
    dbgrd1: TDBGrid;
    dsOrders: TDataSource;
    OracleClientQueryOrders: TOracleClientQuery;
    procedure OracleClientQueryOrdersFetchComplete(Sender: TObject;
      TotalRecords: Integer);
    procedure OracleClientQueryOrdersFetchProgress(Sender: TObject; RecordsFetched,
      MaxRecordsToFetch: Integer);
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OracleClientConnection1AfterConnect(Sender: TObject);
    procedure OracleClientConnection1AfterDisconnect(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  OracleClientQueryOrders.Open;
end;

procedure TfrmFetchData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OracleClientConnection1.Close;
  inherited;
end;

procedure TfrmFetchData.FormCreate(Sender: TObject);
begin
  inherited;
  InitialiseCounters;
  RegisterDS(OracleClientQueryOrders);
end;

procedure TfrmFetchData.OracleClientConnection1AfterConnect(Sender: TObject);
begin
  lblProgress.Visible := True;
  pbProgress.Visible := True;
end;

procedure TfrmFetchData.OracleClientConnection1AfterDisconnect(Sender: TObject);
begin
  lblProgress.Visible := False;
  pbProgress.Visible := False;
end;

procedure TfrmFetchData.OracleClientQueryOrdersFetchComplete(Sender: TObject;
  TotalRecords: Integer);
begin
  lblProgress.Visible := False;
  pbProgress.Visible := False;
end;

procedure TfrmFetchData.OracleClientQueryOrdersFetchProgress(Sender: TObject;
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
