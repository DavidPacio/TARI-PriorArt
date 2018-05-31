object PrintInvoicesF: TPrintInvoicesF
  Left = 636
  Top = 345
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'PrintInvoicesF'
  ClientHeight = 430
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object FontSelector: TcxFontNameComboBox
    Left = 111
    Top = 168
    ParentFont = False
    Properties.FontPreview.ShowButtons = False
    Properties.FontPreview.WordWrap = True
    Properties.FontTypes = [cxftTTF, cxftRaster, cxftDevice, cxftFixed]
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    Width = 146
  end
  object cxLabel1: TcxLabel
    Left = 39
    Top = 24
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Tracking Period Dates'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 186
  end
  object cxLabel2: TcxLabel
    Left = 112
    Top = 208
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Sort Invoices by:'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 186
  end
  object QuotesStartDate: TcxDateEdit
    Left = 160
    Top = 64
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 3
    Width = 97
  end
  object RateCalcCB: TcxCheckBox
    Left = 112
    Top = 264
    Caption = 'Use Time Sheet Hours for Rate'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 4
    Transparent = True
    Width = 203
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 63
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'From'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Width = 36
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 92
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'To'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Width = 18
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 144
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Preview Setting'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 40
    Width = 121
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 176
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Report Font'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 33
    Width = 105
  end
  object CloseBtn: TcxButton
    Left = 104
    Top = 376
    Width = 153
    Height = 41
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 9
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = CloseBtnClick
  end
  object QuotesBtn: TcxButton
    Left = 104
    Top = 304
    Width = 153
    Height = 49
    Caption = '&Invoice Report'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC1AC9D694731694731
      6947316947316947316947316947316947316947316947316947316947316947
      31694731694731694731694731694731694731694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFC2AD9EEFE7E3B7A293B7A293B7A293B7A293B7A293
      B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2
      93B7A293B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3
      AE9FF1EAE6EFE7E3EDE5E0ECE3DDEBE1DBE9DED8E7DCD5E6D9D2E4D7CFE3D5CD
      E1D2CADFD0C7DECDC4DCCBC1DBC9BFDBC9BFDBC9BFDBC9BFB7A293694731FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC4AFA0F2ECE8F1EAE6EFE7E3ED
      E5E0ECE3DDEBE1DBE9DED8E7DCD5E6D9D2E4D7CFBE713CBE713CBE713CBE713C
      BE713CBE713CBE713CDBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFC5B0A1F4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DDEBE1DBE9
      DED8E7DCD5E6D9D2BE713CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE713CDBC9BF
      B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6B1A2F5F1
      EEF4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DDEBE1DBE9DED8E7DCD5BE713CFF
      FFFFBE713CBE713CBE713CFFFFFFBE713CDBC9BFB7A293694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFC6B1A2F7F3F1BE713CBE713CBE713CBE71
      3CBE713CBE713CBE713CBE713CBE713CBE713CFFFFFFFBC39FFBC39FFBC39FFF
      FFFFBE713CDCCBC1B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC7B2A3F9F7F5BE713CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE713CDECDC4B7A29369
      4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FBF9F8BE713C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBE713CE0D1C8B7A293694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFC8B3A4FDFCFBBE713CFFFFFFBE713CBE713CBE713C
      BE713CBE713CBE713CBE713CFFFFFFFFFFFFBE713CBE713CBE713CFFFFFFBE71
      3CE2D3CBB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCA
      B4A6FEFEFDBE713CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE713CE3D6CEB7A293694731FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAB5A6FFFFFFBE713CFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFBE713CE5D8D1B7A293694731FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFCBB6A7FFFFFFBE713CFFFFFFBE713CBE713CBE713CBE713CBE
      713CBE713CBE713CFFFFFFFFFFFFBE713CBE713CBE713CFFFFFFBE713CE7DBD4
      B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB6A8FFFF
      FFBE713CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFBE713CE8DDD6B7A293694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFCCB7A8FFFFFFBE713CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFBE713CEADFD9B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFCDB8A9FFFFFFBE713CFFFFFFBE713CBE713CBE713CBE713CBE713CBE71
      3CBE713CFFFFFFFFFFFFBE713CBE713CBE713CFFFFFFBE713CECE3DDB7A29369
      4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCEB8AAFFFFFFBE713C
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFBE713CEDE5E0B7A293694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFCFB9ABFFFFFFBE713CFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE71
      3CEFE7E3B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0
      BAACFFFFFFBE713C983000983000983000983000983000983000983000983000
      983000983000983000983000983000983000983000F1EAE6B7A293694731FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACFFFFFFBE713CBE713CBE
      713CBE713CBE713CBE713CBE713CBE713CBE713CBE713CBE713CBE713CBE713C
      BE713CBE713C983000F2ECE8B7A293694731FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFD1BBADFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFDFDFCFCFAF9FAF8F6F9F6F4F7F3F1F5F1EEF4EEEB
      B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD2BCAEFFFF
      FFBE713CBE713CBE713CBE713CBE713CFFFFFFBE713CBE713CBE713CBE713CBE
      713CFEFEFDBE713C983000983000983000F6F2EFB7A293694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFD3BDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBE713CE4A582E0
      9840983000F8F4F2B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFD3BDAFFFFFFFBE713CBE713CBE713CBE713CBE713CFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFBE713CBE713CBE713CBE713CF9F7F5B7A29369
      4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD4BEB0FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F7F5694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFD5BFB1D5BFB1D4BEB0D3BDAFD2BCAED2BCAED1BBAD
      D0BAACCFBAABCFB9ABCEB8AACDB8A9CCB7A8CCB6A8CBB6A7CEB8AACEB8AACEB8
      AACEB8AACEB8AACEB8AAFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = QuotesBtnClick
  end
  object PreviewZoomCB: TcxComboBox
    Left = 111
    Top = 141
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      '   25%'
      '   50%'
      '   75%'
      ' 100%'
      ' 125%'
      ' 150%'
      ' 200%'
      ' 250%'
      'Page Width'
      'Whole Page')
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 11
    Width = 146
  end
  object QuotesEndDate: TcxDateEdit
    Left = 160
    Top = 93
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 12
    Width = 97
  end
  object QuoteSortCB: TcxComboBox
    Left = 112
    Top = 232
    ParentFont = False
    Properties.DropDownListStyle = lsFixedList
    Properties.Items.Strings = (
      'As Entered'
      'Average Rate'
      'Sales Value'
      'Gross Profit %'
      'Invoice Number'
      'Invoice Date')
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 13
    Width = 145
  end
  object ppJITPipeline1: TppJITPipeline
    InitialIndex = 0
    RecordCount = 2
    UserName = 'JITPipeline1'
    Left = 280
    Top = 72
    object ppJITPipeline1ppField1: TppField
      FieldAlias = 'Title'
      FieldName = 'Title'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppJITPipeline1
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Units = utMillimeters
    AllowPrintToFile = True
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    BeforePrint = ppReport1BeforePrint
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
    Left = 280
    Top = 8
    Version = '14.06'
    mmColumnWidth = 0
    DataPipelineName = 'ppJITPipeline1'
    object ppHeaderBand1: TppHeaderBand
      Background.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 30163
      mmPrintPosition = 0
      object BusinessName: TppLabel
        UserName = 'BusinessName'
        AutoSize = False
        Caption = 'Business'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 22
        Font.Style = [fsBold]
        TextAlignment = taCentered
        mmHeight = 9102
        mmLeft = 0
        mmTop = 3704
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object ReportTitle: TppLabel
        UserName = 'ReportTitle'
        AutoSize = False
        Caption = 'Report Name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold, fsUnderline]
        TextAlignment = taCentered
        WordWrap = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 14288
        mmWidth = 197300
        BandType = 0
        LayerName = Foreground
      end
      object DepartmentDetail: TppLabel
        UserName = 'DepartmentDetail'
        AutoSize = False
        Caption = 'DepartmentDetail'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        mmHeight = 5249
        mmLeft = 7408
        mmTop = 22225
        mmWidth = 172244
        BandType = 0
        LayerName = Foreground
      end
      object RbSortType: TppLabel
        UserName = 'RbSortType'
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 13
        Font.Style = []
        TextAlignment = taRightJustified
        Visible = False
        mmHeight = 5249
        mmLeft = 87313
        mmTop = 21960
        mmWidth = 98690
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Background1.Brush.Style = bsClear
      Background2.Brush.Style = bsClear
      PrintHeight = phDynamic
      mmBottomOffset = 0
      mmHeight = 257176
      mmPrintPosition = 0
      object ppPaintBox1: TppPaintBox
        OnPrint = ppPaintBox1Print
        UserName = 'PaintBox1'
        Transparent = True
        mmHeight = 254001
        mmLeft = 7673
        mmTop = 1852
        mmWidth = 180975
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Background.Brush.Style = bsClear
      mmBottomOffset = 0
      mmHeight = 9790
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
        mmLeft = 7673
        mmTop = 529
        mmWidth = 71173
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
        mmLeft = 158750
        mmTop = 529
        mmWidth = 30163
        BandType = 8
        LayerName = Foreground
      end
      object RBText1: TppLabel
        UserName = 'Text1'
        Caption = 'TARI for Business - (C) Focus Based Management Pty Ltd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        mmHeight = 3704
        mmLeft = 7408
        mmTop = 6085
        mmWidth = 179652
        BandType = 8
        LayerName = Foreground
      end
      object RBLine1: TppLine
        UserName = 'Line1'
        Pen.Width = 2
        Weight = 1.500000000000000000
        mmHeight = 12700
        mmLeft = 7408
        mmTop = 5292
        mmWidth = 181240
        BandType = 8
        LayerName = Foreground
      end
    end
    object daDataModule1: TdaDataModule
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
end
