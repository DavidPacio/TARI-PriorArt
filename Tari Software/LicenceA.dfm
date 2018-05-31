object LicenceFA: TLicenceFA
  Left = 620
  Top = 296
  HorzScrollBar.Visible = False
  VertScrollBar.Visible = False
  AlphaBlend = True
  BiDiMode = bdLeftToRight
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'TARI for Business Licence'
  ClientHeight = 596
  ClientWidth = 743
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Calibri'
  Font.Style = [fsBold]
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 18
  object cxPageControl1: TcxPageControl
    Left = 0
    Top = 0
    Width = 743
    Height = 596
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clHotLight
    Font.Height = -16
    Font.Name = 'Calibri'
    Font.Style = []
    Font.Quality = fqAntialiased
    ParentFont = False
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.NavigatorPosition = npRightBottom
    Properties.OwnerDraw = True
    Properties.Style = 1
    Properties.TabPosition = tpBottom
    Properties.TabSlants.Positions = []
    LookAndFeel.NativeStyle = False
    LookAndFeel.SkinName = 'MoneyTwins'
    TabSlants.Positions = []
    ClientRectBottom = 568
    ClientRectLeft = 2
    ClientRectRight = 741
    ClientRectTop = 2
    object cxTabSheet1: TcxTabSheet
      Caption = 'Business Details'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Font.Quality = fqAntialiased
      ImageIndex = 0
      ParentFont = False
      object cxLabel1: TcxLabel
        Left = 0
        Top = 0
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'TARI for Business requires a licence before you can use it.'#13#10#13#10'P' +
          'lease complete the details on this page and also on the "Licenci' +
          'ng Details" page.'#13#10#13#10'The "Licencing Details" page has buttons fo' +
          'r sending a "Request for Licence" to Focus Based Management by:-' +
          ' '#13#10'1. Online. If you are connected to the Internet, the authoris' +
          'ation can be completed using Web Services.'#13#10'2. Email. If the Ema' +
          'il button is enabled, an email can be sent and received carrying' +
          ' the licence authorization.'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Font.Quality = fqAntialiased
        Style.LookAndFeel.Kind = lfOffice11
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.TransparentBorder = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfOffice11
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfOffice11
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfOffice11
        StyleHot.LookAndFeel.NativeStyle = False
        Transparent = True
        Height = 137
        Width = 729
      end
      object cxGroupBox3: TcxGroupBox
        Left = 3
        Top = 136
        Caption = 'Licence Request (Page 1)'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        TabOrder = 1
        Transparent = True
        Height = 409
        Width = 726
        object cxLabel21: TcxLabel
          Left = 8
          Top = 32
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Business Name'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 153
        end
        object cxLabel23: TcxLabel
          Left = 8
          Top = 64
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Address'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 117
        end
        object BusinessName: TcxTextEdit
          Left = 176
          Top = 32
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 1
          OnExit = BusinessNameExit
          Width = 401
        end
        object StateRegionLbl: TcxLabel
          Left = 8
          Top = 128
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'State / Region'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 110
        end
        object Postcodelbl: TcxLabel
          Left = 8
          Top = 160
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Postal Code'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 117
        end
        object PhoneNumS: TcxTextEdit
          Left = 176
          Top = 224
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 7
          Width = 193
        end
        object Countrylbl: TcxLabel
          Left = 8
          Top = 192
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Country'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 129
        end
        object BusinessFileName: TcxTextEdit
          Left = 176
          Top = 368
          ParentFont = False
          ParentShowHint = False
          Properties.ReadOnly = True
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 10
          Width = 401
        end
        object BusinessFileNameNote: TcxLabel
          Left = 176
          Top = 336
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 
            'A "File Licence" registers a file name for each file. Please use' +
            ' the prompted name unless you need to change it to avoid a confl' +
            'ict with a similar name.'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 33
          Width = 457
        end
        object Address: TcxTextEdit
          Left = 176
          Top = 64
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 2
          Width = 401
        end
        object Suburb: TcxTextEdit
          Left = 176
          Top = 96
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 193
        end
        object PostCode: TcxTextEdit
          Left = 176
          Top = 160
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 5
          Width = 193
        end
        object StateRegion: TcxTextEdit
          Left = 176
          Top = 128
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 193
        end
        object cxLabel22: TcxLabel
          Left = 8
          Top = 96
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Suburb/City'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 117
        end
        object cxLabel29: TcxLabel
          Left = 8
          Top = 224
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Phone Number'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 110
        end
        object cxLabel30: TcxLabel
          Left = 8
          Top = 256
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Fax Number'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 110
        end
        object BusinessFileNameLbl: TcxLabel
          Left = 8
          Top = 368
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Business File Name'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 153
        end
        object FaxNumS: TcxTextEdit
          Left = 176
          Top = 256
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 8
          Width = 193
        end
        object ContactFirstNameS: TcxTextEdit
          Left = 176
          Top = 304
          Hint = 'First name of Contact'
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 9
          Width = 193
        end
        object cxLabel19: TcxLabel
          Left = 392
          Top = 208
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 
            'Please include Country code, Area code and Number. '#13#10'eg +61 2 94' +
            '54 8555 (Australian)'#13#10'     +1 267 656 5627 (USA) '#13#10'     +44 20 4' +
            '253 6563 (UK)'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 90
          Width = 281
        end
        object cxLabel15: TcxLabel
          Left = 8
          Top = 304
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Name of Contact'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 20
          Width = 145
        end
        object cxLabel26: TcxLabel
          Left = 392
          Top = 96
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'All fields (except Fax Number) are required.'#13#10
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clRed
          Style.Font.Height = -16
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 33
          Width = 305
        end
        object Country: TcxComboBox
          Left = 176
          Top = 192
          AutoSize = False
          BeepOnEnter = False
          ParentFont = False
          Properties.DropDownListStyle = lsEditFixedList
          Properties.DropDownRows = 10
          Properties.DropDownSizeable = True
          Properties.ImmediatePost = True
          Properties.ImmediateUpdateText = True
          Properties.Items.Strings = (
            '<Select a country>'
            'Afghanistan'
            'Albania'
            'Algeria'
            'American Samoa'
            'Andorra'
            'Angola'
            'Anguilla'
            'Antarctica'
            'Antigua and Barbuda'
            'Argentina'
            'Armenia'
            'Aruba'
            'Australia'
            'Austria'
            'Azerbaijan'
            'Bahamas'
            'Bahrain'
            'Bangladesh'
            'Barbados'
            'Belarus'
            'Belgium'
            'Belize'
            'Benin'
            'Bermuda'
            'Bhutan'
            'Bolivia'
            'Bosnia and Herzegovina'
            'Botswana'
            'Bouvet Island'
            'Brazil'
            'British Indian Ocean Territory'
            'Brunei Darussalam'
            'Bulgaria'
            'Burkina Faso'
            'Burundi'
            'Cambodia'
            'Cameroon'
            'Canada'
            'Cape Verde'
            'Cayman Islands'
            'Central African Republic'
            'Chad'
            'Chile'
            'China'
            'Christmas Island'
            'Cocos (Keeling) Islands'
            'Colombia'
            'Comoros'
            'Congo'
            'Cook Islands'
            'Costa Rica'
            'C'#244'te d'#39'Ivoire'
            'Croatia'
            'Cuba'
            'Cyprus'
            'Czech Republic'
            'Denmark'
            'Djibouti'
            'Dominica'
            'Dominican Republic'
            'East Timor'
            'Ecuador'
            'Egypt'
            'El salvador'
            'Equatorial Guinea'
            'Eritrea'
            'Estonia'
            'Ethiopia'
            'Falkland Islands'
            'Faroe Islands'
            'Fiji'
            'Finland'
            'France'
            'French Guiana'
            'French Polynesia'
            'French Southern Territories'
            'Gabon'
            'Gambia'
            'Georgia'
            'Germany'
            'Ghana'
            'Gibraltar'
            'Greece'
            'Greenland'
            'Grenada'
            'Guadeloupe'
            'Guam'
            'Guatemala'
            'Guinea'
            'Guinea-Bissau'
            'Guyana'
            'Haiti'
            'Heard Island and McDonald Islands'
            'Holy See (Vatican City State)'
            'Honduras'
            'Hong Kong'
            'Hungary'
            'Iceland'
            'India'
            'Indonesia'
            'Iran'
            'Iraq'
            'Ireland'
            'Israel'
            'Italy'
            'Jamaica'
            'Japan'
            'Jordan'
            'Kazakstan'
            'Kenya'
            'Kiribati'
            'Kuwait'
            'Kyrgystan'
            'Lao'
            'Latvia'
            'Lebanon'
            'Lesotho'
            'Liberia'
            'Libyan Arab Jamahiriya'
            'Liechtenstein'
            'Lithuania'
            'Luxembourg'
            'Macau'
            'Macedonia (FYR)'
            'Madagascar'
            'Malawi'
            'Malaysia'
            'Maldives'
            'Mali'
            'Malta'
            'Marshall Islands'
            'Martinique'
            'Mauritania'
            'Mauritius'
            'Mayotte'
            'Mexico'
            'Micronesia'
            'Moldova'
            'Monaco'
            'Mongolia'
            'Montserrat'
            'Morocco'
            'Mozambique'
            'Myanmar'
            'Namibia'
            'Nauru'
            'Nepal'
            'Netherlands'
            'Netherlands Antilles'
            'Neutral Zone'
            'New Caledonia'
            'New Zealand'
            'Nicaragua'
            'Niger'
            'Nigeria'
            'Niue'
            'Norfolk Island'
            'North Korea'
            'Northern Mariana Islands'
            'Norway'
            'Oman'
            'Pakistan'
            'Palau'
            'Panama'
            'Papua New Guinea'
            'Paraguay'
            'Peru'
            'Philippines'
            'Pitcairn'
            'Poland'
            'Portugal'
            'Puerto Rico'
            'Qatar'
            'Reunion'
            'Romania'
            'Russian Federation'
            'Rwanda'
            'Saint Helena'
            'Saint Kitts and Nevis'
            'Saint Lucia'
            'Saint Pierre and Miquelon'
            'Saint Vincent and the Grenadines'
            'Samoa'
            'San Marino'
            'Sao Tome and Principe'
            'Saudi Arabia'
            'Senegal'
            'Seychelles'
            'Sierra Leone'
            'Singapore'
            'Slovakia'
            'Slovenia'
            'Solomon Islands'
            'Somalia'
            'South Africa'
            'South Georgia'
            'South Korea'
            'Spain'
            'Sri Lanka'
            'Sudan'
            'Suriname'
            'Svalbard and Jan Mayen Islands'
            'Swaziland'
            'Sweden'
            'Switzerland'
            'Syria'
            'Taiwan'
            'Tajikistan'
            'Tanzania'
            'Thailand'
            'Togo'
            'Tokelau'
            'Tonga'
            'Trinidad and Tobago'
            'Tunisia'
            'Turkey'
            'Turkmenistan'
            'Turks and Caicos Islands'
            'Tuvalu'
            'Uganda'
            'Ukraine'
            'United Arab Emirates'
            'United Kingdom'
            'United States'
            'United States Minor Outlying Islands'
            'Uruguay'
            'Uzbekistan'
            'Vanuatu'
            'Venezuela'
            'Viet Nam'
            'Virgin Islands (British)'
            'Virgin Islands (U.S.)'
            'Wallis and Futuna Islands'
            'Western Sahara'
            'Yemen'
            'Yugoslavia'
            'Zaire'
            'Zambia'
            'Zimbabwe')
          Properties.ReadOnly = False
          Properties.Sorted = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clWindowText
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 6
          Height = 21
          Width = 193
        end
        object GetBusNameBtn: TcxButton
          Left = 585
          Top = 32
          Width = 112
          Height = 49
          Caption = 'Get Business'#13#10'Name'
          ParentShowHint = False
          ShowHint = False
          TabOrder = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Calibri'
          Font.Style = [fsBold]
          Font.Quality = fqAntialiased
          ParentFont = False
          WordWrap = True
          OnClick = GetBusNameBtnClick
        end
        object ContactLastNameS: TcxTextEdit
          Left = 376
          Top = 304
          Hint = 'Last name of Contact'
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 24
          Width = 193
        end
        object cxLabel24: TcxLabel
          Left = 176
          Top = 288
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'First Name here'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          Transparent = True
          Height = 17
          Width = 81
        end
        object cxLabel25: TcxLabel
          Left = 376
          Top = 288
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Last Name here'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
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
          Height = 17
          Width = 89
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Licencing Details'
      ImageIndex = 1
      object cxLabel4: TcxLabel
        Left = 9
        Top = 52
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'Where the software is installed on a network, all attached works' +
          'tations are licenced when the server is licenced.'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clHotLight
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Font.Quality = fqAntialiased
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = False
        Transparent = True
        Height = 42
        Width = 710
      end
      object cxLabel20: TcxLabel
        Left = 176
        Top = 84
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Notebook computers require separate licencing.'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clRed
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 25
        Width = 324
      end
      object cxLabel2: TcxLabel
        Left = 9
        Top = 16
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'BEFORE pressing any buttons, please complete "Business Details" ' +
          'and the section entitled "Licence Request"'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Font.Quality = fqAntialiased
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        Transparent = True
        Height = 52
        Width = 713
      end
      object cxGroupBox1: TcxGroupBox
        Left = 9
        Top = 131
        Caption = 'Licence Request (Page 2)'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.IsFontAssigned = True
        TabOrder = 0
        Transparent = True
        Height = 185
        Width = 576
        object cxLabel11: TcxLabel
          Left = 8
          Top = 40
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Serial Number'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 108
        end
        object SerialNumber: TcxMaskEdit
          Left = 128
          Top = 40
          ParentFont = False
          ParentShowHint = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = 
            '[A-Z,0-9][A-Z,0-9][A-Z,0-9][A-Z,0-9]-[A-Z,0-9][A-Z,0-9][A-Z,0-9]' +
            '[A-Z,0-9]-[A-Z,0-9][A-Z,0-9][A-Z,0-9][A-Z,0-9]'
          Properties.MaxLength = 0
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 1
          Width = 129
        end
        object cxLabel3: TcxLabel
          Left = 256
          Top = 32
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'The Serial Number is on the CD. Required with this request.'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
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
          Width = 313
        end
        object cxLabel8: TcxLabel
          Left = 8
          Top = 72
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Licencee Name'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 117
        end
        object LicenceeNameS: TcxTextEdit
          Left = 128
          Top = 72
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 2
          OnEnter = LicenceeNameSEnter
          Width = 401
        end
        object cxLabel10: TcxLabel
          Left = 8
          Top = 104
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Email Address'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 110
        end
        object EmailAddressS: TcxTextEdit
          Left = 128
          Top = 104
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 401
        end
        object SupplierIDLbl: TcxLabel
          Left = 8
          Top = 144
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Supplier'#39's ID'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 25
          Width = 108
        end
        object SupplierID: TcxMaskEdit
          Left = 128
          Top = 144
          ParentFont = False
          ParentShowHint = False
          Properties.MaskKind = emkRegExprEx
          Properties.EditMask = '\d+'
          Properties.MaxLength = 0
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBackground
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 129
        end
        object AdvisorSerialNote: TcxLabel
          Left = 264
          Top = 136
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 
            'The Supplier ID is provided by your TARI Advisor. Required with ' +
            'this request'
          ParentColor = False
          ParentFont = False
          Style.Color = clAqua
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlue
          Style.Font.Height = -12
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
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
          Width = 309
        end
      end
      object TrialLicenceBtn: TcxButton
        Left = 255
        Top = 328
        Width = 137
        Height = 41
        Caption = 'Trial Licence'
        Colors.Normal = clBlue
        ParentShowHint = False
        ShowHint = False
        TabOrder = 8
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
        OnClick = TrialLicenceBtnClick
      end
      object cxLabel14: TcxLabel
        Left = 7
        Top = 336
        Hint = 
          'While you are waiting for your licence to issue, you may have 5 ' +
          'days of TARI for Business usage under a trial licence. Please co' +
          'mplete the licence application and sent to enable this button.'
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Trial Licence While You Wait'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.StyleController = DMRep1.cxEditStyleLabelLarge
        Style.IsFontAssigned = True
        Transparent = True
        Height = 24
        Width = 233
      end
      object cxLabel5: TcxLabel
        Left = 9
        Top = 379
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 
          'Complete this section only if you have received back a Licence N' +
          'umber via email after sending a Licence Request.'
        ParentColor = False
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clMaroon
        Style.Font.Height = -15
        Style.Font.Name = 'Calibri'
        Style.Font.Style = []
        Style.Font.Quality = fqAntialiased
        Style.LookAndFeel.NativeStyle = False
        Style.StyleController = DMRep1.cxEditStyleLabelSmall
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.NativeStyle = False
        StyleFocused.LookAndFeel.NativeStyle = False
        StyleHot.LookAndFeel.NativeStyle = False
        Transparent = True
        Height = 32
        Width = 710
      end
      object cxButton1: TcxButton
        Left = 592
        Top = 434
        Width = 139
        Height = 41
        Caption = 'Apply Full Licence'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 9
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
        OnClick = ApplyFullLicenceBtnClick
      end
      object PrintLicReqBtn: TcxButton
        Left = 592
        Top = 319
        Width = 138
        Height = 41
        Caption = 'Print Request'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
        OnClick = PrintLicReqBtnClick
      end
      object SendEmailBtn: TcxButton
        Left = 591
        Top = 209
        Width = 139
        Height = 41
        Caption = 'Via Email'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
        OnClick = SendEmailBtnClick
      end
      object OnLineBtn: TcxButton
        Left = 591
        Top = 144
        Width = 139
        Height = 49
        BiDiMode = bdLeftToRight
        Caption = 'Via Internet (Online)'
        Colors.Default = clRed
        Colors.DefaultText = clRed
        Colors.Normal = clRed
        Colors.Hot = clRed
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
        OnClick = OnLineBtnClick
      end
      object cxLabel13: TcxLabel
        Left = 597
        Top = 113
        TabStop = False
        RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
        AutoSize = False
        Caption = 'Submit Request'
        ParentColor = False
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clBlue
        Style.Font.Height = -17
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.StyleController = DMRep1.cxEditStyleLabelLarge
        Style.IsFontAssigned = True
        Transparent = True
        Height = 25
        Width = 139
      end
      object CloseBtn: TcxButton
        Left = 592
        Top = 503
        Width = 139
        Height = 41
        Caption = '&Close'
        ModalResult = 1
        ParentShowHint = False
        ShowHint = False
        TabOrder = 10
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Calibri'
        Font.Style = [fsBold]
        Font.Quality = fqAntialiased
        ParentFont = False
        WordWrap = True
      end
      object cxGroupBox2: TcxGroupBox
        Left = 9
        Top = 417
        Caption = 'Licence Details'
        LookAndFeel.Kind = lfUltraFlat
        LookAndFeel.NativeStyle = True
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -16
        Style.Font.Name = 'Calibri'
        Style.Font.Style = [fsBold]
        Style.Font.Quality = fqAntialiased
        Style.IsFontAssigned = True
        TabOrder = 12
        Transparent = True
        Height = 129
        Width = 577
        object SiteIDS: TcxTextEdit
          Left = 128
          Top = 28
          Hint = 'This number is automatically generated and can not be changed.'
          ParentFont = False
          ParentShowHint = False
          Properties.ReadOnly = True
          ShowHint = True
          Style.BorderStyle = ebs3D
          Style.Color = 49217450
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.Shadow = True
          Style.IsFontAssigned = True
          TabOrder = 0
          Width = 121
        end
        object cxLabel16: TcxLabel
          Left = 8
          Top = 29
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Site Number'
          ParentColor = False
          ParentFont = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 94
        end
        object cxLabel17: TcxLabel
          Left = 8
          Top = 61
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Expiry Date'
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 89
        end
        object ExpirydateDE: TcxDateEdit
          Left = 128
          Top = 60
          BeepOnEnter = False
          ParentFont = False
          ParentShowHint = False
          Properties.Alignment.Horz = taLeftJustify
          Properties.Alignment.Vert = taVCenter
          Properties.DateButtons = [btnClear]
          Properties.SaveTime = False
          Properties.ShowTime = False
          Properties.OnCloseUp = ExpirydateDEPropertiesCloseUp
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.TransparentBorder = False
          Style.IsFontAssigned = True
          TabOrder = 3
          Width = 121
        end
        object cxLabel18: TcxLabel
          Left = 8
          Top = 93
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 'Licence Number'
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
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
          Height = 20
          Width = 121
        end
        object LicNumber: TcxTextEdit
          Left = 128
          Top = 92
          Hint = 
            'This number will be supplied when the licence is issued. Leave b' +
            'lank when requesting a licence.'
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -13
          Style.Font.Name = 'Calibri'
          Style.Font.Style = [fsBold]
          Style.Font.Quality = fqAntialiased
          Style.IsFontAssigned = True
          TabOrder = 4
          Width = 121
        end
        object cxLabel7: TcxLabel
          Left = 257
          Top = 64
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 
            'When you have entered the licence number, Press the "Apply Licen' +
            'ce" button to check your data entry.'
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.LookAndFeel.SkinName = 'MoneyTwins'
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
          StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
          StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
          Transparent = True
          Height = 59
          Width = 304
        end
        object cxLabel6: TcxLabel
          Left = 257
          Top = 27
          TabStop = False
          RepositoryItem = DMRep1.cxEditRepository1Label1WithWrap
          AutoSize = False
          Caption = 
            'This number is for confirmation that the licence is for this Sit' +
            'e or computer.'
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clMaroon
          Style.Font.Height = -15
          Style.Font.Name = 'Calibri'
          Style.Font.Style = []
          Style.Font.Quality = fqAntialiased
          Style.LookAndFeel.SkinName = 'MoneyTwins'
          Style.StyleController = DMRep1.cxEditStyleLabelSmall
          Style.IsFontAssigned = True
          StyleDisabled.LookAndFeel.SkinName = 'MoneyTwins'
          StyleFocused.LookAndFeel.SkinName = 'MoneyTwins'
          StyleHot.LookAndFeel.SkinName = 'MoneyTwins'
          Transparent = True
          Height = 46
          Width = 312
        end
      end
    end
  end
  object PrintDialog1: TPrintDialog
    Left = 680
    Top = 16
  end
end
