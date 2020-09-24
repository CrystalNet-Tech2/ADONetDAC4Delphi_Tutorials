unit fMechanism;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  CNClrLib.ADONet.Enums, CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.Client;

type
  TfrmMechanism = class(TForm)
    pnlTitle: TPanel;
    bvlTitle: TBevel;
    imgAnyDAC: TImage;
    lblTitle: TLabel;
    pnlMain: TPanel;
    pnlConnection: TPanel;
    btnCreateTable: TButton;
    btnCreateView: TButton;
    btnPrint: TButton;
    mmoConsole: TMemo;
    pnlButtons: TPanel;
    bvlButtons: TBevel;
    btnClose: TButton;
    ClrDataTable1: TClrDataTable;
    procedure btnCreateTableClick(Sender: TObject);
    procedure btnCreateViewClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
  private
    FDefaultView: _DataView;
  public
    { Public declarations }
  end;

var
  frmMechanism: TfrmMechanism;

implementation

{$R *.dfm}
uses
  uDatSUtils, CNClrLib.ADONetWrapper.Host, CNClrLib.ADONetWrapper.EnumTypes;


procedure TfrmMechanism.btnCreateTableClick(Sender: TObject);
var
  i: Integer;
  m_row: _DataRow;
begin
  // Setup DataTable
  ClrDataTable1.TableName := 'Table1';
  with ClrDataTable1.Columns do
  begin
    Add_2('id', TClrAssembly.GetType(tcInt32));
    Add_3('name').MaxLength := 15;
    Add_2('price1', TClrAssembly.GetType(tcDecimal));
    Add_2('price2', TClrAssembly.GetType(tcDecimal));
    Add_2('Expr', TClrAssembly.GetType(tcDecimal));
  end;

  // populate table
  for i := 0 to 6 do
  begin
    m_row := ClrDataTable1.NewRow;
    m_row[0] := i;
    m_row[1] := 'thing' + IntToStr(6 - i);
    m_row[2] := 20 + i;
    m_row[3] := 20 - i;
    m_row[4] := 0;
    ClrDataTable1.Rows.Add(m_row);
  end;

  btnCreateTable.Enabled := False;
  btnCreateView.Enabled := True;
end;

procedure TfrmMechanism.btnCreateViewClick(Sender: TObject);
begin
  FDefaultView := ClrDataTable1.DefaultDataView;
  btnPrint.Enabled := True;
end;

procedure TfrmMechanism.btnPrintClick(Sender: TObject);
begin
  // 1) Default view
  PrintRows(ClrDataTable1.DataTable, mmoConsole.Lines, 'Our table...');
  PrintRows(FDefaultView, mmoConsole.Lines, 'Default view...');

  // 2) first way - set view property
  FDefaultView.Sort := 'name';
  PrintRows(FDefaultView, mmoConsole.Lines, 'Default view with sort [name]...');

  // 3) using expression
  ClrDataTable1.Columns.Item_1['Expr'].Expression := 'price2 - price1';
  PrintRows(FDefaultView, mmoConsole.Lines, 'Add Expression mechanism [price2 - price1]...');
  ClrDataTable1.Columns.Item_1['Expr'].Expression := '';

  // 4) filtering
  FDefaultView.RowFilter := 'id > 5';
  PrintRows(FDefaultView, mmoConsole.Lines, 'add filter [id > 5]....');
end;

end.
