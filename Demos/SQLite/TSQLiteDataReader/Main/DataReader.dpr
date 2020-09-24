program DataReader;

uses
  Forms,
  fDataReader in 'fDataReader.pas' {frmDataReader},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataReader, frmDataReader);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
