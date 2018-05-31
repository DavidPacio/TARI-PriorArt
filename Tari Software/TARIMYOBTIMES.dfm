object TARITimesF: TTARITimesF
  Left = 510
  Top = 291
  Width = 827
  Height = 707
  Caption = 'Enter or Edit Target times in minutes for Services'
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
  object cxGrid1: TcxGrid
    Left = 8
    Top = 40
    Width = 793
    Height = 433
    TabOrder = 0
    object cxGrid1DBTableView1: TcxGridDBTableView
      NavigatorButtons.ConfirmDelete = False
      DataController.DataSource = DMInterface.DSFBUnitsUpdate
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsCustomize.ColumnFiltering = False
      OptionsCustomize.ColumnGrouping = False
      OptionsCustomize.ColumnHidingOnGrouping = False
      OptionsView.ScrollBars = ssVertical
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      Styles.StyleSheet = DMInterface.TARI_DEV_ExpressStyle
      object cxGrid1DBTableView1PRODUCT_ID: TcxGridDBColumn
        Caption = 'Service ID'
        DataBinding.FieldName = 'PRODUCT_ID'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
      end
      object cxGrid1DBTableView1PROD_GROUP: TcxGridDBColumn
        Caption = 'Category'
        DataBinding.FieldName = 'PROD_GROUP'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 132
      end
      object cxGrid1DBTableView1DESCRIPTION: TcxGridDBColumn
        Caption = 'Description'
        DataBinding.FieldName = 'DESCRIPTION'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
        Width = 266
      end
      object cxGrid1DBTableView1SELLING_PRICE: TcxGridDBColumn
        Caption = 'Selling Price'
        DataBinding.FieldName = 'SELLING_PRICE'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Grouping = False
      end
      object cxGrid1DBTableView1UNITS_LABOUR: TcxGridDBColumn
        Caption = 'Target Minutes'
        DataBinding.FieldName = 'UNITS_LABOUR'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DecimalPlaces = 0
        Properties.DisplayFormat = ',0;,0'
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
      end
      object cxGrid1DBTableView1TARI_Rate: TcxGridDBColumn
        Caption = 'Target Rate'
        DataBinding.FieldName = 'TARI_Rate'
        PropertiesClassName = 'TcxCurrencyEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        HeaderAlignmentVert = vaCenter
        Options.Editing = False
        Options.Filtering = False
        Options.FilteringMRUItemsList = False
        Options.Focusing = False
        Options.Grouping = False
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object CloseBtn: TcxButton
    Left = 688
    Top = 600
    Width = 107
    Height = 49
    Caption = 'Close'
    ModalResult = 1
    TabOrder = 1
    OnClick = CloseBtnClick
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
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    Width = 129
    Height = 28
    AutoSize = False
    Caption = 'Services'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clNavy
    Style.Font.Height = -19
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
  end
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 488
    Width = 521
    Height = 169
    Caption = 'Service Components'
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 3
    object ComponentDesc: TcxDBTextEdit
      Left = 120
      Top = 68
      Width = 361
      Height = 21
      DataBinding.DataField = 'DESCRIPTION'
      DataBinding.DataSource = DMInterface.DSComponentLU
      Properties.ReadOnly = True
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 0
    end
    object ComponentSellingPrice: TcxDBCurrencyEdit
      Left = 120
      Top = 100
      Width = 121
      Height = 21
      DataBinding.DataField = 'SELLING_PRICE'
      DataBinding.DataSource = DMInterface.DSComponentLU
      Properties.ChangeEnterToTab = True
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
    end
    object ComponentLabourUnits: TcxDBCurrencyEdit
      Left = 120
      Top = 132
      Width = 121
      Height = 21
      DataBinding.DataField = 'UNITS_LABOUR'
      DataBinding.DataSource = DMInterface.DSComponentLU
      Properties.ChangeEnterToTab = True
      Properties.DisplayFormat = ',0.00;-,0.00'
      Properties.UseThousandSeparator = True
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 2
      OnExit = ComponentLabourUnitsExit
    end
    object cxLabel2: TcxLabel
      Left = 8
      Top = 72
      Width = 72
      Height = 20
      Caption = 'Description'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
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
    end
    object cxLabel3: TcxLabel
      Left = 8
      Top = 104
      Width = 79
      Height = 20
      Caption = 'Selling Price'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
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
    end
    object cxLabel4: TcxLabel
      Left = 8
      Top = 136
      Width = 93
      Height = 20
      Caption = 'Target Minutes'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
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
    end
    object cxDBNavigator1: TcxDBNavigator
      Left = 120
      Top = 8
      Width = 240
      Height = 25
      Buttons.PriorPage.Visible = False
      Buttons.NextPage.Visible = False
      Buttons.Insert.Visible = False
      Buttons.Delete.Visible = False
      Buttons.Edit.Visible = False
      Buttons.Post.Visible = False
      Buttons.Cancel.Visible = False
      Buttons.Refresh.Visible = False
      Buttons.SaveBookmark.Visible = False
      Buttons.GotoBookmark.Visible = False
      Buttons.Filter.Visible = False
      DataSource = DMInterface.DSFBComponentLU
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = True
      TabOrder = 3
    end
    object cxDBLabel1: TcxDBLabel
      Left = 120
      Top = 40
      Width = 9
      Height = 17
      AutoSize = True
      DataBinding.DataField = 'COMPONENT_ORDER'
      DataBinding.DataSource = DMInterface.DSFBComponentLU
      ParentFont = False
      Properties.Alignment.Vert = taVCenter
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = [fsBold]
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = False
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
    end
    object cxLabel5: TcxLabel
      Left = 8
      Top = 40
      Width = 83
      Height = 20
      Caption = 'Step Number'
      ParentFont = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clNavy
      Style.Font.Height = -13
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
    end
  end
end
