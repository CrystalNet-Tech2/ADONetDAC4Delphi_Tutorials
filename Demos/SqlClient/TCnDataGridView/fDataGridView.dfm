inherited frmDataGridViewCachedUpdates: TfrmDataGridViewCachedUpdates
  Caption = 'Cached Updates with .Net DataGridView'
  ExplicitWidth = 320
  ExplicitHeight = 240
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 564
      Caption = 'Cached Updates/OnUpdateRecord with DataGridView'
      ExplicitWidth = 564
    end
  end
  inherited pnlMain: TPanel
    inherited pnl1: TPanel
      inherited pgcMain: TPageControl
        ActivePage = tsData
        inherited tsData: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          object pnl2: TPanel
            Left = 0
            Top = 274
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object btnApply: TButton
              Left = 1
              Top = 7
              Width = 84
              Height = 25
              Caption = 'Apply Updates'
              Enabled = False
              TabOrder = 0
              OnClick = btnApplyClick
            end
            object btnCancel: TButton
              Left = 94
              Top = 7
              Width = 100
              Height = 25
              Caption = 'Cancel Updates'
              Enabled = False
              TabOrder = 1
              OnClick = btnCancelClick
            end
          end
          object CnDataGridView1: TCnDataGridView
            Left = 0
            Top = 27
            Width = 578
            Height = 247
            Align = alClient
            CnDock = dsFill
            Location.Y = 27
            Size.Width = 578
            Size.Height = 247
            TabOrder = 1
            AllowUserToAddRows = False
            ColumnHeadersHeight = 23
            BindingSource = CnBindingSource1
          end
          object CnBindingNavigator1: TCnBindingNavigator
            Left = 0
            Top = 0
            Width = 578
            Height = 27
            Align = alTop
            CnDock = dsTop
            Size.Width = 578
            Size.Height = 27
            TabOrder = 2
            GripStyle = gsHidden
            Text = 'CnBindingNavigator1'
            BindingSource = CnBindingSource1
            CountItemFormat = 'of {0}'
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
          inherited pnlTree: TPanel
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
            end
          end
        end
        object ts1: TTabSheet
          Caption = 'OnUpdaterecord Log'
          ImageIndex = 2
          ExplicitLeft = 0
          ExplicitTop = 0
          ExplicitWidth = 0
          ExplicitHeight = 0
          object mmoLog: TMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 308
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited SqlClientConnection1: TSqlClientConnection
    Left = 304
    Top = 80
  end
  object SqlClientQueryProducts: TSqlClientQuery
    AfterOpen = SqlClientQueryProductsAfterOpen
    AfterClose = SqlClientQueryProductsAfterClose
    Connection = SqlClientConnection1
    FetchOptions.Unidirectional = False
    UpdateOptions.UpdateMode = umBatch
    Parameters = <>
    SQL.Strings = (
      'Select * from Products')
    OnUpdateRecord = SqlClientQueryProductsUpdateRecord
    Left = 444
    Top = 79
  end
  object CnBindingSource1: TCnBindingSource
    BindingDataSet = SqlClientQueryProducts
    Left = 396
    Top = 231
  end
end
