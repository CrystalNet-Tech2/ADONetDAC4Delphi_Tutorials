unit fCommands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, StdCtrls, DB,
  ExtCtrls, CNClrLib.ADONetWrapper, CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error;

type
  TfrmCommands = class(TfrmSQLMainCompBase)
    mmoConsole: TMemo;
    SqlClientCommand1: TSqlClientCommand;
    SqlClientDataAdapter1: TSqlClientDataAdapter;
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

uses uDatSUtils;

procedure TfrmCommands.btnConnectClick(Sender: TObject);
var
  i: Integer;
  newRow: _DataRow;
begin
  inherited;
  // 1. Setup data adapter and fill datatable with data from the database using the adapter
  with SqlClientDataAdapter1 do
  begin
    SelectCommand := SqlClientCommand1;
    SelectCommand.CommandText.Text := 'select * from Categories';
    SqlClientDataAdapter1.Fill(FDatSTable);
    PrintRows(FDatSTable, mmoConsole.Lines, 'Fetched rows ----------------');

    // 2. Add new rows
    for i := 0 to 4 do
    begin
      newRow := FDatSTable.NewRow;
      newRow[0] := i;
      newRow[1] := 'string' + IntToStr(i);
      FDatSTable.Rows.Add(newRow);
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
