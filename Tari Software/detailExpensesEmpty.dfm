object DetailExpensesF: TDetailExpensesF
  Left = 430
  Top = 265
  HelpContext = 1017
  BorderIcons = []
  BorderStyle = bsDialog
  ClientHeight = 732
  ClientWidth = 1014
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Chart1: TChart
    Left = 0
    Top = 0
    Width = 1014
    Height = 385
    AllowPanning = pmNone
    BackWall.Brush.Gradient.Direction = gdBottomTop
    BackWall.Brush.Gradient.EndColor = clWhite
    BackWall.Brush.Gradient.MidColor = clNone
    BackWall.Brush.Gradient.StartColor = 15395562
    BackWall.Brush.Gradient.Visible = True
    BackWall.Transparent = False
    Foot.Font.Name = 'Verdana'
    Gradient.Direction = gdBottomTop
    Gradient.EndColor = 49408
    Gradient.MidColor = 8454143
    Gradient.StartColor = 16744448
    Gradient.Visible = True
    LeftWall.Color = 14745599
    Legend.CurrentPage = False
    Legend.Font.Name = 'Verdana'
    Legend.Visible = False
    MarginBottom = 10
    MarginTop = 10
    RightWall.Color = 14745599
    RightWall.Size = 1
    SubFoot.Font.Name = 'Verdana'
    SubTitle.Font.Name = 'Verdana'
    Title.AdjustFrame = False
    Title.Font.Color = clNavy
    Title.Font.Height = -15
    Title.Font.Name = 'Verdana'
    Title.Font.Style = [fsBold]
    Title.Font.InterCharSize = 1
    Title.Font.Shadow.HorizSize = 2
    Title.Text.Strings = (
      'Billed Hours')
    AxisBehind = False
    BottomAxis.Axis.Color = 4210752
    BottomAxis.Axis.Width = 1
    BottomAxis.DateTimeFormat = 'dd MMM'
    BottomAxis.Grid.Color = 10987431
    BottomAxis.Grid.Style = psSolid
    BottomAxis.Grid.EndStyle = esFlat
    BottomAxis.Grid.SmallDots = True
    BottomAxis.Increment = 1.000000000000000000
    BottomAxis.LabelsFont.Color = clNavy
    BottomAxis.LabelsFont.Name = 'Verdana'
    BottomAxis.LabelsFont.InterCharSize = 1
    BottomAxis.LabelsMultiLine = True
    BottomAxis.LabelsOnAxis = False
    BottomAxis.MinorTickLength = 0
    BottomAxis.StartPosition = 2.000000000000000000
    BottomAxis.EndPosition = 98.000000000000000000
    BottomAxis.TickInnerLength = 6
    BottomAxis.TickLength = 6
    BottomAxis.TicksInner.Color = 11119017
    BottomAxis.TickOnLabelsOnly = False
    BottomAxis.Title.Font.Name = 'Verdana'
    BottomAxis.Title.Visible = False
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Axis.Color = 4210752
    DepthAxis.Grid.Color = 11119017
    DepthAxis.LabelsFont.Name = 'Verdana'
    DepthAxis.LabelsMultiLine = True
    DepthAxis.Maximum = 0.500000000000000000
    DepthAxis.Minimum = -0.500000000000000000
    DepthAxis.TicksInner.Color = 11119017
    DepthAxis.Title.Font.Name = 'Verdana'
    DepthTopAxis.Axis.Color = 4210752
    DepthTopAxis.Grid.Color = 11119017
    DepthTopAxis.LabelsFont.Name = 'Verdana'
    DepthTopAxis.TicksInner.Color = 11119017
    DepthTopAxis.Title.Font.Name = 'Verdana'
    CustomAxes = <
      item
        Automatic = False
        AutomaticMaximum = False
        AutomaticMinimum = False
        Horizontal = True
        OtherSide = False
        EndPosition = 50.000000000000000000
        Visible = False
      end>
    LeftAxis.Axis.Color = 4210752
    LeftAxis.Grid.Color = 10987431
    LeftAxis.Grid.SmallDots = True
    LeftAxis.LabelsFont.Name = 'Verdana'
    LeftAxis.LabelsSeparation = 0
    LeftAxis.TicksInner.Color = 11119017
    LeftAxis.Title.Font.Name = 'Verdana'
    Pages.MaxPointsPerPage = 16
    Pages.ScaleLastPage = False
    RightAxis.Automatic = False
    RightAxis.AutomaticMaximum = False
    RightAxis.AutomaticMinimum = False
    RightAxis.Axis.Color = 4210752
    RightAxis.Grid.Color = 11119017
    RightAxis.LabelsFont.Name = 'Verdana'
    RightAxis.TicksInner.Color = 11119017
    RightAxis.Title.Font.Name = 'Verdana'
    TopAxis.Automatic = False
    TopAxis.AutomaticMaximum = False
    TopAxis.AutomaticMinimum = False
    TopAxis.Axis.Color = 4210752
    TopAxis.Grid.Color = 11119017
    TopAxis.LabelsFont.Name = 'Verdana'
    TopAxis.TicksInner.Color = 11119017
    TopAxis.Title.Font.Name = 'Verdana'
    View3D = False
    Zoom.Allow = False
    Align = alTop
    BevelWidth = 2
    Color = 13160660
    TabOrder = 0
    ExplicitWidth = 1012
    PrintMargins = (
      15
      37
      15
      37)
    ColorPaletteIndex = 13
    object Series1: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Callout.Length = 18
      Marks.Bevel = bvLowered
      Marks.Brush.Gradient.Visible = True
      Marks.Style = smsValue
      Marks.Visible = True
      Pointer.Brush.Gradient.EndColor = 10708548
      Pointer.Gradient.EndColor = 10708548
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.DateTime = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
      Data = {
        002000000000000000000010400000000000007C400000000000107D40000000
        00004079400000000000007B400000000000E074400000000000407A40000000
        0000B07D4000000000008081400000000000907C400000000000A07F40000000
        0000C07A400000000000C07B400000000000807B400000000000107B40000000
        0000B880400000000000A07E4000000000009077400000000000707240000000
        0000D0744000000000005077400000000000607B400000000000B07B40000000
        0000D0744000000000000076400000000000A076400000000000E07540000000
        0000D07140000000000070724000000000001078400000000000F07140000000
        0000407240}
    end
    object Series2: TLineSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.BackColor = 8404992
      Marks.Bevel = bvRaised
      Marks.Color = 8404992
      Marks.DrawEvery = 3
      Marks.Style = smsValue
      Marks.Visible = False
      SeriesColor = clBlue
      Brush.Color = clWhite
      Brush.Style = bsClear
      Dark3D = False
      LineBrush = bsClear
      LinePen.Visible = False
      Pointer.Brush.Gradient.EndColor = clBlue
      Pointer.Gradient.EndColor = clBlue
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = True
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
    object ChartTool1: TPageNumTool
      Callout.Brush.Color = clBlack
      Callout.Arrow.Visible = False
      Shape.Text = 'Page 1 of 2'
      Text = 'Page 1 of 2'
      DisabledButton.EndColor = clSilver
      DisabledButton.Visible = True
      EnabledButton.EndColor = clSilver
      EnabledButton.StartColor = clBlack
      EnabledButton.Visible = True
    end
  end
  object CloseBtn: TcxButton
    Left = 896
    Top = 672
    Width = 105
    Height = 41
    Caption = '&Close'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    ModalResult = 1
    TabOrder = 1
    OnClick = CloseBtnClick
  end
end
