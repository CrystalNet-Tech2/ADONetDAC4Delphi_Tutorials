program Filter;

uses
  Forms,
  fFilter in 'fFilter.pas' {frmFilter},
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFilter, frmFilter);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
