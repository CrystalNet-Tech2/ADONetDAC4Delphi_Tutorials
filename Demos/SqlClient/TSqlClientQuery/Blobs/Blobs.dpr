program Blobs;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMainQueryBase in '..\fMainQueryBase.pas' {frmMainQueryBase},
  fBlobs in 'fBlobs.pas' {frmBlobs};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBlobs, frmBlobs);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.CreateForm(TfrmMainQueryBase, frmMainQueryBase);
  Application.Run;
end.
