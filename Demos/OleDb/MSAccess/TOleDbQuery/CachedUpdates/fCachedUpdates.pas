unit fCachedUpdates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OleDbEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OleDb, StdCtrls, Grids, DBGrids, DBCtrls,
  ExtCtrls, Buttons, ComCtrls;

type
  TfrmCachedUpdates = class(TfrmMainQueryBase)
    pnl2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    btnRevert: TButton;
    dbgrd1: TDBGrid;
    dsEmployees: TDataSource;
    ts1: TTabSheet;
    mmoLog: TMemo;
    dbnvgr1: TDBNavigator;
    OleDbQueryEmployee: TOleDbQuery;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnRevertClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OleDbQueryEmployeeUpdateRecord(Sender: TObject;
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
  OleDbQueryEmployee.UpdateBatch;
end;

procedure TfrmCachedUpdates.btnCancelClick(Sender: TObject);
begin
  OleDbQueryEmployee.CancelBatch;
end;

procedure TfrmCachedUpdates.btnConnectClick(Sender: TObject);
begin
  inherited;
  OleDbQueryEmployee.Close;
  OleDbQueryEmployee.Open;
  with OleDbQueryEmployee.FieldByName('EmpNo') do
    ProviderFlags := [pfInWhere, pfInKey];
end;

procedure TfrmCachedUpdates.btnRevertClick(Sender: TObject);
begin
  OleDbQueryEmployee.RevertRecord;
end;

procedure TfrmCachedUpdates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OleDbQueryEmployee);
end;

procedure TfrmCachedUpdates.OleDbQueryEmployeeUpdateRecord(Sender: TObject;
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
  mmoLog.Lines.Add('****************************');
  mmoLog.Lines.Add('');
end;

end.
