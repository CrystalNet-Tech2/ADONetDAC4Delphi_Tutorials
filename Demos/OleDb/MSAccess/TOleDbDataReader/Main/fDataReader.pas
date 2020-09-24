unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fOLEDBMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OleDbEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONet.OleDb,
  StdCtrls, DB, Buttons, ExtCtrls;

type
  TfrmDataReader = class(TfrmOLEDBMainCompBase)
    mmoConsole: TMemo;
    OleDbDataReader1: TOleDbDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils;

procedure PrintHeader(Reader: TOleDbDataReader; AConsole: TStrings;
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

procedure PrintRow(Reader: TOleDbDataReader; AConsole: TStrings);
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
  OleDbDataReader1.CommandText.Text := 'select * from employee';
  OleDbDataReader1.Open;
  PrintHeader(OleDbDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while OleDbDataReader1.Read do
    PrintRow(OleDbDataReader1, mmoConsole.Lines);

  OleDbDataReader1.Close;
end;

end.
