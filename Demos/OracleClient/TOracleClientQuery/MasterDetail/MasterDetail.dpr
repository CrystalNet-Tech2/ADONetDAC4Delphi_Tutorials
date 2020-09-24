program MasterDetail;

uses
  Forms,
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fQueryMasterDetail in 'fQueryMasterDetail.pas' {frmMasterDetail},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
