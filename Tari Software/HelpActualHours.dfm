object HelpActualHoursF: THelpActualHoursF
  Left = 399
  Top = 266
  Width = 696
  Height = 345
  Caption = 'Help - Actual Hours'
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
  object EPRichEdit1: TEPRichEdit
    Left = 6
    Top = 2
    Width = 673
    Height = 248
    TabStop = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = True
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    RichText = 
      '{\rtf1\ansi\ansicpg1252\deff0{\fonttbl{\f0\fnil\fcharset0 MS San' +
      's Serif;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\pard\lang308' +
      '1\b\f0\fs24 Actual/estimated\f1  \f0 hours charged to jobs that ' +
      'have been invoiced\b0\f1 '#13#10'\par '#13#10'\par \f0 There are two methods' +
      ' of obtaining a fairly close estimate of hours charged to jobs.'#13 +
      #10'\par  '#13#10'\par \b Using Invoices.\b0  Using a representative samp' +
      'le of invoices (say 10), it is possible to extract the Average G' +
      'ross Profit (Contribution) per hour which is divided into the to' +
      'tal Gross Profit for the period to give hours.'#13#10'\par '#13#10'\par \b U' +
      'sing Workback.\b0  Where no invoices are available, it is possib' +
      'le to use the labour chargeout rate in conjunction with the mark' +
      'up on materials.'#13#10'\par '#13#10'\par Press the appropiate button.'#13#10'\par' +
      ' \f1 '#13#10'\par }'#13#10#0
  end
  object GetInvoicesBtn: TfcShapeBtn
    Left = 79
    Top = 256
    Width = 145
    Height = 41
    Caption = 'Using Invoices'#13#10
    Color = clBtnFace
    DitherColor = clWhite
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000130B0000130B00001000000000000000000200001D7F
      090051711A002F2F90004F4FFF000D8C0E003A9247005AA55E00769C91000D77
      B7008E602E00B6BBB8008CC98C0090E0E000F1F8F10000000000BBB000000000
      0000BBB7D6DDDDDDDDD0BBB555722AAEDED0B75555555EDDEDD0B555655557AE
      DED0B555D5D555DE33D0BBB5D5C555DD43D0BBB5755557EEEEE0BB7555555BBB
      BBBBB7555555BBBBBBBBB55555BBBBBBBBBBB557B5B55BBBBBBBB55555555BBB
      BBBBB55555555BBBBBBBBB755557BBBBBBBBBBB7B7BBBBBBBBBB}
    Layout = blGlyphRight
    NumGlyphs = 0
    Offsets.GlyphX = -20
    ParentClipping = True
    ParentShowHint = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    ShowHint = False
    TabOrder = 1
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    TextOptions.WordWrap = True
    OnClick = GetInvoicesBtnClick
  end
  object GetWorkBackBtn: TfcShapeBtn
    Left = 367
    Top = 256
    Width = 145
    Height = 41
    Caption = 'Using Work Back'
    Color = clBtnFace
    DitherColor = clWhite
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      04000000000080000000130B0000130B000010000000000000003A6D30002650
      6700437D12001D3797001527B400213F87000C17D3000203FD003030FF002241
      84005454FF00488701009D9DFF00D1D1FF00FFFFFF0000000000EEEEEBEDDEEE
      EEEEEEEEBBBC8EEEEEEEEEEBB1387ACEEEEEEEBB47777777EEEEEBB577766677
      8EEEBBB777316B777DEEBBBB010140777DEEEBBBBB0477777BEEEEBB06777777
      1BBEEEE077777740BBBBEEE1777662BBBBBBEEEA774160510BBBEEEC77746677
      4BBEEEEEA77777770BEEEEEEECA87A12BEEEEEEEEEECCEBBEEEE}
    Layout = blGlyphRight
    ParentClipping = True
    ParentShowHint = False
    RoundRectBias = 25
    ShadeStyle = fbsHighlight
    ShowHint = False
    TabOrder = 2
    TextOptions.Alignment = taCenter
    TextOptions.VAlignment = vaVCenter
    OnClick = GetWorkBackBtnClick
  end
  object BitBtn1: TBitBtn
    Left = 600
    Top = 256
    Width = 75
    Height = 41
    TabOrder = 3
    Visible = False
    Kind = bkClose
  end
end
