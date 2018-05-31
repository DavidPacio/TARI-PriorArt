object PlanExtensionF: TPlanExtensionF
  Left = 647
  Top = 401
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'PlanExtensionF'
  ClientHeight = 498
  ClientWidth = 414
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object SelectionGroup: TcxRadioGroup
    Left = 40
    Top = 104
    Caption = 'Select an Option'
    Properties.Items = <
      item
        Caption = 'Copy from the Target Period selected below'
      end
      item
        Caption = 'Copy from the Tracking Period selected below'
      end
      item
        Caption = 'Clear all pervious targets for this period'
      end>
    TabOrder = 0
    OnClick = RadioGroup1Click
    Height = 113
    Width = 337
  end
  object CopySection: TcxCheckListBox
    Left = 88
    Top = 344
    Width = 193
    Height = 65
    Items = <
      item
        Text = 'Income and Sales Drivers'
      end
      item
        Text = 'Other Income'
      end
      item
        Text = 'Expenses'
      end>
    TabOrder = 1
  end
  object cxButton1: TcxButton
    Left = 40
    Top = 440
    Width = 129
    Height = 41
    Caption = 'Copy'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000230B0000230B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFB5B4B4C0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BF
      BFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      D5D4D4FDFDFCFBFBFAF8F8F7F6F6F5F4F4F3F2F2F1EFEFEEEDEDECEBEBEAE9E9
      E8E5E5E5E0E0E0DADADAD4D4D4D2D2D2C0BFBFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D4D4FEFEFDFDFDFCFBFBFA
      F8F8F7F6F6F5F4F4F3F2F2F1EFEFEEEDEDECECECEBEAEAE9E8E8E7E2E2E2DDDD
      DDD7D7D7C0BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFD5D4D4FEFEFD7F7F7F7C7C7B7F7F7FF9F9F8B7B7B7787877
      878787F0F0EF70706F979797B7B7B7E8E8E7525251DDDDDDC0BFBFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D4D4FE
      FEFDFEFEFDFEFEFDDFDFDEFCFCFBEBEBEADFDFDEF5F5F4F3F3F2EFEFEEEEEEED
      EBEBEAEAEAE9E1E1E0E2E2E2C0BFBFFF00FFFF00FFB5B4B4C0BFBFC0BFBFC0BF
      BFC0BFBFC0BFBFC0BFBFC0BFBFA8A8A9D5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFE
      FEFDFCFCFBF9F9F8F7F7F6F5F5F4F3F3F2F0F0EFEEEEEDECECEBB7B7B7E8E8E7
      C0BFBFFF00FFFF00FFD5D4D4FDFDFCFBFBFAF8F8F7F6F6F5F4F4F3F2F2F1EFEF
      EED2D2D2D5D4D4FEFEFD7F7F7FB7B7B77F7F7FFEFEFDA7A7A7878787B7B7B7F7
      F7F6979797979797939393D3D3D2878787EAEAE9C0BFBFFF00FFFF00FFD5D4D4
      FEFEFDFDFDFCFBFBFAF8F8F7F6F6F5F4F4F3F2F2F1D2D2D2D5D4D4FEFEFDFEFE
      FDFEFEFDDFDFDEFEFEFDFEFEFDFEFEFDEBEBEAF9F9F8F7F7F6B7B7B7F3F3F2F0
      F0EFEEEEEDECECEBC0BFBFFF00FFFF00FFD5D4D4FEFEFD7F7F7F7C7C7B7F7F7F
      F9F9F8B7B7B7787877878787D5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
      FDFEFEFDFEFEFDFCFCFBDBDBDAF7F7F6F5F5F4F3F3F2B7B7B7EEEEEDC0BFBFFF
      00FFFF00FFD5D4D4FEFEFDFEFEFDFEFEFDDFDFDEFCFCFBEBEBEADFDFDED2D2D2
      D5D4D4FEFEFD7F7F7F7C7C7BB7B7B7FEFEFD787877878787BBBBBB8787879797
      97F9F9F8979797979797939393F0F0EFC0BFBFFF00FFFF00FFD5D4D4FEFEFDFE
      FEFDFEFEFDFEFEFDFEFEFDFCFCFBF9F9F8D2D2D2D5D4D4FEFEFDFEFEFDFEFEFD
      DFDFDEFEFEFDDFDFDEFEFEFDDBDBDAFEFEFDFEFEFDFCFCFBFBFBFAF8F8F7F6F6
      F5F4F4F3C0BFBFFF00FFFF00FFD5D4D4FEFEFD7F7F7FB7B7B77F7F7FFEFEFDA7
      A7A7878787B7B7B7D5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
      FEFEFDFEFEFDFEFEFDFEFEFDFDFDFCFBFBFAF8F8F7F6F6F5C0BFBFFF00FFFF00
      FFD5D4D4FEFEFDFEFEFDFEFEFDDFDFDEFEFEFDFEFEFDFEFEFDD2D2D2D5D4D4FE
      FEFD979797737372BBBBBB878787979797FEFEFD7F7F7FDBDBDAB7B7B77F7F7F
      777776FDFDFC7F7F7FF8F8F7C0BFBFFF00FFFF00FFD5D4D4FEFEFDFEFEFDFEFE
      FDFEFEFDFEFEFDFEFEFDFEFEFDD2D2D2D5D4D4FEFEFDDFDFDEECECEBFEFEFDFE
      FEFDFEFEFDFEFEFDFEFEFDFEFEFDEBEBEAFEFEFDECECEBFEFEFDFDFDFCDEDEDE
      C0BFBFFF00FFFF00FFD5D4D4FEFEFD7F7F7F7C7C7BB7B7B7FEFEFD7878778787
      87BBBBBBD5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDDB
      DBDAFEFEFDFEFEFDFEFEFDF1F1EFDEDEDED3D3D3C0BFBFFF00FFFF00FFD5D4D4
      FEFEFDFEFEFDFEFEFDDFDFDEFEFEFDDFDFDEFEFEFDD2D2D2D5D4D4FEFEFDBFBF
      BE787877878787FEFEFDB7B7B78D8D8D979797B7B7B7FEFEFDF7F7F7AEAFAF9B
      9E9F999C9E999C9EC0BFBFFF00FFFF00FFD5D4D4FEFEFDFEFEFDFEFEFDFEFEFD
      FEFEFDFEFEFDFEFEFDD2D2D2D5D4D4FEFEFDAFAFAFD2D2D1FEFEFDFEFEFDDBDB
      DAEFEFEEFEFEFDEBEBEAFEFEFDE2E2E2A8A8A9DCDDDEE2E3E4E5E6E6C0BFBFFF
      00FFFF00FFD5D4D4FEFEFD979797737372BBBBBB878787979797FEFEFD7F7F7F
      D5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
      FDE1E1E1B4B4B4FFFFFFEDEDECC0BFBFFF00FFFF00FFFF00FFD5D4D4FEFEFDDF
      DFDEECECEBFEFEFDFEFEFDFEFEFDFEFEFDD2D2D2D5D4D4FEFEFDFEFEFDFEFEFD
      FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDE1E1E1B3B3B3EDEDECC0BF
      BFFF00FFFF00FFFF00FFFF00FFD5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
      FEFDFEFEFDD2D2D2D5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
      FEFEFDFEFEFDFEFEFDE1E1E1B1A8A5C0BFBFFF00FFFF00FFFF00FFFF00FFFF00
      FFD5D4D4FEFEFDBFBFBE787877878787FEFEFDB7B7B78D8D8D979797D5D4D4C0
      BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBF
      C0BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D4D4FEFEFDAFAFAFD2D2
      D1FEFEFDFEFEFDDBDBDAEFEFEEFEFEFDEBEBEAFEFEFDF7F7F7A8A8A9DCDDDEE2
      E3E4E5E6E6C0BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFD5D4D4FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
      FDFEFEFDFEFEFDFEFEFDE1E1E1B4B4B4FFFFFFEDEDECC0BFBFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D4D4
      FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDE1E1
      E1B3B3B3EDEDECC0BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFD5D4D4FEFEFDFEFEFDFEFEFDFEFEFD
      FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDE1E1E1B1A8A5C0BFBFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFD5D4D4C0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBF
      C0BFBFC0BFBFC0BFBFC0BFBFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 2
    OnClick = cxButton1Click
  end
  object FromDate: TcxDateEdit
    Left = 88
    Top = 272
    Properties.Alignment.Vert = taVCenter
    Properties.DateButtons = []
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 3
    Width = 97
  end
  object ToDate: TcxDateEdit
    Left = 224
    Top = 272
    Properties.Alignment.Vert = taVCenter
    Properties.DateButtons = []
    Properties.SaveTime = False
    Properties.ShowTime = False
    TabOrder = 4
    Width = 97
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 56
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Department'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 72
  end
  object cxLabel2: TcxLabel
    Left = 88
    Top = 48
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -21
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Height = 28
    Width = 313
  end
  object cxLabel4: TcxLabel
    Left = 40
    Top = 240
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Period from the source to be copied'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 26
    Width = 337
  end
  object cxLabel5: TcxLabel
    Left = 40
    Top = 272
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'From'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Width = 31
  end
  object cxLabel6: TcxLabel
    Left = 192
    Top = 272
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'To'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Width = 16
  end
  object cxLabel7: TcxLabel
    Left = 88
    Top = 320
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Check sections to be copied'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 34
    Width = 249
  end
  object CancelBtn: TcxButton
    Left = 248
    Top = 440
    Width = 129
    Height = 41
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 11
    OnClick = CancelBtnClick
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 24
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Business'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 50
  end
  object cxLabel8: TcxLabel
    Left = 88
    Top = 16
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -21
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Height = 28
    Width = 313
  end
end
