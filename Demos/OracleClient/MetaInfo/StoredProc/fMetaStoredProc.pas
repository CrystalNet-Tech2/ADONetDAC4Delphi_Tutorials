unit fMetaStoredProc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, StdCtrls, ExtCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.OracleClient;

type
  TfrmMetaStoredProc = class(TfrmORACLEMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    btnFetch: TButton;
    rgMain: TRadioGroup;
    lbledtProcName: TLabeledEdit;
    mmoInfo: TMemo;
    mmoConsole: TMemo;
    procedure btnConnectClick(Sender: TObject);
    procedure btnFetchClick(Sender: TObject);
    procedure rgMainClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMetaStoredProc: TfrmMetaStoredProc;

implementation

{$R *.dfm}

procedure TfrmMetaStoredProc.btnConnectClick(Sender: TObject);
begin
  btnFetch.Enabled := False;
  inherited;
  btnFetch.Enabled := True;
end;

procedure TfrmMetaStoredProc.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    OracleClientConnection1.GetProcedureNames(mmoConsole.Lines)
  else if rgMain.ItemIndex = 1 then
    OracleClientConnection1.GetProcedureParameterNames(lbledtProcName.Text, mmoConsole.Lines);

  mmoConsole.Lines.Insert(0, 'Meta info of Packages and StoredProcedures');
  mmoConsole.Lines.Insert(1, '');
end;

procedure TfrmMetaStoredProc.rgMainClick(Sender: TObject);
begin
  if rgMain.ItemIndex < 1 then
  begin
    lbledtProcName.Enabled := False;
    lbledtProcName.Text := '';
  end
  else
    lbledtProcName.Enabled := True;
end;

end.
