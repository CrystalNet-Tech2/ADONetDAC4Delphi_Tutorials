unit fSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, StdCtrls, ExtCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient;

type
  TfrmSearch = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnFindSorted: TButton;
    btnLocate: TButton;
    btnFindSorted2: TButton;
    edtCustomerID: TEdit;
    edtEmployeeID: TEdit;
    cbLocate: TComboBox;
    mmoConsole: TMemo;
    ClrDataTable1: TClrDataTable;
    SqlClientDataAdapter1: TSqlClientDataAdapter;
    SqlClientCommand1: TSqlClientCommand;
    edtOrderID: TEdit;
    lbl5: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure btnFindSortedClick(Sender: TObject);
    procedure btnFindSorted2Click(Sender: TObject);
    procedure btnLocateClick(Sender: TObject);
  private
    FDataView: _DataView;
  public
    { Public declarations }
  end;

var
  frmSearch: TfrmSearch;

implementation

{$R *.dfm}

uses
  uDatSUtils, CNClrLib.ADONetWrapper.Host;

procedure TfrmSearch.btnConnectClick(Sender: TObject);
begin
  inherited;

  SqlClientCommand1.CommandText.Text := 'Select Top 50 * from Orders';
  SqlClientDataAdapter1.SelectCommand := SqlClientCommand1;
  SqlClientDataAdapter1.Fill(ClrDataTable1);

  PrintRows(ClrDataTable1, mmoConsole.Lines, 'The table...');

  FDataView := ClrDataTable1.DefaultDataView;
  btnFindSorted.Enabled := True;
  btnFindSorted2.Enabled := True;
  btnLocate.Enabled := True;
end;

procedure TfrmSearch.btnFindSorted2Click(Sender: TObject);
var
  i: Integer;
begin
  // Find row specifing column names and values
  FDataView.Sort := 'OrderID';
  i := FDataView.Find(edtOrderID.Text);

  if i <> -1 then
    PrintRow(FDataView.Item[i].Row, mmoConsole.Lines, 'Found row')
  else
    mmoConsole.Lines.Add('Row don''t found');
end;

procedure TfrmSearch.btnFindSortedClick(Sender: TObject);
var
  i: Integer;
begin
  // Add sort to the view and find row using sorted column values
  FDataView.Sort := 'OrderID, CustomerID, EmployeeID';
  i := FDataView.Find_2(TClrArrayHelper.ToObjectArray([edtOrderID.Text, edtCustomerID.Text, edtEmployeeID.Text]));

  if i <> -1 then
    PrintRow(FDataView.Item[i].Row, mmoConsole.Lines, 'Found row')
  else
    mmoConsole.Lines.Add('Row don''t found');
  FDataView.Sort := '';
end;

procedure TfrmSearch.btnLocateClick(Sender: TObject);
var
  i: Integer;
  m_table: _DataTable;
begin
  // Locate row using locating mechanism
  FDataView.RowFilter := cbLocate.Text;
  m_table := FDataView.ToTable;
  if m_table.Rows.Count > 0 then
    PrintRows(m_table, mmoConsole.Lines, 'Found row')
  else
    mmoConsole.Lines.Add('Row don''t found');
  FDataView.RowFilter := '';
end;

end.
