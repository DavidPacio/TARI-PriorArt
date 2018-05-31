object MWClientForm: TMWClientForm
  Left = 0
  Top = 0
  Caption = 'Tari SaaS - Import Export'
  ClientHeight = 743
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object dxBevel1: TdxBevel
    Left = 8
    Top = 305
    Width = 273
    Height = 176
  end
  object Username: TcxTextEdit
    Left = 104
    Top = 338
    TabOrder = 0
    Width = 169
  end
  object Passwordtxt: TcxTextEdit
    Left = 104
    Top = 365
    Properties.EchoMode = eemPassword
    Properties.PasswordChar = '*'
    TabOrder = 1
    Width = 169
  end
  object cxLabel1: TcxLabel
    Left = 16
    Top = 339
    Caption = 'User Name:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
  end
  object cxLabel2: TcxLabel
    Left = 16
    Top = 366
    Caption = 'Password:'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
  end
  object LoginLabel: TcxLabel
    Left = 16
    Top = 423
    AutoSize = False
    Caption = 'Logged in as: '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
    Height = 26
    Width = 257
  end
  object LoginBtn: TcxButton
    Left = 104
    Top = 392
    Width = 97
    Height = 25
    Caption = 'Login'
    TabOrder = 5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    OnClick = LoginBtnClick
  end
  object TSBusinessSelect: TcxLookupComboBox
    Left = 296
    Top = 342
    ParentFont = False
    Properties.HideSelection = False
    Properties.IncrementalFiltering = False
    Properties.KeyFieldNames = 'BUSINESS_ID'
    Properties.ListColumns = <
      item
        Caption = 'Tari SaaS Business Name'
        Width = 64
        FieldName = 'BUSINESS_NAME'
      end
      item
        Caption = 'Within Ciurrent File'
        HeaderAlignment = taCenter
        Width = 30
        FieldName = 'WithinLocal'
      end>
    Properties.ListOptions.ColumnSorting = False
    Properties.ListSource = DMTariMWClient.DSMemberBusinesses
    Properties.ReadOnly = False
    Properties.OnEditValueChanged = cxDBLookupComboBox1PropertiesEditValueChanged
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.TextColor = clHotLight
    Style.IsFontAssigned = True
    TabOrder = 6
    OnEnter = TSBusinessSelectEnter
    Width = 361
  end
  object cxMemo1: TcxMemo
    Left = 0
    Top = 0
    Align = alTop
    Lines.Strings = (
      'Log In:'
      
        ' - Login using your normal Tari_SaaS login. If the login is succ' +
        'essful, your name will be shown as "Logged in" and the dropdown ' +
        'list under'
      
        '   "Your Tari SaaS Businesses" will be filled with the names of ' +
        'your businesses.'
      ''
      'Linking Tari SaaS and Tari for Business:'
      
        ' - Before any transfer of data can be done, both the source and ' +
        'the destination must be linked. When a Tari for Business file an' +
        'd one of its departments is linked'
      
        '   to a Tari SaaS business, the import and export button become ' +
        'enabled (not grayed out).'
      
        ' - First, from the Main Screen of Tari for Business, select the ' +
        'file and the department you wish to use in a transfer. If the se' +
        'lected department has been linked,'
      
        '   it will be linked automatically after logging in or if you se' +
        'lect a Tari SaaS that has been linked, the Tari for Business fil' +
        'e will be opened and the appropriate'
      '   department selected for you. '
      
        ' - Next select a Tari SaaS business and press the large button t' +
        'o create the link. The same button will reflect any established ' +
        'link and allow for the link'#39's'
      '   deletion.'
      ''
      'Transfering Data.'
      
        ' - With a link  selected, select the items to included in the tr' +
        'ansfer and then click the "Import" or "Export" button. Repeated ' +
        'transfers will not duplicate data.')
    ParentFont = False
    Properties.ReadOnly = True
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.HotTrack = False
    Style.TextColor = clHotLight
    Style.IsFontAssigned = True
    TabOrder = 7
    Height = 289
    Width = 1003
  end
  object TSLinkBtn: TcxButton
    Left = 296
    Top = 379
    Width = 361
    Height = 76
    TabOrder = 8
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    WordWrap = True
    OnClick = TSLinkBtnClick
  end
  object cxDBLabel2: TcxDBLabel
    Left = 675
    Top = 392
    DataBinding.DataField = 'BRANCH_NAME'
    DataBinding.DataSource = DataModuleClient.DSBusinesses
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.TextColor = clHotLight
    Style.IsFontAssigned = True
    Transparent = True
    Height = 21
    Width = 310
  end
  object cxDBLabel3: TcxDBLabel
    Left = 675
    Top = 445
    DataBinding.DataField = 'REVENUE_GROUP_NAME'
    DataBinding.DataSource = DataModuleClient.DSDepartments
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.TextColor = clHotLight
    Style.IsFontAssigned = True
    Transparent = True
    Height = 21
    Width = 310
  end
  object cxDBLabel4: TcxDBLabel
    Left = 675
    Top = 338
    DataBinding.DataField = 'BUSINESS_NAME'
    DataBinding.DataSource = DataModuleClient.DSBusinessDetails
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.TextColor = clHotLight
    Style.IsFontAssigned = True
    Transparent = True
    Height = 21
    Width = 310
  end
  object cxLabel3: TcxLabel
    Left = 675
    Top = 311
    AutoSize = False
    Caption = 'Selected Local Business Name'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Font.Quality = fqClearType
    Style.TextColor = clBtnText
    Style.IsFontAssigned = True
    Transparent = True
    Height = 21
    Width = 310
  end
  object cxLabel4: TcxLabel
    Left = 675
    Top = 365
    AutoSize = False
    Caption = 'Business Branch'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
    Height = 21
    Width = 145
  end
  object cxLabel5: TcxLabel
    Left = 675
    Top = 419
    AutoSize = False
    Caption = 'Revenue Group'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 154
  end
  object cxLabel7: TcxLabel
    Left = 296
    Top = 311
    AutoSize = False
    Caption = 'Selected Tari SaaS Business'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
    Height = 25
    Width = 201
  end
  object SelectionGroup: TcxCheckGroup
    Left = 311
    Top = 522
    Caption = 'Import/Export - Selection'
    ParentFont = False
    Properties.Items = <
      item
        Caption = 'Analysis Data'
      end
      item
        Caption = 'Analysis Invoices'
        Tag = 1
      end
      item
        Caption = 'Target Data (including Monthly Targets)'
        Tag = 2
      end
      item
        Caption = 'Tracking Invoices'
        Tag = 3
      end>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    TabOrder = 16
    Height = 169
    Width = 329
  end
  object ImportBtn: TcxButton
    Left = 136
    Top = 578
    Width = 161
    Height = 57
    Caption = 'Import from Tari SaaS as Selected'
    TabOrder = 17
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    WordWrap = True
    OnClick = ImportBtnClick
  end
  object ExportBtn: TcxButton
    Left = 654
    Top = 578
    Width = 145
    Height = 57
    Caption = 'Export to Tari SaaS as Selected'
    TabOrder = 18
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    WordWrap = True
    OnClick = ExportBtnClick
  end
  object cxLabel6: TcxLabel
    Left = 16
    Top = 311
    Caption = 'Tari SaaS Login'
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Font.Quality = fqClearType
    Style.IsFontAssigned = True
    Transparent = True
  end
  object CloseBtn: TcxButton
    Left = 886
    Top = 682
    Width = 99
    Height = 41
    Caption = '&Close'
    TabOrder = 20
    OnClick = CloseBtnClick
  end
  object cxDBNavigator1: TcxDBNavigator
    Left = 675
    Top = 472
    Width = 140
    Height = 25
    Buttons.CustomButtons = <>
    Buttons.PriorPage.Enabled = False
    Buttons.PriorPage.Visible = False
    Buttons.NextPage.Enabled = False
    Buttons.NextPage.Visible = False
    Buttons.Insert.Enabled = False
    Buttons.Insert.Visible = False
    Buttons.Append.Enabled = False
    Buttons.Delete.Enabled = False
    Buttons.Delete.Visible = False
    Buttons.Edit.Enabled = False
    Buttons.Edit.Visible = False
    Buttons.Post.Enabled = False
    Buttons.Post.Visible = False
    Buttons.Cancel.Enabled = False
    Buttons.Cancel.Visible = False
    Buttons.Refresh.Enabled = False
    Buttons.Refresh.Visible = False
    Buttons.SaveBookmark.Enabled = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Enabled = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Enabled = False
    Buttons.Filter.Visible = False
    DataSource = DataModuleClient.DSDepartments
    TabOrder = 21
  end
  object DeselectAllBtn: TcxButton
    Left = 543
    Top = 697
    Width = 97
    Height = 25
    Caption = 'Deselect All'
    TabOrder = 22
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    OnClick = DeselectAllBtnClick
  end
  object SelectAllBtn: TcxButton
    Left = 311
    Top = 697
    Width = 97
    Height = 25
    Caption = 'Select All'
    TabOrder = 23
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqClearType
    ParentFont = False
    OnClick = SelectAllBtnClick
  end
  object RemainLoggedInBtn: TcxCheckBox
    Left = 16
    Top = 447
    Caption = 'Remain Logged In ?'
    Properties.Alignment = taRightJustify
    TabOrder = 24
    Transparent = True
    OnClick = RemainLoggedInBtnClick
    Width = 185
  end
end
