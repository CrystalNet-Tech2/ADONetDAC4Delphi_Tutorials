unit fGetFieldNames;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fVistaDBMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.VistaDBEventArgs, StdCtrls, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.VistaDB, Buttons, ExtCtrls;

type
  TfrmGetFieldNames = class(TfrmVistaDBMainCompBase)
    pnl2: TPanel;
    lbl4: TLabel;
    lstTables: TListBox;
    lstFields: TListBox;
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
  VistaDBConnection1.GetTableNames(lstTables.Items);
  lstTables.ItemIndex := 0;
  lstTablesClick(Sender);
end;

procedure TfrmGetFieldNames.lstTablesClick(Sender: TObject);
begin
  with lstTables do
    VistaDBConnection1.GetFieldNames(Items[ItemIndex], lstFields.Items);
end;

end.
