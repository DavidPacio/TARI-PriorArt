object CashFlowJrnlsF: TCashFlowJrnlsF
  Left = 532
  Top = 216
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Cash Flow Journals'
  ClientHeight = 726
  ClientWidth = 781
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object CloseBtn: TcxButton
    Left = 632
    Top = 664
    Width = 131
    Height = 41
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 0
    OnClick = CloseBtnClick
  end
  object cxGrid1: TcxGrid
    Left = 16
    Top = 104
    Width = 745
    Height = 337
    TabOrder = 1
    OnExit = cxGrid1Exit
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object cxTVJournals: TcxGridDBTableView
      Navigator.Buttons.First.Hint = 'First'
      Navigator.Buttons.PriorPage.Enabled = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Hint = 'Prior'
      Navigator.Buttons.Next.Hint = 'Next'
      Navigator.Buttons.NextPage.Enabled = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Hint = 'Last'
      Navigator.Buttons.Insert.Hint = 'Append'
      Navigator.Buttons.Delete.Hint = 'Delete'
      Navigator.Buttons.Edit.Enabled = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Hint = 'Post'
      Navigator.Buttons.Cancel.Hint = 'Cancel'
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      Navigator.Visible = True
      DataController.DataSource = DataModuleClient.DSJournals
      DataController.Options = [dcoAnsiSort, dcoCaseInsensitive, dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsBehavior.PullFocusing = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.DataRowSizing = True
      OptionsData.Appending = True
      OptionsSelection.MultiSelect = True
      OptionsView.CellEndEllipsis = True
      OptionsView.ShowEditButtons = gsebForFocusedRecord
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      object cxTVJournalsDEPT_ID: TcxGridDBColumn
        DataBinding.FieldName = 'DEPT_ID'
        Visible = False
      end
      object cxTVJournalsJNL_NO: TcxGridDBColumn
        DataBinding.FieldName = 'JNL_NO'
        Visible = False
      end
      object cxTVJournalsJNL_DATE: TcxGridDBColumn
        Caption = 'Date'
        DataBinding.FieldName = 'JNL_DATE'
        PropertiesClassName = 'TcxDateEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.Alignment.Vert = taVCenter
        Properties.DateButtons = []
        Properties.ImmediatePost = True
        Properties.ReadOnly = False
        Properties.SaveTime = False
        Properties.ShowTime = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 127
      end
      object cxTVJournalsJNL_NOTE: TcxGridDBColumn
        Caption = 'Notes'
        DataBinding.FieldName = 'JNL_NOTE'
        PropertiesClassName = 'TcxMemoProperties'
        Properties.AutoSelect = True
        Properties.ScrollBars = ssVertical
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebAlways
        Options.Grouping = False
        SortIndex = 0
        SortOrder = soAscending
        Width = 581
      end
      object cxTVJournalsNON_CASH: TcxGridDBColumn
        Caption = 'Non Cash ?'
        DataBinding.FieldName = 'NON_CASH'
        PropertiesClassName = 'TcxCheckBoxProperties'
        Properties.DisplayChecked = '1'
        Properties.DisplayUnchecked = '0'
        Properties.DisplayGrayed = '0'
        Properties.ImmediatePost = True
        Properties.NullStyle = nssInactive
        Properties.ReadOnly = False
        Properties.ValueChecked = 1
        Properties.ValueUnchecked = 0
        Visible = False
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Width = 113
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxTVJournals
    end
  end
  object EasyJournalCB: TcxComboBox
    Left = 224
    Top = 680
    Properties.OnCloseUp = EasyJournalCBPropertiesCloseUp
    TabOrder = 2
    Width = 321
  end
  object JrnlEntriesGrid: TcxGrid
    Left = 16
    Top = 488
    Width = 745
    Height = 169
    TabOrder = 3
    OnEnter = JrnlEntriesGridEnter
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object JrnlEntriesGridDBTVJrnlEntries: TcxGridDBTableView
      Navigator.Buttons.Refresh.Enabled = False
      Navigator.Buttons.Refresh.Visible = False
      Navigator.Buttons.SaveBookmark.Enabled = False
      Navigator.Buttons.SaveBookmark.Visible = False
      Navigator.Buttons.GotoBookmark.Enabled = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Enabled = False
      Navigator.Buttons.Filter.Visible = False
      DataController.DataModeController.DetailInSQLMode = True
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataModuleClient.DSJournalEntries
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = ',0;(,0)'
          Kind = skSum
          FieldName = 'DR_AMOUNT'
          Column = JrnlEntriesGridDBTVJrnlEntriesDR_AMOUNT
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          FieldName = 'CR_AMOUNT'
          Column = JrnlEntriesGridDBTVJrnlEntriesCR_AMOUNT
        end>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Appending = True
      OptionsData.Inserting = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.HeaderEndEllipsis = True
      OptionsView.Indicator = True
      Preview.AutoHeight = False
      object JrnlEntriesGridDBTVJrnlEntriesJNL_NO: TcxGridDBColumn
        DataBinding.FieldName = 'JNL_NO'
        Visible = False
      end
      object JrnlEntriesGridDBTVJrnlEntriesJNL_INDEX: TcxGridDBColumn
        DataBinding.FieldName = 'JNL_INDEX'
        Visible = False
      end
      object JrnlEntriesGridDBTVJrnlEntriesACCOUNT_NO: TcxGridDBColumn
        Caption = 'Account'
        DataBinding.FieldName = 'ACCOUNT_NO'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.KeyFieldNames = 'ACCOUNT_NUMBER'
        Properties.ListColumns = <
          item
            FieldName = 'ACCOUNT_TITLE'
          end>
        Properties.ListSource = DataModuleClient.DSBSAccounts
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 200
        Options.Sorting = False
        Width = 200
      end
      object JrnlEntriesGridDBTVJrnlEntriesDR_AMOUNT: TcxGridDBColumn
        Caption = 'Dr Amount (Application)'
        DataBinding.FieldName = 'DR_AMOUNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Sorting = False
        Width = 120
      end
      object JrnlEntriesGridDBTVJrnlEntriesCR_AMOUNT: TcxGridDBColumn
        Caption = 'Cr Amount (Source)'
        DataBinding.FieldName = 'CR_AMOUNT'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 120
        Options.Filtering = False
        Options.IncSearch = False
        Options.Sorting = False
        Width = 122
      end
      object JrnlEntriesGridDBTVJrnlEntriesLINE_NOTE: TcxGridDBColumn
        Caption = 'Note'
        DataBinding.FieldName = 'LINE_NOTE'
        PropertiesClassName = 'TcxTextEditProperties'
        FooterAlignmentHorz = taCenter
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 270
        Width = 270
      end
    end
    object GLJournals: TcxGridLevel
      GridView = JrnlEntriesGridDBTVJrnlEntries
    end
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 680
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Easy Journal Selection'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 33
    Width = 201
  end
  object cxDBLabel1: TcxDBLabel
    Left = 320
    Top = 72
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    DataBinding.DataField = 'CURRENTPLANSTART'
    DataBinding.DataSource = DataModuleClient.DSDepartments
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
    Width = 121
  end
  object cxDBLabel2: TcxDBLabel
    Left = 464
    Top = 72
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    DataBinding.DataField = 'CURRENTPLANEND'
    DataBinding.DataSource = DataModuleClient.DSDepartments
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
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 176
    Top = 72
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Targeting Period:'
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
    Height = 25
    Width = 145
  end
  object cxLabel3: TcxLabel
    Left = 440
    Top = 72
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'to'
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
    Height = 25
    Width = 25
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 72
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Journal Header'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 107
  end
  object cxLabel5: TcxLabel
    Left = 16
    Top = 464
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Journal Lines'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Width = 92
  end
  object cxButton2: TcxButton
    Left = 608
    Top = 56
    Width = 155
    Height = 41
    Caption = 'Delete'#13#10'Journal'
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
    TabOrder = 11
    OnClick = cxButton2Click
  end
  object cxLabel6: TcxLabel
    Left = 16
    Top = 11
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Business Centre / Branch:'
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
    Height = 33
    Width = 186
  end
  object cxDBLabel3: TcxDBLabel
    Left = 208
    Top = 8
    DataBinding.DataField = 'BRANCH_NAME'
    DataBinding.DataSource = DataModuleClient.DSBusinesses
    ParentFont = False
    Properties.Alignment.Horz = taLeftJustify
    Properties.Alignment.Vert = taVCenter
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHighlight
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
    Width = 553
    AnchorY = 23
  end
end
