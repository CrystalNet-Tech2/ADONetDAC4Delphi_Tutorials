unit fMetaTables;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls;

type
  TfrmMetaTables = class(TfrmSQLMainCompBase)
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
  SqlClientConnection1.GetTableNames(cbTable.Items);
  btnFetch.Enabled := True;
end;

procedure TfrmMetaTables.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    SqlClientConnection1.GetTableNames(mmoConsole.Lines)
  else
    SqlClientConnection1.GetFieldNames(cbTable.Text, mmoConsole.Lines);

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
