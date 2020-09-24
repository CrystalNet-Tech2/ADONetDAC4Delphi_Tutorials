program Mechanism;

uses
  Forms,
  fMechanism in 'fMechanism.pas' {frmMechanism},
  uDatSUtils in '..\..\uDatSUtils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMechanism, frmMechanism);
  Application.Run;
end.
