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
      inherited bvl1: TBevel
        Height = 5
        ExplicitHeight = 5
      end
      object mmoConsole: TMemo
        Left = 0
        Top = 5
        Width = 586
        Height = 356
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
  object OdbcCommand1: TOdbcCommand
    Connection = OdbcConnection1
    Parameters = <>
    Left = 240
    Top = 280
  end
  object OdbcDataAdapter1: TOdbcDataAdapter
    CommandBuider.QuotePrefix = ''
    CommandBuider.QuoteSuffix = ''
    Left = 392
    Top = 280
  end
end
