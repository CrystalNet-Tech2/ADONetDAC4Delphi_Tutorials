program Commands;

uses
  Forms,
  fCommands in 'fCommands.pas' {frmCommands},
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommands, frmCommands);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
