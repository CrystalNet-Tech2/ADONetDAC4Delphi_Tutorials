unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLiteMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SQLiteEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SQLite, StdCtrls, DB, Buttons, ExtCtrls;

type
  TfrmDataReader = class(TfrmSQLiteMainCompBase)
    mmoConsole: TMemo;
    SQLiteDataReader1: TSQLiteDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils;

procedure PrintHeader(Reader: TSQLiteDataReader; AConsole: TStrings;
  const ALabel: String = ''; AWithState: Boolean = False);
var
  i: Integer;
  s: String;
begin
  if ALabel <> '' then
    AConsole.Add(ALabel);
  with Reader do
  begin
    s := '';
    for i := 0 to VisibleFieldCount - 1 do
      s := s + '      '  + GetName(i);
    AConsole.Add(s);
  end;
end;

procedure PrintRow(Reader: TSQLiteDataReader; AConsole: TStrings);
var
  i: Integer;
  s: String;
begin
  with Reader do
  begin
    s := '';
    for i := 0 to VisibleFieldCount - 1 do
      s := s + '      ' + VarToWideStr(GetValue(i));
    AConsole.Add(s);
  end;
end;

procedure TfrmDataReader.btnConnectClick(Sender: TObject);
var
  i: Integer;
  newRow: _DataRow;
begin
  inherited;
  // Setup data read and forward only read data from the database
  SQLiteDataReader1.CommandText.Text := 'select * from employee';
  SQLiteDataReader1.Open;
  PrintHeader(SQLiteDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while SQLiteDataReader1.Read do
    PrintRow(SQLiteDataReader1, mmoConsole.Lines);

  SQLiteDataReader1.Close;
end;

end.
