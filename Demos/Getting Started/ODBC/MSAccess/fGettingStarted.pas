
//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc. 
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------
unit fGettingStarted;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids, DBGrids,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OdbcEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONet.Odbc,
  DBCtrls;

type
  TfrmGettingStarted = class(TForm)
    pnlTitle: TPanel;
    pnlMain: TPanel;
    lblTitle: TLabel;
    bvlTitle: TBevel;
    dsProducts: TDataSource;
    grdCategories: TDBGrid;
    pnlSubPageControl: TPanel;
    sbMain: TStatusBar;
    imgConnect: TImage;
    pnlConnDef: TPanel;
    Label2: TLabel;
    Splitter1: TSplitter;
    grdProducts: TDBGrid;
    dsCustomers: TDataSource;
    nvgCategories: TDBNavigator;
    nvgProducts: TDBNavigator;
    edtDB: TEdit;
    Label4: TLabel;
    edtPwd: TEdit;
    btnConnect: TButton;
    pnlMisc: TPanel;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    btnOpen: TSpeedButton;
    dlgOpen: TOpenDialog;
    OdbcQueryOrders: TOdbcQuery;
    OdbcQueryCustomers: TOdbcQuery;
    OdbcConnection1: TOdbcConnection;
    edtUid: TEdit;
    lbl1: TLabel;
    procedure btnConnectClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

uses
  ADONetUtils;

{$R *.dfm}

procedure TfrmGettingStarted.btnConnectClick(Sender: TObject);
begin
  if edtDB.Text = '' then
    Exit;

  with OdbcConnection1 do
  begin
    Close;
    // create temporary connection definition
    with Params do
    begin
      Driver := 'Microsoft Access Driver (*.mdb)';
      Item['Dbq'] := edtDB.Text;
      UserID := edtUid.Text;
      Password := edtPwd.Text;
    end;
    Open;
    OdbcQueryCustomers.Open;
    OdbcQueryOrders.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not OdbcConnection1.Connected then
    Exit;

  // Get a scalar value from DB
  iID := OdbcConnection1.ExecuteScalar('select MAX(CustNo) from customer');

  // Insert a record
  Inc(iID);
  OdbcConnection1.ExecuteNonQuery('insert into customer(CustNo, Company, Country) ' +
                 'values(:P, :N, :D)', [iID, 'New Company', 'New Country']);
  OdbcQueryCustomers.Refresh;

  // Get a scalar value from DB
  sbMain.SimpleText := 'Last CustomerNumber = ' + IntToStr(iID);
end;

procedure TfrmGettingStarted.btnOpenClick(Sender: TObject);
begin
  if dlgOpen.Execute then
    edtDB.Text := dlgOpen.FileName;
end;

procedure TfrmGettingStarted.btnUpdateClick(Sender: TObject);
begin
  if not OdbcConnection1.Connected then
    Exit;
  // Update records
  OdbcConnection1.ExecuteNonQuery('update Orders set AmountPaid = AmountPaid * :P1 + :P2 ' +
                 'where OrderNo < 1100', [Random(5), Random(3)]);
  OdbcQueryOrders.Refresh;
end;

procedure TfrmGettingStarted.FormCreate(Sender: TObject);
begin
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetMSAccessDBFile;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not OdbcConnection1.Connected then
    Exit;
  // Delete a record
  OdbcConnection1.ExecuteNonQuery('delete from customer where Company like :N',
    ['New Company']);
  OdbcQueryCustomers.Refresh;
end;

end.
