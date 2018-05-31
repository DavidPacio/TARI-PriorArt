object BackupFrm: TBackupFrm
  Left = 619
  Top = 291
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Database Backup / Restore'
  ClientHeight = 571
  ClientWidth = 692
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Calibri'
  Font.Style = []
  Font.Quality = fqAntialiased
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object cxGroupBox1: TcxGroupBox
    Left = 8
    Top = 133
    Caption = 'Backing Up Database'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ParentBackground = False
    ParentColor = False
    Style.Color = clMoneyGreen
    TabOrder = 0
    Height = 215
    Width = 265
    object SelectBackupBtn: TcxButton
      Left = 8
      Top = 28
      Width = 249
      Height = 25
      Caption = '1. Select file to back up'
      OptionsImage.Margin = 20
      TabOrder = 0
      OnClick = SelectBackupBtnClick
    end
    object EditBackupName: TcxButton
      Left = 8
      Top = 113
      Width = 249
      Height = 25
      Caption = '2. Edit Name of File Backup.'
      OptionsImage.Margin = 20
      TabOrder = 1
      OnClick = EditBackupNameClick
    end
    object BackupFile: TcxTextEdit
      Left = 8
      Top = 62
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 2
      Width = 249
    end
    object BackUpName: TcxTextEdit
      Left = 8
      Top = 144
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      TabOrder = 3
      Width = 249
    end
    object cxButton1: TcxButton
      AlignWithMargins = True
      Left = 7
      Top = 172
      Width = 249
      Height = 25
      Margins.Left = 8
      Caption = '3. Start the backup on the Server.'
      OptionsImage.Margin = 20
      OptionsImage.Spacing = 3
      TabOrder = 4
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      Font.Quality = fqAntialiased
      ParentFont = False
      OnClick = StartBackupBtnClick
    end
    object ActiveModified: TcxLabel
      Left = 72
      Top = 90
      AutoSize = False
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      Transparent = True
      Height = 17
      Width = 184
    end
    object cxLabel5: TcxLabel
      Left = 7
      Top = 90
      AutoSize = False
      Caption = 'Modified'
      Transparent = True
      Height = 17
      Width = 59
    end
  end
  object cxGroupBox2: TcxGroupBox
    Left = 8
    Top = 355
    Caption = 'Zipping File'
    ParentBackground = False
    ParentColor = False
    Style.Color = clAqua
    TabOrder = 1
    Height = 113
    Width = 265
    object ZipDestBtn: TcxButton
      Left = 8
      Top = 21
      Width = 249
      Height = 25
      Caption = '4. Select the destination of the Zip file.'
      OptionsImage.Margin = 20
      TabOrder = 0
      OnClick = ZipDestBtnClick
    end
    object ZipDest: TcxTextEdit
      Left = 8
      Top = 52
      Style.LookAndFeel.Kind = lfUltraFlat
      Style.LookAndFeel.NativeStyle = True
      StyleDisabled.LookAndFeel.Kind = lfUltraFlat
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.LookAndFeel.Kind = lfUltraFlat
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.LookAndFeel.Kind = lfUltraFlat
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Width = 249
    end
    object ZIPFileBtn: TcxButton
      Left = 8
      Top = 80
      Width = 249
      Height = 25
      Caption = '5. Zip the backed up file.'
      OptionsImage.Margin = 20
      TabOrder = 2
      OnClick = ZIPFileBtnClick
    end
  end
  object cxGroupBox3: TcxGroupBox
    Left = 8
    Top = 474
    Caption = 'Sending Zip File'
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    Style.Color = clInfoBk
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -12
    Style.Font.Name = 'Calibri'
    Style.Font.Style = []
    Style.Font.Quality = fqAntialiased
    Style.IsFontAssigned = True
    TabOrder = 2
    Transparent = True
    Height = 89
    Width = 265
    object Zipdestselectioncb: TcxComboBox
      Left = 8
      Top = 28
      Properties.Items.Strings = (
        'Send Zipped file to A: Drive (Floppy)'
        'Send Zipped via Email')
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      TabOrder = 0
      Text = 'Send Zipped file to A: Drive (Floppy)'
      Width = 249
    end
    object SendZippedBtn: TcxButton
      Left = 8
      Top = 56
      Width = 249
      Height = 25
      Caption = '6. Send Zipped file. (Floppy or Email)'
      OptionsImage.Margin = 20
      TabOrder = 1
      OnClick = SendZippedBtnClick
    end
  end
  object cxGroupBox4: TcxGroupBox
    Left = 415
    Top = 133
    Caption = 'Unzipping File'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    ParentBackground = False
    ParentColor = False
    Style.Color = clAqua
    TabOrder = 3
    Height = 159
    Width = 265
    object SelectzipRestoreBtn: TcxButton
      Left = 8
      Top = 30
      Width = 249
      Height = 25
      Caption = '1. Select Zip file to Restore'
      OptionsImage.Margin = 12
      TabOrder = 0
      OnClick = SelectzipRestoreBtnClick
    end
    object Zipfiletorestore: TcxTextEdit
      Left = 8
      Top = 62
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      TabOrder = 1
      Width = 249
    end
    object UnzipBtn: TcxButton
      Left = 8
      Top = 110
      Width = 249
      Height = 25
      Caption = '2. Unzip the file to the Server Backup folder.'
      OptionsImage.Margin = 12
      TabOrder = 2
      OnClick = UnzipBtnClick
    end
    object ZipModified: TcxLabel
      Left = 64
      Top = 86
      AutoSize = False
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      Transparent = True
      Height = 17
      Width = 193
    end
    object cxLabel7: TcxLabel
      Left = 8
      Top = 86
      Caption = 'Modified'
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      Transparent = True
    end
  end
  object cxGroupBox5: TcxGroupBox
    Left = 415
    Top = 298
    Caption = 'Restoring Database'
    ParentBackground = False
    ParentColor = False
    Style.Color = clMoneyGreen
    TabOrder = 4
    Height = 191
    Width = 265
    object EditRestoreDBNameBtn: TcxButton
      Left = 8
      Top = 88
      Width = 249
      Height = 25
      Caption = '4. Edit Name of Database being restored.'
      OptionsImage.Margin = 12
      TabOrder = 0
      OnClick = EditRestoreDBNameBtnClick
    end
    object SelectRestoreBtn: TcxButton
      Left = 8
      Top = 24
      Width = 249
      Height = 25
      Caption = '3. Select file to Restore'
      OptionsImage.Margin = 12
      TabOrder = 1
      OnClick = SelectRestoreBtnClick
    end
    object StartRestoreBtn: TcxButton
      Left = 13
      Top = 149
      Width = 249
      Height = 25
      Caption = '5. Start the restore on the Server.'
      OptionsImage.Margin = 12
      TabOrder = 2
      OnClick = StartRestoreBtnClick
    end
    object NewDBName: TcxTextEdit
      Left = 8
      Top = 120
      Style.LookAndFeel.Kind = lfOffice11
      Style.LookAndFeel.NativeStyle = False
      Style.LookAndFeel.SkinName = 'LiquidSky'
      StyleDisabled.LookAndFeel.Kind = lfOffice11
      StyleDisabled.LookAndFeel.NativeStyle = False
      StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
      StyleFocused.LookAndFeel.Kind = lfOffice11
      StyleFocused.LookAndFeel.NativeStyle = False
      StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
      StyleHot.LookAndFeel.Kind = lfOffice11
      StyleHot.LookAndFeel.NativeStyle = False
      StyleHot.LookAndFeel.SkinName = 'LiquidSky'
      TabOrder = 3
      Width = 249
    end
    object RestoreFilename: TcxTextEdit
      Left = 8
      Top = 56
      TabOrder = 4
      Width = 249
    end
  end
  object cxLabel1: TcxLabel
    Left = 8
    Top = 8
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'The facility provided here allows active database files to be ba' +
      'cked up to a smaller file on the server'#39's disk drive. This proce' +
      'ss "cleans" the database of unused space.'#13#10#13#10'The backed up file ' +
      'will have the same name as the original file but with an extensi' +
      'on of ".fbk" and saved in the TARI for Business Backup Folder. T' +
      'he backed up file may be placed in a "zip" file for email transm' +
      'ission or external backup to a Floppy disk.'
    ParentColor = False
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'LiquidSky'
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'LiquidSky'
    Transparent = True
    Height = 89
    Width = 673
  end
  object cxLabel2: TcxLabel
    Left = 280
    Top = 168
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 
      'As a minimum:-  Do steps 1 to 3 for Backup;  Do steps 3 to 5 for' +
      ' Restore.'#13#10#13#10'DO NOT RESTORE TO AN ACTIVE DATABASE. The current D' +
      'atabase is not active at this time.'#13#10#13#10'Zipping a Backup file onl' +
      'y to send via email or do external backup.'
    ParentColor = False
    Style.StyleController = DMRep1.cxEditStyleLabelSmall
    Transparent = True
    Height = 278
    Width = 129
  end
  object cxLabel3: TcxLabel
    Left = 8
    Top = 103
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Database Backup'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Font.Quality = fqAntialiased
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'LiquidSky'
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'LiquidSky'
    Transparent = True
    Height = 24
    Width = 217
  end
  object cxLabel4: TcxLabel
    Left = 415
    Top = 103
    RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
    AutoSize = False
    Caption = 'Database Restore'
    ParentColor = False
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -16
    Style.Font.Name = 'Calibri'
    Style.Font.Style = [fsBold]
    Style.Font.Quality = fqAntialiased
    Style.LookAndFeel.Kind = lfOffice11
    Style.LookAndFeel.NativeStyle = False
    Style.LookAndFeel.SkinName = 'LiquidSky'
    Style.StyleController = DMRep1.cxEditStyleLabelLarge
    Style.IsFontAssigned = True
    StyleDisabled.LookAndFeel.Kind = lfOffice11
    StyleDisabled.LookAndFeel.NativeStyle = False
    StyleDisabled.LookAndFeel.SkinName = 'LiquidSky'
    StyleFocused.LookAndFeel.Kind = lfOffice11
    StyleFocused.LookAndFeel.NativeStyle = False
    StyleFocused.LookAndFeel.SkinName = 'LiquidSky'
    StyleHot.LookAndFeel.Kind = lfOffice11
    StyleHot.LookAndFeel.NativeStyle = False
    StyleHot.LookAndFeel.SkinName = 'LiquidSky'
    Transparent = True
    Height = 24
    Width = 217
  end
  object CloseBtn: TcxButton
    Left = 579
    Top = 507
    Width = 105
    Height = 41
    Caption = '&Close'
    TabOrder = 9
    OnClick = CloseBtnClick
  end
  object ADPhysIBDriverLink1: TADPhysIBDriverLink
    DriverID = 'FB_25'
    Left = 320
    Top = 24
  end
  object ADIBBackup1: TADIBBackup
    DriverLink = ADPhysIBDriverLink1
    Protocol = ipTCPIP
    Host = 'devwin7'
    UserName = 'SYSDBA'
    Password = 'masterkey'
    SqlRoleName = 'FBMADMIN'
    Left = 280
    Top = 96
  end
  object ADIBRestore1: TADIBRestore
    DriverLink = ADPhysIBDriverLink1
    Protocol = ipTCPIP
    UserName = 'SYSDBA'
    Password = 'masterkey'
    SqlRoleName = 'FBMADMIN'
    Options = [roReplace, roCreate]
    Left = 352
    Top = 96
  end
end
