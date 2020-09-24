unit fCommands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fODBCMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONet.Odbc,
  StdCtrls, DB, Buttons, ExtCtrls;

type
  TfrmCommands = class(TfrmODBCMainCompBase)
    mmoConsole: TMemo;
    OdbcCommand1: TOdbcCommand;
    OdbcDataAdapter1: TOdbcDataAdapter;
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FDatSTable: _DataTable;
  public
    { Public declarations }
  end;

var
  frmCommands: TfrmCommands;

implementation

{$R *.dfm}

uses uDatSUtils, CNClrLib.ADONetWrapper;

procedure TfrmCommands.btnConnectClick(Sender: TObject);
var
  i, maxCustID: Integer;
  newRow: _DataRow;
begin
  inherited;
  // 1. Setup data adapter and fill datatable with data from the database using the adapter
  with OdbcDataAdapter1 do
  begin
    SelectCommand := OdbcCommand1;
    SelectCommand.CommandText.Text := 'select * from customer';
    OdbcDataAdapter1.Fill(FDatSTable);
    PrintRows(FDatSTable, mmoConsole.Lines, 'Fetched rows ----------------');

    maxCustID := OdbcConnection1.ExecuteScalar('Select Count(1) from customer');
    Inc(maxCustID);
    // 2. Add new rows
    for i := 0 to 4 do
    begin
      newRow := FDatSTable.NewRow;
      newRow[0] := maxCustID;
      newRow[1] := 'ComapnyName' + IntToStr(i);
      FDatSTable.Rows.Add(newRow);
      Inc(maxCustID);
    end;

    PrintRows(FDatSTable, mmoConsole.Lines, 'Rows after addition ----------------');

    // 3. Post changes to SQL Server
    // In this example 5 new records will be inserted into FDQA_map2 table
    Update(FDatSTable);
    PrintRows(FDatSTable, mmoConsole.Lines, 'Rows after posting updates ----------------');
  end;
end;

procedure TfrmCommands.FormCreate(Sender: TObject);
begin
  inherited;
  FDatSTable := CoDataTable.CreateInstance;
end;

end.
