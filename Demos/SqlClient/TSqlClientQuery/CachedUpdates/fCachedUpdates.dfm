inherited frmCachedUpdates: TfrmCachedUpdates
  Caption = 'Cached Updates'
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
        inherited tsData: TTabSheet
          object pnl2: TPanel
            Left = 0
            Top = 274
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
            Height = 274
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
        inherited tsOptions: TTabSheet
          inherited pnlTree: TPanel
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
            end
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
            Height = 308
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object SqlClientQueryProducts: TSqlClientQuery
    Connection = SqlClientConnection1
    FetchOptions.Unidirectional = False
    UpdateOptions.UpdateMode = umBatch
    Parameters = <>
    SQL.Strings = (
      'Select * from Products')
    OnUpdateRecord = SqlClientQueryProductsUpdateRecord
    Left = 308
    Top = 239
  end
  object dsProducts: TDataSource
    DataSet = SqlClientQueryProducts
    Left = 448
    Top = 240
  end
end
