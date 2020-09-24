inherited frmCommands: TfrmCommands
  Caption = 'frmCommands'
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
        Top = 1
        Width = 586
        Height = 360
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
  object OracleClientCommand1: TOracleClientCommand
    Connection = OracleClientConnection1
    Parameters = <>
    Left = 240
    Top = 212
  end
  object OracleClientDataAdapter1: TOracleClientDataAdapter
    Left = 400
    Top = 204
  end
end
