unit fMetaTables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, StdCtrls, ExtCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.OracleClient;

type
  TfrmMetaTables = class(TfrmORACLEMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    btnFetch: TButton;
    rgMain: TRadioGroup;
    mmoInfo: TMemo;
    cbTable: TComboBox;
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
  frmMetaTables: TfrmMetaTables;

implementation

{$R *.dfm}

procedure TfrmMetaTables.btnConnectClick(Sender: TObject);
begin
  btnFetch.Enabled := False;
  inherited;
  OracleClientConnection1.GetTableNames(cbTable.Items);
  btnFetch.Enabled := True;
end;

procedure TfrmMetaTables.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    OracleClientConnection1.GetTableNames(mmoConsole.Lines)
  else
    OracleClientConnection1.GetFieldNames(cbTable.Text, mmoConsole.Lines);

  mmoConsole.Lines.Insert(0, 'Meta info of tables');
  mmoConsole.Lines.Insert(1, '');
end;

procedure TfrmMetaTables.rgMainClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
  begin
    cbTable.Enabled := False;
    cbTable.Text := '';
  end
  else
    cbTable.Enabled := True;
end;

end.
