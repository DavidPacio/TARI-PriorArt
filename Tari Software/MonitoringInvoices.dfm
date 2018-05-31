object MonitoringInvoicesF: TMonitoringInvoicesF
  Left = 447
  Top = 260
  HelpContext = 1026
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  ActiveControl = cxGrid1
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Monitoring Invoice Details'
  ClientHeight = 726
  ClientWidth = 1012
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 4
    Top = 144
    Width = 1006
    Height = 521
    TabOrder = 0
    object DBTVInvoices: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataModuleClient.DSActualInvoiceDetails
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Totals'
          Kind = skCount
          FieldName = 'INV_DATE'
          Column = DBTVInvoicesINV_DATE
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          FieldName = 'NETSALES'
          Column = DBTVInvoicesNETSALES
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          FieldName = 'MATERIALSATCOST'
          Column = DBTVInvoicesMATERIALSATCOST
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          FieldName = 'SUBCONTRACTORS'
          Column = DBTVInvoicesSUBCONTRACTORS
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          FieldName = 'GROSSPROFIT'
          Column = DBTVInvoicesGROSSPROFIT
        end
        item
          Format = ',0.00 %;-,0.00 %'
          Kind = skAverage
          FieldName = 'GPPC'
          Column = DBTVInvoicesGPPC
        end
        item
          Format = ',0.0;-,0'
          Kind = skSum
          FieldName = 'RECORDEDUNITS'
          Column = DBTVInvoicesRECORDEDUNITS
        end
        item
          Format = ',0.0;-,0'
          Kind = skSum
          FieldName = 'UNITSREQUIRED'
          Column = DBTVInvoicesUNITSREQUIRED
        end
        item
          Format = '$,0.00;-$,0.00'
          Kind = skAverage
          FieldName = 'AVERAGERATE'
          Column = DBTVInvoicesAVERAGERATE
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = DBTVInvoicesDataControllerSummaryAfterSummary
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsData.Appending = True
      OptionsData.Inserting = False
      OptionsSelection.MultiSelect = True
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Preview.MaxLineCount = 0
      object DBTVInvoicesINV_DATE: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'INV_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 69
      end
      object DBTVInvoicesQUOTE_NUMBER: TcxGridDBColumn
        Caption = 'Group ID'
        DataBinding.FieldName = 'QUOTE_NUMBER'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownAutoSize = True
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'QUOTE_NUMBER'
        Properties.ListColumns = <
          item
            FieldName = 'QUOTE_NUMBER'
          end
          item
            FieldName = 'CUSTOMERNAME'
          end>
        Properties.ListOptions.CaseInsensitive = True
        Properties.ListOptions.ShowHeader = False
        Properties.ListSource = DataModuleClient.DSQuotesLU
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 86
      end
      object DBTVInvoicesINVOICE_NUMBER: TcxGridDBColumn
        Caption = 'Invoice No'
        DataBinding.FieldName = 'INVOICE_NUMBER'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 75
      end
      object DBTVInvoicesNETSALES: TcxGridDBColumn
        Caption = 'Net Sales'
        DataBinding.FieldName = 'NETSALES'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 88
      end
      object DBTVInvoicesMATERIALSATCOST: TcxGridDBColumn
        Caption = 'Materials at Cost'
        DataBinding.FieldName = 'MATERIALSATCOST'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 89
      end
      object DBTVInvoicesSUBCONTRACTORS: TcxGridDBColumn
        Caption = 'Sub - Contractors'
        DataBinding.FieldName = 'SUBCONTRACTORS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 85
      end
      object DBTVInvoicesGROSSPROFIT: TcxGridDBColumn
        Caption = 'Gross Profit'
        DataBinding.FieldName = 'GROSSPROFIT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 87
      end
      object DBTVInvoicesGPPC: TcxGridDBColumn
        Caption = 'Gross Profit %'
        DataBinding.FieldName = 'GPPC'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00 %;-,0.00 %'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 61
      end
      object DBTVInvoicesRECORDEDUNITS: TcxGridDBColumn
        Caption = 'TS Units'
        DataBinding.FieldName = 'RECORDEDUNITS'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
      end
      object DBTVInvoicesUNITSREQUIRED: TcxGridDBColumn
        Caption = 'Targeted units'
        DataBinding.FieldName = 'UNITSREQUIRED'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 74
      end
      object DBTVInvoicesAVERAGERATE: TcxGridDBColumn
        Caption = 'GP per Unit'
        DataBinding.FieldName = 'AVERAGERATE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DisplayFormat = ',0.00;-,0.00'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 68
      end
      object DBTVInvoicesORDERCOMPLETE: TcxGridDBColumn
        Caption = 'Last Invoice ?'
        DataBinding.FieldName = 'ORDERCOMPLETE'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.Alignment = taCenter
        Properties.ReadOnly = False
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 60
      end
      object DBTVInvoicesUNITSTORUN: TcxGridDBColumn
        Caption = 'Units to Run'
        DataBinding.FieldName = 'UNITSTORUN'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.ReadOnly = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 63
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = DBTVInvoices
    end
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 112
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Invoices for the Period'
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
    Height = 25
    Width = 145
  end
  object InvPeriod: TcxLabel
    Left = 153
    Top = 112
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Invoices for the Period'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 23
    Width = 281
  end
  object CloseBtn: TcxButton
    Left = 904
    Top = 680
    Width = 105
    Height = 41
    Caption = '&Close'
    TabOrder = 3
    OnClick = CloseBtnClick
  end
  object PrintBtn: TcxButton
    Left = 264
    Top = 680
    Width = 113
    Height = 41
    Caption = '&Print Invoices'
    OptionsImage.Glyph.Data = {
      36020000424D360200000000000076000000280000001C0000001C0000000100
      040000000000C001000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDD866666
      6666666666DDDDDD0000DDDDD78FFFFFFFFFFFFFF67DDDDD0000DDDDD78FF888
      8888888FF67DDDDD0000DDDDD78FFFFFFFFFFFFFF67DDDDD0000DDDDD08FF888
      8888888FF60DDDDD0000DD77708FFFFFFFFFFFFFF60777DD0000D787708FF888
      8888888FF607777D0000D788808FFFFFFFFFFFFFF608877D0000D78880888888
      888888888608877D0000D78886666666666666666668877D0000D78886777777
      777777777768877D0000D78888888888888888888888877D0000D7FFFFFFFFFF
      FFFFFFFFFFF2277D0000D7FFFFFFFFFFFFFFFFFFFFF3277D0000D7FFFFFFFFFF
      FFFFFFFFFFFFF77D0000D78888777777777777777788887D0000D78888788888
      888888888788877D0000D788887FFFFFFFFFFFFFF788877D0000D78888777777
      777777777788887D0000DD77708FFFFFFFFFFFFFF60777DD0000DDDDD08FFFFF
      FFFFFFFFF60DDDDD0000DDDDD78FFFFFFFFFFFFFF67DDDDD0000DDDDD78FFFFF
      FFFFFFFFF67DDDDD0000DDDDD78FFFFFFFFFFFFFF67DDDDD0000DDDDD78FFFFF
      FFFFFFFFF67DDDDD0000DDDDDD8FFFFFFFFFFFFFF6DDDDDD0000DDDDDD8FFFFF
      FFFFFFFFF6DDDDDD0000DDDDDD8888888888888888DDDDDD0000}
    TabOrder = 4
    OnClick = PrintBtnClick
  end
  object DeleteBtn: TcxButton
    Left = 136
    Top = 680
    Width = 121
    Height = 41
    Caption = '&Delete Invoice'
    TabOrder = 5
    OnClick = DeleteBtnClick
  end
  object QuoteBtn: TcxButton
    Left = 8
    Top = 680
    Width = 121
    Height = 41
    Caption = '&New'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFCCB7A8694731694731694731694731694731694731694731694731
      6947316947316947316947316947316947316947316947316947316947316947
      31694731694731694731694731694731694731FF00FFFF00FFCCB7A8FCF9F9B7
      A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293
      B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2
      93B7A293694731FF00FFFF00FFCCB7A8FDFCFCFCF9F9FAF6F6F8F4F2F6F1EFF4
      EEECF2ECE8CCB7A8EEE6E2EDE4DFEBE1DCEADED9E8DBD6E6D9D2E4D6CFCCB7A8
      E0D1C8DECEC5DCCBC2DBC9BFDBC9BFDBC9BFDBC9BFB7A293694731FF00FFFF00
      FFCCB7A8FFFFFFFDFCFCFCF9F9FAF6F6F8F4F2F6F1EFF4EEECCCB7A8F0E9E5EE
      E6E2EDE4DFEBE1DCEADED9E8DBD6E6D9D2CCB7A8E2D3CCE0D1C8DECEC5DCCBC2
      DBC9BFDBC9BFDBC9BFB7A293694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFEFD
      FEFDFBFBFBF8F7F8F4F2F6F1EFCCB7A8F2ECE8F0E9E5EEE6E2EDE4DFEBE1DCEA
      DED9E8DBD6CCB7A8E4D6CFE2D3CCE0D1C8DECEC5DCCBC2DBC9BFDBC9BFB7A293
      694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFFFFFFFEFDFEFDFBFBFBF8F7F9F5
      F4CCB7A8F5F0EDF3EDEAF1EAE7EEE6E2EDE4DFEBE1DCEADED9CCB7A8E6D9D2E4
      D6CFE2D3CCE0D1C8DECEC5DCCBC2DBC9BFB7A293694731FF00FFFF00FFCCB7A8
      CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7
      A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CC
      B7A8CCB7A8B7A293694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFEFDFEFDFBFBCCB7A8F9F5F4F7F2F1F5F0EDF3EDEAF1EAE7EFE8E3EDE5
      E0CCB7A8EBE0DBE9DDD7E7DAD4E5D7D1E3D5CDE1D2CADFCFC7B7A293694731FF
      00FFFF00FFCCB7A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFDFECCB7A8
      FBF8F7F9F5F4F7F2F1F5F0EDF3EDEAF1EAE7EFE8E3CCB7A8ECE2DEEBE0DBE9DD
      D7E7DAD4E5D7D1E3D5CDE1D2CAB7A293694731FF00FFFF00FFCCB7A8FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCCB7A8FDFBFBFBF8F7F9F5F4F7F2F1
      F5F0EDF3EDEAF1EAE7CCB7A8EDE5E0ECE2DEEBE0DBE9DDD7E7DAD4E5D7D1E3D5
      CDB7A293694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFCCB7A8FEFDFEFDFBFBFBF8F7F9F5F4F7F2F1F5F0EDF3EDEACCB7A8
      EFE8E3EDE5E0ECE2DEEBE0DBE9DDD7E7DAD4E5D7D1B7A293694731FF00FFFF00
      FFCCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CC
      B7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8CCB7A8
      CCB7A8CCB7A8CCB7A8B7A293694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFCCB7A8FFFFFFFFFFFFFFFFFFFDFCFCFCF9F9FA
      F6F6F8F4F2CCB7A8F4EEECF2ECE8F0E9E5EDE5E0ECE2DEEBE0DBE9DDD7B7A293
      694731FF00FFFF00FFCCB7A8FFFFFFFFFFFFFFFFFFFFFFFF00C8F800A6FFFFFF
      FFCCB7A8FFFFFFFFFFFFFFFFFFFFFFFFFDFCFCFCF9F9FAF6F6CCB7A8F6F1EFF4
      EEECF2ECE8F0E9E5EEE6E2EDE4DFEBE1DCB7A293694731FF00FFFF00FFCCB7A8
      00C8F800A6FFFFFFFFFFFFFF00C8F800A6FFFFFFFFCCB7A800A6FF00C8F8FFFF
      FFFFFFFFFFFFFFFDFCFCFCF9F9CCB7A8F8F4F2F6F1EFF4EEECF2ECE8F0E9E5EE
      E6E2EDE4DFB7A293694731FF00FFFF00FFCCB7A8FFFFFF00C8F800A6FF9AEBF9
      00C8F800A6FF9AEBF900A6FF00C8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
      FCCCB7A8FAF6F6F8F4F2F6F1EFF4EEECF2ECE8F0E9E5EEE6E2B7A293694731FF
      00FFFF00FFD08000CD76219AEBF900C8F89AEBF900A6FF00A6FF00A6FF00C8F8
      9AEBF9CD7621CD7621CD7621CD7621CD7621CD7621CD7621CD7621CD7621CD76
      21CD7621CD7621CD7621CD7621CD7621CD7621FF00FFFF00FFD08000FBC39FFB
      C39F9AEBF99AEBF900F8F800F8F89AEBF99AEBF9FAB890FAB288F9AC80F8A679
      F8A071F79A69F79462F78E5AF68751F58149F57A41F47439F46E31F46B2DF46B
      2DF46B2DCD7621FF00FFFF00FF00A6FF00A6FF00A6FF00A6FF00F8F8FFFFFFFF
      FFFF00F8F800A6FF00A6FF00A6FF00A6FFF9AC80F8A679F8A071F79A69F79462
      F78E5AF68751F58149F57A41F47439F46E31F46B2DF46B2DCD7621FF00FFFF00
      FF00C8F800C8F800C8F800A6FF00F8F89AEBF9FFFFFF00F8F800C8F800C8F800
      C8F800C8F8FAB288F9AC80F8A679F8A071F79A69F79462F78E5AF68751F58149
      F57A41F47439F46E31F46B2DCD7621FF00FFFF00FFD08000FBC39FFBC39F9AEB
      F99AEBF900F8F800F8F89AEBF99AEBF9FBC39FFBC39FFBBE97FAB890FAB288F9
      AC80F8A679F8A071F79A69F79462F78E5AF68751F58149F57A41F47439F46E31
      CD7621FF00FFFF00FFD08000D080009AEBF900A6FF00C8F800C8F800A6FF00C8
      F800A6FF9AEBF9CD7621CD7621CD7621CD7621CD7621CD7621CD7621CD7621CD
      7621CD7621CD7621CD7621CD7621CD7621CD7621CD7621FF00FFFF00FFFF00FF
      FF00FF00A6FF00C8F89AEBF900C8F800A6FF9AEBF900C8F800A6FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00A6FF00C8F8FF00FFFF00FF
      00C8F800A6FFFF00FFFF00FF00C8F800A6FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00C8F800A6FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 6
    OnClick = QuoteBtnClick
  end
  object cxLabel3: TcxLabel
    Left = 440
    Top = 96
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'TARI for the Period'
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
    Height = 25
    Width = 129
  end
  object TariAmount: TcxLabel
    Left = 575
    Top = 89
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 32
    Width = 113
  end
  object UnitsTarget: TcxLabel
    Left = 576
    Top = 120
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 25
    Width = 121
  end
  object TargetUnitsLbl: TcxLabel
    Left = 440
    Top = 120
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Target Units'
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
    Height = 25
    Width = 129
  end
  object TargetGPLbl: TcxLabel
    Left = 880
    Top = 96
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 25
    Width = 113
  end
  object cxLabel5: TcxLabel
    Left = 744
    Top = 96
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Target Gross Profit'
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
    Height = 25
    Width = 145
  end
  object cxLabel4: TcxLabel
    Left = 392
    Top = 680
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'Please refer to the Key Indicator Report in Tracking Reports for' +
      ' comparison to targets.'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 41
    Width = 367
  end
  object cxDBLabel4: TcxDBLabel
    Left = 248
    Top = 8
    DataBinding.DataField = 'BRANCH_NAME'
    DataBinding.DataSource = DataModuleClient.DSBusinesses
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 29
    Width = 511
    AnchorY = 23
  end
  object cxLabel14: TcxLabel
    Left = 16
    Top = 53
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Department / Revenue Group'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 208
  end
  object cxDBLabel3: TcxDBLabel
    Left = 248
    Top = 48
    DataBinding.DataField = 'REVENUE_GROUP_NAME'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 33
    Width = 511
    AnchorY = 65
  end
  object cxLabel15: TcxLabel
    Left = 16
    Top = 12
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Business / Branch'
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
    Width = 124
  end
end
