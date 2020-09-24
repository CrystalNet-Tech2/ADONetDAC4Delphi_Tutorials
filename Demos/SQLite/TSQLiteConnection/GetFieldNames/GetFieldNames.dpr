program GetFieldNames;

uses
  Forms,
  fGetFieldNames in 'fGetFieldNames.pas' {frmGetFieldNames},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGetFieldNames, frmGetFieldNames);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
