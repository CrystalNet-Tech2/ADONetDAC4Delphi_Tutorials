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
      object mmoConsole: TMemo
        Left = 0
        Top = 7
        Width = 586
        Height = 373
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
  end
  object OleDbCommand1: TOleDbCommand
    Connection = OleDbConnection1
    Parameters = <>
    Left = 288
    Top = 216
  end
  object OleDbDataAdapter1: TOleDbDataAdapter
    CommandBuider.QuotePrefix = ''
    CommandBuider.QuoteSuffix = ''
    Left = 424
    Top = 206
  end
end
