program Tab_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase},
  fMainQueryBase in '..\..\TOracleClientQuery\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
