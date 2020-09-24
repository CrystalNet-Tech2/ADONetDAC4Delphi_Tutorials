program Commands;

uses
  Forms,
  fCommands in 'fCommands.pas' {frmCommands},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\..\VirtualTables\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommands, frmCommands);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.Run;
end.
