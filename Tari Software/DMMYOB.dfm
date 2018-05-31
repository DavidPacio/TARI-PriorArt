object DMMYOBData: TDMMYOBData
  OldCreateOrder = False
  Left = 957
  Top = 348
  Height = 553
  Width = 668
  object MYOB_ODCB_DB: TDatabase
    AliasName = 'MYOB_BESTON'
    Connected = True
    DatabaseName = 'MYOB_TARI'
    HandleShared = True
    LoginPrompt = False
    Params.Strings = (
      'TYPE=SERVER'
      'UID=Administrator'
      'PWD='
      'HOST_EXE_PATH=C:\\Premier10\\MYOBP.exe'
      'NETWORK_PROTOCOL=TCP_IP'
      'KEY=C:\\Premier10\\614018258003.key'
      'DATABASE=C:\\Premier10\\bigClearwtrV10.MYO'
      'DRIVER_COMPLETION=DRIVER_NOPROMPT'
      'SQL_LOGIN_TIMEOUT=31'
      'DRIVER=MYOB ODBC'
      'USER NAME=Administrator')
    SessionName = 'Default'
    AfterConnect = MYOB_ODCB_DBAfterConnect
    BeforeConnect = MYOB_ODCB_DBBeforeConnect
    Left = 32
    Top = 16
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
    Left = 40
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
  object DSExtractTB: TDataSource
    DataSet = QryExtract_TB
    Left = 136
    Top = 144
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
      'ORDER BY P.AccountNumber')
    Left = 40
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
  object FB_Myob_Accounts: TIBOTable
    ColumnAttributes.Strings = (
      'ACCOUNT_ID=REQUIRED')
    DatabaseName = 'FBMYOBTARI'
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
  object FB_MYOBTARIDB: TIBODatabase
    SQLDialect = 3
    DatabaseName = 'FBMYOBTARI'
    Params.Strings = (
      
        'PATH=C:\Program Files\Focus Based Management\TARI For Business\D' +
        'ata\MYOBTari.Fdb'
      'PROTOCOL=TCP/IP'
      'SERVER=Devwork1'
      'USER NAME=SYSDBA')
    BeforeConnect = FB_MYOBTARIDBBeforeConnect
    AfterConnect = FB_MYOBTARIDBAfterConnect
    Isolation = tiCommitted
    Left = 240
    Top = 24
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object FB_MYOB_TB: TIBOTable
    DatabaseName = 'FBMYOBTARI'
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
    DatabaseName = 'FBMYOBTARI'
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
  object DSFB_MYOB_Accounts: TDataSource
    DataSet = FB_Myob_Accounts
    Left = 360
    Top = 80
  end
  object DSFB_MYOB_TB: TDataSource
    DataSet = FB_MYOB_TB
    Left = 360
    Top = 136
  end
  object DSAccountMapping: TDataSource
    DataSet = FB_AccountMapping
    Left = 360
    Top = 192
  end
  object DSMyob_Accounts: TDataSource
    DataSet = QryMyobAccounts
    Left = 136
    Top = 200
  end
  object MYOB_AccClass: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.AccountClassification'
    Left = 48
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
  object MYOB_AccSubClass: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.SubAccountTypes'
    Left = 48
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
  object FB_AccountClass: TIBOTable
    ColumnAttributes.Strings = (
      'CLASS_ID=REQUIRED')
    DatabaseName = 'FBMYOBTARI'
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
    DatabaseName = 'FBMYOBTARI'
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
  object IB_Query1: TIB_Query
    DatabaseName = 'FBMYOBTARI'
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
    Left = 560
    Top = 88
  end
  object FB_MyobAccountListing: TIBOQuery
    Params = <>
    DatabaseName = 'FBMYOBTARI'
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
  object FB_Account_Bals: TIBOTable
    DatabaseName = 'FBMYOBTARI'
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
    DatabaseName = 'FBMYOBTARI'
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
  object MYOB_Acc_Activities: TTable
    DatabaseName = 'MYOB_TARI'
    TableName = 'MYOB.AccountActivities'
    Left = 48
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
  object SP_Delete_TB: TIBOStoredProc
    Params = <>
    StoredProcHasDML = True
    StoredProcName = 'CLEARTRIALBALANCE'
    DatabaseName = 'FBMYOBTARI'
    IB_Connection = FB_MYOBTARIDB
    Left = 552
    Top = 24
  end
  object DSFB_MYOBInfo: TDataSource
    DataSet = FB_MYOB_Info
    Left = 368
    Top = 424
  end
  object DSMYOBInfo: TDataSource
    DataSet = TblMYOB_Data
    Left = 128
    Top = 80
  end
  object qrymyobSaleslines: TQuery
    AutoCalcFields = False
    DatabaseName = 'MYOB_BESTON'
    SessionName = 'Default'
    SQL.Strings = (
      'Select  A.SaleID'
      '   ,  A.CardRecordID'
      '   ,  A.InvoiceNumber'
      '   ,  A.InvoiceDate'
      '   ,  A.InvoiceStatusID'
      '   ,  A.TotalLines'
      '   ,  A.TaxExclusiveFreight'
      '   ,  A.TotalTax'
      '   ,  A.SalesPersonID'
      '   ,  SUM(B.TaxExclusiveTotal) AS ItemSaleAmount'
      '   ,  SUM(B.Quantity) AS ItemQuantity'
      '   ,  SUM(B.CostOfGoodsSoldAmount) AS Cogs'
      '   ,  SUM(C.TaxExclusiveAmount) AS TimeSaleAmount'
      '   ,  SUM(C.HoursUnits) AS Hours'
      '   ,  COUNT(B.ItemID) as ItemCount'
      '   ,  D.LastName AS CustomerLastName'
      '   ,  D.FirstName AS CustomerFirstName'
      '   ,  D.IsIndividual AS CustomerIsIndividual'
      '   ,  E.LastName AS EmployeeLastName'
      '   ,  E.FirstName AS EmployeeFirstName'
      'FROM MYOB.Sales A'
      'INNER JOIN MYOB.Customers D on (D.CustomerID=A.CardRecordID)'
      'INNER JOIN MYOB.Employees E on (E.EmployeeID=A.SalesPersonID)'
      
        'LEFT JOIN MYOB.ItemSaleLines B on (B.SaleID=A.SaleID) and (A.Inv' +
        'oiceTypeID='#39'I'#39')'
      
        'LEFT JOIN MYOB.TimeBillingSaleLines C on (C.SaleID=A.SaleID) and' +
        ' (A.InvoiceTypeID='#39'T'#39')'
      'GROUP BY'
      '      A.SaleID'
      '   ,  A.CardRecordID'
      '   ,  A.InvoiceNumber'
      '   ,  A.InvoiceDate'
      '   ,  A.InvoiceStatusID'
      '   ,  A.TotalLines'
      '   ,  A.TaxExclusiveFreight'
      '   ,  A.TotalTax'
      '   ,  A.SalesPersonID'
      '   ,  D.LastName '
      '   ,  D.FirstName'
      '   ,  D.IsIndividual'
      '   ,  E.LastName'
      '   ,  E.FirstName'
      
        'HAVING (A.InvoiceDate >= :STARTDATE) AND (A.InvoiceDate <= :ENDD' +
        'ATE)'
      'ORDER BY A.InvoiceDate, A.InvoiceNumber '
      '')
    Left = 48
    Top = 424
    ParamData = <
      item
        DataType = ftString
        Name = 'STARTDATE'
        ParamType = ptInputOutput
        Value = '07/01/2003'
      end
      item
        DataType = ftString
        Name = 'ENDDATE'
        ParamType = ptInput
        Value = '06/30/2004'
      end>
    object qrymyobSaleslinesSaleID: TIntegerField
      DisplayWidth = 12
      FieldName = 'SaleID'
    end
    object qrymyobSaleslinesCardRecordID: TIntegerField
      DisplayWidth = 14
      FieldName = 'CardRecordID'
    end
    object qrymyobSaleslinesInvoiceNumber: TStringField
      DisplayWidth = 15
      FieldName = 'InvoiceNumber'
      Size = 8
    end
    object qrymyobSaleslinesInvoiceDate: TDateField
      DisplayWidth = 12
      FieldName = 'InvoiceDate'
    end
    object qrymyobSaleslinesInvoiceStatusID: TStringField
      DisplayWidth = 15
      FieldName = 'InvoiceStatusID'
      Size = 2
    end
    object qrymyobSaleslinesTotalLines: TFloatField
      DisplayWidth = 12
      FieldName = 'TotalLines'
    end
    object qrymyobSaleslinesTaxExclusiveFreight: TFloatField
      DisplayWidth = 19
      FieldName = 'TaxExclusiveFreight'
    end
    object qrymyobSaleslinesTotalTax: TFloatField
      DisplayWidth = 12
      FieldName = 'TotalTax'
    end
    object qrymyobSaleslinesSalesPersonID: TIntegerField
      DisplayWidth = 14
      FieldName = 'SalesPersonID'
    end
    object qrymyobSaleslinesItemSaleAmount: TFloatField
      DisplayWidth = 16
      FieldName = 'ItemSaleAmount'
    end
    object qrymyobSaleslinesItemQuantity: TFloatField
      DisplayWidth = 12
      FieldName = 'ItemQuantity'
    end
    object qrymyobSaleslinesCogs: TFloatField
      DisplayWidth = 8
      FieldName = 'Cogs'
    end
    object qrymyobSaleslinesTimeSaleAmount: TFloatField
      DisplayWidth = 16
      FieldName = 'TimeSaleAmount'
    end
    object qrymyobSaleslinesHours: TFloatField
      DisplayWidth = 12
      FieldName = 'Hours'
    end
    object qrymyobSaleslinesItemCount: TIntegerField
      DisplayWidth = 12
      FieldName = 'ItemCount'
    end
    object qrymyobSaleslinesCustomerLastName: TStringField
      DisplayWidth = 63
      FieldName = 'CustomerLastName'
      Size = 52
    end
    object qrymyobSaleslinesCustomerFirstName: TStringField
      DisplayWidth = 24
      FieldName = 'CustomerFirstName'
    end
    object qrymyobSaleslinesCustomerIsIndividual: TStringField
      DisplayWidth = 20
      FieldName = 'CustomerIsIndividual'
      Size = 1
    end
    object qrymyobSaleslinesEmployeeLastName: TStringField
      DisplayWidth = 63
      FieldName = 'EmployeeLastName'
      Size = 52
    end
    object qrymyobSaleslinesEmployeeFirstName: TStringField
      DisplayWidth = 24
      FieldName = 'EmployeeFirstName'
    end
  end
  object DSSalesLines: TDataSource
    DataSet = qrymyobSaleslines
    Left = 152
    Top = 424
  end
end
