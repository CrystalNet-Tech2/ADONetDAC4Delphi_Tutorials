unit fDataReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs, fVistaDBMainCompBase,
  CNClrLib.ADONet.VistaDBEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.VistaDB, StdCtrls, DB, Buttons, ExtCtrls;

type
  TfrmDataReader = class(TfrmVistaDBMainCompBase)
    mmoConsole: TMemo;
    VistaDBDataReader1: TVistaDBDataReader;
    procedure btnConnectClick(Sender: TObject);
  public
    { Public declarations }
  end;

var
  frmDataReader: TfrmDataReader;

implementation

{$R *.dfm}

uses uDatSUtils, CNClrLib.ADONetWrapper;

procedure PrintHeader(Reader: TVistaDBDataReader; AConsole: TStrings;
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

procedure PrintRow(Reader: TVistaDBDataReader; AConsole: TStrings);
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
  VistaDBDataReader1.CommandText.Text := 'select * from employees';
  VistaDBDataReader1.Open;
  PrintHeader(VistaDBDataReader1, mmoConsole.Lines, 'Fetched rows ----------------');

  while VistaDBDataReader1.Read do
    PrintRow(VistaDBDataReader1, mmoConsole.Lines);

  VistaDBDataReader1.Close;
end;

end.
