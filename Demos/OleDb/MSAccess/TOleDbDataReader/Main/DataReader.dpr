program DataReader;

uses
  Forms,
  fDataReader in 'fDataReader.pas' {frmDataReader},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\..\VirtualTables\uDatSUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataReader, frmDataReader);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
