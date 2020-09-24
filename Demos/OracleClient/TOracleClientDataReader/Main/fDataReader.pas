unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OracleClient, StdCtrls, DB, ExtCtrls;

type
  TfrmDataReader = class(TfrmORACLEMainCompBase)
    mmoConsole: TMemo;
    OracleClientDataReader1: TOracleClientDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils;

procedure PrintHeader(Reader: TOracleClientDataReader; AConsole: TStrings;
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

procedure PrintRow(Reader: TOracleClientDataReader; AConsole: TStrings);
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
  OracleClientDataReader1.CommandText.Text := 'select * from Categories';
  OracleClientDataReader1.Open;
  PrintHeader(OracleClientDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while OracleClientDataReader1.Read do
    PrintRow(OracleClientDataReader1, mmoConsole.Lines);

  OracleClientDataReader1.Close;
end;

end.
