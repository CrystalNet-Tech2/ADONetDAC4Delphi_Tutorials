program GetFieldNames;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fGetFieldNames in 'fGetFieldNames.pas' {frmGetFieldNames};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGetFieldNames, frmGetFieldNames);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.Run;
end.
