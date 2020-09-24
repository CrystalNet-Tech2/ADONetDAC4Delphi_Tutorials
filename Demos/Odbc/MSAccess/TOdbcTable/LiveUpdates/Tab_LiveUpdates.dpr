program Tab_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  fMainQueryBase in '..\..\TOdbcQuery\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
