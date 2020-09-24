program FetchData;

uses
  Forms,
  fFetchData in 'fFetchData.pas' {frmFetchData},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFetchData, frmFetchData);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
