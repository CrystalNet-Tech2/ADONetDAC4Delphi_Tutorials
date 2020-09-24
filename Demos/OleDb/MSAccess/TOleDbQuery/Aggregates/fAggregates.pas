unit fAggregates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OleDbEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OleDb, Grids, DBGrids, StdCtrls, ExtCtrls,
  Buttons, ComCtrls;

type
  TfrmAggregates = class(TfrmMainQueryBase)
    pnl2: TPanel;
    lbledtExpression: TLabeledEdit;
    lbledtMax: TLabeledEdit;
    lbledtAvg: TLabeledEdit;
    lbledtSum: TLabeledEdit;
    lbledtExprResult: TLabeledEdit;
    mmo1: TMemo;
    lbledtFilter: TLabeledEdit;
    btn1: TButton;
    dbgrd1: TDBGrid;
    dsOrderDetails: TDataSource;
    OleDbQueryAggregates: TOleDbQuery;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAggregates: TfrmAggregates;

implementation

{$R *.dfm}

procedure TfrmAggregates.btn1Click(Sender: TObject);
begin
  lbledtAvg.Text := VarToStr(OleDbQueryAggregates.Compute('Avg(AmountPaid)', lbledtFilter.Text));
  lbledtSum.Text := VarToStr(OleDbQueryAggregates.Compute('Sum(AmountPaid)', lbledtFilter.Text));
  lbledtMax.Text := VarToStr(OleDbQueryAggregates.Compute('Max(AmountPaid)', lbledtFilter.Text));
  if lbledtExpression.Text <> '' then
    lbledtExprResult.Text := VarToStr(OleDbQueryAggregates.Compute(lbledtExpression.Text, lbledtFilter.Text));
end;

procedure TfrmAggregates.btnConnectClick(Sender: TObject);
begin
  inherited;
  OleDbQueryAggregates.Open;
end;

procedure TfrmAggregates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OleDbQueryAggregates);
end;

end.
