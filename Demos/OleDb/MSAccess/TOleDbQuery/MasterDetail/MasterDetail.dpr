program MasterDetail;

uses
  Forms,
  fQueryMasterDetail in 'fQueryMasterDetail.pas' {frmMasterDetail},
  fMainQueryBase in '..\fMainQueryBase.pas',
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
