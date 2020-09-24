program Meta_Tables;

uses
  Forms,
  fMetaTables in 'fMetaTables.pas' {frmMetaTables},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaTables, frmMetaTables);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
