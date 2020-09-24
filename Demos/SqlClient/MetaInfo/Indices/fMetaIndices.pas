unit fMetaIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls;

type
  TfrmMetaIndices = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    btnFetch: TButton;
    rgMain: TRadioGroup;
    lbledtIndexName: TLabeledEdit;
    lbledtTableName: TLabeledEdit;
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
  frmMetaIndices: TfrmMetaIndices;

implementation

{$R *.dfm}

procedure TfrmMetaIndices.btnConnectClick(Sender: TObject);
begin
  btnFetch.Enabled := False;
  inherited;
  btnFetch.Enabled := True;
end;

procedure TfrmMetaIndices.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    SqlClientConnection1.GetIndexes(lbledtTableName.Text, mmoConsole.Lines)
  else
    SqlClientConnection1.GetIndexFieldNames(lbledtTableName.Text, lbledtIndexName.Text, mmoConsole.Lines);

  mmoConsole.Lines.Insert(0, 'Meta info about indices');
  mmoConsole.Lines.Insert(1, '');
end;

procedure TfrmMetaIndices.rgMainClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    lbledtIndexName.Enabled := False
  else
    lbledtIndexName.Enabled := True;
end;

end.
