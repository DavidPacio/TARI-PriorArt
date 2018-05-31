object UltimatewhatifF: TUltimatewhatifF
  Left = 399
  Top = 198
  ActiveControl = TargetNP
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Ultimate What If'
  ClientHeight = 726
  ClientWidth = 1012
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Bevel1: TBevel
    Left = 0
    Top = 194
    Width = 1009
    Height = 6
  end
  object ActualNP: TcxCurrencyEdit
    Left = 152
    Top = 128
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 0
    Width = 105
  end
  object ActualCash: TcxCurrencyEdit
    Left = 152
    Top = 160
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.Nullable = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 1
    Width = 105
  end
  object TargetNP: TcxCurrencyEdit
    Left = 336
    Top = 128
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.Nullable = False
    Properties.Nullstring = '0'
    TabOrder = 2
    Width = 105
  end
  object TargetCash: TcxCurrencyEdit
    Left = 336
    Top = 160
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0;-$,0'
    Properties.Nullable = False
    Properties.Nullstring = '0'
    TabOrder = 3
    Width = 105
  end
  object cxLabel3: TcxLabel
    Left = 152
    Top = 104
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Base Values'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Height = 17
    Width = 76
  end
  object cxLabel4: TcxLabel
    Left = 336
    Top = 104
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'New Target'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Height = 18
    Width = 76
  end
  object DoGoalSeekBtn: TcxButton
    Left = 504
    Top = 132
    Width = 113
    Height = 49
    Caption = 'Do'#13#10'Goal Seek'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000C30F0000C30F00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF694731
      6947316947316947316947316947316947316947316947316947316947316947
      31694731694731694731694731694731694731694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FF46B2DF46B2DF46B2DF46B2D
      F46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B
      2DF46B2DF46B2DF46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFF79868FBC39FF79868F79563F7915EF68C58F68853F6844DF58048F57B42
      F5773DF47337F46F32F46B2DF46B2DF46B2DF46B2DF46B2DF46B2DF46B2D6947
      31FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FF79C6D90
      3000903000694731F68C58903000903000694731F57B42903000903000694731
      F46B2D006000006000006000F46B2DF46B2D694731FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF79868FBC39FF8A072F8E0B0D88000903000F7915EF8
      E0B0D88000903000F58048F8E0B0D88000903000F46F3260F89830C868006000
      F46B2DF46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF798
      68FBC39FF8A477F8A072F79C6DF79868F79563F7915EF68C58F68853F6844DF5
      8048F57B42F5773DF47337F46F32F46B2DF46B2DF46B2DF46B2D694731FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FF8A87CF8A477F8A0
      72F79C6DF79868F79563F7915EF68C58F68853F6844DF58048F57B42F5773DF4
      7337F46F32F46B2DF46B2DF46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFF79868FBC39FF9AC81903000903000694731F79C6D9030009030
      00694731F68C58903000903000694731F57B42903000903000694731F46B2DF4
      6B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39F
      F9B086F8F8D8D88000903000F8A072F8E0B0D88000903000F7915EF8E0B0D880
      00903000F58048F8E0B0D88000903000F46F32F46B2D694731FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FFAB68EF9B289F9AE84F9AA7F
      F8A67AF8A275F79E70F79A6BF79766F79360F68E5BF68A55F68650F5824AF57E
      45F57940F4753AF46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFF79868FBC39FFABA93FAB68EF9B289F9AE84F9AA7FF8A67AF8A275F79E70
      F79A6BF79766F79360F68E5BF68A55F68650F5824AF57E45F57940F46B2D6947
      31FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FFBBE9890
      3000903000694731F9AE84903000903000694731F79E70903000903000694731
      F68E5B903000903000694731F57E45F46B2D694731FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF79868FBC39FFBC19DF8F8D8D88000903000F9B289F8
      F8D8D88000903000F8A275F8E0B0D88000903000F79360F8E0B0D88000903000
      F5824AF46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF798
      68FBC39FFBC39FFBC19DFBBE98FABA93FAB68EF9B289F9AE84F9AA7FF8A67AF8
      A275F79E70F79A6BF79766F79360F68E5BF68A55F68650F46B2D694731FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FFBC39FFBC39FFBC1
      9DFBBE98FABA93FAB68EF9B289F9AE84F9AA7FF8A67AF8A275F79E70F79A6BF7
      9766F79360F68E5BF68A55F46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFF79868FBC39FFBC39F903000903000694731FBBE989030009030
      00694731F9AE84903000903000694731F79E70000098000098000098F68E5BF4
      6B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39F
      FBC39FF8F8D8D88000903000FBC39FF8F8D8D88000903000FAB48BF8E0B0D880
      00903000F8A477D2DEFE4878F8000098F79563F46B2D694731FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39FFBC39FFBC39FFBC39FFBC39F
      FBC39FFBC39FFBBF9AFABC95FAB890FAB48BF9B086F9AC81F8A87CF8A477F8A0
      72F79C6DF79868F46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFF79868FBC39F694731C08068C08068C08068C08068C08068C08068C08068
      C08068C08068C08068C08068C08068C08068C08068C08068F79C6DF46B2D6947
      31FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39F694731BD
      ECBDBAE8BAB8E5B8B5E2B5B2DFB2B0DCB0ADD8ADAAD5AAA7D1A7A3CDA3A0C9A0
      9DC59D99C19998C098C08068F8A072F46B2D694731FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFF79868FBC39F694731C0EFC0BDECBDBAE8BAB8E5B8B5
      E2B5B2DFB2B0DCB0ADD8ADAAD5AAA7D1A7A5CFA5A2CBA29EC79E9BC39BC08068
      F8A477F46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF798
      68FBC39F694731C2F2C2C0EFC0BDECBDBAE8BAB8E5B8B5E2B5B2DFB2B1DDB1AF
      DAAFACD7ACA8D3A8A5CFA5A2CBA29EC79EC08068F8A87CF46B2D694731FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39F694731C5F5C5C2F2
      C2C0EFC0BDECBDBCEABCB9E7B9B6E4B6B4E0B4B1DDB1AFDAAFACD7ACA8D3A8A5
      CFA5A2CBA2C08068F9AC81F46B2D694731FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFF79868FBC39F6947316947316947316947316947316947316947
      31694731694731694731694731694731694731694731694731694731F9B289F4
      6B2D694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868FBC39F
      FBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC39FFBC3
      9FFBC39FFBC39FFBC19DFBBE98FABA93FAB68EF46B2D694731FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFF79868F79868F79868F79868F79868
      F79868F79868F79868F79868F79868F79868F79868F79868F79868F79868F798
      68F79868F79868F79868FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 6
    OnClick = DoGoalSeekBtnClick
  end
  object ApplyTargetsBtn: TcxButton
    Left = 872
    Top = 672
    Width = 129
    Height = 41
    Caption = 'Close and Apply'#13#10'New Targets'
    TabOrder = 7
    OnClick = ApplyTargetsBtnClick
  end
  object CancelTargetsBtn: TcxButton
    Left = 720
    Top = 672
    Width = 129
    Height = 41
    Caption = 'Close and Cancel'#13#10'New Targets'
    TabOrder = 8
    OnClick = CancelTargetsBtnClick
  end
  object ResultNP: TcxCurrencyEdit
    Left = 720
    Top = 232
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;($,0)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 9
    Width = 89
  end
  object ResultCash: TcxCurrencyEdit
    Left = 912
    Top = 232
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;($,0)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 10
    Width = 89
  end
  object TargetRG: TcxRadioGroup
    Left = 16
    Top = 110
    Caption = 'Target'
    Properties.Items = <
      item
        Caption = 'Net Profit'
        Value = 0
      end
      item
        Caption = 'Bank Change'
        Value = 1
      end>
    ItemIndex = 0
    TabOrder = 11
    Height = 75
    Width = 129
  end
  object Chart1: TChart
    Left = 0
    Top = 376
    Width = 1009
    Height = 281
    AllowPanning = pmNone
    BackWall.Pen.Visible = False
    BottomWall.Color = 14803425
    Gradient.Balance = 47
    Gradient.Direction = gdBottomTop
    Gradient.EndColor = 4821798
    Gradient.StartColor = 12647336
    Gradient.Visible = True
    Legend.CustomPosition = True
    Legend.HorizMargin = 1
    Legend.Left = 76
    Legend.LegendStyle = lsSeries
    Legend.ResizeChart = False
    Legend.Top = 5
    Legend.TopPos = 4
    MarginBottom = 5
    MarginLeft = 5
    MarginRight = 10
    MarginTop = 5
    MarginUnits = muPixels
    RightWall.Color = clYellow
    RightWall.Visible = True
    Title.AdjustFrame = False
    Title.Brush.Gradient.Visible = True
    Title.Font.Charset = ANSI_CHARSET
    Title.Font.Height = -13
    Title.Text.Strings = (
      'Targeted Results'
      ''
      '')
    Chart3DPercent = 25
    Frame.Visible = False
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Increment = 10.000000000000000000
    LeftAxis.Maximum = 1500.000000000000000000
    LeftAxis.Minimum = -2000.000000000000000000
    LeftAxis.MinorTickLength = 6
    LeftAxis.TickLength = 14
    Shadow.Color = 10987431
    View3DOptions.OrthoAngle = 40
    Zoom.Allow = False
    Align = alCustom
    BevelInner = bvLowered
    BevelWidth = 2
    Color = 15705748
    PopupMenu = PopupMenu1
    TabOrder = 12
    PrintMargins = (
      15
      37
      15
      37)
    object TeeCommander1: TTeeCommander
      Left = 4
      Top = 4
      Width = 68
      Height = 34
      Panel = Chart1
      ParentShowHint = False
      TabOrder = 0
    end
    object BankSeries: TBar3DSeries
      BarBrush.Gradient.Balance = 43
      BarBrush.Gradient.Direction = gdBottomTop
      BarBrush.Gradient.EndColor = 217
      BarBrush.Gradient.Visible = True
      BarBrush.Image.Data = {
        07544269746D61707E000000424D7E000000000000003E000000280000001000
        0000100000000100010000000000400000000000000000000000020000000200
        000000000000FFFFFF0000000000AAAA000000000000AAAA000000000000AAAA
        000000000000AAAA000000000000AAAA000000000000AAAA000000000000AAAA
        000000000000AAAA0000}
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Distance = 3
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = 217
      Title = 'Bank Balance Change'
      ValueFormat = '#,##0;(#,##0)'
      BarStyle = bsRectGradient
      BarWidthPercent = 80
      Gradient.Balance = 43
      Gradient.Direction = gdBottomTop
      Gradient.EndColor = 217
      Gradient.Visible = True
      MultiBar = mbNone
      YOrigin = -2000.000000000000000000
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      OffsetValues.Name = 'Offset'
      OffsetValues.Order = loNone
      Data = {
        040C0000000000000000006940FF0600000033312D4A756C00000000000069C0
        0000000000C08240FF0600000033312D41756700000000000069400000000000
        688B40FF0600000033302D53657000000000000069400000000000006740FF06
        00000033312D4F63740000000000407F400000000000F88940FF060000003330
        2D4E6F765555555555D574400000000000889340FF0600000033312D44656355
        55555555D574400000000000B08A40FF0600000033312D4A616E5555555555D5
        74400000000000C06F40FF0600000032392D4665625555555555D57440000000
        0000088B40FF0600000033312D4D61725555555555D574400000000000B07D40
        FF0600000033302D4170725555555555D574400000000000508440FF06000000
        33312D4D61795555555555D574400000000000907A40FF0600000033302D4A75
        6E5555555555D57440}
    end
    object ProfitSeries: TBar3DSeries
      BarBrush.Gradient.Balance = 30
      BarBrush.Gradient.EndColor = clGreen
      BarBrush.Gradient.StartColor = 8454143
      BarBrush.Gradient.Visible = True
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.ArrowHead = ahLine
      Marks.Callout.Distance = 5
      Marks.Style = smsValue
      Marks.Visible = True
      SeriesColor = clGreen
      Title = 'YTD Profit After Tax'
      ValueFormat = '#,##0;(#,##0)'
      BarStyle = bsRectGradient
      Gradient.Balance = 30
      Gradient.EndColor = clGreen
      Gradient.StartColor = 8454143
      Gradient.Visible = True
      MultiBar = mbNone
      YOrigin = 1500.000000000000000000
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
      OffsetValues.Name = 'Offset'
      OffsetValues.Order = loNone
      Data = {
        040C0000000000000000806340FF0600000033312D417567ABAAAAAAAA2A7D40
        0000000000C05740FF0600000033302D53657000000000008071400000000000
        749140FF0600000033312D4F63740000000000E095400000000000A07640FF06
        00000033302D4E6F76ABAAAAAAAA2A7D40000000000000F03FFF060000003331
        2D446563ABAAAAAAAA2A7D40000000000000F03FFF0600000033312D4A616EAB
        AAAAAAAA2A7D40000000000000F03FFF0600000032392D466562ABAAAAAAAA2A
        7D40000000000000F03FFF0600000033312D4D6172ABAAAAAAAA2A7D40000000
        000000F03FFF0600000033302D417072ABAAAAAAAA2A7D40000000000000F03F
        FF0600000033312D4D6179ABAAAAAAAA2A7D40000000000000F03FFF06000000
        33312D4D6179ABAAAAAAAA2A7D40000000000000F03FFF00000000ABAAAAAAAA
        2A7D40}
    end
  end
  object PriceSpin: TcxSpinEdit
    Left = 8
    Top = 296
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.010000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = PriceSpinPropertiesEditValueChnged
    TabOrder = 13
    Width = 97
  end
  object PurchaseSpin: TcxSpinEdit
    Left = 8
    Top = 344
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.010000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.MaxValue = 20.000000000000000000
    Properties.MinValue = -20.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = PurchaseSpinPropertiesEditValueChanged
    TabOrder = 14
    Width = 97
  end
  object PriceHL: TcxLabel
    Left = 8
    Top = 239
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Pricing  and Costing (%)'
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
    Height = 42
    Width = 105
  end
  object SellingPriceL: TcxLabel
    Left = 8
    Top = 273
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Selling Price'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 89
  end
  object PurchaseL: TcxLabel
    Left = 8
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Purchase Costs'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 89
  end
  object AveSaleUnitSpin: TcxSpinEdit
    Left = 168
    Top = 296
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.100000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = AveSaleUnitSpinPropertiesEditValueChanged
    TabOrder = 18
    Width = 121
  end
  object SelectivityHL: TcxLabel
    Left = 168
    Top = 239
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Selectivity, Upselling or Efficiency ($)'
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
    Height = 42
    Width = 129
  end
  object BilledSpin: TcxSpinEdit
    Left = 408
    Top = 296
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.100000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = BilledSpinPropertiesEditValueChanged
    TabOrder = 20
    Width = 105
  end
  object VolumeHL: TcxLabel
    Left = 408
    Top = 256
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Volume or Productivity'
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
    Height = 25
    Width = 169
  end
  object ProductivitySpin: TcxSpinEdit
    Left = 408
    Top = 344
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.010000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = ProductivitySpinPropertiesEditValueChanged
    TabOrder = 22
    Width = 105
  end
  object AveSaleL: TcxLabel
    Left = 168
    Top = 273
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Average Sale per'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 177
  end
  object AveGPL: TcxLabel
    Left = 168
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Average GP per'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 185
  end
  object AveGPUnitSpin: TcxSpinEdit
    Left = 168
    Top = 344
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.100000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = AveGPUnitSpinPropertiesEditValueChanged
    TabOrder = 25
    Width = 121
  end
  object BilledL: TcxLabel
    Left = 408
    Top = 273
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 145
  end
  object ProductivityL: TcxLabel
    Left = 408
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Productivity %'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 81
  end
  object ARDaysSpin: TcxSpinEdit
    Left = 640
    Top = 296
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.200000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = ARDaysSpinPropertiesEditValueChanged
    TabOrder = 28
    Width = 89
  end
  object ARDaysL: TcxLabel
    Left = 640
    Top = 280
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Accounts Receivable Days'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 177
  end
  object SuppliersHL: TcxLabel
    Left = 856
    Top = 264
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Suppliers Credit'
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
    Height = 17
    Width = 97
  end
  object StockL: TcxLabel
    Left = 640
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Stock'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 193
  end
  object StockDaysSpin: TcxSpinEdit
    Left = 640
    Top = 344
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.200000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = StockDaysSpinPropertiesEditValueChanged
    TabOrder = 32
    Width = 89
  end
  object APDaysL: TcxLabel
    Left = 856
    Top = 280
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Accounts Payable Days'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 137
  end
  object APDaysSpin: TcxSpinEdit
    Left = 856
    Top = 296
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.200000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = APDaysSpinPropertiesEditValueChanged
    TabOrder = 34
    Width = 89
  end
  object AEDaysL: TcxLabel
    Left = 856
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Accrued Expenses Days'
    ParentColor = False
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 17
    Width = 137
  end
  object AEDaysSpin: TcxSpinEdit
    Left = 856
    Top = 344
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.200000000000000000
    Properties.LargeIncrement = 1.000000000000000000
    Properties.SpinButtons.ShowFastButtons = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = AEDaysSpinPropertiesEditValueChanged
    TabOrder = 36
    Width = 89
  end
  object ShowNPCB: TcxCheckBox
    Left = 8
    Top = 696
    Caption = 'YTD Profit After Tax'
    State = cbsChecked
    TabOrder = 37
    Transparent = True
    OnClick = ShowNPCBClick
    Width = 137
  end
  object ShowBankCB: TcxCheckBox
    Left = 8
    Top = 672
    Caption = 'Bank Balance'
    State = cbsChecked
    TabOrder = 38
    Transparent = True
    OnClick = ShowBankCBClick
    Width = 121
  end
  object ShowMarksCB: TcxCheckBox
    Left = 160
    Top = 672
    Caption = 'Marks'
    State = cbsChecked
    TabOrder = 39
    Transparent = True
    OnClick = ShowMarksCBClick
    Width = 65
  end
  object GSResultsRTF: TcxRichEdit
    Left = 663
    Top = 6
    Properties.Alignment = taLeftJustify
    Properties.ScrollBars = ssVertical
    Properties.WantTabs = True
    Lines.Strings = (
      '')
    Style.BorderColor = cl3DLight
    Style.BorderStyle = ebs3D
    Style.Color = clInfoBk
    Style.Edges = []
    Style.HotTrack = False
    Style.Shadow = True
    TabOrder = 40
    Height = 179
    Width = 341
  end
  object ManualRB: TcxRadioButton
    Left = 8
    Top = 208
    Width = 273
    Height = 25
    Caption = 'Manual Adjustment Mode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 41
    OnClick = ManualRBClick
    Transparent = True
  end
  object GoalSeekRB: TcxRadioButton
    Left = 8
    Top = 64
    Width = 241
    Height = 33
    Caption = 'Goal Seeking Mode'
    Checked = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 42
    TabStop = True
    OnClick = GoalSeekRBClick
    Transparent = True
  end
  object AssetsHL: TcxLabel
    Left = 640
    Top = 264
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Asset Control'
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
    Height = 17
    Width = 97
  end
  object cxLabel1: TcxLabel
    Left = 648
    Top = 232
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Net Profit'
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
    Height = 17
    Width = 73
  end
  object cxLabel2: TcxLabel
    Left = 824
    Top = 232
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Bank Change'
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
    Height = 17
    Width = 89
  end
  object AveSaleBase: TcxLabel
    Left = 288
    Top = 296
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 73
    AnchorX = 361
    AnchorY = 305
  end
  object AveGPBase: TcxLabel
    Left = 288
    Top = 344
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 73
    AnchorX = 361
    AnchorY = 353
  end
  object BilledBase: TcxLabel
    Left = 512
    Top = 296
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 73
    AnchorX = 585
    AnchorY = 305
  end
  object ProductivityBase: TcxLabel
    Left = 512
    Top = 344
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 73
    AnchorX = 585
    AnchorY = 353
  end
  object ARDaysBase: TcxLabel
    Left = 728
    Top = 296
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 57
    AnchorX = 785
    AnchorY = 305
  end
  object StockDaysBase: TcxLabel
    Left = 728
    Top = 344
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 57
    AnchorX = 785
    AnchorY = 353
  end
  object APDaysBase: TcxLabel
    Left = 944
    Top = 296
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 57
    AnchorX = 1001
    AnchorY = 305
  end
  object AEDaysBase: TcxLabel
    Left = 944
    Top = 344
    TabStop = False
    RepositoryItem = DMRep1.LabelRightJustifiedTransparent
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    Transparent = True
    Height = 17
    Width = 57
    AnchorX = 1001
    AnchorY = 353
  end
  object ResultNetSales: TcxCurrencyEdit
    Left = 720
    Top = 208
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;($,0)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 54
    Width = 89
  end
  object cxLabel5: TcxLabel
    Left = 648
    Top = 208
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Net Sales'
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
    Height = 17
    Width = 73
  end
  object ResultGPPCL: TcxLabel
    Left = 824
    Top = 208
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'GP %'
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
    Height = 17
    Width = 73
  end
  object ResultGPPC: TcxCurrencyEdit
    Left = 912
    Top = 208
    TabStop = False
    BeepOnEnter = False
    EditValue = 0c
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = ',0.00 %;(,0.00 %)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = clGradientInactiveCaption
    TabOrder = 57
    Width = 89
  end
  object cxButton1: TcxButton
    Left = 568
    Top = 672
    Width = 129
    Height = 41
    Caption = 'What If Report'
    TabOrder = 58
    OnClick = cxButton1Click
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 649
    Height = 57
    BevelOuter = bvLowered
    TabOrder = 59
    object cxLabel14: TcxLabel
      Left = 12
      Top = 0
      RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
      Caption = 'Department / Revenue Group'
      ParentColor = False
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -16
      Style.Font.Name = 'Calibri'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = False
      Style.StyleController = DMRep1.cxEditStyleLabelLarge
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = False
      Transparent = True
      Width = 208
    end
    object cxDBLabel3: TcxDBLabel
      Left = 12
      Top = 29
      DataBinding.DataField = 'REVENUE_GROUP_NAME'
      DataBinding.DataSource = DataModuleClient.DSDepartments
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clHotLight
      Style.Font.Height = -16
      Style.Font.Name = 'Calibri'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      Transparent = True
      Height = 21
      Width = 629
      AnchorY = 40
    end
  end
  object ppJITBasePipe: TppJITPipeline
    InitialIndex = 1
    RecordCount = 99999999
    UserName = 'JITBasePipe'
    OnGetFieldValue = ppJITBasePipeGetFieldValue
    Left = 720
    Top = 16
    object ActualBaseField: TppField
      FieldAlias = 'ActualBase'
      FieldName = 'ActualBase'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 0
    end
    object TargetField: TppField
      FieldAlias = 'TargetField'
      FieldName = 'TargetField'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 1
    end
    object CalculationType: TppField
      FieldAlias = 'CalcType'
      FieldName = 'CalcType'
      FieldLength = 40
      DisplayWidth = 40
      Position = 2
    end
    object Drivername: TppField
      FieldAlias = 'DriverName'
      FieldName = 'DriverName'
      FieldLength = 40
      IsDetail = True
      DisplayWidth = 40
      Position = 3
    end
    object BaseValueField: TppField
      Alignment = taRightJustify
      FieldAlias = 'Basevalue'
      FieldName = 'Basevalue'
      FieldLength = 20
      IsDetail = True
      DisplayWidth = 20
      Position = 4
    end
    object TargetValueField: TppField
      Alignment = taRightJustify
      FieldAlias = 'TargetValue'
      FieldName = 'TargetValue'
      FieldLength = 20
      IsDetail = True
      DisplayWidth = 20
      Position = 5
    end
    object PCChangeField: TppField
      FieldAlias = 'PCChange'
      FieldName = 'PCChange'
      FieldLength = 10
      IsDetail = True
      DataType = dtCurrency
      DisplayFormat = ',0.00 %;-,0.00 %'
      DisplayWidth = 10
      Position = 6
    end
    object NPResultField: TppField
      FieldAlias = 'NPResult'
      FieldName = 'NPResult'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 7
    end
    object CashResultField: TppField
      FieldAlias = 'CashResult'
      FieldName = 'CashResult'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 8
    end
    object CalcountField: TppField
      FieldAlias = 'CalcCount'
      FieldName = 'CalcCount'
      FieldLength = 10
      IsDetail = True
      DataType = dtInteger
      DisplayWidth = 10
      Position = 9
    end
    object BusinessNameField: TppField
      FieldAlias = 'BusinessName'
      FieldName = 'BusinessName'
      FieldLength = 40
      DisplayWidth = 40
      Position = 10
    end
    object DeptNameField: TppField
      FieldAlias = 'DeptName'
      FieldName = 'DeptName'
      FieldLength = 40
      DisplayWidth = 40
      Position = 11
    end
    object TargetPeriodFields: TppField
      FieldAlias = 'TargetPeriod'
      FieldName = 'TargetPeriod'
      FieldLength = 40
      DisplayWidth = 40
      Position = 12
    end
    object ActualNPBase: TppField
      FieldAlias = 'ActualNPBase'
      FieldName = 'ActualNPBase'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 13
    end
    object ActualCashBase: TppField
      FieldAlias = 'ActualCashBase'
      FieldName = 'ActualCashBase'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 14
    end
    object NetSales: TppField
      FieldAlias = 'NetSales'
      FieldName = 'NetSales'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 15
    end
    object NewGPPC: TppField
      FieldAlias = 'NewGPPC'
      FieldName = 'NewGPPC'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = ',0.00 %;(,0.00 %)'
      DisplayWidth = 10
      Position = 16
    end
    object NewNP: TppField
      FieldAlias = 'NewNP'
      FieldName = 'NewNP'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 17
    end
    object NewCash: TppField
      FieldAlias = 'NewCash'
      FieldName = 'NewCash'
      FieldLength = 10
      DataType = dtCurrency
      DisplayFormat = '$,0;($,0)'
      DisplayWidth = 10
      Position = 18
    end
  end
  object ppGoalSeekReport: TppReport
    AutoStop = False
    DataPipeline = ppJITBasePipe
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Units = utMillimeters
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 75
    PreviewFormSettings.WindowState = wsMaximized
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 800
    Top = 24
    Version = '14.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITBasePipe'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 101336
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Ultimate What If Report (Goal Seeking)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 49381
        mmTop = 10583
        mmWidth = 103124
        BandType = 0
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'CalcType'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 7144
        mmLeft = 10583
        mmTop = 31750
        mmWidth = 90223
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Base Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 106098
        mmTop = 31750
        mmWidth = 23283
        BandType = 0
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'ActualBase'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 133615
        mmTop = 31750
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Target Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 106098
        mmTop = 38100
        mmWidth = 24606
        BandType = 0
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'TargetField'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 133615
        mmTop = 38100
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Driver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 10054
        mmTop = 84667
        mmWidth = 11113
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Base Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9260
        mmLeft = 63500
        mmTop = 84667
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Target Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9260
        mmLeft = 88900
        mmTop = 84667
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = '% Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9260
        mmLeft = 107950
        mmTop = 84667
        mmWidth = 14288
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Net Profit Result'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 10319
        mmLeft = 127000
        mmTop = 84667
        mmWidth = 22754
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Cash Change Result'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        WordWrap = True
        mmHeight = 9790
        mmLeft = 152400
        mmTop = 84667
        mmWidth = 25400
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Calcs'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 179917
        mmTop = 84667
        mmWidth = 14817
        BandType = 0
      end
      object ppRichText1: TppRichText
        UserName = 'RichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcha' +
          'rset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\' +
          'pard\lang3081\f0\fs22 The table presented below shows each drive' +
          'r with its base value, target value and percentage change necess' +
          'ary to achieve the above Target Value as if it was the only driv' +
          'er being changed.\par'#13#10'\par'#13#10'In most cases, changing several dri' +
          'vers is desirable to achieve a desired result. Additionally, the' +
          ' process of monitoring changes is a basic business principle and' +
          ' that opportunities for improvements in all drivers may be possi' +
          'ble while monitoring daily or weekly results.\par'#13#10'\lang1033\f1\' +
          'fs16\par'#13#10'\lang3081\f0 (Calcs number is the number of times that' +
          ' whole model was recalculated to achieve a result that is within' +
          ' $100 or 0.1% of the target, whichever is the smaller but not le' +
          'ss than $10) \lang1033\f1\par'#13#10'}'#13#10#0
        mmHeight = 37571
        mmLeft = 10319
        mmTop = 44450
        mmWidth = 185473
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeftMargin = 794
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 83079
        mmWidth = 184944
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 95515
        mmWidth = 184944
        BandType = 0
      end
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'BusinessName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 8255
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 200290
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Business:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5080
        mmLeft = 10583
        mmTop = 23283
        mmWidth = 20179
        BandType = 0
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DeptName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 6879
        mmLeft = 31750
        mmTop = 23283
        mmWidth = 171980
        BandType = 0
      end
      object ppDBText13: TppDBText
        UserName = 'DBText13'
        DataField = 'TargetPeriod'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5556
        mmLeft = 2117
        mmTop = 16933
        mmWidth = 200290
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DriverName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 10054
        mmTop = 794
        mmWidth = 45244
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'Basevalue'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 57150
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'TargetValue'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 78317
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'PCChange'
        DataPipeline = ppJITBasePipe
        DisplayFormat = ',0.00 %;(,0.00 %)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 103717
        mmTop = 794
        mmWidth = 19050
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'NPResult'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$,0;($,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 124884
        mmTop = 794
        mmWidth = 25400
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'CashResult'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$,0;($,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 150019
        mmTop = 794
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'CalcCount'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 179123
        mmTop = 794
        mmWidth = 13758
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 37835
      mmPrintPosition = 0
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 24342
        mmLeft = 10583
        mmTop = 1588
        mmWidth = 184150
        BandType = 8
      end
      object ppRichText2: TppRichText
        UserName = 'RichText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Caption = 'RichText2'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcha' +
          'rset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\' +
          'pard\lang3081\f0\fs18 "Price" means an overall price rise (disco' +
          'unt) of all goods and services before tax are added commencing o' +
          'n the 1st day of the target period.\par'#13#10'\par'#13#10'"Stock & Material' +
          's Costs" means an overall price discount (rise) (negative % chan' +
          'ge is a discount) on all stock, materials and subcontractors com' +
          'mencing on the 1st day of the target Period.\par'#13#10'\lang1033\f1\p' +
          'ar'#13#10'}'#13#10#0
        mmHeight = 21696
        mmLeft = 11906
        mmTop = 2910
        mmWidth = 181505
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeftMargin = 794
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 32808
        mmWidth = 184944
        BandType = 8
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'dddddd h:nn:ss am/pm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 62971
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 164836
        mmTop = 27517
        mmWidth = 30163
        BandType = 8
      end
      object RBText1: TppLabel
        UserName = 'Text1'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 11113
        mmTop = 33867
        mmWidth = 183357
        BandType = 8
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppManualReport: TppReport
    AutoStop = False
    DataPipeline = ppJITBasePipe
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279000
    PrinterSetup.mmPaperWidth = 216000
    PrinterSetup.PaperSize = 1
    Units = utMillimeters
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    LanguageID = 'Default'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 75
    PreviewFormSettings.WindowState = wsMaximized
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    Left = 328
    Top = 392
    Version = '14.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITBasePipe'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 104511
      mmPrintPosition = 0
      object ppLabel12: TppLabel
        UserName = 'Label1'
        Caption = 'Ultimate What If Report (Manual Mode)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6646
        mmLeft = 49381
        mmTop = 10583
        mmWidth = 103124
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label3'
        Caption = 'Base Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 91017
        mmTop = 31750
        mmWidth = 23283
        BandType = 0
      end
      object ppDBText15: TppDBText
        UserName = 'DBText3'
        DataField = 'ActualNPBase'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 118534
        mmTop = 31750
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label4'
        Caption = 'Result'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 91017
        mmTop = 38100
        mmWidth = 12023
        BandType = 0
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        DataField = 'NewNP'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 118534
        mmTop = 38100
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label5'
        Caption = 'Driver'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4763
        mmLeft = 33867
        mmTop = 93927
        mmWidth = 33338
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label6'
        Caption = 'Base Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6085
        mmLeft = 82550
        mmTop = 93927
        mmWidth = 21167
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label7'
        Caption = 'Target Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6350
        mmLeft = 110067
        mmTop = 93927
        mmWidth = 25135
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label8'
        Caption = '% Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        WordWrap = True
        mmHeight = 6615
        mmLeft = 141817
        mmTop = 93927
        mmWidth = 23813
        BandType = 0
      end
      object ppRichText3: TppRichText
        UserName = 'RichText1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Caption = 'RichText1'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcha' +
          'rset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\' +
          'pard\lang3081\f0\fs20 The table presented below shows each drive' +
          'r that has been changed with its base value, target value and pe' +
          'rcentage change.\par'#13#10'\par'#13#10'All listed drivers have been altered' +
          ' cumulatively to achieve the above results.\par'#13#10'\par'#13#10'Further a' +
          'djustments should can be made within the software to reflect sea' +
          'sonal and implementation factors.\par'#13#10'\lang1033\f1\par'#13#10'}'#13#10#0
        mmHeight = 25929
        mmLeft = 10583
        mmTop = 63500
        mmWidth = 185473
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeftMargin = 794
      end
      object ppShape5: TppShape
        UserName = 'Shape1'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 91281
        mmWidth = 184944
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape2'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 101336
        mmWidth = 184944
        BandType = 0
      end
      object ppDBText17: TppDBText
        UserName = 'DBText11'
        DataField = 'BusinessName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 20
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 8255
        mmLeft = 1323
        mmTop = 1323
        mmWidth = 200290
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label2'
        Caption = 'Business/Department:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5027
        mmLeft = 2117
        mmTop = 23283
        mmWidth = 44979
        BandType = 0
      end
      object ppDBText18: TppDBText
        UserName = 'DBText12'
        DataField = 'DeptName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 6879
        mmLeft = 49213
        mmTop = 23283
        mmWidth = 155046
        BandType = 0
      end
      object ppDBText19: TppDBText
        UserName = 'DBText13'
        DataField = 'TargetPeriod'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5556
        mmLeft = 2117
        mmTop = 16933
        mmWidth = 200290
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Net Profit Before Tax'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 40217
        mmTop = 31750
        mmWidth = 39751
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Bank Balance Change'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 40217
        mmTop = 44450
        mmWidth = 42291
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Base Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 91017
        mmTop = 44450
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Result'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 91017
        mmTop = 50800
        mmWidth = 12023
        BandType = 0
      end
      object ppDBText14: TppDBText
        UserName = 'DBText14'
        DataField = 'ActualCashBase'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 118534
        mmTop = 44450
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText24: TppDBText
        UserName = 'DBText24'
        DataField = 'NewCash'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 118534
        mmTop = 50800
        mmWidth = 29898
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'New Net Sales'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4868
        mmLeft = 40217
        mmTop = 57150
        mmWidth = 28025
        BandType = 0
      end
      object ppDBText25: TppDBText
        UserName = 'DBText25'
        DataField = 'NetSales'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '$#,0;($#,0)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 71967
        mmTop = 57150
        mmWidth = 29898
        BandType = 0
      end
      object ppDBText26: TppDBText
        UserName = 'DBText26'
        DataField = 'NewGPPC'
        DataPipeline = ppJITBasePipe
        DisplayFormat = '#,0.00 %;(#,0.00 %)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 139700
        mmTop = 57150
        mmWidth = 23813
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'New GP %'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        mmHeight = 4763
        mmLeft = 118534
        mmTop = 57150
        mmWidth = 20638
        BandType = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 8467
      mmPrintPosition = 0
      object ppDBText20: TppDBText
        UserName = 'DBText1'
        DataField = 'DriverName'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        Transparent = True
        WordWrap = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 5027
        mmLeft = 33867
        mmTop = 794
        mmWidth = 45244
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText5'
        DataField = 'Basevalue'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 84667
        mmTop = 794
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText6'
        DataField = 'TargetValue'
        DataPipeline = ppJITBasePipe
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 112184
        mmTop = 794
        mmWidth = 23548
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText7'
        DataField = 'PCChange'
        DataPipeline = ppJITBasePipe
        DisplayFormat = ',0.00 %;(,0.00 %)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppJITBasePipe'
        mmHeight = 4498
        mmLeft = 146050
        mmTop = 794
        mmWidth = 19050
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 37042
      mmPrintPosition = 0
      object ppShape7: TppShape
        UserName = 'Shape3'
        mmHeight = 24342
        mmLeft = 10583
        mmTop = 1588
        mmWidth = 184150
        BandType = 8
      end
      object ppRichText4: TppRichText
        UserName = 'RichText2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Tahoma'
        Font.Size = 8
        Font.Style = []
        Caption = 'RichText2'
        RichText = 
          '{\rtf1\ansi\ansicpg1252\deff0\deflang1033{\fonttbl{\f0\fnil\fcha' +
          'rset0 MS Sans Serif;}{\f1\fnil MS Sans Serif;}}'#13#10'\viewkind4\uc1\' +
          'pard\lang3081\f0\fs18 "Price" means an overall price rise (disco' +
          'unt) of all goods and services before tax are added commencing o' +
          'n the 1st day of the target period.\par'#13#10'\par'#13#10'"Stock & Material' +
          's Costs" means an overall price discount (rise) (negative % chan' +
          'ge is a discount) on all stock, materials and subcontractors com' +
          'mencing on the 1st day of the target Period.\par'#13#10'\lang1033\f1\p' +
          'ar'#13#10'}'#13#10#0
        mmHeight = 21696
        mmLeft = 11906
        mmTop = 2910
        mmWidth = 181505
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
        mmMinHeight = 0
        mmLeftMargin = 794
      end
      object ppShape8: TppShape
        UserName = 'Shape4'
        Pen.Width = 2
        mmHeight = 350
        mmLeft = 10054
        mmTop = 32808
        mmWidth = 184944
        BandType = 8
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        AutoSize = False
        VarType = vtDateTime
        DisplayFormat = 'dddddd h:nn:ss am/pm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 4233
        mmLeft = 10583
        mmTop = 27517
        mmWidth = 62971
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        AutoSize = False
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 5292
        mmLeft = 164836
        mmTop = 27517
        mmWidth = 30163
        BandType = 8
      end
      object RBText2: TppLabel
        UserName = 'Text2'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 10319
        mmTop = 33338
        mmWidth = 184150
        BandType = 8
      end
    end
    object daDataModule2: TdaDataModule
    end
    object ppParameterList2: TppParameterList
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 872
    Top = 16
    object PopupPrintChart: TMenuItem
      Caption = '&Preview and Print Chart'
      OnClick = PopupPrintChartClick
    end
    object PopupExportChart: TMenuItem
      Caption = '&Export Chart'
      OnClick = PopupExportChartClick
    end
  end
  object ChartPreviewer1: TChartPreviewer
    Chart = Chart1
    WindowState = wsMaximized
    Left = 312
    Top = 656
  end
end
