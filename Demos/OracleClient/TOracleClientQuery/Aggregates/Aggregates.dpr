program Aggregates;

uses
  Forms,
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fAggregates in 'fAggregates.pas' {frmAggregates},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAggregates, frmAggregates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
