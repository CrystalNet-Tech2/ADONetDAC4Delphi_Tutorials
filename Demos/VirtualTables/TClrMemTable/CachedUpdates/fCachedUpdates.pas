unit fCachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls, Grids, DBGrids,
  DBCtrls, ComCtrls;

type
  TfrmCachedUpdates = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    btnRevertRecord: TButton;
    btnCancelUpdates: TButton;
    btnApplyUpdates: TButton;
    dbnvgr1: TDBNavigator;
    dbgrd1: TDBGrid;
    ClrMemTable1: TClrMemTable;
    SqlClientCommand1: TSqlClientCommand;
    SqlClientDataAdapter1: TSqlClientDataAdapter;
    dsCustomers: TDataSource;
    statStatus: TStatusBar;
    lbl3: TLabel;
    edtUpdateBatchSize: TEdit;
    procedure btnRevertRecordClick(Sender: TObject);
    procedure btnCancelUpdatesClick(Sender: TObject);
    procedure btnApplyUpdatesClick(Sender: TObject);
    procedure dsCustomersDataChange(Sender: TObject; Field: TField);
    procedure btnConnectClick(Sender: TObject);
    procedure edtUpdateBatchSizeKeyPress(Sender: TObject; var Key: Char);
    procedure edtUpdateBatchSizeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCachedUpdates: TfrmCachedUpdates;

implementation

{$R *.dfm}

procedure TfrmCachedUpdates.btnApplyUpdatesClick(Sender: TObject);
begin
  ClrMemTable1.ApplyUpdates;
end;

procedure TfrmCachedUpdates.btnCancelUpdatesClick(Sender: TObject);
begin
  ClrMemTable1.CancelUpdates;
end;

procedure TfrmCachedUpdates.btnConnectClick(Sender: TObject);
begin
  inherited;
  ClrMemTable1.Open;
end;

procedure TfrmCachedUpdates.btnRevertRecordClick(Sender: TObject);
begin
  ClrMemTable1.RevertRecord;
end;

procedure TfrmCachedUpdates.dsCustomersDataChange(Sender: TObject;
  Field: TField);
begin
  statStatus.Panels[0].Text := 'Change''s Count = ' + IntToStr(ClrMemTable1.ChangeCount);
end;

procedure TfrmCachedUpdates.edtUpdateBatchSizeChange(Sender: TObject);
begin
  SqlClientDataAdapter1.UpdateBatchSize := StrToIntDef(edtUpdateBatchSize.Text, 1);
end;

procedure TfrmCachedUpdates.edtUpdateBatchSizeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in [#8, '0'..'9']) then
    Key := #0;
end;

end.
