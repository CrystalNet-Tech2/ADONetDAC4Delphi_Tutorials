inherited frmCachedUpdates: TfrmCachedUpdates
  Caption = 'Cached Updates and OnUpdateRecord'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 398
      Caption = 'Cached Updates and OnUpdateRecord'
      ExplicitWidth = 398
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
          object pnl2: TPanel
            Left = 0
            Top = 270
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object btnApply: TButton
              Left = 254
              Top = 6
              Width = 84
              Height = 25
              Caption = 'Apply Updates'
              TabOrder = 0
              OnClick = btnApplyClick
            end
            object btnCancel: TButton
              Left = 347
              Top = 6
              Width = 100
              Height = 25
              Caption = 'Cancel Updates'
              TabOrder = 1
              OnClick = btnCancelClick
            end
            object btnRevert: TButton
              Left = 454
              Top = 6
              Width = 83
              Height = 25
              Caption = 'Revert Record'
              TabOrder = 2
              OnClick = btnRevertClick
            end
            object dbnvgr1: TDBNavigator
              Left = 2
              Top = 6
              Width = 240
              Height = 25
              DataSource = dsProducts
              TabOrder = 3
            end
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 270
            Align = alClient
            DataSource = dsProducts
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        object ts1: TTabSheet
          Caption = 'OnUpdaterecord Log'
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
  object dsProducts: TDataSource
    DataSet = VistaDBTableCustomers
    Left = 448
    Top = 240
  end
  object VistaDBTableCustomers: TVistaDBTable
    FetchOptions.Unidirectional = False
    UpdateOptions.UpdateMode = umBatch
    TableName = 'Customers'#13#10
    OnUpdateRecord = VistaDBTableCustomersUpdateRecord
    Left = 364
    Top = 339
  end
end
