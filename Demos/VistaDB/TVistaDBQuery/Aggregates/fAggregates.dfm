inherited frmAggregates: TfrmAggregates
  Caption = 'Aggregates'
  ClientHeight = 545
  ExplicitHeight = 584
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
    Height = 455
    ExplicitHeight = 455
    inherited pnl1: TPanel
      Height = 368
      ExplicitHeight = 368
      inherited pgcMain: TPageControl
        Height = 364
        ActivePage = tsData
        ExplicitHeight = 364
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 333
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
              EditLabel.Width = 70
              EditLabel.Height = 13
              EditLabel.Caption = 'Max(UnitPrice)'
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 1
            end
            object lbledtAvg: TLabeledEdit
              Left = 334
              Top = 64
              Width = 121
              Height = 21
              EditLabel.Width = 83
              EditLabel.Height = 13
              EditLabel.Caption = 'Avg(UnitPrice) = '
              LabelPosition = lpLeft
              ReadOnly = True
              TabOrder = 2
            end
            object lbledtSum: TLabeledEdit
              Left = 334
              Top = 91
              Width = 121
              Height = 21
              EditLabel.Width = 84
              EditLabel.Height = 13
              EditLabel.Caption = 'Sum(UnitPrice) = '
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
            Height = 187
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
          ExplicitHeight = 333
          inherited pnlTree: TPanel
            Height = 292
            ExplicitHeight = 292
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
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
    Top = 508
    ExplicitTop = 508
  end
  object dsOrderDetails: TDataSource
    DataSet = VistaDBQueryAggregates
    Left = 288
    Top = 360
  end
  object VistaDBQueryAggregates: TVistaDBQuery
    Connection = VistaDBConnection1
    UpdateOptions.UpdateMode = umBatch
    UpdateOptions.ReadOnly = True
    UpdateOptions.RequestLive = False
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM [Order Details]')
    Left = 396
    Top = 403
  end
end
