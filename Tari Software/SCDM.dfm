object DMInterface: TDMInterface
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleCreate
  Left = 630
  Top = 242
  Height = 935
  Width = 749
  object SCDatabase: TDatabase
    AliasName = 'SC2TARI'
    DatabaseName = 'SCDB'
    HandleShared = True
    LoginPrompt = False
    ReadOnly = True
    SessionName = 'Default'
    AfterConnect = SCDatabaseAfterConnect
    BeforeConnect = SCDatabaseBeforeConnect
    BeforeDisconnect = SCDatabaseBeforeDisconnect
    Left = 40
    Top = 16
  end
  object SCHistory: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    TableName = 'historys.DB'
    Left = 40
    Top = 72
    object SCHistoryClientIdNumber: TIntegerField
      FieldName = 'ClientIdNumber'
    end
    object SCHistoryDate: TDateField
      FieldName = 'Date'
    end
    object SCHistoryPOSTransNum: TSmallintField
      FieldName = 'POSTransNum'
    end
    object SCHistoryService: TIntegerField
      FieldName = 'Service'
    end
    object SCHistoryBlock: TSmallintField
      FieldName = 'Block'
    end
    object SCHistoryStylistIdNumber: TSmallintField
      FieldName = 'StylistIdNumber'
    end
    object SCHistoryQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object SCHistoryDiscount: TCurrencyField
      FieldName = 'Discount'
    end
    object SCHistoryTax: TCurrencyField
      FieldName = 'Tax'
    end
    object SCHistoryAmount: TCurrencyField
      FieldName = 'Amount'
    end
    object SCHistoryStylistPoints: TFloatField
      FieldName = 'Stylist Points'
    end
    object SCHistoryDiscountReason: TSmallintField
      FieldName = 'Discount Reason'
    end
    object SCHistoryTaxId: TSmallintField
      FieldName = 'Tax Id'
    end
  end
  object DSSCHistory: TDataSource
    DataSet = SQHistory
    Left = 112
    Top = 72
  end
  object DSSCProducts: TDataSource
    DataSet = SQProducts
    Left = 112
    Top = 128
  end
  object SCProducts: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'IdNumber'
    ReadOnly = True
    TableName = 'products.DB'
    Left = 40
    Top = 128
    object SCProductsIdNumber: TIntegerField
      FieldName = 'IdNumber'
    end
    object SCProductsName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object SCProductsBuyPrice: TCurrencyField
      FieldName = 'BuyPrice'
    end
    object SCProductsCategoryId: TSmallintField
      FieldName = 'CategoryId'
    end
    object SCProductsSellPrice: TCurrencyField
      FieldName = 'SellPrice'
    end
    object SCProductsActive: TSmallintField
      FieldName = 'Active'
    end
  end
  object SCServices: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'IdNumber'
    ReadOnly = True
    TableName = 'services.DB'
    Left = 40
    Top = 192
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
  object SCCategory: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'Id Number'
    ReadOnly = True
    TableName = 'category.DB'
    Left = 40
    Top = 248
    object SCCategoryIdNumber: TSmallintField
      FieldName = 'Id Number'
    end
    object SCCategoryName: TStringField
      FieldName = 'Name'
    end
  end
  object SCEmploys: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'IdNumber'
    ReadOnly = True
    TableName = 'employs.DB'
    Left = 40
    Top = 304
    object SCEmploysIdNumber: TSmallintField
      FieldName = 'IdNumber'
    end
    object SCEmploysLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object SCEmploysFirstName: TStringField
      FieldName = 'FirstName'
      Size = 30
    end
    object SCEmploysActive: TSmallintField
      FieldName = 'Active'
    end
  end
  object SC2TARIDB: TIBODatabase
    SQLDialect = 3
    DatabaseName = 'SC_FDB_1'
    Params.Strings = (
      'SERVER=DEVWORK1'
      'SQL DIALECT=3'
      
        'PATH=C:\Program Files\Focus Based Management\Tari for Business\D' +
        'ata\rawtest2.FDB'
      'PROTOCOL=TCP/IP'
      'USER NAME=SYSDBA')
    BeforeConnect = SC2TARIDBBeforeConnect
    AfterConnect = SC2TARIDBAfterConnect
    BeforeDisconnect = SC2TARIDBBeforeDisconnect
    Isolation = tiCommitted
    Left = 208
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object FBTRans: TIBOTable
    ColumnAttributes.Strings = (
      'TRANSACTIONS.TRANS_ID=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'TRANSACTIONS'
    FieldOptions = []
    Left = 208
    Top = 80
    object FBTRansTRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      Origin = 'TRANSACTIONS.TRANS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBTRansTRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      Origin = 'TRANSACTIONS.TRANS_DATE'
    end
    object FBTRansCLIENT_ID: TIntegerField
      FieldName = 'CLIENT_ID'
      Origin = 'TRANSACTIONS.CLIENT_ID'
    end
  end
  object FBDailyTrans: TIBOTable
    ColumnAttributes.Strings = (
      'DAILY_TRANS.TRANS_ID=REQUIRED'
      'DAILY_TRANS.LINE_INDEX=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'DAILY_TRANS'
    FieldOptions = []
    Left = 208
    Top = 136
    object FBDailyTransTRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      Origin = 'DAILY_TRANS.TRANS_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBDailyTransLINE_INDEX: TIntegerField
      FieldName = 'LINE_INDEX'
      Origin = 'DAILY_TRANS.LINE_INDEX'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBDailyTransPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'DAILY_TRANS.PRODUCT_ID'
    end
    object FBDailyTransSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      Origin = 'DAILY_TRANS.STAFF_ID'
    end
    object FBDailyTransINTERNAL: TSmallintField
      FieldName = 'INTERNAL'
      Origin = 'DAILY_TRANS.INTERNAL'
    end
    object FBDailyTransNET_SALE_VALUE: TBCDField
      FieldName = 'NET_SALE_VALUE'
      Origin = 'DAILY_TRANS.NET_SALE_VALUE'
      Precision = 18
      Size = 2
    end
    object FBDailyTransQUANTITY: TBCDField
      FieldName = 'QUANTITY'
      Origin = 'DAILY_TRANS.QUANTITY'
      Precision = 18
      Size = 2
    end
  end
  object FBSystem_Data: TIBOTable
    ColumnAttributes.Strings = (
      'SYSTEM_DATA.SYSTEM_ID=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'SYSTEM_DATA'
    FieldOptions = []
    Left = 208
    Top = 192
    object FBSystem_DataSYSTEM_ID: TIntegerField
      FieldName = 'SYSTEM_ID'
      Origin = 'SYSTEM_DATA.SYSTEM_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBSystem_DataSTR_FIELD: TStringField
      FieldName = 'STR_FIELD'
      Origin = 'SYSTEM_DATA.STR_FIELD'
      Size = 150
    end
    object FBSystem_DataINT_FIELD: TIntegerField
      FieldName = 'INT_FIELD'
      Origin = 'SYSTEM_DATA.INT_FIELD'
    end
    object FBSystem_DataNUM_FIELD: TBCDField
      FieldName = 'NUM_FIELD'
      Origin = 'SYSTEM_DATA.NUM_FIELD'
      Precision = 18
      Size = 2
    end
    object FBSystem_DataDATE_FIELD: TDateTimeField
      FieldName = 'DATE_FIELD'
      Origin = 'SYSTEM_DATA.DATE_FIELD'
    end
  end
  object FBStaff: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'STAFF'
    FieldOptions = []
    Left = 208
    Top = 248
    object FBStaffSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      Required = True
    end
    object FBStaffLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Size = 50
    end
    object FBStaffFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Size = 50
    end
    object FBStaffPRODUCTION_PC: TBCDField
      FieldName = 'PRODUCTION_PC'
      Precision = 18
    end
    object FBStaffPRODUCER: TSmallintField
      FieldName = 'PRODUCER'
      Required = True
    end
    object FBStaffIS_ACTIVE: TSmallintField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
  end
  object FBProducts: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'PRODUCTS'
    FieldOptions = []
    Left = 208
    Top = 304
    object FBProductsPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object FBProductsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 120
    end
    object FBProductsPRODUCT_GROUP: TIntegerField
      FieldName = 'PRODUCT_GROUP'
    end
    object FBProductsIS_LABOUR: TSmallintField
      FieldName = 'IS_LABOUR'
    end
    object FBProductsIS_LISTED: TSmallintField
      FieldName = 'IS_LISTED'
    end
    object FBProductsIS_CALCULATED: TSmallintField
      FieldName = 'IS_CALCULATED'
    end
    object FBProductsSELLING_PRICE: TBCDField
      FieldName = 'SELLING_PRICE'
      Precision = 18
      Size = 2
    end
    object FBProductsCOST_PRICE: TBCDField
      FieldName = 'COST_PRICE'
      Precision = 18
      Size = 2
    end
    object FBProductsUNITS: TBCDField
      FieldName = 'UNITS'
      Precision = 18
      Size = 2
    end
    object FBProductsUNITS_LABOUR: TBCDField
      FieldName = 'UNITS_LABOUR'
      Precision = 18
      Size = 2
    end
    object FBProductsSTOCK_ON_HAND: TBCDField
      FieldName = 'STOCK_ON_HAND'
      Precision = 18
      Size = 2
    end
    object FBProductsSTOCK_MIN: TBCDField
      FieldName = 'STOCK_MIN'
      Precision = 18
      Size = 2
    end
    object FBProductsSTOCK_REORDER: TBCDField
      FieldName = 'STOCK_REORDER'
      Precision = 18
      Size = 2
    end
    object FBProductsLAST_UPDATED: TDateTimeField
      FieldName = 'LAST_UPDATED'
    end
    object FBProductsIS_ACTIVE: TSmallintField
      FieldName = 'IS_ACTIVE'
      Required = True
    end
  end
  object FBGroups: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'PRODUCT_GROUPS'
    FieldOptions = []
    Left = 208
    Top = 360
    object FBGroupsGROUP_ID: TIntegerField
      FieldName = 'GROUP_ID'
      Required = True
    end
    object FBGroupsGROUP_NAME: TStringField
      FieldName = 'GROUP_NAME'
      Size = 60
    end
  end
  object FB_Components: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'PRODUCT_COMPONENTS'
    FieldOptions = []
    Left = 208
    Top = 416
    object FB_ComponentsPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object FB_ComponentsCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Required = True
    end
    object FB_ComponentsCOMPONENT_QTY: TBCDField
      FieldName = 'COMPONENT_QTY'
      Precision = 18
      Size = 2
    end
    object FB_ComponentsCOMPONENT_ORDER: TIntegerField
      FieldName = 'COMPONENT_ORDER'
    end
  end
  object DSFBTRans: TDataSource
    DataSet = FBTRans
    Left = 296
    Top = 80
  end
  object DSFBDailyTrans: TDataSource
    DataSet = FBDailyTrans
    Left = 296
    Top = 136
  end
  object DSFBSystem_data: TDataSource
    DataSet = FBSystem_Data
    Left = 296
    Top = 192
  end
  object DSFBStaff: TDataSource
    DataSet = FBStaff
    Left = 296
    Top = 248
  end
  object DSFBProducts: TDataSource
    DataSet = FBProducts
    Left = 296
    Top = 304
  end
  object DSFBGroups: TDataSource
    DataSet = FBGroups
    Left = 296
    Top = 360
  end
  object DSFBComponents: TDataSource
    DataSet = FB_Components
    Left = 296
    Top = 416
  end
  object IB_Query1: TIB_Query
    DatabaseName = 'SC_FDB_1'
    FieldsDisplayWidth.Strings = (
      'PRODUCT_ID=102'
      'SALES=130'
      'UNITS=110')
    IB_Connection = SC2TARIDB
    SQL.Strings = (
      'SELECT CLIENTIDNUMBER'
      '     , TRANS_DATE'
      '     , SERVICE'
      '     , BLOCK'
      '     , STYLISTIDNUMBER'
      '     , QUANTITY'
      '     , TAX'
      '     , AMOUNT'
      'FROM SCHISTORY'
      'ORDER BY SERVICE, TRANS_DATE, CLIENTIDNUMBER, POSTRANSNUM, BLOCK')
    Left = 392
    Top = 16
  end
  object SCPettyCash: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'PettyCashId'
    ReadOnly = True
    TableName = 'pettycash.DB'
    Left = 40
    Top = 368
    object SCPettyCashPettyCashId: TIntegerField
      FieldName = 'PettyCashId'
    end
    object SCPettyCashName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object SCPettyCashDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object SCPettyCashActive: TSmallintField
      FieldName = 'Active'
    end
    object SCPettyCashIsPettyCash: TSmallintField
      FieldName = 'IsPettyCash'
    end
  end
  object FB_Accounts: TIBOTable
    ColumnAttributes.Strings = (
      'ACCOUNT_NO=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'ACCOUNTS'
    FieldOptions = []
    Left = 208
    Top = 528
    object FB_AccountsACCOUNT_NO: TIntegerField
      FieldName = 'ACCOUNT_NO'
      Origin = 'ACCOUNTS.ACCOUNT_NO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FB_AccountsACCOUNT_TITLE: TStringField
      FieldName = 'ACCOUNT_TITLE'
      Origin = 'ACCOUNTS.ACCOUNT_TITLE'
      Size = 100
    end
    object FB_AccountsACCOUNT_DESC: TStringField
      FieldName = 'ACCOUNT_DESC'
      Origin = 'ACCOUNTS.ACCOUNT_DESC'
      Size = 100
    end
    object FB_AccountsIS_PETTY_CASH: TSmallintField
      FieldName = 'IS_PETTY_CASH'
      Origin = 'ACCOUNTS.IS_PETTY_CASH'
    end
    object FB_AccountsIS_ACTIVE: TSmallintField
      FieldName = 'IS_ACTIVE'
      Origin = 'ACCOUNTS.IS_ACTIVE'
    end
  end
  object FB_Account_Trans: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'ACCOUNT_TRANS'
    FieldOptions = []
    Left = 208
    Top = 584
    object FB_Account_TransTRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      Required = True
    end
    object FB_Account_TransTRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      Required = True
    end
    object FB_Account_TransACCOUNT_NO: TIntegerField
      FieldName = 'ACCOUNT_NO'
    end
    object FB_Account_TransAMOUNT_PAID: TBCDField
      FieldName = 'AMOUNT_PAID'
      Precision = 18
      Size = 2
    end
  end
  object IB_Query2: TIB_Query
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    SQL.Strings = (
      'SELECT P.STAFF_ID '
      '    ,  P.FIRSTNAME'
      '    ,  P.LASTNAME'
      '    ,  SUM(Q.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(S.COST_PRICE) AS COGS'
      '    ,  SUM(Q.QUANTITY * S.UNITS_LABOUR) AS TOTAL_MINS'
      '    ,  P.PRODUCER'
      'FROM STAFF P'
      'JOIN DAILY_TRANS Q ON (Q.STAFF_ID=P.STAFF_ID)'
      'JOIN TRANSACTIONS R ON (R.TRANS_ID=Q.TRANS_ID)'
      'JOIN PRODUCTS S ON ((S.PRODUCT_ID=Q.PRODUCT_ID))'
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY P.STAFF_ID, P.FIRSTNAME, P.LASTNAME, P.PRODUCER'
      'ORDER BY P.LASTNAME, P.FIRSTNAME')
    Left = 480
    Top = 16
    ParamValues = (
      'STARTDATE=2005/10/01 00:00:00.0000'
      'ENDDATE=2005/10/31 00:00:00.0000')
  end
  object SP_Post_Trans: TIBOStoredProc
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
    StoredProcHasDML = True
    StoredProcName = 'POST_HISTORY'
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    Left = 616
    Top = 424
  end
  object SCClients: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    ReadOnly = True
    TableName = 'clients.DB'
    Left = 40
    Top = 424
    object SCClientsIdNumber: TIntegerField
      FieldName = 'IdNumber'
    end
    object SCClientsLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object SCClientsFirstName: TStringField
      FieldName = 'FirstName'
    end
  end
  object FB_Clients: TIBOTable
    ColumnAttributes.Strings = (
      'CLIENT_ID=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'CLIENTS'
    FieldOptions = []
    Left = 208
    Top = 640
    object FB_ClientsCLIENT_ID: TIntegerField
      FieldName = 'CLIENT_ID'
      Origin = 'CLIENTS.CLIENT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FB_ClientsLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Origin = 'CLIENTS.LASTNAME'
      Size = 50
    end
    object FB_ClientsFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'CLIENTS.FIRSTNAME'
      Size = 50
    end
  end
  object DSFBAccounts: TDataSource
    DataSet = FB_Accounts
    Left = 296
    Top = 528
  end
  object DSFBAccount_Trans: TDataSource
    DataSet = FB_Account_Trans
    Left = 304
    Top = 584
  end
  object DSFBClients: TDataSource
    DataSet = FB_Clients
    Left = 296
    Top = 640
  end
  object SCSundry: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    ReadOnly = True
    TableName = 'sundry.DB'
    Left = 40
    Top = 480
    object SCSundryIdNumber: TIntegerField
      FieldName = 'Id Number'
    end
    object SCSundryName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object SCSundryDefaultAmount: TCurrencyField
      FieldName = 'Default Amount'
    end
    object SCSundryActive: TSmallintField
      FieldName = 'Active'
    end
  end
  object SCEmployeeHours: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    IndexFieldNames = 'EmployeeId;LogOff'
    ReadOnly = True
    TableName = 'EmployeeHours.db'
    Left = 40
    Top = 536
    object SCEmployeeHoursEmployeeId: TSmallintField
      FieldName = 'EmployeeId'
    end
    object SCEmployeeHoursLogOff: TDateTimeField
      FieldName = 'LogOff'
    end
    object SCEmployeeHoursLogOn: TDateTimeField
      FieldName = 'LogOn'
    end
  end
  object FB_DailyHours: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'DAILY_HOURS'
    FieldOptions = []
    Left = 408
    Top = 184
    object FB_DailyHoursSTAFF_DATE: TDateField
      FieldName = 'STAFF_DATE'
      Required = True
    end
    object FB_DailyHoursSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      Required = True
    end
    object FB_DailyHoursMINUTES_LOGGED: TIntegerField
      FieldName = 'MINUTES_LOGGED'
    end
  end
  object DSFBDailyHours: TDataSource
    DataSet = FB_DailyHours
    Left = 472
    Top = 184
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
      'SELECT T.DESCRIPTION'
      '    ,  COUNT(T.PRODUCT_ID)'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      
        'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID) AND (S.INTERNAL = ' +
        '0)'
      
        'JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) and (T.PRODUCT_ID' +
        ' >= 1000) AND (T.PRODUCT_ID <= 9999) '
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY T.DESCRIPTION'
      'ORDER BY T.DESCRIPTION')
    RequestLive = True
    Left = 400
    Top = 80
    ParamValues = (
      'STARTDATE=2005/10/01 00:00:00.0000'
      'ENDDATE=2005/10/31 00:00:00.0000')
  end
  object FBUnitsUpdate: TIBOQuery
    Params = <>
    ColumnAttributes.Strings = (
      'PRODUCT_ID=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    OnCalcFields = FBUnitsUpdateCalcFields
    RequestLive = True
    SQL.Strings = (
      'SELECT X.PRODUCT_ID'
      
        '     , (SELECT GROUP_NAME FROM PRODUCT_GROUPS WHERE PRODUCT_GROU' +
        'PS.GROUP_ID=X.PRODUCT_GROUP) AS PROD_GROUP'
      '     , X.DESCRIPTION'
      '     , X.SELLING_PRICE'
      '     , X.UNITS_LABOUR'
      '     , X.LAST_UPDATED'
      '     , X.IS_ACTIVE'
      'FROM PRODUCTS X'
      'WHERE (X.IS_LABOUR = 1) AND (IS_LISTED = 1)'
      
        'ORDER BY (SELECT GROUP_NAME FROM PRODUCT_GROUPS WHERE PRODUCT_GR' +
        'OUPS.GROUP_ID=X.PRODUCT_GROUP), X.DESCRIPTION'
      'FOR UPDATE')
    FieldOptions = []
    Left = 408
    Top = 248
    object FBUnitsUpdatePRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Origin = 'PRODUCTS.PRODUCT_ID'
      Required = True
    end
    object FBUnitsUpdatePROD_GROUP: TStringField
      FieldName = 'PROD_GROUP'
      ReadOnly = True
      Size = 60
    end
    object FBUnitsUpdateDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Origin = 'PRODUCTS.DESCRIPTION'
      Size = 120
    end
    object FBUnitsUpdateSELLING_PRICE: TBCDField
      FieldName = 'SELLING_PRICE'
      Origin = 'PRODUCTS.SELLING_PRICE'
      Precision = 18
      Size = 2
    end
    object FBUnitsUpdateUNITS_LABOUR: TBCDField
      FieldName = 'UNITS_LABOUR'
      Origin = 'PRODUCTS.UNITS_LABOUR'
      Precision = 18
      Size = 2
    end
    object FBUnitsUpdateLAST_UPDATED: TDateTimeField
      FieldName = 'LAST_UPDATED'
      Origin = 'PRODUCTS.LAST_UPDATED'
    end
    object FBUnitsUpdateTARI_Rate: TCurrencyField
      FieldKind = fkCalculated
      FieldName = 'TARI_Rate'
      Calculated = True
    end
  end
  object DSFBUnitsUpdate: TDataSource
    DataSet = FBUnitsUpdate
    Left = 488
    Top = 248
  end
  object StyleRepository: TcxStyleRepository
    Left = 408
    Top = 312
    PixelsPerInch = 96
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
  object SCSystemSettings: TTable
    DatabaseName = 'SCDB'
    SessionName = 'Default'
    ReadOnly = True
    TableName = 'SystemSettings.DB'
    Left = 40
    Top = 592
    object SCSystemSettingsId: TIntegerField
      FieldName = 'Id'
    end
    object SCSystemSettingsValue: TStringField
      FieldName = 'Value'
      Size = 255
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    OnCalcFields = FBStaffReportCalcFields
    SQL.Strings = (
      'SELECT P.STAFF_ID '
      '    ,  P.FIRSTNAME'
      '    ,  P.LASTNAME'
      '    ,  SUM(Q.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(S.COST_PRICE) AS COGS'
      '    ,  SUM(Q.QUANTITY * S.UNITS_LABOUR) AS TOTAL_MINS'
      '    ,  P.PRODUCER'
      'FROM STAFF P'
      'JOIN DAILY_TRANS Q ON (Q.STAFF_ID=P.STAFF_ID)'
      'JOIN TRANSACTIONS R ON (R.TRANS_ID=Q.TRANS_ID)'
      'JOIN PRODUCTS S ON ((S.PRODUCT_ID=Q.PRODUCT_ID))'
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY P.STAFF_ID, P.FIRSTNAME, P.LASTNAME, P.PRODUCER'
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
    object FBStaffReportPRODUCER: TSmallintField
      FieldName = 'PRODUCER'
      ReadOnly = True
      Required = True
    end
  end
  object DSStaffReport: TDataSource
    DataSet = FBStaffReport
    Left = 504
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
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
    Left = 504
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
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
    Left = 680
    Top = 368
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
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
  object FB_TARIServiceUPDATE: TIBOQuery
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT R.TRANS_ID'
      '    ,  R.TRANS_DATE'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(T.COST_PRICE) AS COGS'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID)'
      'JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) '
      'GROUP BY R.TRANS_ID, R.TRANS_DATE'
      'HAVING (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) '
      '       AND (CAST(R.TRANS_DATE AS DATE) <= :ENDDATE) '
      '       AND (SUM(S.QUANTITY * T.UNITS_LABOUR) <> 0)'
      'ORDER BY R.TRANS_DATE')
    FieldOptions = []
    Left = 416
    Top = 584
    object FB_TARIServiceUPDATETRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      ReadOnly = True
      Required = True
    end
    object FB_TARIServiceUPDATETRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      ReadOnly = True
    end
    object FB_TARIServiceUPDATESALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FB_TARIServiceUPDATECOGS: TBCDField
      FieldName = 'COGS'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FB_TARIServiceUPDATETOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
  end
  object FB_TARIRetailUPDATE: TIBOQuery
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT R.TRANS_ID'
      '    ,  R.TRANS_DATE'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(T.COST_PRICE) AS COGS'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID)'
      'JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) '
      'GROUP BY R.TRANS_ID, R.TRANS_DATE'
      'HAVING (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) '
      '       AND (CAST(R.TRANS_DATE AS DATE) <= :ENDDATE) '
      '       AND (SUM(S.QUANTITY * T.UNITS_LABOUR) = 0)'
      'ORDER BY R.TRANS_DATE')
    FieldOptions = []
    Left = 416
    Top = 640
    object FB_TARIRetailUPDATETRANS_ID: TIntegerField
      FieldName = 'TRANS_ID'
      ReadOnly = True
      Required = True
    end
    object FB_TARIRetailUPDATETRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      ReadOnly = True
    end
    object FB_TARIRetailUPDATESALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FB_TARIRetailUPDATECOGS: TBCDField
      FieldName = 'COGS'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FB_TARIRetailUPDATETOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
  end
  object qryAddSubProducts: TIBOQuery
    Params = <>
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    RequestLive = True
    SQL.Strings = (
      'SELECT PRODUCT_ID'
      '     , DESCRIPTION'
      '     , PRODUCT_GROUP'
      '     , IS_LABOUR'
      '     , IS_LISTED'
      '     , IS_CALCULATED'
      '     , SELLING_PRICE'
      '     , COST_PRICE'
      '     , UNITS'
      '     , UNITS_LABOUR'
      '     , LAST_UPDATED'
      'FROM PRODUCTS where (PRODUCT_ID>= 5000) AND (PRODUCT_ID < 10000)'
      'ORDER BY PRODUCT_ID'
      'FOR UPDATE')
    FieldOptions = []
    Left = 408
    Top = 128
    object qryAddSubProductsPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object qryAddSubProductsDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 120
    end
    object qryAddSubProductsPRODUCT_GROUP: TIntegerField
      FieldName = 'PRODUCT_GROUP'
    end
    object qryAddSubProductsIS_LABOUR: TSmallintField
      FieldName = 'IS_LABOUR'
    end
    object qryAddSubProductsIS_LISTED: TSmallintField
      FieldName = 'IS_LISTED'
    end
    object qryAddSubProductsIS_CALCULATED: TSmallintField
      FieldName = 'IS_CALCULATED'
    end
    object qryAddSubProductsSELLING_PRICE: TBCDField
      FieldName = 'SELLING_PRICE'
      Precision = 18
      Size = 2
    end
    object qryAddSubProductsCOST_PRICE: TBCDField
      FieldName = 'COST_PRICE'
      Precision = 18
      Size = 2
    end
    object qryAddSubProductsUNITS: TBCDField
      FieldName = 'UNITS'
      Precision = 18
      Size = 2
    end
    object qryAddSubProductsUNITS_LABOUR: TBCDField
      FieldName = 'UNITS_LABOUR'
      Precision = 18
      Size = 2
    end
    object qryAddSubProductsLAST_UPDATED: TDateTimeField
      FieldName = 'LAST_UPDATED'
    end
  end
  object SPUpdateComponents: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'UPDATE_COMPONENTS'
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    Left = 600
    Top = 16
  end
  object DSComponentLU: TDataSource
    DataSet = ComponentLU
    Left = 656
    Top = 168
  end
  object ComponentLU: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    MasterFields = 'PRODUCT_ID=COMPONENT_ID'
    MasterSource = DSFBComponentLU
    TableName = 'PRODUCTS'
    FieldOptions = []
    Left = 560
    Top = 184
    object ComponentLUPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object ComponentLUDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      Size = 120
    end
    object ComponentLUSELLING_PRICE: TBCDField
      FieldName = 'SELLING_PRICE'
      Precision = 18
      Size = 2
    end
    object ComponentLUUNITS_LABOUR: TBCDField
      FieldName = 'UNITS_LABOUR'
      Precision = 18
      Size = 2
    end
  end
  object FBComponentsLU: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    MasterFields = 'PRODUCT_ID=PRODUCT_ID'
    MasterSource = DSFBUnitsUpdate
    TableName = 'PRODUCT_COMPONENTS'
    FieldOptions = []
    Left = 560
    Top = 120
    object FBComponentsLUPRODUCT_ID: TIntegerField
      FieldName = 'PRODUCT_ID'
      Required = True
    end
    object FBComponentsLUCOMPONENT_ID: TIntegerField
      FieldName = 'COMPONENT_ID'
      Required = True
    end
    object FBComponentsLUCOMPONENT_ORDER: TIntegerField
      FieldName = 'COMPONENT_ORDER'
    end
    object FBComponentsLUCOMPONENT_QTY: TBCDField
      FieldName = 'COMPONENT_QTY'
      Precision = 18
      Size = 2
    end
  end
  object DSFBComponentLU: TDataSource
    DataSet = FBComponentsLU
    Left = 656
    Top = 120
  end
  object FBStaffHoursbyDate: TIBOQuery
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
        Value = 0d
      end>
    ColumnAttributes.Strings = (
      'STAFF_ID=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    SQL.Strings = (
      'Select X.STAFF_DATE, X.STAFF_ID, X.MINUTES_LOGGED'
      'FROM DAILY_HOURS X'
      'WHERE (X.STAFF_DATE>=:STARTDATE) AND(X.STAFF_DATE <= :ENDDATE)'
      'ORDER BY X.STAFF_DATE, X.STAFF_ID')
    FieldOptions = []
    Left = 600
    Top = 360
    object FBStaffHoursbyDateSTAFF_DATE: TDateField
      FieldName = 'STAFF_DATE'
      ReadOnly = True
      Required = True
    end
    object FBStaffHoursbyDateSTAFF_ID: TIntegerField
      FieldName = 'STAFF_ID'
      Required = True
    end
    object FBStaffHoursbyDateMINUTES_LOGGED: TIntegerField
      FieldName = 'MINUTES_LOGGED'
    end
  end
  object FB_Zero_Paid_Hours: TIBOStoredProc
    Params = <
      item
        DataType = ftDate
        Name = 'STARTDATE'
        ParamType = ptInput
        Value = 0d
      end
      item
        DataType = ftDate
        Name = 'ENDDATE'
        ParamType = ptInput
        Value = 0d
      end>
    StoredProcHasDML = True
    StoredProcName = 'ZERO_PAID_MINUTES'
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    Left = 640
    Top = 72
  end
  object DSSCServices: TDataSource
    DataSet = SQServices
    Left = 112
    Top = 192
  end
  object FBServicesReport: TIBOQuery
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
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT T.DESCRIPTION'
      '    ,  COUNT(T.PRODUCT_ID)'
      '    ,  SUM(S.NET_SALE_VALUE) AS SALES'
      '    ,  SUM(S.QUANTITY * T.UNITS_LABOUR) AS TOTAL_MINS'
      'FROM TRANSACTIONS R'
      
        'JOIN DAILY_TRANS S ON (S.TRANS_ID=R.TRANS_ID) AND (S.INTERNAL = ' +
        '0)'
      
        'JOIN PRODUCTS T ON (T.PRODUCT_ID=S.PRODUCT_ID) and (T.PRODUCT_ID' +
        ' >= 1000) AND (T.PRODUCT_ID <= 9999) '
      
        'WHERE (CAST(R.TRANS_DATE AS DATE) >= :STARTDATE) AND (CAST(R.TRA' +
        'NS_DATE AS DATE) <= :ENDDATE)'
      'GROUP BY T.DESCRIPTION'
      'ORDER BY T.DESCRIPTION')
    FieldOptions = []
    Left = 560
    Top = 248
    object FBServicesReportDESCRIPTION: TStringField
      FieldName = 'DESCRIPTION'
      ReadOnly = True
      Size = 120
    end
    object FBServicesReportCOUNT: TIntegerField
      FieldName = 'COUNT'
      ReadOnly = True
      Required = True
    end
    object FBServicesReportSALES: TBCDField
      FieldName = 'SALES'
      ReadOnly = True
      Precision = 18
      Size = 2
    end
    object FBServicesReportTOTAL_MINS: TBCDField
      FieldName = 'TOTAL_MINS'
      ReadOnly = True
      Precision = 18
    end
  end
  object DSServicesReport: TDataSource
    DataSet = FBServicesReport
    Left = 656
    Top = 248
  end
  object FBHistory: TIBOTable
    ColumnAttributes.Strings = (
      'CLIENTIDNUMBER=REQUIRED'
      'TRANS_DATE=REQUIRED'
      'POSTRANSNUM=REQUIRED'
      'SERVICE=REQUIRED'
      'BLOCK=REQUIRED')
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'SCHISTORY'
    FieldOptions = []
    Left = 528
    Top = 536
    object FBHistoryCLIENTIDNUMBER: TIntegerField
      FieldName = 'CLIENTIDNUMBER'
      Origin = 'SCHISTORY.CLIENTIDNUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBHistoryTRANS_DATE: TDateField
      FieldName = 'TRANS_DATE'
      Origin = 'SCHISTORY.TRANS_DATE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBHistoryPOSTRANSNUM: TSmallintField
      FieldName = 'POSTRANSNUM'
      Origin = 'SCHISTORY.POSTRANSNUM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBHistorySERVICE: TIntegerField
      FieldName = 'SERVICE'
      Origin = 'SCHISTORY.SERVICE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBHistoryBLOCK: TSmallintField
      FieldName = 'BLOCK'
      Origin = 'SCHISTORY.BLOCK'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FBHistorySTYLISTIDNUMBER: TIntegerField
      FieldName = 'STYLISTIDNUMBER'
      Origin = 'SCHISTORY.STYLISTIDNUMBER'
    end
    object FBHistoryQUANTITY: TIBOFloatField
      FieldName = 'QUANTITY'
      Origin = 'SCHISTORY.QUANTITY'
    end
    object FBHistoryDISCOUNT: TBCDField
      FieldName = 'DISCOUNT'
      Origin = 'SCHISTORY.DISCOUNT'
      Precision = 18
      Size = 2
    end
    object FBHistoryTAX: TBCDField
      FieldName = 'TAX'
      Origin = 'SCHISTORY.TAX'
      Precision = 18
      Size = 2
    end
    object FBHistoryAMOUNT: TBCDField
      FieldName = 'AMOUNT'
      Origin = 'SCHISTORY.AMOUNT'
      Precision = 18
      Size = 2
    end
    object FBHistorySTYLISTPOINTS: TIBOFloatField
      FieldName = 'STYLISTPOINTS'
      Origin = 'SCHISTORY.STYLISTPOINTS'
    end
    object FBHistoryDISCOUNTREASON: TSmallintField
      FieldName = 'DISCOUNTREASON'
      Origin = 'SCHISTORY.DISCOUNTREASON'
    end
    object FBHistoryTAXID: TSmallintField
      FieldName = 'TAXID'
      Origin = 'SCHISTORY.TAXID'
    end
  end
  object SPDeleteHistory: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'DELETE_HISTORY'
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    Left = 544
    Top = 72
  end
  object FB_UpdateScript: TIB_Script
    IB_Connection = SC2TARIDB
    Left = 536
    Top = 592
  end
  object SCTARIAccountLU: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'ACCOUNTS'
    FieldOptions = []
    Left = 560
    Top = 304
    object SCTARIAccountLUACCOUNT_NO: TIntegerField
      FieldName = 'ACCOUNT_NO'
      Required = True
    end
    object SCTARIAccountLUACCOUNT_TITLE: TStringField
      FieldName = 'ACCOUNT_TITLE'
      Size = 100
    end
    object SCTARIAccountLUACCOUNT_DESC: TStringField
      FieldName = 'ACCOUNT_DESC'
      Size = 100
    end
    object SCTARIAccountLUIS_PETTY_CASH: TSmallintField
      FieldName = 'IS_PETTY_CASH'
    end
    object SCTARIAccountLUIS_ACTIVE: TSmallintField
      FieldName = 'IS_ACTIVE'
    end
  end
  object FB_Tari_Mapping: TIBOTable
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    RecordCountAccurate = True
    TableName = 'TARI_MAPPING'
    FieldOptions = []
    Left = 208
    Top = 472
    object FB_Tari_MappingSC_ACCOUNT_NO: TIntegerField
      FieldName = 'SC_ACCOUNT_NO'
      Required = True
    end
    object FB_Tari_MappingSC_TITLE: TStringField
      FieldName = 'SC_TITLE'
      Size = 100
    end
    object FB_Tari_MappingTARI_ACCOUNT: TIntegerField
      FieldName = 'TARI_ACCOUNT'
    end
  end
  object DSTari_Mapping: TDataSource
    DataSet = FB_Tari_Mapping
    Left = 296
    Top = 472
  end
  object qryFBTARIMapped: TIB_Query
    DatabaseName = 'SC_FDB_1'
    IB_Connection = SC2TARIDB
    SQL.Strings = (
      'SELECT DISTINCT TARI_ACCOUNT'
      'FROM TARI_MAPPING'
      'GROUP BY TARI_ACCOUNT'
      'ORDER BY TARI_ACCOUNT')
    Left = 408
    Top = 464
  end
  object SCSQLDatabase: TSQLConnection
    ConnectionName = 'MSSQLConnection'
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbexpmss.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MSSQL'
      'HostName=ALPHA1\SQLEXPRESS'
      'DataBase=ShortscutsPOS'
      'User_Name=sa'
      'Password=kupunn22'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False')
    VendorLib = 'sqloledb'
    AfterConnect = SCSQLDatabaseAfterConnect
    BeforeConnect = SCSQLDatabaseBeforeConnect
    Connected = True
    Left = 112
    Top = 16
  end
  object SQHistory: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'Unique_History'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'historys'
    Left = 32
    Top = 640
    object SQHistoryClientIdNumber: TIntegerField
      FieldName = 'ClientIdNumber'
      Required = True
    end
    object SQHistoryDate: TSQLTimeStampField
      FieldName = 'Date'
      Required = True
    end
    object SQHistoryPOSTransNum: TIntegerField
      FieldName = 'POSTransNum'
      Required = True
    end
    object SQHistoryService: TIntegerField
      FieldName = 'Service'
      Required = True
    end
    object SQHistoryBlock: TIntegerField
      FieldName = 'Block'
      Required = True
    end
    object SQHistoryStylistIdNumber: TIntegerField
      FieldName = 'StylistIdNumber'
    end
    object SQHistoryQuantity: TFloatField
      FieldName = 'Quantity'
    end
    object SQHistoryDiscount: TFMTBCDField
      FieldName = 'Discount'
      Precision = 19
      Size = 4
    end
    object SQHistoryTax: TFMTBCDField
      FieldName = 'Tax'
      Precision = 19
      Size = 4
    end
    object SQHistoryAmount: TFMTBCDField
      FieldName = 'Amount'
      Precision = 19
      Size = 4
    end
    object SQHistoryStylistPoints: TFloatField
      FieldName = 'Stylist Points'
    end
    object SQHistoryDiscountReason: TIntegerField
      FieldName = 'Discount Reason'
    end
    object SQHistoryTaxId: TIntegerField
      FieldName = 'Tax Id'
    end
    object SQHistoryHistoryID: TIntegerField
      FieldName = 'HistoryID'
      Required = True
    end
    object SQHistorySaleID: TIntegerField
      FieldName = 'SaleID'
    end
    object SQHistoryTotalCostOfGoodsSold: TBCDField
      FieldName = 'TotalCostOfGoodsSold'
      Precision = 14
      Size = 2
    end
  end
  object SQProducts: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_products'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'products'
    Left = 32
    Top = 688
    object SQProductsIdNumber: TIntegerField
      FieldName = 'IdNumber'
      Required = True
    end
    object SQProductsName: TStringField
      FieldName = 'Name'
      Size = 40
    end
    object SQProductsSize: TIntegerField
      FieldName = 'Size'
    end
    object SQProductsMax: TFloatField
      FieldName = 'Max'
    end
    object SQProductsMin: TFloatField
      FieldName = 'Min'
    end
    object SQProductsBuyPrice: TFMTBCDField
      FieldName = 'BuyPrice'
      Precision = 19
      Size = 4
    end
    object SQProductsSellPrice: TFMTBCDField
      FieldName = 'SellPrice'
      Precision = 19
      Size = 4
    end
    object SQProductsCurrent: TFloatField
      FieldName = 'Current'
    end
    object SQProductsOnOrder: TFloatField
      FieldName = 'OnOrder'
    end
    object SQProductsRecRetail: TFMTBCDField
      FieldName = 'Rec Retail'
      Precision = 19
      Size = 4
    end
    object SQProductsCompanyId: TIntegerField
      FieldName = 'CompanyId'
    end
    object SQProductsLineId: TIntegerField
      FieldName = 'LineId'
    end
    object SQProductsActive: TIntegerField
      FieldName = 'Active'
    end
    object SQProductsRetail: TIntegerField
      FieldName = 'Retail'
    end
    object SQProductsPLU: TIntegerField
      FieldName = 'PLU'
    end
    object SQProductsBarcode: TStringField
      FieldName = 'Barcode'
      Size = 15
    end
    object SQProductsPurchaseTax: TIntegerField
      FieldName = 'Purchase Tax'
    end
    object SQProductsSaleTax: TIntegerField
      FieldName = 'Sale Tax'
    end
    object SQProductsTaxExemption: TIntegerField
      FieldName = 'Tax Exemption'
    end
    object SQProductsProductCode: TStringField
      FieldName = 'Product Code'
      Size = 15
    end
    object SQProductsMinReOrder: TFloatField
      FieldName = 'MinReOrder'
    end
    object SQProductsUnitOfMeasure: TIntegerField
      FieldName = 'UnitOfMeasure'
    end
    object SQProductsCategoryId: TIntegerField
      FieldName = 'CategoryId'
    end
    object SQProductsSubCategoryId: TIntegerField
      FieldName = 'SubCategoryId'
    end
    object SQProductsDefaultSupplierId: TIntegerField
      FieldName = 'DefaultSupplierId'
    end
    object SQProductsRequireSerial: TIntegerField
      FieldName = 'RequireSerial'
    end
    object SQProductsFixedQty: TIntegerField
      FieldName = 'FixedQty'
    end
    object SQProductsPicture: TBlobField
      FieldName = 'Picture'
      Size = 1
    end
    object SQProductsCannotOrderAfterDate: TSQLTimeStampField
      FieldName = 'CannotOrderAfterDate'
    end
    object SQProductsAverageCost: TFMTBCDField
      FieldName = 'AverageCost'
      Precision = 19
      Size = 6
    end
    object SQProductsStockValue: TFMTBCDField
      FieldName = 'StockValue'
      Precision = 19
      Size = 4
    end
  end
  object SQServices: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_services'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'services'
    Left = 32
    Top = 736
    object SQServicesIdNumber: TIntegerField
      FieldName = 'IdNumber'
      Required = True
    end
    object SQServicesCategory: TIntegerField
      FieldName = 'Category'
    end
    object SQServicesService: TStringField
      FieldName = 'Service'
      Size = 30
    end
    object SQServicesCost: TFMTBCDField
      FieldName = 'Cost'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints: TIntegerField
      FieldName = 'Points'
    end
    object SQServicesText1: TStringField
      FieldName = 'Text 1'
      Size = 30
    end
    object SQServicesTime1: TIntegerField
      FieldName = 'Time 1'
    end
    object SQServicesBreak1: TIntegerField
      FieldName = 'Break 1'
    end
    object SQServicesCost1: TFMTBCDField
      FieldName = 'Cost 1'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints1: TIntegerField
      FieldName = 'Points 1'
    end
    object SQServicesCount1: TIntegerField
      FieldName = 'Count 1'
    end
    object SQServicesText2: TStringField
      FieldName = 'Text 2'
      Size = 30
    end
    object SQServicesTime2: TIntegerField
      FieldName = 'Time 2'
    end
    object SQServicesBreak2: TIntegerField
      FieldName = 'Break 2'
    end
    object SQServicesCost2: TFMTBCDField
      FieldName = 'Cost 2'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints2: TIntegerField
      FieldName = 'Points 2'
    end
    object SQServicesCount2: TIntegerField
      FieldName = 'Count 2'
    end
    object SQServicesText3: TStringField
      FieldName = 'Text 3'
      Size = 30
    end
    object SQServicesTime3: TIntegerField
      FieldName = 'Time 3'
    end
    object SQServicesBreak3: TIntegerField
      FieldName = 'Break 3'
    end
    object SQServicesCost3: TFMTBCDField
      FieldName = 'Cost 3'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints3: TIntegerField
      FieldName = 'Points 3'
    end
    object SQServicesCount3: TIntegerField
      FieldName = 'Count 3'
    end
    object SQServicesText4: TStringField
      FieldName = 'Text 4'
      Size = 30
    end
    object SQServicesTime4: TIntegerField
      FieldName = 'Time 4'
    end
    object SQServicesBreak4: TIntegerField
      FieldName = 'Break 4'
    end
    object SQServicesCost4: TFMTBCDField
      FieldName = 'Cost 4'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints4: TIntegerField
      FieldName = 'Points 4'
    end
    object SQServicesCount4: TIntegerField
      FieldName = 'Count 4'
    end
    object SQServicesText5: TStringField
      FieldName = 'Text 5'
      Size = 30
    end
    object SQServicesTime5: TIntegerField
      FieldName = 'Time 5'
    end
    object SQServicesBreak5: TIntegerField
      FieldName = 'Break 5'
    end
    object SQServicesCost5: TFMTBCDField
      FieldName = 'Cost 5'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints5: TIntegerField
      FieldName = 'Points 5'
    end
    object SQServicesCount5: TIntegerField
      FieldName = 'Count 5'
    end
    object SQServicesText6: TStringField
      FieldName = 'Text 6'
      Size = 30
    end
    object SQServicesTime6: TIntegerField
      FieldName = 'Time 6'
    end
    object SQServicesCost6: TFMTBCDField
      FieldName = 'Cost 6'
      Precision = 19
      Size = 4
    end
    object SQServicesPoints6: TIntegerField
      FieldName = 'Points 6'
    end
    object SQServicesCount6: TIntegerField
      FieldName = 'Count 6'
    end
    object SQServicesCountFlag: TIntegerField
      FieldName = 'Count Flag'
    end
    object SQServicesActive: TIntegerField
      FieldName = 'Active'
    end
    object SQServicesChemical: TIntegerField
      FieldName = 'Chemical'
    end
    object SQServicesMainBlock: TIntegerField
      FieldName = 'Main Block'
    end
    object SQServicesTaxId: TIntegerField
      FieldName = 'Tax Id'
    end
  end
  object SQcategory: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_category'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'category'
    Left = 32
    Top = 784
    object SQcategoryIdNumber: TIntegerField
      FieldName = 'Id Number'
      Required = True
    end
    object SQcategoryName: TStringField
      FieldName = 'Name'
    end
  end
  object SQEmploys: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_employs'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'employs'
    Left = 32
    Top = 832
    object SQEmploysIdNumber: TIntegerField
      FieldName = 'IdNumber'
      Required = True
    end
    object SQEmploysLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object SQEmploysFirstName: TStringField
      FieldName = 'FirstName'
      Size = 30
    end
    object SQEmploysActive: TIntegerField
      FieldName = 'Active'
    end
  end
  object SQPettyCash: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_pettycash'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'pettycash'
    Left = 208
    Top = 696
    object SQPettyCashPettyCashId: TIntegerField
      FieldName = 'PettyCashId'
      Required = True
    end
    object SQPettyCashName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object SQPettyCashDescription: TStringField
      FieldName = 'Description'
      Size = 100
    end
    object SQPettyCashActive: TIntegerField
      FieldName = 'Active'
    end
    object SQPettyCashTaxId: TIntegerField
      FieldName = 'TaxId'
    end
    object SQPettyCashIsPettyCash: TIntegerField
      FieldName = 'IsPettyCash'
    end
  end
  object SQClients: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_clients'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'clients'
    Left = 208
    Top = 744
    object SQClientsIdNumber: TIntegerField
      FieldName = 'IdNumber'
      Required = True
    end
    object SQClientsLastName: TStringField
      FieldName = 'LastName'
      Size = 30
    end
    object SQClientsFirstName: TStringField
      FieldName = 'FirstName'
    end
  end
  object SQSundry: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_sundry'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'sundry'
    Left = 208
    Top = 792
    object SQSundryIdNumber: TIntegerField
      FieldName = 'Id Number'
      Required = True
    end
    object SQSundryName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object SQSundryDefaultAmount: TFMTBCDField
      FieldName = 'Default Amount'
      Precision = 19
      Size = 4
    end
    object SQSundryActive: TIntegerField
      FieldName = 'Active'
    end
  end
  object SQEmployeeHours: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_EmployeeHours'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'EmployeeHours'
    Left = 208
    Top = 848
    object SQEmployeeHoursEmployeeId: TIntegerField
      FieldName = 'EmployeeId'
      Required = True
    end
    object SQEmployeeHoursLogOff: TSQLTimeStampField
      FieldName = 'LogOff'
      Required = True
    end
    object SQEmployeeHoursLogOn: TSQLTimeStampField
      FieldName = 'LogOn'
    end
  end
  object SQSystemSettings: TSQLTable
    SchemaName = 'dbo'
    IndexName = 'PK_SystemSettings'
    MaxBlobSize = -1
    SQLConnection = SCSQLDatabase
    TableName = 'SystemSettings'
    Left = 304
    Top = 704
    object SQSystemSettingsId: TIntegerField
      FieldName = 'Id'
      Required = True
    end
    object SQSystemSettingsValue: TStringField
      FieldName = 'Value'
      Size = 255
    end
  end
end
