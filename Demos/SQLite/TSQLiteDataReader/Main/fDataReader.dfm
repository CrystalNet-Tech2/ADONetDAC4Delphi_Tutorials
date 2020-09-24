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
        Left = -5
        Top = 0
        Width = 591
        Height = 293
        Align = alCustom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object SQLiteDataReader1: TSQLiteDataReader
    Connection = SQLiteConnection1
    Parameters = <>
    Left = 392
    Top = 248
  end
end
