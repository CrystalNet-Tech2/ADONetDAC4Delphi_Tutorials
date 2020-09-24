unit fDataAdapter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DBCtrls,
  Grids, DBGrids, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error;

type
  TfrmDataAdapter = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    dbnvgr1: TDBNavigator;
    SqlClientCommand1: TSqlClientCommand;
    SqlClientDataAdapter1: TSqlClientDataAdapter;
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
  SqlClientCommand1.Cancel;
  ClrMemTable1.Active := False;
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
  SqlClientCommand1.CommandText.Text := 'select * from Categories';
end;

end.
