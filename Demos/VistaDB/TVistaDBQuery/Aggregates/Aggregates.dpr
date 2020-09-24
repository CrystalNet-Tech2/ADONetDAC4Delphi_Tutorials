program Aggregates;

uses
  Forms,
  fAggregates in 'fAggregates.pas' {frmAggregates},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAggregates, frmAggregates);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
