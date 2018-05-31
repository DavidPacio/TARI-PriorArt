object TargetDPLGRepF: TTargetDPLGRepF
  Left = 262
  Top = 289
  Width = 233
  Height = 242
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
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 56
    Top = 24
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object rbCompanyName: TppLabel
        UserName = 'rbCompanyName'
        AutoSize = False
        Caption = 'Chart Testing'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Caption = 'QRLabel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5842
        mmLeft = 0
        mmTop = 9525
        mmWidth = 190765
        BandType = 0
      end
      object rbDepartments: TppLabel
        UserName = 'rbDepartments'
        AutoSize = False
        Caption = 'Departments'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        WordWrap = True
        mmHeight = 4868
        mmLeft = 0
        mmTop = 23283
        mmWidth = 190765
        BandType = 0
      end
      object rbQRPeriodinfo: TppLabel
        UserName = 'rbQRPeriodinfo'
        AutoSize = False
        Caption = 'QRLabel1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 11
        Font.Style = [fsBold, fsItalic]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 4572
        mmLeft = 0
        mmTop = 15875
        mmWidth = 190765
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 46567
      mmPrintPosition = 0
      object Chart1: TppTeeChart
        UserName = 'Chart1'
        mmHeight = 42598
        mmLeft = 0
        mmTop = 265
        mmWidth = 189971
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
          BottomAxis.Title.Visible = False
          Legend.TextStyle = ltsPlain
          RightAxis.Grid.SmallDots = True
          BevelOuter = bvNone
          Color = clWhite
          PrintMargins = (
            15
            23
            15
            23)
          object Series1: TLineSeries
            Marks.ArrowLength = 8
            Marks.Visible = False
            SeriesColor = clRed
            Pointer.InflateMargins = True
            Pointer.Style = psRectangle
            Pointer.Visible = False
            XValues.DateTime = False
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.DateTime = False
            YValues.Name = 'Y'
            YValues.Order = loNone
          end
        end
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 9260
      mmPrintPosition = 0
      object rbQRSysData2: TppSystemVariable
        UserName = 'rbQRSysData2'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        mmHeight = 4487
        mmLeft = 177779
        mmTop = 3440
        mmWidth = 12192
        BandType = 8
      end
      object rbPageDateTime: TppLabel
        UserName = 'rbPageDateTime'
        AutoSize = False
        Caption = 'PageDateTime'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        TextAlignment = taRightJustified
        WordWrap = True
        mmHeight = 4022
        mmLeft = 158750
        mmTop = 3704
        mmWidth = 23548
        BandType = 8
      end
      object rbQRLabel3: TppLabel
        UserName = 'rbQRLabel3'
        AutoSize = False
        Caption = '* These figures have been Annualised for comparative purposes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
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
    RecordCount = 99999999
    UserName = 'JITPipeline1'
    Left = 118
    Top = 30
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title'
      FieldName = 'Title'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
end
