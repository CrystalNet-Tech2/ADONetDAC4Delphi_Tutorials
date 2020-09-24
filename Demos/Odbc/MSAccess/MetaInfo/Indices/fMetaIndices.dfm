inherited frmMetaIndices: TfrmMetaIndices
  Caption = 'Meta info about indices'
  ExplicitWidth = 602
  ExplicitHeight = 598
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 244
      Caption = 'Meta info about indices'
      ExplicitWidth = 244
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
          Height = 129
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl4: TLabel
            Left = 207
            Top = 24
            Width = 30
            Height = 13
            Caption = 'Table:'
          end
          object btnFetch: TButton
            Left = 6
            Top = 52
            Width = 76
            Height = 25
            Cursor = crHandPoint
            Caption = 'Fetch'
            Enabled = False
            TabOrder = 2
            OnClick = btnFetchClick
          end
          object rgMain: TRadioGroup
            Left = 6
            Top = 12
            Width = 190
            Height = 37
            Cursor = crHandPoint
            Columns = 2
            ItemIndex = 0
            Items.Strings = (
              'mkIndexes'
              'mkIndexFields')
            TabOrder = 0
            OnClick = rgMainClick
          end
          object lbledtIndexName: TLabeledEdit
            Left = 407
            Top = 21
            Width = 121
            Height = 21
            EditLabel.Width = 32
            EditLabel.Height = 13
            EditLabel.Caption = 'Index:'
            Enabled = False
            LabelPosition = lpLeft
            TabOrder = 1
          end
          object mmoInfo: TMemo
            Left = 6
            Top = 84
            Width = 612
            Height = 39
            Color = clInfoBk
            Lines.Strings = (
              
                'To fetch meta information click Fetch button. Use the radio butt' +
                'ons group to select the kind of meta info to fetch.')
            TabOrder = 3
          end
          object cbTableNames: TComboBox
            Left = 241
            Top = 21
            Width = 127
            Height = 21
            TabOrder = 4
          end
        end
        object mmoConsole: TMemo
          Left = 0
          Top = 129
          Width = 586
          Height = 225
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
