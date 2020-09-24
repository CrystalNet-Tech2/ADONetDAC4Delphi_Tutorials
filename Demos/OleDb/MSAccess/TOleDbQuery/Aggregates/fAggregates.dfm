inherited frmAggregates: TfrmAggregates
  Caption = 'Aggregates'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 119
      Caption = 'Aggregates'
      ExplicitWidth = 119
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      inherited pgcMain: TPageControl
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 305
          object pnl2: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 146
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object lbledtExpression: TLabeledEdit
              Left = 99
              Top = 91
              Width = 121
              Height = 21
              EditLabel.Width = 66
              EditLabel.Height = 13
              EditLabel.Caption = 'Expression = '
              LabelPosition = lpLeft
              TabOrder = 0
            end
            object lbledtMax: TLabeledEdit
              Left = 99
              Top = 64
              Width = 121
              Height = 21
              EditLabel.Width = 85
              EditLabel.Height = 13
              EditLabel.Caption = 'Max(AmountPaid)'
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 1
            end
            object lbledtAvg: TLabeledEdit
              Left = 334
              Top = 64
              Width = 121
              Height = 21
              EditLabel.Width = 98
              EditLabel.Height = 13
              EditLabel.Caption = 'Avg(AmountPaid) = '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 2
            end
            object lbledtSum: TLabeledEdit
              Left = 334
              Top = 91
              Width = 121
              Height = 21
              EditLabel.Width = 99
              EditLabel.Height = 13
              EditLabel.Caption = 'Sum(AmountPaid) = '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 4
            end
            object lbledtExprResult: TLabeledEdit
              Left = 99
              Top = 118
              Width = 121
              Height = 21
              EditLabel.Width = 44
              EditLabel.Height = 13
              EditLabel.Caption = 'Result = '
              LabelPosition = lpLeft
              TabOrder = 3
            end
            object mmo1: TMemo
              Left = 0
              Top = 0
              Width = 578
              Height = 57
              Align = alTop
              Color = clInfoBk
              Lines.Strings = (
                'Open the query by clicking on the Open Query Button.'
                'Press Compute Button for evaluation of the aggregrate functions.'
                
                  'Type an aggregate expression in the "Expression" edit box and pr' +
                  'ess the Compute Button for evaluation.'
                '')
              TabOrder = 5
            end
            object lbledtFilter: TLabeledEdit
              Left = 334
              Top = 118
              Width = 121
              Height = 21
              EditLabel.Width = 38
              EditLabel.Height = 13
              EditLabel.Caption = 'Filter = '
              LabelPosition = lpLeft
              TabOrder = 6
            end
            object btn1: TButton
              Left = 461
              Top = 63
              Width = 75
              Height = 25
              Caption = 'Compute'
              TabOrder = 7
              OnClick = btn1Click
            end
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 146
            Width = 578
            Height = 159
            Align = alClient
            DataSource = dsOrderDetails
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
          ExplicitHeight = 305
          inherited pnlTree: TPanel
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
  object dsOrderDetails: TDataSource
    DataSet = OleDbQueryAggregates
    Left = 288
    Top = 360
  end
  object OleDbQueryAggregates: TOleDbQuery
    Connection = OleDbConnection1
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM Orders')
    Left = 412
    Top = 371
  end
end
