object frmMainDemo: TfrmMainDemo
  Left = 372
  Top = 334
  Caption = 'MemTable Editor'
  ClientHeight = 548
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 414
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object bvlTitle: TBevel
      Left = 0
      Top = 0
      Width = 414
      Height = 53
      Align = alClient
      Shape = bsBottomLine
      ExplicitWidth = 584
    end
    object lblTitle: TLabel
      Left = 6
      Top = 12
      Width = 177
      Height = 25
      Caption = 'MemTable Editor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 53
    Width = 414
    Height = 458
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      414
      458)
    object lbl1: TLabel
      Left = 8
      Top = 232
      Width = 32
      Height = 13
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl2: TLabel
      Left = 267
      Top = 104
      Width = 27
      Height = 13
      Caption = 'Fields'
    end
    object dbgrd1: TDBGrid
      Left = 8
      Top = 248
      Width = 401
      Height = 175
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = dsMemtable
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnTitleClick = dbgrd1TitleClick
    end
    object pgcMain: TPageControl
      Left = 8
      Top = 8
      Width = 403
      Height = 217
      ActivePage = ts4
      TabOrder = 1
      object ts1: TTabSheet
        Caption = 'Content'
        ImageIndex = 6
        object btnLoadFromFile: TButton
          Left = 11
          Top = 11
          Width = 130
          Height = 25
          Caption = 'Load from file'
          TabOrder = 0
          OnClick = btnLoadFromFileClick
        end
        object btnSaveToFile: TButton
          Left = 11
          Top = 42
          Width = 130
          Height = 25
          Caption = 'Save to file'
          TabOrder = 1
          OnClick = btnSaveToFileClick
        end
        object btnReset: TButton
          Left = 12
          Top = 73
          Width = 129
          Height = 25
          Caption = 'Reset'
          TabOrder = 2
          OnClick = btnResetClick
        end
      end
      object ts2: TTabSheet
        Caption = 'Fields'
        ImageIndex = 5
        object lbl3: TLabel
          Left = 2
          Top = 0
          Width = 38
          Height = 13
          Caption = 'Fields:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl4: TLabel
          Left = 128
          Top = 0
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object lbl5: TLabel
          Left = 128
          Top = 36
          Width = 46
          Height = 13
          Caption = 'Data type'
        end
        object lbl6: TLabel
          Left = 129
          Top = 75
          Width = 20
          Height = 13
          Caption = 'Size'
        end
        object lbl7: TLabel
          Left = 191
          Top = 75
          Width = 43
          Height = 13
          Caption = 'Precision'
        end
        object lstFields: TListBox
          Left = 2
          Top = 14
          Width = 121
          Height = 171
          Hint = 'Field list'
          ItemHeight = 13
          TabOrder = 0
          OnClick = lstFieldsClick
        end
        object edtFldName: TEdit
          Left = 129
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtFldSize: TEdit
          Left = 129
          Top = 89
          Width = 56
          Height = 21
          TabOrder = 2
        end
        object edtFldPrec: TEdit
          Left = 191
          Top = 89
          Width = 56
          Height = 21
          TabOrder = 3
        end
        object cbFldDataType: TComboBox
          Left = 129
          Top = 55
          Width = 145
          Height = 21
          Style = csDropDownList
          TabOrder = 4
        end
        object btnFldAdd: TButton
          Left = 129
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Add'
          TabOrder = 5
          OnClick = btnFldAddClick
        end
        object btnFldDel: TButton
          Left = 169
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Del'
          TabOrder = 6
          OnClick = btnFldDelClick
        end
        object btnFldMod: TButton
          Left = 209
          Top = 161
          Width = 41
          Height = 25
          Caption = 'Mod'
          TabOrder = 7
          OnClick = btnFldModClick
        end
        object chkFldRequired: TCheckBox
          Left = 129
          Top = 116
          Width = 78
          Height = 17
          Caption = 'faRequired'
          TabOrder = 8
        end
        object chkFldReadOnly: TCheckBox
          Left = 129
          Top = 132
          Width = 78
          Height = 17
          Caption = 'faReadonly'
          TabOrder = 9
        end
      end
      object ts3: TTabSheet
        Caption = 'Indexes'
        object lbl8: TLabel
          Left = 2
          Top = 0
          Width = 49
          Height = 13
          Caption = 'Indexes:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lbl9: TLabel
          Left = 128
          Top = 0
          Width = 28
          Height = 13
          Caption = 'Name'
        end
        object lbl10: TLabel
          Left = 128
          Top = 36
          Width = 27
          Height = 13
          Caption = 'Fields'
        end
        object lbl11: TLabel
          Left = 128
          Top = 72
          Width = 67
          Height = 13
          Caption = 'Case ins fields'
        end
        object lbl12: TLabel
          Left = 256
          Top = 0
          Width = 52
          Height = 13
          Caption = 'Desc fields'
        end
        object lbl13: TLabel
          Left = 256
          Top = 36
          Width = 51
          Height = 13
          Caption = 'Expression'
        end
        object lstIndexes: TListBox
          Left = 2
          Top = 14
          Width = 121
          Height = 171
          Hint = 'Index list'
          ItemHeight = 13
          TabOrder = 0
          OnClick = lstIndexesClick
          OnDblClick = lstIndexesDblClick
        end
        object edtIndName: TEdit
          Left = 128
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtIndFields: TEdit
          Left = 128
          Top = 50
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object chkIndPrimary: TCheckBox
          Left = 129
          Top = 109
          Width = 97
          Height = 17
          Caption = 'soPrimary'
          TabOrder = 6
        end
        object chkIndDesc: TCheckBox
          Left = 129
          Top = 125
          Width = 112
          Height = 17
          Caption = 'soDescending'
          TabOrder = 7
        end
        object chkIndUnique: TCheckBox
          Left = 129
          Top = 141
          Width = 97
          Height = 17
          Caption = 'soUnique'
          TabOrder = 8
        end
        object chkIndNoCase: TCheckBox
          Left = 249
          Top = 109
          Width = 102
          Height = 17
          Caption = 'soNoCase'
          TabOrder = 9
        end
        object btnIndAdd: TButton
          Left = 129
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Add'
          TabOrder = 10
          OnClick = btnIndAddClick
        end
        object btnIndDel: TButton
          Left = 169
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Del'
          TabOrder = 11
          OnClick = btnIndDelClick
        end
        object btnIndMod: TButton
          Left = 209
          Top = 160
          Width = 41
          Height = 25
          Caption = 'Mod'
          TabOrder = 12
          OnClick = btnIndModClick
        end
        object btnIndClearAll: TButton
          Left = 265
          Top = 160
          Width = 49
          Height = 25
          Caption = 'Clear All'
          TabOrder = 13
          OnClick = btnIndClearAllClick
        end
        object edtIndInsFields: TEdit
          Left = 128
          Top = 86
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object edtIndDescFields: TEdit
          Left = 256
          Top = 14
          Width = 121
          Height = 21
          TabOrder = 4
        end
        object edtIndExpression: TEdit
          Left = 256
          Top = 50
          Width = 121
          Height = 21
          TabOrder = 5
        end
      end
      object ts4: TTabSheet
        Caption = 'Filter'
        ImageIndex = 2
        object lbl14: TLabel
          Left = 8
          Top = 8
          Width = 29
          Height = 13
          Caption = 'Filter'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtFltExp: TEdit
          Left = 8
          Top = 24
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object chkFltActive: TCheckBox
          Left = 9
          Top = 48
          Width = 57
          Height = 17
          Caption = 'Active'
          TabOrder = 1
          OnClick = chkFltActiveClick
        end
        object chkFltFound: TCheckBox
          Left = 176
          Top = 72
          Width = 57
          Height = 17
          Caption = 'Found'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object btnFltFirst: TButton
          Left = 8
          Top = 68
          Width = 33
          Height = 25
          Caption = '<<'
          TabOrder = 3
          OnClick = btnFltFirstClick
        end
        object btnFltPrev: TButton
          Left = 40
          Top = 68
          Width = 33
          Height = 25
          Caption = '<'
          TabOrder = 4
          OnClick = btnFltPrevClick
        end
        object btnFltNext: TButton
          Left = 72
          Top = 68
          Width = 33
          Height = 25
          Caption = '>'
          TabOrder = 5
          OnClick = btnFltNextClick
        end
        object btnFltLast: TButton
          Left = 104
          Top = 68
          Width = 33
          Height = 25
          Caption = '>>'
          TabOrder = 6
          OnClick = btnFltLastClick
        end
      end
    end
    object dbnvgr1: TDBNavigator
      Left = 8
      Top = 427
      Width = 234
      Height = 25
      DataSource = dsMemtable
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
      Anchors = [akLeft, akBottom]
      TabOrder = 2
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 511
    Width = 414
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      414
      37)
    object bvlButtons: TBevel
      Left = 0
      Top = 0
      Width = 414
      Height = 37
      Align = alClient
      Shape = bsTopLine
      ExplicitWidth = 642
    end
    object btnClose: TButton
      Left = 550
      Top = 7
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
    end
    object btn1: TButton
      Left = 330
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = btn1Click
    end
  end
  object dsMemtable: TDataSource
    DataSet = ClrMemTable1
    Left = 128
    Top = 304
  end
  object dlgOpen1: TOpenDialog
    Filter = 
      'Binary files|*.fds|XML files|*.xml|JSON files|*.json|All files|*' +
      '.*'
    Left = 232
    Top = 344
  end
  object dlgSave1: TSaveDialog
    Left = 312
    Top = 325
  end
  object ClrMemTable1: TClrMemTable
    Left = 80
    Top = 365
  end
end
