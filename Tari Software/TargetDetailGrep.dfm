object TargetDetailGRepF: TTargetDetailGRepF
  Left = 505
  Top = 251
  Caption = 'ChartsRep'
  ClientHeight = 204
  ClientWidth = 217
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
    Left = 40
    Top = 24
    Version = '14.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 29633
      mmPrintPosition = 0
      object RBCompanyName: TppLabel
        UserName = 'CompanyName'
        AutoSize = False
        Caption = 'Company Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 9102
        mmLeft = 0
        mmTop = 0
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground
      end
      object RBQRLabel1: TppLabel
        UserName = 'QRLabel1'
        AutoSize = False
        Caption = 'QRLabel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        mmHeight = 5842
        mmLeft = 0
        mmTop = 9525
        mmWidth = 190000
        BandType = 0
        LayerName = Foreground
      end
      object rbQRPeriodinfo: TppLabel
        UserName = 'rbQRPeriodinfo'
        AutoSize = False
        Caption = 'rbQRPeriodinfo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        mmHeight = 4572
        mmLeft = 0
        mmTop = 16140
        mmWidth = 190000
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
        mmHeight = 5821
        mmLeft = 50800
        mmTop = 23283
        mmWidth = 138907
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
        mmTop = 23019
        mmWidth = 49742
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object Chart1: TppTeeChart
        OnPrint = Chart1Print
        UserName = 'Chart1'
        mmHeight = 43921
        mmLeft = 0
        mmTop = 265
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
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 11113
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
        mmTop = 1794
        mmWidth = 31750
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
        mmTop = 6350
        mmWidth = 190000
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
        mmHeight = 3233
        mmLeft = 0
        mmTop = 2588
        mmWidth = 71173
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
        mmTop = 7408
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
    UserName = 'JITPipeline1'
    Left = 94
    Top = 22
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title'
      FieldName = 'Title'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
end
