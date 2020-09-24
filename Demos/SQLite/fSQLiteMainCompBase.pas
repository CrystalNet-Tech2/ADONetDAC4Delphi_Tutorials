unit fSQLiteMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.Odbc, Buttons, CNClrLib.ADONet.SQLiteEventArgs,
  CNClrLib.ADONet.SQLite;

type
  TfrmSQLiteMainCompBase = class(TForm)
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
    edtDB: TEdit;
    edtPwd: TEdit;
    btnConnect: TButton;
    bvl1: TBevel;
    dlgOpen: TOpenDialog;
    SQLiteConnection1: TSQLiteConnection;
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
  frmSQLiteMainCompBase: TfrmSQLiteMainCompBase;

implementation

{$R *.dfm}

uses ADONetUtils;

procedure TfrmSQLiteMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSQLiteMainCompBase.btnConnectClick(Sender: TObject);
begin
  if edtDB.Text = '' then
    Exit;

  with SQLiteConnection1 do
  begin
    Close;
    // create temporary connection definition
    with Params do
    begin
      DataSource := edtDB.Text;
      Password := edtPwd.Text;
    end;
    Open;
  end;
end;

procedure TfrmSQLiteMainCompBase.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edtDB.Text := dlgOpen.FileName;
end;

procedure TfrmSQLiteMainCompBase.FormCreate(Sender: TObject);
begin
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetSQLiteFile;
end;

end.




