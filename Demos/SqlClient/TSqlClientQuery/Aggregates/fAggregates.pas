unit fAggregates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, Buttons, StdCtrls,
  ComCtrls, ExtCtrls, Grids, DBGrids, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error;

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
    SqlClientQueryAggregates: TSqlClientQuery;
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
  lbledtAvg.Text := VarToStr(SqlClientQueryAggregates.Compute('Avg(UnitPrice)', lbledtFilter.Text));
  lbledtSum.Text := VarToStr(SqlClientQueryAggregates.Compute('Sum(UnitPrice)', lbledtFilter.Text));
  lbledtMax.Text := VarToStr(SqlClientQueryAggregates.Compute('Max(UnitPrice)', lbledtFilter.Text));
  if lbledtExpression.Text <> '' then
    lbledtExprResult.Text := VarToStr(SqlClientQueryAggregates.Compute(lbledtExpression.Text, lbledtFilter.Text));
end;

procedure TfrmAggregates.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryAggregates.Open;
end;

procedure TfrmAggregates.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SqlClientQueryAggregates);
end;

end.
