program Qry_CachedUpdates;

uses
  Forms,
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
