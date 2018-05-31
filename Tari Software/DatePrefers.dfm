object DatePrefersF: TDatePrefersF
  Left = 707
  Top = 320
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Date Format and Colour Preferences'
  ClientHeight = 593
  ClientWidth = 998
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object SampleDate: TcxDateEdit
    Left = 320
    Top = 31
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.DateButtons = [btnToday]
    Properties.SaveTime = False
    Properties.ShowTime = False
    Properties.OnChange = SampleDateChange
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 121
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 8
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Date Format Preferences'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHighlight
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
    Height = 24
    Width = 212
  end
  object cxLabel2: TcxLabel
    Left = 320
    Top = 8
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Sample Date'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHighlight
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 113
  end
  object cxLabel3: TcxLabel
    Left = 16
    Top = 72
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Data Entry Format'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 113
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 185
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Standard Format'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 113
  end
  object cxLabel5: TcxLabel
    Left = 16
    Top = 296
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Enhanced Format'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 113
  end
  object cxLabel6: TcxLabel
    Left = 16
    Top = 99
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'This format is used whenever you can enter a date.'#13#10'Use M or MM ' +
      'to ensure the month is numeric.'#13#10
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 63
    Width = 273
  end
  object cxLabel7: TcxLabel
    Left = 16
    Top = 208
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'This format is used for most screen presentations where space if' +
      ' a premium.'#13#10'Again, it is suggested that you use M or MM to ensu' +
      're the month is numeric.'#13#10
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 73
    Width = 281
  end
  object cxLabel8: TcxLabel
    Left = 16
    Top = 328
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'This is used where ease of reading is more important than space.' +
      #13#10'Use MMM for Month (abbreviated Month ie Jan). '#13#10
    ParentColor = False
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Height = 65
    Width = 281
  end
  object StaticText1: TcxTextEdit
    Left = 320
    Top = 72
    TabStop = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Style.Color = clMenuBar
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 9
    Width = 121
  end
  object StaticText2: TcxTextEdit
    Left = 320
    Top = 180
    TabStop = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Style.Color = clMenuBar
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 10
    Width = 121
  end
  object StaticText3: TcxTextEdit
    Left = 320
    Top = 295
    TabStop = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Style.Color = clMenuBar
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = False
    Style.Shadow = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = False
    TabOrder = 11
    Width = 121
  end
  object cxLabel12: TcxLabel
    Left = 499
    Top = 9
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Skin Selection'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHighlight
    Style.Font.Height = -15
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
    Height = 24
    Width = 129
  end
  object cxGroupBox1: TcxGroupBox
    Left = 496
    Top = 56
    Caption = 'Sample Colours (Group Box)'
    TabOrder = 13
    Height = 305
    Width = 481
    object cxGrid1: TcxGrid
      Left = 3
      Top = 99
      Width = 475
      Height = 124
      TabOrder = 0
      object cxGrid1DBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.CopyCaptionsToClipboard = False
        OptionsBehavior.CopyRecordsToClipboard = False
        OptionsBehavior.DragHighlighting = False
        OptionsBehavior.DragOpening = False
        OptionsBehavior.DragScrolling = False
        OptionsBehavior.ColumnHeaderHints = False
        OptionsBehavior.EditAutoHeight = eahEditor
        OptionsBehavior.ExpandMasterRowOnDblClick = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.FocusRect = False
        OptionsView.ScrollBars = ssVertical
        OptionsView.CellAutoHeight = True
        OptionsView.ExpandButtonsForEmptyDetails = False
        OptionsView.GroupByBox = False
        OptionsView.HeaderAutoHeight = True
        OptionsView.Indicator = True
        object cxGrid1DBTableView1Column1: TcxGridDBColumn
          Caption = 'Column 1 with 2 Lines'
          PropertiesClassName = 'TcxTextEditProperties'
          HeaderAlignmentHorz = taCenter
          Options.Editing = False
          Options.Filtering = False
          Options.FilteringFilteredItemsList = False
          Options.FilteringMRUItemsList = False
          Options.FilteringPopup = False
          Options.FilteringPopupMultiSelect = False
        end
        object cxGrid1DBTableView1Column2: TcxGridDBColumn
          Caption = 'Column 2'
        end
        object cxGrid1DBTableView1Column3: TcxGridDBColumn
          Caption = 'Column 3'
        end
        object cxGrid1DBTableView1Column4: TcxGridDBColumn
          Caption = 'Column 4'
        end
        object cxGrid1DBTableView1Column5: TcxGridDBColumn
          Caption = 'Column 5'
        end
        object cxGrid1DBTableView1Column6: TcxGridDBColumn
          Caption = 'Column 6'
        end
        object cxGrid1DBTableView1Column7: TcxGridDBColumn
          Caption = 'Column 7'
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxButton1: TcxButton
      Left = 16
      Top = 59
      Width = 121
      Height = 25
      Caption = 'Test Button'
      LookAndFeel.NativeStyle = False
      TabOrder = 1
    end
    object cxComboBox1: TcxComboBox
      Left = 160
      Top = 61
      Properties.OnChange = STDFormatsCBChange
      TabOrder = 2
      Text = 'Test Combo Box'
      Width = 121
    end
    object cxSpinEdit1: TcxSpinEdit
      Left = 320
      Top = 61
      Properties.Alignment.Horz = taRightJustify
      Properties.ValueType = vtFloat
      TabOrder = 3
      Width = 121
    end
  end
  object cxComboBox2: TcxComboBox
    Left = 656
    Top = 11
    Properties.ImmediatePost = True
    Properties.Items.Strings = (
      'a'
      'b'
      'c'
      'd'
      'e'
      'f'
      'g'
      'h'
      'i')
    Properties.OnChange = cxComboBox2PropertiesChange
    TabOrder = 14
    Width = 233
  end
  object DEFormatsCB: TcxComboBox
    Left = 176
    Top = 71
    Properties.Items.Strings = (
      'd/MM/yy'
      'd/MM/yyyy'
      'd/M/yyyy'
      'd/MM/yyyy'
      'dd/M/yy'
      'dd/M/yyyy'
      'dd/MM/yy'
      'dd/MM/yyyy'
      'dd-MMM-yy'
      'dd-MMM-yyyy'
      'd.MM.yy'
      'd.MM.yyyy'
      'dd.MM.yy'
      'dd.MM.yyyy'
      'M/d/yy'
      'M/d/yyyy'
      'MM/dd/yy'
      'MM/dd/yyyy'
      'yyyy-MM-dd'
      'yyyy-MMM-dd')
    Properties.OnChange = DEFormatsCBChange
    TabOrder = 15
    Width = 121
  end
  object STDFormatsCB: TcxComboBox
    Left = 176
    Top = 180
    Properties.OnChange = STDFormatsCBChange
    TabOrder = 16
    Width = 121
  end
  object EnhFormatsCB: TcxComboBox
    Left = 176
    Top = 295
    Properties.OnChange = EnhFormatsCBChange
    TabOrder = 17
    Width = 121
  end
  object CloseBtn: TcxButton
    Left = 320
    Top = 540
    Width = 121
    Height = 41
    Caption = '&Close'
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    OptionsImage.Glyph.Data = {
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
    TabOrder = 18
    OnClick = CloseBtnClick
  end
  object cxLabel9: TcxLabel
    Left = 499
    Top = 385
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Old Data Clean Up'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHighlight
    Style.Font.Height = -15
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
    Height = 24
    Width = 129
  end
  object cxLabel10: TcxLabel
    Left = 499
    Top = 415
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'In Department Setup - Tracking Period Dates, a button exists to ' +
      'Clean Up Data. Please select an option that suits your annual me' +
      'thod of moving a file forward.'#13#10'If you retain a copy of this bus' +
      'iness database each year or If you don'#39't need to go back to see ' +
      'past data, select a short period.  Otherwise select a longer per' +
      'iod or not at all if you are not entering tracking invoices.'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 82
    Width = 478
  end
  object cxComboBox3: TcxComboBox
    Left = 499
    Top = 503
    Properties.Items.Strings = (
      'Delete No Data!'
      'Delete Data older than 5 Years'
      'Delete Data older than 2 Years'
      'Delete Data older than 1 Year')
    Properties.ReadOnly = False
    TabOrder = 21
    Text = 'Delete No Data!'
    Width = 161
  end
end
