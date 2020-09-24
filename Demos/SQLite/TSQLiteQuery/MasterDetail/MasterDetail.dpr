program MasterDetail;

uses
  Forms,
  fQueryMasterDetail in 'fQueryMasterDetail.pas' {frmMasterDetail},
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMasterDetail, frmMasterDetail);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
