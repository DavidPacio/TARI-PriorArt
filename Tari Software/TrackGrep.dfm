object TrackGRepF: TTrackGRepF
  Left = 944
  Top = 360
  Caption = 'ChartsRep'
  ClientHeight = 292
  ClientWidth = 384
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
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppJITPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
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
    Left = 24
    Top = 16
    Version = '14.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object RBReportTitle: TppLabel
        UserName = 'ReportTitle'
        AutoSize = False
        Caption = 'ReportTitle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 11906
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground
      end
      object RBCompanyName: TppLabel
        UserName = 'CompanyName'
        AutoSize = False
        Caption = 'CompanyName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 9102
        mmLeft = 0
        mmTop = 265
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground
      end
      object GroupLabel: TppLabel
        UserName = 'GroupLabel'
        Caption = 'Business/Revenue Group:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        mmHeight = 4763
        mmLeft = 0
        mmTop = 21167
        mmWidth = 49742
        BandType = 0
        LayerName = Foreground
      end
      object rbDepartment: TppLabel
        UserName = 'rbDepartment'
        AutoSize = False
        Caption = 'rbDepartment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        WordWrap = True
        mmHeight = 4233
        mmLeft = 50800
        mmTop = 21167
        mmWidth = 139171
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 44715
      mmPrintPosition = 0
      object Chart1: TppTeeChart
        OnPrint = Chart1Print
        UserName = 'Chart1'
        mmHeight = 43921
        mmLeft = 0
        mmTop = 0
        mmWidth = 189971
        BandType = 4
        LayerName = Foreground
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Chart')
          BackColor = clWhite
          BottomAxis.LabelStyle = talText
          BottomAxis.MinorTickCount = 0
          BottomAxis.MinorTickLength = 0
          BottomAxis.TickLength = 1
          BottomAxis.Title.Visible = False
          Legend.TextStyle = ltsPlain
          Legend.Visible = False
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.Grid.SmallDots = True
          ScaleLastPage = True
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          PrintMargins = (
            15
            23
            15
            23)
          object Series1: TLineSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object RBLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3175
        mmLeft = 0
        mmTop = 6085
        mmWidth = 189971
        BandType = 8
        LayerName = Foreground
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 51329
        BandType = 8
        LayerName = Foreground
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
        mmLeft = 173302
        mmTop = 1058
        mmWidth = 16669
        BandType = 8
        LayerName = Foreground
      end
      object RBNote: TppLabel
        UserName = 'Note'
        AutoSize = False
        Caption = 'Note'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Visible = False
        mmHeight = 3260
        mmLeft = 0
        mmTop = 1588
        mmWidth = 190000
        BandType = 8
        LayerName = Foreground
      end
      object RBText1: TppLabel
        UserName = 'Text1'
        AutoSize = False
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3260
        mmLeft = 529
        mmTop = 7144
        mmWidth = 172509
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppJITPipeline1: TppJITPipeline
    InitialIndex = 0
    RecordCount = 1
    UserName = 'JITPipeline1'
    Left = 126
    Top = 22
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title'
      FieldName = 'Title'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppJITPipeline2: TppJITPipeline
    InitialIndex = 0
    RecordCount = 1
    UserName = 'JITPipeline2'
    Left = 120
    Top = 88
    object Title2: TppField
      FieldAlias = 'Title2'
      FieldName = 'Title2'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppReport2: TppReport
    AutoStop = False
    DataPipeline = ppJITPipeline2
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
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
    Left = 24
    Top = 96
    Version = '14.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline2'
    object ppHeaderBand2: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 28310
      mmPrintPosition = 0
      object RBReportTitle1: TppLabel
        UserName = 'ReportTitle'
        AutoSize = False
        Caption = 'ReportTitle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 12700
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground1
      end
      object RBCompanyName1: TppLabel
        UserName = 'CompanyName'
        AutoSize = False
        Caption = 'CompanyName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 9102
        mmLeft = 0
        mmTop = 265
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground1
      end
      object GroupLabel1: TppLabel
        UserName = 'DepartmentTitle1'
        Caption = 'Business/Revenue Group:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold]
        mmHeight = 4763
        mmLeft = 0
        mmTop = 21167
        mmWidth = 49742
        BandType = 0
        LayerName = Foreground1
      end
      object rbDepartment1: TppLabel
        UserName = 'rbDepartment1'
        AutoSize = False
        Caption = 'rbDepartment1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        WordWrap = True
        mmHeight = 5556
        mmLeft = 50800
        mmTop = 21431
        mmWidth = 138907
        BandType = 0
        LayerName = Foreground1
      end
    end
    object ppDetailBand2: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 46038
      mmPrintPosition = 0
      object Chart2: TppTeeChart
        OnPrint = Chart2Print
        UserName = 'Chart1'
        mmHeight = 43921
        mmLeft = 0
        mmTop = 0
        mmWidth = 94986
        BandType = 4
        LayerName = Foreground1
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Chart')
          BackColor = clWhite
          BottomAxis.Automatic = False
          BottomAxis.AutomaticMinimum = False
          BottomAxis.LabelStyle = talText
          BottomAxis.Minimum = 38272.000000000000000000
          BottomAxis.MinorTickCount = 0
          BottomAxis.MinorTickLength = 0
          BottomAxis.RoundFirstLabel = False
          BottomAxis.TickLength = 1
          BottomAxis.Title.Visible = False
          BottomAxis.Visible = False
          Legend.TextStyle = ltsPlain
          Legend.TopPos = 18
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.Grid.SmallDots = True
          ScaleLastPage = True
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          PrintMargins = (
            15
            23
            15
            23)
          object Series1: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.ArrowHead = ahLine
            Marks.Callout.Length = 8
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Style = smsValue
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {
              0501000000000000000000F03F0000000000708740FF0600000041637475616C}
          end
          object Series2: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.ArrowHead = ahLine
            Marks.Callout.Length = 8
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Style = smsValue
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {
              050100000000000000000018400000000000008940FF0600000041637475616C}
          end
        end
      end
      object Chart3: TppTeeChart
        OnPrint = Chart3Print
        UserName = 'Chart3'
        mmHeight = 43656
        mmLeft = 95250
        mmTop = 794
        mmWidth = 94986
        BandType = 4
        LayerName = Foreground1
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          Title.Font.Height = -12
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Chart')
          BackColor = clWhite
          BottomAxis.Automatic = False
          BottomAxis.AutomaticMinimum = False
          BottomAxis.LabelStyle = talText
          BottomAxis.Minimum = 0.041666666666666660
          BottomAxis.MinorTickCount = 0
          BottomAxis.MinorTickLength = 0
          BottomAxis.RoundFirstLabel = False
          BottomAxis.TickLength = 1
          BottomAxis.Title.Visible = False
          BottomAxis.Visible = False
          Legend.TextStyle = ltsPlain
          Legend.TopPos = 18
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.Grid.SmallDots = True
          ScaleLastPage = True
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          PrintMargins = (
            15
            23
            15
            23)
          object Series1: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.ArrowHead = ahLine
            Marks.Callout.Length = 8
            Marks.Clip = True
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Style = smsValue
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000409040}
          end
          object Series2: TBarSeries
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.ArrowHead = ahLine
            Marks.Callout.Length = 8
            Marks.ShapeStyle = fosRoundRectangle
            Marks.Style = smsValue
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {00010000000000000000888D40}
          end
        end
      end
    end
    object ppFooterBand2: TppFooterBand
      BeforePrint = ppFooterBand1BeforePrint
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11377
      mmPrintPosition = 0
      object RBNote1: TppLabel
        UserName = 'Note'
        AutoSize = False
        Caption = 'Note'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Visible = False
        mmHeight = 3260
        mmLeft = 0
        mmTop = 1588
        mmWidth = 190000
        BandType = 8
        LayerName = Foreground1
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
        mmLeft = 0
        mmTop = 1323
        mmWidth = 51329
        BandType = 8
        LayerName = Foreground1
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
        mmLeft = 173302
        mmTop = 1058
        mmWidth = 16669
        BandType = 8
        LayerName = Foreground1
      end
      object RBText5: TppLabel
        UserName = 'Text1'
        AutoSize = False
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3260
        mmLeft = 529
        mmTop = 7144
        mmWidth = 172509
        BandType = 8
        LayerName = Foreground1
      end
      object RBLine2: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 3175
        mmLeft = 0
        mmTop = 6085
        mmWidth = 189971
        BandType = 8
        LayerName = Foreground1
      end
    end
    object ppDesignLayers2: TppDesignLayers
      object ppDesignLayer2: TppDesignLayer
        UserName = 'Foreground1'
        LayerType = ltBanded
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
end
