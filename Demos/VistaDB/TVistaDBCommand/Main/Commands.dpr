program Commands;

uses
  Forms,
  fCommands in 'fCommands.pas' {frmCommands},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommands, frmCommands);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
