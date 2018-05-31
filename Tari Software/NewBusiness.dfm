object NewBusinessF: TNewBusinessF
  Left = 474
  Top = 325
  Caption = 'New Business Wizard'
  ClientHeight = 644
  ClientWidth = 796
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 796
    Height = 561
    Align = alTop
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.HideTabs = True
    Properties.HotTrack = True
    Properties.MultiLine = True
    Properties.Options = [pcoGoDialog, pcoNoArrows, pcoSort, pcoTopToBottomText]
    Properties.ScrollOpposite = True
    Properties.TabPosition = tpBottom
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    OnChange = cxPageControl1Change
    ClientRectBottom = 557
    ClientRectLeft = 4
    ClientRectRight = 792
    ClientRectTop = 4
    object cxTabSheet1: TcxTabSheet
      Caption = 'Business and File Names'
      ImageIndex = 0
      OnExit = cxTabSheet1Exit
      object cxLabel1: TcxLabel
        Left = 16
        Top = 16
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'WELCOME TO TARI for Business'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
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
        Height = 24
        Width = 305
      end
      object cxLabel2: TcxLabel
        Left = 16
        Top = 56
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'At any one time, a business has many activities under way giving' +
          ' rise to a variety of '#39'key performance indicators'#39'. However, the' +
          're are two performance indicators or '#39'drivers'#39' that are of funda' +
          'mental importance to the successful management and control of a ' +
          'business. Keep your eyes on these two and the rest tends to come' +
          ' into shape. '
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
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
        Height = 81
        Width = 769
      end
      object cxLabel3: TcxLabel
        Left = 16
        Top = 160
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'TARI for Business is designed to highlight the "composite" drive' +
          'r of Activity Contribution, developed from the two fundamental '#39 +
          'drivers'#39' relevant to your business. Targeting identifies the goa' +
          'l. Tracking '#39'locks on'#39' to the target and helps guide your progre' +
          'ss.'
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
        Height = 73
        Width = 769
      end
      object cxLabel4: TcxLabel
        Left = 16
        Top = 272
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'If enough information from past performance is available, it wil' +
          'l be possible to establish the current status of these two '#39'driv' +
          'ers'#39' prior to re targeting them as required. '
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
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
        Height = 49
        Width = 769
      end
      object cxLabel5: TcxLabel
        Left = 16
        Top = 368
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Name of Business:'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
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
        Height = 28
        Width = 209
      end
      object cxLabel6: TcxLabel
        Left = 16
        Top = 432
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'File Name for Business:'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
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
        Height = 28
        Width = 209
      end
      object BusinessName: TcxTextEdit
        Left = 288
        Top = 368
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
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
        TabOrder = 6
        Text = 'BusinessName'
        OnEnter = BusinessNameEnter
        OnExit = BusinessNameExit
        OnKeyDown = BusinessNameKeyDown
        Width = 449
      end
      object FileName: TcxTextEdit
        Left = 288
        Top = 432
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
        TabOrder = 7
        Text = 'FileName'
        Width = 449
      end
      object LicenceFile: TcxCheckBox
        Left = 16
        Top = 480
        AutoSize = False
        Caption = 'Licence this File ?'
        ParentFont = False
        Properties.Alignment = taRightJustify
        Properties.MultiLine = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -19
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.LookAndFeel.NativeStyle = True
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 8
        Height = 32
        Width = 289
      end
      object LicenceNote: TcxLabel
        Left = 24
        Top = 512
        AutoSize = False
        Caption = 
          'A file need to be licenced when it is going to be made available' +
          ' to an SME version of TARI.'
        Style.LookAndFeel.NativeStyle = True
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.NativeStyle = True
        Properties.WordWrap = True
        Transparent = True
        Height = 17
        Width = 401
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Departments / Revenue Groups'
      ImageIndex = 1
      OnEnter = cxTabSheet2Enter
      object cxLabel7: TcxLabel
        Left = 16
        Top = 232
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'Does the business have departments or revenue groups that you wo' +
          'uld like to analyse and/or target.'#13#10#13#10'If so, list the name of ea' +
          'ch below, one per line.'#13#10
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clMaroon
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
        Height = 89
        Width = 753
      end
      object cxLabel8: TcxLabel
        Left = 16
        Top = 328
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Enter a name for each Department / Revenue Group'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold, fsUnderline]
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
        Width = 553
      end
      object cxLabel9: TcxLabel
        Left = 16
        Top = 0
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Business Centres and Departments / Revenue Groups'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -19
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.StyleController = DMRep1.cxEditStyleLabelLarge
        Style.IsFontAssigned = True
        Transparent = True
        Height = 33
        Width = 761
      end
      object DeptList: TcxMemo
        Left = 24
        Top = 376
        Lines.Strings = (
          'DeptList')
        Properties.ScrollBars = ssVertical
        TabOrder = 3
        Height = 113
        Width = 361
      end
      object cxLabel16: TcxLabel
        Left = 16
        Top = 512
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Please select the last day of your business week'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
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
        Width = 409
      end
      object LastDayofWeekCB: TcxComboBox
        Left = 424
        Top = 512
        Properties.Items.Strings = (
          'Sunday'
          'Monday'
          'Tuesday'
          'Wednesday'
          'Thursday'
          'Friday'
          'Saturday')
        TabOrder = 5
        Text = 'LastDayofWeekCB'
        Width = 137
      end
      object cxLabel10: TcxLabel
        Left = 16
        Top = 32
        AutoSize = False
        Caption = 
          'Explanation:'#13#10#13#10'Each Business may consist of one or more "busine' +
          'ss centre" (such as branchs) and within each, one or more "depar' +
          'tments" or "revenue groups" can be created.'#13#10#13#10'Each "department"' +
          ' or "revenue group" has its own type of business activity and it' +
          's own targets for generating profit.'#13#10#13#10'Optionally and unless ex' +
          'cluded, all "departments" / "revenue groups" for the "business c' +
          'entre" consolidate targets for the cash flow projection and proj' +
          'ected balance sheet.'#13#10#13#10'For a new business, all "departments" / ' +
          '"revenue groups" will be created with a "business centre" called' +
          ' Main Business.'
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
        Height = 193
        Width = 753
      end
    end
  end
  object cxButton1: TcxButton
    Left = 592
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Next'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF397B39397B39397B39397B39397B39397B39397B39397B39397B39397B39
      397B39397B39397B39397B39397B39397B39397B39397B39397B39397B39FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42D6EBD6D4EAD4D2EAD2D0
      E9D0CEE8CECCE7CCCAE6CAC8E5C8C4E3C4BFE1BFBBDFBBB7DDB7B2DBB2AED9AE
      AAD7AAA6D5A6A1D3A19DD19D99CF9995CD95397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42D8ECD850AA504EA94E4CA84C4AA74A48A64846A54645
      A54543A44341A3413FA23F3DA13D3BA03B399F39389E38369D36349C34329B32
      309A3099CF99397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42DAED
      DA52AB5250AA504EA94E4CA84C4AA74A48A64846A54645A54543A44341A3413F
      A23F3DA13D3BA03B399F39389E38369D36349C34329B329DD19D397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42DCEEDC53AC5352AB5250AA504EA9
      4E4CA84C4AA74A48A64846A54645A54543A44341A3413FA23F3DA13D3BA03B39
      9F39389E38369D36349C34A1D3A1397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF429C42DEEFDE55AD5553AC5352AB5250AA504EA94E4CA84CA4D5A4A4D5
      A446A54645A54543A44341A3413FA23F3DA13D3BA03B399F39389E38369D36A6
      D5A6397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42E1F0E158AE58
      56AD5654AC5452AB5250AA504EA94EEFF7EFFFFFFFA4D5A446A54645A54543A4
      4341A3413FA23F3DA13D3BA03B399F39389E38AAD7AA397B39FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF429C42E3F1E35AAF5A58AE5856AD5654AC5452AB52
      51AB51EFF7EFFFFFFFFFFFFFA4D5A447A64746A54644A44442A34240A2403DA1
      3D3BA03B399F39AED9AE397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42
      9C42E4F2E45CB05C5AAF5A58AE5856AD5654AC5452AB52EFF7EFFFFFFFFFFFFF
      FFFFFFA4D5A447A64746A54644A44442A34240A2403EA13E3CA03CB5DCB5397B
      39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42E6F3E65EB15E5CB05C5A
      AF5A58AE5856AD5654AC54EFF7EFFFFFFFFFFFFFFFFFFFFFFFFFA4D5A447A647
      46A54644A44442A34240A2403EA13EB9DEB9397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42E8F4E85FB25F5EB15E5CB05C5AAF5A58AE5856AD56EF
      F7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4D5A447A64746A54644A44442A342
      40A240BDE0BD397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42EAF5
      EA61B3615FB25F5EB15E5CB05C5AAF5A58AE58EFF7EFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFA4D5A447A64746A54644A44442A342C1E2C1397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42ECF6EC65B56561B3615FB25F5EB1
      5E5CB05C5AAF5AEFF7EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA4D5A44BA84B49
      A74947A64746A54644A444C6E4C6397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF429C42EFF7EF6BB86B67B66763B46360B2605FB25F5DB15DEFF7EFFFFF
      FFFFFFFFFFFFFFFFFFFFA4D5A44FAA4F4DA94D4BA84B49A74947A64746A546CA
      E6CA397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42F1F8F170BA70
      6BB86B67B66763B46360B2605FB25FEFF7EFFFFFFFFFFFFFFFFFFFA4D5A453AC
      5352AB5250AA504EA94E4CA84C4AA74A48A648CCE7CC397B39FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF429C42F3F9F374BC7470BA706BB86B67B66763B463
      60B260EFF7EFFFFFFFFFFFFFA4D5A457AE5755AD5553AC5352AB5250AA504EA9
      4E4CA84C4AA74ACEE8CE397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42
      9C42F5FAF579BF7974BC7470BA706BB86B67B66763B463EFF7EFFFFFFFA4D5A4
      5BB05B59AF5957AE5755AD5553AC5352AB5250AA504EA94E4CA84CD0E9D0397B
      39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42F7FBF77DC17D79BF7974
      BC7470BA706BB86B67B667A4D5A4A4D5A45FB25F5DB15D5BB05B59AF5957AE57
      55AD5553AC5352AB5250AA504EA94ED2EAD2397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42F9FCF981C3817DC17D79BF7974BC7470BA706BB86B67
      B66763B46360B2605FB25F5DB15D5BB05B59AF5957AE5755AD5553AC5352AB52
      50AA50D4EAD4397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42FCFD
      FC88C68884C4847FC27F7BC07B76BD7672BB726EB96E67B66763B46360B2605F
      B25F5DB15D5BB05B59AF5957AE5755AD5553AC5352AB52D6EBD6397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42FDFEFDFCFDFCFAFCFAF8FBF8F6FA
      F6F4F9F4F2F9F2F0F8F0EEF7EEECF6ECEAF5EAE8F4E8E6F3E6E4F2E4E3F1E3E1
      F0E1DFEFDFDDEFDDDBEEDBD9EDD9397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF429C42429C42429C42429C42429C42429C42429C42429C42429C
      42429C42429C42429C42429C42429C42429C42429C42429C42429C42429C4242
      9C42FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 1
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 472
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Prev'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000130B0000130B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF397B39397B39397B39397B39397B39397B39397B39397B39397B39397B39
      397B39397B39397B39397B39397B39397B39397B39397B39397B39397B39FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42D6EBD6D4EAD4D2EAD2D0
      E9D0CEE8CECCE7CCCAE6CAC8E5C8C4E3C4BFE1BFBBDFBBB7DDB7B2DBB2AED9AE
      AAD7AAA6D5A6A1D3A19DD19D99CF9995CD95397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42D8ECD850AA504EA94E4CA84C4AA74A48A64846A54645
      A54543A44341A3413FA23F3DA13D3BA03B399F39389E38369D36349C34329B32
      309A3099CF99397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42DAED
      DA52AB5250AA504EA94E4CA84C4AA74A48A64846A54645A54543A44341A3413F
      A23F3DA13D3BA03B399F39389E38369D36349C34329B329DD19D397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42DCEEDC53AC5352AB5250AA504EA9
      4E4CA84C4AA74A48A64846A54645A54543A44341A3413FA23F3DA13D3BA03B39
      9F39389E38369D36349C34A1D3A1397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF429C42DEEFDE55AD5553AC5352AB5250AA504EA94E4CA84C4AA74A48A6
      4846A54645A545A5D6A5A5D6A53FA23F3DA13D3BA03B399F39389E38369D36A6
      D5A6397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42E1F0E158AE58
      56AD5654AC5452AB5250AA504EA94E4CA84C4AA74A48A648A5D6A5FFFFFFEFF7
      EF41A3413FA23F3DA13D3BA03B399F39389E38AAD7AA397B39FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF429C42E3F1E35AAF5A58AE5856AD5654AC5452AB52
      51AB514FAA4F4DA94DA5D6A5FFFFFFFFFFFFEFF7EF44A44442A34240A2403DA1
      3D3BA03B399F39AED9AE397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42
      9C42E4F2E45CB05C5AAF5A58AE5856AD5654AC5452AB5251AB51A5D6A5FFFFFF
      FFFFFFFFFFFFEFF7EF46A54644A44442A34240A2403EA13E3CA03CB5DCB5397B
      39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42E6F3E65EB15E5CB05C5A
      AF5A58AE5856AD5654AC54A5D6A5FFFFFFFFFFFFFFFFFFFFFFFFEFF7EF47A647
      46A54644A44442A34240A2403EA13EB9DEB9397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42E8F4E85FB25F5EB15E5CB05C5AAF5A58AE58A5D6A5FF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7EF49A74947A64746A54644A44442A342
      40A240BDE0BD397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42EAF5
      EA61B3615FB25F5EB15E5CB05C55AD55EFF7EFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFEFF7EF4BA84B49A74947A64746A54644A44442A342C1E2C1397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42ECF6EC65B56561B3615FB25F5EB1
      5E5CB05C55AD55FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFF7EF4DA94D4BA84B49
      A74947A64746A54644A444C6E4C6397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FF429C42EFF7EF6BB86B67B66763B46360B2605FB25F5DB15D55AD55FFFF
      FFFFFFFFFFFFFFFFFFFFEFF7EF4FAA4F4DA94D4BA84B49A74947A64746A546CA
      E6CA397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42F1F8F170BA70
      6BB86B67B66763B46360B2605FB25F5DB15D55AD55FFFFFFFFFFFFFFFFFFEFF7
      EF52AB5250AA504EA94E4CA84C4AA74A48A648CCE7CC397B39FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FF429C42F3F9F374BC7470BA706BB86B67B66763B463
      60B2605FB25F5DB15D55AD55FFFFFFFFFFFFEFF7EF53AC5352AB5250AA504EA9
      4E4CA84C4AA74ACEE8CE397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF42
      9C42F5FAF579BF7974BC7470BA706BB86B67B66763B46360B2605FB25F5DB15D
      55AD55FFFFFFEFF7EF55AD5553AC5352AB5250AA504EA94E4CA84CD0E9D0397B
      39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42F7FBF77DC17D79BF7974
      BC7470BA706BB86B67B66763B46360B2605FB25F5DB15D55AD55A4D5A457AE57
      55AD5553AC5352AB5250AA504EA94ED2EAD2397B39FF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF429C42F9FCF981C3817DC17D79BF7974BC7470BA706BB86B67
      B66763B46360B2605FB25F5DB15D5BB05B59AF5957AE5755AD5553AC5352AB52
      50AA50D4EAD4397B39FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF429C42FCFD
      FC88C68884C4847FC27F7BC07B76BD7672BB726EB96E67B66763B46360B2605F
      B25F5DB15D5BB05B59AF5957AE5755AD5553AC5352AB52D6EBD6397B39FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF429C42FDFEFDFCFDFCFAFCFAF8FBF8F6FA
      F6F4F9F4F2F9F2F0F8F0EEF7EEECF6ECEAF5EAE8F4E8E6F3E6E4F2E4E3F1E3E1
      F0E1DFEFDFDDEFDDDBEEDBD9EDD9397B39FF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF429C42429C42429C42429C42429C42429C42429C42429C42429C
      42429C42429C42429C42429C42429C42429C42429C42429C42429C42429C4242
      9C42FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 2
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 352
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Cancel'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000420B0000420B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE4002EE4002EE4FF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FF002EE40532F51B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002FFA002EE40532F51B48
      FB002EE4FF00FFFF00FFFF00FFFF00FF002EE4002EE4002EE4002EE4FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF002EE40532F51B48FB1B48FB002EE4FF00FFFF00FFFF00FFFF00
      FFFF00FF1B48FB1B48FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE40532F51B48FB
      1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB3E5E
      FF1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FF002EE40532F51B48FB1B48FB002EE4FF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF3E5EFF1B48FB0532F5002E
      E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF002EE40532F51B
      48FB1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF3E5EFF1B48FB3E5EFF1B48FB0532F5002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FF002FFA002EE40532F51B48FB1B48FB002EE4FF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      1B48FB3E5EFF1B48FB0532F5002EE4FF00FFFF00FFFF00FF002EE40532F51B48
      FB1B48FB1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB
      0532F5002EE4FF00FF002EE40532F51B48FB1B48FB1B48FB002EE4FF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB0532F5002EE40532F5
      1B48FB1B48FB1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FF1B48FB3E5EFF1B48FB1B48FB1B48FB1B48FB1B48FB002EE4FF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B
      48FB1B48FB1B48FB1B48FB002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB1B48FB1B48FB1B48FB05
      32F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48
      FB3E5EFF1B48FB1B48FB0532F5002EE41B48FB1B48FB0532F5002EE4FF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB1B48FB0532F5002E
      E4FF00FFFF00FF1B48FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      1B48FB3E5EFF1B48FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FF1B48
      FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB3E5EFF1B48FB1B48FB0532F5
      002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB0532F5002E
      E4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FF1B48FB3E5EFF1B48FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FF3E5EFF1B48FB0532F5002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB5B7AFF1B48FB1B48FB05
      32F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FF1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FF1B48FB6482FF1B48FB1B48FB0532F5002EE4FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB
      0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FF1B48FB6482FF1B48FB1B48
      FB0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF3E5EFF0532F5FF00FFFF00FF
      FF00FFFF00FFFF00FF1B48FB6C88FF1B48FB0532F5002EE4FF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB
      6C88FF0532F5002EE4FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FF1B48FB1B48FB002EE4FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 3
    OnClick = cxButton3Click
  end
end