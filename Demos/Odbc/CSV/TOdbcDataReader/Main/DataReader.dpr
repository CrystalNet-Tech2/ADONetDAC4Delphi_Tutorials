program DataReader;

uses
  Forms,
  fDataReader in 'fDataReader.pas' {frmDataReader},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\..\VirtualTables\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataReader, frmDataReader);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.Run;
end.

