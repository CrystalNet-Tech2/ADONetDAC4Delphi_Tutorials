unit fCommands;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONetWrapper,
  CNClrLib.ADONet.OracleClient, StdCtrls, DB, ExtCtrls;

type
  TfrmCommands = class(TfrmORACLEMainCompBase)
    mmoConsole: TMemo;
    OracleClientCommand1: TOracleClientCommand;
    OracleClientDataAdapter1: TOracleClientDataAdapter;
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
  i, MaxID: Integer;
  newRow: _DataRow;
begin
  inherited;
  // 1. Setup data adapter and fill datatable with data from the database using the adapter
  with OracleClientDataAdapter1 do
  begin
    SelectCommand := OracleClientCommand1;
    SelectCommand.CommandText.Text := 'select * from Categories';
    OracleClientDataAdapter1.Fill(FDatSTable);
    PrintRows(FDatSTable, mmoConsole.Lines, 'Fetched rows ----------------');

    MaxID := OracleClientConnection1.ExecuteScalar('select Count(1) from Categories');

    // 2. Add new rows
    for i := 1 to 5 do
    begin
      newRow := FDatSTable.NewRow;
      newRow[0] := MaxID+i;
      newRow[1] := 'string' + IntToStr(MaxID+i);
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
