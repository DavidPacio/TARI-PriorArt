object BSWhatifF: TBSWhatifF
  Left = 522
  Top = 334
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'TARI for Business - Balance Sheet Opening Balances'
  ClientHeight = 671
  ClientWidth = 812
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
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object cxLabel10: TcxLabel
    Left = 464
    Top = 80
    AutoSize = False
    Caption = 
      '1. Enter an Opening Balance for each item in the grid.'#13#10#13#10'2. Adj' +
      'ust the Average Days Outstanding or Stock Turns on the working c' +
      'apital accounts below to target an improvement in net position o' +
      'r a targeted closing balance.'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Properties.WordWrap = True
    Transparent = True
    Height = 105
    Width = 329
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 52
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Balance Sheet'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelExtraLarge
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Properties.WordWrap = True
    Transparent = True
    Height = 29
    Width = 217
  end
  object AssumptionsBtn: TcxButton
    Left = 8
    Top = 616
    Width = 129
    Height = 41
    Caption = 'Assumptions'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000830B0000830B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF006890006890FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF8E40198E40198E40198E4019BEA2A1D6B8B7A87F7C8E40198E4019
      8E40198E40198E40198E40198E40198E40198E40190068900098C80098C82B25
      208E40198E40198E40198E40198E40198E4019FF00FFFF00FF8E4018A24E00A2
      4E00A24E00BEA2A1D6B8B7A87F7CA24E00A24E00A24E00A24E00A24E00A24E00
      A24E00A24E00A24E0000689060C8F80098C82B2520A24E00A24E00A24E00A24E
      00A24E008E4019FF00FFFF00FFA2511BF9F6F4B7A293B7A293B7A293BEA2A1B7
      A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293006890
      60C8F80098C82B2520B7A293B7A293B7A293B7A293B7A293924218FF00FFFF00
      FFAE5919FAF8F6F9F6F4F7F3F1BEA2A1D6B8B7A87F7CF1EAE6EFE7E3EDE5E0EC
      E3DEEBE1DBE9DED7E7DBD4E5D9D1E3D6CE00689060C8F80098C82B2520DBC9BF
      DBC9BFDBC9BFDBC9BFB7A293964517FF00FFFF00FFB15A17FDFCFBFBF9F8F9F7
      F5BEA2A1D6B8B7A87F7CF2ECE8F1EAE6EFE7E3EDE5E0ECE3DEEBE1DBE9DED7E7
      DBD4E5D9D100689060C8F80098C82B2520DCCBC2DBC9BFDBC9BFDBC9BFB7A293
      9A4817FF00FFFF00FFB45C17FEFEFDFDFCFBFBF9F8BEA2A1D6B8B7A87F7CF5F0
      EDF3EDEAF1EBE7EFE7E3EDE5E0ECE3DEEBE1DBE9DED7E7DBD400689060C8F800
      98C82B2520DECEC5DCCBC2DBC9BFDBC9BFB7A2939E4B16FF00FFFF00FFB75E16
      FFFFFFFEFEFDFDFCFBBEA2A1D6B8B7A87F7CF6F2EFF5F0EDF3EDEAF1EBE7F0E8
      E4EEE6E1EDE4DFEBE2DCE9DED700689060C8F80098C82B2520E0D1C8DECEC5DC
      CBC2DBC9BFB7A293A24E15FF00FFFF00FFB96016FFFFFFFFFFFFFEFEFDBEA2A1
      D6B8B7A87F7CF8F4F2F6F2EFF5F0EDF3EDEAF1EBE7F0E8E4EEE6E1EDE4DFEBE2
      DC00689060C8F80098C82B2520E3D5CDE0D1C8DECEC5DCCBC2B7A293A85214FF
      00FFFF00FFBC6215FFFFFFFFFFFFFFFFFFBEA2A1D6B8B7A87F7CF9F7F5F8F4F2
      F6F2EFF5F0EDF3EDEAF1EBE7F0E8E4EEE6E1EDE4DF00689060C8F80098C82B25
      20E4D7D0E3D5CDE1D2C9DFCFC6B7A293AC5514FF00FFFF00FFBF6415FFFFFFFF
      FFFF00C8F84878F84878F84878F84878F8F9F7F5F8F4F2F6F2EFF5F0EDF3EDEA
      F1EBE7F0E8E4EEE6E100689060C8F80098C82B2520E6DAD3E4D7D0E3D5CDE1D2
      C9B7A293AC5513FF00FFFF00FFC06614FFFFFFFFFFFF00C8F808F3FF41E1FF00
      CCFF4878F8FBF9F8F9F7F5F8F4F2F6F2EFF5F0EDF3EDEAF1EBE7F0E8E4006890
      60C8F80098C82B2520E8DDD6E6DAD3E4D7D0E3D5CDB7A293AD5612FF00FFFF00
      FFC36814FFFFFFFFFFFFFFFFFF00C8F800C8F84878F8FFFFFFFDFDFCFCFAF9FA
      F8F6F9F6F4F6F2EFF5F0EDF3EDEAF1EBE700689060C8F80098C82B2520EADFD9
      E8DDD6E6DAD3E4D7D0B7A293AE5612FF00FFFF00FFC66A13FFFFFFFFFFFF00C8
      F800CCFF41E1FF00CCFF4878F8FFFFFFFDFDFCFCFAF9FAF8F6F9F6F4F7F3F1F5
      F1EEF4EEEB00689060C8F80098C82B2520EBE2DCEADFD9E8DDD6E6DAD3B7A293
      AF5712FF00FFFF00FFC96C13FFFFFFFFFFFF00C8F808F3FF41E1FF00CCFF4878
      F8FFFFFFFFFFFFFDFDFCFCFAF9FAF8F6F9F6F4F7F3F1F5F1EE00689060C8F800
      98C82B2520EDE5E0ECE3DEEBE1DBE8DDD6666766B05812FF00FFFF00FFCB6D12
      FFFFFFFFFFFF00C8F808F3FF41E1FF00CCFF4878F8FFFFFFFFFFFFFFFFFFFDFD
      FCFCFAF9FAF8F6F9F6F4F7F3F1006890006890006890006890EFE7E3EDE5E0EC
      E3DE6667666B7373B15912FF00FFFF00FFCB6D12FFFFFFFFFFFF00C8F808F3FF
      41E1FF00CCFF4878F8FFFFFFFFFFFFFFFFFF6D7070727475787A78FAF8F6F9F6
      F4909293ADADAD9092936B6B6BF1EAE6EFE7E3484A478282846B7373B25911FF
      00FFFF00FFCB6D12FFFFFFFFFFFF00C8F808F3FF41E1FF00CCFF4878F8FFFFFF
      FFFFFF5D5E5CA5A5A57272726263615758575B5C5B5759564549454449483F43
      455355556F706E88898BA1A2A56B7373B35A11FF00FFFF00FFCB6D12FFFFFFFF
      FFFF00C8F808F3FF41E1FF00CCFF4878F8FFFFFFFFFFFF787878DDDDDD847B7B
      9696967D7D7D696A69797978898A889092938A8F928B9193A4A8A9B9BDC0C9CC
      D06B7373B45B11FF00FFFF00FFCB6D12FFFFFFFFFFFF00C8F808F3FF41E1FF00
      CCFF4878F8FFFFFFFFFFFF847B7BDDDDDDD9D9D9847B7BB2B2B29E9E9EA6A6A6
      C4C5C4CED0D2CFD6DACFD8DCD8DCDED8DBDD6B7373B7A293B55B11FF00FFFF00
      FFCB6D12FFFFFFFFFFFF00C8F800C8F800C8F800C8F800C8F8FFFFFFFFFFFF84
      7B7BEFEFEFECECECBABABA6B7373B9B9B9D1D3D4E0E2E3EAECEDE5EBEEE4E9EC
      DEDCDA6B7373F3EDEAB7A293B65C11FF00FFFF00FFCA6C11F3EDEAF3EDEAF3ED
      EAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEA847B7B847B7B847B7BF3
      EDEA847B7B847B7B847B7B847B7B847B7B847B7B847B7BF3EDEAF3EDEAF3EDEA
      CA6A0DFF00FFFF00FFB963038E40198E40198E40198E40198E40198E40198E40
      198E40198E40198E40198E40198E40198E40198E40198E40198E40198E40198E
      40198E40198E40198E40198E40198E40198E4019B96303FF00FFFF00FFB96303
      B45C00B45C00B45C00B45C00B45C00B45C00B45C00B55B00B55B00B55B00B55B
      00B55B00B55B00B45C00B45C00B45C00F6BB7FE58F31B45C00F6BB7FE58F31B4
      5C004F75D4826970B96303FF00FFFF00FFD17002E38E2DE38E2DE38E2DE38E2D
      E38E2DE38E2DE38E2DE38E2DE38E2DE38E2DE38E2DE38E2DE38E2DE38E2DE38E
      2DE38E2DF6CA9AF19F43E38E2DF6CA9AF19F43E38E2D306DF9325CC8CA6A0DFF
      00FFFF00FFFF00FFD17002D27100D27100D27100D27100D27100D27100D27100
      D27100D27100D27100D27100D27100D27100D27100D27100D27100D27100D271
      00D27100D27100D27100D27100D27100FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 1
    OnClick = AssumptionsBtnClick
  end
  object CloseBtn: TcxButton
    Left = 664
    Top = 608
    Width = 129
    Height = 57
    Caption = '&Close and'#13#10'Apply Changes'
    ModalResult = 1
    TabOrder = 2
  end
  object cxLabel3: TcxLabel
    Left = 464
    Top = 228
    Caption = 'Net Movement in Cash Position'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
  end
  object cxGroupBox1: TcxGroupBox
    Left = 464
    Top = 320
    Caption = 'Accounts Receivable'
    TabOrder = 4
    Height = 81
    Width = 329
    object cxLabel4: TcxLabel
      Left = 8
      Top = 24
      Caption = 'Average Days Outstanding'
      Transparent = True
    end
    object cxLabel5: TcxLabel
      Left = 200
      Top = 24
      Caption = 'Change'
      Transparent = True
    end
    object ARDiff: TcxCurrencyEdit
      Left = 200
      Top = 48
      TabStop = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '$,0;($,0)'
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 121
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 464
    Top = 416
    Caption = 'Stock / Materials on Hand'
    TabOrder = 5
    Height = 81
    Width = 329
    object DaysLabel: TcxLabel
      Left = 8
      Top = 24
      Caption = 'Average Days Outstanding'
      Transparent = True
    end
    object cxLabel7: TcxLabel
      Left = 200
      Top = 24
      Caption = 'Change'
      Transparent = True
    end
    object STDiff: TcxCurrencyEdit
      Left = 200
      Top = 48
      TabStop = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '$,0;($,0)'
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 121
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 464
    Top = 512
    Caption = 'Accounts Payable'
    TabOrder = 6
    Height = 81
    Width = 329
    object cxLabel8: TcxLabel
      Left = 8
      Top = 24
      Caption = 'Average Days Outstanding'
      Transparent = True
    end
    object cxLabel9: TcxLabel
      Left = 200
      Top = 24
      Caption = 'Change'
      Transparent = True
    end
    object APDiff: TcxCurrencyEdit
      Left = 200
      Top = 48
      TabStop = False
      Properties.Alignment.Horz = taRightJustify
      Properties.Alignment.Vert = taVCenter
      Properties.DecimalPlaces = 0
      Properties.DisplayFormat = '$,0;($,0)'
      Properties.ReadOnly = True
      TabOrder = 2
      Width = 121
    end
  end
  object cxButton1: TcxButton
    Left = 464
    Top = 608
    Width = 129
    Height = 57
    Caption = 'Ca&ncel and Exit'
    ModalResult = 2
    TabOrder = 8
    OnClick = cxButton1Click
  end
  object GRID: TcxGrid
    Left = 7
    Top = 80
    Width = 442
    Height = 513
    TabOrder = 9
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    object GRIDBTVBalanceSheet: TcxGridBandedTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.Options = [dcoAssignGroupingValues, dcoSaveExpanding]
      DataController.Summary.DefaultGroupSummaryItems = <
        item
          Column = AccountGroup
        end
        item
          Format = 'Total'
          Kind = skCount
          Position = spFooter
          Column = AccountTitle
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = OpeningBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = ClosingBalance
        end>
      DataController.Summary.FooterSummaryItems = <
        item
          Format = 'Equity'
          Kind = skCount
          Column = AccountTitle
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = OpeningBalance
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = ClosingBalance
        end>
      DataController.Summary.SummaryGroups = <>
      DataController.Summary.OnAfterSummary = GRIDBTVBalanceSheetDataControllerSummaryAfterSummary
      OptionsBehavior.DragHighlighting = False
      OptionsBehavior.DragOpening = False
      OptionsBehavior.DragScrolling = False
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.ImmediateEditor = False
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsCustomize.GroupRowSizing = True
      OptionsCustomize.BandMoving = False
      OptionsCustomize.BandSizing = False
      OptionsCustomize.ColumnVertSizing = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsSelection.InvertSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      OptionsView.GroupFooters = gfAlwaysVisible
      OptionsView.GroupRowHeight = 25
      OptionsView.HeaderAutoHeight = True
      Styles.Header = DMRep1.cxStyle476
      Bands = <
        item
          Caption = 'Opening Balance'
          FixedKind = fkLeft
          HeaderAlignmentHorz = taRightJustify
          Options.HoldOwnColumnsOnly = True
          Options.Moving = False
          VisibleForCustomization = False
          Width = 289
        end
        item
          Caption = 'Closing Balance'
          Options.HoldOwnColumnsOnly = True
          Width = 121
        end>
      object AccountGroup: TcxGridBandedColumn
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.ReadOnly = True
        Visible = False
        GroupIndex = 0
        MinWidth = 64
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.ShowEditButtons = isebNever
        Options.HorzSizing = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        SortIndex = 0
        SortOrder = soAscending
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
      object AccountTitle: TcxGridBandedColumn
        Tag = 1
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 158
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object OpeningBalance: TcxGridBandedColumn
        Tag = 2
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 113
        Position.BandIndex = 0
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object ClosingBalance: TcxGridBandedColumn
        Tag = 99
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;(,0)'
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        FooterAlignmentHorz = taRightJustify
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        MinWidth = 80
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Moving = False
        Options.Sorting = False
        Options.VertSizing = False
        Width = 112
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object GLBalanceSheet: TcxGridLevel
      Caption = 'dfsdf'
      GridView = GRIDBTVBalanceSheet
    end
  end
  object NetDiff: TcxCurrencyEdit
    Left = 464
    Top = 256
    TabStop = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;($,0)'
    Properties.ReadOnly = True
    TabOrder = 10
    Width = 129
  end
  object cxLabel1: TcxLabel
    Left = 611
    Top = 256
    AutoSize = False
    Caption = 
      '(Influenced largely by Trading Profit, Collection and Payment ra' +
      'tes and Capital Spending.)'
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    Properties.WordWrap = True
    Transparent = True
    Height = 49
    Width = 193
  end
  object ARDaysEdit: TcxCurrencyEdit
    Left = 472
    Top = 368
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = ARDaysEditPropertiesEditValueChanged
    TabOrder = 12
    OnExit = ARDaysEditPropertiesEditValueChanged
    Width = 121
  end
  object ARDaysSpin: TcxSpinButton
    Left = 593
    Top = 367
    Associate = ARDaysEdit
    AutoSize = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = ARDaysSpinPropertiesEditValueChanged
    TabOrder = 15
    Height = 21
    Width = 19
  end
  object StockDaysEdit: TcxCurrencyEdit
    Left = 472
    Top = 469
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = StockDaysEditPropertiesEditValueChanged
    TabOrder = 13
    OnExit = StockDaysEditPropertiesEditValueChanged
    Width = 121
  end
  object StockDaysSpin: TcxSpinButton
    Left = 593
    Top = 469
    Associate = StockDaysEdit
    AutoSize = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = StockDaysSpinPropertiesEditValueChanged
    TabOrder = 16
    Height = 21
    Width = 19
  end
  object APDaysEdit: TcxCurrencyEdit
    Left = 472
    Top = 565
    EditValue = 0.000000000000000000
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = ',0.00;-,0.00'
    Properties.Nullable = False
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = APDaysEditPropertiesEditValueChanged
    TabOrder = 14
    OnExit = APDaysEditPropertiesEditValueChanged
    Width = 121
  end
  object APDaysSpin: TcxSpinButton
    Left = 593
    Top = 565
    Associate = APDaysEdit
    AutoSize = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = APDaysSpinPropertiesEditValueChanged
    TabOrder = 17
    Height = 21
    Width = 19
  end
  object cxLabel14: TcxLabel
    Left = 16
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
    Left = 248
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
end
