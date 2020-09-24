unit fSQLMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.EventArgs, CNClrLib.ADONet.SqlEventArgs, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.SqlClient, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error;

type
  TfrmSQLMainCompBase = class(TForm)
    pnlTitle: TPanel;
    bvlTitle: TBevel;
    lblTitle: TLabel;
    pnlMain: TPanel;
    pnlConnDef: TPanel;
    imgConnect: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    edtServer: TEdit;
    edtDB: TEdit;
    btnConnect: TButton;
    pnlButtons: TPanel;
    bvlButtons: TBevel;
    btnClose: TButton;
    pnl1: TPanel;
    SqlClientConnection1: TSqlClientConnection;
    procedure btnConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSQLMainCompBase: TfrmSQLMainCompBase;

implementation

{$R *.dfm}

procedure TfrmSQLMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmSQLMainCompBase.btnConnectClick(Sender: TObject);
begin
  if (edtServer.Text = '') or (edtDB.Text = '') then
    Abort;

  with SqlClientConnection1 do
  begin
    Close;
    // create temporary connection definition
    with Params do begin
      DataSource := edtServer.Text;
      InitialCatalog := edtDB.Text;
      IntegratedSecurity := True;
    end;
    Open;
  end;
end;

end.
