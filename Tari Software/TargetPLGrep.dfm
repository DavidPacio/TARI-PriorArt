object TargetPLGRepF: TTargetPLGRepF
  Left = 444
  Top = 360
  Width = 268
  Height = 185
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
  object ppReport1: TppReport
    AutoStop = False
    Columns = 2
    DataPipeline = ppJITPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 7000
    PrinterSetup.mmMarginLeft = 10000
    PrinterSetup.mmMarginRight = 10000
    PrinterSetup.mmMarginTop = 10000
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    DeviceType = 'Printer'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 32
    Top = 16
    Version = '7.02'
    mmColumnWidth = 94986
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 47096
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
      end
      object rbDepartments: TppLabel
        UserName = 'rbDepartments'
        AutoSize = False
        Caption = 'Departments'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        WordWrap = True
        mmHeight = 4868
        mmLeft = 0
        mmTop = 21167
        mmWidth = 179917
        BandType = 0
      end
      object RBShape1: TppShape
        UserName = 'Shape1'
        RBVersion = '1.3'
        Transparent = True
        mmHeight = 17463
        mmLeft = 265
        mmTop = 28310
        mmWidth = 189707
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppColumnHeaderBand1: TppColumnHeaderBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppDetailBand1: TppDetailBand
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
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
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
          RightAxis.Grid.SmallDots = True
          TopAxis.Grid.SmallDots = True
          BevelOuter = bvNone
          Color = clWhite
          PrintMargins = (
            16
            22
            14
            24)
          object Series1: TBarSeries
            ColorEachPoint = True
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
            Data = {
              02060000000000000000A88040FF000000000000000030844000800000000000
              0000108540FFFF000000000000006084400000FF000000000000388140FFFFFF
              000000000000907F4080808000}
          end
        end
      end
    end
    object ppColumnFooterBand1: TppColumnFooterBand
      mmBottomOffset = 0
      mmHeight = 0
      mmPrintPosition = 0
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11906
      mmPrintPosition = 0
      object rbQRSysData2: TppSystemVariable
        UserName = 'rbQRSysData2'
        VarType = vtPageNoDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        mmHeight = 5027
        mmLeft = 158486
        mmTop = 5556
        mmWidth = 31750
        BandType = 8
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
      end
      object RBLine1: TppLine
        UserName = 'Line1'
        RBVersion = '1.3'
        Pen.Width = 2
        ParentWidth = True
        Transparent = True
        mmHeight = 1058
        mmLeft = 0
        mmTop = 10583
        mmWidth = 190000
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
  end
  object ppJITPipeline1: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    SkipWhenNoRecords = False
    UserName = 'JITPipeline1'
    Left = 80
    Top = 16
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title1'
      FieldName = 'Title1'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
end
