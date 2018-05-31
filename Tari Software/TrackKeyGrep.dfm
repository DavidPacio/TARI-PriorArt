object TrackKeyGRepF: TTrackKeyGRepF
  Left = 545
  Top = 312
  Width = 198
  Height = 199
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
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 24
    Top = 16
    Version = '7.02'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 28310
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
        mmHeight = 4763
        mmLeft = 265
        mmTop = 21167
        mmWidth = 190500
        BandType = 0
      end
      object RBReportTitle: TppLabel
        UserName = 'ReportTitle'
        RBVersion = '1.3'
        ParentWidth = True
        Caption = 'ReportTitle'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold, fsUnderline]
        Leading = 0
        mmHeight = 5821
        mmLeft = 0
        mmTop = 11906
        mmWidth = 190000
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 44450
      mmPrintPosition = 0
      object Chart1: TppTeeChart
        UserName = 'Chart1'
        mmHeight = 41540
        mmLeft = 0
        mmTop = 1323
        mmWidth = 185209
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
          Legend.HorizMargin = 8
          Legend.TextStyle = ltsPlain
          BevelOuter = bvNone
          Color = clWhite
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
        mmHeight = 4498
        mmLeft = 177800
        mmTop = 4233
        mmWidth = 12171
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
        mmHeight = 3969
        mmLeft = 265
        mmTop = 4498
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
        mmHeight = 3969
        mmLeft = 158750
        mmTop = 4498
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
        mmHeight = 4233
        mmLeft = 265
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
    Left = 78
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
