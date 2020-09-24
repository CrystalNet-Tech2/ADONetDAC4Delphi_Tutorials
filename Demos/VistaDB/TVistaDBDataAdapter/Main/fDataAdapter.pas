unit fDataAdapter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fVistaDBMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.VistaDBEventArgs, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.VistaDB, DB, DBCtrls, Grids, DBGrids, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmDataAdapter = class(TfrmVistaDBMainCompBase)
    pnl2: TPanel;
    dbgrd1: TDBGrid;
    dbnvgr1: TDBNavigator;
    ClrMemTable1: TClrMemTable;
    ds1: TDataSource;
    btnApplyChanges: TButton;
    btnRejectChanges: TButton;
    VistaDBDataAdapter1: TVistaDBDataAdapter;
    VistaDBCommand1: TVistaDBCommand;
    procedure FormCreate(Sender: TObject);
    procedure btnConnectClick(Sender: TObject);
    procedure btnApplyChangesClick(Sender: TObject);
    procedure btnRejectChangesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataAdapter: TfrmDataAdapter;

implementation

{$R *.dfm}

procedure TfrmDataAdapter.btnApplyChangesClick(Sender: TObject);
begin
  ClrMemTable1.ApplyUpdates;
end;

procedure TfrmDataAdapter.btnConnectClick(Sender: TObject);
begin
  VistaDBCommand1.Cancel;
  ClrMemTable1.Active := False;
  inherited;
  ClrMemTable1.Active := True;
end;

procedure TfrmDataAdapter.btnRejectChangesClick(Sender: TObject);
begin
  ClrMemTable1.CancelUpdates;
end;

procedure TfrmDataAdapter.FormCreate(Sender: TObject);
begin
  inherited;
  // Following settings you can make at design time
  // Select command
  VistaDBCommand1.CommandText.Text := 'select * from Customers';
end;

end.
