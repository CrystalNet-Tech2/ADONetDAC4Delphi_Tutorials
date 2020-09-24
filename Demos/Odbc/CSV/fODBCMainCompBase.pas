unit fODBCMainCompBase;

{$WARN UNIT_PLATFORM OFF}

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

uses ADONetUtils, FileCtrl, CNClrLib.Core, CNClrLib.Host;

const
  SELDIRHELP = 1000;

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
      Driver := 'Microsoft Text Driver (*.txt; *.csv)';
      Item['Dbq'] := edtDB.Text;
      UserID := edtUid.Text;
      Password := edtPwd.Text;
    end;
    Open;
  end;
end;

procedure TfrmODBCMainCompBase.btnOpenClick(Sender: TObject);
const
  folderBrowserDlgTypeName = 'System.Windows.Forms.FolderBrowserDialog';
var
  folderBrowserDlg: _ClrObject;
begin
  folderBrowserDlg := TClrActivator.ClrCreateInstance(folderBrowserDlgTypeName);
  try
    folderBrowserDlg.SetPropertyValue('ShowNewFolderButton', False);
    folderBrowserDlg.SetPropertyValue('SelectedPath', edtDB.Text);
    if folderBrowserDlg.InvokeMethod('ShowDialog') = 1 {DialogResult.OK} then
      edtDB.Text := folderBrowserDlg.GetPropertyValue('SelectedPath');
  finally
    folderBrowserDlg := nil;
  end;
end;

procedure TfrmODBCMainCompBase.FormCreate(Sender: TObject);
begin
  edtDB.Text := '';
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetCSVDataFileLocation;
end;

end.




