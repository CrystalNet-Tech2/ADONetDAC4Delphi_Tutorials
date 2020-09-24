program Tab_CachedUpdates;

uses
  Forms,
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fMainQueryBase in '..\..\TVistaDBQuery\fMainQueryBase.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
