inherited frmMainQueryBase: TfrmMainQueryBase
  Caption = 'frmMainQueryBase'
  ClientHeight = 538
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  ExplicitWidth = 602
  ExplicitHeight = 577
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 184
      Caption = 'Demo Application'
      ExplicitWidth = 184
    end
  end
  inherited pnlMain: TPanel
    Height = 448
    ExplicitHeight = 448
    inherited pnl1: TPanel
      Height = 340
      ExplicitHeight = 340
      object pgcMain: TPageControl
        Left = 0
        Top = 1
        Width = 586
        Height = 339
        ActivePage = tsOptions
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        OnChanging = pgcMainChanging
        object tsData: TTabSheet
          Caption = 'Data'
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
        end
        object tsOptions: TTabSheet
          Caption = 'Options'
          ImageIndex = 1
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object pnlTree: TPanel
            Left = 0
            Top = 41
            Width = 578
            Height = 267
            Align = alClient
            BorderStyle = bsSingle
            TabOrder = 0
            object grp1: TGroupBox
              Left = 9
              Top = 4
              Width = 263
              Height = 250
              Caption = 'Fetch Options'
              TabOrder = 0
              object lblAutoFetchAll: TLabel
                Left = 9
                Top = 27
                Width = 67
                Height = 13
                Caption = 'Auto Fetch All'
              end
              object lblDefFieldSize: TLabel
                Left = 9
                Top = 80
                Width = 82
                Height = 13
                Caption = 'Default Field Size'
              end
              object lblfetchMode: TLabel
                Left = 9
                Top = 107
                Width = 56
                Height = 13
                Caption = 'Fetch Mode'
              end
              object lblRowsetSize: TLabel
                Left = 9
                Top = 134
                Width = 58
                Height = 13
                Caption = 'Rowset Size'
              end
              object lblSilentMode: TLabel
                Left = 9
                Top = 161
                Width = 55
                Height = 13
                Caption = 'Silent Mode'
              end
              object lblWaitCursor: TLabel
                Left = 9
                Top = 215
                Width = 57
                Height = 13
                Caption = 'Wait Cursor'
              end
              object lblUndirectional: TLabel
                Left = 9
                Top = 188
                Width = 64
                Height = 13
                Caption = 'Unidirectional'
              end
              object lblCursorKind: TLabel
                Left = 9
                Top = 53
                Width = 69
                Height = 13
                Caption = 'Min Memo Size'
              end
              object cbAutoFetchAll: TComboBox
                Left = 98
                Top = 22
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'afAll'
                Items.Strings = (
                  'afAll'
                  'afTruncate')
              end
              object cbFetchMode: TComboBox
                Left = 98
                Top = 103
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 1
                Text = 'fmOnDemand'
                Items.Strings = (
                  'fmOnDemand'
                  'fmAll')
              end
              object cbWaitCursor: TComboBox
                Left = 98
                Top = 213
                Width = 145
                Height = 21
                Style = csDropDownList
                ItemIndex = 2
                TabOrder = 2
                Text = 'dcrSQLWait'
                Items.Strings = (
                  'dcrDefault'
                  'dcrHourGlass'
                  'dcrSQLWait'
                  'dcrOther')
              end
              object edtRowsetSize: TEdit
                Left = 98
                Top = 131
                Width = 121
                Height = 21
                TabOrder = 3
                Text = '100'
              end
              object chkUnidirectional: TCheckBox
                Left = 98
                Top = 185
                Width = 145
                Height = 17
                TabOrder = 4
              end
              object edtDefaultFieldSize: TEdit
                Left = 98
                Top = 76
                Width = 121
                Height = 21
                TabOrder = 5
                Text = '30'
              end
              object chkSilentMode: TCheckBox
                Left = 98
                Top = 161
                Width = 145
                Height = 17
                TabOrder = 6
              end
              object edtMinMemoSize: TEdit
                Left = 98
                Top = 49
                Width = 145
                Height = 21
                TabOrder = 7
                Text = '256'
              end
            end
            object grp2: TGroupBox
              Left = 279
              Top = 4
              Width = 283
              Height = 250
              Caption = 'Update Options'
              TabOrder = 1
              object lblUpdateMode: TLabel
                Left = 10
                Top = 27
                Width = 125
                Height = 13
                Caption = 'Continue Update On Error'
              end
              object lbl8: TLabel
                Left = 10
                Top = 53
                Width = 47
                Height = 13
                Caption = 'ReadOnly'
              end
              object lbl4: TLabel
                Left = 10
                Top = 80
                Width = 59
                Height = 13
                Caption = 'RequestLive'
              end
              object lbl5: TLabel
                Left = 10
                Top = 107
                Width = 87
                Height = 13
                Caption = 'Update Batch Size'
              end
              object lbl6: TLabel
                Left = 10
                Top = 134
                Width = 64
                Height = 13
                Caption = 'Update Mode'
              end
              object lbl7: TLabel
                Left = 10
                Top = 161
                Width = 95
                Height = 13
                Caption = 'Update Row Source'
              end
              object lbl9: TLabel
                Left = 10
                Top = 188
                Width = 72
                Height = 13
                Caption = 'StrsEmpty2Null'
              end
              object cbUpdateMode: TComboBox
                Left = 141
                Top = 131
                Width = 129
                Height = 21
                Style = csDropDownList
                ItemIndex = 0
                TabOrder = 0
                Text = 'umSingle'
                Items.Strings = (
                  'umSingle'
                  'umBatch')
              end
              object chkContinueUpdateOnError: TCheckBox
                Left = 141
                Top = 27
                Width = 129
                Height = 17
                TabOrder = 1
              end
              object chkReadOnly: TCheckBox
                Left = 141
                Top = 52
                Width = 129
                Height = 17
                TabOrder = 2
                OnClick = chkReadOnlyClick
              end
              object chkRequestLive: TCheckBox
                Left = 141
                Top = 78
                Width = 129
                Height = 17
                TabOrder = 3
                OnClick = chkRequestLiveClick
              end
              object cbUpdateRowSource: TComboBox
                Left = 141
                Top = 158
                Width = 129
                Height = 21
                Style = csDropDownList
                ItemIndex = 2
                TabOrder = 4
                Text = 'ursFirstReturnedRecord'
                Items.Strings = (
                  'ursNone'
                  'ursOutputParameters'
                  'ursFirstReturnedRecord'
                  'ursBoth')
              end
              object edtUpdateBatchSize: TEdit
                Left = 141
                Top = 104
                Width = 129
                Height = 21
                TabOrder = 5
                Text = '1'
              end
              object chkStrsEmpty2Null: TCheckBox
                Left = 141
                Top = 186
                Width = 129
                Height = 17
                TabOrder = 6
              end
            end
          end
          object pnlDataSet: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object btnSave: TSpeedButton
              Left = 198
              Top = 8
              Width = 76
              Height = 21
              Caption = 'Save'
              Flat = True
              OnClick = btnSaveClick
            end
            object lblDataSet: TLabel
              Left = 11
              Top = 11
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dataset:'
            end
            object cbDataSet: TComboBox
              Left = 55
              Top = 8
              Width = 137
              Height = 21
              BevelInner = bvSpace
              BevelKind = bkFlat
              BevelOuter = bvRaised
              Style = csDropDownList
              TabOrder = 0
              OnChange = cbDataSetChange
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 501
    ExplicitTop = 501
  end
end
