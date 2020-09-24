program Tab_CachedUpdates;

uses
  Forms,
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase},
  fMainQueryBase in '..\..\TSQLiteQuery\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
