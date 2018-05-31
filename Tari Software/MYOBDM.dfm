object DMMYOBInterface: TDMMYOBInterface
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleCreate
  Left = 467
  Top = 267
  Height = 761
  Width = 749
  object MYOBDatabase: TDatabase
    AliasName = 'MYOB_TARI'
    Connected = True
    DatabaseName = 'MYOB_TARI'
    HandleShared = True
    LoginPrompt = False
    SessionName = 'Default'
    AfterConnect = MYOBDatabaseAfterConnect
    BeforeConnect = MYOBDatabaseBeforeConnect
    Left = 32
    Top = 16
  end
  object IB_Query1: TIB_Query
    DatabaseName = 'MYOB_FDB'
    FieldsDisplayWidth.Strings = (
      'PRODUCT_ID=102'
      'SALES=130'
      'UNITS=110')
    SQL.Strings = (
      'SELECT X.TRANS_DATE'
      '   , SUM(Y.NET_SALE_VALUE) AS SALES'
      
        '   , SUM((SELECT UNITS_LABOUR FROM PRODUCTS WHERE PRODUCTS.PRODU' +
        'CT_ID=Y.PRODUCT_ID) * Y.QUANTITY) AS UNITS'
      'FROM TRANSACTIONS X'
      'JOIN DAILY_TRANS Y ON (Y.TRANS_ID=X.TRANS_ID)'
      'JOIN PRODUCTS Z ON (Z.PRODUCT_ID=Y.PRODUCT_ID)'
      'WHERE Z.IS_LABOUR = 1'
      'GROUP BY X.TRANS_DATE')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    IsTree = False
    TreeTrash = 0
    TreeExpandLevel = 0
    Left = 392
    Top = 16
  end
  object IB_Query2: TIB_Query
    DatabaseName = 'MYOB_FDB'
    SQL.Strings = (
      'SELECT X.TRANS_DATE'
      '   , Y.NET_SALE_VALUE'
      '   , Z.SELLING_PRICE'
      '   , Z.COST_PRICE'
      'FROM TRANSACTIONS X'
      'JOIN DAILY_TRANS Y ON (Y.TRANS_ID=X.TRANS_ID)'
      'JOIN PRODUCTS Z ON (Z.PRODUCT_ID=Y.PRODUCT_ID)'
      'WHERE (Z.IS_LABOUR = 0) AND (Y.NET_SALE_VALUE > 0)')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    IsTree = False
    TreeTrash = 0
    TreeExpandLevel = 0
    Left = 480
    Top = 16
  end
  object IB_Query3: TIB_Query
    DatabaseName = 'MYOB_FDB'
    FieldsDisplayWidth.Strings = (
      'PROD_GROUP=128'
      'DESCRIPTION=178'
      'LAST_UPDATED=131'
      'LASTNAME=163'
      'MAX=80'
      'COMPONENT_QTY=99')
    SQL.Strings = (
      'SELECT R.PRODUCT_ID'
      '     , R.DESCRIPTION'
      '     , R.SELLING_PRICE'
      '     , R.UNITS_LABOUR'
      
        '     , (SELECT Q.PRODUCT_ID FROM PRODUCT_COMPONENTS Q where(Q.CO' +
        'MPONENT_ID=R.PRODUCT_ID) and (Q.PRODUCT_ID=:MAINPRODUCT)) AS MAI' +
        'N_PRODUCT'
      'FROM PRODUCTS R'
      
        'where (SELECT Q.PRODUCT_ID FROM PRODUCT_COMPONENTS Q where(Q.COM' +
        'PONENT_ID=R.PRODUCT_ID) and (Q.PRODUCT_ID=:MAINPRODUCT)) IS NOT ' +
        'NULL'
      
        'ORDER BY (SELECT P.COMPONENT_ORDER FROM PRODUCT_COMPONENTS P whe' +
        're (P.COMPONENT_ID=R.PRODUCT_ID) and (P.PRODUCT_ID=:MAINPRODUCT)' +
        ')'
      'for update')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    RequestLive = True
    BufferSynchroFlags = []
    FetchWholeRows = True
    IsTree = False
    TreeTrash = 0
    TreeExpandLevel = 0
    Left = 400
    Top = 80
    ParamValues = (
      'MAINPRODUCT=1001'
      'PRM_2=0')
  end
  object StyleRepository: TcxStyleRepository
    Left = 408
    Top = 312
    object cxStyle1: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle16: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle17: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle18: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle19: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle20: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
    end
    object cxStyle21: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle22: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlue
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clYellow
    end
    object cxStyle23: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle24: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle25: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle26: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle27: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle28: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle29: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle30: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle31: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16247513
      TextColor = clBlack
    end
    object cxStyle32: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14811135
      TextColor = clBlack
    end
    object cxStyle33: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle34: TcxStyle
      AssignedValues = [svColor]
      Color = 14872561
    end
    object cxStyle35: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle36: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle37: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle38: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 4707838
      TextColor = clBlack
    end
    object cxStyle39: TcxStyle
      AssignedValues = [svColor]
      Color = 15451300
    end
    object cxStyle40: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clNavy
    end
    object cxStyle41: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12937777
      TextColor = clWhite
    end
    object cxStyle42: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15136253
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7346457
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = []
      TextColor = 7346457
    end
    object cxStyle43: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16436871
      TextColor = clBlack
    end
    object cxStyle44: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 8036607
      TextColor = clBlack
    end
    object cxStyle45: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle46: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12180223
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle47: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 1262987
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle48: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle49: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle50: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8894686
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle51: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle52: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle53: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle54: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 9234160
      TextColor = clBlack
    end
    object cxStyle55: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11788021
      TextColor = clBlack
    end
    object cxStyle56: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle57: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11193702
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle58: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5737262
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle59: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle60: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5736750
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle61: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9157775
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle62: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle63: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4615972
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle64: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle65: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16775416
      TextColor = clBlack
    end
    object cxStyle66: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16443110
      TextColor = clBlack
    end
    object cxStyle67: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13749760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle68: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14599344
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle69: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8519755
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 14481663
    end
    object cxStyle70: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13749760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle71: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 191
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle72: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13749760
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle73: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle74: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 166
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle75: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle76: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clSilver
      TextColor = clBlack
    end
    object cxStyle77: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461355
      TextColor = clBlack
    end
    object cxStyle78: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle79: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle80: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle81: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle82: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle83: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6908265
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle84: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlue
    end
    object cxStyle85: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 85
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle86: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle87: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10862530
      TextColor = clBlack
    end
    object cxStyle88: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13820129
      TextColor = clBlack
    end
    object cxStyle89: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10862530
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle90: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6392205
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 13820129
    end
    object cxStyle91: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 66
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 13820129
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = 13820129
    end
    object cxStyle92: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10862530
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle93: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6392205
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle94: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10862530
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle95: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clMaroon
    end
    object cxStyle96: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6392205
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle97: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle98: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 12307669
      TextColor = clBlack
    end
    object cxStyle99: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14542570
      TextColor = clBlack
    end
    object cxStyle100: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle101: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle102: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6852002
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle103: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle104: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle105: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12307669
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle106: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clTeal
    end
    object cxStyle107: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clTeal
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle108: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle109: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11055248
      TextColor = clBlack
    end
    object cxStyle110: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14211272
      TextColor = clBlack
    end
    object cxStyle111: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle112: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 524288
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 524288
    end
    object cxStyle113: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4194368
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle114: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle115: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle116: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11055248
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle117: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7897176
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = 7897176
    end
    object cxStyle118: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 7897176
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle119: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Garamond'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle120: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14264494
      TextColor = clBlack
    end
    object cxStyle121: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15521240
      TextColor = clBlack
    end
    object cxStyle122: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14264494
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle123: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11619930
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle124: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle125: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14264494
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Garamond'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle126: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11619930
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle127: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14264494
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle128: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 11619930
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = 11619930
    end
    object cxStyle129: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11619930
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle130: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle131: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11458790
      TextColor = clBlack
    end
    object cxStyle132: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14150898
      TextColor = clBlack
    end
    object cxStyle133: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle134: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 14150898
    end
    object cxStyle135: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle136: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle137: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle138: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11458790
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle139: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clMaroon
    end
    object cxStyle140: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4630214
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle141: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle142: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11639171
      TextColor = clBlack
    end
    object cxStyle143: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14273729
      TextColor = clBlack
    end
    object cxStyle144: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11639171
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle145: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8217935
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 14273729
    end
    object cxStyle146: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle147: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11639171
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle148: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8217935
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle149: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11639171
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle150: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 8217935
    end
    object cxStyle151: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 8217935
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle152: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 15461375
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle153: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle154: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15461375
      TextColor = clBlack
    end
    object cxStyle155: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle156: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3552892
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 14540253
    end
    object cxStyle157: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 3552892
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle158: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle159: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5855675
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle160: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13158655
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Times New Roman'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle161: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 7364767
    end
    object cxStyle162: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5855675
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle163: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle164: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13154717
      TextColor = clBlack
    end
    object cxStyle165: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 14933198
      TextColor = clBlack
    end
    object cxStyle166: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle167: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clSilver
    end
    object cxStyle168: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4276545
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle169: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle170: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle171: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 13154717
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle172: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 9928789
    end
    object cxStyle173: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 9928789
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle174: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle175: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11126946
      TextColor = clBlack
    end
    object cxStyle176: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13886416
      TextColor = clBlack
    end
    object cxStyle177: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle178: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 13886416
    end
    object cxStyle179: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 2178849
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle180: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle181: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle182: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 11126946
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -17
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle183: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = 6592345
    end
    object cxStyle184: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 6592345
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle185: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle186: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10542814
      TextColor = clBlack
    end
    object cxStyle187: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 13692654
      TextColor = clBlack
    end
    object cxStyle188: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10542814
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle189: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4308156
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle190: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 1916928
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clWhite
    end
    object cxStyle191: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10542814
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle192: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle193: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 10542814
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = [fsBold]
      TextColor = clBlack
    end
    object cxStyle194: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clOlive
    end
    object cxStyle195: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = clOlive
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Microsoft Sans Serif'
      Font.Style = []
      TextColor = clWhite
    end
    object TARI_DEV_ExpressStyle: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Background = cxStyle4
      Styles.Content = cxStyle15
      Styles.ContentEven = cxStyle16
      Styles.ContentOdd = cxStyle17
      Styles.FilterBox = cxStyle18
      Styles.Inactive = cxStyle23
      Styles.IncSearch = cxStyle24
      Styles.Selection = cxStyle27
      Styles.Footer = cxStyle19
      Styles.Group = cxStyle20
      Styles.GroupByBox = cxStyle21
      Styles.Header = cxStyle22
      Styles.Indicator = cxStyle25
      Styles.Preview = cxStyle26
      BuiltIn = True
    end
    object GridTableViewStyleSheetUserFormat1: TcxGridTableViewStyleSheet
      Caption = 'UserFormat1'
      Styles.Content = cxStyle42
      Styles.ContentEven = cxStyle43
      Styles.ContentOdd = cxStyle44
      Styles.Inactive = cxStyle49
      Styles.Selection = cxStyle52
      Styles.Footer = cxStyle45
      Styles.Group = cxStyle46
      Styles.GroupByBox = cxStyle47
      Styles.Header = cxStyle48
      Styles.Indicator = cxStyle50
      Styles.Preview = cxStyle51
      BuiltIn = True
    end
    object GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet
      Caption = 'UserFormat2'
      Styles.Content = cxStyle53
      Styles.ContentEven = cxStyle54
      Styles.ContentOdd = cxStyle55
      Styles.Inactive = cxStyle60
      Styles.Selection = cxStyle63
      Styles.Footer = cxStyle56
      Styles.Group = cxStyle57
      Styles.GroupByBox = cxStyle58
      Styles.Header = cxStyle59
      Styles.Indicator = cxStyle61
      Styles.Preview = cxStyle62
      BuiltIn = True
    end
    object GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet
      Caption = 'UserFormat3'
      Styles.Content = cxStyle64
      Styles.ContentEven = cxStyle65
      Styles.ContentOdd = cxStyle66
      Styles.Inactive = cxStyle71
      Styles.Selection = cxStyle74
      Styles.Footer = cxStyle67
      Styles.Group = cxStyle68
      Styles.GroupByBox = cxStyle69
      Styles.Header = cxStyle70
      Styles.Indicator = cxStyle72
      Styles.Preview = cxStyle73
      BuiltIn = True
    end
    object GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet
      Caption = 'UserFormat4'
      Styles.Content = cxStyle75
      Styles.ContentEven = cxStyle76
      Styles.ContentOdd = cxStyle77
      Styles.Inactive = cxStyle82
      Styles.Selection = cxStyle85
      Styles.Footer = cxStyle78
      Styles.Group = cxStyle79
      Styles.GroupByBox = cxStyle80
      Styles.Header = cxStyle81
      Styles.Indicator = cxStyle83
      Styles.Preview = cxStyle84
      BuiltIn = True
    end
    object GridTableViewStyleSheetBrick: TcxGridTableViewStyleSheet
      Caption = 'Brick'
      Styles.Content = cxStyle86
      Styles.ContentEven = cxStyle87
      Styles.ContentOdd = cxStyle88
      Styles.Inactive = cxStyle93
      Styles.Selection = cxStyle96
      Styles.Footer = cxStyle89
      Styles.Group = cxStyle90
      Styles.GroupByBox = cxStyle91
      Styles.Header = cxStyle92
      Styles.Indicator = cxStyle94
      Styles.Preview = cxStyle95
      BuiltIn = True
    end
    object GridTableViewStyleSheetDesert: TcxGridTableViewStyleSheet
      Caption = 'Desert'
      Styles.Content = cxStyle97
      Styles.ContentEven = cxStyle98
      Styles.ContentOdd = cxStyle99
      Styles.Inactive = cxStyle104
      Styles.Selection = cxStyle107
      Styles.Footer = cxStyle100
      Styles.Group = cxStyle101
      Styles.GroupByBox = cxStyle102
      Styles.Header = cxStyle103
      Styles.Indicator = cxStyle105
      Styles.Preview = cxStyle106
      BuiltIn = True
    end
    object GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet
      Caption = 'Eggplant'
      Styles.Content = cxStyle108
      Styles.ContentEven = cxStyle109
      Styles.ContentOdd = cxStyle110
      Styles.Inactive = cxStyle115
      Styles.Selection = cxStyle118
      Styles.Footer = cxStyle111
      Styles.Group = cxStyle112
      Styles.GroupByBox = cxStyle113
      Styles.Header = cxStyle114
      Styles.Indicator = cxStyle116
      Styles.Preview = cxStyle117
      BuiltIn = True
    end
    object GridTableViewStyleSheetLilac: TcxGridTableViewStyleSheet
      Caption = 'Lilac'
      Styles.Content = cxStyle119
      Styles.ContentEven = cxStyle120
      Styles.ContentOdd = cxStyle121
      Styles.Inactive = cxStyle126
      Styles.Selection = cxStyle129
      Styles.Footer = cxStyle122
      Styles.Group = cxStyle123
      Styles.GroupByBox = cxStyle124
      Styles.Header = cxStyle125
      Styles.Indicator = cxStyle127
      Styles.Preview = cxStyle128
      BuiltIn = True
    end
    object GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet
      Caption = 'Maple'
      Styles.Content = cxStyle130
      Styles.ContentEven = cxStyle131
      Styles.ContentOdd = cxStyle132
      Styles.Inactive = cxStyle137
      Styles.Selection = cxStyle140
      Styles.Footer = cxStyle133
      Styles.Group = cxStyle134
      Styles.GroupByBox = cxStyle135
      Styles.Header = cxStyle136
      Styles.Indicator = cxStyle138
      Styles.Preview = cxStyle139
      BuiltIn = True
    end
    object GridTableViewStyleSheetRainyDay: TcxGridTableViewStyleSheet
      Caption = 'Rainy Day'
      Styles.Content = cxStyle141
      Styles.ContentEven = cxStyle142
      Styles.ContentOdd = cxStyle143
      Styles.Inactive = cxStyle148
      Styles.Selection = cxStyle151
      Styles.Footer = cxStyle144
      Styles.Group = cxStyle145
      Styles.GroupByBox = cxStyle146
      Styles.Header = cxStyle147
      Styles.Indicator = cxStyle149
      Styles.Preview = cxStyle150
      BuiltIn = True
    end
    object GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet
      Caption = 'Rose'
      Styles.Content = cxStyle152
      Styles.ContentEven = cxStyle153
      Styles.ContentOdd = cxStyle154
      Styles.Inactive = cxStyle159
      Styles.Selection = cxStyle162
      Styles.Footer = cxStyle155
      Styles.Group = cxStyle156
      Styles.GroupByBox = cxStyle157
      Styles.Header = cxStyle158
      Styles.Indicator = cxStyle160
      Styles.Preview = cxStyle161
      BuiltIn = True
    end
    object GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet
      Caption = 'Slate'
      Styles.Content = cxStyle163
      Styles.ContentEven = cxStyle164
      Styles.ContentOdd = cxStyle165
      Styles.Inactive = cxStyle170
      Styles.Selection = cxStyle173
      Styles.Footer = cxStyle166
      Styles.Group = cxStyle167
      Styles.GroupByBox = cxStyle168
      Styles.Header = cxStyle169
      Styles.Indicator = cxStyle171
      Styles.Preview = cxStyle172
      BuiltIn = True
    end
    object GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet
      Caption = 'Spruce'
      Styles.Content = cxStyle174
      Styles.ContentEven = cxStyle175
      Styles.ContentOdd = cxStyle176
      Styles.Inactive = cxStyle181
      Styles.Selection = cxStyle184
      Styles.Footer = cxStyle177
      Styles.Group = cxStyle178
      Styles.GroupByBox = cxStyle179
      Styles.Header = cxStyle180
      Styles.Indicator = cxStyle182
      Styles.Preview = cxStyle183
      BuiltIn = True
    end
    object GridTableViewStyleSheetWheat: TcxGridTableViewStyleSheet
      Caption = 'Wheat'
      Styles.Content = cxStyle185
      Styles.ContentEven = cxStyle186
      Styles.ContentOdd = cxStyle187
      Styles.Inactive = cxStyle192
      Styles.Selection = cxStyle195
      Styles.Footer = cxStyle188
      Styles.Group = cxStyle189
      Styles.GroupByBox = cxStyle190
      Styles.Header = cxStyle191
      Styles.Indicator = cxStyle193
      Styles.Preview = cxStyle194
      BuiltIn = True
    end
  end
  object FBStaffReport: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
      end>
    DatabaseName = 'MYOB_FDB'
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT P.STAFF_ID '
      '    ,  P.FIRSTNAME'
      '    ,  P.LASTNAME'
      '    ,  SUM(Q.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(S.COST_PRICE) AS COGS'
      '    ,  SUM(Q.QUANTITY * S.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM STAFF P'
      'JOIN DAILY_TRANS Q ON (Q.STAFF_ID=P.STAFF_ID)'
      'JOIN TRANSACTIONS R ON (R.TRANS_ID=Q.TRANS_ID)'
      'LEFT JOIN PRODUCTS S ON ((S.PRODUCT_ID=Q.PRODUCT_ID))'
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY P.STAFF_ID, P.FIRSTNAME, P.LASTNAME'
      'ORDER BY P.LASTNAME, P.FIRSTNAME')
    FieldOptions = []
    Left = 408
    Top = 360
    object FBStaffReportFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBStaffReportLASTNAME: TStringField
      FieldName = 'LASTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBStaffReportSALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBStaffReportCOGS: TBCDField
      FieldName = 'COGS'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBStaffReportTOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
    object FBStaffReportFULLNAME: TStringField
      FieldKind = fkCalculated
      FieldName = 'FULLNAME'
      Calculated = True
    end
    object FBStaffReportTARI_RATE: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TARI_RATE'
      Calculated = True
    end
    object FBStaffReportTARI_HOURS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TARI_HOURS'
      DisplayFormat = ',0.00;(,0.00)'
      Calculated = True
    end
    object FBStaffReportGROSS_PROFIT: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'GROSS_PROFIT'
      Calculated = True
    end
    object FBStaffReportPRODUCTIVITY: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PRODUCTIVITY'
      DisplayFormat = '0.0 %;-0.0 %'
      Calculated = True
    end
    object FBStaffReportSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      ReadOnly = True
      Required = True
    end
    object FBStaffReportPAID_MINUTES: TIntegerField
      FieldKind = fkLookup
      FieldName = 'PAID_MINUTES'
      LookupDataSet = FBStaffPaidHours
      LookupKeyFields = 'STAFF_ID'
      LookupResultField = 'PAID_MINUTES'
      KeyFields = 'STAFF_ID'
      Lookup = True
    end
    object FBStaffReportPAID_HOURS: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'PAID_HOURS'
      Calculated = True
    end
  end
  object DSStaffReport: TDataSource
    DataSet = FBStaffReport
    Left = 488
    Top = 360
  end
  object FBStaffPaidHours: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'STAFF_ID=REQUIRED')
    DatabaseName = 'MYOB_FDB'
    RecordCountAccurate = True
    SQL.Strings = (
      'Select X.STAFF_ID, Sum(MINUTES_LOGGED) AS PAID_MINUTES'
      'FROM DAILY_HOURS X'
      'WHERE (X.STAFF_DATE>=:STARTDATE) AND(X.STAFF_DATE <= :ENDDATE)'
      'GROUP BY X.STAFF_ID'
      'ORDER BY X.STAFF_ID'
      '')
    FieldOptions = []
    Left = 408
    Top = 408
    object FBStaffPaidHoursSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      ReadOnly = True
      Required = True
    end
    object FBStaffPaidHoursPAID_MINUTES: TLargeintField
      FieldName = 'PAID_MINUTES'
      ReadOnly = True
    end
  end
  object DSStaffPaidHours: TDataSource
    DataSet = FBStaffPaidHours
    Left = 488
    Top = 408
  end
  object FBClientReport: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
      end>
    DatabaseName = 'MYOB_FDB'
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT Q.FIRSTNAME'
      '    ,  Q.LASTNAME'
      '    ,  MAX(R.TRANS_DATE) AS LAST_DATE'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(T.COST_PRICE) AS COGS'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID)'
      'LEFT JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) '
      'JOIN CLIENTS Q ON (Q.CLIENT_ID=R.CLIENT_ID)'
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY Q.FIRSTNAME, Q.LASTNAME'
      'ORDER BY Q.LASTNAME, Q.FIRSTNAME')
    FieldOptions = []
    Left = 408
    Top = 472
    object FBClientReportFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBClientReportLASTNAME: TStringField
      FieldName = 'LASTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBClientReportSALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBClientReportCOGS: TBCDField
      FieldName = 'COGS'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBClientReportTOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
    object FBClientReportLAST_DATE: TDateField
      FieldName = 'LAST_DATE'
      ReadOnly = True
    end
  end
  object FBTransactionsReport: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
      end>
    DatabaseName = 'MYOB_FDB'
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT R.TRANS_ID'
      '    ,  R.TRANS_DATE'
      '    ,  Q.FIRSTNAME'
      '    ,  Q.LASTNAME'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(T.COST_PRICE) AS COGS'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID)'
      'LEFT JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) '
      'JOIN CLIENTS Q ON (Q.CLIENT_ID=R.CLIENT_ID)'
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY R.TRANS_ID,  R.TRANS_DATE,  Q.FIRSTNAME,  Q.LASTNAME'
      'ORDER BY R.TRANS_DATE')
    FieldOptions = []
    Left = 408
    Top = 528
    object FBTransactionsReportTRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      ReadOnly = True
      Required = True
    end
    object FBTransactionsReportTRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      ReadOnly = True
    end
    object FBTransactionsReportFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBTransactionsReportLASTNAME: TStringField
      FieldName = 'LASTNAME'
      ReadOnly = True
      Size = 50
    end
    object FBTransactionsReportSALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBTransactionsReportCOGS: TBCDField
      FieldName = 'COGS'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBTransactionsReportTOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
  end
  object SPUpdateComponents: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'UPDATE_COMPONENTS'
    DatabaseName = 'MYOB_FDB'
    Left = 648
    Top = 16
  end
  object MYOB_Acc_Activities: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.AccountActivities'
    Left = 40
    Top = 360
    object MYOB_Acc_ActivitiesAccountActivityID: TIntegerField
      FieldName = 'AccountActivityID'
    end
    object MYOB_Acc_ActivitiesAccountID: TIntegerField
      FieldName = 'AccountID'
    end
    object MYOB_Acc_ActivitiesFinancialYear: TSmallintField
      FieldName = 'FinancialYear'
    end
    object MYOB_Acc_ActivitiesPeriod: TSmallintField
      FieldName = 'Period'
    end
    object MYOB_Acc_ActivitiesAmount: TFloatField
      FieldName = 'Amount'
    end
  end
  object MYOB_AccSubClass: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.SubAccountTypes'
    Left = 32
    Top = 304
    object MYOB_AccSubClassSubAccountTypeID: TStringField
      FieldName = 'SubAccountTypeID'
      Size = 3
    end
    object MYOB_AccSubClassDescription: TStringField
      FieldName = 'Description'
      Size = 23
    end
  end
  object MYOB_AccClass: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.AccountClassification'
    Left = 32
    Top = 256
    object MYOB_AccClassAccountClassificationID: TStringField
      FieldName = 'AccountClassificationID'
      Size = 4
    end
    object MYOB_AccClassDescription: TStringField
      FieldName = 'Description'
      Size = 13
    end
  end
  object QryMyobAccounts: TQuery
    DatabaseName = 'MYOB_TARI'
    SQL.Strings = (
      'SELECT DISTINCT P.AccountID'
      '             , P.ParentAccountID'
      '             , P.IsInactive'
      '             , P.AccountName'
      '             , P.AccountNumber'
      '             , P.AccountTypeID'
      '             , P.AccountClassificationID'
      '             , P.SubAccountClassificationID'
      '             , P.ThisYearOpeningBalance'
      '             , P.IsCreditBalance'
      '             , P.AccountLevel'
      'FROM MYOB.Accounts P'
      'LEFT JOIN MYOB.Accounts Q ON (P.AccountID = Q.ParentAccountID)'
      'WHERE  (P.AccountTypeID <> '#39'S'#39') AND (Q.AccountID is Null)'
      'ORDER BY P.AccountID')
    Left = 32
    Top = 200
    object QryMyobAccountsAccountID: TIntegerField
      FieldName = 'AccountID'
      Origin = 'MYOBCLEAR.Accounts.AccountID'
    end
    object QryMyobAccountsParentAccountID: TIntegerField
      FieldName = 'ParentAccountID'
      Origin = 'MYOBCLEAR.Accounts.ParentAccountID'
    end
    object QryMyobAccountsIsInactive: TStringField
      FieldName = 'IsInactive'
      Origin = 'MYOBCLEAR.Accounts.IsInactive'
      Size = 1
    end
    object QryMyobAccountsAccountName: TStringField
      FieldName = 'AccountName'
      Origin = 'MYOBCLEAR.Accounts.AccountName'
      Size = 30
    end
    object QryMyobAccountsAccountNumber: TStringField
      FieldName = 'AccountNumber'
      Origin = 'MYOBCLEAR.Accounts.AccountNumber'
      Size = 6
    end
    object QryMyobAccountsAccountTypeID: TStringField
      FieldName = 'AccountTypeID'
      Origin = 'MYOBCLEAR.Accounts.AccountTypeID'
      Size = 1
    end
    object QryMyobAccountsAccountClassificationID: TStringField
      FieldName = 'AccountClassificationID'
      Origin = 'MYOBCLEAR.Accounts.AccountClassificationID'
      Size = 4
    end
    object QryMyobAccountsThisYearOpeningBalance: TFloatField
      FieldName = 'ThisYearOpeningBalance'
      Origin = 'MYOBCLEAR.Accounts.ThisYearOpeningBalance'
    end
    object QryMyobAccountsIsCreditBalance: TStringField
      FieldName = 'IsCreditBalance'
      Origin = 'MYOBCLEAR.Accounts.IsCreditBalance'
      Size = 1
    end
    object QryMyobAccountsAccountLevel: TSmallintField
      FieldName = 'AccountLevel'
      Origin = 'MYOBCLEAR.Accounts.AccountLevel'
    end
    object QryMyobAccountsSubAccountClassificationID: TStringField
      FieldName = 'SubAccountClassificationID'
      Origin = 'MYOBCLEAR.Accounts.SubAccountClassificationID'
      Size = 3
    end
  end
  object QryExtract_TB: TQuery
    DatabaseName = 'MYOB_TARI'
    SQL.Strings = (
      'SELECT DISTINCT P.AccountID'
      '             , P.ParentAccountID'
      '             , P.IsInactive'
      '             , P.AccountName'
      '             , P.AccountNumber'
      '             , P.AccountTypeID'
      '             , P.AccountClassificationID'
      '             , P.ThisYearOpeningBalance'
      '             , SUM(R.Amount) AS ChangeAmount'
      '             , P.IsCreditBalance'
      '             , P.AccountLevel'
      '             , Q.AccountID'
      'FROM MYOB.Accounts P'
      
        'INNER JOIN MYOB.AccountActivities R ON (R.AccountID = P.AccountI' +
        'D) AND (FINANCIALYEAR=:FYEAR)'
      'LEFT JOIN MYOB.Accounts Q ON (P.AccountID = Q.ParentAccountID)'
      'GROUP BY P.AccountID'
      '             , P.ParentAccountID'
      '             , P.IsInactive'
      '             , P.AccountName'
      '             , P.AccountNumber'
      '             , P.AccountTypeID'
      '             , P.AccountClassificationID'
      '             , P.ThisYearOpeningBalance'
      '             , P.IsCreditBalance'
      '             , P.AccountLevel'
      '             , Q.AccountID'
      
        'HAVING  (P.AccountTypeID <> '#39'S'#39') AND (Q.AccountID is Null) AND (' +
        'P.IsInactive='#39'N'#39')'
      'ORDER BY P.AccountNumber'
      ''
      '  '
      '')
    Left = 32
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'FYEAR'
        ParamType = ptInput
        Value = 0
      end>
    object QryExtract_TBAccountID: TIntegerField
      DisplayWidth = 12
      FieldName = 'AccountID'
      Visible = False
    end
    object QryExtract_TBParentAccountID: TIntegerField
      DisplayWidth = 17
      FieldName = 'ParentAccountID'
    end
    object QryExtract_TBIsInactive: TStringField
      DisplayWidth = 9
      FieldName = 'IsInactive'
      Visible = False
      Size = 1
    end
    object QryExtract_TBAccountName: TStringField
      DisplayWidth = 36
      FieldName = 'AccountName'
      Size = 30
    end
    object QryExtract_TBAccountNumber: TStringField
      DisplayWidth = 17
      FieldName = 'AccountNumber'
      Size = 6
    end
    object QryExtract_TBAccountTypeID: TStringField
      DisplayWidth = 15
      FieldName = 'AccountTypeID'
      Visible = False
      Size = 1
    end
    object QryExtract_TBAccountClassificationID: TStringField
      DisplayWidth = 18
      FieldName = 'AccountClassificationID'
      Visible = False
      Size = 4
    end
    object QryExtract_TBThisYearOpeningBalance: TFloatField
      DisplayWidth = 23
      FieldName = 'ThisYearOpeningBalance'
    end
    object QryExtract_TBChangeAmount: TFloatField
      DisplayWidth = 22
      FieldName = 'ChangeAmount'
    end
    object QryExtract_TBIsCreditBalance: TStringField
      DisplayWidth = 15
      FieldName = 'IsCreditBalance'
      Visible = False
      Size = 1
    end
    object QryExtract_TBAccountLevel: TSmallintField
      DisplayWidth = 13
      FieldName = 'AccountLevel'
      Visible = False
    end
    object QryExtract_TBAccountID_1: TIntegerField
      DisplayWidth = 13
      FieldName = 'AccountID_1'
      Visible = False
    end
  end
  object TblMYOB_Data: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.DataFileInformation'
    Left = 32
    Top = 80
    object TblMYOB_DataCompanyName: TStringField
      DisplayWidth = 18
      FieldName = 'CompanyName'
      Size = 42
    end
    object TblMYOB_DataAddress: TStringField
      DisplayWidth = 38
      FieldName = 'Address'
      Size = 255
    end
    object TblMYOB_DataPhone: TStringField
      DisplayWidth = 24
      FieldName = 'Phone'
    end
    object TblMYOB_DataFaxNumber: TStringField
      DisplayWidth = 24
      FieldName = 'FaxNumber'
    end
    object TblMYOB_DataEmail: TStringField
      DisplayWidth = 306
      FieldName = 'Email'
      Size = 255
    end
    object TblMYOB_DataABN: TStringField
      DisplayWidth = 17
      FieldName = 'ABN'
      Size = 14
    end
    object TblMYOB_DataABNBranch: TStringField
      DisplayWidth = 13
      FieldName = 'ABNBranch'
      Size = 11
    end
    object TblMYOB_DataACN: TStringField
      DisplayWidth = 23
      FieldName = 'ACN'
      Size = 19
    end
    object TblMYOB_DataGSTRegistrationNumber: TStringField
      DisplayWidth = 23
      FieldName = 'GSTRegistrationNumber'
      Size = 19
    end
    object TblMYOB_DataSalesTaxNumber: TStringField
      DisplayWidth = 23
      FieldName = 'SalesTaxNumber'
      Size = 19
    end
    object TblMYOB_DataCompanyRegistrationNumber: TStringField
      DisplayWidth = 28
      FieldName = 'CompanyRegistrationNumber'
      Size = 19
    end
    object TblMYOB_DataCurrentFinancialYear: TSmallintField
      DisplayWidth = 20
      FieldName = 'CurrentFinancialYear'
    end
    object TblMYOB_DataLastMonthInFinancialYear: TSmallintField
      DisplayWidth = 25
      FieldName = 'LastMonthInFinancialYear'
    end
    object TblMYOB_DataConversionDate: TDateField
      DisplayWidth = 15
      FieldName = 'ConversionDate'
    end
    object TblMYOB_DataPeriodsPerYear: TSmallintField
      DisplayWidth = 15
      FieldName = 'PeriodsPerYear'
    end
    object TblMYOB_DataPayeeNumber: TStringField
      DisplayWidth = 14
      FieldName = 'PayeeNumber'
      Size = 8
    end
    object TblMYOB_DataBankCode: TStringField
      DisplayWidth = 10
      FieldName = 'BankCode'
      Size = 3
    end
    object TblMYOB_DataBankID: TStringField
      DisplayWidth = 7
      FieldName = 'BankID'
      Size = 6
    end
    object TblMYOB_DataBSBCode: TStringField
      DisplayWidth = 9
      FieldName = 'BSBCode'
      Size = 7
    end
    object TblMYOB_DataBankAccountNumber: TStringField
      DisplayWidth = 21
      FieldName = 'BankAccountNumber'
      Size = 9
    end
    object TblMYOB_DataBankAccountName: TStringField
      DisplayWidth = 31
      FieldName = 'BankAccountName'
      Size = 26
    end
    object TblMYOB_DataIsSelfBalancing: TStringField
      DisplayWidth = 15
      FieldName = 'IsSelfBalancing'
      Size = 3
    end
    object TblMYOB_DataStatementParticulars: TStringField
      DisplayWidth = 20
      FieldName = 'StatementParticulars'
      Size = 12
    end
    object TblMYOB_DataStatementCode: TStringField
      DisplayWidth = 15
      FieldName = 'StatementCode'
      Size = 12
    end
    object TblMYOB_DataStatementReference: TStringField
      DisplayWidth = 20
      FieldName = 'StatementReference'
      Size = 12
    end
    object TblMYOB_DataLastPurgeDate: TDateField
      DisplayWidth = 14
      FieldName = 'LastPurgeDate'
    end
    object TblMYOB_DataLastBackupDate: TDateField
      DisplayWidth = 16
      FieldName = 'LastBackupDate'
    end
    object TblMYOB_DataDatabaseVersion: TStringField
      DisplayWidth = 16
      FieldName = 'DatabaseVersion'
      Size = 8
    end
    object TblMYOB_DataDataFileCountry: TStringField
      DisplayWidth = 15
      FieldName = 'DataFileCountry'
      Size = 3
    end
    object TblMYOB_DataDriverBuildNumber: TIntegerField
      DisplayWidth = 18
      FieldName = 'DriverBuildNumber'
    end
    object TblMYOB_DataUseRetailManagerLink: TStringField
      DisplayWidth = 22
      FieldName = 'UseRetailManagerLink'
      Size = 1
    end
    object TblMYOB_DataUseMultipleCurrencies: TStringField
      DisplayWidth = 21
      FieldName = 'UseMultipleCurrencies'
      Size = 1
    end
    object TblMYOB_DataUseCostCentres: TStringField
      DisplayWidth = 15
      FieldName = 'UseCostCentres'
      Size = 1
    end
    object TblMYOB_DataCostCentresRequired: TStringField
      DisplayWidth = 20
      FieldName = 'CostCentresRequired'
      Size = 1
    end
    object TblMYOB_DataUseSimplifiedTaxSystem: TStringField
      DisplayWidth = 23
      FieldName = 'UseSimplifiedTaxSystem'
      Size = 1
    end
    object TblMYOB_DataSimplifiedTaxSystemDate: TDateField
      DisplayWidth = 24
      FieldName = 'SimplifiedTaxSystemDate'
    end
    object TblMYOB_DataUseDailyAgeing: TStringField
      DisplayWidth = 15
      FieldName = 'UseDailyAgeing'
      Size = 1
    end
    object TblMYOB_DataFirstAgeingPeriod: TSmallintField
      DisplayWidth = 17
      FieldName = 'FirstAgeingPeriod'
    end
    object TblMYOB_DataSecondAgeingPeriod: TSmallintField
      DisplayWidth = 20
      FieldName = 'SecondAgeingPeriod'
    end
    object TblMYOB_DataThirdAgeingPeriod: TSmallintField
      DisplayWidth = 18
      FieldName = 'ThirdAgeingPeriod'
    end
    object TblMYOB_DataIdentifyAgeByName: TStringField
      DisplayWidth = 19
      FieldName = 'IdentifyAgeByName'
      Size = 1
    end
    object TblMYOB_DataLockPeriodIsActive: TStringField
      DisplayWidth = 19
      FieldName = 'LockPeriodIsActive'
      Size = 1
    end
    object TblMYOB_DataLockPeriodDate: TDateField
      DisplayWidth = 16
      FieldName = 'LockPeriodDate'
    end
    object TblMYOB_DataLockThirteenthPeriod: TStringField
      DisplayWidth = 21
      FieldName = 'LockThirteenthPeriod'
      Size = 1
    end
    object TblMYOB_DataDefaultCustomerTermsID: TIntegerField
      DisplayWidth = 24
      FieldName = 'DefaultCustomerTermsID'
    end
    object TblMYOB_DataDefaultCustomerPriceLevelID: TStringField
      DisplayWidth = 28
      FieldName = 'DefaultCustomerPriceLevelID'
      Size = 3
    end
    object TblMYOB_DataDefaultCustomerTaxCodeID: TIntegerField
      DisplayWidth = 27
      FieldName = 'DefaultCustomerTaxCodeID'
    end
    object TblMYOB_DataDefaultUseCustomerTaxCode: TStringField
      DisplayWidth = 28
      FieldName = 'DefaultUseCustomerTaxCode'
      Size = 1
    end
    object TblMYOB_DataDefaultCustomerFreightTaxCodeID: TIntegerField
      DisplayWidth = 33
      FieldName = 'DefaultCustomerFreightTaxCodeID'
    end
    object TblMYOB_DataDefaultSupplierTaxCodeID: TIntegerField
      DisplayWidth = 25
      FieldName = 'DefaultSupplierTaxCodeID'
    end
    object TblMYOB_DataDefaultUseSupplierTaxCode: TStringField
      DisplayWidth = 27
      FieldName = 'DefaultUseSupplierTaxCode'
      Size = 1
    end
    object TblMYOB_DataDefaultSupplierFreightTaxCodeID: TIntegerField
      DisplayWidth = 32
      FieldName = 'DefaultSupplierFreightTaxCodeID'
    end
    object TblMYOB_DataDefaultCustomerCreditLimit: TFloatField
      DisplayWidth = 25
      FieldName = 'DefaultCustomerCreditLimit'
    end
    object TblMYOB_DataDefaultSupplierTermsID: TIntegerField
      DisplayWidth = 23
      FieldName = 'DefaultSupplierTermsID'
    end
    object TblMYOB_DataDefaultSupplierCreditLimit: TFloatField
      DisplayWidth = 24
      FieldName = 'DefaultSupplierCreditLimit'
    end
    object TblMYOB_DataInvoiceSubject: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceSubject'
      Size = 255
    end
    object TblMYOB_DataInvoiceMessage: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceMessage'
      Size = 255
    end
    object TblMYOB_DataIncludeInvoiceNumber: TStringField
      DisplayWidth = 22
      FieldName = 'IncludeInvoiceNumber'
      Size = 1
    end
    object TblMYOB_DataInvoiceQuoteSubject: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceQuoteSubject'
      Size = 255
    end
    object TblMYOB_DataInvoiceQuoteMessage: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceQuoteMessage'
      Size = 255
    end
    object TblMYOB_DataIncludeInvoiceQuoteNumber: TStringField
      DisplayWidth = 27
      FieldName = 'IncludeInvoiceQuoteNumber'
      Size = 1
    end
    object TblMYOB_DataInvoiceOrderSubject: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceOrderSubject'
      Size = 255
    end
    object TblMYOB_DataInvoiceOrderMessage: TStringField
      DisplayWidth = 306
      FieldName = 'InvoiceOrderMessage'
      Size = 255
    end
    object TblMYOB_DataIncludeInvoiceOrderNumber: TStringField
      DisplayWidth = 27
      FieldName = 'IncludeInvoiceOrderNumber'
      Size = 1
    end
    object TblMYOB_DataPurchaseSubject: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseSubject'
      Size = 255
    end
    object TblMYOB_DataPurchaseMessage: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseMessage'
      Size = 255
    end
    object TblMYOB_DataIncludePurchaseNumber: TStringField
      DisplayWidth = 24
      FieldName = 'IncludePurchaseNumber'
      Size = 1
    end
    object TblMYOB_DataPurchaseQuoteSubject: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseQuoteSubject'
      Size = 255
    end
    object TblMYOB_DataPurchaseQuoteMessage: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseQuoteMessage'
      Size = 255
    end
    object TblMYOB_DataIncludePurchaseQuoteNumber: TStringField
      DisplayWidth = 29
      FieldName = 'IncludePurchaseQuoteNumber'
      Size = 1
    end
    object TblMYOB_DataPurchaseOrderSubject: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseOrderSubject'
      Size = 255
    end
    object TblMYOB_DataPurchaseOrderMessage: TStringField
      DisplayWidth = 306
      FieldName = 'PurchaseOrderMessage'
      Size = 255
    end
    object TblMYOB_DataIncludePurchaseOrderNumber: TStringField
      DisplayWidth = 29
      FieldName = 'IncludePurchaseOrderNumber'
      Size = 1
    end
    object TblMYOB_DataStatementSubject: TStringField
      DisplayWidth = 306
      FieldName = 'StatementSubject'
      Size = 255
    end
    object TblMYOB_DataStatementMessage: TStringField
      DisplayWidth = 306
      FieldName = 'StatementMessage'
      Size = 255
    end
    object TblMYOB_DataUseAuditTracking: TStringField
      DisplayWidth = 17
      FieldName = 'UseAuditTracking'
      Size = 1
    end
    object TblMYOB_DataUseCreditLimitWarning: TStringField
      DisplayWidth = 22
      FieldName = 'UseCreditLimitWarning'
      Size = 1
    end
    object TblMYOB_DataLimitTypeID: TStringField
      DisplayWidth = 11
      FieldName = 'LimitTypeID'
      Size = 1
    end
    object TblMYOB_DataChangeControl: TStringField
      DisplayWidth = 18
      FieldName = 'ChangeControl'
      Size = 15
    end
  end
  object DSMYOBInfo: TDataSource
    DataSet = TblMYOB_Data
    Left = 128
    Top = 80
  end
  object DSExtractTB: TDataSource
    DataSet = QryExtract_TB
    Left = 136
    Top = 144
  end
  object DSMyob_Accounts: TDataSource
    DataSet = QryMyobAccounts
    Left = 136
    Top = 200
  end
  object FB_MYOBTARIDB: TIBODatabase
    LoginAbortedShowMessage = False
    DatabaseName = 'FBMYOBTARI_1'
    Params.Strings = (
      
        'PATH=C:\Program Files\Focus Based Management\TARI For Business\D' +
        'ata\MYOBTari.Fdb'
      'PROTOCOL=TCP/IP'
      'SERVER=Devwork1'
      'USER NAME=SYSDBA')
    BeforeConnect = FB_MYOBTARIDBBeforeConnect
    AfterConnect = FB_MYOBTARIDBAfterConnect
    Left = 248
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object FB_Myob_Accounts: TIBOTable
    ColumnAttributes.Strings = (
      'ACCOUNT_ID=REQUIRED')
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    TableName = 'MYOB_ACCOUNTS'
    FieldOptions = []
    Left = 248
    Top = 80
    object FB_Myob_AccountsACCOUNT_ID: TIntegerField
      FieldName = 'ACCOUNT_ID'
      Origin = 'MYOB_ACCOUNTS.ACCOUNT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FB_Myob_AccountsACCOUNT_NUMBER: TStringField
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'MYOB_ACCOUNTS.ACCOUNT_NUMBER'
      Size = 10
    end
    object FB_Myob_AccountsACCOUNT_TITLE: TStringField
      FieldName = 'ACCOUNT_TITLE'
      Origin = 'MYOB_ACCOUNTS.ACCOUNT_TITLE'
      Size = 100
    end
    object FB_Myob_AccountsACCOUNT_CLASS: TIntegerField
      FieldName = 'ACCOUNT_CLASS'
      Origin = 'MYOB_ACCOUNTS.ACCOUNT_CLASS'
    end
    object FB_Myob_AccountsACCOUNT_SUBCLASS: TIntegerField
      FieldName = 'ACCOUNT_SUBCLASS'
      Origin = 'MYOB_ACCOUNTS.ACCOUNT_SUBCLASS'
    end
  end
  object FB_MYOB_TB: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    TableName = 'MYOB_TRIAL_BALANCE'
    FieldOptions = []
    Left = 248
    Top = 136
    object FB_MYOB_TBPERIOD_END: TDateField
      FieldName = 'PERIOD_END'
      Required = True
    end
    object FB_MYOB_TBMYOB_ACCOUNT: TIntegerField
      FieldName = 'MYOB_ACCOUNT'
      Required = True
    end
    object FB_MYOB_TBAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Precision = 18
      Size = 2
    end
  end
  object FB_AccountMapping: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    TableName = 'ACCOUNT_MAPPING'
    FieldOptions = []
    Left = 248
    Top = 192
    object FB_AccountMappingMYOB_ACCOUNT: TIntegerField
      FieldName = 'MYOB_ACCOUNT'
      Required = True
    end
    object FB_AccountMappingTARI_ACCOUNT: TIntegerField
      FieldName = 'TARI_ACCOUNT'
    end
  end
  object FB_AccountClass: TIBOTable
    ColumnAttributes.Strings = (
      'CLASS_ID=REQUIRED')
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    AfterInsert = FB_AccountClassAfterInsert
    MasterFields = 'CLASS_ID=ACCOUNT_CLASS'
    MasterSource = DSFB_MYOB_Accounts
    TableName = 'ACCOUNT_CLASS'
    FieldOptions = []
    Left = 248
    Top = 248
    object FB_AccountClassCLASS_ID: TIntegerField
      FieldName = 'CLASS_ID'
      Origin = 'ACCOUNT_CLASS.CLASS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FB_AccountClassCLASS_NAME: TStringField
      FieldName = 'CLASS_NAME'
      Origin = 'ACCOUNT_CLASS.CLASS_NAME'
      Size = 50
    end
    object FB_AccountClassMYOB_CLASS: TStringField
      FieldName = 'MYOB_CLASS'
      Origin = 'ACCOUNT_CLASS.MYOB_CLASS'
      Size = 10
    end
  end
  object FB_AccSubClass: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    AfterInsert = FB_AccSubClassAfterInsert
    MasterFields = 'SUBCLASS_ID=ACCOUNT_SUBCLASS'
    MasterSource = DSFB_MYOB_Accounts
    TableName = 'ACCOUNT_SUBCLASS'
    FieldOptions = []
    Left = 248
    Top = 304
    object FB_AccSubClassSUBCLASS_ID: TIntegerField
      FieldName = 'SUBCLASS_ID'
      Required = True
    end
    object FB_AccSubClassSUBCLASS_NAME: TStringField
      FieldName = 'SUBCLASS_NAME'
      Size = 50
    end
    object FB_AccSubClassMYOB_SUBCLASS: TStringField
      FieldName = 'MYOB_SUBCLASS'
      Size = 10
    end
  end
  object FB_Account_Bals: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    MasterFields = 'ACCOUNT_ID=ACCOUNT_ID'
    MasterSource = DSFB_MYOB_Accounts
    TableName = 'MYOB_ACC_BALANCES'
    FieldOptions = []
    Left = 248
    Top = 360
    object FB_Account_BalsACCOUNT_ID: TIntegerField
      FieldName = 'ACCOUNT_ID'
      Required = True
    end
    object FB_Account_BalsDETAILED_BALANCES: TBlobField
      FieldName = 'DETAILED_BALANCES'
      Size = 8
    end
    object FB_Account_BalsBASE_BALANCE: TBCDField
      FieldName = 'BASE_BALANCE'
      Precision = 18
      Size = 2
    end
  end
  object FB_MYOB_Info: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    TableName = 'MYOB_INFO'
    FieldOptions = []
    Left = 248
    Top = 416
    object FB_MYOB_InfoBUSINESS_ID: TIntegerField
      FieldName = 'BUSINESS_ID'
      Required = True
    end
    object FB_MYOB_InfoBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Size = 100
    end
    object FB_MYOB_InfoTB_DATE: TDateField
      FieldName = 'TB_DATE'
    end
    object FB_MYOB_InfoYEAR_PERIODS: TIntegerField
      FieldName = 'YEAR_PERIODS'
    end
    object FB_MYOB_InfoFIRST_PERIOD: TDateField
      FieldName = 'FIRST_PERIOD'
    end
    object FB_MYOB_InfoLAST_PERIOD: TDateField
      FieldName = 'LAST_PERIOD'
    end
    object FB_MYOB_InfoRE_ACCOUNT: TIntegerField
      FieldName = 'RE_ACCOUNT'
    end
  end
  object DSFB_MYOBInfo: TDataSource
    DataSet = FB_MYOB_Info
    Left = 368
    Top = 424
  end
  object DSAccountMapping: TDataSource
    DataSet = FB_AccountMapping
    Left = 360
    Top = 192
  end
  object DSFB_MYOB_TB: TDataSource
    DataSet = FB_MYOB_TB
    Left = 360
    Top = 136
  end
  object DSFB_MYOB_Accounts: TDataSource
    DataSet = FB_Myob_Accounts
    Left = 360
    Top = 80
  end
  object SP_Delete_TB: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'CLEARTRIALBALANCE'
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    Left = 552
    Top = 24
  end
  object IB_Query4: TIB_Query
    DatabaseName = 'FBMYOBTARI_1'
    FieldsDisplayWidth.Strings = (
      'CLASS_NAME=101'
      'SUBCLASS_NAME=125')
    IB_Connection = FB_MYOBTARIDB
    SQL.Strings = (
      'SELECT Q.CLASS_NAME'
      '     , R.SUBCLASS_NAME'
      '     , P.ACCOUNT_NUMBER'
      '     , P.ACCOUNT_TITLE'
      'FROM MYOB_ACCOUNTS P'
      'JOIN ACCOUNT_CLASS Q ON (P.ACCOUNT_CLASS=Q.CLASS_ID)'
      'JOIN ACCOUNT_SUBCLASS R ON (P.ACCOUNT_SUBCLASS=R.SUBCLASS_ID)'
      'ORDER BY P.ACCOUNT_CLASS, P.ACCOUNT_SUBCLASS, P.ACCOUNT_NUMBER')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    BufferSynchroFlags = []
    FetchWholeRows = True
    IsTree = False
    TreeTrash = 0
    TreeExpandLevel = 0
    Left = 560
    Top = 88
  end
  object FB_MyobAccountListing: TIBOQuery
    Params = <>
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT Q.CLASS_NAME'
      '     , R.SUBCLASS_NAME'
      '     , P.ACCOUNT_NUMBER'
      '     , P.ACCOUNT_TITLE'
      'FROM MYOB_ACCOUNTS P'
      'JOIN ACCOUNT_CLASS Q ON (P.ACCOUNT_CLASS=Q.CLASS_ID)'
      'JOIN ACCOUNT_SUBCLASS R ON (P.ACCOUNT_SUBCLASS=R.SUBCLASS_ID)'
      'ORDER BY P.ACCOUNT_CLASS, P.ACCOUNT_SUBCLASS, P.ACCOUNT_NUMBER')
    FieldOptions = []
    Left = 560
    Top = 160
  end
  object FBSystem_Data: TIBOTable
    DatabaseName = 'FBMYOBTARI_1'
    IB_Connection = FB_MYOBTARIDB
    RecordCountAccurate = True
    TableName = 'SYSTEM_DATA'
    FieldOptions = []
    Left = 248
    Top = 472
    object FBSystem_DataSYSTEM_ID: TIntegerField
      FieldName = 'SYSTEM_ID'
      Required = True
    end
    object FBSystem_DataSTR_FIELD: TStringField
      FieldName = 'STR_FIELD'
      Size = 150
    end
    object FBSystem_DataINT_FIELD: TIntegerField
      FieldName = 'INT_FIELD'
    end
    object FBSystem_DataNUM_FIELD: TBCDField
      FieldName = 'NUM_FIELD'
      Precision = 18
      Size = 2
    end
    object FBSystem_DataDATE_FIELD: TDateTimeField
      FieldName = 'DATE_FIELD'
    end
  end
end
