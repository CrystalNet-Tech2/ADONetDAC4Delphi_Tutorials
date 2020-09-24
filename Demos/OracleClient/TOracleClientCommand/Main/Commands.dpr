program Commands;

uses
  Forms,
  fCommands in 'fCommands.pas' {frmCommands},
  uDatSUtils in '..\..\..\VirtualTables\uDatSUtils.pas',
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCommands, frmCommands);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
