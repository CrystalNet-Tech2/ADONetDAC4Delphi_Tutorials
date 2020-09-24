program Meta_StoredProc;

uses
  Forms,
  fMetaStoredProc in 'fMetaStoredProc.pas' {frmMetaStoredProc},
  fORACLEMainCompBase in '..\..\fORACLEMainCompBase.pas' {frmORACLEMainCompBase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMetaStoredProc, frmMetaStoredProc);
  Application.CreateForm(TfrmORACLEMainCompBase, frmORACLEMainCompBase);
  Application.Run;
end.
