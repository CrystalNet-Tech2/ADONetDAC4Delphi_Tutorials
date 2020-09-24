inherited frmRowFilter: TfrmRowFilter
  Caption = 'Row Filter'
  ClientWidth = 567
  ExplicitWidth = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    Width = 567
    ExplicitWidth = 567
    inherited bvlTitle: TBevel
      Width = 567
      ExplicitWidth = 567
    end
    inherited lblTitle: TLabel
      Width = 107
      Caption = 'Row Filter'
      ExplicitWidth = 107
    end
  end
  inherited pnlMain: TPanel
    Width = 567
    ExplicitWidth = 567
    inherited pnlConnDef: TPanel
      Width = 567
      ExplicitWidth = 567
      inherited btnConnect: TButton
        Width = 95
        Caption = 'Connect/Fetch'
        ExplicitWidth = 95
      end
    end
    inherited pnl1: TPanel
      Width = 567
      ExplicitWidth = 567
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 567
        Height = 382
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlConnection: TPanel
          Left = 0
          Top = 0
          Width = 567
          Height = 123
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl3: TLabel
            Left = 4
            Top = 12
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'RowFilter example:'
          end
          object lbl4: TLabel
            Left = 160
            Top = 12
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'RowStateFilter:'
          end
          object btnChange: TButton
            Left = 7
            Top = 58
            Width = 89
            Height = 25
            Caption = 'Change data'
            Enabled = False
            TabOrder = 2
            OnClick = btnChangeClick
          end
          object btnAccept: TButton
            Left = 102
            Top = 58
            Width = 96
            Height = 25
            Caption = 'Accept Changes'
            Enabled = False
            TabOrder = 4
            OnClick = btnAcceptClick
          end
          object btnResetFilters: TButton
            Left = 320
            Top = 27
            Width = 96
            Height = 25
            Caption = 'Reset filters'
            Enabled = False
            TabOrder = 3
            OnClick = btnResetFiltersClick
          end
          object cbRowStates: TComboBox
            Left = 163
            Top = 29
            Width = 150
            Height = 21
            Style = csDropDownList
            Enabled = False
            TabOrder = 0
            OnChange = cbRowStatesChange
            Items.Strings = (
              'drvsNone'
              'drvsUnchanged'
              'drvsAdded'
              'drvsDeleted'
              'drvsModifiedCurrent'
              'drvsCurrentRows'
              'drvsModifiedOriginal'
              'drvsOriginalRows')
          end
          object cbRowFilter: TComboBox
            Left = 7
            Top = 29
            Width = 150
            Height = 21
            Enabled = False
            TabOrder = 1
            OnChange = cbRowFilterChange
            Items.Strings = (
              'EmployeeID < 2'
              'EmployeeID > 2'
              'ShipVia IN (1, 2)'
              'ShipVia NOT IN (0, 3)'
              'OrderID = 10248'
              'OrderID >=10248'
              'CustomerID LIKE '#39'H*'#39
              'CustomerID LIKE '#39'%A%'#39
              'CustomerID NOT LIKE '#39'H*'#39
              'OrderDate = #1996-07-04#'
              'OrderDate > #1996-07-04#')
          end
        end
        object mmoConsole: TMemo
          Left = 6
          Top = 89
          Width = 558
          Height = 289
          Align = alCustom
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssBoth
          TabOrder = 1
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Width = 567
    ExplicitWidth = 567
    inherited bvlButtons: TBevel
      Width = 567
      ExplicitWidth = 567
    end
    inherited btnClose: TButton
      Left = 489
      ExplicitLeft = 489
    end
  end
  object SqlClientCommand1: TSqlClientCommand
    Connection = SqlClientConnection1
    Parameters = <>
    CommandText.Strings = (
      'Select * from Orders')
    Left = 312
    Top = 284
  end
  object SqlClientDataAdapter1: TSqlClientDataAdapter
    SelectCommand = SqlClientCommand1
    Left = 312
    Top = 348
  end
  object ClrDataTable1: TClrDataTable
    Left = 448
    Top = 288
  end
end
