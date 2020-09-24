
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
  CNClrLib.ADONet.OleDbEventArgs, CNClrLib.ADONet.Client, CNClrLib.ADONet.OleDb,
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
    OleDbConnection1: TOleDbConnection;
    OleDbQueryCustomers: TOleDbQuery;
    OleDbQueryOrders: TOleDbQuery;
    procedure btnConnectClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnOpenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

  with OleDbConnection1 do
  begin
    Close;
    Provider := 'Microsoft.Jet.OLEDB.4.0';
    // create temporary connection definition
    with Params do
    begin
      DataSource := edtDB.Text;
      if edtPwd.Text <> '' then
        ConnectionString := ConnectionString +';Jet OLEDB:Database Password='+edtPwd.Text;
    end;
    Open;
    OleDbQueryCustomers.Open;
    OleDbQueryOrders.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not OleDbConnection1.Connected then
    Exit;

  // Get a scalar value from DB
  iID := OleDbConnection1.ExecuteScalar('select MAX(CustNo) from customer');

  // Insert a record
  Inc(iID);
  OleDbConnection1.ExecuteNonQuery('insert into customer(CustNo, Company, Country) ' +
                 'values(:P, :N, :D)', [iID, 'New Company', 'New Country']);
  OleDbQueryCustomers.Refresh;

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
  if not OleDbConnection1.Connected then
    Exit;
  // Update records
  OleDbConnection1.ExecuteNonQuery('update Orders set AmountPaid = AmountPaid * :P1 + :P2 ' +
                 'where OrderNo < 1100', [Random(5), Random(3)]);
  OleDbQueryOrders.Refresh;
end;

procedure TfrmGettingStarted.FormCreate(Sender: TObject);
begin
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetMSAccessDBFile;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not OleDbConnection1.Connected then
    Exit;
  // Delete a record
  OleDbConnection1.ExecuteNonQuery('delete from customer where Company like :N',
    ['New Company']);
  OleDbQueryCustomers.Refresh;
end;

end.
