unit fORACLEMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls, CNClrLib.ADONet.EventArgs, DB,
  CNClrLib.ADONet.Client, CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error,
  CNClrLib.ADONet.OracleEventArgs, CNClrLib.ADONet.OracleClient;

type
  TfrmORACLEMainCompBase = class(TForm)
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
    lbl1: TLabel;
    edtServer: TEdit;
    edtDB: TEdit;
    btnConnect: TButton;
    edtPass: TEdit;
    bvl1: TBevel;
    OracleClientConnection1: TOracleClientConnection;
    procedure btnConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmORACLEMainCompBase: TfrmORACLEMainCompBase;

implementation

{$R *.dfm}

procedure TfrmORACLEMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmORACLEMainCompBase.btnConnectClick(Sender: TObject);
begin
  if (edtServer.Text = '') or (edtDB.Text = '') then
    Abort;

  with OracleClientConnection1 do
  begin
    Close;
    // create temporary connection definition
    with Params do begin
      DataSource := edtServer.Text;
      UserID := edtDB.Text;
      Password := edtPass.Text;
    end;
    Open;
  end;
end;

end.
