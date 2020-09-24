unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, StdCtrls, DB,
  ExtCtrls, CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error;

type
  TfrmDataReader = class(TfrmSQLMainCompBase)
    mmoConsole: TMemo;
    SqlClientDataReader1: TSqlClientDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils;

procedure PrintHeader(Reader: TSqlClientDataReader; AConsole: TStrings;
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

procedure PrintRow(Reader: TSqlClientDataReader; AConsole: TStrings);
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
  SqlClientDataReader1.CommandText.Text := 'select * from Categories';
  SqlClientDataReader1.Open;
  PrintHeader(SqlClientDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while SqlClientDataReader1.Read do
    PrintRow(SqlClientDataReader1, mmoConsole.Lines);

  SqlClientDataReader1.Close;
end;

end.
