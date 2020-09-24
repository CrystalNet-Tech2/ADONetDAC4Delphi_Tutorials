program Tab_CachedUpdates;

uses
  Forms,
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase},
  fMainQueryBase in '..\..\TOracleClientQuery\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
