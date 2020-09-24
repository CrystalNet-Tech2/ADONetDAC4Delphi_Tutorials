program GetFieldNames;

uses
  Forms,
  fGetFieldNames in 'fGetFieldNames.pas' {frmGetFieldNames},
  fODBCMainCompBase in '..\..\fODBCMainCompBase.pas' {frmODBCMainCompBase},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGetFieldNames, frmGetFieldNames);
  Application.CreateForm(TfrmODBCMainCompBase, frmODBCMainCompBase);
  Application.Run;
end.
