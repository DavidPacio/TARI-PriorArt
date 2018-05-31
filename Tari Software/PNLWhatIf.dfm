object PNLWhatIfF: TPNLWhatIfF
  Left = 564
  Top = 439
  HorzScrollBar.Smooth = True
  HorzScrollBar.Style = ssHotTrack
  VertScrollBar.Smooth = True
  VertScrollBar.Style = ssHotTrack
  VertScrollBar.Tracking = True
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Profit and Loss - What If'
  ClientHeight = 643
  ClientWidth = 778
  Color = clBtnFace
  Constraints.MaxHeight = 760
  Constraints.MaxWidth = 1020
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label73: TcxLabel
    Left = 9
    Top = 127
    Hint = 
      '"Price" refers to an adjustment in the sale price of units, reta' +
      'ining the same cost of sales.'#13#10'"Volume" refers to an adjustment ' +
      'up or down in the number of units sold, retaining the same gross' +
      ' profit %.'
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'The base data is either the Past period or your initial Target e' +
      'stimates.'#13#10'Price and Cost must be changed first after pressing '#39 +
      'Reset'#39'. Other editing will disable these functions'#13#10'Play with ea' +
      'ch scenario and then apply one to your Targets.'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
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
    Height = 99
    Width = 289
  end
  object Label81: TcxLabel
    Left = 456
    Top = 127
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'Note: The value of Sales, Gross Profit and Net Profit may change' +
      ' by + 1 or -1 due to arithmetical rounding.'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
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
    Height = 50
    Width = 313
  end
  object Label58: TcxLabel
    Left = 624
    Top = 208
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '% Change'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 79
  end
  object Label59: TcxLabel
    Left = 16
    Top = 232
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Sales'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 265
  end
  object Label60: TcxLabel
    Left = 16
    Top = 256
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Gross Profit'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 265
  end
  object Label61: TcxLabel
    Left = 16
    Top = 280
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Gross Profit %'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 265
  end
  object Label63: TcxLabel
    Left = 16
    Top = 344
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Sales per'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 281
  end
  object Label62: TcxLabel
    Left = 16
    Top = 368
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Gross Profit per'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 281
  end
  object Label82: TcxLabel
    Left = 4
    Top = 364
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '*'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 12
  end
  object Label83: TcxLabel
    Left = 4
    Top = 396
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '*'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 12
  end
  object Label64: TcxLabel
    Left = 16
    Top = 400
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Billed '
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 281
  end
  object Label65: TcxLabel
    Left = 16
    Top = 424
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Potential'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 281
  end
  object Label66: TcxLabel
    Left = 16
    Top = 448
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Productivity %'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 281
  end
  object Label67: TcxLabel
    Left = 16
    Top = 488
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Total Expenses'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 281
  end
  object Label68: TcxLabel
    Left = 16
    Top = 512
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Net Operating Profit'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 281
  end
  object Label85: TcxLabel
    Left = 16
    Top = 560
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Key Drivers'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clHotLight
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 137
  end
  object Label84: TcxLabel
    Left = 4
    Top = 558
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '*'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 12
  end
  object RGBase: TcxRadioGroup
    Left = 304
    Top = 176
    Caption = 'Base'
    ParentFont = False
    Properties.Columns = 2
    Properties.Items = <
      item
        Caption = 'Past'
        Value = 0
      end
      item
        Caption = 'Target'
        Value = 1
      end>
    ItemIndex = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 0
    OnClick = RGBaseClick
    Height = 50
    Width = 121
  end
  object RGScene: TcxRadioGroup
    Left = 456
    Top = 176
    Caption = 'Scenario'
    ParentFont = False
    Properties.Columns = 3
    Properties.DefaultValue = 0
    Properties.Items = <
      item
        Caption = '1'
        Value = 0
      end
      item
        Caption = '2'
        Value = 1
      end
      item
        Caption = '3'
        Value = 2
      end>
    ItemIndex = 0
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    OnClick = RGSceneClick
    Height = 50
    Width = 121
  end
  object WIScenGPPC: TcxCurrencyEdit
    Left = 456
    Top = 280
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenGPPCPropertiesChange
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 19
    Height = 21
    Width = 121
  end
  object WIScenGPPCSpin: TcxSpinButton
    Left = 577
    Top = 280
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenGPPCSpinPropertiesEditValueChanged
    TabOrder = 35
    Visible = False
    Height = 21
    Width = 19
  end
  object WIBaseSales: TcxCurrencyEdit
    Left = 304
    Top = 232
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 36
    Width = 121
  end
  object WIBaseGP: TcxCurrencyEdit
    Left = 304
    Top = 256
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 37
    Width = 121
  end
  object WIBaseGPPC: TcxCurrencyEdit
    Left = 304
    Top = 280
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 38
    Width = 121
  end
  object WIBaseSalesUnit: TcxCurrencyEdit
    Left = 304
    Top = 344
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 39
    Width = 121
  end
  object WIBaseGPUnit: TcxCurrencyEdit
    Left = 304
    Top = 368
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 40
    Width = 121
  end
  object WIBaseBilled: TcxCurrencyEdit
    Left = 304
    Top = 400
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;(,0.00)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 41
    Width = 121
  end
  object WIBasePotential: TcxCurrencyEdit
    Left = 304
    Top = 424
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = ',0.00;(,0.00)'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 42
    Width = 121
  end
  object WIBaseProductivity: TcxCurrencyEdit
    Left = 304
    Top = 448
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 43
    Width = 121
  end
  object WIBaseTotalExp: TcxCurrencyEdit
    Left = 304
    Top = 488
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 44
    Width = 121
  end
  object WIBaseNetProfit: TcxCurrencyEdit
    Left = 304
    Top = 512
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 45
    Width = 121
  end
  object WIScenSales: TcxCurrencyEdit
    Left = 456
    Top = 232
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 46
    Width = 121
  end
  object WIScenGP: TcxCurrencyEdit
    Left = 456
    Top = 256
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 47
    Width = 121
  end
  object WIScenTotalExp: TcxCurrencyEdit
    Left = 456
    Top = 488
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 48
    Width = 121
  end
  object WIScenNetProfit: TcxCurrencyEdit
    Left = 456
    Top = 512
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 49
    Width = 121
  end
  object WIChangeSales: TcxCurrencyEdit
    Left = 624
    Top = 232
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 50
    Width = 121
  end
  object WIChangeGP: TcxCurrencyEdit
    Left = 624
    Top = 256
    TabStop = False
    EditValue = 0c
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseThousandSeparator = True
    Style.Color = 49217450
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 51
    Width = 121
  end
  object WIScenSalesUnit: TcxCurrencyEdit
    Left = 456
    Top = 344
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenSalesUnitPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 21
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIScenSalesUnitSpin: TcxSpinButton
    Left = 577
    Top = 344
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenSalesUnitSpinPropertiesEditValueChanged
    TabOrder = 52
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIScenGPUnit: TcxCurrencyEdit
    Left = 456
    Top = 368
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '$,0.00;($,0.00)'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenGPUnitPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 24
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIScenGPUnitSpin: TcxSpinButton
    Left = 577
    Top = 368
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenGPUnitSpinPropertiesEditValueChanged
    TabOrder = 53
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIScenBilled: TcxCurrencyEdit
    Left = 456
    Top = 400
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = ',0.00;(,0.00)'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenBilledPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 25
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIScenBilledSpin: TcxSpinButton
    Left = 577
    Top = 400
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenBilledSpinPropertiesEditValueChanged
    TabOrder = 54
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIScenPotential: TcxCurrencyEdit
    Left = 456
    Top = 424
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = ',0.00;(,0.00)'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenPotentialPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 27
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIScenPotentialSpin: TcxSpinButton
    Left = 577
    Top = 424
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenPotentialSpinPropertiesEditValueChanged
    TabOrder = 55
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIScenProductivity: TcxCurrencyEdit
    Left = 456
    Top = 448
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIScenProductivityPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 29
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIScenProductivitySpin: TcxSpinButton
    Left = 577
    Top = 448
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIScenProductivitySpinPropertiesEditValueChanged
    TabOrder = 56
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIChangeGPPC: TcxCurrencyEdit
    Left = 624
    Top = 280
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.ReadOnly = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangeGPPCPropertiesChange
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
    Height = 21
    Width = 121
  end
  object WIChangeGPPCSpin: TcxSpinButton
    Left = 745
    Top = 280
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangeGPPCSpinPropertiesEditValueChanged
    TabOrder = 57
    Visible = False
    Height = 21
    Width = 19
  end
  object WIChangeSalesUnit: TcxCurrencyEdit
    Left = 624
    Top = 344
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangeSalesUnitPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 22
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIChangeSalesUnitSpin: TcxSpinButton
    Left = 745
    Top = 344
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangeSalesUnitSpinPropertiesEditValueChanged
    TabOrder = 58
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIChangeGPUnit: TcxCurrencyEdit
    Left = 624
    Top = 368
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangeGPUnitPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 23
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIChangeGPUnitSpin: TcxSpinButton
    Left = 745
    Top = 368
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangeGPUnitSpinPropertiesEditValueChanged
    TabOrder = 59
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIChangeBilled: TcxCurrencyEdit
    Left = 624
    Top = 400
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangeBilledPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 26
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIChangeBilledSpin: TcxSpinButton
    Left = 745
    Top = 400
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangeBilledSpinPropertiesEditValueChanged
    TabOrder = 60
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIChangePotential: TcxCurrencyEdit
    Left = 624
    Top = 424
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangePotentialPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 28
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIChangePotentialSpin: TcxSpinButton
    Left = 745
    Top = 424
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangePotentialSpinPropertiesEditValueChanged
    TabOrder = 61
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object WIChangeProductivity: TcxCurrencyEdit
    Left = 624
    Top = 448
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = WIChangeProductivityPropertiesChange
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 30
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 121
  end
  object WIChangeProductivitySpin: TcxSpinButton
    Left = 745
    Top = 448
    AutoSize = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = WIChangeProductivitySpinPropertiesEditValueChanged
    TabOrder = 63
    OnEnter = WIScenSalesUnitEnter
    Height = 21
    Width = 19
  end
  object ResetBtn: TcxButton
    Left = 304
    Top = 552
    Width = 121
    Height = 41
    Caption = 'Reset'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      180000000000300900001B0B00001B0B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC6734B45B28A03D
      0BA03D0BA03D0BA03D0BB45B28BC6734FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFB45B28A03D0B7928198F35129D4416A34A17A04616953A137E29
      11662421A03D0BB45B28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB45B28A03D0BAA5219C26F22
      D08028D08028D08028D08028D08028D08028D08028CA7925AA5219762311A03D
      0BB45B28FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFA03D0BAA5219C97829D08028D08028D08028CF7F27CC7B26C97825
      CA7926CF7F27D08028D08028D08028CE7E27A7501966221BA03D0BFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA03D0BAE5A25D58936D3
      8631D2822CC26F23A55123AF6E50B5816E6E1104B17E6BB47C63A85D37B15A1C
      CE7E27D08028D08028C06D22721E11A03D0BFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFA03D0BB76630D88F3FD78C3BCD7F32A75731C8A095F9F4EDFE
      FDF9F4EEE7741D12E7D9D4FEFEFEFDFDF6E1D0C2AB6C52B66220D08028D08028
      C77524721E11A03D0BFF00FFFF00FFFF00FFFF00FFFF00FFB45B28AA582DDC95
      49DA9244C67835AF715EF5EBE0FBF1DCF9ECCCF8ECC9F7EDC9F2E7C5F7F1D0F9
      F6DDFCFBEEFEFEFDFDFDF7CFB09FA95624CF7F27D08028C06D2266221BB45B28
      FF00FFFF00FFFF00FFFF00FFA03D0BDE9A52DD984ECC813FB67D6CF9EBD3F8E4
      BEF8E5BFF8E7C2F8E9C4F8EBC7F8EDCAF8F0CDF8F2CFF8F4D2F9F7DAFDFCF3FE
      FEFDDDC9B8A95624D08028D08028A75019A03D0BFF00FFFF00FFFF00FFB45B28
      CC844BE19E57DD9951AC664FF7E0BEF8DFB7F8E1B9F8E3BCF8E5BFF8E7C2F8E9
      C4F8EBC7F8EDCAF8F0CDF8F2CFF8F4D2F8F6D6FCFBEDFEFEFDCFB09EB66220D0
      8028CE7E27762311B45B28FF00FFFF00FFA03D0BE4A561E3A15CB4663AE7C29F
      F8DBB1F8DDB3F8DFB7F8E1B9F8E3BCF8E5BFF8E7C2F8E9C4F8EBC7F8EDCAF8F0
      CDF8F2CFF8F4D2F8F6D5FCFCF1FDFCF6AB6C52CE7E27D08028AA5219A03D0BFF
      00FFBC6734BA6F45E6A866E2A15FB46F53F8D6AB006000F8DBB1F8DDB3F8DFB6
      F8E1B9F8E3BCF8E5BFF8E7C2F8E9C4F8EBC7F8EDCAF8F0CDF8F2CFF8F4D2F8F6
      D7FEFEFAE1CFC0B15B1CD08028CA7925662421BC6734B45B28DC9C64E8AB6ACB
      8550D5A17F0060000ECD4C006000F8DBB1F8DDB3F8DFB7F8E1B9F8E3BCF8E5BF
      F8E7C2F8E9C4F8EBC7F8EDCAF8F0CDF8F2CFF8F4D2FBF9E6FDFDF4A85C36D080
      28D080287F2911B45B28A03D0BE9AE72E9AD6FB76B450060000ECD4C319A0232
      9101006000F8DBB1F8DDB3F8DFB7F2DCB5CEBD9DECDAB6F7E7C2F8E9C4F8EBC7
      F8EDCAF8F0CDF8F2CFF8F4D5FEFEFBB37B62CF7F27D08028963A13A03D0BA03D
      0BEDB478EBB1740060000ECD4C2BA5122CA30F2DA10D2E9208006000F8DBB1F5
      DBB26C64573630276C6457A3977EA49980A49B82A49C84A7A088F1E9C7F7F0CE
      EDE4D9B58370CA7926D08028A04616A03D0BA03D0BEEB77D0060000ECD4C25B2
      2526AF2227AD1F28AC1C29A9192C9011006000EDD2A9363027D8D9D936302701
      01010101010101010101010A0A08E8DFBDF1E5C271160D6E1004C97825D08028
      A34A17A03D0BA03D0B0060000ECD4C1EBE381FBC3421BA3222B82F23B62C24B4
      2925B2262B8D170060008E7E673630270807068D8069D4C2A1D5C5A4D5C6A6D6
      CAAAF6EAC6F7ECC8E9DBC8B07862CC7C26D080289E4416A03D0B006000009000
      0090000090000090001BC4421CC23E1DC13B0090000090000090000090000060
      00E6CBA4363027100F0CB2A286F7E2BBF8E5BFF8E7C2F8E9C4F8EBC7FBF6E6AE
      6D4ECF7F27D080288E3412B45B28BC6734CC844BF2BD87896E3600900016CF51
      17CD4E18CB4B398231FAECCCF8D2A6F8D4A8F8D6ABF8D9AEE5CAA3302A221311
      0EB7A789F7E2BCF8E5BFF8E7C2F8E9C4F7EEDAA55122D08028D08028792819BC
      6734FF00FFA03D0BF3C08CC7A06800900011D96112D75D13D55B368736FBF8E0
      F8D0A3F8D2A6F8D4A8F8D6ABF8D9AEE2C8A12D282014120EBCAA8CF7E2BCF8E5
      BFF8E8C5C69C8CC26F23D08028C16F22A03D0BFF00FFFF00FFB45B28DC9C64F3
      C08C0090000CE3700DE16D0DE06A2D8C39FCFEEBFAE4C2F8D1A3F8D2A6F8D4A8
      F8D6ABF8D9AEDEC49F29241D181612C0AF90F7E3BCF1DDBDA75730D2822CD080
      289A4014B45B28FF00FFFF00FFFF00FFA03D0BF5C39065A04E06EE8008EC7D09
      EA7A209F41FCFFEDFCFEEBFAF0D3F8D6ACF8D2A6F8D4A8F8D6ABF8D9AEDDC39E
      28231D95866EF6DFB7AE6A50CE8032D38631C97829A03D0BFF00FFFF00FFFF00
      FFFF00FFB45B28DC9C64BFA96C16BE4C03F48904F28611CA63828C74FCFFEDFC
      FFEBFBFCE6FAE8C6F8D5AAF8D4A8F8D6ABF8D9AEEED2AAF4D8B0B47359C77936
      D78C3BD58936913A17B45B28FF00FFFF00FFFF00FFFF00FFFF00FFA03D0BDC9C
      64599F5101FA9600FC9501FA922A8A3E9A9E8FFCFFECF9FBE7D0B7A2F4EFD4F9
      E4BFF8D5A9F8D6ABE5BE99AA6144CC813FDA9244D88F3FAE5A25A03D0BFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA03D0BDC9C642DAF5700FE9900FF
      9901F8951BAD56437C443C3B126869468C8F75A87E68D6AC8FB36E51B5663ADD
      9951DD984EDC9549B76630A03D0BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFFF00FFFF00FFA03D0BDC9C6431AB5502F89400FF9900FF9900FF9B06E9
      89269E49368736B86E48CB8551E2A15FE3A15CE19E57DE9A52AA582DA03D0BFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      B45B28A03D0B8998544DAA5840AD57669E51A49450EDB478EBB174E9AD6FE8AB
      6AE6A866E4A561CC844BA03D0BB45B28FF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB45B28A03D0B
      DC9C64EDB682F0BA82EEB77DEDB478E9AE72DC9C64BB6F45A03D0BB45B28FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFBC6734B45B28A03D0BA03D0B
      A03D0BA03D0BB45B28BC6734FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = ResetBtnClick
  end
  object ApplyToTargetsBtn: TcxButton
    Left = 624
    Top = 535
    Width = 137
    Height = 41
    Caption = 'Apply to Targets'
    OptionsImage.Glyph.Data = {
      66090000424D660900000000000036000000280000001C0000001C0000000100
      18000000000030090000430B0000430B00000000000000000000FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFC1AC9D6947316947316947316947316947
      3169473169473169473169473169473169473169473169473169473169473169
      4731694731694731694731694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC2AD9EEFE7E3B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A2
      93B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A293B7A29369
      4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC3AE9FF1EAE6EFE7E3
      EDE5E0ECE3DEEBE1DBE9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCB
      C2DBC9BFDBC9BFDBC9BFDBC9BFDBC9BFB7A293694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFC4AFA0F2ECE8F1EAE6EFE7E3EDE5E0ECE3DEEBE1DB
      E9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCBC2DBC9BFDBC9BFDBC9
      BFDBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC5
      B0A1F4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DEEBE1DBE9DED7E7DBD4E5D9D1
      E3D6CEE2D3CBE0D1C8DECEC5DCCBC2DBC9BFDBC9BFDBC9BFB7A293694731FF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC6B1A2F5F1EEF4EEEBF2ECE8F1
      EAE6EFE7E3EDE5E0ECE3DEEBE1DBE9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8
      DECEC5DCCBC2DBC9BFDBC9BFB7A293694731FF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFC6B1A2F7F3F1F5F1EEF4EEEBF2ECE8F1EAE6EFE7E3EDE5E0EC
      E3DEEBE1DBE9DED7E7DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCBC2DBC9BF
      B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC7B2A3F9F6
      F4F7F3F1F5F1EEF4EEEBF2ECE8F1EAE6EFE7E3EDE5E0ECE3DEEBE1DBE9DED7E7
      DBD4E5D9D1E3D6CEE2D3CBE0D1C8DECEC5DCCBC2B7A293694731FF00FFFF00FF
      FF00FFFF00FFFF00FFFF00FFFF00FFC8B3A4FBF9F8F9F7F5F8F4F2F6F2EFF5F0
      EDF3EDEAF1EBE7F0E8E4EEE6E1EDE4DFEBE2DCEADFD9E8DDD6E6DAD3E4D7D0E3
      D5CDE1D2C9DFCFC6B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
      FF00FFC8B3A4FDFCFBFBF9F8F9F7F5F8F4F2F6F2EFF5F0EDF3EDEAF1EBE7F0E8
      E4EEE6E1EDE4DFEBE2DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDE1D2C9B7A29369
      4731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCAB4A6FEFEFDFDFCFB
      FBF9F8F9F7F5F8F4F2F6F2EFF5F0EDF3EDEAF1EBE7F0E8E4EEE6E1EDE4DFEBE2
      DCEADFD9E8DDD6E6DAD3E4D7D0E3D5CDB7A293694731FF00FFFF00FFFF00FFFF
      00FFFF00FFFF00FFFF00FFCAB5A6FFFFFFFEFEFDFDFCFBFBF9F8F9F7F5F8F4F2
      F6F2EFF5F0EDF3EDEAF0E9E4F0E8E49B3506EDE4DFEBE2DCEADFD9E8DDD6E6DA
      D3E4D7D0B7A293694731FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCB
      B6A7FFFFFFFFFFFFFEFEFDFDFCFBFBF9F8F9F7F5F8F4F2F6F2EFF4EEEAF3EDEA
      9C380AB45E2F9D3B0EEDE4DFEBE2DCEADFD9E8DDD6E6DAD3B7A2936947317787
      91181E23181E23181E23181E23181E23181E23181E23181E23181E23181E2318
      1E23181E23181E23F9F7F5F7F2EFF6F2EF9C380AE3A481CA7E55B45E2F9D3B0E
      EDE4DFEBE2DCEADFD9E8DDD6B7A29369473177879192CFE72384BC2384BC2384
      BC2384BC2384BC2384BC2384BC2384BC2384BC2384BC2384BC181E23FAF7F5F9
      F7F59D390CE3A481CA7E55C37348C37348B45D2E9F4013EDE4DFEBE2DCEADFD9
      B7A2936947317787919FD8EB92CFE785C6E279BEDD6DB6D861AED454A5CF489D
      CA3B94C52F8CC02384BC2384BC181E23FDFDFC9B3506E4A582E4A582E4A582C3
      7348C37348C37348B45D2E9F3F13EDE5E0ECE3DEB7A293694731778791ABE0F0
      9FD8EB92CFE785C6E279BEDD6DB6D861AED454A5CF489DCA3B94C52F8CC02384
      BC181E239B35069B35069A34049A3404E4A582C37348B35C2DA041159A34049A
      3404EFE7E3EDE5E0B7A293694731778791B8E9F5ABE0F09FD8EB92CFE785C6E2
      79BEDD6DB6D861AED454A5CF489DCA3B94C52384BC181E23FDFCFBFAF4F2D8B2
      9FA04013D69069B45E2F9E3B0DDCBDAEEFE4DFEDE2DCF1E9E5EFE7E3B7A29369
      4731778791C4F1FAB8E9F5ABE0F09FD8EB92CFE785C6E279BEDD6DB6D861AED4
      54A5CF489DCA2384BC181E23FFFFFFFBF8F6B76E4CA34115D69069A13F11BA73
      53F5EEEBF5F1EEF4EEEBF2ECE8F1EAE6B7A293694731778791C4F1FAC4F1FABE
      EDF7B2E5F3A5DCEE98D3E98CCBE479BEDD6DB6D861AED454A5CF2384BC181E23
      F4E9E3C07E60A24216D69069B45D2EA4481DEAD7CDF9F6F4F7F3F1D5BFB1CAB5
      A6B7A293B7A293694731778791C4F1FAC4F1FAC4F1FABEEDF7B2E5F3A5DCEE98
      D3E98CCBE47FC2DF73BADB67B2D62384BC181E23A84D23A54519D69069B45E2F
      9F3D0FDAB7A5FCFAF9FAF8F6C6B1A26947316947316947316947316947317787
      91C4F1FAC4F1FAC4F1FAC4F1FABEEDF7B2E5F3A5DCEE98D3E98CCBE47FC2DFDC
      7B4AA94913993202983000A03D10A03F12B1613CDDB9A9FEFDFCFDFDFCFCFAF9
      C7B2A3F3EBE6EFE6E0E8DCD4DBC9BF694731778791C4F1FAC4F1FAC4F1FAC4F1
      FAC4F1FABEEDF7B2E5F3A5DCEE98D3E98CCBE4D07243A33F0C923B11C28264DA
      B4A2EEDCD4FBF7F5FFFFFFFFFFFFFFFFFFFEFEFDC8B3A4EFE6E0E8DCD4DBC9BF
      694731FF00FF778791C4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FABEEDF7B2E5
      F3A5DCEE98D3E98CCBE42384BC181E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFC8B3A4E8DCD4DBC9BF694731FF00FFFF00FF778791C4F1FA
      C4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FABEEDF7B2E5F3A5DCEE98D3E92384
      BC181E23FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAB4A6DB
      C9BF694731FF00FFFF00FFFF00FF778791C4F1FAC4F1FAC4F1FAC4F1FAC4F1FA
      C4F1FAC4F1FAC4F1FABEEDF7B2E5F3A5DCEE2384BC181E23D0BAACCFBAABCFB9
      ABCEB8AACDB8A9CCB7A8CCB6A8CBB6A7CAB5A6694731FF00FFFF00FFFF00FFFF
      00FF778791C4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FAC4F1FA
      C4F1FAB8E9F5ABE0F0181E23FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF77879177879177879177
      8791778791778791778791778791778791778791778791778791778791778791
      FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
      FFFF00FFFF00FFFF00FF}
    TabOrder = 32
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = ApplyToTargetsBtnClick
  end
  object TargetExpensesBtn: TcxButton
    Left = 624
    Top = 488
    Width = 137
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
    TabOrder = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = TargetExpensesBtnClick
  end
  object CloseBtn: TcxButton
    Left = 624
    Top = 584
    Width = 137
    Height = 41
    Caption = 'Close'
    TabOrder = 34
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = CloseBtnClick
  end
  object HourspdLblWI: TcxLabel
    Left = 16
    Top = 600
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 409
  end
  object PeriodDatesLbl: TcxLabel
    Left = 289
    Top = 153
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
    Properties.Alignment.Horz = taCenter
    Properties.Alignment.Vert = taVCenter
    Transparent = True
    Height = 17
    Width = 161
    AnchorX = 370
    AnchorY = 162
  end
  object cxButton3: TcxButton
    Left = 304
    Top = 127
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
    TabOrder = 65
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentFont = False
    OnClick = cxButton3Click
  end
  object PriceChange: TcxCurrencyEdit
    Left = 304
    Top = 312
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = PriceChangePropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 66
    Height = 21
    Width = 121
  end
  object CostChange: TcxCurrencyEdit
    Left = 624
    Top = 312
    AutoSize = False
    BeepOnEnter = False
    EditValue = 0.000000000000000000
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ChangeEnterToTab = True
    Properties.DisplayFormat = '0.00 %;(0.00) %'
    Properties.UseLeftAlignmentOnEditing = False
    Properties.UseThousandSeparator = True
    Properties.OnEditValueChanged = CostChangePropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Shadow = False
    Style.StyleController = DMRep1.CurrencyEditStyle
    Style.IsFontAssigned = True
    TabOrder = 68
    Height = 21
    Width = 121
  end
  object cxLabel2: TcxLabel
    Left = 160
    Top = 312
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Price Change (%)'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 137
  end
  object cxLabel3: TcxLabel
    Left = 488
    Top = 312
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Cost Change (%)'
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    Transparent = True
    Height = 20
    Width = 129
  end
  object PriceChangeSpin: TcxSpinButton
    Left = 425
    Top = 312
    Associate = PriceChange
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.100000000000000000
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = PriceChangeSpinPropertiesEditValueChanged
    TabOrder = 70
    Height = 21
    Width = 19
  end
  object CostChangeSpin: TcxSpinButton
    Left = 745
    Top = 312
    Associate = CostChange
    AutoSize = False
    ParentFont = False
    Properties.Alignment.Horz = taRightJustify
    Properties.Alignment.Vert = taVCenter
    Properties.ImmediatePost = True
    Properties.Increment = 0.100000000000000000
    Properties.UseLeftAlignmentOnEditing = False
    Properties.ValueType = vtFloat
    Properties.OnEditValueChanged = cxSpinButton1PropertiesEditValueChanged
    TabOrder = 72
    Height = 21
    Width = 19
  end
  object cxLabel5: TcxLabel
    Left = 148
    Top = 308
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '*'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 12
  end
  object cxLabel6: TcxLabel
    Left = 476
    Top = 308
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = '*'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clRed
    Style.Font.Height = -21
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 17
    Width = 12
  end
  object cxLabel4: TcxLabel
    Left = 9
    Top = 87
    RepositoryItem = DMRep1.LabelCentredNoWrap
    AutoSize = False
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
    Height = 25
    Width = 761
    AnchorX = 390
    AnchorY = 100
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
