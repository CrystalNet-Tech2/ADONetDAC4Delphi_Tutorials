unit fGetFieldNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fORACLEMainCompBase,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, StdCtrls, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.OracleClient, ExtCtrls;

type
  TfrmGetFieldNames = class(TfrmORACLEMainCompBase)
    pnl2: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    lstTables: TListBox;
    lstFields: TListBox;
    lstKeyFields: TListBox;
    lbl6: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure lstTablesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmGetFieldNames: TfrmGetFieldNames;

implementation

{$R *.dfm}

procedure TfrmGetFieldNames.btnConnectClick(Sender: TObject);
begin
  inherited;
  OracleClientConnection1.GetTableNames(lstTables.Items);
  lstTables.ItemIndex := 0;
  lstTablesClick(Sender);
end;

procedure TfrmGetFieldNames.lstTablesClick(Sender: TObject);
begin
  with lstTables do
  begin
    OracleClientConnection1.GetFieldNames(Items[ItemIndex], lstFields.Items);
    OracleClientConnection1.GetKeyFieldNames(Items[ItemIndex], lstKeyFields.Items);
  end
end;

end.
