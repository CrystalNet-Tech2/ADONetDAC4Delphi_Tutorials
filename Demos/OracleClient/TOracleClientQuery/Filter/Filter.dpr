program Filter;

uses
  Forms,
  fFilter in 'fFilter.pas' {frmFilter},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFilter, frmFilter);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
