object TrackPNLGRepF: TTrackPNLGRepF
  Left = 196
  Top = 132
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
    PrinterSettings.OutputBin = Auto
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.ExtendedDuplex = 0
    PrinterSettings.UseStandardprinter = False
    PrinterSettings.UseCustomBinCode = False
    PrinterSettings.CustomBinCode = 0
    PrinterSettings.UseCustomPaperCode = False
    PrinterSettings.CustomPaperCode = 0
    PrinterSettings.PrintMetaFile = False
    PrintIfEmpty = True
    ShowProgress = False
    SnapToGrid = True
    Units = MM
    Zoom = 100
    PrevFormStyle = fsNormal
    PreviewInitialState = wsNormal
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
          object Series1: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clRed
            Gradient.Direction = gdTopBottom
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series2: TBarSeries
            Marks.ArrowLength = 20
            Marks.Visible = True
            SeriesColor = clGreen
            Gradient.Direction = gdTopBottom
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Bar'
            YValues.Order = loNone
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
        VertAdjust = 0
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
      object CompanyName: TQRLabel
        Left = -1
        Top = 0
        Width = 721
        Height = 35
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          92.604166666666670000
          -2.645833333333333000
          0.000000000000000000
          1907.645833333333000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'Chart Testing'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 22
      end
      object QRLabel1: TQRLabel
        Left = -1
        Top = 40
        Width = 721
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          -2.645833333333333000
          105.833333333333300000
          1907.645833333333000000)
        Alignment = taCenter
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'QRLabel1'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold, fsUnderline]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 14
      end
      object Departments: TQRLabel
        Left = 0
        Top = 80
        Width = 721
        Height = 25
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          66.145833333333330000
          0.000000000000000000
          211.666666666666700000
          1907.645833333333000000)
        Alignment = taLeftJustify
        AlignToBand = True
        AutoSize = False
        AutoStretch = False
        Caption = 'Departments'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 12
      end
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
      object QRSysData2: TQRSysData
        Left = 672
        Top = 0
        Width = 46
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666670000
          1778.000000000000000000
          0.000000000000000000
          121.708333333333300000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Transparent = False
        FontSize = 10
      end
      object PageDateTime: TQRLabel
        Left = 0
        Top = 16
        Width = 201
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          0.000000000000000000
          42.333333333333300000
          531.812500000000000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'PageDateTime'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
      object QRLabel2: TQRLabel
        Left = 600
        Top = 0
        Width = 89
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          1587.500000000000000000
          0.000000000000000000
          235.479166666667000000)
        Alignment = taRightJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = 'Page '
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 10
      end
      object QRLabel3: TQRLabel
        Left = 0
        Top = 0
        Width = 353
        Height = 17
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          44.979166666666700000
          0.000000000000000000
          0.000000000000000000
          933.979166666667000000)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Caption = '* These figures have been Annualised for comparative purposes'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 8
      end
    end
  end
end
