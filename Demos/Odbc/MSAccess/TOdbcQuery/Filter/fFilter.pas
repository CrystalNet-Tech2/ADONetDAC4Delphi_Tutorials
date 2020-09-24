unit fFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fMainQueryBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.Odbc, ComCtrls, Grids, DBGrids, StdCtrls,
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
    OdbcQueryOrders: TOdbcQuery;
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
    procedure OdbcQueryOrdersFilterRecord(DataSet: TDataSet;
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
  with OdbcQueryOrders do
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
  OdbcQueryOrders.Open;
end;

procedure TfrmFilter.btnFilter1Click(Sender: TObject);
begin
  with OdbcQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'SaleDate > #1992-07-29#';
    Filtered := True;
  end;
  edtExample.Text := OdbcQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter2Click(Sender: TObject);
begin
  with OdbcQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'ShipDate < #1992-01-29#';
    Filtered := True;
  end;
  edtExample.Text := OdbcQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter3Click(Sender: TObject);
begin
  with OdbcQueryOrders do begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'AmountPaid > 1000 AND AmountPaid < 5000';
    Filtered := True;
  end;
  edtExample.Text := OdbcQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter4Click(Sender: TObject);
begin
  with OdbcQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := 'ShipVIA LIKE ''%A%''';
    Filtered := True;
  end;
  edtExample.Text := OdbcQueryOrders.Filter;
end;

procedure TfrmFilter.btnFilter5Click(Sender: TObject);
begin
  with OdbcQueryOrders do
  begin
    Filtered := False;
    Filter := '';
    OnFilterRecord := OdbcQueryOrdersFilterRecord;
    Filtered := True;
  end;
  edtExample.Text := '';
end;

procedure TfrmFilter.btnFilter6Click(Sender: TObject);
begin
  with OdbcQueryOrders do
  begin
    Filtered := False;
    OnFilterRecord := nil;
    Filter := edtExample.Text;
    Filtered := True;
  end;
end;

procedure TfrmFilter.dsOrdersDataChange(Sender: TObject; Field: TField);
begin
  statStatus.Panels[0].Text := 'Total Records: ' + VarToStr(OdbcQueryOrders.Compute('Count(OrderNo)', ''));
end;

procedure TfrmFilter.FormCreate(Sender: TObject);
begin
  inherited;
  RegisterDS(OdbcQueryOrders);
end;

procedure TfrmFilter.OdbcQueryOrdersFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  with DataSet.FieldByName('EmpNo') do
    Accept := (AsInteger >= 50) and (AsInteger <= 100);
end;

end.


