object Form1: TForm1
  Left = 231
  Top = 111
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Chart1: TChart
    Left = 32
    Top = 24
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.AutomaticMinimum = False
    BottomAxis.AxisValuesFormat = 'dd #13 mmm'
    BottomAxis.LabelsMultiLine = True
    BottomAxis.Maximum = 24
    TabOrder = 0
    PrintMargins = (
      15
      23
      15
      23)
  end
  object BitBtn1: TBitBtn
    Left = 40
    Top = 312
    Width = 75
    Height = 25
    Caption = 'BitBtn1'
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 176
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Change Size'
    TabOrder = 2
    OnClick = BitBtn2Click
  end
end
