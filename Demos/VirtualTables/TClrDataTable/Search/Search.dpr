program Search;

uses
  Forms,
  uDatSUtils in '..\..\uDatSUtils.pas',
  fSQLMainCompBase in '..\..\..\SqlClient\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fSearch in 'fSearch.pas' {frmSearch};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmSearch, frmSearch);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.Run;
end.
