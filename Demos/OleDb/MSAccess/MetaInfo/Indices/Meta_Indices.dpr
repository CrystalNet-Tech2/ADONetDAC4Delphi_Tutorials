program Meta_Indices;

uses
  Forms,
  fMetaIndices in 'fMetaIndices.pas' {frmMetaIndices},
  ADONetUtils in '..\..\..\..\Utils\ADONetUtils.pas',
  fOLEDBMainCompBase in '..\..\fOLEDBMainCompBase.pas' {frmOLEDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaIndices, frmMetaIndices);
  Application.CreateForm(TfrmOLEDBMainCompBase, frmOLEDBMainCompBase);
  Application.Run;
end.
