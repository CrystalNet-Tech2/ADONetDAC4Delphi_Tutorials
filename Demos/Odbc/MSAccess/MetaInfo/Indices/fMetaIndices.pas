unit fMetaIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fODBCMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, StdCtrls, ExtCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.Odbc, Buttons;

type
  TfrmMetaIndices = class(TfrmODBCMainCompBase)
    pnl2: TPanel;
    pnlConnection: TPanel;
    btnFetch: TButton;
    rgMain: TRadioGroup;
    lbledtIndexName: TLabeledEdit;
    mmoInfo: TMemo;
    mmoConsole: TMemo;
    cbTableNames: TComboBox;
    lbl4: TLabel;
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
  OdbcConnection1.GetTableNames(cbTableNames.Items);
  btnFetch.Enabled := True;
end;

procedure TfrmMetaIndices.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    OdbcConnection1.GetIndexes(cbTableNames.Text, mmoConsole.Lines)
  else
    OdbcConnection1.GetIndexFieldNames(cbTableNames.Text, lbledtIndexName.Text, mmoConsole.Lines);

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
