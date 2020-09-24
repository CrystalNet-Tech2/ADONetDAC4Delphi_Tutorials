inherited frmLiveUpdates: TfrmLiveUpdates
  Caption = 'Live Updates and OnUpdateRecord'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 364
      Caption = 'Live Updates and OnUpdateRecord'
      ExplicitWidth = 364
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
          ExplicitHeight = 304
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 270
            Align = alClient
            DataSource = dsCustomer
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnl2: TPanel
            Left = 0
            Top = 270
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object dbnvgr1: TDBNavigator
              Left = 0
              Top = 6
              Width = 240
              Height = 25
              DataSource = dsCustomer
              TabOrder = 0
            end
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 304
        end
        object ts1: TTabSheet
          Caption = 'OnUpdateRecord Log'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object mmoLog: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 304
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsCustomer: TDataSource
    DataSet = VistaDBTable1
    Left = 288
    Top = 256
  end
  object VistaDBTable1: TVistaDBTable
    FetchOptions.Unidirectional = False
    TableName = 'Customers'#13#10
    OnUpdateRecord = VistaDBTable1UpdateRecord
    Left = 388
    Top = 323
  end
end
