unit fFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SQLiteEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SQLite, ComCtrls, Grids, DBGrids, StdCtrls,
  ExtCtrls, Buttons;

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
    statStatus: TStatusBar;
    SQLiteQueryOrders: TSQLiteQuery;
    procedure btnFilter5Click(Sender: TObject);
    procedure btnFilter6Click(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnFilter4Click(Sender: TObject);
    procedure btnFilter3Click(Sender: TObject);
    procedure btnFilter1Click(Sender: TObject);
    procedure btnFilter2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dsOrdersDataChange(Sender: TObject; Field: TField);
    procedure btnConnectClick(Sender: TObject);
    procedure SQLiteQueryOrdersFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
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
  with SQLiteQueryOrders do
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
  SQLiteQueryOrders.Open;
end;

procedure TfrmFilter.btnFilter1Click(Sender: TObject);
begin
  with SQLiteQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'OrderDate > #2012-11-20#';
    Filtered := True;
  end;
  edtExample.Text := SQLiteQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter2Click(Sender: TObject);
begin
  with SQLiteQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'ShippedDate < #2012-11-29#';
    Filtered := True;
  end;
  edtExample.Text := SQLiteQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter3Click(Sender: TObject);
begin
  with SQLiteQueryOrders do begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'Freight > 30 AND Freight < 50';
    Filtered := True;
  end;
  edtExample.Text := SQLiteQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter4Click(Sender: TObject);
begin
  with SQLiteQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'CustomerId LIKE ''%A%''';
    Filtered := True;
  end;
  edtExample.Text := SQLiteQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter5Click(Sender: TObject);
begin
  with SQLiteQueryOrders do
  begin
    Filtered := False;
    Filter := '';
    OnFilterRecord := SQLiteQueryOrdersFilterRecord;
    Filtered := True;
  end;
  edtExample.Text := '';
end;

procedure TfrmFilter.btnFilter6Click(Sender: TObject);
begin
  with SQLiteQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := edtExample.Text;
    Filtered := True;
  end;
end;

procedure TfrmFilter.dsOrdersDataChange(Sender: TObject; Field: TField);
begin
  statStatus.Panels[0].Text := 'Total Records: ' + VarToStr(SQLiteQueryOrders.Compute('Count(id)', ''));
end;

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(SQLiteQueryOrders);
end;

procedure TfrmFilter.SQLiteQueryOrdersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet.FieldByName('EmployeeId') do
    Accept := (AsInteger >= 3) and (AsInteger <= 10);
end;

end.


