program MasterDetail;

uses
  Forms,
  fQueryMasterDetail in 'fQueryMasterDetail.pas' {frmMasterDetail},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
