unit fRowFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls;

type
  TfrmRowFilter = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnChange: TButton;
    btnAccept: TButton;
    btnResetFilters: TButton;
    cbRowStates: TComboBox;
    cbRowFilter: TComboBox;
    mmoConsole: TMemo;
    SqlClientCommand1: TSqlClientCommand;
    SqlClientDataAdapter1: TSqlClientDataAdapter;
    ClrDataTable1: TClrDataTable;
    procedure btnConnectClick(Sender: TObject);
    procedure btnChangeClick(Sender: TObject);
    procedure btnAcceptClick(Sender: TObject);
    procedure btnResetFiltersClick(Sender: TObject);
    procedure cbRowStatesChange(Sender: TObject);
    procedure cbRowFilterChange(Sender: TObject);
  private
    FDataView: _DataView;
  public
    { Public declarations }
  end;

var
  frmRowFilter: TfrmRowFilter;

implementation

{$R *.dfm}

uses
  uDatSUtils, CNClrLib.ADONetWrapper.EnumArrays;

procedure TfrmRowFilter.btnAcceptClick(Sender: TObject);
begin
  ClrDataTable1.AcceptChanges;
  PrintRows(ClrDataTable1, mmoConsole.Lines, 'View after accepting row changes...', True);
end;

procedure TfrmRowFilter.btnChangeClick(Sender: TObject);
begin
  with ClrDataTable1.Rows[0] do
  begin
    BeginEdit;
    Item_1['OrderDate'] := Now;
    Item_1['Freight'] := 1000;
    EndEdit;
  end;
  ClrDataTable1.Rows[2].Delete;
  PrintRows(FDataView, mmoConsole.Lines, 'View after rows editing...', True);
end;

procedure TfrmRowFilter.btnConnectClick(Sender: TObject);
begin
  inherited;

  SqlClientCommand1.CommandText.Text := 'Select Top 50 * from Orders';
  SqlClientDataAdapter1.SelectCommand := SqlClientCommand1;
  SqlClientDataAdapter1.Fill(ClrDataTable1);

  FDataView := ClrDataTable1.DefaultDataView;
  PrintRows(ClrDataTable1, mmoConsole.Lines, 'The table...', True);

  cbRowStates.Enabled := True;
  cbRowFilter.Enabled := True;
  btnChange.Enabled := True;
  btnAccept.Enabled := True;
  btnResetFilters.Enabled := True;
end;

procedure TfrmRowFilter.btnResetFiltersClick(Sender: TObject);
begin
  cbRowStates.ItemIndex := -1;
  cbRowFilter.ItemIndex := -1;
  with FDataView do
  begin
    RowFilter := '';
    RowStateFilter := DataViewRowStateValues[TDataViewRowState.dvrsCurrentRows];
  end;
end;

procedure TfrmRowFilter.cbRowFilterChange(Sender: TObject);
begin
  with FDataView do
  begin
    RowFilter := cbRowFilter.Text;
    PrintRows(FDataView, mmoConsole.Lines, 'View with RowFilter = ' + cbRowFilter.Text, True);
  end
end;

procedure TfrmRowFilter.cbRowStatesChange(Sender: TObject);
begin
  with FDataView do
  begin
    RowStateFilter := DataViewRowStateValues[TDataViewRowState(cbRowStates.ItemIndex)];
    PrintRows(FDataView, mmoConsole.Lines, 'View with RowStateFilter = ' + cbRowStates.Text, True);
  end
end;

end.
