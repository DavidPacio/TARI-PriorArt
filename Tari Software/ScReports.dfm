object SCReportsF: TSCReportsF
  Left = 603
  Top = 347
  Width = 412
  Height = 568
  Caption = 'Tari Reports from Shortcuts'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 352
    Width = 385
    Height = 105
    Caption = 'Services'
    Style.BorderStyle = ebsThick
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 9
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 232
    Width = 385
    Height = 105
    Caption = 'Client and Transaction Ranking'
    Style.BorderStyle = ebsThick
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 8
  end
  object ClientReportBtn: TcxButton
    Left = 216
    Top = 248
    Width = 169
    Height = 33
    Caption = 'Top Ranking Client Report'
    TabOrder = 0
    OnClick = ClientReportBtnClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object TransreportBtn: TcxButton
    Left = 216
    Top = 288
    Width = 169
    Height = 33
    Caption = 'Top Ranking Transaction Report'
    TabOrder = 1
    OnClick = TransreportBtnClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object CloseBtn: TcxButton
    Left = 250
    Top = 475
    Width = 107
    Height = 49
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 2
    Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000330B0000330B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF85929900609000609000609000609000
      6090006090006090006090006090006090006090006090006090006090006090
      006090006090006090006090006090006090FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF8592998BF0F70691CD0691CD0691CD0691CD0691CD0691CD0691CD06
      91CD0691CD0691CD0691CD0691CD0691CD0691CD0691CD0691CD0691CD0691CD
      0691CD006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8592998BF0F787EE
      F783ECF77FEAF67CE8F678E6F574E4F571E2F56DE0F56ADDF466DBF462D9F45E
      D7F45AD5F356D3F352D1F351D0F351D0F351D0F30691CD006090FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF8592998EF2F88BF0F787EEF783ECF77FEAF67CE8
      F678E6F574E4F571E2F56DE0F56ADDF466DBF462D9F45ED7F45AD5F356D3F352
      D1F351D0F351D0F30691CD006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      85929992F4F88EF2F88BF0F787EEF783ECF77FEAF67CE8F678E6F574E4F571E2
      F56DE0F56ADDF466DBF462D9F45ED7F45AD5F356D3F352D1F351D0F30691CD00
      6090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85929992F4F892F4F88EF2F8
      8BF0F787EEF783ECF77FEAF67CE8F678E6F574E4F571E2F56DE0F56ADDF466DB
      F462D9F45ED7F45AD5F356D3F352D1F30691CD006090FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF85929992F4F892F4F892F4F88EF2F88BF0F787EEF783ECF7
      7FEAF67CE8F678E6F574E4F571E2F56DE0F56ADDF466DBF462D9F45ED7F45AD5
      F356D3F30691CD006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85929992
      F4F892F4F892F4F892F4F890F3F88DF1F889EFF783ECF77FEAF67CE8F678E6F5
      74E4F571E2F56DE0F56ADDF466DBF462D9F45ED7F45AD5F30691CD006090FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF85929992F4F892F4F892F4F892F4F892
      F4F890F3F88DF1F889EFF785EDF781EBF67EE9F67AE7F676E5F572E3F56FE1F5
      6CDFF568DCF464DAF460D8F40691CD006090FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF85929992F4F892F4F892F4F892F4F892F4F892F4F890F3F88DF1F889
      EFF785EDF781EBF67EE9F67AE7F676E5F572E3F56FE1F56CDFF568DCF464DAF4
      0691CD006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85929992F4F892F4
      F892F4F892F4F892F4F892F4F892F4F890F3F88DF1F889EFF785EDF781EBF67E
      E9F67AE7F676E5F572E3F56FE1F56CDFF568DCF40691CD006090FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF85929992F4F892F4F892F4F892F4F892F4F892F4
      F892F4F892F4F890F3F88DF1F889EFF785EDF781EBF67EE9F67AE7F676E5F572
      E3F56FE1F56CDFF50691CD006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      85929992F4F892F4F892F4F892F4F892F4F892F4F892F4F892F4F892F4F890F3
      F88DF1F889EFF785EDF781EBF67EE9F67AE7F676E5F572E3F56FE1F50691CD00
      6090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85929992F4F892F4F892F4F8
      92F4F892F4F892F4F892F4F892F4F892F4F892F4F890F3F88DF1F889EFF785ED
      F781EBF67EE9F67AE7F676E5F572E3F50691CD006090FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF85929992F4F892F4F892F4F892F4F892F4F892F4F892F4F8
      92F4F892F4F892F4F892F4F892F4F88EF2F88BF0F787EEF783ECF77EE9F67AE7
      F672E3F572E3F5006090FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF85929985
      9299859299859299859299859299859299859299859299859299859299859299
      859299859299859299859299859299859299859299859299859299859299FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF85929995F6F892F4F891F2F890F1F88E
      F0F88DEFF890F1F879CADE859299FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF85929984DBE894F5F892F4F891F2F890F1F890F1F879CADE859299FF
      00FFFF00FFFF00FFFF00FF983000983000983000983000983000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF8592998592
      99859299859299859299859299859299FF00FFFF00FFFF00FFFF00FFFF00FF98
      3000D38B64BD6B3F983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000E4A582D38B64BE713CFF
      00FFFF00FFFF00FFFF00FFFF00FFBE713CFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF983000983000983000983000BE713CFF00FFFF00FFBE713C98
      3000BE713CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000FF00
      FFFF00FFBE713C983000983000983000983000BE713CFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBE713CBE71
      3CBE713CBE713CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object SortRG: TcxRadioGroup
    Left = 24
    Top = 248
    Width = 177
    Height = 73
    Caption = 'Sort Selection'
    ItemIndex = 0
    Properties.Items = <
      item
        Caption = 'By Gross Profit'
        Value = 0
      end
      item
        Caption = 'By Actual GP Rate'
        Value = 1
        Tag = 1
      end>
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 8
    Width = 385
    Height = 169
    Caption = 'Reporting Period'
    Style.BorderStyle = ebsThick
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 4
    object cxLabel1: TcxLabel
      Left = 8
      Top = 120
      Width = 52
      Height = 17
      Caption = 'Start Date'
    end
    object cxLabel2: TcxLabel
      Left = 208
      Top = 120
      Width = 49
      Height = 17
      Caption = 'End Date'
    end
    object SCStartdate: TcxDateEdit
      Left = 8
      Top = 136
      Width = 161
      Height = 21
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
    end
    object SCEndDate: TcxDateEdit
      Left = 208
      Top = 136
      Width = 161
      Height = 21
      Properties.DateButtons = []
      Properties.SaveTime = False
      Properties.ShowTime = False
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 3
    end
    object PeriodRG: TcxRadioGroup
      Left = 8
      Top = 24
      Width = 369
      Height = 89
      Caption = 'Period Selection'
      ParentFont = False
      Properties.Columns = 2
      Properties.Items = <
        item
          Caption = 'This Week'
          Value = 0
        end
        item
          Caption = 'Last Week'
          Value = 1
          Tag = 1
        end
        item
          Caption = 'This Month'
          Value = 10
          Tag = 10
        end
        item
          Caption = 'Last Month'
          Value = 11
          Tag = 11
        end
        item
          Caption = 'As per Dates Below'
          Value = 20
          Tag = 20
        end>
      Properties.WordWrap = True
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clMaroon
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 4
      OnClick = PeriodRGClick
    end
  end
  object cxButton1: TcxButton
    Left = 104
    Top = 192
    Width = 169
    Height = 33
    Caption = 'TARI Staff Report'
    TabOrder = 5
    OnClick = cxButton1Click
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object ServicesReportBtn: TcxButton
    Left = 216
    Top = 392
    Width = 169
    Height = 33
    Caption = 'Services Report'
    TabOrder = 6
    OnClick = ServicesReportBtnClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object ServicesSortRG: TcxRadioGroup
    Left = 16
    Top = 368
    Width = 185
    Height = 73
    Caption = 'Services Sort Selection'
    ItemIndex = 0
    Properties.Items = <
      item
        Caption = 'By Services Name'
        Value = 0
      end
      item
        Caption = 'By Gross Profit Rate'
        Value = 1
        Tag = 1
      end
      item
        Caption = 'By Average Sale'
        Value = 2
        Tag = 2
      end>
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 7
  end
  object StaffReport: TppReport
    AutoStop = False
    DataPipeline = StaffReportPipeline
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\Auchinlea\Tari Software\TariStandardReport.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 40
    Top = 176
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'StaffReportPipeline'
    object ppHeaderBand1: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object BusinessName: TppLabel
        UserName = 'BusinessName'
        RBVersion = '1.3'
        ParentWidth = True
        Caption = 'Business'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 8996
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ReportTitle: TppLabel
        UserName = 'ReportTitle'
        RBVersion = '1.3'
        Stretch = True
        ParentWidth = True
        Caption = 'Report Name'
        WordWrap = True
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Leading = 0
        mmHeight = 5821
        mmLeft = 0
        mmTop = 14288
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine2: TppLine
        UserName = 'Line2'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 265
        mmLeft = 8467
        mmTop = 28840
        mmWidth = 261409
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText2: TppLabel
        UserName = 'Text2'
        RBVersion = '1.3'
        Caption = 'Staff Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 24606
        mmWidth = 26458
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText3: TppLabel
        UserName = 'Text3'
        RBVersion = '1.3'
        Caption = 'Sales'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 46567
        mmTop = 24606
        mmWidth = 24342
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText4: TppLabel
        UserName = 'Text4'
        RBVersion = '1.3'
        Caption = 'COGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 84667
        mmTop = 24606
        mmWidth = 15875
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText5: TppLabel
        UserName = 'Text5'
        RBVersion = '1.3'
        Caption = 'Gross Profit'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 107421
        mmTop = 24606
        mmWidth = 26194
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText6: TppLabel
        UserName = 'Text6'
        RBVersion = '1.3'
        Caption = 'Service Time (Hrs)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 135202
        mmTop = 24871
        mmWidth = 35454
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText7: TppLabel
        UserName = 'Text7'
        RBVersion = '1.3'
        Caption = 'Actual Rate'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 172773
        mmTop = 24871
        mmWidth = 28310
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText8: TppLabel
        UserName = 'Text8'
        RBVersion = '1.3'
        Caption = 'Productivity %'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 234421
        mmTop = 24606
        mmWidth = 35719
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText10: TppLabel
        UserName = 'Text10'
        RBVersion = '1.3'
        Caption = 'Paid Hours'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 202671
        mmTop = 24871
        mmWidth = 32015
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RBDBText1: TppDBText
        UserName = 'DBText1'
        RBVersion = '1.3'
        Color = clYellow
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'FULLNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 7938
        mmTop = 794
        mmWidth = 37042
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText2: TppDBText
        UserName = 'DBText2'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'SALES'
        DisplayFormat = '$,0.00;($,0.00)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 45244
        mmTop = 794
        mmWidth = 25400
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText3: TppDBText
        UserName = 'DBText3'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'COGS'
        DisplayFormat = '$,0.00;($,0.00)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 71173
        mmTop = 794
        mmWidth = 29369
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText4: TppDBText
        UserName = 'DBText4'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'GROSS_PROFIT'
        DisplayFormat = '$,0.00;($,0.00)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 101071
        mmTop = 794
        mmWidth = 32544
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText5: TppDBText
        UserName = 'DBText5'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'TARI_HOURS'
        DisplayFormat = '0.00;-0.00'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 134144
        mmTop = 794
        mmWidth = 36513
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText6: TppDBText
        UserName = 'DBText6'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'TARI_RATE'
        DisplayFormat = '$,0.00;($,0.00)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 171186
        mmTop = 794
        mmWidth = 30163
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText7: TppDBText
        UserName = 'DBText7'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'PRODUCTIVITY'
        DisplayFormat = '0.0 %;-0.0 %'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 235215
        mmTop = 794
        mmWidth = 34925
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText8: TppDBText
        UserName = 'DBText8'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = StaffReportPipeline
        DataField = 'PAID_HOURS'
        DisplayFormat = '0.00;-0.00'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 201877
        mmTop = 794
        mmWidth = 32808
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
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
        mmLeft = 8000
        mmTop = 1058
        mmWidth = 71173
        BandType = 8
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
        mmLeft = 240771
        mmTop = 529
        mmWidth = 30163
        BandType = 8
      end
      object RBText1: TppLabel
        UserName = 'Text1'
        RBVersion = '1.3'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Transparent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Leading = 0
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 172509
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine1: TppLine
        UserName = 'Line1'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 5821
        mmWidth = 262732
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object RBDBCalc1: TppDBCalc
        UserName = 'DBCalc1'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetValue = RBDBCalc2GetValue
        DataPipeline = StaffReportPipeline
        DataField = 'SALES'
        DisplayFormat = '$,0.00;$(,0.00)'
        Leading = 0
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 40481
        mmTop = 2646
        mmWidth = 30163
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBTOTALGP: TppDBCalc
        UserName = 'TOTALGP'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetValue = RBDBCalc2GetValue
        DataPipeline = StaffReportPipeline
        DataField = 'GROSS_PROFIT'
        DisplayFormat = '$,0.00;$(,0.00)'
        Leading = 0
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 102129
        mmTop = 2381
        mmWidth = 31485
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBTOTALHOURS: TppDBCalc
        UserName = 'TOTALHOURS'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetValue = RBDBCalc2GetValue
        DataPipeline = StaffReportPipeline
        DataField = 'TARI_HOURS'
        DisplayFormat = '0.00;-0.00'
        Leading = 0
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 141817
        mmTop = 2381
        mmWidth = 28840
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText9: TppLabel
        UserName = 'Text9'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetText = RBText9GetText
        Caption = 'Text9'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 178594
        mmTop = 2646
        mmWidth = 22754
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object TotalProductivity: TppLabel
        UserName = 'TotalProductivity'
        RBVersion = '1.3'
        OnGetText = TotalProductivityGetText
        Caption = 'TotalProductivity'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 243682
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText11: TppLabel
        UserName = 'Text11'
        RBVersion = '1.3'
        Caption = 'Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object TOTALPAIDHOURS: TppDBCalc
        UserName = 'TOTALPAIDHOURS'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetValue = RBDBCalc2GetValue
        DataPipeline = StaffReportPipeline
        DataField = 'PAID_HOURS'
        DisplayFormat = ',0.00;(,0.00)'
        Leading = 0
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 208227
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine3: TppLine
        UserName = 'Line3'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 1323
        mmLeft = 7144
        mmTop = 1058
        mmWidth = 263261
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBCalc2: TppDBCalc
        UserName = 'DBCalc2'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetValue = RBDBCalc2GetValue
        DataPipeline = StaffReportPipeline
        DataField = 'COGS'
        DisplayFormat = '$,0.00;$(,0.00)'
        Leading = 0
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        DataPipelineName = 'StaffReportPipeline'
        mmHeight = 4233
        mmLeft = 74083
        mmTop = 2381
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object StaffReportPipeline: TppDBPipeline
    DataSource = DMInterface.DSStaffReport
    UserName = 'StaffReportPipeline'
    Left = 104
    Top = 176
    object StaffReportPipelineppField1: TppField
      FieldAlias = 'FIRSTNAME'
      FieldName = 'FIRSTNAME'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object StaffReportPipelineppField2: TppField
      FieldAlias = 'LASTNAME'
      FieldName = 'LASTNAME'
      FieldLength = 50
      DisplayWidth = 50
      Position = 1
    end
    object StaffReportPipelineppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALES'
      FieldName = 'SALES'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 2
    end
    object StaffReportPipelineppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'COGS'
      FieldName = 'COGS'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 3
    end
    object StaffReportPipelineppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'TOTAL_MINS'
      FieldName = 'TOTAL_MINS'
      FieldLength = 4
      DataType = dtDouble
      DisplayWidth = 19
      Position = 4
    end
    object StaffReportPipelineppField6: TppField
      FieldAlias = 'FULLNAME'
      FieldName = 'FULLNAME'
      FieldLength = 20
      DisplayWidth = 20
      Position = 5
    end
    object StaffReportPipelineppField7: TppField
      FieldAlias = 'TARI_RATE'
      FieldName = 'TARI_RATE'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 6
    end
    object StaffReportPipelineppField8: TppField
      FieldAlias = 'TARI_HOURS'
      FieldName = 'TARI_HOURS'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 7
    end
    object StaffReportPipelineppField9: TppField
      FieldAlias = 'GROSS_PROFIT'
      FieldName = 'GROSS_PROFIT'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 8
    end
    object StaffReportPipelineppField10: TppField
      FieldAlias = 'PRODUCTIVITY'
      FieldName = 'PRODUCTIVITY'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 9
    end
    object StaffReportPipelineppField11: TppField
      FieldAlias = 'PAID_MINUTES'
      FieldName = 'PAID_MINUTES'
      FieldLength = 0
      DataType = dtLargeInt
      DisplayWidth = 15
      Position = 10
    end
    object StaffReportPipelineppField12: TppField
      FieldAlias = 'PAID_HOURS'
      FieldName = 'PAID_HOURS'
      FieldLength = 0
      DataType = dtCurrency
      DisplayWidth = 10
      Position = 11
    end
  end
  object ClientReport: TppReport
    AutoStop = False
    DataPipeline = JITClientData
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\Auchinlea\Tari Software\TariStandardReport.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 80
    Top = 256
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'JITClientData'
    object ppHeaderBand2: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object BusinessNameClient: TppLabel
        UserName = 'BusinessName'
        RBVersion = '1.3'
        ParentWidth = True
        Caption = 'Business'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 8996
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ReportNameClients: TppLabel
        UserName = 'ReportTitle'
        RBVersion = '1.3'
        Stretch = True
        ParentWidth = True
        Caption = 'Report Name'
        WordWrap = True
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Leading = 0
        mmHeight = 5821
        mmLeft = 0
        mmTop = 14817
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine4: TppLine
        UserName = 'Line2'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 265
        mmLeft = 8467
        mmTop = 28840
        mmWidth = 261409
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText14: TppLabel
        UserName = 'Text2'
        RBVersion = '1.3'
        Caption = 'Client Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 24871
        mmWidth = 26458
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText15: TppLabel
        UserName = 'Text3'
        RBVersion = '1.3'
        Caption = 'Sales'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 59267
        mmTop = 24871
        mmWidth = 24342
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText16: TppLabel
        UserName = 'Text4'
        RBVersion = '1.3'
        Caption = 'COGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 101600
        mmTop = 24871
        mmWidth = 15875
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText17: TppLabel
        UserName = 'Text5'
        RBVersion = '1.3'
        Caption = 'Gross Profit'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 125413
        mmTop = 24871
        mmWidth = 30163
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText18: TppLabel
        UserName = 'Text6'
        RBVersion = '1.3'
        Caption = 'Service Time (Hrs)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 157692
        mmTop = 24871
        mmWidth = 35983
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText19: TppLabel
        UserName = 'Text7'
        RBVersion = '1.3'
        Caption = 'Actual Rate'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 197115
        mmTop = 24871
        mmWidth = 30427
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText21: TppLabel
        UserName = 'Text10'
        RBVersion = '1.3'
        Caption = 'Last Transaction'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 229394
        mmTop = 24871
        mmWidth = 41275
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand2: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RBDBText9: TppDBText
        UserName = 'DBText9'
        RBVersion = '1.3'
        Color = clYellow
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'FULLNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 794
        mmWidth = 48683
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText10: TppDBText
        UserName = 'DBText10'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'SALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 57415
        mmTop = 794
        mmWidth = 26194
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText11: TppDBText
        UserName = 'DBText11'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'COGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 83873
        mmTop = 794
        mmWidth = 33602
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText12: TppDBText
        UserName = 'DBText12'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'GROSS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 118534
        mmTop = 794
        mmWidth = 37571
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText13: TppDBText
        UserName = 'DBText13'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'UNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 156104
        mmTop = 794
        mmWidth = 37571
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText14: TppDBText
        UserName = 'DBText14'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'RATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 194205
        mmTop = 794
        mmWidth = 33338
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText15: TppDBText
        UserName = 'DBText15'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITClientData
        DataField = 'LAST_DATE'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITClientData'
        mmHeight = 4233
        mmLeft = 228600
        mmTop = 794
        mmWidth = 42333
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
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
        mmLeft = 8000
        mmTop = 1058
        mmWidth = 71173
        BandType = 8
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
        mmLeft = 240771
        mmTop = 529
        mmWidth = 30163
        BandType = 8
      end
      object RBText22: TppLabel
        UserName = 'Text1'
        RBVersion = '1.3'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Transparent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Leading = 0
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 172509
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine5: TppLine
        UserName = 'Line1'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 5821
        mmWidth = 262732
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppSummaryBand2: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object CTRATE: TppLabel
        UserName = 'Text9'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetText = CTRATEGetText
        Caption = 'CTRATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 202407
        mmTop = 2910
        mmWidth = 25665
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText26: TppLabel
        UserName = 'Text11'
        RBVersion = '1.3'
        Caption = 'Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine6: TppLine
        UserName = 'Line3'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 1323
        mmLeft = 7144
        mmTop = 1058
        mmWidth = 263261
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTSALES: TppLabel
        UserName = 'CTSALES'
        RBVersion = '1.3'
        OnGetText = CTSALESGetText
        Caption = 'CTSALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 57150
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTCOGS: TppLabel
        UserName = 'CTCOGS'
        RBVersion = '1.3'
        OnGetText = CTCOGSGetText
        Caption = 'CTCOGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 91017
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTGROSS: TppLabel
        UserName = 'CTGROSS'
        RBVersion = '1.3'
        OnGetText = CTGROSSGetText
        Caption = 'CTGROSS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 129117
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTUNITS: TppLabel
        UserName = 'CTUNITS'
        RBVersion = '1.3'
        OnGetText = CTUNITSGetText
        Caption = 'CTUNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 167217
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppParameterList2: TppParameterList
    end
  end
  object JITClientData: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'JITClientData'
    OnCheckEOF = JITClientDataCheckEOF
    OnGetActive = JITClientDataGetActive
    OnGetFieldValue = JITClientDataGetFieldValue
    OnGotoFirstRecord = JITClientDataGotoFirstRecord
    OnGotoLastRecord = JITClientDataGotoLastRecord
    OnRecordPositionChange = JITClientDataRecordPositionChange
    Left = 152
    Top = 256
    object JITClientDatappField1: TppField
      FieldAlias = 'FULLNAME'
      FieldName = 'FULLNAME'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 0
    end
    object JITClientDatappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALES'
      FieldName = 'SALES'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 1
    end
    object JITClientDatappField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COGS'
      FieldName = 'COGS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 2
    end
    object JITClientDatappField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'GROSS'
      FieldName = 'GROSS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 3
    end
    object JITClientDatappField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITS'
      FieldName = 'UNITS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 4
    end
    object JITClientDatappField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATE'
      FieldName = 'RATE'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 5
    end
    object JITClientDatappField7: TppField
      Alignment = taCenter
      FieldAlias = 'LAST_DATE'
      FieldName = 'LAST_DATE'
      FieldLength = 15
      DisplayWidth = 15
      Position = 6
    end
  end
  object TransReport: TppReport
    AutoStop = False
    DataPipeline = JITTransData
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\Auchinlea\Tari Software\TariStandardReport.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 80
    Top = 304
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'JITTransData'
    object ppHeaderBand3: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object BusinessNameTrans: TppLabel
        UserName = 'BusinessName'
        RBVersion = '1.3'
        ParentWidth = True
        Caption = 'Business'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 8996
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ReportTitleTrans: TppLabel
        UserName = 'ReportTitle'
        RBVersion = '1.3'
        Stretch = True
        ParentWidth = True
        Caption = 'Report Name'
        WordWrap = True
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Leading = 0
        mmHeight = 5821
        mmLeft = 0
        mmTop = 14817
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine7: TppLine
        UserName = 'Line2'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 265
        mmLeft = 8467
        mmTop = 28840
        mmWidth = 261409
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText20: TppLabel
        UserName = 'Text2'
        RBVersion = '1.3'
        Caption = 'Client Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 51065
        mmTop = 24871
        mmWidth = 26458
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText24: TppLabel
        UserName = 'Text3'
        RBVersion = '1.3'
        Caption = 'Sales'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 101865
        mmTop = 24871
        mmWidth = 24342
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText25: TppLabel
        UserName = 'Text4'
        RBVersion = '1.3'
        Caption = 'COGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 144198
        mmTop = 24871
        mmWidth = 15875
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText27: TppLabel
        UserName = 'Text5'
        RBVersion = '1.3'
        Caption = 'Gross Profit'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 24871
        mmWidth = 28840
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText28: TppLabel
        UserName = 'Text6'
        RBVersion = '1.3'
        Caption = 'Service Time (Hrs)'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 203730
        mmTop = 24871
        mmWidth = 33338
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText29: TppLabel
        UserName = 'Text7'
        RBVersion = '1.3'
        Caption = 'Actual Rate'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 237332
        mmTop = 24871
        mmWidth = 32808
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText30: TppLabel
        UserName = 'Text10'
        RBVersion = '1.3'
        Caption = 'Transaction Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 24871
        mmWidth = 41275
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RBDBText16: TppDBText
        UserName = 'DBText9'
        RBVersion = '1.3'
        Color = clYellow
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'FULLNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 51065
        mmTop = 794
        mmWidth = 48683
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText17: TppDBText
        UserName = 'DBText10'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'SALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 794
        mmWidth = 26194
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText18: TppDBText
        UserName = 'DBText11'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'COGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 126207
        mmTop = 794
        mmWidth = 33602
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText19: TppDBText
        UserName = 'DBText12'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'GROSS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 160073
        mmTop = 794
        mmWidth = 38365
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText20: TppDBText
        UserName = 'DBText13'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'UNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 198438
        mmTop = 794
        mmWidth = 37571
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText21: TppDBText
        UserName = 'DBText14'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'RATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 236009
        mmTop = 794
        mmWidth = 33867
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText22: TppDBText
        UserName = 'DBText15'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITTransData
        DataField = 'TRANS_DATE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITTransData'
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 794
        mmWidth = 42333
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppFooterBand3: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppSystemVariable5: TppSystemVariable
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
        mmLeft = 8000
        mmTop = 1058
        mmWidth = 71173
        BandType = 8
      end
      object ppSystemVariable6: TppSystemVariable
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
        mmLeft = 240771
        mmTop = 529
        mmWidth = 30163
        BandType = 8
      end
      object RBText31: TppLabel
        UserName = 'Text1'
        RBVersion = '1.3'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Transparent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Leading = 0
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 172509
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine8: TppLine
        UserName = 'Line1'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 5821
        mmWidth = 262732
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppSummaryBand3: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object RBText33: TppLabel
        UserName = 'Text9'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetText = CTRATEGetText
        Caption = 'CTRATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 244740
        mmTop = 2910
        mmWidth = 25665
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText34: TppLabel
        UserName = 'Text11'
        RBVersion = '1.3'
        Caption = 'Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine9: TppLine
        UserName = 'Line3'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 1323
        mmLeft = 7144
        mmTop = 1058
        mmWidth = 263261
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText35: TppLabel
        UserName = 'CTSALES'
        RBVersion = '1.3'
        OnGetText = CTSALESGetText
        Caption = 'CTSALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 99484
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText36: TppLabel
        UserName = 'CTCOGS'
        RBVersion = '1.3'
        OnGetText = CTCOGSGetText
        Caption = 'CTCOGS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText37: TppLabel
        UserName = 'CTGROSS'
        RBVersion = '1.3'
        OnGetText = CTGROSSGetText
        Caption = 'CTGROSS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 171450
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText38: TppLabel
        UserName = 'CTUNITS'
        RBVersion = '1.3'
        OnGetText = CTUNITSGetText
        Caption = 'CTUNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 209550
        mmTop = 2910
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppParameterList3: TppParameterList
    end
  end
  object JITTransData: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'JITClientData1'
    OnCheckEOF = JITTransDataCheckEOF
    OnGetActive = JITClientDataGetActive
    OnGetFieldValue = JITTransDataGetFieldValue
    OnGotoFirstRecord = JITClientDataGotoFirstRecord
    OnGotoLastRecord = JITClientDataGotoLastRecord
    OnRecordPositionChange = JITTransDataRecordPositionChange
    Left = 152
    Top = 304
    object JITTransDatappField1: TppField
      FieldAlias = 'TRANS_DATE'
      FieldName = 'TRANS_DATE'
      FieldLength = 15
      DisplayWidth = 10
      Position = 0
    end
    object ppField1: TppField
      FieldAlias = 'FULLNAME'
      FieldName = 'FULLNAME'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 1
    end
    object ppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALES'
      FieldName = 'SALES'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 2
    end
    object ppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'COGS'
      FieldName = 'COGS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 3
    end
    object ppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'GROSS'
      FieldName = 'GROSS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 4
    end
    object ppField5: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITS'
      FieldName = 'UNITS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 5
    end
    object ppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATE'
      FieldName = 'RATE'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 6
    end
  end
  object ServicesReport: TppReport
    AutoStop = False
    DataPipeline = JITServicesData
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    Template.FileName = 'D:\Auchinlea\Tari Software\TariStandardReport.rtm'
    Units = utMillimeters
    AllowPrintToFile = True
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    PreviewFormSettings.WindowState = wsMaximized
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 80
    Top = 360
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'JITServicesData'
    object ppHeaderBand4: TppHeaderBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30956
      mmPrintPosition = 0
      object BusinessNameServices: TppLabel
        UserName = 'BusinessName'
        RBVersion = '1.3'
        ParentWidth = True
        Caption = 'Business'
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 8996
        mmLeft = 0
        mmTop = 3704
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object ReportNameServices: TppLabel
        UserName = 'ReportTitle'
        RBVersion = '1.3'
        Stretch = True
        ParentWidth = True
        Caption = 'Report Name'
        WordWrap = True
        Alignment = taCenter
        TextAlignment = taCentered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        Leading = 0
        mmHeight = 5821
        mmLeft = 0
        mmTop = 14817
        mmWidth = 284300
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine10: TppLine
        UserName = 'Line2'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 265
        mmLeft = 8467
        mmTop = 28840
        mmWidth = 261409
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText23: TppLabel
        UserName = 'Text2'
        RBVersion = '1.3'
        Caption = 'Service Description'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 24871
        mmWidth = 54769
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText32: TppLabel
        UserName = 'Text3'
        RBVersion = '1.3'
        Caption = 'Sales'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 101865
        mmTop = 24871
        mmWidth = 24342
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText39: TppLabel
        UserName = 'Text4'
        RBVersion = '1.3'
        Caption = 'Hours Sold'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 139436
        mmTop = 24871
        mmWidth = 20638
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText40: TppLabel
        UserName = 'Text5'
        RBVersion = '1.3'
        Caption = 'Rate per Hour'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 169334
        mmTop = 24871
        mmWidth = 28840
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText41: TppLabel
        UserName = 'Text6'
        RBVersion = '1.3'
        Caption = 'Number Sold'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 203730
        mmTop = 24871
        mmWidth = 33338
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText42: TppLabel
        UserName = 'Text7'
        RBVersion = '1.3'
        Caption = 'Average Sale'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 237332
        mmTop = 24871
        mmWidth = 32808
        BandType = 0
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppDetailBand4: TppDetailBand
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 5556
      mmPrintPosition = 0
      object RBDBText23: TppDBText
        UserName = 'DBText9'
        RBVersion = '1.3'
        Color = clYellow
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'FULLNAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 8467
        mmTop = 794
        mmWidth = 91281
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText24: TppDBText
        UserName = 'DBText10'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'SALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 99748
        mmTop = 794
        mmWidth = 26194
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText25: TppDBText
        UserName = 'DBText11'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'UNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 126207
        mmTop = 794
        mmWidth = 33602
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText26: TppDBText
        UserName = 'DBText12'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'RATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 160073
        mmTop = 794
        mmWidth = 38365
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText27: TppDBText
        UserName = 'DBText13'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'COUNT'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 198702
        mmTop = 794
        mmWidth = 37571
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBDBText28: TppDBText
        UserName = 'DBText14'
        RBVersion = '1.3'
        Color = clYellow
        ZeroBehavior = zbBlank
        AlternateTransparent = True
        DataPipeline = JITServicesData
        DataField = 'AVESALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Leading = 0
        DataPipelineName = 'JITServicesData'
        mmHeight = 4233
        mmLeft = 236538
        mmTop = 794
        mmWidth = 33867
        BandType = 4
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppFooterBand4: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 11113
      mmPrintPosition = 0
      object ppSystemVariable7: TppSystemVariable
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
        mmLeft = 8000
        mmTop = 1058
        mmWidth = 71173
        BandType = 8
      end
      object ppSystemVariable8: TppSystemVariable
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
        mmLeft = 240771
        mmTop = 529
        mmWidth = 30163
        BandType = 8
      end
      object RBText44: TppLabel
        UserName = 'Text1'
        RBVersion = '1.3'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Transparent = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Leading = 0
        mmHeight = 3704
        mmLeft = 7938
        mmTop = 6879
        mmWidth = 172509
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine11: TppLine
        UserName = 'Line1'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 3175
        mmLeft = 7408
        mmTop = 5821
        mmWidth = 262732
        BandType = 8
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppSummaryBand4: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 7673
      mmPrintPosition = 0
      object RBText45: TppLabel
        UserName = 'Text9'
        RBVersion = '1.3'
        ZeroBehavior = zbBlank
        OnGetText = CTRATEGetText
        Caption = 'CTRATE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 172773
        mmTop = 2646
        mmWidth = 25665
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText46: TppLabel
        UserName = 'Text11'
        RBVersion = '1.3'
        Caption = 'Totals'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 7144
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBLine12: TppLine
        UserName = 'Line3'
        RBVersion = '1.3'
        Pen.Width = 2
        Transparent = True
        mmHeight = 1323
        mmLeft = 7144
        mmTop = 1058
        mmWidth = 263261
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText47: TppLabel
        UserName = 'CTSALES'
        RBVersion = '1.3'
        OnGetText = CTSALESGetText
        Caption = 'CTSALES'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 99484
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTAVESALE: TppLabel
        UserName = 'CTCOGS'
        RBVersion = '1.3'
        OnGetText = CTAVESALEGetText
        Caption = 'CTAVESALE'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 243946
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object CTSERVICECOUNT: TppLabel
        UserName = 'CTGROSS'
        RBVersion = '1.3'
        OnGetText = CTSERVICECOUNTGetText
        Caption = 'CTSERVICECOUNT'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 209815
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
      object RBText50: TppLabel
        UserName = 'CTUNITS'
        RBVersion = '1.3'
        OnGetText = CTUNITSGetText
        Caption = 'CTUNITS'
        Alignment = taRightJustify
        TextAlignment = taRightJustified
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Leading = 0
        mmHeight = 4233
        mmLeft = 133350
        mmTop = 2646
        mmWidth = 26458
        BandType = 7
        mmBottomOffset = 0
        mmOverFlowOffset = 0
        mmStopPosition = 0
      end
    end
    object ppParameterList4: TppParameterList
    end
  end
  object JITServicesData: TppJITPipeline
    InitialIndex = 0
    RecordCount = 99999999
    UserName = 'JITServicesData'
    OnCheckEOF = JITServicesDataCheckEOF
    OnGetActive = JITClientDataGetActive
    OnGetFieldValue = JITServicesDataGetFieldValue
    OnGotoFirstRecord = JITClientDataGotoFirstRecord
    OnGotoLastRecord = JITClientDataGotoLastRecord
    OnRecordPositionChange = JITServicesDataRecordPositionChange
    Left = 160
    Top = 360
    object ppField8: TppField
      FieldAlias = 'FULLNAME'
      FieldName = 'FULLNAME'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 0
    end
    object ppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALES'
      FieldName = 'SALES'
      FieldLength = 10
      IsDetail = True
      DisplayWidth = 10
      Position = 1
    end
    object ppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'UNITS'
      FieldName = 'UNITS'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 2
    end
    object ppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'RATE'
      FieldName = 'RATE'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 3
    end
    object JITServicesDatappField1: TppField
      Alignment = taRightJustify
      FieldAlias = 'COUNT'
      FieldName = 'COUNT'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 4
    end
    object JITServicesDatappField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'AVESALES'
      FieldName = 'AVESALES'
      FieldLength = 15
      IsDetail = True
      DisplayWidth = 15
      Position = 5
    end
  end
end
