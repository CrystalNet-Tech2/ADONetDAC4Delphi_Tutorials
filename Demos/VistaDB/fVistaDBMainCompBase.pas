unit fVistaDBMainCompBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.Client, Buttons, CNClrLib.ADONet.VistaDBEventArgs, DB,
  CNClrLib.ADONet.VistaDB;

type
  TfrmVistaDBMainCompBase = class(TForm)
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
    VistaDBConnection1: TVistaDBConnection;
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
  frmVistaDBMainCompBase: TfrmVistaDBMainCompBase;

implementation

{$R *.dfm}

uses ADONetUtils;

procedure TfrmVistaDBMainCompBase.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVistaDBMainCompBase.btnConnectClick(Sender: TObject);
begin
  if edtDB.Text = '' then
    Exit;

  with VistaDBConnection1 do
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

procedure TfrmVistaDBMainCompBase.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edtDB.Text := dlgOpen.FileName;
end;

procedure TfrmVistaDBMainCompBase.FormCreate(Sender: TObject);
begin
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetVistaDBFile;
end;

end.




