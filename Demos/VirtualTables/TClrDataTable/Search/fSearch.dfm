inherited frmSearch: TfrmSearch
  Caption = 'Search'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 242
      Caption = 'Searching in DataTable'
      ExplicitWidth = 242
    end
  end
  inherited pnlMain: TPanel
    ExplicitHeight = 469
    inherited pnlConnDef: TPanel
      inherited btnConnect: TButton
        Width = 100
        Caption = 'Connect/Fetch'
        ExplicitWidth = 100
      end
    end
    inherited pnl1: TPanel
      ExplicitHeight = 382
      object pnl2: TPanel
        Left = 0
        Top = 0
        Width = 586
        Height = 382
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object pnlConnection: TPanel
          Left = 0
          Top = 0
          Width = 586
          Height = 113
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object lbl3: TLabel
            Left = 149
            Top = 11
            Width = 255
            Height = 13
            Caption = 'OrderID                  CustomerID                EmployeeID'
          end
          object lbl4: TLabel
            Left = 107
            Top = 83
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Locate expression:'
          end
          object lbl5: TLabel
            Left = 109
            Top = 33
            Width = 35
            Height = 13
            Caption = 'Values:'
          end
          object btnFindSorted: TButton
            Left = 11
            Top = 16
            Width = 76
            Height = 25
            Caption = 'Find sorted'
            Enabled = False
            TabOrder = 3
            OnClick = btnFindSortedClick
          end
          object btnLocate: TButton
            Left = 11
            Top = 80
            Width = 76
            Height = 25
            Caption = 'Locate'
            Enabled = False
            TabOrder = 5
            OnClick = btnLocateClick
          end
          object btnFindSorted2: TButton
            Left = 11
            Top = 47
            Width = 76
            Height = 25
            Caption = 'Find Sorted 2'
            Enabled = False
            TabOrder = 4
            OnClick = btnFindSorted2Click
          end
          object edtCustomerID: TEdit
            Left = 241
            Top = 30
            Width = 99
            Height = 21
            TabOrder = 0
          end
          object edtEmployeeID: TEdit
            Left = 344
            Top = 30
            Width = 98
            Height = 21
            TabOrder = 1
          end
          object cbLocate: TComboBox
            Left = 203
            Top = 80
            Width = 137
            Height = 21
            TabOrder = 2
            Text = 'ShipVia = 2'
            Items.Strings = (
              'ShipVia = 2'
              'ShipName = '#39'Hanari Carnes'#39)
          end
          object edtOrderID: TEdit
            Left = 149
            Top = 30
            Width = 87
            Height = 21
            TabOrder = 6
          end
        end
        object mmoConsole: TMemo
          Left = 0
          Top = 113
          Width = 586
          Height = 269
          Align = alClient
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
  object ClrDataTable1: TClrDataTable
    Left = 264
    Top = 320
  end
  object SqlClientDataAdapter1: TSqlClientDataAdapter
    Left = 384
    Top = 320
  end
  object SqlClientCommand1: TSqlClientCommand
    Connection = SqlClientConnection1
    Parameters = <>
    Left = 384
    Top = 380
  end
end
