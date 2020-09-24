inherited frmCommands: TfrmCommands
  Caption = 'Commands'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 117
      Caption = 'Commands'
      ExplicitWidth = 117
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      Top = 91
      Height = 378
      ExplicitTop = 91
      ExplicitHeight = 378
      object mmoConsole: TMemo
        Left = 0
        Top = 7
        Width = 586
        Height = 371
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        ExplicitLeft = -5
        ExplicitTop = 0
        ExplicitWidth = 591
        ExplicitHeight = 293
      end
    end
    inherited pnlConnDef: TPanel
      Height = 91
      ExplicitHeight = 91
    end
  end
  object SQLiteCommand1: TSQLiteCommand
    Connection = SQLiteConnection1
    Parameters = <>
    Left = 232
    Top = 224
  end
  object SQLiteDataAdapter1: TSQLiteDataAdapter
    CommandBuider.CatalogSeparator = '.'
    Left = 416
    Top = 224
  end
end
