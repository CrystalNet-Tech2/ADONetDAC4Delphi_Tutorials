program Qry_CachedUpdates;

uses
  Forms,
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
