object CashFlowGroupingF: TCashFlowGroupingF
  Left = 523
  Top = 311
  Width = 497
  Height = 477
  Caption = 'Cash Flow Department Grouping'
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
  object DeptList: TcxCheckListBox
    Left = 112
    Top = 136
    Width = 273
    Height = 225
    Items = <>
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
    TabOrder = 0
    OnExit = DeptListExit
  end
  object cxLabel4: TcxLabel
    Left = 16
    Top = 16
    Width = 457
    Height = 105
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'Please check each Department that is grouped with this Departmen' +
      't for cash flow forecasting.'#13#10#13#10'All Revenue, Expenses and Other ' +
      'Income from these grouped departments will be '#39'consolidated'#39' dur' +
      'ing Cash Flow Editing and reporting.'#13#10#13#10'During reporting, checki' +
      'ng '#39'Consolidate Departments'#39' under Report Options allows an alte' +
      'rnative consolidation which may not produce the expected results' +
      '.'
    ParentColor = False
    ParentFont = False
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clMaroon
    Style.Font.Height = -12
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.LookAndFeel.Kind = lfUltraFlat
    Style.LookAndFeel.NativeStyle = True
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfUltraFlat
    StyleDisabled.LookAndFeel.NativeStyle = True
    StyleFocused.LookAndFeel.Kind = lfUltraFlat
    StyleFocused.LookAndFeel.NativeStyle = True
    StyleHot.LookAndFeel.Kind = lfUltraFlat
    StyleHot.LookAndFeel.NativeStyle = True
  end
  object CloseBtn: TcxButton
    Left = 179
    Top = 378
    Width = 105
    Height = 41
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 2
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = True
  end
end
