program Tab_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase},
  fMainQueryBase in '..\..\TOleDbQuery\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
