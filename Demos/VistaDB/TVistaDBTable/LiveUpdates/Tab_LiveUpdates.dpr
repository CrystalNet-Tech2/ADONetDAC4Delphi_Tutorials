program Tab_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase},
  fMainQueryBase in '..\..\TVistaDBQuery\fMainQueryBase.pas' {frmMainQueryBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
