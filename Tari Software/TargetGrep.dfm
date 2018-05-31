object TargetGRepF: TTargetGRepF
  Left = 445
  Top = 361
  Caption = 'ChartsRep'
  ClientHeight = 414
  ClientWidth = 607
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ppReport1: TppReport
    AutoStop = False
    Columns = 2
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
    PrinterSetup.mmPaperHeight = 297128
    PrinterSetup.mmPaperWidth = 210080
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Printer'
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
    PreviewFormSettings.ZoomSetting = zsPercentage
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
    Left = 232
    Top = 16
    Version = '14.02'
    mmColumnWidth = 94986
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 51594
      mmPrintPosition = 0
      object rbCompanyName: TppLabel
        UserName = 'rbCompanyName'
        AutoSize = False
        Caption = 'Chart Testing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 8996
        mmLeft = 0
        mmTop = 0
        mmWidth = 189971
        BandType = 0
        LayerName = Foreground
      end
      object rbQRLabel1: TppLabel
        UserName = 'rbQRLabel1'
        AutoSize = False
        Caption = 'Target Profit and Loss Graph Trend Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 10848
        mmWidth = 189971
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
        mmLeft = 2117
        mmTop = 19050
        mmWidth = 49742
        BandType = 0
        LayerName = Foreground
      end
      object rbDepartment: TppLabel
        UserName = 'rbDepartment'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        WordWrap = True
        mmHeight = 5556
        mmLeft = 52917
        mmTop = 19579
        mmWidth = 137054
        BandType = 0
        LayerName = Foreground
      end
      object RBShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 21696
        mmLeft = 265
        mmTop = 26723
        mmWidth = 189707
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 42598
      mmPrintPosition = 0
      object Chart1: TppTeeChart
        OnPrint = Chart1Print
        UserName = 'Chart1'
        mmHeight = 41010
        mmLeft = 0
        mmTop = 0
        mmWidth = 93134
        BandType = 4
        LayerName = Foreground
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          BackWall.Color = clWhite
          Title.Font.Height = -13
          Title.Font.Style = [fsBold]
          Title.Text.Strings = (
            'Chart')
          BackColor = clWhite
          BottomAxis.Grid.SmallDots = True
          BottomAxis.Grid.Visible = False
          BottomAxis.Labels = False
          BottomAxis.TickLength = 0
          BottomAxis.Ticks.Visible = False
          Chart3DPercent = 30
          LeftAxis.Grid.SmallDots = True
          LeftAxis.Ticks.SmallDots = True
          Legend.Visible = False
          MaxPointsPerPage = 0
          Page = 1
          RightAxis.Grid.SmallDots = True
          ScaleLastPage = True
          TopAxis.Grid.SmallDots = True
          BevelOuter = bvNone
          BorderStyle = bsNone
          Color = clWhite
          PrintMargins = (
            16
            22
            14
            24)
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = True
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
            Data = {
              02060000000000000000A88040FF000000000000000030844000800000000000
              0000108540FFFF000000000000006084400000FF000000000000388140FFFFFF
              000000000000907F4080808000}
          end
        end
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      AlignToBottom = True
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 16404
      mmPrintPosition = 0
      object rbQRSysData2: TppSystemVariable
        UserName = 'rbQRSysData2'
        AutoSize = False
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        mmHeight = 4022
        mmLeft = 158486
        mmTop = 5556
        mmWidth = 31750
        BandType = 8
        LayerName = Foreground
      end
      object rbQRLabel3: TppLabel
        UserName = 'rbQRLabel3'
        AutoSize = False
        Caption = '* These figures have been Annualised for comparative purposes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        WordWrap = True
        mmHeight = 4498
        mmLeft = 265
        mmTop = 265
        mmWidth = 93398
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
        mmTop = 5556
        mmWidth = 71173
        BandType = 8
        LayerName = Foreground
      end
      object RBLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        ParentWidth = True
        Weight = 1.500000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 10583
        mmWidth = 190080
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
        mmLeft = 0
        mmTop = 11906
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
    RecordCount = 99999999
    SkipWhenNoRecords = False
    UserName = 'JITPipeline1'
    Left = 360
    Top = 24
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title1'
      FieldName = 'Title1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
end
