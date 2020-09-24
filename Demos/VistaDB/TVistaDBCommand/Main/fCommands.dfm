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
        Top = 4
        Width = 586
        Height = 374
        Align = alClient
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
    inherited pnlConnDef: TPanel
      Height = 91
      ExplicitHeight = 91
    end
  end
  object VistaDBCommand1: TVistaDBCommand
    Connection = VistaDBConnection1
    Parameters = <>
    Left = 232
    Top = 288
  end
  object VistaDBDataAdapter1: TVistaDBDataAdapter
    Left = 392
    Top = 288
  end
end
