inherited frmMetaStoredProc: TfrmMetaStoredProc
  Caption = 'Meta info about stored procs'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 291
      Caption = 'Meta info about stored proc'
      ExplicitWidth = 291
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      object pnl2: TPanel
        Left = 0
        Top = 17
        Width = 586
        Height = 344
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlConnection: TPanel
          Left = 0
          Top = 0
          Width = 586
          Height = 116
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            586
            116)
          object btnFetch: TButton
            Left = 8
            Top = 49
            Width = 76
            Height = 25
            Cursor = crHandPoint
            Caption = 'Fetch'
            Enabled = False
            TabOrder = 2
            OnClick = btnFetchClick
          end
          object rgMain: TRadioGroup
            Left = 8
            Top = 7
            Width = 257
            Height = 33
            Cursor = crHandPoint
            Columns = 3
            ItemIndex = 0
            Items.Strings = (
              'Proc'
              'ProcArgs')
            TabOrder = 0
            OnClick = rgMainClick
          end
          object lbledtProcName: TLabeledEdit
            Left = 326
            Top = 12
            Width = 121
            Height = 21
            EditLabel.Width = 25
            EditLabel.Height = 13
            EditLabel.Caption = 'Proc:'
            Enabled = False
            LabelPosition = lpLeft
            TabOrder = 1
          end
          object mmoInfo: TMemo
            Left = 6
            Top = 80
            Width = 576
            Height = 34
            Anchors = [akLeft, akRight, akBottom]
            Color = clInfoBk
            Lines.Strings = (
              
                'To fetch meta information click Fetch button. Use the radio butt' +
                'ons group to select the kind of meta info to fetch.')
            TabOrder = 3
          end
        end
        object mmoConsole: TMemo
          Left = 0
          Top = 116
          Width = 586
          Height = 228
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
  end
end
