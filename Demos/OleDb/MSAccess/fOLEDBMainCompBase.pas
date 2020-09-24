unit fOLEDBMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  DB, CNClrLib.ADONet.Client, Buttons, CNClrLib.ADONet.OleDbEventArgs,
  CNClrLib.ADONet.OleDb;

type
  TfrmOLEDBMainCompBase = class(TForm)
    pnlTitle: TPanel;
    bvlTitle: TBevel;
    lblTitle: TLabel;
    pnlMain: TPanel;
    pnlButtons: TPanel;
    bvlButtons: TBevel;
    btnClose: TButton;
    pnl1: TPanel;
    bvl1: TBevel;
    pnlConnDef: TPanel;
    imgConnect: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    btnOpen: TSpeedButton;
    edtDB: TEdit;
    edtPwd: TEdit;
    btnConnect: TButton;
    dlgOpen: TOpenDialog;
    OleDbConnection1: TOleDbConnection;
    procedure btnConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOLEDBMainCompBase: TfrmOLEDBMainCompBase;

implementation

{$R *.dfm}

uses ADONetUtils;

procedure TfrmOLEDBMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmOLEDBMainCompBase.btnConnectClick(Sender: TObject);
begin
  if edtDB.Text = '' then
    Abort;

  with OleDbConnection1 do
  begin
    Close;
    Provider := 'Microsoft.Jet.OLEDB.4.0';
    with Params do
    begin
      DataSource := edtDB.Text;
      if edtPwd.Text <> '' then
        ConnectionString := ConnectionString +';Jet OLEDB:Database Password='+edtPwd.Text;
    end;
    Open;
  end;
end;

procedure TfrmOLEDBMainCompBase.btnOpenClick(Sender: TObject);
begin
  dlgOpen.FileName := edtDB.Text;
  if dlgOpen.Execute then
    edtDB.Text := dlgOpen.FileName;
end;

procedure TfrmOLEDBMainCompBase.FormCreate(Sender: TObject);
begin
  edtDB.Text := '';
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetMSAccessDBFile;
end;

end.
