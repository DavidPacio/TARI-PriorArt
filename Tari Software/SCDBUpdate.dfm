object SCDBUpdateF: TSCDBUpdateF
  Left = 389
  Top = 242
  Width = 992
  Height = 750
  Caption = 'SC Db Update'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 64
    Top = 40
    Width = 105
    Height = 25
    Caption = 'Open Database'
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 96
    Width = 929
    Height = 457
    DataSource = DMInterface.DSSCHistory
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DBNavigator1: TDBNavigator
    Left = 240
    Top = 48
    Width = 240
    Height = 25
    DataSource = DMInterface.DSSCHistory
    TabOrder = 2
  end
  object DBGrid2: TDBGrid
    Left = 24
    Top = 568
    Width = 697
    Height = 120
    DataSource = DMInterface.DSSCServices
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
end
