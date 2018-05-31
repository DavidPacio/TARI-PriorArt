object TargetKeyGRepF: TTargetKeyGRepF
  Left = 302
  Top = 225
  Width = 218
  Height = 167
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
    PrinterSetup.mmPaperHeight = 297001
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utScreenPixels
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 32
    Top = 16
    Version = '7.02'
    mmColumnWidth = 94986
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 48683
      mmPrintPosition = 0
      object rbCompanyName: TppLabel
        UserName = 'rbCompanyName'
        AutoSize = False
        Caption = 'CompanyName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 9102
        mmLeft = 0
        mmTop = 0
        mmWidth = 190765
        BandType = 0
      end
      object rbQRLabel1: TppLabel
        UserName = 'rbQRLabel1'
        AutoSize = False
        Caption = 'Target Key Indicator Graph Report'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5842
        mmLeft = 0
        mmTop = 10583
        mmWidth = 190765
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
        mmWidth = 190765
        BandType = 0
      end
      object RBShape1: TppShape
        UserName = 'Shape1'
        RBVersion = '1.3'
        Transparent = True
        mmHeight = 18785
        mmLeft = 265
        mmTop = 28046
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
      mmBottomOffset = 0
      mmHeight = 41010
      mmPrintPosition = 0
      object rbQRShape1: TppLine
        UserName = 'rbQRShape1'
        Pen.Width = 3
        Weight = 2.250000000000000000
        mmHeight = 1058
        mmLeft = 0
        mmTop = 39688
        mmWidth = 94986
        BandType = 4
      end
      object Chart1: TppTeeChart
        UserName = 'Chart1'
        mmHeight = 40217
        mmLeft = 1058
        mmTop = 529
        mmWidth = 92604
        BandType = 4
        object ppTeeChartControl1: TppTeeChartControl
          Left = 0
          Top = 0
          Width = 400
          Height = 250
          Title.Text.Strings = (
            'Chart')
          BackColor = clWhite
          BottomAxis.Labels = False
          BottomAxis.MinorTickCount = 0
          BottomAxis.MinorTickLength = 0
          BottomAxis.TickLength = 0
          Chart3DPercent = 20
          Legend.Visible = False
          BevelOuter = bvNone
          Color = clWhite
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
      mmHeight = 9260
      mmPrintPosition = 0
      object rbQRSysData2: TppSystemVariable
        UserName = 'rbQRSysData2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        mmHeight = 4022
        mmLeft = 188024
        mmTop = 3704
        mmWidth = 1947
        BandType = 8
      end
      object rbPageDateTime: TppLabel
        UserName = 'rbPageDateTime'
        AutoSize = False
        Caption = 'PageDateTime'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsItalic]
        WordWrap = True
        mmHeight = 3302
        mmLeft = 0
        mmTop = 4233
        mmWidth = 53181
        BandType = 8
      end
      object rbQRLabel2: TppLabel
        UserName = 'rbQRLabel2'
        AutoSize = False
        Caption = 'Page '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 3969
        mmWidth = 23548
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
        mmHeight = 3260
        mmLeft = 0
        mmTop = 0
        mmWidth = 93398
        BandType = 8
      end
    end
  end
  object ppJITPipeline1: TppJITPipeline
    InitialIndex = 0
    RecordCount = 1
    UserName = 'JITPipeline1'
    Left = 86
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
