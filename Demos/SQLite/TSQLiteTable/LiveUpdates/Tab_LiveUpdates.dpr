program Tab_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase},
  fMainQueryBase in '..\..\TSQLiteQuery\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
