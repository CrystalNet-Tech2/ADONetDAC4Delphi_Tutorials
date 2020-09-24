unit fAggregates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.Odbc, Grids, DBGrids, StdCtrls, ExtCtrls,
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
    OdbcQueryAggregates: TOdbcQuery;
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
  lbledtAvg.Text := VarToStr(OdbcQueryAggregates.Compute('Avg(AmountPaid)', lbledtFilter.Text));
  lbledtSum.Text := VarToStr(OdbcQueryAggregates.Compute('Sum(AmountPaid)', lbledtFilter.Text));
  lbledtMax.Text := VarToStr(OdbcQueryAggregates.Compute('Max(AmountPaid)', lbledtFilter.Text));
  if lbledtExpression.Text <> '' then
    lbledtExprResult.Text := VarToStr(OdbcQueryAggregates.Compute(lbledtExpression.Text, lbledtFilter.Text));
end;

procedure TfrmAggregates.btnConnectClick(Sender: TObject);
begin
  inherited;
  OdbcQueryAggregates.Open;
end;

procedure TfrmAggregates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OdbcQueryAggregates);
end;

end.
