inherited frmFilter: TfrmFilter
  Caption = 'Filter'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 54
      Caption = 'Filter'
      ExplicitWidth = 54
    end
  end
  inherited pnlMain: TPanel
    Height = 440
    ExplicitHeight = 440
    inherited pnl1: TPanel
      Height = 332
      ExplicitHeight = 332
      inherited pgcMain: TPageControl
        Height = 325
        ActivePage = tsData
        ExplicitHeight = 325
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 294
          object pnl2: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 94
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object btnFilter1: TButton
              Left = 1
              Top = 33
              Width = 94
              Height = 25
              Caption = 'Using date field 1'
              TabOrder = 2
              OnClick = btnFilter1Click
            end
            object btnFilter2: TButton
              Left = 1
              Top = 63
              Width = 94
              Height = 25
              Caption = 'Using date field 2'
              TabOrder = 3
              OnClick = btnFilter2Click
            end
            object btnFilter3: TButton
              Left = 99
              Top = 33
              Width = 92
              Height = 25
              Caption = 'Using BETWEEN'
              TabOrder = 4
              OnClick = btnFilter3Click
            end
            object btnFilter4: TButton
              Left = 194
              Top = 33
              Width = 76
              Height = 25
              Caption = 'Using LIKE'
              TabOrder = 5
              OnClick = btnFilter4Click
            end
            object btnFilter6: TButton
              Left = 278
              Top = 5
              Width = 35
              Height = 25
              Caption = 'Set'
              TabOrder = 6
              OnClick = btnFilter6Click
            end
            object btnFilter5: TButton
              Left = 99
              Top = 63
              Width = 171
              Height = 25
              Caption = 'Using OnFilterRecord'
              TabOrder = 7
              OnClick = btnFilter5Click
            end
            object edtExample: TEdit
              Left = 1
              Top = 6
              Width = 270
              Height = 21
              TabOrder = 0
            end
            object mmoInfo: TMemo
              Left = 320
              Top = 5
              Width = 191
              Height = 83
              Color = clInfoBk
              Lines.Strings = (
                'You can see the filter examples '
                'pushing the buttons '#39'Using ...'#39' or '
                'type '
                'filter property value by hands in the '
                'Edit and press '#39'Set'#39' button')
              TabOrder = 1
            end
            object btnClear: TButton
              Left = 277
              Top = 32
              Width = 37
              Height = 25
              Caption = 'Clear'
              TabOrder = 8
              OnClick = btnClearClick
            end
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 94
            Width = 578
            Height = 200
            Align = alClient
            DataSource = dsOrders
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 294
          inherited pnlTree: TPanel
            Height = 253
            ExplicitHeight = 253
            inherited grp2: TGroupBox
              inherited chkReadOnly: TCheckBox
                Enabled = False
              end
              inherited chkRequestLive: TCheckBox
                Enabled = False
              end
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 493
    ExplicitTop = 493
  end
  object statStatus: TStatusBar [3]
    Left = 0
    Top = 530
    Width = 586
    Height = 19
    Panels = <
      item
        Width = 400
      end>
  end
  object dsOrders: TDataSource
    DataSet = OdbcQueryOrders
    OnDataChange = dsOrdersDataChange
    Left = 288
    Top = 320
  end
  object OdbcQueryOrders: TOdbcQuery
    OnFilterRecord = OdbcQueryOrdersFilterRecord
    Connection = OdbcConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'Select * from Orders.csv')
    Left = 368
    Top = 328
  end
end
