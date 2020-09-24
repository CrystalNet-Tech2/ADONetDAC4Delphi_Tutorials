inherited frmDataReader: TfrmDataReader
  Caption = 'Data Reader'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 131
      Caption = 'Data Reader'
      ExplicitWidth = 131
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      object mmoConsole: TMemo
        Left = 0
        Top = 2
        Width = 586
        Height = 359
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
  object OdbcDataReader1: TOdbcDataReader
    Connection = OdbcConnection1
    Parameters = <>
    Left = 392
    Top = 248
  end
end
