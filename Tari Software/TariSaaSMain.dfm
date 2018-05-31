object TariSaaSMainF: TTariSaaSMainF
  Left = 0
  Top = 0
  Caption = 'Tari SaaS Desktop'
  ClientHeight = 576
  ClientWidth = 867
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxLabel1: TcxLabel
    Left = 24
    Top = 25
    Caption = 'Username or Email Address:'
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 24
    Top = 52
    Caption = 'Password:'
    Transparent = True
  end
  object UsernameTxt: TcxTextEdit
    Left = 176
    Top = 24
    TabOrder = 2
    Text = 'StratnVox'
    Width = 185
  end
  object Passwordtxt: TcxTextEdit
    Left = 176
    Top = 51
    Properties.EchoMode = eemPassword
    TabOrder = 3
    Text = 'Kupunn33'
    Width = 185
  end
  object LoginBtn: TcxButton
    Left = 408
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Login'
    TabOrder = 4
    OnClick = LoginBtnClick
  end
  object LogoutBtn: TcxButton
    Left = 519
    Top = 40
    Width = 89
    Height = 25
    Caption = 'Logout'
    Enabled = False
    TabOrder = 5
    OnClick = LogoutBtnClick
  end
  object cxGrid1: TcxGrid
    Left = 24
    Top = 96
    Width = 584
    Height = 200
    TabOrder = 6
    LookAndFeel.NativeStyle = False
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DMTSaas.DSMemberBusinesses
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.GroupByBox = False
      OptionsView.HeaderAutoHeight = True
      OptionsView.Indicator = True
      object cxGrid1DBTableView1BUSINESS_NAME: TcxGridDBColumn
        Caption = 'Business Name'
        DataBinding.FieldName = 'BUSINESS_NAME'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 195
      end
      object cxGrid1DBTableView1CITY: TcxGridDBColumn
        Caption = 'City / Suburb / Town'
        DataBinding.FieldName = 'CITY'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.ReadOnly = True
        GroupSummaryAlignment = taCenter
        HeaderAlignmentHorz = taCenter
        Width = 236
      end
      object cxGrid1DBTableView1CURRENCY_SYM: TcxGridDBColumn
        Caption = 'Currency Symbol'
        DataBinding.FieldName = 'CURRENCY_SYM'
        PropertiesClassName = 'TcxTextEditProperties'
        Properties.Alignment.Horz = taCenter
        Properties.ReadOnly = True
        HeaderAlignmentHorz = taCenter
        Width = 113
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object cxButton1: TcxButton
    Left = 680
    Top = 112
    Width = 105
    Height = 25
    Caption = 'Detailed Targets'
    TabOrder = 7
    OnClick = cxButton1Click
  end
  object cxButton2: TcxButton
    Left = 680
    Top = 152
    Width = 57
    Height = 25
    Caption = 'Next'
    TabOrder = 8
    OnClick = cxButton2Click
  end
  object cxButton3: TcxButton
    Left = 752
    Top = 152
    Width = 57
    Height = 25
    Caption = 'Previous'
    TabOrder = 9
    OnClick = cxButton3Click
  end
  object cxDBCurrencyEdit1: TcxDBCurrencyEdit
    Left = 696
    Top = 288
    TabOrder = 10
    Width = 121
  end
  object BalanceEdit: TcxCurrencyEdit
    Left = 680
    Top = 200
    Properties.DecimalPlaces = 0
    Properties.DisplayFormat = '$,0;-$,0'
    TabOrder = 11
    Width = 121
  end
  object IB_ArrayGrid1: TIB_ArrayGrid
    Left = 24
    Top = 326
    Width = 777
    Height = 251
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 12
    DataSource = DMTSaas.IB_DSDetailedTargets
    DataField = 'BALANCES'
    DataFields.Strings = (
      'BALANCES')
    DumbLabels = False
    MaxItemsPerLine = 2147483647
    MaxItemsShown = 2147483647
    ColWidths = (
      64
      134)
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'MoneyTwins'
    Left = 720
    Top = 24
  end
end
