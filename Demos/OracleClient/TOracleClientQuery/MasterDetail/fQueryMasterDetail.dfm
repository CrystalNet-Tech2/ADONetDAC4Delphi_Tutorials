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
      Height = 389
      ExplicitHeight = 389
      inherited pgcMain: TPageControl
        Height = 388
        ActivePage = tsData
        ExplicitHeight = 388
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 357
          object spl1: TSplitter
            Left = 0
            Top = 218
            Width = 578
            Height = 3
            Cursor = crVSplit
            Align = alTop
            ExplicitTop = 241
          end
          object mmoComment: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 49
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
            Top = 49
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
            Top = 84
            Width = 578
            Height = 134
            Align = alTop
            DataSource = dsOrders
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object dbgrd2: TDBGrid
            Left = 0
            Top = 221
            Width = 578
            Height = 136
            Align = alClient
            DataSource = dsOrderDetails
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
          ExplicitHeight = 357
          inherited pnlTree: TPanel
            Height = 316
            ExplicitHeight = 316
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
  object dsOrders: TDataSource
    AutoEdit = False
    DataSet = OracleClientQueryOrders
    Left = 288
    Top = 296
  end
  object dsOrderDetails: TDataSource
    AutoEdit = False
    DataSet = OracleClientQueryOrderDetails
    Left = 316
    Top = 471
  end
  object OracleClientQueryOrders: TOracleClientQuery
    Connection = OracleClientConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Orders')
    Left = 400
    Top = 304
  end
  object OracleClientQueryOrderDetails: TOracleClientQuery
    Connection = OracleClientConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    MasterFields = 'OrderID'
    MasterSource = dsOrders
    Parameters = <
      item
        Name = 'OrderID'
        Value = Null
      end>
    SQL.Strings = (
      'Select * from OrderDetails where OrderID = :OrderID')
    Left = 428
    Top = 463
  end
end
