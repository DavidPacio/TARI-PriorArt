object TrackingPeriodF: TTrackingPeriodF
  Left = 747
  Top = 435
  ActiveControl = MonitoringStartDate
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Tracking Period'
  ClientHeight = 543
  ClientWidth = 372
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel
    Left = 16
    Top = 113
    Width = 5
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Transparent = True
  end
  object cxDBTextEdit1: TcxDBTextEdit
    Left = 8
    Top = 40
    TabStop = False
    DataBinding.DataField = 'REVENUE_GROUP_NAME'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentFont = False
    Properties.Alignment.Vert = taVCenter
    Properties.AutoSelect = False
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    Width = 345
  end
  object MonitoringStartDate: TcxDBDateEdit
    Left = 120
    Top = 112
    DataBinding.DataField = 'CURRENTMONITORINGSTART'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    Properties.Alignment.Vert = taVCenter
    Properties.DateButtons = []
    Properties.ImmediatePost = True
    Properties.MaxDate = 37438.000000000000000000
    Properties.ReadOnly = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 1
    OnExit = MonitoringStartDateExit
    Width = 137
  end
  object MonitoringEndDate: TcxDBDateEdit
    Left = 120
    Top = 144
    DataBinding.DataField = 'CURRENTMONITORINGEND'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    Properties.ReadOnly = False
    Properties.SaveTime = False
    Properties.ShowTime = False
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 2
    OnExit = MonitoringEndDateExit
    Width = 137
  end
  object CloseBtn: TcxButton
    Left = 120
    Top = 464
    Width = 113
    Height = 41
    Caption = '&Close'
    LookAndFeel.NativeStyle = True
    ModalResult = 1
    TabOrder = 3
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 80
    Caption = 'Current Tracking Period'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 8
    Top = 112
    AutoSize = False
    Caption = 'From'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 20
    Width = 44
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 144
    AutoSize = False
    Caption = 'To'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    Transparent = True
    Height = 20
    Width = 28
  end
  object cxLabel4: TcxLabel
    Left = 8
    Top = 248
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Earliest Target Date'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Width = 98
  end
  object cxLabel5: TcxLabel
    Left = 8
    Top = 280
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Latest Target Date'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Width = 93
  end
  object cxLabel6: TcxLabel
    Left = 8
    Top = 320
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Grouping Name for Invoices:'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Width = 201
  end
  object GroupingCB: TcxComboBox
    Left = 8
    Top = 424
    Properties.Items.Strings = (
      'Quotes'
      'Personnel'
      'Products')
    Style.LookAndFeel.Kind = lfStandard
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfStandard
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfStandard
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfStandard
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 10
    Text = 'GroupingCB'
    OnExit = GroupingCBExit
    Width = 185
  end
  object cxLabel7: TcxLabel
    Left = 8
    Top = 0
    AutoSize = False
    Caption = 'Department / Revenue Group Name'
    ParentColor = False
    ParentFont = False
    Style.BorderStyle = ebsUltraFlat
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -19
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleControllerBackgroundColor
    Style.IsFontAssigned = True
    Height = 28
    Width = 345
  end
  object cxLabel8: TcxLabel
    Left = 8
    Top = 352
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'Select or type a name for how you intend to group invoices. The ' +
      'name will be used in Revenue Grouping, Invoice Data Entry and Re' +
      'ports.'#13#10#13#10'The name entered can be changed at any time without ef' +
      'fect. '
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Height = 65
    Width = 337
  end
  object cxDBLabel1: TcxDBLabel
    Left = 120
    Top = 248
    DataBinding.DataField = 'FIRSTPLANDATE'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentColor = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.LabelStyle = cxlsOutLine
    Style.BorderStyle = ebsSingle
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Height = 21
    Width = 121
    AnchorX = 181
    AnchorY = 259
  end
  object cxDBLabel2: TcxDBLabel
    Left = 120
    Top = 280
    DataBinding.DataField = 'LATESTPLANDATE'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentColor = False
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Properties.LabelStyle = cxlsOutLine
    Style.BorderStyle = ebsSingle
    Style.Color = clInfoBk
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.NativeStyle = True
    Height = 21
    Width = 121
    AnchorX = 181
    AnchorY = 291
  end
  object ApplyTargetDatetoAllBtn: TcxButton
    Left = 119
    Top = 192
    Width = 177
    Height = 33
    Caption = 'Apply the new date range'#13#10'to ALL Departments'
    Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000730B0000730B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFC8B3A4694731694731694731694731694731694731694731
      6947316947316947316947316947316947316947316947316947316947316947
      31694731694731694731694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4F2
      ECE8B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293
      B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2936947
      31FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4F4EEEBF2ECE8F1EAE6EFE7E3ED
      E5E0ECE3DDEBE1DBE9DED8E7DCD5E6D9D2E4D7CFE3D5CDE1D2CADFD0C7DECDC4
      DCCBC1DBC9BFDBC9BFDBC9BFDBC9BFB7A293694731FF00FFFF00FFFF00FFFF00
      FFFF00FFC8B3A4F5F1EEF4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DDEBE1DBE9
      DED8E7DCD5E6D9D2E4D7CFE3D5CDE1D2CADFD0C7DECDC4DCCBC1DBC9BFDBC9BF
      DBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4F7F3F1F5F1
      EECC6F16CB6E15CB6D13CB6C123098F8006098006098006098006098C96609C9
      6508C96406C86305C86203C86102C86000C86000DBC9BFB7A293694731FF00FF
      FF00FFFF00FFFF00FFFF00FFC8B3A4F9F7F5F8F4F2CC7018FEFEFDFEFEFDFEFE
      FD3098F824C8F82CA8F83098F8006098FEFEFDFEFEFDFEFEFDC96507FEFEFDFE
      FEFDFEFEFDC86101DBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FF
      C8B3A4FBF9F8F9F7F5CC711AFEFEFDFEFEFDFEFEFD3098F81CD8F824C8F82CA8
      F8006098FEFEFDFEFEFDFEFEFDC96608FEFEFDFEFEFDFEFEFDC86202DCCBC1B7
      A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FDFCFBFBF9F8CC721B
      FEFEFDFEFEFDFEFEFD3098F818E0F81CD8F824C8F8006098FEFEFDFEFEFDFEFE
      FDC9670AFEFEFDFEFEFDFEFEFDC86304DFCFC6B7A293694731FF00FFFF00FFFF
      00FFFF00FFFF00FFC8B3A4FEFEFDFDFCFBCC731CCC721BCC711ACC70183098F8
      4878F84878F84878F8006098CA6B10CA6A0ECA690DCA680BC9670AC96608C965
      07C96405E0D1C8B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FF
      FFFFFEFEFDCD741EFEFEFDFEFEFDFEFEFD3098F824C8F82CA8F83098F8006098
      FEFEFDFEFEFDFEFEFDCA690DFEFEFDFEFEFDFEFEFDC96507E2D3CBB7A2936947
      31FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFCD751FFEFEFDFE
      FEFDFEFEFD3098F81CD8F824C8F82CA8F8006098FEFEFDFEFEFDFEFEFDCA6A0E
      FEFEFDFEFEFDFEFEFDC96608E3D6CEB7A293694731FF00FFFF00FFFF00FFFF00
      FFFF00FFC8B3A4FFFFFFFFFFFFCD7520FEFEFDFEFEFDFEFEFD3098F818E0F81C
      D8F824C8F8006098FEFEFDFEFEFDFEFEFDCA6B10FEFEFDFEFEFDFEFEFDC9670A
      E5D8D1B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFF
      FFCD7722CD7621CD7520CD741E3098F84878F84878F84878F8006098CC6F16CB
      6E15CB6D13CB6C12CB6B10CA6A0FCA690DCA680CE7DBD4B7A293694731FF00FF
      FF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFCE7824FEFEFDFEFEFDFEFE
      FD3098F824C8F82CA8F83098F8006098FEFEFDFEFEFDFEFEFDCB6D13FEFEFDFE
      FEFDFEFEFDCA690DE8DDD6B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FF
      C8B3A4FFFFFFFFFFFFCE7925FEFEFDFEFEFDFEFEFD3098F81CD8F824C8F82CA8
      F8006098FEFEFDFEFEFDFEFEFDCB6E15FEFEFDFEFEFDFEFEFDCA6A0FEBE1DBB7
      A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFCE7A26
      FEFEFDFEFEFDFEFEFD3098F818E0F81CD8F824C8F8006098FEFEFDFEFEFDFEFE
      FDCC6F16FEFEFDFEFEFDFEFEFDCB6B10ECE3DDB7A293694731FF00FFFF00FFFF
      00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFCE7A28CE7A26CE7925CE78243098F8
      4878F84878F84878F8006098CC721CCC711ACC7019CC7018CC6F16CB6E15CB6D
      13CB6C12EDE5E0B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FF
      FFFFFFFFFFCF7B29FEFEFDFEFEFDFEFEFD3098F824C8F82CA8F83098F8006098
      FEFEFDFEFEFDFEFEFDCC7019FEFEFDFEFEFDFEFEFDCB6D13EFE7E3B7A2936947
      31FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFCF7C2AFEFEFDFE
      FEFDFEFEFD3098F81CD8F824C8F82CA8F8006098FEFEFDFEFEFDFEFEFDCC711A
      FEFEFDFEFEFDFEFEFDCB6E15F1EAE6B7A293694731FF00FFFF00FFFF00FFFF00
      FFFF00FFC8B3A4FFFFFFFFFFFFCF7D2CFEFEFDFEFEFDFEFEFD3098F818E0F81C
      D8F824C8F8006098FEFEFDFEFEFDFEFEFDCC731CFEFEFDFEFEFDFEFEFDCC7017
      F2ECE8B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFF
      FFD07F2ECF7E2CCF7D2BCF7C2A3098F83098F83098F83098F83098F8CD7622CD
      7520CD751FCD741ECC731CCC721BCC711ACC7018F5F0EDB7A293694731FF00FF
      FF00FFFF00FFFF00FFFF00FFC8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFBFB
      F9F8F9F7F5F8F4F2F6F2EFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FF
      C8B3A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F7F5F8F4F2F6
      F2EF694731FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4C8B3A4C8B3A4C8B3A4
      C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3
      A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
    TabOrder = 15
    OnClick = ApplyTargetDatetoAllBtnClick
  end
end
