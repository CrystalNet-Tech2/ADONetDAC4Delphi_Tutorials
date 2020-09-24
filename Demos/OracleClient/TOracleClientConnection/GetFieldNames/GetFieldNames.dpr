program GetFieldNames;

uses
  Forms,
  fGetFieldNames in 'fGetFieldNames.pas' {frmGetFieldNames},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmGetFieldNames, frmGetFieldNames);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
