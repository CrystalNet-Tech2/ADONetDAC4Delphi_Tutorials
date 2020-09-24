program Meta_Tables;

uses
  Forms,
  fMetaTables in 'fMetaTables.pas' {frmMetaTables},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaTables, frmMetaTables);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.Run;
end.
