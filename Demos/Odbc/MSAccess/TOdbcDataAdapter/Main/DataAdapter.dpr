program DataAdapter;

uses
  Forms,
  fDataAdapter in 'fDataAdapter.pas' {frmDataAdapter},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDataAdapter, frmDataAdapter);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.Run;
end.
