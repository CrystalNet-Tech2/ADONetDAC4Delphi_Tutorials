program Commands;

uses
  Forms,
  fCommands in 'fCommands.pas' {frmCommands},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\..\VirtualTables\uDatSUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommands, frmCommands);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
