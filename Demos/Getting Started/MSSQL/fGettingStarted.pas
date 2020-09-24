
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
  CNClrLib.ADONet.SqlEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, DBCtrls;

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
    Splitter1: TSplitter;
    grdProducts: TDBGrid;
    dsCategories: TDataSource;
    nvgCategories: TDBNavigator;
    nvgProducts: TDBNavigator;
    pnlMisc: TPanel;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    SqlClientConnection1: TSqlClientConnection;
    SqlClientQueryCategories: TSqlClientQuery;
    SqlClientQueryProducts: TSqlClientQuery;
    pnlConnDef: TPanel;
    imgConnect: TImage;
    lbl1: TLabel;
    lbl2: TLabel;
    edtServer: TEdit;
    edtDB: TEdit;
    btnConnect: TButton;
    procedure btnConnectClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnUpdateClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  end;

var
  frmGettingStarted: TfrmGettingStarted;

implementation

{$R *.dfm}

procedure TfrmGettingStarted.btnConnectClick(Sender: TObject);
begin
  if (edtServer.Text = '') or (edtDB.Text = '') then
    Exit;

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
    SqlClientQueryCategories.Open;
    SqlClientQueryProducts.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not SqlClientConnection1.Connected then
    Exit;
  // Insert a record
  SqlClientConnection1.ExecuteNonQuery('insert into Categories(CategoryName, Description) ' +
                 'values(:N, :D)', ['New category', 'New description']);
  SqlClientQueryCategories.Refresh;

  // Get a scalar value from DB
  iID := SqlClientConnection1.ExecuteScalar('select MAX(CategoryID) from Categories');
  sbMain.SimpleText := 'Last CategoryID = ' + IntToStr(iID);
end;

procedure TfrmGettingStarted.btnUpdateClick(Sender: TObject);
begin
  if not SqlClientConnection1.Connected then
    Exit;
  // Update records
  SqlClientConnection1.ExecuteNonQuery('update Products set UnitPrice = UnitPrice * :P1 + :P2 ' +
                 'where ProductID < 3', [Random(5), Random(3)]);
  SqlClientQueryProducts.Refresh;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not SqlClientConnection1.Connected then
    Exit;
  // Delete a record
  SqlClientConnection1.ExecuteNonQuery('delete from Categories where CategoryName like :N',
    ['New category']);
  SqlClientQueryCategories.Refresh;
end;

end.
