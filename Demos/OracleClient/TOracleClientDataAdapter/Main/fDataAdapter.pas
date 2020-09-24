unit fDataAdapter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OracleClient, DBCtrls, Grids, DBGrids,
  StdCtrls, ExtCtrls;

type
  TfrmDataAdapter = class(TfrmORACLEMainCompBase)
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    dbnvgr1: TDBNavigator;
    OracleClientCommand1: TOracleClientCommand;
    OracleClientDataAdapter1: TOracleClientDataAdapter;
    ClrMemTable1: TClrMemTable;
    ds1: TDataSource;
    btnApplyChanges: TButton;
    btnRejectChanges: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnApplyChangesClick(Sender: TObject);
    procedure btnRejectChangesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataAdapter: TfrmDataAdapter;

implementation

{$R *.dfm}

procedure TfrmDataAdapter.btnApplyChangesClick(Sender: TObject);
begin
  ClrMemTable1.ApplyUpdates;
end;

procedure TfrmDataAdapter.btnConnectClick(Sender: TObject);
begin
  inherited;
  ClrMemTable1.Active := True;
end;

procedure TfrmDataAdapter.btnRejectChangesClick(Sender: TObject);
begin
  ClrMemTable1.CancelUpdates;
end;

procedure TfrmDataAdapter.FormCreate(Sender: TObject);
begin
  inherited;
  // Following settings you can make at design time
  // Select command
  OracleClientCommand1.CommandText.Text := 'select * from Categories';
end;

end.
