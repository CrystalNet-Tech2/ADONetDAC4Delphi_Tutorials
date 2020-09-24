
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
  CNClrLib.ADONet.SQLiteEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SQLite, DBCtrls;

type
  TfrmGettingStarted = class(TForm)
    pnlTitle: TPanel;
    pnlMain: TPanel;
    lblTitle: TLabel;
    bvlTitle: TBevel;
    dsOrders: TDataSource;
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
    SQLiteConnection1: TSQLiteConnection;
    SQLiteQueryCustomers: TSQLiteQuery;
    SQLiteQueryOrders: TSQLiteQuery;
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
    SQLiteQueryCustomers.Open;
    SQLiteQueryOrders.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not SQLiteConnection1.Connected then
    Exit;

  // Get a scalar value from DB
  iID := SQLiteConnection1.ExecuteScalar('select Count(id) from customer');

  // Insert a record
  Inc(iID);
  SQLiteConnection1.ExecuteNonQuery('insert into customer(id, CompanyName, Country) ' +
                 'values(:P, :N, :D)', [iID, 'New Company', 'New Country']);
  SQLiteQueryCustomers.Refresh;

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
  if not SQLiteConnection1.Connected then
    Exit;
  // Update records
  SQLiteConnection1.ExecuteNonQuery('update [Order] set Freight = Freight * :P1 + :P2 ' +
                 'where ShipVia = 3', [Random(5), Random(3)]);
  SQLiteQueryOrders.Refresh;
end;

procedure TfrmGettingStarted.FormCreate(Sender: TObject);
begin
  if TADONetUtility.IsAppDirectoryExist then
    edtDB.Text := TADONetUtility.GetSQLiteFile;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not SQLiteConnection1.Connected then
    Exit;
  // Delete a record
  SQLiteConnection1.ExecuteNonQuery('delete from customer where CompanyName like :N',
    ['New Company']);
  SQLiteQueryCustomers.Refresh;
end;

end.
