object frmORACLEMainCompBase: TfrmORACLEMainCompBase
  Left = 0
  Top = 0
  Caption = 'ORACLE Main Comp Base'
  ClientHeight = 559
  ClientWidth = 586
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 586
    Height = 53
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object bvlTitle: TBevel
      Left = 0
      Top = 0
      Width = 586
      Height = 53
      Align = alClient
      Shape = bsBottomLine
      ExplicitWidth = 467
    end
    object lblTitle: TLabel
      Left = 6
      Top = 12
      Width = 195
      Height = 25
      Caption = 'Demo Applications'
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
    Width = 586
    Height = 469
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object pnl1: TPanel
      Left = 0
      Top = 108
      Width = 586
      Height = 361
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object bvl1: TBevel
        Left = 0
        Top = 0
        Width = 586
        Height = 1
        Align = alTop
        Shape = bsTopLine
      end
    end
    object pnlConnDef: TPanel
      Left = 0
      Top = 0
      Width = 586
      Height = 108
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
      object lbl2: TLabel
        Left = 37
        Top = 7
        Width = 50
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Database:'
      end
      object lbl3: TLabel
        Left = 37
        Top = 33
        Width = 40
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'User ID:'
      end
      object lbl1: TLabel
        Left = 37
        Top = 60
        Width = 50
        Height = 13
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Password:'
      end
      object edtServer: TEdit
        Left = 98
        Top = 5
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 0
        Text = 'ORACLE_SERVER'
      end
      object edtDB: TEdit
        Left = 98
        Top = 31
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        TabOrder = 1
        Text = 'Northwind'
      end
      object btnConnect: TButton
        Left = 98
        Top = 79
        Width = 84
        Height = 25
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Caption = 'Connect'
        TabOrder = 3
        OnClick = btnConnectClick
      end
      object edtPass: TEdit
        Left = 98
        Top = 56
        Width = 121
        Height = 21
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        PasswordChar = '*'
        TabOrder = 2
      end
    end
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 522
    Width = 586
    Height = 37
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      586
      37)
    object bvlButtons: TBevel
      Left = 0
      Top = 0
      Width = 586
      Height = 37
      Align = alClient
      Shape = bsTopLine
      ExplicitWidth = 525
    end
    object btnClose: TButton
      Left = 508
      Top = 6
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
  object OracleClientConnection1: TOracleClientConnection
    LoginPrompt = False
    Left = 272
    Top = 85
  end
end
