object ImpTemplatesF: TImpTemplatesF
  Left = 514
  Top = 386
  Width = 730
  Height = 526
  BorderIcons = []
  Caption = 'Import Data - Template Maintenance'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CloseBtn: TcxButton
    Left = 585
    Top = 438
    Width = 121
    Height = 41
    Caption = 'Close'
    TabOrder = 0
    OnClick = CloseBtnClick
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
  object cxGrid1: TcxGrid
    Left = 8
    Top = 64
    Width = 705
    Height = 361
    TabOrder = 1
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DMInterface.DSTari_Mapping
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      Styles.StyleSheet = DMInterface.TARI_DEV_ExpressStyle
      object cxGrid1DBTableView1DBColumn1: TcxGridDBColumn
        Caption = 'Shortcuts Petty Account'
        DataBinding.FieldName = 'SC_TITLE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.Focusing = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 332
      end
      object cxGrid1DBTableView1DBColumn2: TcxGridDBColumn
        Caption = 'TARI Account Title'
        DataBinding.FieldName = 'TARI_ACCOUNT'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.DropDownListStyle = lsFixedList
        Properties.DropDownRows = 12
        Properties.ImmediatePost = True
        Properties.KeyFieldNames = 'ACCOUNT_NUMBER'
        Properties.ListColumns = <
          item
            Fixed = True
            SortOrder = soAscending
            FieldName = 'ACCOUNT_TITLE'
          end>
        Properties.ListOptions.AnsiSort = True
        Properties.ListSource = TARIDM.DSAccountMapping
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.IncSearch = False
        Options.Grouping = False
        Options.Moving = False
        Width = 347
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    AutoSize = False
    Caption = 
      'For each Shortcuts Petty Cash Account we must have a matching TA' +
      'RI Account.'#13#10#13#10'Select from the drop down list. Use "Total Other ' +
      'Expenses" as the default.'
    Properties.WordWrap = True
    Style.LookAndFeel.NativeStyle = True
    Style.TextStyle = [fsBold]
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 49
    Width = 689
  end
end
