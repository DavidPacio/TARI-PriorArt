object TargetDKeyGRepF: TTargetDKeyGRepF
  Left = 536
  Top = 359
  Width = 832
  Height = 544
  Caption = 'ChartsRep'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = 8
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    OnNeedData = QuickRep1NeedData
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      70.000000000000000000
      2970.000000000000000000
      100.000000000000000000
      2100.000000000000000000
      100.000000000000000000
      100.000000000000000000
      0.000000000000000000)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object DetailBand1: TQRBand
      Left = 38
      Top = 145
      Width = 718
      Height = 176
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        465.666666666666700000
        1899.708333333333000000)
      BandType = rbDetail
      object Chart1: TQRChart
        Left = 0
        Top = 0
        Width = 713
        Height = 153
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          404.812500000000000000
          0.000000000000000000
          0.000000000000000000
          1886.479166666670000000)
        object QRDBChart1: TQRDBChart
          Left = -1
          Top = -1
          Width = 1
          Height = 1
          BackWall.Brush.Color = clWhite
          BackWall.Brush.Style = bsClear
          Gradient.EndColor = 8454143
          Title.Text.Strings = (
            'TQRDBChart')
          BottomAxis.DateTimeFormat = 'dd/MM/yyyy'
          BottomAxis.Grid.Style = psSolid
          BottomAxis.Grid.SmallDots = True
          BottomAxis.LabelsSize = 6
          BottomAxis.LabelStyle = talText
          BottomAxis.MinorTickCount = 1
          BottomAxis.RoundFirstLabel = False
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          object Series1: TLineSeries
            Marks.ArrowLength = 20
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Length = 20
            Marks.Style = smsValue
            Marks.Visible = True
            SeriesColor = clRed
            ShowInLegend = False
            Pointer.Brush.Color = clRed
            Pointer.HorizSize = 3
            Pointer.InflateMargins = False
            Pointer.Style = psCircle
            Pointer.VertSize = 3
            Pointer.Visible = True
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
          end
        end
      end
      object QRShape1: TQRShape
        Left = 0
        Top = 164
        Width = 721
        Height = 4
        Enabled = False
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          10.583333333333300000
          0.000000000000000000
          433.916666666667000000
          1907.645833333330000000)
        Pen.Width = 3
        Shape = qrsHorLine
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 107
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        283.104166666666700000
        1899.708333333333000000)
      BandType = rbPageHeader
    end
    object PageFooterBand1: TQRBand
      Left = 38
      Top = 321
      Width = 718
      Height = 35
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      BeforePrint = PageFooterBand1BeforePrint
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        92.604166666666670000
        1899.708333333333000000)
      BandType = rbPageFooter
    end
  end
end
