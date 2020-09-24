inherited frmMetaTables: TfrmMetaTables
  Caption = 'Meta info about tables'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 236
      Caption = 'Meta info about tables'
      ExplicitWidth = 236
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      object pnl2: TPanel
        Left = 0
        Top = 7
        Width = 586
        Height = 354
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlConnection: TPanel
          Left = 0
          Top = 0
          Width = 586
          Height = 95
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            586
            95)
          object btnFetch: TButton
            Left = 391
            Top = 12
            Width = 76
            Height = 25
            Cursor = crHandPoint
            Caption = 'Fetch'
            Enabled = False
            TabOrder = 1
            OnClick = btnFetchClick
          end
          object rgMain: TRadioGroup
            Left = 6
            Top = 7
            Width = 190
            Height = 35
            Cursor = crHandPoint
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'mkTables'
              'mkTableFields')
            TabOrder = 0
            OnClick = rgMainClick
          end
          object mmoInfo: TMemo
            Left = 5
            Top = 53
            Width = 579
            Height = 33
            Anchors = [akLeft, akRight, akBottom]
            Color = clInfoBk
            Lines.Strings = (
              
                'To fetch meta information click Fetch button. Use the radio butt' +
                'ons group to select the kind of meta info to fetch.')
            TabOrder = 2
          end
          object cbTable: TComboBox
            Left = 202
            Top = 15
            Width = 183
            Height = 21
            Enabled = False
            TabOrder = 3
          end
        end
        object mmoConsole: TMemo
          Left = 5
          Top = 124
          Width = 660
          Height = 263
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
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
