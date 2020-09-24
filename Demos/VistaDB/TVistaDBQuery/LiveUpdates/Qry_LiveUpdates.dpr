program Qry_LiveUpdates;

uses
  Forms,
  fLiveUpdates in 'fLiveUpdates.pas' {frmLiveUpdates},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLiveUpdates, frmLiveUpdates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
