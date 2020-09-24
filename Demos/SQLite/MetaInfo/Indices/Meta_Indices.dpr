program Meta_Indices;

uses
  Forms,
  fMetaIndices in 'fMetaIndices.pas' {frmMetaIndices},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fSQLiteMainCompBase in '..\..\fSQLiteMainCompBase.pas' {frmSQLiteMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaIndices, frmMetaIndices);
  Application.CreateForm(TfrmSQLiteMainCompBase, frmSQLiteMainCompBase);
  Application.Run;
end.
