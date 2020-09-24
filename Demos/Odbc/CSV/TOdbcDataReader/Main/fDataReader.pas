unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fODBCMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONet.Odbc,
  StdCtrls, DB, Buttons, ExtCtrls;

type
  TfrmDataReader = class(TfrmODBCMainCompBase)
    mmoConsole: TMemo;
    OdbcDataReader1: TOdbcDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils, CNClrLib.ADONetWrapper;

procedure PrintHeader(Reader: TOdbcDataReader; AConsole: TStrings;
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

procedure PrintRow(Reader: TOdbcDataReader; AConsole: TStrings);
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
  OdbcDataReader1.CommandText.Text := 'select * from Customers.csv';
  OdbcDataReader1.Open;
  PrintHeader(OdbcDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while OdbcDataReader1.Read do
    PrintRow(OdbcDataReader1, mmoConsole.Lines);

  OdbcDataReader1.Close;
end;

end.




