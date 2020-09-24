inherited frmMasterDetail: TfrmMasterDetail
  Caption = 'Master Details'
  ClientHeight = 587
  ExplicitHeight = 626
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 152
      Caption = 'Master Details'
      ExplicitWidth = 152
    end
  end
  inherited pnlMain: TPanel
    Height = 497
    ExplicitHeight = 497
    inherited pnl1: TPanel
      Height = 410
      ExplicitHeight = 410
      inherited pgcMain: TPageControl
        Height = 406
        ActivePage = tsData
        ExplicitHeight = 406
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 375
          object spl1: TSplitter
            Left = 0
            Top = 241
            Width = 578
            Height = 3
            Cursor = crVSplit
            Align = alTop
          end
          object mmoComment: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 72
            Align = alTop
            Color = clInfoBk
            Lines.Strings = (
              
                'To link 2 queries as master-detail, you need setup detail query:' +
                ' add parameter[s] to SQL text, named as field[s] of '
              
                'master query, set MasterSource to master query TDataSource. Each' +
                ' change of master query will fire detail query '
              'reopen.')
            ReadOnly = True
            TabOrder = 0
          end
          object pnl2: TPanel
            Left = 0
            Top = 72
            Width = 578
            Height = 35
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnRefreshMaster: TButton
              Left = 2
              Top = 6
              Width = 107
              Height = 25
              Caption = 'Refresh master'
              TabOrder = 0
              OnClick = btnRefreshMasterClick
            end
            object btnRefreshDetails: TButton
              Left = 115
              Top = 6
              Width = 107
              Height = 25
              Caption = 'Refresh detail'
              TabOrder = 1
              OnClick = btnRefreshDetailsClick
            end
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 107
            Width = 578
            Height = 134
            Align = alTop
            DataSource = dsCustomers
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object dbgrd2: TDBGrid
            Left = 0
            Top = 244
            Width = 578
            Height = 131
            Align = alClient
            DataSource = dsOrders
            TabOrder = 3
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
          ExplicitHeight = 375
          inherited pnlTree: TPanel
            Height = 334
            ExplicitHeight = 334
            inherited grp2: TGroupBox
              inherited chkReadOnly: TCheckBox
                Enabled = False
              end
              inherited chkRequestLive: TCheckBox
                Enabled = False
              end
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 550
    ExplicitTop = 550
  end
  object dsCustomers: TDataSource
    AutoEdit = False
    DataSet = SQLiteQueryCustomers
    Left = 288
    Top = 296
  end
  object dsOrders: TDataSource
    AutoEdit = False
    DataSet = SQLiteQueryOrders
    Left = 316
    Top = 471
  end
  object SQLiteQueryCustomers: TSQLiteQuery
    Connection = SQLiteConnection1
    UpdateOptions.UpdateMode = umBatch
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 380
    Top = 307
  end
  object SQLiteQueryOrders: TSQLiteQuery
    Connection = SQLiteConnection1
    UpdateOptions.UpdateMode = umBatch
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    MasterFields = 'Id'
    MasterSource = dsCustomers
    Parameters = <
      item
        Name = 'id'
        Value = Null
      end>
    SQL.Strings = (
      'Select * from [Order] where CustomerId = :id')
    Left = 400
    Top = 472
  end
end
