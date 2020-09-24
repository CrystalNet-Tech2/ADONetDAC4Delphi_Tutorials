program StoredProcNoParams;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMainQueryBase in '..\..\TSqlClientQuery\fMainQueryBase.pas' {frmMainQueryBase},
  fStoredProcNoParam in 'fStoredProcNoParam.pas' {frmStoredProcNoParams};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmStoredProcNoParams, frmStoredProcNoParams);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
