program GetFieldNames;

uses
  Forms,
  fGetFieldNames in 'fGetFieldNames.pas' {frmGetFieldNames},
  ADONetUtils in '..\..\..\Utils\ADONetUtils.pas',
  fVistaDBMainCompBase in '..\..\fVistaDBMainCompBase.pas' {frmVistaDBMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGetFieldNames, frmGetFieldNames);
  Application.CreateForm(TfrmVistaDBMainCompBase, frmVistaDBMainCompBase);
  Application.Run;
end.
