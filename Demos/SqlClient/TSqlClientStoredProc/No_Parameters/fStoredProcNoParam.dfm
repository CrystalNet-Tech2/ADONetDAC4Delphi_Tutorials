inherited frmStoredProcNoParams: TfrmStoredProcNoParams
  Caption = 'Stored Procedure'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 181
      Caption = 'Stored Procedure'
      ExplicitWidth = 181
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
          object dbgrd1: TDBGrid
            Left = 0
            Top = 0
            Width = 578
            Height = 274
            Align = alClient
            DataSource = dsCategories
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object pnl2: TPanel
            Left = 0
            Top = 274
            Width = 578
            Height = 34
            Align = alBottom
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 1
            object dbnvgr1: TDBNavigator
              Left = 0
              Top = 6
              Width = 220
              Height = 25
              DataSource = dsCategories
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
              TabOrder = 0
            end
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitLeft = 4
          ExplicitTop = 27
          ExplicitWidth = 578
          ExplicitHeight = 308
        end
      end
    end
  end
  inherited SqlClientConnection1: TSqlClientConnection
    ConnectionString = 'MultipleActiveResultSets=True'
    Params.MultipleActiveResultSets = True
  end
  object dsCategories: TDataSource
    DataSet = SqlClientStoredProc1
    Left = 288
    Top = 256
  end
  object SqlClientStoredProc1: TSqlClientStoredProc
    Connection = SqlClientConnection1
    ProcedureName = '[Ten Most Expensive Products]'#13#10
    Parameters = <>
    Left = 404
    Top = 295
  end
end
