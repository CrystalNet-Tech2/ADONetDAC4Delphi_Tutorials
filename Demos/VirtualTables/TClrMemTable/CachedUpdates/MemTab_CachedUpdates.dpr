program MemTab_CachedUpdates;

uses
  Forms,
  fSQLMainCompBase in '..\..\..\SqlClient\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fCachedUpdates in 'fCachedUpdates.pas' {frmCachedUpdates};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCachedUpdates, frmCachedUpdates);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.Run;
end.
