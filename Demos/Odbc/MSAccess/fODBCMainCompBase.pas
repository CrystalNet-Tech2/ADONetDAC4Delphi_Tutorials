unit fODBCMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.Odbc, Buttons;

type
  TfrmODBCMainCompBase = class(TForm)
    pnlTitle: TPanel;
    bvlTitle: TBevel;
    lblTitle: TLabel;
    pnlMain: TPanel;
    pnlButtons: TPanel;
    bvlButtons: TBevel;
    btnClose: TButton;
    pnl1: TPanel;
    pnlConnDef: TPanel;
    imgConnect: TImage;
    lbl2: TLabel;
    lbl3: TLabel;
    btnOpen: TSpeedButton;
    lbl1: TLabel;
    edtDB: TEdit;
    edtPwd: TEdit;
    btnConnect: TButton;
    edtUid: TEdit;
    bvl1: TBevel;
    OdbcConnection1: TOdbcConnection;
    dlgOpen: TOpenDialog;
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
  frmODBCMainCompBase: TfrmODBCMainCompBase;

implementation

{$R *.dfm}

uses ADONetUtils;

procedure TfrmODBCMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmODBCMainCompBase.btnConnectClick(Sender: TObject);
begin
  if edtDB.Text = '' then
    Abort;

  with OdbcConnection1 do
  begin
    Close;
    with Params do
    begin
      Driver := 'Microsoft Access Driver (*.mdb)';
      Item['Dbq'] := edtDB.Text;
      UserID := edtUid.Text;
      Password := edtPwd.Text;
    end;
    Open;
  end;
end;

procedure TfrmODBCMainCompBase.btnOpenClick(Sender: TObject);
begin
  dlgOpen.FileName := edtDB.Text;
  if dlgOpen.Execute then
    edtDB.Text := dlgOpen.FileName;
end;

procedure TfrmODBCMainCompBase.FormCreate(Sender: TObject);
begin
  edtDB.Text := '';
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetMSAccessDBFile;
end;

end.




