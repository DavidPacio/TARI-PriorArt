object ExpGroupingF: TExpGroupingF
  Left = 529
  Top = 376
  Caption = 'TARI for Business - Expense Account Grouping'
  ClientHeight = 656
  ClientWidth = 546
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object cxGrid2: TcxGrid
    Left = 16
    Top = 71
    Width = 513
    Height = 513
    TabOrder = 0
    LookAndFeel.Kind = lfUltraFlat
    object cxGrid2DBTableView1: TcxGridDBTableView
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = True
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      Navigator.Buttons.GotoBookmark.Visible = False
      Navigator.Buttons.Filter.Visible = False
      DataController.DataModeController.SmartRefresh = True
      DataController.DataSource = DataModuleClient.DSAccountsGrouping
      DataController.DetailKeyFieldNames = 'ACCOUNT_NUMBER'
      DataController.Options = [dcoAnsiSort, dcoSaveExpanding, dcoSortByDisplayText, dcoGroupsAlwaysExpanded, dcoImmediatePost]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsBehavior.AlwaysShowEditor = True
      OptionsBehavior.FocusCellOnTab = True
      OptionsBehavior.FocusFirstCellOnNewRecord = True
      OptionsBehavior.GoToNextCellOnEnter = True
      OptionsBehavior.FocusCellOnCycle = True
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsCustomize.ColumnMoving = False
      OptionsCustomize.ColumnSorting = False
      OptionsData.Deleting = False
      OptionsData.Inserting = False
      OptionsView.NavigatorOffset = 200
      OptionsView.ScrollBars = ssVertical
      OptionsView.CellAutoHeight = True
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object cxGrid2DBTableView1DBColumn1: TcxGridDBColumn
        Caption = 'Expense Account'
        DataBinding.FieldName = 'ACCOUNT_TITLE'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Vert = taVCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Width = 221
      end
      object cxGrid2DBTableView1DBColumn2: TcxGridDBColumn
        Caption = 'Group'
        DataBinding.FieldName = 'ACCOUNT_GROUP'
        PropertiesClassName = 'TcxLookupComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.IncrementalFiltering = False
        Properties.KeyFieldNames = 'ACCOUNT_GRP_ID'
        Properties.ListColumns = <
          item
            Caption = 'Group'
            FieldName = 'GROUP_NAME'
          end>
        Properties.ListSource = DataModuleClient.DSExpenseGroups
        GroupIndex = 0
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        HeaderGlyphAlignmentHorz = taCenter
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
        Options.Moving = False
        Width = 234
      end
    end
    object cxGrid2Level1: TcxGridLevel
      GridView = cxGrid2DBTableView1
    end
  end
  object FinishBtn: TcxButton
    Left = 392
    Top = 601
    Width = 137
    Height = 41
    Caption = 'Finish'
    ModalResult = 1
    TabOrder = 1
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    AutoSize = False
    Caption = 
      'To change grouping, select a new group from the drop down list.'#13 +
      #10'"Direct" expenses will be lists after "Cost of Sales" and refle' +
      'cted in  the Gross Operating Profit.'#13#10'"Depreciation, Interest an' +
      'd Tax" expenses show and deducted from "Operating Net Profit".'
    Properties.WordWrap = True
    Height = 57
    Width = 530
  end
end
