object TargetingProfitF: TTargetingProfitF
  Left = 454
  Top = 213
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Past Information'
  ClientHeight = 633
  ClientWidth = 812
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 87
    Width = 812
    Height = 476
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
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
    ClientRectBottom = 472
    ClientRectLeft = 4
    ClientRectRight = 808
    ClientRectTop = 29
    object cxTabSheet1: TcxTabSheet
      Caption = 'Target Profit and Expenses'
      ImageIndex = 0
      OnShow = cxTabSheet1Show
      object cxLabel2: TcxLabel
        Left = 3
        Top = 39
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'Enter/Edit this financial summary for the business or department' +
          ' / revenue group.'#13#10#13#10'Expense Details may be entered by pressing ' +
          'the button.'#13#10
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
        Height = 82
        Width = 574
      end
      object cxLabel3: TcxLabel
        Left = 8
        Top = 8
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        Caption = 'Target Profit and Loss Information'
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
      object cxPNLGrid1: TcxGrid
        Tag = 4
        Left = 3
        Top = 136
        Width = 795
        Height = 243
        TabOrder = 2
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
          Styles.Header = DMRep1.cxStyle476
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
            Width = 187
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
            Width = 229
          end
          object ColPastAmount: TcxGridColumn
            Tag = 2
            Caption = 'Past Period'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0;(,0)'
            Properties.Nullable = False
            Properties.Nullstring = '0'
            Properties.ReadOnly = True
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 130
          end
          object cxPNLGrid1TableView1PastPC: TcxGridColumn
            Tag = 3
            Caption = '% to Sales'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.AutoSelect = False
            Properties.DisplayFormat = '0.00 %;(0.00) %'
            Properties.Nullable = False
            Properties.Nullstring = '0'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
          end
          object ColTarget: TcxGridColumn
            Tag = 4
            Caption = 'Target Period'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.DecimalPlaces = 0
            Properties.DisplayFormat = ',0;(,0)'
            Properties.Nullable = False
            Properties.Nullstring = '0'
            Properties.ReadOnly = False
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Filtering = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 119
          end
          object cxPNLGrid1TableView1TargetPC: TcxGridColumn
            Tag = 5
            Caption = '% to Sales'
            PropertiesClassName = 'TcxCurrencyEditProperties'
            Properties.Alignment.Horz = taRightJustify
            Properties.Alignment.Vert = taVCenter
            Properties.AutoSelect = False
            Properties.DisplayFormat = '0.00 %;(0.00) %'
            Properties.Nullable = False
            Properties.Nullstring = '0'
            HeaderAlignmentHorz = taCenter
            HeaderAlignmentVert = vaCenter
            Options.Editing = False
            Options.Filtering = False
            Options.Focusing = False
            Options.Grouping = False
            Options.Sorting = False
            Width = 63
          end
        end
        object cxPNLGrid1Level1: TcxGridLevel
          GridView = cxPNLGrid1TableView1
        end
      end
      object cxButton1: TcxButton
        Left = 424
        Top = 96
        Width = 121
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
        TabOrder = 3
        OnClick = cxButton1Click
      end
      object TargetExpensesBtn: TcxButton
        Left = 3
        Top = 390
        Width = 161
        Height = 41
        Caption = 'Target Expenses'
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
        TabOrder = 4
        OnClick = TargetExpensesBtnClick
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Target Activity and Contribution'
      ImageIndex = 1
      OnExit = cxTabSheet2Exit
      OnShow = cxTabSheet2Show
      DesignSize = (
        804
        443)
      object HelpProdFTEBtn: TcxButton
        Left = 640
        Top = 168
        Width = 153
        Height = 42
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Production FTE'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        Left = 8
        Top = 72
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
        Height = 22
        Width = 17
      end
      object Label11: TcxLabel
        Left = 40
        Top = 73
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
        Height = 22
        Width = 257
      end
      object LB: TcxLabel
        Left = 8
        Top = 104
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
        Height = 22
        Width = 17
      end
      object Label12: TcxLabel
        Left = 40
        Top = 105
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
        Height = 22
        Width = 265
      end
      object LC: TcxLabel
        Left = 8
        Top = 136
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
        Left = 40
        Top = 137
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Total Full Time Equivalent (FTE) '
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
        Height = 22
        Width = 265
      end
      object LD: TcxLabel
        Left = 8
        Top = 168
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
        Left = 40
        Top = 169
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
        Height = 22
        Width = 273
      end
      object LE: TcxLabel
        Left = 8
        Top = 200
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
        Left = 40
        Top = 201
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
        Height = 22
        Width = 280
      end
      object LF: TcxLabel
        Left = 8
        Top = 232
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
        Left = 40
        Top = 233
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
        Height = 22
        Width = 280
      end
      object LG: TcxLabel
        Left = 8
        Top = 264
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
        Left = 40
        Top = 265
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
        Height = 22
        Width = 273
      end
      object LH: TcxLabel
        Left = 8
        Top = 296
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
        Left = 40
        Top = 297
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
        Height = 22
        Width = 280
      end
      object LI: TcxLabel
        Left = 8
        Top = 328
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
        Height = 22
        Width = 10
      end
      object Label17: TcxLabel
        Left = 40
        Top = 329
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
        Height = 22
        Width = 280
      end
      object Label36: TcxLabel
        Left = 40
        Top = 361
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
        Height = 22
        Width = 289
      end
      object Label37: TcxLabel
        Left = 40
        Top = 393
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
        Height = 22
        Width = 281
      end
      object cxLabel5: TcxLabel
        Left = 8
        Top = 0
        RepositoryItem = DMRep1.LabelCentredNoWrap
        AutoSize = False
        Caption = 'Targeting Activity and Contribution'
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
        Height = 25
        Width = 761
        AnchorX = 389
        AnchorY = 13
      end
      object cxLabel6: TcxLabel
        Left = 8
        Top = 24
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'To start, use past information or guesstimate some starting info' +
          'rmation for targets'#13#10
        ParentColor = False
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Transparent = True
        Height = 42
        Width = 313
      end
      object ActivityPastSales: TcxCurrencyEdit
        Left = 328
        Top = 72
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 2
        Width = 121
      end
      object ActivityPastGP: TcxCurrencyEdit
        Left = 328
        Top = 104
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 3
        Width = 121
      end
      object PastFTE: TcxCurrencyEdit
        Left = 328
        Top = 136
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 4
        Width = 121
      end
      object PastFTEProduction: TcxCurrencyEdit
        Left = 328
        Top = 168
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 5
        Width = 121
      end
      object PastPotUnits: TcxCurrencyEdit
        Left = 328
        Top = 200
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 6
        Width = 121
      end
      object PastUnitsSold: TcxCurrencyEdit
        Left = 328
        Top = 232
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 7
        Width = 121
      end
      object PastProd: TcxCurrencyEdit
        Left = 328
        Top = 264
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = '0.00 %;(0.00) %'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 8
        Width = 121
      end
      object PastSaleUnit: TcxCurrencyEdit
        Left = 328
        Top = 296
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 9
        Width = 121
      end
      object PastGPUnit: TcxCurrencyEdit
        Left = 328
        Top = 328
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.AutoSelect = False
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = True
        Properties.UseThousandSeparator = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 10
        Width = 121
      end
      object PastSalesFTE: TcxCurrencyEdit
        Left = 328
        Top = 360
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 11
        Width = 121
      end
      object PastGPFTE: TcxCurrencyEdit
        Left = 328
        Top = 392
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 12
        Width = 121
      end
      object HoursperdayLbl: TcxLabel
        Left = 640
        Top = 264
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.StyleController = DMRep1.cxEditStyleLabelExtraLarge
        Style.IsFontAssigned = True
        Transparent = True
        Height = 57
        Width = 153
      end
      object HelpTotalFteBtn: TcxButton
        Left = 640
        Top = 128
        Width = 153
        Height = 42
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Total FTE'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        TabOrder = 14
        OnClick = HelpTotalFteBtnClick
      end
      object HelpPotentialUnitsBtn: TcxButton
        Left = 640
        Top = 168
        Width = 153
        Height = 42
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Potential Units'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        TabOrder = 15
        OnClick = HelpPotentialUnitsBtnClick
      end
      object HelpPotentialHoursBtn: TcxButton
        Left = 640
        Top = 208
        Width = 153
        Height = 42
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Help - Potential Hours'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
        TabOrder = 16
        OnClick = HelpPotentialHoursBtnClick
      end
      object cxGroupBox1: TcxGroupBox
        Left = 640
        Top = 352
        Alignment = alTopCenter
        Caption = 'Help - Actual Hours'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        TabOrder = 17
        Height = 57
        Width = 153
        object PastInvoicesBn: TcxButton
          Left = 4
          Top = 28
          Width = 145
          Height = 25
          Caption = 'Invoice Analysis'
          LookAndFeel.Kind = lfUltraFlat
          LookAndFeel.NativeStyle = False
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
          TabOrder = 0
          OnClick = PastInvoicesBnClick
        end
      end
      object cxLabel7: TcxLabel
        Left = 304
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
        Width = 161
        AnchorX = 385
        AnchorY = 65
      end
      object cxButton3: TcxButton
        Left = 327
        Top = 32
        Width = 123
        Height = 25
        Caption = 'Past Periods'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
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
      object ActivityPlanSales: TcxCurrencyEdit
        Left = 472
        Top = 72
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 41
        Width = 121
      end
      object ActivityPlanGP: TcxCurrencyEdit
        Left = 472
        Top = 104
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 42
        Width = 121
      end
      object PlanFTE: TcxCurrencyEdit
        Left = 472
        Top = 136
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 43
        OnExit = PlanFTEExit
        Width = 121
      end
      object PlanFTEProduction: TcxCurrencyEdit
        Left = 472
        Top = 168
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 44
        OnExit = PlanFTEProductionExit
        Width = 121
      end
      object PlanPotUnits: TcxCurrencyEdit
        Left = 472
        Top = 200
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 45
        OnExit = PlanPotUnitsExit
        Width = 121
      end
      object PlanBilledUnits: TcxCurrencyEdit
        Left = 472
        Top = 232
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = ',0.00;(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 46
        OnExit = PlanBilledUnitsExit
        Width = 121
      end
      object PlanProd: TcxCurrencyEdit
        Left = 472
        Top = 264
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '0.00 %;(0.00) %'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 47
        OnExit = PlanProdExit
        Width = 121
      end
      object PlanSalesUnit: TcxCurrencyEdit
        Left = 472
        Top = 296
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 48
        OnExit = PlanSalesUnitExit
        Width = 121
      end
      object PlanGPUnit: TcxCurrencyEdit
        Left = 472
        Top = 328
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.ChangeEnterToTab = True
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.HideSelection = False
        Properties.ReadOnly = False
        Properties.UseThousandSeparator = True
        Style.Color = clWindow
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 49
        OnExit = PlanGPUnitExit
        Width = 121
      end
      object PlanSalesFTE: TcxCurrencyEdit
        Left = 472
        Top = 360
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 50
        Width = 121
      end
      object PlanGPFTE: TcxCurrencyEdit
        Left = 472
        Top = 392
        TabStop = False
        EditValue = 0c
        Properties.Alignment.Horz = taRightJustify
        Properties.Alignment.Vert = taVCenter
        Properties.DisplayFormat = '$,0.00;$(,0.00)'
        Properties.ReadOnly = True
        Style.Color = 49217450
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.Shadow = False
        Style.StyleController = DMRep1.CurrencyEditStyle
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        TabOrder = 51
        Width = 121
      end
      object cxButton2: TcxButton
        Left = 640
        Top = 8
        Width = 153
        Height = 105
        Caption = 'Targeting Details'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = False
        OptionsImage.Glyph.Data = {
          F64E0000424DF64E000000000000360000002800000048000000460000000100
          200000000000C04E0000000000000000000000000000000000000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC
          16000CCC16000CCC16000CCC16000CCC16000CCC16000CCC160012CD220012CD
          220012CD22000FD023000ED223000FD023000ED223000ED2230012CD220012CD
          220012CD220012CD220012CD220012CD220012CD220012CD220012CD220012CD
          22000FD022000ED223000DD4230011CF22000FD0230012CD220012CD220012CD
          220012CD220012CD220012CD220012CD220012CD220012CD220012CD22000ED3
          23000FD123000FD123000FD123000ED323000FD0220012CD220012CD220012CD
          220012CD220012CD220012CD220012CD220012CD220012CD220012CD22000ED3
          23000FD022000CD423000FD022000FD0230012CD220012CD220012CD220012CD
          220012CD220012CD220012CD220012CD22000FD1230012CD22000FD023000ED1
          23000DD423000FD0230012CD220012CD220012CD220012CD220016D02A0016D0
          2A0015D22A0025BA260036A3220020C3270037A1200035A7220012D72B0018D0
          2A0016D02A0016D02A0016D02A0016D02A0016D02A0016D02A0018D02A0012D5
          2B0022C2280031A822003C991E0018D02A0028BA260014D42B0018D02A0016D0
          2A0016D02A0016D02A0016D02A0016D02A0016D02A0018D02A0012D72C003C97
          1E0029B5240027B7260027B72600399F1F0026BB270015D32A0016D02A0016D0
          2A0016D02A0016D02A0016D02A0016D02A0016D02A0018D02A0011D72C003F95
          1E001CC92900448C1C0020C4280029B7260013D52B0018D02A0016D02A0016D0
          2A0016D02A0016D02A0016D02A0015D32B002EB024000DDD2E0027BA26002BB4
          24003E941D0025BD260015D32A0016D02A0016D02A0016D02A001BD132001CD1
          320011E03500498D220038A327004691230029BB2C005F64160013DE35001CD1
          32001BD132001BD132001BD132001BD132001BD132001BD132001CD132000DE4
          3700704E12003BA5280057781C00478E20006560150018D534001BD232001BD1
          32001BD132001BD132001BD132001BD132001BD132001CD1320014DB3500449A
          250039A1270058731B004790220057741A0026C32E001AD433001BD132001BD1
          32001BD132001BD132001BD132001BD132001BD132001BD1320019D634002CBB
          2C0050871F00773D0D004A891F0050831D0013DD36001CD132001BD132001BD1
          32001BD132001BD132001BD1320018D73400478E220029BD2E00527A1C005181
          1E00547E1D00468F220016D734001BD132001BD132001BD132001FD33A001FD3
          3A001ED53B0030B93400429E2B0015E13D0015E03D0034B431001DD63B001FD3
          3A001FD33A001FD33A001FD33A001FD33A001FD33A001FD33A0020D23A0019DE
          3D003BA32C0034B5320014E23D001ADB3B0016DF3D001FD43A001FD33A001FD3
          3A001FD33A001FD33A001FD33A001FD33A001FD33A0020D33A001ADA3C004794
          280037AF310014E23E0019DC3B0018DE3C001DD63B0020D33A001FD33A001FD3
          3A001FD33A001FD33A001FD33A001FD33A001FD33A001FD33A001FD43A0023CF
          39002BC0350012E53E0019DD3C0018DD3C0020D23A001FD33A001FD33A001FD3
          3A001FD33A001FD33A001FD33A001DD53B0032B833004D8A250012E63E0012E4
          3E0034B2310018DF3C0020D33A001FD33A001FD33A001FD33A0024D4420024D4
          420024D4420022D6420018E7470022D843001EDE450022D7420024D4420024D4
          420024D4420024D4420024D4420024D4420024D4420024D4420024D4420024D4
          400020D8430019E446001DDE45001AE4470024D4420024D4420024D4420024D4
          420024D4420024D4420024D4420024D4420024D4420024D4420024D442001FDA
          43001BE145001DDF45001EDE450025D3400024D4420024D4420024D4420024D4
          420024D4420024D4420024D4420024D4420024D4420024D4420024D4420023D4
          420019E4470023D643001DDE450024D4420024D4420024D4420024D4420024D4
          420024D4420024D4420024D4420024D4420022D743001DDE440018E749001FDC
          44001AE4460024D3400024D4420024D4420024D4420024D4420028D6490028D6
          490029D6490023E14D004E93350039B73F005092320024DE4C0028D6490028D6
          490028D6490028D6490028D6490028D6490028D6490028D6490028D6490029D6
          490023E04C004A9C3700538C30006170270028D64A0028D7490028D6490028D6
          490028D6490028D6490028D6490028D6490028D6490028D6490028D6490025DB
          4B003EB03D00509333004A9B350020E44F0029D5490028D6490028D6490028D6
          490028D6490028D6490028D6490028D6490028D6490028D6490028D6490026DB
          4B0056872F002ECD4700508F310025DD4B0028D6490028D6490028D6490028D6
          490028D6490028D6490028D6490028D6490027D84A002CD049006E571E0042A7
          3A005488300020E34E0029D6490028D6490028D6490028D649002CD651002CD6
          51002ED6510026E45500646C26003BBE47005D752B0028E055002CD651002CD6
          51002CD651002CD651002CD651002CD651002CD651002CD651002CD651002ED6
          510026E255005D7A2C004E9C3A0060752A002FD550002CD851002CD651002CD6
          51002CD651002CD651002CD651002CD651002CD651002CD651002CD651002ADC
          530043AF4200548B34006965250022EA58002ED650002CD651002CD651002CD6
          51002CD651002CD651002CD651002CD651002CD651002CD651002CD7510028E1
          54006962240037C54A005A7E2E0028DF54002CD651002CD651002CD651002CD6
          51002CD651002CD651002CD651002CD651002CD8510031D14E006172280045A9
          3E0063722A0026E455002ED651002CD651002CD651002CD6510030D7580030D7
          580030D7580030D858002BDF5B0029E158002BE05B0030D7580030D7580030D7
          580030D7580030D7580030D7580030D7580030D7580030D7580030D7580030D7
          580030D858002CDF5B0027E259002AE05A0030D9590030D7580030D7580030D7
          580030D7580030D7580030D7580030D7580030D7580030D7580030D7580030D7
          58002EDB5A002CDF5B0025E5580030D7580030D7580030D7580030D7580030D7
          580030D7580030D7580030D7580030D7580030D7580030D7580030D7580030D8
          58002BE05B0028E157002CDE5A0030D7580030D7580030D7580030D7580030D7
          580030D7580030D7580030D7580030D7580030D7580030D959002BE05B0027E2
          57002BE05C0030D7580030D7580030D7580030D7580030D7580037E0610037E0
          610037E0610037E0610034E2600057C5730035E25F0037E0610037E0610037E0
          610037E0610037E0610037E0610037E0610037E0610037E0610037E0610037E0
          610037E0610035E160004FCC6E003CDB650036E1610037E0610037E0610037E0
          610037E0610037E0610037E0610037E0610037E0610037E0610037E0610037E0
          610037E0610030E65E005BC3750034E25F0037E0610037E0610037E0610037E0
          610037E0610037E0610037E0610037E0610037E0610037E0610037E0610037E0
          610034E25F005BC3750030E65E0037E0610037E0610037E0610037E0610037E0
          610037E0610037E0610037E0610037E0610037E0610037E0610034E25F005CC2
          740030E45E0037E0610037E0610037E0610037E0610037E0610029A24B0029A2
          4B0029A24B0029A24B0027A44A003F91550026A54A0029A24B0029A24B0029A2
          4B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A2
          4B0029A24B0028A44A003A9653002CA14D0029A34B0029A24B0029A24B0029A2
          4B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A2
          4B002AA24B0024A74900428F560027A44A0029A24B0029A24B0029A24B0029A2
          4B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0029A2
          4B0027A44A00428F560024A749002AA24B0029A24B0029A24B0029A24B0029A2
          4B0029A24B0029A24B0029A24B0029A24B0029A24B0029A24B0027A44A00428E
          570025A7490029A24B0029A24B0029A24B0029A24B0029A24B003DDE6D003DDE
          6D003DDE6D003DDE6D003AE06C0058C4770039E16C003DDE6D003DDE6D003DDE
          6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE
          6D003DDE6D003BE06C0051CB750043D96F003CDE6D003DDE6D003DDE6D003DDE
          6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE
          6D003DDD6D0037E36B005BC279003AE06C003DDE6D003DDE6D003DDE6D003DDE
          6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE
          6D003AE06C005BC2790037E36B003DDD6D003DDE6D003DDE6D003DDE6D003DDE
          6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003DDE6D003AE16C005BC1
          790037E36B003DDD6D003DDE6D003DDE6D003DDE6D003DDE6D003FDF74003FDF
          74003FDF74003FDF74003DE072005CD082003DE172003FDF74003FDF74003FDF
          74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF
          74003FDF74003DE0720055D47E0045DD77003FDF73003FDF74003FDF74003FDF
          74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF
          740040DE740039E2710060CF83003CE072003FDF74003FDF74003FDF74003FDF
          74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF
          74003CE0720060CF830039E2710040DE74003FDF74003FDF74003FDF74003FDF
          74003FDF74003FDF74003FDF74003FDF74003FDF74003FDF74003CE172005FCF
          83003AE1710040DF74003FDF74003FDF74003FDF74003FDF740043E17A0043E1
          7A0043E17A0043E17A0040E1790055DB840040E1790043E17A0043E17A0043E1
          7A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E1
          7A0043E17A0040E17A0050DD810046E07B0042E17A0043E17A0043E17A0043E1
          7A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E1
          7A0043E17A003EE3780057DA850040E2790043E17A0043E17A0043E17A0043E1
          7A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0043E1
          7A0040E2790057DA85003EE3780043E17A0043E17A0043E17A0043E17A0043E1
          7A0043E17A0043E17A0043E17A0043E17A0043E17A0043E17A0040E1790057DA
          85003FE3780043E17A0043E17A0043E17A0043E17A0043E17A0056DB870056DB
          870056DB870056DB870054DC870068D48F0054DC860056DB870056DB870056DB
          870056DB870056DB870056DB870056DB870056DB870056DB870056DB870056DB
          870056DB870055DC870063D48D0059DA880056DC870056DB870056DB870056DB
          870056DB870056DB870056DB870056DB870056DB870056DB870056DB870056DB
          870056DB870052DD86006AD3910054DC860056DB870056DB870056DB870056DB
          870056DB870056DB870056DB870056DB870056DB870056DB870056DB870056DB
          870054DC86006AD3910052DD860056DB870056DB870056DB870056DB870056DB
          870056DB870056DB870056DB870056DB870056DB870056DB870054DC86006AD4
          900052DD860056DB870056DB870056DB870056DB870056DB87004DE288004DE2
          88004DE288004DE288004BE287005EDB8E004AE287004DE288004DE288004DE2
          88004DE288004DE288004DE288004DE288004DE288004DE288004DE288004DE2
          88004DE288004CE2870059DC8D0050E189004CE288004DE288004DE288004DE2
          88004DE288004DE288004DE288004DE288004DE288004DE288004DE288004DE2
          88004DE1880049E4870060DA90004BE287004DE288004DE288004DE288004DE2
          88004DE288004DE288004DE288004DE288004DE288004DE288004DE288004DE2
          88004BE2870060DA900049E487004DE188004DE288004DE288004DE288004DE2
          88004DE288004DE288004DE288004DE288004DE288004DE288004BE2870060DA
          90004AE487004DE188004DE288004DE288004DE288004DE288004FE48E004FE4
          8E004FE48E004FE48E004EE58E0060DC94004DE58D0050E48E004FE48E004FE4
          8E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE4
          8E004FE48E004EE58E005CDF920052E38F004FE48E004FE48E004FE48E004FE4
          8E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE4
          8E0050E48E004CE68D0062DB95004EE58E004FE48E004FE48E004FE48E004FE4
          8E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004FE4
          8E004EE58E0062DB95004CE68D0050E48E004FE48E004FE48E004FE48E004FE4
          8E004FE48E004FE48E004FE48E004FE48E004FE48E004FE48E004EE58E0062DB
          94004CE68E0050E48E004FE48E004FE48E004FE48E004FE48E0053E5950053E5
          950053E5950053E5950051E6940063DE9A0051E6930053E5950053E5950053E5
          950053E5950053E5950053E5950053E5950053E5950053E5950053E5950053E5
          950053E5950052E594005FE0980056E4960053E5940053E5950053E5950053E5
          950053E5950053E5950053E5950053E5950053E5950053E5950053E5950053E5
          950053E5950050E7940065DD9A0051E6940053E5950053E5950053E5950053E5
          950053E5950053E5950053E5950053E5950053E5950053E5950053E5950053E5
          950051E6940065DD9A0050E7940053E5950053E5950053E5950053E5950053E5
          950053E5950053E5950053E5950053E5950053E5950053E5950051E6940065DC
          9A0050E7940053E5950053E5950053E5950053E5950053E5950056E79B0056E7
          9B0056E79B0056E79B0054E89B0065DF9F0054E89B0056E79B0056E79B0056E7
          9B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E7
          9B0056E79B0054E89B0061E19E0058E69C0055E79B0056E79B0056E79B0056E7
          9B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E7
          9B0056E79B0053E99B0067DFA00054E89B0056E79B0056E79B0056E79B0056E7
          9B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0056E7
          9B0054E89B0067DFA00053E99B0056E79B0056E79B0056E79B0056E79B0056E7
          9B0056E79B0056E79B0056E79B0056E79B0056E79B0056E79B0054E99B0067DE
          A00053E99B0056E79B0056E79B0056E79B0056E79B0056E79B0064E1A30064E1
          A30064E1A30064E1A30063E2A30073D9A60063E3A30064E1A30064E1A30064E1
          A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1
          A30064E1A30063E2A3006FDCA50067E1A30064E1A30064E1A30064E1A30064E1
          A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1
          A30064E1A30061E3A30074D8A60063E2A30064E1A30064E1A30064E1A30064E1
          A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1
          A30063E2A30074D8A60061E3A30064E1A30064E1A30064E1A30064E1A30064E1
          A30064E1A30064E1A30064E1A30064E1A30064E1A30064E1A30063E3A30075D8
          A60061E3A30064E1A30064E1A30064E1A30064E1A30064E1A30060E9A70060E9
          A70060E9A70060E9A7005EEAA7006EE0AA005EEAA70060E9A70060E9A70060E9
          A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9
          A70060E9A7005FEAA7006BE2AA0063E7A8005FE9A70060E9A70060E9A70060E9
          A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9
          A70060E9A7005DEBA7006FDFAA005EEAA70060E9A70060E9A70060E9A70060E9
          A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9
          A7005EEAA7006FDFAA005DEBA70060E9A70060E9A70060E9A70060E9A70060E9
          A70060E9A70060E9A70060E9A70060E9A70060E9A70060E9A7005EEAA70070DF
          AA005DEBA70060E9A70060E9A70060E9A70060E9A70060E9A70060ECAE0060EC
          AE0060ECAE0060ECAE005FEDAE006EE3AE005FEDAE0060ECAE0060ECAE0060EC
          AE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060EC
          AE0060ECAE005FEDAE006AE5AE0063EAAF0060ECAE0060ECAE0060ECAE0060EC
          AE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060EC
          AE0061ECAE005EEEAE0070E1AF005FEDAE0060ECAE0060ECAE0060ECAE0060EC
          AE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060EC
          AE005FEDAE0070E1AF005EEEAE0061ECAE0060ECAE0060ECAE0060ECAE0060EC
          AE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE0060ECAE005FEDAE0070E1
          AE005EEEAE0061ECAE0060ECAE0060ECAE0060ECAE0060ECAE0065EDB50065ED
          B50065EDB50065EDB50064EEB50072E3B50063EEB50065EDB50065EDB50065ED
          B50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065ED
          B50065EDB50064EEB5006EE7B50067ECB50065EDB50065EDB50065EDB50065ED
          B50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065ED
          B50065EDB50062EFB50074E2B50064EEB50065EDB50065EDB50065EDB50065ED
          B50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50065ED
          B50064EEB50074E2B50062EFB50065EDB50065EDB50065EDB50065EDB50065ED
          B50065EDB50065EDB50065EDB50065EDB50065EDB50065EDB50064EEB50074E2
          B50062EEB50065EDB50065EDB50065EDB50065EDB50065EDB50067EFBB0067EF
          BB0067EFBB0067EFBB0066F0BB0074E5BA0066F0BB0067EFBB0067EFBB0067EF
          BB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EF
          BB0067EFBB0066F0BB0070E8B90069EEBB0067EFBB0067EFBB0067EFBB0067EF
          BB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EF
          BB0067EFBB0065F2BB0075E4BA0066F0BB0067EFBB0067EFBB0067EFBB0067EF
          BB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EF
          BB0066F0BB0075E4BA0065F2BB0067EFBB0067EFBB0067EFBB0067EFBB0067EF
          BB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0066F0BB0075E5
          BA0065F1BB0067EFBB0067EFBB0067EFBB0067EFBB0067EFBB0073E9BF0073E9
          BF0073E9BF0073E9BF0072EAC0007FE0BD0072EAC00073E9BF0073E9BF0073E9
          BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9
          BF0073E9BF0072EAC0007CE2BE0075E8BF0073E9BF0073E9BF0073E9BF0073E9
          BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9
          BF0073E9BF0071EBC10081DFBD0072EAC00073E9BF0073E9BF0073E9BF0073E9
          BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9
          BF0072EAC00081DFBD0071EBC10073E9BF0073E9BF0073E9BF0073E9BF0073E9
          BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0072EAC00081DF
          BD0071ECC00073E9BF0073E9BF0073E9BF0073E9BF0073E9BF0072EEC60072EE
          C60072EEC60072EEC60071EFC6007DE5C30071F0C70072EEC60072EEC60072EE
          C60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EE
          C60072EEC60071EEC6007AE7C50073EEC60072EEC60072EEC60072EEC60072EE
          C60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EE
          C60072EEC6006FF1C7007EE3C30071EFC60072EEC60072EEC60072EEC60072EE
          C60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60072EE
          C60071EFC6007EE3C3006FF1C70072EEC60072EEC60072EEC60072EEC60072EE
          C60072EEC60072EEC60072EEC60072EEC60072EEC60072EEC60071EFC6007EE4
          C3006FF0C70072EEC60072EEC60072EEC60072EEC60072EEC60072F3CD0072F3
          CD0072F3CD0072F3CD0071F4CE007EE9C90071F4CE0072F3CD0072F3CD0072F3
          CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3
          CD0072F3CD0072F4CE007BEBCA0075F1CD0072F3CD0072F3CD0072F3CD0072F3
          CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3
          CD0073F3CD0070F5CF007FE7C80071F4CE0072F3CD0072F3CD0072F3CD0072F3
          CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3
          CD0072F5CF0080EACB0072F9D30072F2CD0072F3CD0072F3CD0072F3CD0072F3
          CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0072F3CD0071F4CE007FE8
          C80070F5CF0073F3CD0072F3CD0072F3CD0072F3CD0072F3CD0076F4D40076F4
          D40076F4D40076F4D40075F5D40080EACE0075F5D40076F4D40076F4D40076F4
          D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4
          D40076F4D40075F5D4007DEDD00078F2D40076F5D40076F4D40076F4D40076F4
          D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4
          D40076F4D40073F7D50081E9CE0075F6D40076F4D40076F4D40076F4D40076F4
          D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40076F5
          D50074F5D30081E6AE006DE8B30078F9D90076F4D40076F4D40076F4D40076F4
          D40076F4D40076F4D40076F4D40076F4D40076F4D40076F4D40075F6D50081E9
          CD0073F7D50076F4D40076F4D40076F4D40076F4D40076F4D40079F6DA0079F6
          DA0079F6DA0079F6DA0078F7DB0084ECD40078F7DB0079F6DA0079F6DA0079F6
          DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6
          DA0079F6DA0079F7DB0081EED5007BF5D90079F6DA0079F6DA0079F6DA0079F6
          DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6
          DA0079F6DA0077F9DC0084EBD40078F7DB0079F6DA0079F6DA0079F6DA0079F6
          DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA007DFE
          E10059B596001B11ED00000095008DFFE70079F5DA0079F6DA0079F6DA0079F6
          DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0078F7DB0085EA
          D30077F9DC0079F6DA0079F6DA0079F6DA0079F6DA0079F6DA0081F1DC0081F1
          DC0081F1DC0081F1DC0080F2DC0087EAD80080F2DC0081F1DC0081F1DC0081F1
          DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1
          DC0081F1DC0080F2DC0086ECD80082EFDC0081F1DC0081F1DC0081F1DC0081F1
          DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1
          DC0081F1DC007FF4DE008AE4D40080F3DD0081F1DC0081F1DC0081F1DC0081F1
          DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0086FB
          E2005DAB8B005035F900000091008DFDEC0086FBDA0082F3DC0081F1DC0081F1
          DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0080F2DC0088E9
          D70080F3DD0081F1DC0081F1DC0081F1DC0081F1DC0081F1DC0083F5E20083F5
          E20083F5E20083F5E20083F5E30089EDDD0083F5E30083F5E20083F5E20083F5
          E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5
          E20083F5E20083F5E30087EEDF0085F3E20083F5E30083F5E20083F5E20083F5
          E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5
          E20083F4E20082F8E5008CE8DA0082F6E30083F5E20083F5E20083F5E20083F5
          E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20084F8E20085EF
          E4005FB7E200A5E6DC0075DBD40074D3EB0062AEEA0081E9E40087FCE20083F4
          E20083F5E20083F5E20083F5E20083F5E20083F5E20083F5E20083F6E30089EC
          DC0083F7E40083F4E20083F5E20083F5E20083F5E20083F5E20084F9ED0084F9
          ED0084F9ED0084F9ED0083FAEE008BEEE20083FBEE0084F9ED0084F9ED0084F9
          ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9
          ED0084F9ED0084FAEE0088F1E60085F8EB0084F9ED0084F9ED0084F9ED0084F9
          ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9
          ED0084F9ED0082FDEE008BEEE10083FAEE0084F9ED0084F9ED0084F9ED0084F9
          ED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0085FCED0086F5EC005FB5
          F20087FFED00A3F1E5007FFFF00087FFEC0080F0ED0062B5F2006BC9EF008EFF
          EC0085FCED0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0083FAEE008BEE
          E20083FCEE0084F9ED0084F9ED0084F9ED0084F9ED0084F9ED0087FAF20087FA
          F20087FAF20087FAF20087FBF3008EF0E70087FCF30087FAF20087FAF20087FA
          F20087FAF20087FAF20087FAF20087FAF20087FAF20087FAF20087FAF20087FA
          F20087FAF20087FBF2008BF3EB0089F9F00087FAF20087FAF20087FAF20087FA
          F20087FAF20087FAF20087FAF20087FAF20087FAF20087FAF20087FAF20087FA
          F20087FAF10087FEF4008EEEE60087FCF30087FAF20087FAF20087FAF20087FA
          F20087FAF20087FAF20087FAF20087FAF20087FDF1007AF3F60057BAFB0084FF
          F7007AFFF8009FF5EE0076FFF9007DFFF7007EFFF70084FFF60076EDFB005496
          F7007EE3F2008DFFF10087FDF20087FAF20087FAF20087FAF20087FCF3008EEE
          E60087FEF40087FAF10087FAF20087FAF20087FAF20087FAF2008AFDF9008AFD
          F9008AFDF9008AFDF90089FEF90090F1ED0089FFF9008AFDF9008AFDF9008AFD
          F9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFD
          F9008AFDF9008AFEF9008EF5F0008BFBF6008AFDF9008AFDF9008AFDF9008AFD
          F9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFDF9008AFD
          F9008AFDF90089FFFB0091F0ED0089FEF9008AFDF9008AFDF9008AFDF9008AFD
          F9008AFDF9008AFDF9008AFDF9008AFFF90093F9FC00C9D9E300D0DDD900C8D5
          D500D2E0E100C5CECF00D0DFDF00CBD9D900CEDBDB00CAD6D700BCBFBD008BFF
          FF006FC5F90068B5FA0087F0F9008EFFF9008AFCF9008AFDF90089FFF90092EF
          EC0089FFFB008AFDF9008AFDF9008AFDF9008AFDF9008AFDF90090F8F80090F8
          F80090F8F80090F8F8008FF9F90094EFEE008FF9F90090F8F80090F8F80090F8
          F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8
          F80090F8F8008FF9F80093F2F20090F7F70090F8F80090F8F80090F8F80090F8
          F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8F80090F8
          F80090F8F8008FFAF90097EBEB008FF9F90090F8F80090F8F80090F8F80090F8
          F80090F8F80090F8F80091FAF80091F4F90062B7FB00C7B3A900B3B1B100F1EE
          EE00A6A3A300C7C5C500BFBBBC00E0DDDD00CDCACA00FFFFFF00E1D2D20084FD
          FD0095FFF7008BE9F8006BAFF80077C6F8009BFFF80091FAF8008FF9F90095EF
          EE008FF9F90090F8F80090F8F80090F8F80090F8F80090F8F80092F8F60092F8
          F60092F8F60092F8F60092F9F70097EEEE0091F9F70092F8F60092F8F60092F8
          F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8
          F60092F8F60094FAF9009EFEF9009EFFFF0092F8F70092F8F60092F8F60092F8
          F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8F60092F8
          F60092F8F60091F9F90099EAE90092F9F80092F8F60092F8F60092F8F60092F8
          F60092F8F60093FAF60094F1F6006AB2F80094FFFB00B4A1A100C4C5C500B1B2
          B20082838300BCBCBC00B9B9B900DCDCDC006F6F6F00FFFFFF00DCCFCF0087FD
          FC0092F7F60093F9F6009AFFF60087DAF6005C95F7008ADFF600A0FFFF00A6FF
          F8009EFFFF0091F7F50092F8F60092F8F60092F8F60092F8F60092F9F50092F9
          F50092F9F50092F9F50092FBF70097EEEB0092FBF70092F9F50092F9F50092F9
          F50092F9F50092F9F50092F9F50092F9F50092F9F50092F9F50092FAF50094FD
          F50095FFF80090F8E7005A8AA7004D7E950099FFF90092FAF60092F9F50092F9
          F50092F9F50092F9F50092F9F50092F9F50092F9F50092F9F50092F9F50092F9
          F50092F9F50091FDF80099EEEA0092FBF70092F9F50092F9F50092F9F50092F9
          F50093FCF50095F7F6006AB2F80099FFF6008EFFF900B69B9D00B0A9AA009891
          92009F979800BBB5B500B7AFB000FEF7F800BCB5B500FFF9FA00EAD9D90087FF
          FB0093F9F50092F9F50092F9F50094FDF5009DFFF5007BCCFF00446CA5003039
          A1003D689000A7FFFF0095FFF50094FDF50094FDF50094FCF5009EFFEE009DFF
          EE0098F9EE0098F9EE0096F9F1009EF0E80099FDF30096F6EF0096F6EF0096F6
          EF0098F9EE0098F9EE0098F9EE009CFFEE009EFFEE009EFFEE009CFEEE0084D4
          F20088DDF7007CC8B6000300FF000000D900A2FFE0009BFEF00097F8EE0096F7
          EF0096F7EF0096F7EF0096F7EF0096F7EF0096F7EF0096F7EF0096F7EF0096F7
          EF0096F7EF0096F9F1009CEBE40096F8F00096F7EF0096F7EF0096F7EF0097F9
          EF0099F6EE006CAEF4009EFFEE0097F8EF0097FAF30092B6B40099C7C4009CCA
          C6009DCCC800A1C0BD009AC9C50093C2BD009BC8C50091BEB900B1E5E10092F9
          F10097F7EF0096F7EF0096F7EF0096F7EF0096F6EF00A3FFF7004C7CAA003524
          FF000611AE0070B0FF0082D1F10087DAF10086D8F2008CE5F00068A3F1006EAF
          F0008CDCEC008DE2ED00A0FCE3008FCEC70088D2CC00A5FFED00A1FFE700A4FF
          E70087D6ED0089DAEC008CDCEC0071B3F00067A4F10068A4F1006CAAF00087D2
          ED0086D4EF0078C0CA004C4FAA001F23850074B7EE0080C7EF0093ECEB00A1FE
          E8009AF5E90099F4E9009AF4E9009AF4E9009AF4E9009AF4E9009AF4E9009AF4
          E9009AF4E90099F7EB009FE9E00099F5EA009AF4E9009AF4E9009AF6E9009DF5
          E9006DAEF000A0FEE9009AF4E9009AF4E9009AF5EA009AFCF10099FBF00099FB
          EF0098FCF0009EEFE60098FEF20099FBEF0099FBEF0099FBEF0096F7EC009AF4
          E9009AF4E9009AF4E9009AF4E9009AF4E9009AF4E9009EFCEF0070B7B3007E96
          B20059979A00ADFFF40088D8EB0084CFEC0085D1ED007DC4EE00A6FADF00A1F0
          E00085C5E50086C5ED005A83A9001300D600000090007DB8F4006CA1EA006797
          EC008ACDE50087C9E50085C5E5009FEDE100A6FADF00A5F9DF00A4F8E000A0F0
          E000A1F0E000A1F5E500BBFFE800B3FFEE00A6FAE00091D9E2007BB3E80077B0
          E8009FEEE100A5F8DF00A0EEE0009EEDE1009EEDE1009EEDE1009EEDE1009EED
          E1009EEDE1009EEFE200A2E2D8009EEEE1009EEDE1009FEEE100A1EFE00070A6
          EA00A5F8E0009EEDE1009EEDE1009EEDE1009EEDE1009EEDE1009EEDE1009EED
          E1009EEEE100A2E2D8009EEEE2009EEDE0009EEDE1009EEDE1009EEDE1009EED
          E1009EEDE1009EEDE1009EEDE1009EEDE1009EEDE1009EEDE000A1F7E800BBF5
          E600A3FCEC009EECE000A0EFE000A1F0E000A1F0E000A1F3E000A1E8D900A1E9
          D900A4ECD900A7F2DE0095DAA200524AEA000000A900BEFFDC00A8F4D700A9F5
          D700A3ECD900A4ECD900A4EDD900A1E9D900A1E8D900A1E8D900A1E8D900A1E9
          DA00A1E9DA00A0E9D900AEE7DB00A3E9DA00A1E9DA00A2ECD900A6F2D8009DE2
          DB0086BDE0006D9BE60098D8DC00ABF6D600A3EBD900A1E8D900A1E8D900A1E8
          D900A1E8D900A1EBDB00A5DFD300A1E9DA00A2EAD900A5EDD80073A3E400A8F3
          D700A1E8D900A1E8D900A1E8D900A1E8D900A1E8D900A1E8D900A1E8D900A1E8
          D900A1E9DA00A5DFD300A1EBDB00A1E8D900A1E8D900A1E8D900A1E8D900A1E8
          D900A1E8D900A1E8D900A1E8D900A1E8D900A1ECDC00A1EDDC00A0EDDC00B5E8
          DC009EEEDC00A1EDDC00A1EDDD00A1EBDB00A1E8D900A1E8D900A3ECD700A3EC
          D700A3ECD700A4ECD800A1EBD900AFDEB80097DEB100A7EFDD00A3EBD700A3EB
          D700A3EBD700A3ECD700A3ECD700A3ECD700A3EBD700A4ECD800A8EDDA00A2E5
          D200A3E6D300A2E7D400ABDED000A4E4D200A1E4D100A2E5D300A0E2D000A1E2
          CE00A8F3D600ABF6D60085BEE0006D9FE60096D9DB00ACF7D500A6EED700A4EC
          D700A3EBD700A3EED800A5E1D100A4EED800A7F0D60073A5E400AAF6D500A3EC
          D700A3ECD700A3ECD700A3ECD700A3ECD700A3ECD700A3ECD700A3ECD700A3EC
          D700A3EDD800A5E1D100A3EED900A3EBD700A3ECD700A3ECD700A3ECD700A3EC
          D700A3ECD700A3ECD700A2EBD700ACF3E000A7D4C800A4CEC400A2CFC300B8D3
          CB009FCDC100A2CDC200A1C9BF00A0D9C800A3EED900A3ECD700A6E8D100A7E8
          D100A7E9D100A7E9D100A6EAD200B9E6D600A7EDD500A7E9D100A7E9D100A7E9
          D100A7E9D100A6E8D100A6E8D100A6E8D100A6E7D000A3EED300DACFD300E8DC
          E000E2D7DB00DDD3D500F4EBEE00E5DBDE00F0E5E800DFD4D600F9EFF200EDD5
          DD0097E0C500A7E9D100AAEED000AEF3CE008AC0D8006C97E30097D4D600A7E9
          D000AAEDCE00B1F7DB00B1E9D100ACF0D40075A3E100ADF2CE00A7E8D100A6E8
          D100A6E8D100A6E8D100A6E8D100A6E8D100A6E8D100A6E8D100A6E8D100A6E8
          D100A6E9D100A9DECB00A6EAD200A6E8D000A6E8D100A6E8D100A6E8D100A6E8
          D100A6E8D100A6E8D100A6EAD200A8D5C500DBCED300E1DCDD00EBE6E700EFEC
          ED00FAF6F700F5F0F100FFFFFF00AECCC100A5EAD200A6E8D100A9E4CA00A1E0
          C3009FDBC0009FDBC0009DDBBF00B2DBC7009DDBBF009FDBC0009EDBBF009FDB
          C000A0DCC100AAE5CC00A9E4CA00A9E4CA00A9E3C900ACF2D400A0989B00BBBB
          BB0088888800ACACAC007D7D7D00A3A3A300EAEAEA0090909000F7F8F800F9EF
          F4009ADABD00AAE5CB00A9E4CA00A9E4CA00ACE8C900B6F7C5008FC0D40079A2
          DB0098CCE000668C81007E9F9800749CBA00B3F1CC00A9E4CA00A9E4CA00A9E4
          CA00A9E4CA00A9E4CA00A9E4CA00A9E4CA00A9E4CA00A9E4CA00A9E4CA00A9E4
          CA00A9E5CA00ACDCC500A9E6CB00A9E4CA00A9E4CA00A9E4CA00A9E4CA00A9E4
          CA00A9E4CA00A9E4CA00AAE7CC0099CAB500C7BFC300AEAEAE00787878003232
          3200A1A1A10097979700FFFFFF00ADCBBD00A8E6CB00A9E4CA00AFE3C600DBE1
          DE00DBDFDD00DFE3E100E1E6E300E3E4E300E1E5E200DCE1DE00E5E9E700DADF
          DC00D2CBCE00A5E1C000ADE0C500ADE0C400ACE0C400B0EDCB00ABA4A800A1A1
          A1008B8B8B00929191009B9B9B00A5A5A500E6E6E60081818100F9F9F900F7ED
          F3009DD5B600ADE1C500ADE0C400ADE0C400ADE0C400ACE0C500AFE3C400B5EC
          C000B2E6D4000000AF001608FF0072968200B4E9C900ADE0C400ADE0C400ADE0
          C400ADE0C400ADE0C400ADE0C400ADE0C400ADE0C400ADE0C400ADE0C400ADE0
          C400ADE1C500AED7C100ADE1C500ADE0C400ADE0C400ADE0C400ADE0C400ADE0
          C400ADE0C400ADE0C400AEE2C6009DC6B000CFC7CC00A3A3A300B0AFB0008E8D
          8E00BFBEBF00ACABAC00FFFFFF00ABC5B700ACE2C500ADE0C400B3E6C200A095
          9C00B1B0B1009392920087868700ACACAC00A2A1A100D8D7D7008C8B8B00FFFF
          FF00EDE3E900A5D5B500B1DBBD00B1DABC00B0DABC00B5E6C4009A939800B7B6
          B700A6A5A600A2A1A200B8B6B800A9A7A900CECDCF00A2A1A200CCCACC00E7E2
          E600A6D5B400B1DBBD00B1DABC00B1DABC00B1DABC00B1DABC00B1DABC00B0D9
          BC00C8F8C800181C6D007271C00077948100B6E2C200B1DABC00B1DABC00B1DA
          BC00B1DABC00B1DABC00B1DABC00B1DABC00B1DABC00B1DABC00B1DABC00B1DA
          BC00B1DBBD00B2D2BA00B1DDBC00B1DABC00B1DABC00B1DABC00B1DABC00B1DA
          BC00B1DABC00B1DABC00B2DDBE00A7C7B1009A979900A5A7A600A8AAA900B4B4
          B400A8AAA900AEAFAF00AEACAE00C0E0C900AFDABB00B1DABC00B7E8BD00A9A1
          A800A6A7A60089898900A2A2A2005D5D5D00A7A7A700E3E4E3007D7D7D00FFFF
          FF00ECE3EC00A7D8AE00B4DDB800B3DCB800B3DCB800B4DEB900ADD4B400AAD3
          B000ACD4B200ACD4B200AACCAF00ACD2B100A7D0AD00ABD4B100A6CEAC00ACD4
          B200B4DEB800B3DCB800B3DCB800B3DCB800B3DCB800B3DCB800B3DCB800B3DC
          B800B2DBB700C5F8C100D0EEC600BAE8BF00B3DCB700B3DCB800B3DCB800B3DC
          B800B3DCB800B3DCB800B3DCB800B3DCB800B3DCB800B3DCB800B3DCB800B3DC
          B800B3DDB800B3D4B700B3DEB800B3DCB800B3DCB800B3DCB800B3DCB800B3DC
          B800B3DCB800B3DCB800B3DCB800B5E0BA00B6E7BE00B5E6BD00B5E6BD00B5DD
          BB00B5E7BD00B5E5BC00B4E3BA00B0DCB600B4DCB800B3DCB800BCE4B600A095
          A100C1BEC200BCB8BD00AFACB100D9D6DB00BFBCC100F9F7FB00A09CA100F7F4
          F900E9E0EB00ADD5A700B7D8B200B6D8B200B6D8B200B6D8B200B7D9B300B7D9
          B300B7D9B300B7DAB300B7D5B400B7D9B300B7DAB300B7D9B300B7DAB300B6D9
          B200B6D8B200B6D8B200B6D8B200B6D8B200B6D8B100B6D8B100B6D8B100B6D8
          B100B6D8B200B4D7AE00C3D8C000B5D8B000B6D8B200B6D8B200B6D8B200B6D8
          B100B6D8B200B6D8B200B6D8B200B6D8B200B6D8B200B6D8B200B6D8B200B6D8
          B200B6D9B200B5D1B300B6DAB200B6D8B200B6D8B200B6D8B200B6D8B200B6D8
          B200B6D8B200B6D8B200B6D8B200B6D8B200B6D7B200B6D7B200B6D8B200B5D2
          B300B6D9B200B6D7B200B6D8B200B6D8B200B6D8B200B6D8B200BCDBAD00A5B8
          9C00A4B99A00A4B99A00A4B99A00A2B59B00A1B798009DB29200A3B89A0098AD
          8D00BAD1AF00B8D7A900B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6
          AB00B9D6AB00B9D6AB00B8D3AC00BAD5AC00B9D6AB00B9D6AB00B9D6AB00B9D6
          AB00B9D6AB00B9D6AB00B9D6AB00BAD6AC00BCD8AD00B6D2A800B6D2A800B9D5
          AB00B6D2A800B4D2A500BFD2B600B5D2A600B5D1A600B5D1A700B5D1A700B5D1
          A700B8D4AA00BAD6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6
          AB00BAD6AB00B8D0AD00B9D8AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6
          AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00BAD6AB00B8D0
          AD00BAD8AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00B9D6AB00BCD2A500BED5
          A700BED5A700BED5A700BED5A700BCD1A900BED5A700BED5A700BED5A700BFD5
          A700BCD3A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2
          A500BCD2A500BCD3A500BBCFA700BBD2A600BCD2A500BCD2A500BCD2A500BCD2
          A500BCD2A500BCD2A500BCD2A500BCD4A100D9D6DB00E1DCE300E9E4EB00C5C0
          C600EAE5ED00F4EEF600DFDCE100E7E2EA00F1EDF400EBE6ED00EBE6ED00F2EB
          F600ABB79E00BDD4A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2
          A500BCD3A500BACCA700BCD4A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2
          A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BCD3A500BACD
          A700BCD4A500BCD2A500BCD2A500BCD2A500BCD2A500BCD2A500BDCCA100BDCC
          A100BDCCA100BDCCA100BDCDA100BDCAA200BDCDA100BDCCA100BDCCA100BDCC
          A100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCC
          A100BDCCA100BDCCA100BDCBA100BDCCA100BDCCA100BDCCA100BDCCA100BDCC
          A100BDCCA100BDCCA100BDCCA100C3D5A1009A989D00D4D4D400A4A4A400C5C5
          C500A9A9A90087878700B8B8B800C4C5C400C0C0C000B3B3B300B3B3B300FFFF
          FF00ACB59900BECEA100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCC
          A100BDCDA100BBC7A400BFCEA100BDCCA100BDCCA100BDCCA100BDCCA100BDCC
          A100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100BDCDA100BCCA
          A300BECDA100BDCCA100BDCCA100BDCCA100BDCCA100BDCCA100C3CC9800C3CC
          9800C3CC9800C3CC9800C4CD9700C1C89D00C4CD9700C3CC9800C3CC9800C3CC
          9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC
          9800C3CC9800C3CD9800C2CA9B00C3CB9800C3CD9800C3CC9800C3CC9800C3CC
          9800C3CC9800C3CC9800C3CC9800C9D59700A1A1A400DBDBDB006F6F6F00F7F7
          F800A5A5A6006A6A6B00ABABAB0095959500B5B5B500A0A0A000CBCBCC00FFFF
          FF00B0B69500C4CE9700C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC
          9800C4CD9700C1C89D00C5CE9700C3CC9800C3CC9800C3CC9800C3CC9800C3CC
          9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C4CD9700C0C8
          9D00C5CE9700C3CC9800C3CC9800C3CC9800C3CC9800C3CC9800C5C99100C5C9
          9100C5C99100C5C99100C6C99100C3C69600C6C99100C5C99100C5C99100C5C9
          9100C5C99100C5C99100C5C99100C5C99100C5C99100C5C99100C5C99100C5C9
          9100C5C99100C6C99100C4C79500C5C99200C5C99100C5C99100C5C99100C5C9
          9100C5C99100C5C99100C5C99100CDD3900096969D00BBBCC100B7B8BC00C1C2
          C500A1A1A500D2D3D500ABABAF00AFB0B400D7D7DB00C5C5C900BDBDC100ECEC
          F500BFC29700C6CA9000C5C99100C5C99100C5C99100C5C99100C5C99100C5C9
          9100C6CA9100C2C59800C7CA9000C5C99100C5C99100C5C99100C5C99100C5C9
          9100C5C99100C5C99100C5C99100C5C99100C5C99100C5C99100C6CA9100C2C5
          9800C7CA9000C5C99100C5C99100C5C99100C5C99100C5C99100C8C68B00C8C6
          8B00C8C68B00C8C68B00C9C68B00C5C49200C9C68B00C8C68B00C8C68B00C8C6
          8B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C6
          8B00C8C68B00C9C68B00C6C59000C8C68C00C8C68B00C8C68B00C8C68B00C8C6
          8B00C8C68B00C8C68B00C8C68B00CAC88B00C1BE8900BDBA8500BDBB8600BCBA
          8400BFBD8700BDBA8200B9B78C00BEBB8500BAB78200BBB88300BBB88300B6B5
          8000CECC8F00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C6
          8B00C9C78B00C5C39200CAC88A00C8C68B00C8C68B00C8C68B00C8C68B00C8C6
          8B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00C9C78B00C5C3
          9200CAC88A00C8C68B00C8C68B00C8C68B00C8C68B00C8C68B00CBC48500CBC4
          8500CBC48500CBC48500CBC58500C6C18C00CBC58500CBC48500CBC48500CBC4
          8500CBC48500CBC48500CBC48500CBC48500CBC48500CBC48500CBC48500CBC4
          8500CBC48500CBC58500C9C28A00CAC38700CBC48500CBC48500CBC48500CBC4
          8500CBC48500CBC48500CBC48500CBC48500CCC58600CCC58600CCC58600CCC5
          8600CCC58600CEC58400C8C28E00CDC58500CDC58600CDC58600CDC58600CCC5
          8600CBC48500CBC48500CBC48500CBC48500CBC48500CBC48500CBC48500CBC4
          8500CBC58500C7C18E00CCC58400CBC48600CBC48500CBC48500CBC48500CBC4
          8500CBC48500CBC48500CBC48500CBC48500CBC48500CBC48500CBC58500C7C1
          8D00CCC58400CBC48600CBC48500CBC48500CBC48500CBC48500CBBD8500CBBD
          8500CBBD8500CBBD8500CBBE8400C9BD8900CBBE8400CBBD8500CBBD8500CBBD
          8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD
          8500CBBD8500CBBE8400C9BD8800CBBE8600CBBD8500CBBD8500CBBD8500CBBD
          8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD
          8500CBBD8500CDBF8200C6BB8E00CCBE8400CBBD8500CBBD8500CBBD8500CBBD
          8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD
          8500CCBE8400C6BB8E00CDBF8200CBBD8500CBBD8500CBBD8500CBBD8500CBBD
          8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500CBBE8400C8BD
          8900CCBE8300CBBD8500CBBD8500CBBD8500CBBD8500CBBD8500DAC57B00DAC5
          7B00DAC57B00DAC57B00DBC57A00D4C38600DBC57A00DAC57B00DAC57B00DAC5
          7B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC5
          7B00DAC57B00DBC57A00D5C38300D9C57D00DAC57B00DAC57B00DAC57B00DAC5
          7B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC5
          7B00DAC57B00DCC57800D4C38700DBC57A00DAC57B00DAC57B00DAC57B00DAC5
          7B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC5
          7B00DBC57A00D4C38700DCC57800DAC57B00DAC57B00DAC57B00DAC57B00DAC5
          7B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00DBC57A00D4C3
          8700DCC57800DAC57B00DAC57B00DAC57B00DAC57B00DAC57B00917F4C00917F
          4C00917F4C00917F4C00917F4B008F7E5000917F4C00917F4B00917F4C00917F
          4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F
          4C00917F4C00917F4B00907E4F00917F4D00917F4B00917F4C00917F4C00917F
          4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F
          4C00917F4C00927F4B008F7E5000917F4B00917F4C00917F4C00917F4C00917F
          4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F
          4C00917F4B008F7E5000927F4B00917F4C00917F4C00917F4C00917F4C00917F
          4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4C00917F4B008F7E
          5100927F4B00917F4C00917F4C00917F4C00917F4C00917F4C00E3C37000E3C3
          7000E3C37000E3C37000E3C37000E4C36F00E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E4C36F00E4C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E4C36F00E3C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E4C36F00E3C37000E3C37000E3C37000E3C37000E3C37000E3C3
          7000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000E4C3
          6F00E3C37000E3C37000E3C37000E3C37000E3C37000E3C37000DAB46200DAB4
          6200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB4
          6200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB4
          6200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DBB5
          6200E1BE6700E1BF6700DCB45E00DEB65F00DFB96100DEBA6300DBB35E00E1BF
          6800DDB55D00DEB96500E0BD6500DBB25D00DBB56200DEB75F00DDB86500DCB4
          5D00E0BC6600DDB55E00DDB96500E1BE6600DDB55E00DEB76000DBB56300E1BF
          6800DBB35D00DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB4
          6200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DAB4
          6200DAB46200DAB46200DAB46200DAB46200DAB46200DAB46200DEB15B00DEB1
          5B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB1
          5B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB1
          5B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DFB35C00DEAE
          5800A2512A00A84E2A00D8B77A00C7997300BE846300BE784800E6D08600A142
          1A00D3B58700C9873B00AD573F00E0C78300DEAA5000C0917A00D0883700D7BE
          8D00B4642800D1B28700CC853A00A7452500D4B48200BD8D6C00DFAC4F009F3F
          1A00D8C18C00E0B15600DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB1
          5B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB1
          5B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00DEB15B00E1AD5400E1AD
          5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD
          5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD
          5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E2B05600DB9C
          4300A5697700B3420B00C6AD9A00B4878600A5566200AC543A00B5726E00A251
          4D00C59D8300942B43009D363300E1D29B00E2A6440099495E00B03A0200C8B1
          9E009C5B6200983E5900A84C3B00B6827E00C6AC9A009A556E00DC9B3F009C35
          3400D6BB8E00E3AD4E00E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD
          5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD
          5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E1AD5400E3AA4D00E3AA
          4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA
          4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA
          4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E4AD4E00DE9D
          42008F2C47009E250400CEB89B00C69874009F556900A4473500EBDE9B00B551
          1900E8C67600D996390093202600E1D29900E3A13A0099537000B53E0000CDC1
          AF00C5711D00DCB77A00CE803000D59C5F00DAAF6F00B7551600D4AC7C00B358
          1C00DEB77700E4AA4900E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA
          4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA
          4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E3AA4D00E7A74500E7A7
          4500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A7
          4500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A7
          4500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E8A9
          4800D6852E00D9914300E9AB4900DFA15300E0A04700E09B4300E7AC5000ECAE
          4700E7A64200EBAD4800E19B3F00E7AD5100E8A64000E0A55400E5A13B00E3A9
          5300ECAC4500E8A84200E9AC4700E9A94300E8A74200ECAF4900E9A84200ECAF
          4900E8A64200E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A7
          4500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500E7A7
          4500E7A74500E7A74500E7A74500E7A74500E7A74500E7A74500EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EDA93F00ECA83D00EAA53C00EBA53B00ECA63C00EBA63D00EAA43B00EAA5
          3D00EAA53D00EAA43D00EBA73D00EAA43B00EAA53D00EBA63B00EBA63E00EBA4
          3B00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA5
          3D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EAA53D00EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EEA1
          3600EEA13600EEA13600EEA13600EEA13600EEA13600EEA13600EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F
          2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00EF9F2E00F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A
          2600F39A2600F39A2600F39A2600F39A2600F39A2600F39A2600F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F698
          1D00F6981D00F6981D00F6981D00F6981D00F6981D00F6981D00F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300F9931300F993
          1300F9931300F9931300F9931300F9931300F9931300F9931300}
        OptionsImage.Layout = blGlyphTop
        TabOrder = 52
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = cxButton2Click
      end
      object cxLabel4: TcxLabel
        Left = 456
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
        Width = 153
        AnchorX = 533
        AnchorY = 65
      end
    end
  end
  object NextFinishBtn: TcxButton
    Left = 712
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Next'
    TabOrder = 1
    OnClick = NextFinishBtnClick
  end
  object PrevBtn: TcxButton
    Left = 592
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Prev'
    TabOrder = 2
    OnClick = PrevBtnClick
  end
  object CancelBtn: TcxButton
    Left = 472
    Top = 584
    Width = 90
    Height = 41
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = CancelBtnClick
  end
  object ARILabel: TcxLabel
    Left = 40
    Top = 569
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '* Target Average Rate Index (TARI)'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    Transparent = True
    Height = 24
    Width = 225
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
end
