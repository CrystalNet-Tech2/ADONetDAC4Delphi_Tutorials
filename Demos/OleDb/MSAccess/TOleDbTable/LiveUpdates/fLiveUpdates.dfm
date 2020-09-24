inherited frmLiveUpdates: TfrmLiveUpdates
  Caption = 'Live Updates and OnUpdateRecord'
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
        inherited tsData: TTabSheet
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 271
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
            Top = 271
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
          inherited pnlTree: TPanel
            inherited grp1: TGroupBox
              inherited edtMinMemoSize: TEdit
                OnKeyPress = nil
              end
            end
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
              inherited edtUpdateBatchSize: TEdit
                OnKeyPress = nil
              end
            end
          end
        end
        object ts1: TTabSheet
          Caption = 'OnUpdateRecord Log'
          ImageIndex = 2
          object mmoLog: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 305
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  object dsCustomer: TDataSource
    DataSet = OleDbTable1
    Left = 288
    Top = 256
  end
  object OleDbTable1: TOleDbTable
    Connection = OleDbConnection1
    TableName = 'Customer'#13#10
    OnUpdateRecord = OleDbTable1UpdateRecord
    Left = 388
    Top = 259
  end
end
