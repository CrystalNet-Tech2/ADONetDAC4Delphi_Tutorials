inherited frmBlobs: TfrmBlobs
  Caption = 'Blobs'
  ClientHeight = 578
  ExplicitHeight = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlTitle: TPanel
    inherited lblTitle: TLabel
      Width = 57
      Caption = 'Blobs'
      ExplicitWidth = 57
    end
  end
  inherited pnlMain: TPanel
    Height = 488
    ExplicitHeight = 488
    inherited pnl1: TPanel
      Height = 401
      ExplicitHeight = 401
      inherited pgcMain: TPageControl
        Height = 401
        ExplicitHeight = 401
        inherited tsData: TTabSheet
          ExplicitHeight = 370
          object spl1: TSplitter
            Left = 0
            Top = 225
            Width = 578
            Height = 2
            Cursor = crVSplit
            Align = alTop
          end
          object spl2: TSplitter
            Left = 257
            Top = 227
            Height = 143
            ExplicitHeight = 183
          end
          object img1: TImage
            Left = 260
            Top = 227
            Width = 318
            Height = 143
            Align = alClient
            Center = True
            Stretch = True
            ExplicitTop = 228
            ExplicitWidth = 360
            ExplicitHeight = 183
          end
          object pnl2: TPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            ParentColor = True
            TabOrder = 0
            object btnClrPic: TButton
              Left = 247
              Top = 7
              Width = 68
              Height = 25
              Caption = 'Clear Picture'
              TabOrder = 1
              OnClick = btnClrPicClick
            end
            object btnSavePic: TButton
              Left = 320
              Top = 7
              Width = 68
              Height = 25
              Caption = 'Save Picture'
              TabOrder = 2
              OnClick = btnSavePicClick
            end
            object btnLoadPic: TButton
              Left = 393
              Top = 7
              Width = 73
              Height = 25
              Caption = 'Load Picture'
              TabOrder = 3
              OnClick = btnLoadPicClick
            end
            object dbnvgr1: TDBNavigator
              Left = 1
              Top = 7
              Width = 240
              Height = 25
              DataSource = dsCategories
              Flat = True
              TabOrder = 0
            end
          end
          object dbgrd1: TDBGrid
            Left = 0
            Top = 41
            Width = 578
            Height = 184
            Align = alTop
            DataSource = dsCategories
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
          end
          object dbmmoDescription: TDBMemo
            Left = 0
            Top = 227
            Width = 257
            Height = 143
            Align = alLeft
            DataField = 'Description'
            DataSource = dsCategories
            TabOrder = 2
          end
        end
        inherited tsOptions: TTabSheet
          ExplicitHeight = 370
          inherited pnlTree: TPanel
            Height = 329
            ExplicitHeight = 329
            inherited grp1: TGroupBox
              inherited edtMinMemoSize: TEdit
                OnKeyPress = nil
              end
            end
            inherited grp2: TGroupBox
              inherited cbUpdateMode: TComboBox
                Enabled = False
              end
              inherited edtUpdateBatchSize: TEdit
                OnKeyPress = nil
              end
            end
          end
        end
      end
    end
  end
  inherited pnlButtons: TPanel
    Top = 541
    ExplicitTop = 541
  end
  inherited SqlClientConnection1: TSqlClientConnection
    ConnectionString = 'MultipleActiveResultSets=True'
    Params.MultipleActiveResultSets = True
  end
  object dlgSave1: TSaveDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp|All files (*.*)|*.*'
    Left = 271
    Top = 296
  end
  object dsCategories: TDataSource
    DataSet = SqlClientQueryCategories
    OnDataChange = dsCategoriesDataChange
    Left = 344
    Top = 256
  end
  object dlgOpen1: TOpenDialog
    DefaultExt = 'bmp'
    Filter = 'Bitmap files (*.bmp)|*.bmp|All files (*.*)|*.*'
    Left = 408
    Top = 304
  end
  object SqlClientQueryCategories: TSqlClientQuery
    Connection = SqlClientConnection1
    Parameters = <>
    SQL.Strings = (
      'Select * from Categories')
    Left = 460
    Top = 231
  end
end
