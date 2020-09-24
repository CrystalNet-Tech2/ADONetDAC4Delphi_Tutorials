inherited frmDataAdapter: TfrmDataAdapter
  Caption = 'Data Adapter'
  ClientHeight = 450
  ClientWidth = 526
  OnCreate = FormCreate
  ExplicitWidth = 542
  ExplicitHeight = 489
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 526
    ExplicitWidth = 526
    inherited bvlTitle: TBevel
      Width = 526
      ExplicitWidth = 526
    end
    inherited lblTitle: TLabel
      Width = 140
      Caption = 'Data Adapter'
      ExplicitWidth = 140
    end
  end
  inherited pnlMain: TPanel
    Width = 526
    Height = 360
    ExplicitWidth = 526
    ExplicitHeight = 360
    inherited pnlConnDef: TPanel
      Width = 526
      ExplicitWidth = 526
    end
    inherited pnl1: TPanel
      Width = 526
      Height = 273
      ExplicitWidth = 526
      ExplicitHeight = 273
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 526
        Height = 273
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          526
          273)
        object dbgrd1: TDBGrid
          Left = 5
          Top = 36
          Width = 518
          Height = 231
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = ds1
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object dbnvgr1: TDBNavigator
          Left = 5
          Top = 5
          Width = 290
          Height = 25
          DataSource = ds1
          Flat = True
          TabOrder = 1
        end
        object btnApplyChanges: TButton
          Left = 321
          Top = 5
          Width = 91
          Height = 25
          Caption = 'Apply Changes'
          TabOrder = 2
          OnClick = btnApplyChangesClick
        end
        object btnRejectChanges: TButton
          Left = 418
          Top = 5
          Width = 91
          Height = 25
          Caption = 'Reject Changes'
          TabOrder = 3
          OnClick = btnRejectChangesClick
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 413
    Width = 526
    ExplicitTop = 413
    ExplicitWidth = 526
    inherited bvlButtons: TBevel
      Width = 526
      ExplicitWidth = 526
    end
    inherited btnClose: TButton
      Left = 448
      ExplicitLeft = 448
    end
  end
  object SqlClientCommand1: TSqlClientCommand
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 288
    Top = 240
  end
  object SqlClientDataAdapter1: TSqlClientDataAdapter
    SelectCommand = SqlClientCommand1
    Left = 424
    Top = 248
  end
  object ClrMemTable1: TClrMemTable
    DataAdapter = SqlClientDataAdapter1
    Left = 376
    Top = 308
  end
  object ds1: TDataSource
    DataSet = ClrMemTable1
    Left = 368
    Top = 184
  end
end
