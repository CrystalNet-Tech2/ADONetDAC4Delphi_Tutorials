
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
  Dialogs, DB, ComCtrls, Buttons, ExtCtrls, StdCtrls, Grids,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.OracleEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.OracleClient, DBCtrls, DBGrids;

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
    dsCategories: TDataSource;
    nvgCategories: TDBNavigator;
    nvgProducts: TDBNavigator;
    edtServer: TEdit;
    Label4: TLabel;
    edtDB: TEdit;
    btnConnect: TButton;
    pnlMisc: TPanel;
    btnUpdate: TButton;
    btnInsert: TButton;
    btnDelete: TButton;
    lbl1: TLabel;
    edtPass: TEdit;
    OracleClientConnection1: TOracleClientConnection;
    OracleClientQueryCategories: TOracleClientQuery;
    OracleClientQueryProducts: TOracleClientQuery;
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
    OracleClientQueryCategories.Open;
    OracleClientQueryProducts.Open;
  end;
end;

procedure TfrmGettingStarted.btnInsertClick(Sender: TObject);
var
  iID: Integer;
begin
  if not OracleClientConnection1.Connected then
    Exit;
  // Insert a record
  OracleClientConnection1.ExecuteNonQuery('insert into Categories(CategoryName, Description) ' +
                 'values(:N, :D)', ['New category', 'New description']);
  OracleClientQueryCategories.Refresh;

  // Get a scalar value from DB
  iID := OracleClientConnection1.ExecuteScalar('select MAX(CategoryID) from Categories');
  sbMain.SimpleText := 'Last CategoryID = ' + IntToStr(iID);
end;

procedure TfrmGettingStarted.btnUpdateClick(Sender: TObject);
begin
  if not OracleClientConnection1.Connected then
    Exit;
  // Update records
  OracleClientConnection1.ExecuteNonQuery('update Products set UnitPrice = UnitPrice * :P1 + :P2 ' +
                 'where ProductID < 3', [Random(5), Random(3)]);
  OracleClientQueryProducts.Refresh;
end;

procedure TfrmGettingStarted.btnDeleteClick(Sender: TObject);
begin
  if not OracleClientConnection1.Connected then
    Exit;
  // Delete a record
  OracleClientConnection1.ExecuteNonQuery('delete from Categories where CategoryName like :N',
    ['New category']);
  OracleClientQueryCategories.Refresh;
end;

end.
