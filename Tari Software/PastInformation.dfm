object PastInformationF: TPastInformationF
  Left = 492
  Top = 299
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Past Information'
  ClientHeight = 617
  ClientWidth = 821
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
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
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 87
    Width = 821
    Height = 475
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    Properties.HotTrack = True
    Properties.MultiLine = True
    Properties.Options = [pcoGoDialog, pcoNoArrows, pcoSort, pcoTopToBottomText]
    Properties.ScrollOpposite = True
    OnChange = cxPageControl1Change
    ClientRectBottom = 471
    ClientRectLeft = 4
    ClientRectRight = 817
    ClientRectTop = 32
    object cxTabSheet1: TcxTabSheet
      Caption = 'Past Profit and Loss Summary'
      ImageIndex = 0
      object cxLabel2: TcxLabel
        Left = 40
        Top = 72
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'Enter available financial summary for the business or department' +
          ' / revenue group.'#13#10#13#10'Expense Details may be entered by pressing ' +
          'the button.'#13#10
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 49
        Width = 465
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 8
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        Caption = 'Profit and Loss Information'
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
        Height = 25
        Width = 761
        AnchorX = 389
        AnchorY = 21
      end
      object cxButton2: TcxButton
        Left = 40
        Top = 376
        Width = 193
        Height = 41
        Caption = 'Enter Expenses Details'
        OptionsImage.Glyph.Data = {
          66090000424D660900000000000036000000280000001C0000001C0000000100
          18000000000030090000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          CF5700BD5000BD5000BD5000BD5000964000FF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBD5000BD5000BD5000BD
          5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000
          BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD5000BD50
          00BD5000BD5000FF00FFBF5000BE5000BD500096400096400096400096400096
          4000964000964000964000964000964000964000964000964000964000964000
          964000964000964000964000964000964000964000964000984000FF00FFC051
          00BF5000BE5000B0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0
          AEAEA29E9E989494A29E9EB0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0AEAEB0AEAE
          B0AEAEB0AEAE9640009640009A4100FF00FFC05100C05100D5D5D5C0BFBFC0BF
          BFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0
          BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBF964000
          9C4200FF00FFC15200C05100D5D5D5F4F4F3F1F1F0EEEEEDECECEBE9E9E8E4E4
          E4DDDDDDD5D5D5D2D2D2D5D5D5C0BFBFD2D2D2D9D9D9E0E0E0E8E8E7EAEAE9ED
          EDECF0F0EFF3F3F2F5F5F4FAFAF9C0BFBF9640009E4300FF00FFC35200C15200
          D5D5D5F8F8F7F5F5F4F3F3F2F0F0EFEDEDECEAEAE9E8E8E7E0E0E0D9D9D9D5D5
          D5C0BFBFD9D9D9E0E0E0E8E8E7EAEAE9EDEDECF0F0EFF3F3F2F5F5F4FAFAF9FC
          FCFBC0BFBF964000A04300FF00FFC45300C35200D5D5D5FBFBFAF8F8F7F5F5F4
          F3F3F2F0F0EFEDEDECEAEAE9C9C9C9E0E0E0D5D5D5C0BFBFE0E0E0C9C9C9EAEA
          E9EDEDECF0F0EFF3F3F2F5F5F4FAFAF9FCFCFBFEFEFDC0BFBF964000A34500FF
          00FFC55300C45300D5D5D5FEFEFDC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
          EAEAE9E8E8E7D5D5D5C0BFBFE8E8E7EAEAE9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
          C9C9C9C9C9C9C9FEFEFDC0BFBF964000A54500FF00FFC65300C55300D5D5D5FE
          FEFDFEFEFDFBFBFAF8F8F7F5F5F4F3F3F2F0F0EFEDEDECE8E8E7D5D5D5C0BFBF
          E8E8E7EDEDECF0F0EFF3F3F2F5F5F4FAFAF9FCFCFBFEFEFDFEFEFDFEFEFDC0BF
          BF964000A74600FF00FFC65400C65300D5D5D5FEFEFDFEFEFDFEFEFDFBFBFAF8
          F8F7F5F5F4ECECEBC9C9C9E8E8E7D5D5D5C0BFBFE8E8E7C9C9C9ECECEBF5F5F4
          FAFAF9FCFCFBFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000A94700FF00FFC754
          00C65400D5D5D5FEFEFDC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9ECECEBE8
          E8E7D5D5D5C0BFBFE8E8E7ECECEBC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9
          C9C9C9FEFEFDC0BFBF964000AB4800FF00FFC95500C85400D5D5D5FEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFBFBFAF8F8F7F5F5F4E8E8E7D5D5D5C0BFBFE8E8E7F5
          F5F4FAFAF9FCFCFBFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000
          AE4900FF00FFCA5500C95500D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDECECEBC9C9C9E8E8E7D5D5D5C0BFBFE8E8E7C9C9C9ECECEBFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000B04A00FF00FFCB5600CA5500
          D5D5D5FEFEFDC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9ECECEBE8E8E7D5D5
          D5C0BFBFE8E8E7ECECEBC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9FE
          FEFDC0BFBF964000B24B00FF00FFCC5600CB5600D5D5D5FEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDE8E8E7D5D5D5C0BFBFE8E8E7FEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000B44B00FF
          00FFCC5600CC5600D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDECECEB
          C9C9C9E8E8E7D5D5D5C0BFBFE8E8E7C9C9C9ECECEBFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDFEFEFDC0BFBF964000B44C00FF00FFCE5700CD5700D5D5D5FE
          FEFDC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9ECECEBE8E8E7D5D5D5C0BFBF
          E8E8E7ECECEBC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9FEFEFDC0BF
          BF964000B54C00FF00FFCF5700CE5700D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDE8E8E7D5D5D5C0BFBFE8E8E7FEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000B64D00FF00FFD058
          00CF5700D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDECECEBC9C9C9E8
          E8E7D5D5D5C0BFBFE8E8E7C9C9C9ECECEBFEFEFDFEFEFDFEFEFDFEFEFDFEFEFD
          FEFEFDFEFEFDC0BFBF964000B74D00FF00FFD15800D05800D5D5D5FEFEFDC9C9
          C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9ECECEBE8E8E7D5D5D5C0BFBFE8E8E7EC
          ECEBC9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9C9FEFEFDC0BFBF964000
          B84E00FF00FFD25900D15800D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFE
          FDFEFEFDFEFEFDE8E8E7D5D5D5C0BFBFE8E8E7FEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDFEFEFDFEFEFDFEFEFDFEFEFDC0BFBF964000B94E00FF00FFD35900D25900
          D5D5D5FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDE9E9E8C0BFBFC0BF
          BFC0BFBFC0BFBFE9E9E8FEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFEFEFDFE
          FEFDC0BFBF964000BA4E00FF00FFFF00FFFF00FFD5D5D5C0BFBFC0BFBFC0BFBF
          C0BFBFC0BFBFC0BFBFC0BFBFC0BFBFFF00FFFF00FFFF00FFFF00FFC0BFBFC0BF
          BFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFC0BFBFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF}
        TabOrder = 2
        OnClick = cxButton2Click
      end
      object cxPNLGrid1: TcxGrid
        Left = 40
        Top = 136
        Width = 715
        Height = 225
        TabOrder = 3
        object cxPNLGrid1TableView1: TcxGridTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.FocusCellOnTab = True
          OptionsBehavior.GoToNextCellOnEnter = True
          OptionsBehavior.FocusCellOnCycle = True
          OptionsView.ScrollBars = ssNone
          OptionsView.CellAutoHeight = True
          OptionsView.GroupByBox = False
          OptionsView.HeaderAutoHeight = True
          Styles.Header = cxStyle1
          object cxPNLGrid1TableView1Title: TcxGridColumn
            Caption = 'Account'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Vert = taVCenter
            Properties.AutoSelect = False
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 227
          end
          object cxPNLGrid1TableView1SubTitle: TcxGridColumn
            Tag = 1
            Caption = 'Explanation'
            PropertiesClassName = 'TcxTextEditProperties'
            Properties.Alignment.Horz = taLeftJustify
            Properties.Alignment.Vert = taVCenter
            Properties.AutoSelect = False
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.IncSearch = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 263
          end
          object cxPNLGrid1TableView1Amount: TcxGridColumn
            Tag = 2
            Caption = 'Amount'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0;(,0)'
            Properties.Nullable = False
            Properties.Nullstring = '0'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 139
          end
          object cxPNLGrid1TableView1percent: TcxGridColumn
            Tag = 3
            Caption = '% to Sales'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DisplayFormat = '0.00 %;(0.00) %'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 78
          end
        end
        object cxPNLGrid1Level1: TcxGridLevel
          GridView = cxPNLGrid1TableView1
        end
      end
      object cxLabel4: TcxLabel
        Left = 540
        Top = 102
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        ParentColor = False
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 25
        Width = 209
        AnchorX = 645
        AnchorY = 115
      end
      object cxButton1: TcxButton
        Left = 572
        Top = 70
        Width = 129
        Height = 25
        Caption = 'Past Periods'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF983000983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9830009830
          00FF00FFFF00FFFF00FFFF00FFFF00FF983000C16E3998300098300098300098
          3000983000983000983000983000C16E39983000FF00FFFF00FFFF00FF983000
          E8A977E8A977C16E39C16E39C16E39C16E39C16E39C16E39C16E39C16E39D583
          34C16E39983000FF00FF983000FBC4A1E8A977E8A977E8A977E8A977E8A977E5
          A46DE29E62DF9858DD934EDB8E46D8883DD58334C16E39983000FF00FFD76733
          FBC4A1E8A977FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4
          A1C16E39983000FF00FFFF00FFFF00FFD76733FBC4A1D76733D76733D76733D7
          6733D76733D76733D76733D76733E8A977983000FF00FFFF00FFFF00FFFF00FF
          FF00FFD76733D76733FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD767339830
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD76733FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 5
        OnClick = cxButton1Click
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Past Activity and Contribution'
      ImageIndex = 1
      OnExit = cxTabSheet2Exit
      OnShow = cxTabSheet2Show
      DesignSize = (
        813
        439)
      object HelpProdFTEBtn: TcxButton
        Left = 616
        Top = 176
        Width = 161
        Height = 38
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Production FTE'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C87FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF356C87356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04480A2FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C8735
          6C87356C873191C8356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4480A2356C874E9CC04E9CC04E9CC04E9CC03499D44E9CC0356C87FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04BAAD84EB5E84EB8EF44
          ABE43DA6E33AAAEB36A1DF3399D4356C87FF00FFFF00FFFF00FFFF00FF356C87
          4E9CC065C7EF66C7F163C6F15EC3F1132B3610283643B1F03AAAEC37A5E53399
          D4356C87FF00FFFF00FF4480A24E9CC071CEEE75D1F175D1F172D0F16CCCF134
          65792E61794EB8F141B0EF39A9EA37A3E33296D0356C87FF00FF356C8770C7E2
          80D8F184DAF183DAF180D9F179D4F16CC7E960C0E858BFF14AB6F03DAEEE38A6
          E736A0DE3381B34480A2356C8783D8ED8EE1F193E4F193E3F18EE1F184DBF159
          99AC3B708560C4F151BBF143B1F039A9E936A2E1358ABB356C87356C878DDEED
          9CE8F1A0ECF1A0ECF19AE8F18FE1F177C7DB26444D366C8354B7E947B4F03BAB
          ED37A3E33399D4356C87356C8789D6E3A1ECF1A3EEF2A2EDF195DBE081C6D085
          D9ED5696A902050633708E4AB6F03CACED37A5E5358ABB356C874480A261A7BE
          9FEAEFA3EEF2A3EEF24463650A10117AC7DA68B4CB0000001C42544AB6F03CAC
          ED36A1DF3381B34480A2FF00FF356C8765AAC09CE6ECA2EDF170A6AA23373A4B
          7D881F373D0F1E24408DB349B6F03AA5E33296D0356C87FF00FFFF00FFFF00FF
          4480A2356C877DC5D389D6E372B9CA62A7BB58A1BB53A7CA4FB0E03C97C8356C
          874480A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C87356C8735
          6C87356C87356C87356C874480A2FF00FFFF00FFFF00FFFF00FF}
        TabOrder = 39
        OnClick = HelpProdFTEBtnClick
      end
      object LA: TcxLabel
        Left = 24
        Top = 80
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'A'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 17
      end
      object Label11: TcxLabel
        Left = 56
        Top = 81
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Sales (Gross Revenue)'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object LB: TcxLabel
        Left = 24
        Top = 112
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'B'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 17
      end
      object Label12: TcxLabel
        Left = 56
        Top = 113
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Gross Profit (Contribution)'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 361
      end
      object LC: TcxLabel
        Left = 24
        Top = 144
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'C'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 12
      end
      object Label14: TcxLabel
        Left = 56
        Top = 145
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Full Time Equivalent (FTE) - Total Employees + Principals'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 361
      end
      object LD: TcxLabel
        Left = 24
        Top = 176
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'D'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 13
      end
      object Label13: TcxLabel
        Left = 56
        Top = 177
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Full Time Equivalent (FTE) - Production'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 337
      end
      object LE: TcxLabel
        Left = 24
        Top = 208
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'E'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 11
      end
      object Label18: TcxLabel
        Left = 56
        Top = 209
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Potential Units'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object LF: TcxLabel
        Left = 24
        Top = 240
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'F'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 11
      end
      object Label15: TcxLabel
        Left = 56
        Top = 241
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'D'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 345
      end
      object LG: TcxLabel
        Left = 24
        Top = 272
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'G'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 13
      end
      object Label19: TcxLabel
        Left = 56
        Top = 273
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = '% Activity Level = F / C'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 337
      end
      object LH: TcxLabel
        Left = 24
        Top = 304
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        Caption = 'H'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Width = 13
      end
      object Label16: TcxLabel
        Left = 56
        Top = 305
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'E'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object LI: TcxLabel
        Left = 24
        Top = 336
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'I'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 10
      end
      object Label17: TcxLabel
        Left = 56
        Top = 337
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'E'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object Label36: TcxLabel
        Left = 56
        Top = 369
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Sales per FTE'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object Label37: TcxLabel
        Left = 56
        Top = 401
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Gross Profit per FTE'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 353
      end
      object cxLabel5: TcxLabel
        Left = 3
        Top = 0
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        Caption = 'Activity and Contribution Drivers'
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
        Height = 25
        Width = 761
        AnchorX = 384
        AnchorY = 13
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 40
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'To obtain the contribution per unit of key activity, please comp' +
          'lete the following:'
        ParentColor = False
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Transparent = True
        Height = 34
        Width = 417
      end
      object ActivityPastSales: TcxCurrencyEdit
        Left = 440
        Top = 80
        TabStop = False
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 11
        Width = 121
      end
      object ActivityPastGP: TcxCurrencyEdit
        Left = 440
        Top = 112
        TabStop = False
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 12
        Width = 121
      end
      object PastFTE: TcxCurrencyEdit
        Left = 440
        Top = 144
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 13
        OnExit = PastFTEExit
        Width = 121
      end
      object PastFTEProduction: TcxCurrencyEdit
        Left = 440
        Top = 176
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 14
        OnExit = PastFTEProductionExit
        Width = 121
      end
      object PastPotUnits: TcxCurrencyEdit
        Left = 440
        Top = 208
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 15
        OnExit = PastPotUnitsExit
        Width = 121
      end
      object PastUnitsSold: TcxCurrencyEdit
        Left = 440
        Top = 240
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 16
        OnExit = PastUnitsSoldExit
        Width = 121
      end
      object PastProd: TcxCurrencyEdit
        Left = 440
        Top = 272
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '0.00 %;(0.00) %'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 17
        OnExit = PastProdExit
        Width = 121
      end
      object PastSaleUnit: TcxCurrencyEdit
        Left = 440
        Top = 304
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 18
        OnExit = PastSaleUnitExit
        Width = 121
      end
      object PastGPUnit: TcxCurrencyEdit
        Left = 440
        Top = 336
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.Nullable = False
        Properties.Nullstring = '0'
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 19
        OnExit = PastGPUnitExit
        Width = 121
      end
      object PastSalesFTE: TcxCurrencyEdit
        Left = 440
        Top = 368
        TabStop = False
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 20
        Width = 121
      end
      object PastGPFTE: TcxCurrencyEdit
        Left = 440
        Top = 400
        TabStop = False
        EditValue = 0c
        ParentFont = False
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        Style.IsFontAssigned = True
        TabOrder = 21
        Width = 121
      end
      object HoursperdayLbl: TcxLabel
        Left = 624
        Top = 272
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.StyleController = DMRep1.cxEditStyleLabelExtraLarge
        Style.IsFontAssigned = True
        Transparent = True
        Height = 49
        Width = 145
      end
      object HelpTotalFteBtn: TcxButton
        Left = 616
        Top = 144
        Width = 161
        Height = 38
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Total FTE'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C87FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF356C87356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04480A2FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C8735
          6C87356C873191C8356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4480A2356C874E9CC04E9CC04E9CC04E9CC03499D44E9CC0356C87FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04BAAD84EB5E84EB8EF44
          ABE43DA6E33AAAEB36A1DF3399D4356C87FF00FFFF00FFFF00FFFF00FF356C87
          4E9CC065C7EF66C7F163C6F15EC3F1132B3610283643B1F03AAAEC37A5E53399
          D4356C87FF00FFFF00FF4480A24E9CC071CEEE75D1F175D1F172D0F16CCCF134
          65792E61794EB8F141B0EF39A9EA37A3E33296D0356C87FF00FF356C8770C7E2
          80D8F184DAF183DAF180D9F179D4F16CC7E960C0E858BFF14AB6F03DAEEE38A6
          E736A0DE3381B34480A2356C8783D8ED8EE1F193E4F193E3F18EE1F184DBF159
          99AC3B708560C4F151BBF143B1F039A9E936A2E1358ABB356C87356C878DDEED
          9CE8F1A0ECF1A0ECF19AE8F18FE1F177C7DB26444D366C8354B7E947B4F03BAB
          ED37A3E33399D4356C87356C8789D6E3A1ECF1A3EEF2A2EDF195DBE081C6D085
          D9ED5696A902050633708E4AB6F03CACED37A5E5358ABB356C874480A261A7BE
          9FEAEFA3EEF2A3EEF24463650A10117AC7DA68B4CB0000001C42544AB6F03CAC
          ED36A1DF3381B34480A2FF00FF356C8765AAC09CE6ECA2EDF170A6AA23373A4B
          7D881F373D0F1E24408DB349B6F03AA5E33296D0356C87FF00FFFF00FFFF00FF
          4480A2356C877DC5D389D6E372B9CA62A7BB58A1BB53A7CA4FB0E03C97C8356C
          874480A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C87356C8735
          6C87356C87356C87356C874480A2FF00FFFF00FFFF00FFFF00FF}
        TabOrder = 23
        OnClick = HelpTotalFteBtnClick
      end
      object HelpPotentialUnitsBtn: TcxButton
        Left = 616
        Top = 176
        Width = 161
        Height = 38
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Potential Units'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C87FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF356C87356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04480A2FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C8735
          6C87356C873191C8356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4480A2356C874E9CC04E9CC04E9CC04E9CC03499D44E9CC0356C87FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04BAAD84EB5E84EB8EF44
          ABE43DA6E33AAAEB36A1DF3399D4356C87FF00FFFF00FFFF00FFFF00FF356C87
          4E9CC065C7EF66C7F163C6F15EC3F1132B3610283643B1F03AAAEC37A5E53399
          D4356C87FF00FFFF00FF4480A24E9CC071CEEE75D1F175D1F172D0F16CCCF134
          65792E61794EB8F141B0EF39A9EA37A3E33296D0356C87FF00FF356C8770C7E2
          80D8F184DAF183DAF180D9F179D4F16CC7E960C0E858BFF14AB6F03DAEEE38A6
          E736A0DE3381B34480A2356C8783D8ED8EE1F193E4F193E3F18EE1F184DBF159
          99AC3B708560C4F151BBF143B1F039A9E936A2E1358ABB356C87356C878DDEED
          9CE8F1A0ECF1A0ECF19AE8F18FE1F177C7DB26444D366C8354B7E947B4F03BAB
          ED37A3E33399D4356C87356C8789D6E3A1ECF1A3EEF2A2EDF195DBE081C6D085
          D9ED5696A902050633708E4AB6F03CACED37A5E5358ABB356C874480A261A7BE
          9FEAEFA3EEF2A3EEF24463650A10117AC7DA68B4CB0000001C42544AB6F03CAC
          ED36A1DF3381B34480A2FF00FF356C8765AAC09CE6ECA2EDF170A6AA23373A4B
          7D881F373D0F1E24408DB349B6F03AA5E33296D0356C87FF00FFFF00FFFF00FF
          4480A2356C877DC5D389D6E372B9CA62A7BB58A1BB53A7CA4FB0E03C97C8356C
          874480A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C87356C8735
          6C87356C87356C87356C874480A2FF00FFFF00FFFF00FFFF00FF}
        TabOrder = 24
        OnClick = HelpPotentialUnitsBtnClick
      end
      object HelpPotentialHoursBtn: TcxButton
        Left = 616
        Top = 208
        Width = 161
        Height = 38
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Potential Hours'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000430B0000430B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C87FF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FF356C87356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04480A2FF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C8735
          6C87356C873191C8356C87FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF4480A2356C874E9CC04E9CC04E9CC04E9CC03499D44E9CC0356C87FF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FF356C874E9CC04BAAD84EB5E84EB8EF44
          ABE43DA6E33AAAEB36A1DF3399D4356C87FF00FFFF00FFFF00FFFF00FF356C87
          4E9CC065C7EF66C7F163C6F15EC3F1132B3610283643B1F03AAAEC37A5E53399
          D4356C87FF00FFFF00FF4480A24E9CC071CEEE75D1F175D1F172D0F16CCCF134
          65792E61794EB8F141B0EF39A9EA37A3E33296D0356C87FF00FF356C8770C7E2
          80D8F184DAF183DAF180D9F179D4F16CC7E960C0E858BFF14AB6F03DAEEE38A6
          E736A0DE3381B34480A2356C8783D8ED8EE1F193E4F193E3F18EE1F184DBF159
          99AC3B708560C4F151BBF143B1F039A9E936A2E1358ABB356C87356C878DDEED
          9CE8F1A0ECF1A0ECF19AE8F18FE1F177C7DB26444D366C8354B7E947B4F03BAB
          ED37A3E33399D4356C87356C8789D6E3A1ECF1A3EEF2A2EDF195DBE081C6D085
          D9ED5696A902050633708E4AB6F03CACED37A5E5358ABB356C874480A261A7BE
          9FEAEFA3EEF2A3EEF24463650A10117AC7DA68B4CB0000001C42544AB6F03CAC
          ED36A1DF3381B34480A2FF00FF356C8765AAC09CE6ECA2EDF170A6AA23373A4B
          7D881F373D0F1E24408DB349B6F03AA5E33296D0356C87FF00FFFF00FFFF00FF
          4480A2356C877DC5D389D6E372B9CA62A7BB58A1BB53A7CA4FB0E03C97C8356C
          874480A2FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4480A2356C87356C8735
          6C87356C87356C87356C874480A2FF00FFFF00FFFF00FFFF00FF}
        TabOrder = 25
        OnClick = HelpPotentialHoursBtnClick
      end
      object cxGroupBox1: TcxGroupBox
        Left = 616
        Top = 336
        Alignment = alTopCenter
        Caption = 'Help - Actual Hours'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        TabOrder = 26
        Height = 97
        Width = 161
        object WorkBackBtn: TcxButton
          Left = 8
          Top = 60
          Width = 145
          Height = 25
          Caption = 'Work Back Analysis'
          OptionsImage.Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000530B0000530B00000000000000000000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFC8B3A469473169473169473169473169473169473100
            6090694731694731694731694731694731694731694731694731C8B3A4F1ECEA
            B7A293B7A293B7A293B7A293B7A29381ADB9006090B7A293B7A293B7A293B7A2
            93B7A293B7A293694731C8B3A4C08068986060C8B3A4FFFFFFFFFFFFFFFFFFC8
            B3A481ADB9006090FFFFFFC8B3A4FFFFFFFFFFFFFFFFFF694731C8B3A4C89890
            C08068C8B3A4FFFFFFFFFFFFFFFFFFC8B3A481ADB9D2F2FD006090C8B3A4FFFF
            FFFFFFFFFFFFFF694731C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8B3A4C8
            B3A4C8B3A481ADB996D4FB006090C8B3A4C8B3A4C8B3A4694731C8B3A4C08068
            986060C8B3A4FFFFFFFFFFFFFFFFFFC8B3A4FFFFFF81ADB9D2F2FD00C8F80060
            90FFFFFFFFFFFF694731C8B3A4C89890C08068C8B3A4FFFFFFFFFFFF00609000
            6090006090006090FFFFFFD2F2FD00C8F8006090FFFFFF694731C8B3A4C8B3A4
            C8B3A4C8B3A4C8B3A4C8B3A4C8B3A481ADB900C8F800C8F800C8F8FFFFFFD2F2
            FD00C8F8006090694731C8B3A4C08068986060C8B3A4FFFFFFFFFFFFFFFFFF81
            ADB9D2F2FDFFFFFFFFFFFF00C8F800C8F800C8F800C8F8006090C8B3A4C89890
            C08068C8B3A4FFFFFFFFFFFFFFFFFFC8B3A481ADB9FFFFFFFFFFFF00C8F80060
            90006090006090006090C86000C86000C86000C86000C86000C86000C86000C8
            600081ADB9D2F2FDFFFFFFC3E0FC00C8F8006090C86000C86000C86000F8B555
            F8A424C86000F8B555F8A424F89800C86000F8B55581ADB9FFFFFFF1FBFEBBEC
            FC00C8F8006090C86000C86000C86000C86000C86000C86000C86000C86000C8
            6000C8600081ADB9006890006390006090006090006090C86000FF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 0
          OnClick = WorkBackBtnClick
        end
        object PastInvoicesBn: TcxButton
          Left = 8
          Top = 28
          Width = 145
          Height = 25
          Caption = 'Invoice Analysis'
          OptionsImage.Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            18000000000000030000720B0000720B00000000000000000000FF00FFB7A293
            6947316947316947316947316947316947316947316947316947316947316947
            31694731694731FF00FFFF00FFB7A293F2ECE8B7A293B7A293B7A293B7A293B7
            A293B7A293B7A293B7A293B7A293B7A293B7A293694731FF00FFFF00FFB7A293
            F5F0EDF2ECE8EFE8E3EDE4DFEAE0DAE7DBD5E4D7D0E2D3CBDFCFC6DCCBC1DBC9
            BFB7A293694731FF00FFFF00FFB7A293F7F4F1F5F0EDF2ECE8EFE8E3BE713CBE
            713CBE713CBE713CBE713CBE713CDCCBC1B7A293694731FF00FFFF00FFB7A293
            FAF8F6F7F4F1F5F0EDF2ECE8BE713CEDE4DFEAE0DAE7DBD5E4D7D0BE713CDFCF
            C6B7A293694731FF00FFFF00FFB7A293FDFCFBBE713CBE713CBE713CBE713CEF
            E8E3BE713CBE713CE7DBD5BE713CE2D3CBB7A293694731FF00FFFF00FFB7A293
            FFFFFFBE713CFCFAF9F9F6F4F6F2EFF3EEEAF1EAE6EDE4DFEAE0DABE713CE4D7
            D0B7A293694731FF00FFFF00FFB7A293FFFFFFBE713CFEFEFDBE713CBE713CF6
            F2EFBE713CBE713CEEE6E1BE713CE9DED8B7A293694731FF00FFFF00FFB7A293
            FFFFFFBE713CFFFFFFFEFEFDFCFAF9F9F6F4F6F2EFF3EEEAF1EAE6BE713CEBE2
            DDB7A293694731FF00FFFF00FFB7A293FFFFFFBE713CFFFFFFBE713CBE713CFC
            FAF9BE713CBE713CF3EEEABE713CEEE6E1B7A293694731FF00FFFF00FFB7A293
            FFFFFFBE713CFFFFFFFFFFFFFFFFFFFEFEFDFCFAF9F9F6F4F6F2EFBE713CF1EA
            E6B7A293694731FF00FFFF00FFB7A293FFFFFFBE713CBE713CBE713CBE713CBE
            713CBE713CBE713CBE713CBE713CF3EEEAB7A293694731FF00FFFF00FFB7A293
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCFAF9F9F6F4F6F2
            EFB7A293694731FF00FFFF00FFB7A293FFFFFFBE713CBE713CBE713CBE713CFF
            FFFFFFFFFFBE713CBE713CBE713CFAF8F6B7A293694731FF00FFFF00FFB7A293
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDFC
            FBFAF8F6694731FF00FFFF00FFB7A293B7A293B7A293B7A293B7A293B7A293B7
            A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293FF00FF}
          TabOrder = 1
          OnClick = PastInvoicesBnClick
        end
      end
      object cxLabel7: TcxLabel
        Left = 416
        Top = 56
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        ParentColor = False
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        Transparent = True
        Height = 17
        Width = 169
        AnchorX = 501
        AnchorY = 65
      end
      object cxButton3: TcxButton
        Left = 455
        Top = 25
        Width = 106
        Height = 25
        Caption = 'Past Periods'
        OptionsImage.Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FF983000983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF9830009830
          00FF00FFFF00FFFF00FFFF00FFFF00FF983000C16E3998300098300098300098
          3000983000983000983000983000C16E39983000FF00FFFF00FFFF00FF983000
          E8A977E8A977C16E39C16E39C16E39C16E39C16E39C16E39C16E39C16E39D583
          34C16E39983000FF00FF983000FBC4A1E8A977E8A977E8A977E8A977E8A977E5
          A46DE29E62DF9858DD934EDB8E46D8883DD58334C16E39983000FF00FFD76733
          FBC4A1E8A977FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4A1FBC4
          A1C16E39983000FF00FFFF00FFFF00FFD76733FBC4A1D76733D76733D76733D7
          6733D76733D76733D76733D76733E8A977983000FF00FFFF00FFFF00FFFF00FF
          FF00FFD76733D76733FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD767339830
          00FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFD76733FF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FF983000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
        TabOrder = 40
        OnClick = cxButton1Click
      end
    end
  end
  object NextFinishBtn: TcxButton
    Left = 696
    Top = 568
    Width = 90
    Height = 41
    Caption = 'Next'
    TabOrder = 1
    OnClick = NextFinishBtnClick
  end
  object PrevBtn: TcxButton
    Left = 576
    Top = 568
    Width = 90
    Height = 41
    Caption = 'Prev'
    TabOrder = 2
    OnClick = PrevBtnClick
  end
  object CancelBtn: TcxButton
    Left = 456
    Top = 568
    Width = 90
    Height = 41
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object cxLabel15: TcxLabel
    Left = 16
    Top = 12
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    Caption = 'Business / Branch'
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
    Width = 124
  end
  object cxLabel14: TcxLabel
    Left = 16
    Top = 53
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
  object cxDBLabel4: TcxDBLabel
    Left = 248
    Top = 8
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
    Width = 511
    AnchorY = 23
  end
  object cxDBLabel3: TcxDBLabel
    Left = 248
    Top = 48
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
    AnchorY = 65
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
