unit fMetaIndices;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fVistaDBMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.VistaDBEventArgs, StdCtrls, ExtCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.VistaDB, Buttons;

type
  TfrmMetaIndices = class(TfrmVistaDBMainCompBase)
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
  VistaDBConnection1.GetTableNames(cbTableNames.Items);
  btnFetch.Enabled := True;
end;

procedure TfrmMetaIndices.btnFetchClick(Sender: TObject);
begin
  if rgMain.ItemIndex = 0 then
    VistaDBConnection1.GetIndexes(cbTableNames.Text, mmoConsole.Lines)
  else
    VistaDBConnection1.GetIndexFieldNames(cbTableNames.Text, lbledtIndexName.Text, mmoConsole.Lines);

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
