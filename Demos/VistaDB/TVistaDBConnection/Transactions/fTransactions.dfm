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
    ExplicitWidth = 543
    inherited bvlTitle: TBevel
      Width = 543
      ExplicitWidth = 543
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
    ExplicitWidth = 543
    ExplicitHeight = 340
    inherited pnl1: TPanel
      Width = 543
      Height = 253
      ExplicitWidth = 543
      ExplicitHeight = 253
      inherited bvl1: TBevel
        Width = 543
        ExplicitWidth = 543
      end
      object mmoInfo: TMemo
        Left = 0
        Top = 4
        Width = 543
        Height = 249
        Align = alClient
        TabOrder = 0
      end
    end
    inherited pnlConnDef: TPanel
      Width = 543
      ExplicitWidth = 543
    end
  end
  inherited pnlButtons: TPanel
    Top = 393
    Width = 543
    ExplicitTop = 393
    ExplicitWidth = 543
    DesignSize = (
      543
      37)
    inherited bvlButtons: TBevel
      Width = 543
      ExplicitWidth = 543
    end
    inherited btnClose: TButton
      Left = 462
      ExplicitLeft = 462
    end
  end
  object VistaDBQuery1: TVistaDBQuery
    Connection = VistaDBConnection1
    FetchOptions.AutoFetchAll = afTruncate
    FetchOptions.Unidirectional = False
    Parameters = <>
    Left = 360
    Top = 204
  end
end
