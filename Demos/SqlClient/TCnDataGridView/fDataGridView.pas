unit fDataGridView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, Buttons, StdCtrls, ComCtrls,
  ExtCtrls, Grids, DBGrids, DBCtrls, CNClrLib.Control.EnumTypes,
  CNClrLib.Control.EventArgs, CNClrLib.Control.ScrollableControl,
  CNClrLib.Control.ToolStrip, CNClrLib.Control.BindingNavigator,
  CNClrLib.Control.Base, CNClrLib.Component.BindingSource,
  CNClrLib.Control.DataGridView;

type
  TfrmDataGridViewCachedUpdates = class(TfrmMainQueryBase)
    pnl2: TPanel;
    btnApply: TButton;
    btnCancel: TButton;
    SqlClientQueryProducts: TSqlClientQuery;
    ts1: TTabSheet;
    mmoLog: TMemo;
    CnDataGridView1: TCnDataGridView;
    CnBindingSource1: TCnBindingSource;
    CnBindingNavigator1: TCnBindingNavigator;
    procedure btnApplyClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure SqlClientQueryProductsUpdateRecord(Sender: TObject;
      EventArgs: TRowUpdatedEventArgs);
    procedure FormCreate(Sender: TObject);
    procedure SqlClientQueryProductsAfterClose(DataSet: TDataSet);
    procedure SqlClientQueryProductsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataGridViewCachedUpdates: TfrmDataGridViewCachedUpdates;

implementation

{$R *.dfm}

uses
  TypInfo;

procedure TfrmDataGridViewCachedUpdates.btnApplyClick(Sender: TObject);
begin
  SqlClientQueryProducts.UpdateBatch;
end;

procedure TfrmDataGridViewCachedUpdates.btnCancelClick(Sender: TObject);
begin
  SqlClientQueryProducts.CancelBatch;
end;

procedure TfrmDataGridViewCachedUpdates.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryProducts.Close;
  SqlClientQueryProducts.Open;
  with SqlClientQueryProducts.FieldByName('ProductID') do
    ProviderFlags := [pfInWhere, pfInKey];
end;

procedure TfrmDataGridViewCachedUpdates.FormCreate(Sender: TObject);
begin
  inherited;
  tsOptions.TabVisible := False;
  RegisterDS(SqlClientQueryProducts);
end;

procedure TfrmDataGridViewCachedUpdates.SqlClientQueryProductsAfterClose(
  DataSet: TDataSet);
begin
  btnApply.Enabled := False;
  btnCancel.Enabled := False;
end;

procedure TfrmDataGridViewCachedUpdates.SqlClientQueryProductsAfterOpen(
  DataSet: TDataSet);
begin
  btnApply.Enabled := True;
  btnCancel.Enabled := True;
end;

procedure TfrmDataGridViewCachedUpdates.SqlClientQueryProductsUpdateRecord(Sender: TObject;
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
