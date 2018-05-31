object TargetDisclaimerF: TTargetDisclaimerF
  Left = 669
  Top = 317
  Width = 287
  Height = 234
  Caption = 'TargetDisclaimerF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object TextRetriever: TMemo
    Left = 72
    Top = 8
    Width = 185
    Height = 89
    Lines.Strings = (
      'TextRetriever')
    TabOrder = 0
    Visible = False
  end
  object TextTemplateConverter1: TTextTemplateConverter
    Params = <
      item
        Name = '<CLIENT NAME>'
      end
      item
        Name = '<PERIOD END>'
      end
      item
        Name = '<CURRENT DATE>'
      end>
    Left = 24
    Top = 8
  end
end
