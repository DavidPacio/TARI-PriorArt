object DMInterface: TDMInterface
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleCreate
  Left = 443
  Top = 326
  Height = 761
  Width = 749
  object SRC_Database: TDatabase
    AliasName = 'SC2TARI'
    DatabaseName = 'SRCDB'
    HandleShared = True
    LoginPrompt = False
    ReadOnly = True
    SessionName = 'Default'
    AfterConnect = SRC_DatabaseAfterConnect
    BeforeConnect = SRC_DatabaseBeforeConnect
    Left = 40
    Top = 16
  end
  object SCServices: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'IdNumber'
    TableName = 'services.DB'
    Left = 40
    Top = 72
    object SCServicesIdNumber: TIntegerField
      FieldName = 'IdNumber'
    end
    object SCServicesCategory: TSmallintField
      FieldName = 'Category'
    end
    object SCServicesService: TStringField
      FieldName = 'Service'
      Size = 30
    end
    object SCServicesTime1: TSmallintField
      FieldName = 'Time 1'
    end
    object SCServicesCost: TCurrencyField
      FieldName = 'Cost'
    end
    object SCServicesPoints: TSmallintField
      FieldName = 'Points'
    end
    object SCServicesText1: TStringField
      FieldName = 'Text 1'
      Size = 30
    end
    object SCServicesBreak1: TSmallintField
      FieldName = 'Break 1'
    end
    object SCServicesCost1: TCurrencyField
      FieldName = 'Cost 1'
    end
    object SCServicesPoints1: TSmallintField
      FieldName = 'Points 1'
    end
    object SCServicesCount1: TSmallintField
      FieldName = 'Count 1'
    end
    object SCServicesText2: TStringField
      FieldName = 'Text 2'
      Size = 30
    end
    object SCServicesTime2: TSmallintField
      FieldName = 'Time 2'
    end
    object SCServicesBreak2: TSmallintField
      FieldName = 'Break 2'
    end
    object SCServicesCost2: TCurrencyField
      FieldName = 'Cost 2'
    end
    object SCServicesPoints2: TSmallintField
      FieldName = 'Points 2'
    end
    object SCServicesCount2: TSmallintField
      FieldName = 'Count 2'
    end
    object SCServicesText3: TStringField
      FieldName = 'Text 3'
      Size = 30
    end
    object SCServicesTime3: TSmallintField
      FieldName = 'Time 3'
    end
    object SCServicesBreak3: TSmallintField
      FieldName = 'Break 3'
    end
    object SCServicesCount4: TSmallintField
      FieldName = 'Count 4'
    end
    object SCServicesCost3: TCurrencyField
      FieldName = 'Cost 3'
    end
    object SCServicesPoints3: TSmallintField
      FieldName = 'Points 3'
    end
    object SCServicesCount3: TSmallintField
      FieldName = 'Count 3'
    end
    object SCServicesText4: TStringField
      FieldName = 'Text 4'
      Size = 30
    end
    object SCServicesTime4: TSmallintField
      FieldName = 'Time 4'
    end
    object SCServicesBreak4: TSmallintField
      FieldName = 'Break 4'
    end
    object SCServicesCost4: TCurrencyField
      FieldName = 'Cost 4'
    end
    object SCServicesPoints4: TSmallintField
      FieldName = 'Points 4'
    end
    object SCServicesText5: TStringField
      FieldName = 'Text 5'
      Size = 30
    end
    object SCServicesTime5: TSmallintField
      FieldName = 'Time 5'
    end
    object SCServicesBreak5: TSmallintField
      FieldName = 'Break 5'
    end
    object SCServicesCost5: TCurrencyField
      FieldName = 'Cost 5'
    end
    object SCServicesPoints5: TSmallintField
      FieldName = 'Points 5'
    end
    object SCServicesCount5: TSmallintField
      FieldName = 'Count 5'
    end
    object SCServicesText6: TStringField
      FieldName = 'Text 6'
      Size = 30
    end
    object SCServicesTime6: TSmallintField
      FieldName = 'Time 6'
    end
    object SCServicesCost6: TCurrencyField
      FieldName = 'Cost 6'
    end
    object SCServicesPoints6: TSmallintField
      FieldName = 'Points 6'
    end
    object SCServicesCount6: TSmallintField
      FieldName = 'Count 6'
    end
    object SCServicesCountFlag: TSmallintField
      FieldName = 'Count Flag'
    end
    object SCServicesActive: TSmallintField
      FieldName = 'Active'
    end
    object SCServicesChemical: TSmallintField
      FieldName = 'Chemical'
    end
    object SCServicesMainBlock: TSmallintField
      FieldName = 'Main Block'
    end
    object SCServicesTaxId: TSmallintField
      FieldName = 'Tax Id'
    end
  end
  object SC2TARIDB: TIBODatabase
    LoginAbortedShowMessage = False
    SQLDialect = 3
    DatabaseName = 'SC_FDB_1'
    Params.Strings = (
      'SERVER=DEVWORK1'
      'SQL DIALECT=3'
      
        'PATH=C:\Program Files\Focus Based Management\Tari for Business\D' +
        'ata\rawtest2.FDB')
    BeforeConnect = SC2TARIDBBeforeConnect
    AfterConnect = SC2TARIDBAfterConnect
    Left = 536
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object IB_Query1: TIB_Query
    DatabaseName = 'SC_FDB_1'
    FieldsDisplayWidth.Strings = (
      'PRODUCT_ID=102'
      'SALES=130'
      'UNITS=110')
    IB_Connection = SC2TARIDB
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
    Left = 608
    Top = 16
  end
  object IB_Query2: TIB_Query
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
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
    Left = 680
    Top = 16
  end
  object IB_Query3: TIB_Query
    DatabaseName = 'SC_FDB_1'
    FieldsDisplayWidth.Strings = (
      'PROD_GROUP=128'
      'DESCRIPTION=178'
      'LAST_UPDATED=131'
      'LASTNAME=163'
      'MAX=80'
      'COMPONENT_QTY=99'
      'DB_KEY=200'
      'MINUTES_LOGGED=109')
    IB_Connection = SC2TARIDB
    SQL.Strings = (
      'Select X.STAFF_DATE, X.STAFF_ID, X.MINUTES_LOGGED'
      'FROM DAILY_HOURS X'
      'WHERE (X.STAFF_DATE>=:STARTDATE) AND(X.STAFF_DATE <= :ENDDATE)'
      'ORDER BY X.STAFF_DATE, X.STAFF_ID'
      '')
    ColorScheme = False
    MasterSearchFlags = [msfOpenMasterOnOpen, msfSearchAppliesToMasterOnly]
    RequestLive = True
    BufferSynchroFlags = []
    FetchWholeRows = True
    IsTree = False
    TreeTrash = 0
    TreeExpandLevel = 0
    Left = 640
    Top = 80
    ParamValues = (
      'STARTDATE=2005/10/01 00:00:00.0000'
      'ENDDATE=2005/10/31 00:00:00.0000')
  end
end
