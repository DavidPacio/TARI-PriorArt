object CashFlowDEF: TCashFlowDEF
  Left = 395
  Top = 256
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'TARI for Business - Cash Flow'
  ClientHeight = 721
  ClientWidth = 1012
  Color = clBtnFace
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
  object cxLabel2: TcxLabel
    Left = 8
    Top = 48
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
    Style.StyleController = DMRep1.cxEditStyleLabelExtraLarge
    Style.TransparentBorder = False
    Style.IsFontAssigned = True
    Properties.WordWrap = True
    Transparent = True
    Height = 29
    Width = 385
  end
  object GRID: TcxGrid
    Left = 8
    Top = 80
    Width = 993
    Height = 565
    TabOrder = 0
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
          Column = Balance1
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance2
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance3
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance4
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance5
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance6
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance7
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance8
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance9
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance10
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance11
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance12
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Position = spFooter
          Column = Balance13
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
          Column = Balance1
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance2
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance3
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance4
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance5
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance6
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance7
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance8
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance9
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance10
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance11
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance12
        end
        item
          Format = ',0;(,0)'
          Kind = skSum
          Column = Balance13
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
          Caption = 'Monthly Balance Sheets (scroll to see)'
          HeaderAlignmentHorz = taLeftJustify
          Options.HoldOwnColumnsOnly = True
          Options.Moving = False
          VisibleForCustomization = False
        end
        item
          Caption = 'Closing Balance'
          FixedKind = fkRight
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
      object Balance1: TcxGridBandedColumn
        Tag = 3
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
      object Balance2: TcxGridBandedColumn
        Tag = 4
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
        Position.ColIndex = 1
        Position.RowIndex = 0
      end
      object Balance3: TcxGridBandedColumn
        Tag = 5
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
        Position.ColIndex = 2
        Position.RowIndex = 0
      end
      object Balance4: TcxGridBandedColumn
        Tag = 6
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
        Position.ColIndex = 3
        Position.RowIndex = 0
      end
      object Balance5: TcxGridBandedColumn
        Tag = 7
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
        Position.ColIndex = 4
        Position.RowIndex = 0
      end
      object Balance6: TcxGridBandedColumn
        Tag = 8
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
        Position.ColIndex = 5
        Position.RowIndex = 0
      end
      object Balance7: TcxGridBandedColumn
        Tag = 9
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
        Position.ColIndex = 6
        Position.RowIndex = 0
      end
      object Balance8: TcxGridBandedColumn
        Tag = 10
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
        Position.ColIndex = 7
        Position.RowIndex = 0
      end
      object Balance9: TcxGridBandedColumn
        Tag = 11
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
        Position.ColIndex = 8
        Position.RowIndex = 0
      end
      object Balance10: TcxGridBandedColumn
        Tag = 12
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
        Position.ColIndex = 9
        Position.RowIndex = 0
      end
      object Balance11: TcxGridBandedColumn
        Tag = 13
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
        Position.ColIndex = 10
        Position.RowIndex = 0
      end
      object Balance12: TcxGridBandedColumn
        Tag = 14
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
        Position.ColIndex = 11
        Position.RowIndex = 0
      end
      object Balance13: TcxGridBandedColumn
        Tag = 15
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
        Position.ColIndex = 12
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
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
      end
    end
    object GLBalanceSheet: TcxGridLevel
      Caption = 'dfsdf'
      GridView = GRIDBTVBalanceSheet
    end
  end
  object AssumptionsBtn: TcxButton
    Left = 8
    Top = 672
    Width = 113
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
    TabOrder = 2
    OnClick = AssumptionsBtnClick
  end
  object CloseBtn: TcxButton
    Left = 872
    Top = 672
    Width = 121
    Height = 41
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 3
  end
  object cxButton2: TcxButton
    Left = 664
    Top = 672
    Width = 129
    Height = 41
    Caption = 'Adjustments'#13#10'(Journals)'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000630B0000630B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF8E40198E40198E40198E40198E40198E40198E40198E40198E4019
      8E40198E40198E40198E40198E40198E40198E40198E40198E40198E40198E40
      198E40198E40198E40198E40198E40198E4019FF00FFFF00FF8E4018A24E00A2
      4E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00
      A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E00A24E
      00A24E008E4019FF00FFFF00FFA2511BF9F6F4B7A293B7A293B7A293B7A293B7
      A293B7A293B7A293A24E00B7A293B7A293B7A293B7A293B7A293B7A293B7A293
      B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293924218FF00FFFF00
      FFAE5919FAF8F6F9F6F4F7F3F1F5F1EEF4EEEBF2ECE8F1EAE6EFE7E3A24E00EC
      E3DEEBE1DBE9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCBC2DBC9BF
      DBC9BFDBC9BFDBC9BFB7A293964517FF00FFFF00FFB15A17FDFCFBFBF9F8F9F7
      F5F7F3F1F5F1EEF4EEEBF2ECE8F1EAE6A24E00EDE5E0ECE3DEEBE1DBE9DED7E7
      DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCBC2DBC9BFDBC9BFDBC9BFB7A293
      9A4817FF00FFFF00FFB45C17FEFEFDFDFCFBF8B266F8B266F8B266F8B266F5F0
      EDF3EDEAA24E00EFE7E3EDE5E0F8B266F8B266F8B266F8B266F8B266F8B266F8
      B266F8B266F8B266F8B266F8B266DBC9BFB7A2939E4B16FF00FFFF00FFB75E16
      FFFFFFFEFEFDFDFCFBFBF9F8F9F7F5F8F4F2F6F2EFF5F0EDA24E00F1EBE7F0E8
      E4EEE6E1EDE4DFEBE2DCE9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DC
      CBC2DBC9BFB7A293A24E15FF00FFFF00FFB96016FFFFFFFFFFFFFEFEFDFDFCFB
      FBF9F8F9F7F5F8F4F2F6F2EFA24E00F3EDEAF1EBE7F0E8E4EEE6E1EDE4DFEBE2
      DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDE0D1C8DECEC5DCCBC2B7A293A85214FF
      00FFFF00FFBC6215FFFFFFFFFFFFF8B266F8B266F8B266F8B266F9F7F5F8F4F2
      A24E00F5F0EDF3EDEAF8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B2
      66F8B266F8B266F8B266DFCFC6B7A293AC5514FF00FFFF00FFBF6415FFFFFFFF
      FFFFFFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F7F5A24E00F6F2EFF5F0EDF3EDEA
      F1EBE7F0E8E4EEE6E1EDE4DFEBE2DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDE1D2
      C9B7A293AC5513FF00FFFF00FFC06614FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE
      FEFDFDFCFBFBF9F8A24E00F8F4F2F6F2EFF5F0EDF3EDEAF1EBE7F0E8E4EEE6E1
      EDE4DFEBE2DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDB7A293AD5612FF00FFFF00
      FFC36814FFFFFFFFFFFFF8B266F8B266F8B266F8B266FFFFFFFDFDFCA24E00FA
      F8F6F9F6F4F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266
      F8B266F8B266E4D7D0B7A293AE5612FF00FFFF00FFC66A13FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA24E00FCFAF9FAF8F6F9F6F4F7F3F1F5
      F1EEF4EEEBF2ECE8F1EAE6EEE6E1EDE4DFEBE2DCEADFD9E8DDD6E6DAD3B7A293
      AF5712FF00FFFF00FFC96C13FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFA24E00FDFDFCFCFAF9FAF8F6F9F6F4F7F3F1F5F1EEF4EEEBF2ECE8F1
      EAE6EFE7E3EDE5E0ECE3DEEBE1DBE8DDD6B7A293B05812FF00FFFF00FFCB6D12
      FFFFFFFFFFFFF8B266F8B266F8B266F8B266FFFFFFFFFFFFA24E00FFFFFFFDFD
      FCF8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8
      B266EBE1DBB7A293B15912FF00FFFF00FFCB6D12FFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFA24E00FFFFFFFFFFFFFDFDFCFCFAF9FAF8F6F9F6
      F4F7F3F1F5F1EEF4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DEB7A293B25911FF
      00FFFF00FFCB6D12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      A24E00FFFFFFFFFFFFFFFFFFFDFDFCFCFAF9FAF8F6F9F6F4F7F3F1F5F1EEF4EE
      EBF2ECE8F1EAE6EFE7E3EDE5E0B7A293B35A11FF00FFFF00FFCB6D12FFFFFFFF
      FFFFF8B266F8B266F8B266F8B266FFFFFFFFFFFFA24E00FFFFFFFFFFFFF8B266
      F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266F8B266EFE7
      E3B7A293B45B11FF00FFFF00FFCB6D12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA24E00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFB
      FBF9F8F9F7F5F8F4F2F5F1EEF4EEEBF2ECE8F1EAE6B7A293B55B11FF00FFFF00
      FFCB6D12FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA24E00FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F7F5F8F4F2
      F6F2EFF5F0EDF3EDEAB7A293B65C11FF00FFFF00FFCA6C11F3EDEAF3EDEAF3ED
      EAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAA24E00F3EDEAF3EDEAF3EDEAF3EDEAF3
      EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEAF3EDEA
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
    TabOrder = 4
    OnClick = cxButton2Click
  end
  object cxGroupBox1: TcxGroupBox
    Left = 144
    Top = 651
    Caption = 'Edit Working Capital'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    TabOrder = 5
    Height = 62
    Width = 457
    object EditARBtn: TcxButton
      Left = 3
      Top = 26
      Width = 97
      Height = 33
      Caption = 'Accounts'#13#10'Receivable'
      TabOrder = 0
      OnClick = EditARBtnClick
    end
    object EditStockBtn: TcxButton
      Left = 120
      Top = 26
      Width = 97
      Height = 33
      Caption = 'Stock'#13#10'On Hand'
      TabOrder = 1
      OnClick = EditStockBtnClick
    end
    object EditAPBtn: TcxButton
      Left = 232
      Top = 26
      Width = 97
      Height = 33
      Caption = 'Accounts'#13#10'Payable'
      TabOrder = 2
      OnClick = EditAPBtnClick
    end
    object EditAEBtn: TcxButton
      Left = 344
      Top = 26
      Width = 97
      Height = 33
      Caption = 'Accrued'#13#10'Expenses'
      TabOrder = 3
      OnClick = EditAEBtnClick
    end
  end
  object cxLabel15: TcxLabel
    Left = 8
    Top = 8
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Business / Branch:'
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
    Height = 42
    Width = 193
  end
  object cxDBLabel4: TcxDBLabel
    Left = 162
    Top = 5
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
    Width = 799
    AnchorY = 20
  end
end
