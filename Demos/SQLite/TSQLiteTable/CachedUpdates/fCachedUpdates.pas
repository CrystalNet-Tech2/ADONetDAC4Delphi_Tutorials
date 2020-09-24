unit fCachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SQLiteEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SQLite, StdCtrls, Grids, DBGrids, DBCtrls,
  ExtCtrls, Buttons, ComCtrls, CNClrLib.ADONet.SqlEventArgs,
  CNClrLib.ADONet.SqlClient;

type
  TfrmCachedUpdates = class(TfrmMainQueryBase)
    pnl2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnRevert: TButton;
    dbgrd1: TDBGrid;
    dsProducts: TDataSource;
    ts1: TTabSheet;
    mmoLog: TMemo;
    dbnvgr1: TDBNavigator;
    SQLiteTableCustomer: TSQLiteTable;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRevertClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLiteTableCustomerUpdateRecord(Sender: TObject;
      EventArgs: TRowUpdatedEventArgs);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCachedUpdates: TfrmCachedUpdates;

implementation

{$R *.dfm}

uses
  TypInfo;

procedure TfrmCachedUpdates.btnApplyClick(Sender: TObject);
begin
  SQLiteTableCustomer.UpdateBatch;
end;

procedure TfrmCachedUpdates.btnCancelClick(Sender: TObject);
begin
  SQLiteTableCustomer.CancelBatch;
end;

procedure TfrmCachedUpdates.btnConnectClick(Sender: TObject);
begin
  inherited;
  SQLiteTableCustomer.Close;
  SQLiteTableCustomer.Open;
  with SQLiteTableCustomer.FieldByName('id') do
    ProviderFlags := [pfInWhere, pfInKey];
end;

procedure TfrmCachedUpdates.btnRevertClick(Sender: TObject);
begin
  SQLiteTableCustomer.RevertRecord;
end;

procedure TfrmCachedUpdates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SQLiteTableCustomer);
end;

procedure TfrmCachedUpdates.SQLiteTableCustomerUpdateRecord(Sender: TObject;
  EventArgs: TRowUpdatedEventArgs);
var
  oMsg: string;
begin
  oMsg := 'Records Affected: '+ IntToStr(EventArgs.RecordsAffected) + #13#10 +
          'RowCount: '+ IntToStr(EventArgs.RowCount) + #13#10 +
          'Status: '+ TypInfo.GetEnumName(TypeInfo(TUpdateStatus_), Ord(EventArgs.Status)) + #13#10 +
          'StatementType: '+ TypInfo.GetEnumName(TypeInfo(TStatementType), Ord(EventArgs.StatementType)) + #13#10;

  if EventArgs.Errors <> nil then
    oMsg := oMsg + 'ErrorMessage: '+ EventArgs.Errors.Message;

  mmoLog.Lines.Add(oMsg);
  mmoLog.Lines.Add('**************************************************');
  mmoLog.Lines.Add('');
end;

end.
