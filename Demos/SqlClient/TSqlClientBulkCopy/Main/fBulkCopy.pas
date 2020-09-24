unit fBulkCopy;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, fSQLMainCompBase, CNClrLib.ADONet.Enums,
  CNClrLib.ADONet.Error, CNClrLib.ADONet.EventArgs,
  CNClrLib.ADONet.SqlEventArgs, DB, CNClrLib.ADONet.Client,
  CNClrLib.ADONet.SqlClient, StdCtrls, ExtCtrls, ComCtrls,
  CNClrLib.ADONet.OdbcEventArgs, CNClrLib.ADONet.Odbc,
  CNClrLib.ADONet.OleDbEventArgs, CNClrLib.ADONet.OleDb;

type
  TfrmBulkCopy = class(TfrmSQLMainCompBase)
    SqlClientBulkCopy1: TSqlClientBulkCopy;
    pnl2: TPanel;
    btnCopyData: TButton;
    mmoLog: TMemo;
    rgSourceData: TRadioGroup;
    mmoInfo: TMemo;
    SqlClientQuery1: TSqlClientQuery;
    SqlClientDataReader1: TSqlClientDataReader;
    OdbcConnectionExcel: TOdbcConnection;
    OdbcQueryExcel: TOdbcQuery;
    btnAbort: TButton;
    OleDbConnectionMSAccess: TOleDbConnection;
    ClrMemTable1: TClrMemTable;
    ClrDataTable1: TClrDataTable;
    OdbcConnectionCSV: TOdbcConnection;
    OdbcQueryCSV: TOdbcQuery;
    OleDbDataReaderMSAccess: TOleDbDataReader;
    procedure btnCopyDataClick(Sender: TObject);
    procedure SqlClientBulkCopy1SqlRowsCopied(Sender: TObject;
      EventArgs: TSqlRowsCopiedEventArgs);
    procedure btnConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAbortClick(Sender: TObject);
  private
    FAbortProcess: Boolean;
    procedure InitialiseProcess;
    procedure FinaliseProcess;
  public
    { Public declarations }
  end;

var
  frmBulkCopy: TfrmBulkCopy;

implementation

{$R *.dfm}

uses UITypes, ADONetUtils;

procedure TfrmBulkCopy.btnAbortClick(Sender: TObject);
begin
  FAbortProcess := True;
end;

procedure TfrmBulkCopy.btnConnectClick(Sender: TObject);
begin
  btnCopyData.Enabled := False;
  rgSourceData.Enabled := False;
  inherited;
  btnCopyData.Enabled := True;
  rgSourceData.Enabled := True;
end;

procedure TfrmBulkCopy.InitialiseProcess;
begin
  mmoLog.Lines.Clear();
  SqlClientBulkCopy1.ColumnMappings.Clear;
  btnAbort.Enabled := True;
  btnCopyData.Enabled := False;
  edtServer.Enabled := False;
  edtDB.Enabled := False;
  btnConnect.Enabled := False;
  rgSourceData.Enabled := False;
  btnClose.Enabled := False;
  Screen.Cursor := crHourGlass;
end;

procedure TfrmBulkCopy.FinaliseProcess;
begin
  FAbortProcess := False;
  btnAbort.Enabled := False;
  btnCopyData.Enabled := True;
  edtServer.Enabled := True;
  edtDB.Enabled := True;
  btnConnect.Enabled := True;
  rgSourceData.Enabled := True;
  btnClose.Enabled := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmBulkCopy.btnCopyDataClick(Sender: TObject);
var
  I: Integer;
  newRow: _DataRow;
begin
  InitialiseProcess;
  try
    try
      SqlClientBulkCopy1.NotifyAfter := 10;
      case rgSourceData.ItemIndex of
        0: //MS SQL Server via SqlClientQuery - Copy data from Customers table to shippers table
        begin
          SqlClientQuery1.SQL.Text := 'Select CompanyName, Phone from Customers';
          SqlClientQuery1.Open;
          SqlClientBulkCopy1.WriteToServer(SqlClientQuery1);
        end;
        1: //MS SQL Server via SqlClientQuery - Copy data from Customers table to shippers table
        begin
          // Same as above but with different component. This appraoch is faster and
          // can handle voluminous data without any memory issues

          SqlClientDataReader1.CommandText.Text := 'Select * from Customers';
          SqlClientDataReader1.Open;
          try
            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceColumn := 'CompanyName';
              DestinationColumn := 'CompanyName';
            end;

            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceColumn := 'Phone';
              DestinationColumn := 'Phone';
            end;

            SqlClientBulkCopy1.WriteToServer(SqlClientDataReader1);
          finally
            SqlClientDataReader1.Close;
          end;
        end;
        2: //MS Access via OLEDBDataReader
        begin
          OleDbConnectionMSAccess.Params.DataSource := TADONetUtility.GetMSAccessDBFile;
          OleDbConnectionMSAccess.Open;
          try
            OleDbDataReaderMSAccess.CommandText.Text := 'Select Company, Phone from Customer';
            OleDbDataReaderMSAccess.Open;
            SqlClientBulkCopy1.WriteToServer(OleDbDataReaderMSAccess);
          finally
            OleDbDataReaderMSAccess.Close;
            OleDbConnectionMSAccess.Close;
          end;
        end;
        3: //MS Excel via ODBCQuery
        begin         
          OdbcConnectionExcel.ConnectionString := 'Dbq='+ TADONetUtility.GetExcelDataFile;
          OdbcConnectionExcel.Open;
          try
            OdbcQueryExcel.SQL.Text := 'Select * from [Customers$]';
            OdbcQueryExcel.Open;

            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceColumn := 'CompanyName';
              DestinationColumn := 'CompanyName';
            end;

            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceColumn := 'Phone';
              DestinationColumn := 'Phone';
            end;

            SqlClientBulkCopy1.WriteToServer(OdbcQueryExcel);
          finally
            OdbcConnectionExcel.Close;
          end;
        end;
        4: // XML File via TClrMemTable
        begin
          ClrMemTable1.ReadXml(TADONetUtility.GetXMLDataFile);

          with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
          begin
            SourceColumn := 'CompanyName';
            DestinationColumn := 'CompanyName';
          end;

          with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
          begin
            SourceColumn := 'Phone';
            DestinationColumn := 'Phone';
          end;

          SqlClientBulkCopy1.WriteToServer(ClrMemTable1);
        end;
        5: //CSV via ODBCQuery
        begin
          OdbcConnectionCSV.ConnectionString := 'Dbq='+ TADONetUtility.GetCSVDataFileLocation;
          OdbcConnectionCSV.Open;
          try
            OdbcQueryCSV.SQL.Text := 'Select * from Customers.csv';
            OdbcQueryCSV.Open;

            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceOrdinal := 1; //'CompanyName'
              DestinationOrdinal := 1;//'CompanyName';
            end;

            with SqlClientBulkCopy1.ColumnMappings.AddColumnMapping do
            begin
              SourceOrdinal := 9; //'CompanyName'
              DestinationOrdinal := 2;//'Phone';
            end;

            SqlClientBulkCopy1.WriteToServer(OdbcQueryCSV);
          finally
            OdbcConnectionCSV.Close;
          end;
        end;
        6: //using Data from TClrDataTable
        begin
          ClrDataTable1.Columns.Add_3('CompanyName');
          ClrDataTable1.Columns.Add_3('Phone');

          for I := 0 to 1000 do
          begin
            newRow := ClrDataTable1.NewRow;
            newRow[0] := 'CompanyName00' + I.ToString;
            newRow[1] := '(765) 7687 98' + I.ToString;
            ClrDataTable1.Rows.Add(newRow);
          end;
          SqlClientBulkCopy1.WriteToServer(ClrDataTable1.DataTable);
        end;
      end;      
    except 
      on E: Exception do
        MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  finally
    FinaliseProcess;
  end;
end;

procedure TfrmBulkCopy.FormCreate(Sender: TObject);
begin
  inherited;
  FAbortProcess := False;
end;

procedure TfrmBulkCopy.SqlClientBulkCopy1SqlRowsCopied(Sender: TObject;
  EventArgs: TSqlRowsCopiedEventArgs);
begin
  EventArgs.Abort := FAbortProcess;
  mmoLog.Lines.Add('Rows Coipied: '+ IntToStr(EventArgs.RowsCopied));
  Application.ProcessMessages;
end;

end.
