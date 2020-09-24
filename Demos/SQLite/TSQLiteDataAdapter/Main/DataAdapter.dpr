program DataAdapter;

uses
  Forms,
  fDataAdapter in 'fDataAdapter.pas' {frmDataAdapter},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataAdapter, frmDataAdapter);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
