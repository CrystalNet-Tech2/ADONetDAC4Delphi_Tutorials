program FetchData;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fFetchData in 'fFetchData.pas' {frmFetchData};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFetchData, frmFetchData);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
