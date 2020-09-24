inherited frmTransaction: TfrmTransaction
  Left = 394
  Top = 216
  Caption = 'Transactions'
  ClientHeight = 430
  ClientWidth = 543
  OldCreateOrder = True
  ExplicitWidth = 559
  ExplicitHeight = 469
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 543
    inherited bvlTitle: TBevel
      Width = 543
    end
    inherited lblTitle: TLabel
      Width = 135
      Caption = 'Transactions'
      ExplicitWidth = 135
    end
  end
  inherited pnlMain: TPanel
    Width = 543
    Height = 340
    ExplicitHeight = 340
    inherited pnlConnDef: TPanel
      Width = 543
      inherited btnConnect: TButton
        OnClick = btnConnectClick
      end
    end
    inherited pnl1: TPanel
      Width = 543
      Height = 253
      ExplicitLeft = 0
      ExplicitTop = 87
      ExplicitWidth = 517
      ExplicitHeight = 253
      object mmoInfo: TMemo
        Left = 0
        Top = 0
        Width = 543
        Height = 253
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 128
        ExplicitTop = 72
        ExplicitWidth = 185
        ExplicitHeight = 89
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 393
    Width = 543
    ExplicitTop = 393
    DesignSize = (
      543
      37)
    inherited bvlButtons: TBevel
      Width = 543
    end
    inherited btnClose: TButton
      Left = 462
      ExplicitLeft = 482
    end
  end
  object SqlClientQuery1: TSqlClientQuery
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 336
    Top = 197
  end
end
