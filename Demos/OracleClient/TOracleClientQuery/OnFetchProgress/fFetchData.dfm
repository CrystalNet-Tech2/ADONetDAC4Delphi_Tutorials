inherited frmFetchData: TfrmFetchData
  Caption = 'Fetch Data'
  OnClose = FormClose
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
    inherited pnlConnDef: TPanel
      object lblProgress: TLabel [3]
        Left = 549
        Top = 64
        Width = 33
        Height = 13
        BiDiMode = bdRightToLeft
        Caption = '0.00%'
        ParentBiDiMode = False
        Visible = False
      end
      inherited edtPass: TEdit
        TabOrder = 4
      end
      object pbProgress: TProgressBar
        Left = 286
        Top = 81
        Width = 296
        Height = 21
        TabOrder = 2
        Visible = False
      end
    end
  end
  inherited OracleClientConnection1: TOracleClientConnection
    AfterConnect = OracleClientConnection1AfterConnect
    AfterDisconnect = OracleClientConnection1AfterDisconnect
  end
  object dsOrders: TDataSource
    AutoEdit = False
    DataSet = OracleClientQueryOrders
    Left = 464
    Top = 240
  end
  object OracleClientQueryOrders: TOracleClientQuery
    Connection = OracleClientConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Orders')
    OnFetchProgress = OracleClientQueryOrdersFetchProgress
    OnFetchComplete = OracleClientQueryOrdersFetchComplete
    Left = 304
    Top = 240
  end
end
