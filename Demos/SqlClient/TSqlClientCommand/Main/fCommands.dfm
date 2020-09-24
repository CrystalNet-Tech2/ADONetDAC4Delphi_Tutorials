inherited frmCommands: TfrmCommands
  Caption = 'Commands'
  OnCreate = FormCreate
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
  object SqlClientCommand1: TSqlClientCommand
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 240
    Top = 212
  end
  object SqlClientDataAdapter1: TSqlClientDataAdapter
    Left = 400
    Top = 204
  end
end
