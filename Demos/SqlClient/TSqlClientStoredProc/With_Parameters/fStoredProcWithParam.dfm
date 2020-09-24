inherited frmStoredProcWithParams: TfrmStoredProcWithParams
  Caption = 'Stored Procedure'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 360
      Caption = 'Stored Procedure - Master/Details'
      ExplicitWidth = 360
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      inherited pgcMain: TPageControl
        ActivePage = tsData
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          object spl1: TSplitter
            Left = 0
            Top = 120
            Width = 578
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitWidth = 154
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 123
            Width = 578
            Height = 151
            Align = alClient
            DataSource = dsCategories
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnl2: TPanel
            Left = 0
            Top = 274
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object dbnvgr1: TDBNavigator
              Left = 0
              Top = 6
              Width = 220
              Height = 25
              DataSource = dsCategories
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 0
            end
          end
          object dbgrd2: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 120
            Align = alTop
            DataSource = dsCustomers
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
        end
      end
    end
  end
  inherited SqlClientConnection1: TSqlClientConnection
    ConnectionString = 'MultipleActiveResultSets=True'
    Params.MultipleActiveResultSets = True
  end
  object dsCategories: TDataSource
    DataSet = SqlClientStoredProc1
    Left = 232
    Top = 296
  end
  object SqlClientStoredProc1: TSqlClientStoredProc
    Connection = SqlClientConnection1
    MasterSource = dsCustomers
    ProcedureName = 'CustOrderHist'#13#10
    Parameters = <
      item
        Name = 'CustomerID'
        DataType = ftString
        SqlDbType = sdtVarChar
      end>
    Left = 236
    Top = 351
  end
  object dsCustomers: TDataSource
    DataSet = SqlClientQueryCustomers
    Left = 356
    Top = 167
  end
  object SqlClientQueryCustomers: TSqlClientQuery
    Connection = SqlClientConnection1
    Parameters = <>
    SQL.Strings = (
      'Select * from Customers')
    Left = 356
    Top = 231
  end
end
