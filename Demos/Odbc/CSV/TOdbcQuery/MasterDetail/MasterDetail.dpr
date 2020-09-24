program MasterDetail;

uses
  Forms,
  fQueryMasterDetail in 'fQueryMasterDetail.pas' {frmMasterDetail},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
