program StoredProcWithParams;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMainQueryBase in '..\..\TSqlClientQuery\fMainQueryBase.pas' {frmMainQueryBase},
  fStoredProcWithParam in 'fStoredProcWithParam.pas' {frmStoredProcWithParams};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmStoredProcWithParams, frmStoredProcWithParams);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
