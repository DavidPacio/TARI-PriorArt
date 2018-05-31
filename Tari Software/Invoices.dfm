object InvoicesF: TInvoicesF
  Left = 524
  Top = 323
  HelpContext = 1013
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Invoice Details'
  ClientHeight = 726
  ClientWidth = 1012
  Color = clBtnHighlight
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cxGrid1: TcxGrid
    Left = 8
    Top = 80
    Width = 993
    Height = 561
    TabOrder = 0
    object cxTvInvoices: TcxGridTableView
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Enabled = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.Cancel.Enabled = False
      Navigator.Buttons.Cancel.Visible = False
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = '$,0;-$,0'
          Kind = skSum
          Column = cxTvInvoicesGROSSREVENUE
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          Column = cxTvInvoicesMATERIALSCOST
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          Column = cxTvInvoicesSUB_COST
        end
        item
          Format = '$,0;-$,0'
          Kind = skSum
          Column = cxTvInvoicesGROSSPROFIT
        end
        item
          Format = '0.00 %;-0.00 %'
          Kind = skAverage
          Column = cxTvInvoicesGPPC
        end
        item
          Format = '0.00;(0.00)'
          Kind = skSum
          Column = cxTvInvoicesNUMUNITS
        end
        item
          Format = '$,0.00;-$,0.00'
          Kind = skMax
          Column = cxTvInvoicesAVERATE
        end>
      DataController.Summary.SummaryGroups = <
        item
          Links = <
            item
              Column = cxTvInvoicesAVERATE
            end>
          SummaryItems = <>
        end>
      DataController.Summary.OnAfterSummary = cxTvInvoicesDataControllerSummaryAfterSummary
      NewItemRow.InfoText = 'Enter new invoice here'
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.NavigatorHints = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsData.Appending = True
      OptionsData.Inserting = False
      OptionsView.NavigatorOffset = 20
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      OptionsView.IndicatorWidth = 15
      Styles.Header = cxStyle1
      object cxTvInvoicesINVNUMBER: TcxGridColumn
        Tag = 1
        Caption = 'Invoice Number'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 88
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 130
      end
      object cxTvInvoicesGROSSREVENUE: TcxGridColumn
        Tag = 2
        Caption = 'Net Sales'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 93
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 119
      end
      object cxTvInvoicesMATERIALSCOST: TcxGridColumn
        Tag = 3
        Caption = 'Materials at Cost'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 96
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 120
      end
      object cxTvInvoicesSUB_COST: TcxGridColumn
        Tag = 4
        Caption = 'Subcontractors at Cost'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 112
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 137
      end
      object cxTvInvoicesGROSSPROFIT: TcxGridColumn
        Tag = 5
        Caption = 'Gross Profit'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;-,0'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 93
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 109
      end
      object cxTvInvoicesGPPC: TcxGridColumn
        Tag = 6
        Caption = 'GP %'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '0.00;-0.00'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 69
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 80
      end
      object cxTvInvoicesNUMUNITS: TcxGridColumn
        Tag = 7
        Caption = 'Hours Billed'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 128
      end
      object cxTvInvoicesAVERATE: TcxGridColumn
        Tag = 8
        Caption = 'GP per Hour'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = ',0.00;-,0.00'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 94
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 126
      end
    end
    object cxGLInvoices: TcxGridLevel
      GridView = cxTvInvoices
    end
  end
  object DeleteBtn: TcxButton
    Left = 8
    Top = 664
    Width = 145
    Height = 41
    Caption = 'Delete Invoice'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF636BC20308A2
      636BC2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF3338B2000FB70008AA0D11A6FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF343AB600
      1BCF0018C8000FB70008AA353AB2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF2F32ACFF00FFFF00FFFF00FF4350C51A30D60020DA001BCF0018C8000AAE01
      08A8636BC2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF636BC22F32AC0010B82C30ABFF00FFFF00
      FF2B33BB2443EE142DD80020DA001BCF000FB7000AAE0A10A7FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      2F32AC000FB70020DA2B3ED52D30ACFF00FFFF00FF2B33BB2D50FF2443EE0020
      DA0020DA0018C8000FB7010BAE2F34B1FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF636BC22F32AC000FB70020DA2B3ED52528A8
      FF00FFFF00FFFF00FF4350C52746F12C4FFF2443EE0020DA001BCF0018C8000C
      B2010BAC636BC2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2F
      32AC0010B8000FB70020DA2B3ED52225A8FF00FFFF00FFFF00FFFF00FFFF00FF
      4350C56F85FE3A5AFE1D34D80020DA001BCF000FB7000DB2030BAC636BC2FF00
      FFFF00FFFF00FFFF00FFFF00FF636BC22F32AC000FB70018C80020DA2B3ED51F
      22A6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B3BC86F85FE4C68FB
      0020DA0020DA0018C8000FB7000DB20810AB636BC2FF00FFFF00FFFF00FF3236
      AF0010B8000FB70018C80020DA2B3ED51B1DA4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF2B3CD06F85FE4A60ED0020DA001BCF0018C8
      000FB7010EB31117AA636BC2636BC2090DA30004A2000FB70018C80020DA2B3E
      D51315A0FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF3242CD6F85FE2F42D90020DA001BCF0018C8000FB6000DB3090FA8
      0109A90008A9000FB70018C80020DA2B3ED51315A0FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF303AC56F
      85FE0020DA0020DA0018C80018C8000FB6000DB3000BB00018C80020DA0020DA
      2B3ED50F11A3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2B33BB4C5DE10018C80018C800
      18C80018C8000FB7000DB3000BB00018C82B3ED50C10A5FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF252DB4051BC90018C80018C80018C80011BA000FB700
      0DB4000CB00018C8FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0A19
      BB0019CC0017C80016C50014C10013BE0011BA000FB7010DB15D65BFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF1221BD001DD3001BCF0019CC0018C80016
      C50014C20013BE0011BB000FB7050EAEFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      1C2ABE0020DA001FD6001DD3001BCF0019CC0018C80016C50015C20013BE0011
      BB000FB80C13AEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF2836BF0023E00022DD0020DA001FD7
      001DD3001BD02443EE6F85FE0920CD2B3ED50020DA0018C8000FB81219AEFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF3542C00127E50026E50024E10022DE0021DA001FD72443EE6F85FE3C49C5
      2032CE3A5AFE2B3ED50020DA0018C80010B8181FAFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4552C30129E80029EC0028E800
      26E50024E10325DF2443EE6F85FE3844C2FF00FFFF00FF2032CE3A5AFE2F4DF0
      0020DA0018C80010B8141BADFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF4552C3012AEB002DF3002BF0002AEC0028E90F33EA2443EE6F85FE39
      45C3FF00FFFF00FFFF00FFFF00FF2032CE3A5AFE2F4DF00020DA0018C80010B9
      0C14AFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4552C30227E10030F8002F
      F7002DF3012CF00F33EA2443EE6F85FE3845C3FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF2032CE2032CE2F4DF02B3ED50018C80010B9060FAFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF1B2EC63C5CFE002FF70733F70F33EA2443EE6F85
      FE3C49C6FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF20
      32CE3A5AFE2B3ED50018C80010B9020DB0FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF0A22CD3C5CFE0F33EA2443EE6F85FE3C49C6FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2032CE2032CE2B3ED500
      18C80010B9010DB1FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4552C33C5CFE
      4763F63746C5FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FF2032CE2032CE2F32AC0514B8242AB0FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF4552C34552C3FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF2032CE2F32ACFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 1
    OnClick = DeleteBtnClick
  end
  object PrintBtn: TcxButton
    Left = 296
    Top = 664
    Width = 145
    Height = 41
    Caption = 'Print Invoices'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000630B0000630B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFC6B1A26947316947316947316947316947316947
      31694731694731694731694731694731694731694731694731694731FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7A
      C6B1A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF6947317A7A7AFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF636363C6B1A2FFFFFFFFFFFFD2B9AB
      D2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABFFFFFFFFFF
      FF694731636363FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF4D4D4DC6B1A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFDFD6947314D4D4DFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF2C2C2CC6B1A2FF
      FFFFFFFFFFD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9AB
      D2B9ABFFFFFFFFFFFF6947312C2C2CFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF86624D86624D86624D131313C6B1A2FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF694731
      13131386624D86624D86624DFF00FFFF00FFFF00FFA08C7DBAA698A08C7DA08C
      7D131313C6B1A2FFFFFFFFFFFFD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2B9ABD2
      B9ABD2B9ABD2B9ABD2B9ABFFFFFFFFFFFF694731131313A08C7DA08C7DA08C7D
      86624DFF00FFFF00FFA08C7DBAA698BAA698BAA698131313C6B1A2FFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFF694731131313BAA698BAA698A08C7D86624DFF00FFFF00FFA08C7D
      C5B4A8C5B4A8C5B4A8131313C6B1A2DBC9BFDBC9BFDBC9BFDBC9BFDBC9BFDBC9
      BFDBC9BFDBC9BFDBC9BFDBC9BFDBC9BFDBC9BFDBC9BFDBC9BF694731131313C5
      B4A8C5B4A8A08C7D86624DFF00FFFF00FFA08C7DD1C3B9D1C3B9D1C3B9694731
      6947316947316947316947316947316947316947316947316947316947316947
      31694731694731694731694731694731694731D1C3B9D1C3B9A08C7D86624DFF
      00FFFF00FFA08C7DDBD0C9DBD0C9DBD0C96947316A6A6A6A6A6A6A6A6A6A6A6A
      6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A6A
      6A6A6A6A694731DBD0C9DBD0C9A08C7D86624DFF00FFFF00FFA08C7DE6DED9E6
      DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9
      E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DED9E6DE
      D9A08C7D86624DFF00FFFF00FFA08C7DF1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1
      ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9
      F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9009800009000A08C7D86624DFF00FFFF00
      FFA08C7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFF30C860009800A08C7D86624DFF00FFFF00FFA08C7DFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA08C7D
      86624DFF00FFFF00FFA08C7DCCBDB3B7A293B7A293B7A293A08C7D86624D8662
      4D86624D86624D86624D86624D86624D86624D86624D86624D86624D86624D86
      624D86624D86624DB7A293B7A293B7A293CCBDB386624DFF00FFFF00FFA08C7D
      E4DBD6E4DBD6E4DBD6E4DBD6A08C7DC5B4A8C5B4A8C5B4A8C5B4A8C5B4A8C5B4
      A8C5B4A8C5B4A8C5B4A8C5B4A8C5B4A8C5B4A8C5B4A8C5B4A886624DE4DBD6E4
      DBD6E4DBD6A08C7D86624DFF00FFFF00FFA08C7DCCBDB3CCBDB3CCBDB3CCBDB3
      A08C7DF1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1ECE9F1EC
      E9F1ECE9F1ECE9F1ECE9F1ECE986624DCCBDB3CCBDB3CCBDB3A08C7D86624DFF
      00FFFF00FFA08C7DB7A293B7A293B7A293B7A293A08C7DA08C7DA08C7DA08C7D
      A08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C7DA08C
      7DA08C7DB7A293B7A293B7A293B7A29386624DFF00FFFF00FFFF00FFA08C7DA0
      8C7DA08C7D131313D0BBACFFFFFFFFFFFFFFFFFFFFFFFFFDFCFBFBF9F8F9F6F4
      F7F3F1F6F1EFF4EEEBF2EBE8F0E8E4EEE5E0ECE3DD694731131313A08C7DA08C
      7DA08C7DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF131313D0BBACFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAFAF7F6F8F4F2F6F1EFF4EEEB
      F2EBE8F0E8E4EEE5E0694731131313FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF464646D0BBACFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFEFEFDFCFBFAFAF7F6F8F4F2F6F1EFF4EEEBF2EBE8F0E8E4694731
      464646FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FF7A7A7AD0BBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFC
      FBFAFAF7F6F8F4F2F6F1EFF4EEEBF2EBE86947317A7A7AFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7A7A7AD0BBACFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAFAF7F6F8F4F2F6
      F1EFF4EEEB6947317A7A7AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FF7A7A7AD0BBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAFAF7F6F8F4F2F6F1EF6947317A7A7AFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      D0BBACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFEFEFDFCFBFAFAF7F6F8F4F2694731FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD0BBACFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFCFBFAFAF7
      F6694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFD0BBACD0BBACD0BBACD0BBACD0BBACD0BBACD0BBACD0BBAC
      D0BBACD0BBACD0BBACD0BBACD0BBACD0BBACD0BBACD0BBACFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 2
    OnClick = PrintBtnClick
  end
  object CloseBtn: TcxButton
    Left = 848
    Top = 664
    Width = 145
    Height = 41
    Caption = 'Close'
    TabOrder = 3
    OnClick = CloseBtnClick
  end
  object PeriodDateslabel: TcxLabel
    Left = 152
    Top = 56
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 241
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 56
    Caption = 'Invoices for the Period'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel14: TcxLabel
    Left = 8
    Top = 13
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
    Left = 240
    Top = 8
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
    AnchorY = 25
  end
  object cxStyleRepository1: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svFont]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Calibri'
      Font.Style = []
    end
  end
end
