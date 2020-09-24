inherited frmFetchData: TfrmFetchData
  Caption = 'Fetch Data'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 114
      Caption = 'Fetch Data'
      ExplicitWidth = 114
    end
  end
  inherited pnlMain: TPanel
    inherited pnlConnDef: TPanel
      object lblProgress: TLabel [3]
        Left = 549
        Top = 41
        Width = 33
        Height = 13
        BiDiMode = bdRightToLeft
        Caption = '0.00%'
        ParentBiDiMode = False
        Visible = False
      end
      object pbProgress: TProgressBar
        Left = 286
        Top = 58
        Width = 296
        Height = 21
        TabOrder = 3
        Visible = False
      end
    end
    inherited pnl1: TPanel
      inherited pgcMain: TPageControl
        ActivePage = tsData
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 308
            Align = alClient
            DataSource = dsOrders
            TabOrder = 0
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
    AfterConnect = SqlClientConnection1AfterConnect
    AfterDisconnect = SqlClientConnection1AfterDisconnect
    Left = 184
    Top = 56
  end
  object dsOrders: TDataSource
    AutoEdit = False
    DataSet = SqlClientQueryOrders
    Left = 464
    Top = 240
  end
  object SqlClientQueryOrders: TSqlClientQuery
    Connection = SqlClientConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Orders')
    OnFetchProgress = SqlClientQueryOrdersFetchProgress
    OnFetchComplete = SqlClientQueryOrdersFetchComplete
    Left = 304
    Top = 240
  end
end
