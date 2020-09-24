unit fFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, Buttons, StdCtrls, ComCtrls,
  ExtCtrls, Grids, DBGrids;

type
  TfrmFilter = class(TfrmMainQueryBase)
    pnl2: TPanel;
    btnFilter1: TButton;
    btnFilter2: TButton;
    btnFilter3: TButton;
    btnFilter4: TButton;
    btnFilter6: TButton;
    btnFilter5: TButton;
    edtExample: TEdit;
    mmoInfo: TMemo;
    btnClear: TButton;
    dbgrd1: TDBGrid;
    dsOrders: TDataSource;
    SqlClientQueryOrders: TSqlClientQuery;
    statStatus: TStatusBar;
    procedure btnFilter5Click(Sender: TObject);
    procedure btnFilter6Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnFilter4Click(Sender: TObject);
    procedure btnFilter3Click(Sender: TObject);
    procedure btnFilter1Click(Sender: TObject);
    procedure btnFilter2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsOrdersDataChange(Sender: TObject; Field: TField);
    procedure SqlClientQueryOrdersFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure btnConnectClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFilter: TfrmFilter;

implementation

{$R *.dfm}

procedure TfrmFilter.btnClearClick(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    Filter := '';
    Filtered := True;
  end;
  edtExample.Text := '';
end;

procedure TfrmFilter.btnConnectClick(Sender: TObject);
begin
  inherited;
  SqlClientQueryOrders.Open;
end;

procedure TfrmFilter.btnFilter1Click(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'RequiredDate > #1997-07-29#';
    Filtered := True;
  end;
  edtExample.Text := SqlClientQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter2Click(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'OrderDate < #1997-01-29#';
    Filtered := True;
  end;
  edtExample.Text := SqlClientQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter3Click(Sender: TObject);
begin
  with SqlClientQueryOrders do begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'Freight > 50 AND Freight < 100';
    Filtered := True;
  end;
  edtExample.Text := SqlClientQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter4Click(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'CustomerID LIKE ''A*''';
    Filtered := True;
  end;
  edtExample.Text := SqlClientQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter5Click(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    Filter := '';
    OnFilterRecord := SqlClientQueryOrdersFilterRecord;
    Filtered := True;
  end;
  edtExample.Text := '';
end;

procedure TfrmFilter.btnFilter6Click(Sender: TObject);
begin
  with SqlClientQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := edtExample.Text;
    Filtered := True;
  end;
end;

procedure TfrmFilter.dsOrdersDataChange(Sender: TObject; Field: TField);
begin
  statStatus.Panels[0].Text := 'Total Records: ' + VarToStr(SqlClientQueryOrders.Compute('Count(OrderID)', ''));
end;

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SqlClientQueryOrders);
end;

procedure TfrmFilter.SqlClientQueryOrdersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet.FieldByName('EmployeeID') do
    Accept := (4 <= AsInteger) and (AsInteger <= 5);
end;

end.
