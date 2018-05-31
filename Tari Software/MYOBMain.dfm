object MyobMainF: TMyobMainF
  Left = 383
  Top = 208
  Width = 877
  Height = 750
  Caption = 'MYOB Interface'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ChartofAccountLoadsBtn: TButton
    Left = 16
    Top = 24
    Width = 105
    Height = 49
    Caption = 'Load Chart of Accounts'
    TabOrder = 0
    WordWrap = True
    OnClick = ChartofAccountLoadsBtnClick
  end
  object LoadTrialBalanceBtn: TButton
    Left = 136
    Top = 24
    Width = 113
    Height = 49
    Caption = 'Load Balances'
    TabOrder = 1
    OnClick = LoadTrialBalanceBtnClick
  end
  object CreateTBBtn: TButton
    Left = 264
    Top = 24
    Width = 121
    Height = 49
    Caption = 'Create Trial Balance'
    TabOrder = 2
    OnClick = CreateTBBtnClick
  end
  object ComboBox1: TComboBox
    Left = 416
    Top = 8
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = 'ComboBox1'
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 400
    Top = 32
    DataBinding.DataField = 'FIRST_PERIOD'
    DataBinding.DataSource = DMMYOBData.DSFB_MYOBInfo
    TabOrder = 4
    Width = 193
  end
  object cxDBDateEdit2: TcxDBDateEdit
    Left = 400
    Top = 56
    DataBinding.DataField = 'LAST_PERIOD'
    DataBinding.DataSource = DMMYOBData.DSFB_MYOBInfo
    TabOrder = 5
    Width = 193
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 96
    Width = 825
    Height = 569
    DataSource = DMMYOBData.DSSalesLines
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 648
    Top = 40
    Width = 153
    Height = 25
    Caption = 'Get Trans'
    TabOrder = 7
    OnClick = Button1Click
  end
end
