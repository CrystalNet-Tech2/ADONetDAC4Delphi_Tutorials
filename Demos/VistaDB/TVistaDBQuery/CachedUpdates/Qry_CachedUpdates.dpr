program Qry_CachedUpdates;

uses
  Forms,
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
