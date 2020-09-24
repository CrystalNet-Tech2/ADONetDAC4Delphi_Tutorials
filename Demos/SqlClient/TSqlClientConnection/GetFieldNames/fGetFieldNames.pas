unit fGetFieldNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, StdCtrls,
  DB, CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error;

type
  TfrmGetFieldNames = class(TfrmSQLMainCompBase)
    pnl2: TPanel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lstTables: TListBox;
    lstFields: TListBox;
    lstKeyFields: TListBox;
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
  SqlClientConnection1.GetTableNames(lstTables.Items);
  lstTables.ItemIndex := 0;
  lstTablesClick(Sender);
end;

procedure TfrmGetFieldNames.lstTablesClick(Sender: TObject);
begin
  with lstTables do
  begin
    if ItemIndex > -1 then
    begin
      SqlClientConnection1.GetFieldNames(Items[ItemIndex], lstFields.Items);
      SqlClientConnection1.GetPrimaryKeyFieldNames(Items[ItemIndex], '', lstKeyFields.Items);
    end;
  end
end;

end.
