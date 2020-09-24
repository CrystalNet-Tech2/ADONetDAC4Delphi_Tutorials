inherited frmBulkCopy: TfrmBulkCopy
  Caption = 'Bulk Copy'
  ClientHeight = 574
  ClientWidth = 582
  OnCreate = FormCreate
  ExplicitWidth = 598
  ExplicitHeight = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 582
    ExplicitWidth = 582
    inherited bvlTitle: TBevel
      Width = 582
      ExplicitWidth = 582
    end
    inherited lblTitle: TLabel
      Width = 104
      Caption = 'Bulk Copy'
      ExplicitWidth = 104
    end
  end
  inherited pnlMain: TPanel
    Width = 582
    Height = 484
    ExplicitWidth = 582
    ExplicitHeight = 469
    inherited pnlConnDef: TPanel
      Width = 582
      ExplicitWidth = 582
    end
    inherited pnl1: TPanel
      Width = 582
      Height = 397
      ExplicitWidth = 582
      ExplicitHeight = 382
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 582
        Height = 169
        Align = alTop
        TabOrder = 0
        ExplicitWidth = 583
        DesignSize = (
          582
          169)
        object btnCopyData: TButton
          Left = 435
          Top = 106
          Width = 75
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Copy Data'
          Enabled = False
          TabOrder = 0
          OnClick = btnCopyDataClick
          ExplicitLeft = 437
        end
        object rgSourceData: TRadioGroup
          Left = 6
          Top = -1
          Width = 572
          Height = 105
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Source Data'
          Columns = 2
          Enabled = False
          ItemIndex = 0
          Items.Strings = (
            'MS SQL Server via SqlClient Query'
            'MS SQL Server via SqlClient DataReader'
            'MS Access via OLE DB DataReader'
            'Excel via ODBC'
            'XML File via TClrMemTable'
            'CSV File via ODBC Query'
            'using Data from TClrDataTable')
          TabOrder = 1
        end
        object mmoInfo: TMemo
          Left = 1
          Top = 139
          Width = 580
          Height = 29
          Align = alBottom
          Color = clInfoBk
          Lines.Strings = (
            
              'To Copy bulk data to Shippers table in a Northwind SQL Database,' +
              ' select the source data and click Copy Data button.')
          TabOrder = 2
          ExplicitTop = 99
          ExplicitWidth = 584
        end
        object btnAbort: TButton
          Left = 512
          Top = 106
          Width = 66
          Height = 25
          Anchors = [akRight, akBottom]
          Caption = 'Abort'
          Enabled = False
          TabOrder = 3
          OnClick = btnAbortClick
          ExplicitLeft = 514
        end
      end
      object mmoLog: TMemo
        Left = 0
        Top = 169
        Width = 582
        Height = 228
        Align = alClient
        TabOrder = 1
        ExplicitTop = 97
        ExplicitWidth = 586
        ExplicitHeight = 285
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 537
    Width = 582
    ExplicitTop = 537
    ExplicitWidth = 582
    inherited bvlButtons: TBevel
      Width = 582
      ExplicitWidth = 582
    end
    inherited btnClose: TButton
      Left = 504
      ExplicitLeft = 504
    end
  end
  inherited SqlClientConnection1: TSqlClientConnection
    ConnectionString = 'MultipleActiveResultSets=True'
    Params.MultipleActiveResultSets = True
  end
  object SqlClientBulkCopy1: TSqlClientBulkCopy
    Connection = SqlClientConnection1
    ColumnMappings = <>
    DestinationTableName = 'Shippers'
    TxOptions.AutoStart = True
    OnSqlRowsCopied = SqlClientBulkCopy1SqlRowsCopied
    Left = 512
    Top = 324
  end
  object SqlClientQuery1: TSqlClientQuery
    Connection = SqlClientConnection1
    Parameters = <>
    SQL.Strings = (
      'Select * from Customers')
    Left = 40
    Top = 324
  end
  object SqlClientDataReader1: TSqlClientDataReader
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 48
    Top = 388
  end
  object OdbcConnectionExcel: TOdbcConnection
    ConnectionString = 'Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)}'
    Driver = '{Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)}'
    Params.Driver = '{Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)}'
    Params.ConnectionString = 'Driver={Microsoft Excel Driver (*.xls, *.xlsx, *.xlsm, *.xlsb)}'
    Left = 48
    Top = 476
  end
  object OdbcQueryExcel: TOdbcQuery
    Connection = OdbcConnectionExcel
    Parameters = <>
    Left = 152
    Top = 476
  end
  object OleDbConnectionMSAccess: TOleDbConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;OLE' +
      ' DB Services=-13'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Params.ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;OLE' +
      ' DB Services=-13'
    Params.OleDbServices = -13
    Params.PersistSecurityInfo = False
    Params.Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 208
    Top = 324
  end
  object ClrMemTable1: TClrMemTable
    Left = 488
    Top = 396
  end
  object ClrDataTable1: TClrDataTable
    Left = 488
    Top = 468
  end
  object OdbcConnectionCSV: TOdbcConnection
    ConnectionString = 'Driver={Microsoft Text Driver (*.txt; *.csv)}'
    Driver = '{Microsoft Text Driver (*.txt; *.csv)}'
    Params.Driver = '{Microsoft Text Driver (*.txt; *.csv)}'
    Params.ConnectionString = 'Driver={Microsoft Text Driver (*.txt; *.csv)}'
    Left = 200
    Top = 392
  end
  object OdbcQueryCSV: TOdbcQuery
    Connection = OdbcConnectionCSV
    Parameters = <>
    Left = 320
    Top = 396
  end
  object OleDbDataReaderMSAccess: TOleDbDataReader
    Connection = OleDbConnectionMSAccess
    Parameters = <>
    Left = 344
    Top = 324
  end
end
