object PastPeriodSelectionF: TPastPeriodSelectionF
  Left = 470
  Top = 387
  BorderStyle = bsToolWindow
  BorderWidth = 3
  ClientHeight = 184
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PastDatesRG: TcxRadioGroup
    Left = 0
    Top = 0
    Align = alClient
    Caption = 'Select a Past Period'
    Properties.Items = <>
    TabOrder = 0
    OnClick = PastDatesRGClick
    Height = 184
    Width = 298
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 72
    Top = 16
  end
end
