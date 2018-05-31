object MaintainUserF: TMaintainUserF
  Left = 527
  Top = 394
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Maintain Users'
  ClientHeight = 354
  ClientWidth = 516
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
  object cxDBNavigator1: TcxDBNavigator
    Left = 24
    Top = 32
    Width = 262
    Height = 25
    Buttons.OnButtonClick = cxDBNavigator1ButtonsButtonClick
    Buttons.CustomButtons = <>
    Buttons.First.Hint = 'Show the first record'
    Buttons.PriorPage.Enabled = False
    Buttons.PriorPage.Visible = False
    Buttons.Prior.Hint = 'Move to the previous record'
    Buttons.Next.Hint = 'Move to the next record'
    Buttons.NextPage.Enabled = False
    Buttons.NextPage.Visible = False
    Buttons.Last.Hint = 'Show the last record'
    Buttons.Insert.Hint = 'Add a new record'
    Buttons.Delete.Hint = 'Delete the current Record'
    Buttons.Edit.Hint = 'Edit the current record'
    Buttons.Post.Hint = 'Commit the new record or changes'
    Buttons.Cancel.Hint = 'Cancel the latest changes'
    Buttons.Refresh.Hint = 'Refresh the record from the database'
    Buttons.SaveBookmark.Enabled = False
    Buttons.SaveBookmark.Visible = False
    Buttons.GotoBookmark.Enabled = False
    Buttons.GotoBookmark.Visible = False
    Buttons.Filter.Enabled = False
    Buttons.Filter.Visible = False
    DataSource = DMUserM.DSUsers
    InfoPanel.Font.Charset = DEFAULT_CHARSET
    InfoPanel.Font.Color = clDefault
    InfoPanel.Font.Height = -11
    InfoPanel.Font.Name = 'MS Sans Serif'
    InfoPanel.Font.Style = []
    InfoPanel.ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object UserNameDBED: TcxDBTextEdit
    Left = 128
    Top = 72
    DataBinding.DataField = 'USER_NAME'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.HideSelection = False
    Properties.OnChange = UserNameDBEDChange
    TabOrder = 1
    OnExit = UserNameDBEDExit
    Width = 161
  end
  object ROLELUCB: TcxDBLookupComboBox
    Left = 128
    Top = 136
    DataBinding.DataField = 'LOK_ON_ROLE'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.KeyFieldNames = 'ROLE_NAME'
    Properties.ListColumns = <
      item
        FieldName = 'ROLE_DESCRIPTION'
      end>
    Properties.ListSource = DMUserM.DSUserRoles
    TabOrder = 3
    Width = 161
  end
  object PWDDBED: TcxDBTextEdit
    Left = 128
    Top = 104
    DataBinding.DataField = 'DBPASSWORD'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.EchoMode = eemPassword
    Properties.OnChange = UserNameDBEDChange
    TabOrder = 2
    OnExit = UserNameDBEDExit
    Width = 161
  end
  object FIRSTDBED: TcxDBTextEdit
    Left = 128
    Top = 200
    DataBinding.DataField = 'FIRST_NAME'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.OnChange = UserNameDBEDChange
    TabOrder = 4
    OnExit = UserNameDBEDExit
    Width = 161
  end
  object MIDDLEDBED: TcxDBTextEdit
    Left = 128
    Top = 232
    DataBinding.DataField = 'MIDDLE_NAME'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.OnChange = UserNameDBEDChange
    TabOrder = 5
    OnExit = UserNameDBEDExit
    Width = 161
  end
  object LASTDBED: TcxDBTextEdit
    Left = 128
    Top = 264
    DataBinding.DataField = 'LAST_NAME'
    DataBinding.DataSource = DMUserM.DSUsers
    Properties.OnChange = UserNameDBEDChange
    TabOrder = 6
    OnExit = UserNameDBEDExit
    Width = 161
  end
  object cxLabel1: TcxLabel
    Left = 24
    Top = 4
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Users'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    Transparent = True
    Height = 22
    Width = 57
  end
  object CountLbl: TcxLabel
    Left = 296
    Top = 32
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'CountLbl'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -15
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.LookAndFeel.NativeStyle = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.NativeStyle = False
    Transparent = True
    Height = 25
    Width = 145
  end
  object cxLabel3: TcxLabel
    Left = 296
    Top = 72
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'The '#39'User Name'#39' can not be changed. If incorrect, delete and do ' +
      'again.'#13#10
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
    Height = 33
    Width = 212
  end
  object cxLabel2: TcxLabel
    Left = 296
    Top = 136
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Select from the drop down list.'
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
    Height = 22
    Width = 185
  end
  object cxLabel4: TcxLabel
    Left = 296
    Top = 104
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Type carefully!'
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
    Height = 26
    Width = 161
  end
  object cxLabel5: TcxLabel
    Left = 24
    Top = 168
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Optional Fields'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
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
    Height = 26
    Width = 77
  end
  object cxLabel6: TcxLabel
    Left = 24
    Top = 200
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'First Name'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 26
    Width = 77
  end
  object cxLabel7: TcxLabel
    Left = 24
    Top = 136
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Database Role'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 26
    Width = 97
  end
  object cxLabel8: TcxLabel
    Left = 24
    Top = 104
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Password'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 26
    Width = 77
  end
  object cxLabel9: TcxLabel
    Left = 24
    Top = 72
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'User Name'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 26
    Width = 77
  end
  object cxLabel10: TcxLabel
    Left = 24
    Top = 232
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Middle Name'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 26
    Width = 77
  end
  object cxLabel11: TcxLabel
    Left = 24
    Top = 264
    TabStop = False
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Last Name'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -15
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
    Height = 33
    Width = 77
  end
  object CloseBtn: TcxButton
    Left = 128
    Top = 305
    Width = 105
    Height = 41
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 7
    OnClick = CloseBtnClick
  end
end
