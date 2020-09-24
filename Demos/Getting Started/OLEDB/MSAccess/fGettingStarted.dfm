object frmGettingStarted: TfrmGettingStarted
  Left = 610
  Top = 285
  Caption = 'Getting started'
  ClientHeight = 576
  ClientWidth = 634
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 634
    Height = 41
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object bvlTitle: TBevel
      Left = 0
      Top = 0
      Width = 634
      Height = 41
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      Shape = bsBottomLine
      ExplicitWidth = 466
    end
    object lblTitle: TLabel
      Left = 5
      Top = 10
      Width = 202
      Height = 21
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = 'MSAccess OLEDB Demo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 41
    Width = 634
    Height = 512
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnlSubPageControl: TPanel
      Left = 0
      Top = 89
      Width = 634
      Height = 423
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alClient
      BorderWidth = 4
      TabOrder = 0
      object Splitter1: TSplitter
        Left = 5
        Top = 112
        Width = 624
        Height = 4
        Cursor = crVSplit
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        ExplicitLeft = 4
        ExplicitTop = 111
        ExplicitWidth = 505
      end
      object grdCategories: TDBGrid
        Left = 5
        Top = 25
        Width = 624
        Height = 87
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alTop
        DataSource = dsCustomers
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object grdProducts: TDBGrid
        Left = 5
        Top = 137
        Width = 624
        Height = 246
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        DataSource = dsProducts
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object nvgCategories: TDBNavigator
        Left = 5
        Top = 5
        Width = 624
        Height = 20
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        DataSource = dsCustomers
        Align = alTop
        Flat = True
        TabOrder = 2
      end
      object nvgProducts: TDBNavigator
        Left = 5
        Top = 116
        Width = 624
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        DataSource = dsProducts
        Align = alTop
        Flat = True
        TabOrder = 3
      end
      object pnlMisc: TPanel
        Left = 5
        Top = 383
        Width = 624
        Height = 35
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 4
        object btnUpdate: TButton
          Left = 91
          Top = 5
          Width = 85
          Height = 25
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Update'
          TabOrder = 0
          OnClick = btnUpdateClick
        end
        object btnInsert: TButton
          Left = 0
          Top = 5
          Width = 85
          Height = 25
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Insert'
          TabOrder = 1
          OnClick = btnInsertClick
        end
        object btnDelete: TButton
          Left = 182
          Top = 5
          Width = 85
          Height = 25
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = 'Delete'
          TabOrder = 2
          OnClick = btnDeleteClick
        end
      end
    end
    object pnlConnDef: TPanel
      Left = 0
      Top = 0
      Width = 634
      Height = 89
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object imgConnect: TImage
        Left = 4
        Top = 0
        Width = 29
        Height = 28
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Center = True
        Picture.Data = {
          07544269746D617076060000424D760600000000000036040000280000001800
          000018000000010008000000000040020000C30E0000C30E0000000100000001
          0000393939004239390031424200424242005242420039424A00424A4A004A4A
          4A00634A4A00425252004A52520052525200635252006B525200735252007B52
          52005A5A5A00635A5A006B5A5A00735A5A007B5A5A00845A5A00636363007B63
          6300846363008C636300946363009C636300636B6B006B6B6B00736B6B007B6B
          6B00946B6B009C6B6B00A56B6B00AD6B6B00B56B6B00315A7300527373006373
          7300737373009C737300A5737300AD737300B5737300BD7373007B7B7B008C7B
          7B00A57B7B00B57B7B00BD7B7B00C67B7B00CE7B7B00D67B7B00426B84004A6B
          840039738400527B8400637B84005A8484007B848400848484008C8484009C84
          8400AD848400B5848400BD848400CE848400D6848400296B8C004A7B8C005A8C
          8C008C8C8C00A58C8C00B58C8C00BD8C8C00C68C8C00CE8C8C00D68C8C00DE8C
          8C00E78C8C00EF8C8C005284940094949400A5949400C6949400CE949400D694
          9400E794940018739C0063949C009C9C9C00BD9C9C00CE9C9C00D69C9C00DE9C
          9C00E79C9C006B94A500639CA500A5A5A500B5A5A500BDA5A500D6A5A500DEA5
          A500E7A5A500107BAD00B5ADAD00BDADAD00C6ADAD00DEADAD00E7ADAD00EFAD
          FD001884B5006BA5B500DEB5B500E7B5B500EFB5B50052A5BD006BADBD00D6BD
          BD00E7BDBD00EFBDBD00F7BDBD00298CC6004A9CC6007BB5C600E7C6C600EFC6
          C600F7C6C600FFC6C6007BC6CE00EFCECE00F7CECE00FFCECE00E7D6D600FFD6
          D60042A5DE0063B5DE0073C6DE0084D6DE00A5DEDE00F7DEDE00FFDEDE00B5E7
          E700F7E7E700FFE7E700ADEFEF00F7EFEF00FFEFEF0063CEF70073CEF7007BDE
          F700FFF7F700FF00FF0063C6FF0073DEFF007BDEFF0084E7FF0084EFFF0094F7
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00999999999999999999999999994816169999999999999999999999999999
          9999999999993C3B710928999999999999999999999999999999999999991C9D
          9C46104899999999999999999948102E9999999999992E899A7C03283D3D9999
          99999999274747075399999999995336887B06141A132E9999999999769D8A00
          1D99999999531E027069371B3219169999999999529A9A050B2E3D1F18214301
          759B611B44320C48999999993A88882504151B335050500F629D7D1B5043141D
          9999999911596945081B2B4F4F4F4F22269F82224F4F22119999992A22389596
          071B2B44444444440A8F8F2244442C13999999324313979D391A2B4343434343
          0D575F2C434D42189999992B322B5A9F8B0E2C32323232322B435666665D4C17
          999999222C2C128C8F122B2C2C324D6673736E6D67664B1F999999212B2B2129
          4D2031566E808079684E35606D67313E9999992B212222415D7F8785806E575F
          6E8080746E6620999999993130778D9491837266727F8E87795F587473425499
          9999993330939894A0909094917F676E798480795D3F9999999999992C5CA098
          9898917E7E8D918785808055499999999999999999244A909894A098918E8785
          856E30649999999999999999999965295C869494918D78554A2F1E9999999999
          9999999999999999656C5C404A65656AA05B1D99999999999999999999999999
          999999999999995BA05B1699999999999999999999999999999999999999995B
          A05B28999999999999999999999999999999999999999963A05B289999999999
          9999}
        Transparent = True
      end
      object Label2: TLabel
        Left = 37
        Top = 10
        Width = 20
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'File:'
      end
      object Label4: TLabel
        Left = 37
        Top = 34
        Width = 50
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Password:'
      end
      object btnOpen: TSpeedButton
        Left = 362
        Top = 4
        Width = 19
        Height = 19
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Flat = True
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000620B0000620B0000000100000001000018A5C60018A5
          CE0029A5D60031A5D60018ADD60021ADD60029ADD60018ADDE0031B5DE0039BD
          E70052BDE7004AC6E7004AC6EF009CDEEF00ADDEEF006BDEF70073DEF700A5EF
          F700FF00FF0084EFFF008CEFFF0094EFFF008CF7FF0094F7FF00A5F7FF0094FF
          FF009CFFFF00ADFFFF00C6FFFF00D6FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00121212121212
          121212121212121212121206080512121212121212121212121212060D130B05
          0000001212121212121212060A1A19101010100B05001212121212060A1B1614
          14141010100C051212121206060E17171414141410100C121212120610061A16
          16161414141010001212120617060E111118141414101009121212061A100600
          00000E1613131010001212061A171010100F060E13131315031212061A171717
          1710100600020202001212061C191A1D1D14151010071212121212050D1C1C0D
          0400000000011212121212120806000012121212121212121212121212121212
          1212121212121212121212121212121212121212121212121212}
        OnClick = btnOpenClick
      end
      object edtDB: TEdit
        Left = 98
        Top = 5
        Width = 260
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 0
        Text = '..\..\DB\Data\MSAccess\dbdemos.mdb'
      end
      object edtPwd: TEdit
        Left = 98
        Top = 30
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        PasswordChar = '*'
        TabOrder = 1
      end
      object btnConnect: TButton
        Left = 98
        Top = 55
        Width = 84
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Connect'
        TabOrder = 2
        OnClick = btnConnectClick
      end
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 553
    Width = 634
    Height = 23
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Panels = <>
    SimplePanel = True
  end
  object dsProducts: TDataSource
    DataSet = OleDbQueryOrders
    Left = 488
    Top = 320
  end
  object dsCustomers: TDataSource
    DataSet = OleDbQueryCustomers
    Left = 336
    Top = 319
  end
  object dlgOpen: TOpenDialog
    DefaultExt = '*.mdb'
    Filter = 'MS Access 95 - 2000|*.mdb|MS Access 2003 - 2010|*.accdb'
    Left = 259
    Top = 272
  end
  object OleDbConnection1: TOleDbConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;OLE' +
      ' DB Services=-13'
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Params.ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Persist Security Info=False;OLE' +
      ' DB Services=-13'
    Params.OleDbServices = -13
    Params.PersistSecurityInfo = False
    Params.Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 200
    Top = 389
  end
  object OleDbQueryCustomers: TOleDbQuery
    Connection = OleDbConnection1
    Parameters = <>
    SQL.Strings = (
      'Select * from Customer')
    Left = 328
    Top = 389
  end
  object OleDbQueryOrders: TOleDbQuery
    Connection = OleDbConnection1
    MasterFields = 'CustNo'
    MasterSource = dsCustomers
    Parameters = <
      item
        Name = 'CustNo'
        Value = Null
      end>
    SQL.Strings = (
      'select * from Orders'
      'where CustNo = :CustNo')
    Left = 488
    Top = 389
  end
end
