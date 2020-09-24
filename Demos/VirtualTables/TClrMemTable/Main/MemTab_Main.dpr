program MemTab_Main;

uses
  Forms,
  fMainDemo in 'fMainDemo.pas' {frmMainDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMainDemo, frmMainDemo);
  Application.Run;
end.
