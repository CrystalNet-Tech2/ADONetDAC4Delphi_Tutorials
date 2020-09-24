program Meta_Indices;

uses
  Forms,
  fSQLMainCompBase in '..\..\fSQLMainCompBase.pas' {frmSQLMainCompBase},
  fMetaIndices in 'fMetaIndices.pas' {frmMetaIndices};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaIndices, frmMetaIndices);
  Application.CreateForm(TfrmSQLMainCompBase, frmSQLMainCompBase);
  Application.Run;
end.
