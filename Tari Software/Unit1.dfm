object Form1: TForm1
  Left = 411
  Top = 261
  BorderStyle = bsToolWindow
  BorderWidth = 3
  ClientHeight = 68
  ClientWidth = 158
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PastDatesRG: TcxRadioGroup
    Left = 0
    Top = 0
    Width = 158
    Height = 68
    Align = alClient
    Properties.Items = <>
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    TabOrder = 0
    OnClick = PastDatesRGClick
    Caption = 'Select a Past Period'
  end
end
