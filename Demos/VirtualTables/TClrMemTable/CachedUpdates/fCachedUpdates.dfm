inherited frmCachedUpdates: TfrmCachedUpdates
  Caption = 'Cached Updates'
  ClientHeight = 569
  ExplicitWidth = 602
  ExplicitHeight = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 169
      Caption = 'Cached Updates'
      ExplicitWidth = 169
    end
  end
  inherited pnlMain: TPanel
    Height = 465
    ExplicitHeight = 465
    inherited pnl1: TPanel
      Height = 378
      ExplicitHeight = 378
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 586
        Height = 32
        Align = alTop
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 0
        object btnRevertRecord: TButton
          Left = 5
          Top = 3
          Width = 78
          Height = 25
          Caption = 'Revert Record'
          TabOrder = 0
          OnClick = btnRevertRecordClick
        end
        object btnCancelUpdates: TButton
          Left = 84
          Top = 3
          Width = 96
          Height = 25
          Caption = 'Cancel Updates'
          TabOrder = 1
          OnClick = btnCancelUpdatesClick
        end
        object btnApplyUpdates: TButton
          Left = 181
          Top = 3
          Width = 96
          Height = 25
          Caption = 'Apply Updates'
          TabOrder = 2
          OnClick = btnApplyUpdatesClick
        end
        object dbnvgr1: TDBNavigator
          Left = 297
          Top = 3
          Width = 240
          Height = 25
          DataSource = dsCustomers
          TabOrder = 3
        end
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 32
        Width = 586
        Height = 346
        Align = alClient
        DataSource = dsCustomers
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 518
    Height = 32
    ExplicitTop = 518
    ExplicitHeight = 32
    inherited bvlButtons: TBevel
      Height = 32
      ExplicitLeft = -3
      ExplicitTop = -24
      ExplicitWidth = 586
      ExplicitHeight = 32
    end
    object lbl3: TLabel [1]
      Left = 17
      Top = 12
      Width = 87
      Height = 13
      Caption = 'Update Batch Size'
    end
    inherited btnClose: TButton
      Top = 4
      ExplicitTop = 4
    end
    object edtUpdateBatchSize: TEdit
      Left = 112
      Top = 9
      Width = 88
      Height = 21
      TabOrder = 1
      Text = '1000'
      OnChange = edtUpdateBatchSizeChange
      OnKeyPress = edtUpdateBatchSizeKeyPress
    end
  end
  object statStatus: TStatusBar [3]
    Left = 0
    Top = 550
    Width = 586
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object ClrMemTable1: TClrMemTable
    DataAdapter = SqlClientDataAdapter1
    Left = 288
    Top = 380
  end
  object SqlClientCommand1: TSqlClientCommand
    Connection = SqlClientConnection1
    Parameters = <>
    CommandText.Strings = (
      'Select * from Customers')
    Left = 288
    Top = 308
  end
  object SqlClientDataAdapter1: TSqlClientDataAdapter
    SelectCommand = SqlClientCommand1
    UpdateBatchSize = 1000
    Left = 288
    Top = 228
  end
  object dsCustomers: TDataSource
    DataSet = ClrMemTable1
    OnDataChange = dsCustomersDataChange
    Left = 456
    Top = 244
  end
end
