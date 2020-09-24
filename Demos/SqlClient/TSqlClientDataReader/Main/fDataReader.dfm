inherited frmDataReader: TfrmDataReader
  Caption = 'Data Reader'
  ExplicitWidth = 602
  ExplicitHeight = 598
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
    ExplicitHeight = 469
    inherited pnl1: TPanel
      ExplicitHeight = 382
      object mmoConsole: TMemo
        Left = 0
        Top = 0
        Width = 586
        Height = 382
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
  end
  object SqlClientDataReader1: TSqlClientDataReader
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 288
    Top = 220
  end
end
