object DMTariMWClient: TDMTariMWClient
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 676
  Width = 688
  object kbmMWTCPIPIndyClientTransport1: TkbmMWTCPIPIndyClientTransport
    Active = False
    Port = 3000
    Host = 'devwin7.fbm.com.au'
    StreamFormat = 'STANDARD'
    VerifyTransfer = True
    TransportStateOptions = []
    MaxRetries = 1
    MaxRetriesAlternative = 1
    RequestTimeout = 100
    Plugin = kbmMWSsTLSTransportPlugin1
    MinClientPort = 0
    MaxClientPort = 0
    ConnectTimeout = 120
    StringConversion = mwscFixed
    FallbackServers.Strings = (
      
        'PARAMS=;STREAMFORMAT=STANDARD;VERIFYTRANSFER=YES;STRINGCONVERSIO' +
        'N=1;IDLEINTERVAL=-1;HOST=www.tari.com.au;PORT=3000;BOUNDPORTMIN=' +
        '0;BOUNDPORTMAX=0;<|TARILOCAL|>'
      
        'PARAMS=;STREAMFORMAT=STANDARD;VERIFYTRANSFER=YES;STRINGCONVERSIO' +
        'N=1;IDLEINTERVAL=-1;HOST=devwin7.fbm.com.au;PORT=3000;BOUNDPORTM' +
        'IN=0;BOUNDPORTMAX=0')
    AutoFallback = True
    Left = 128
    Top = 8
  end
  object kbmMWClientConnectionPool1: TkbmMWClientConnectionPool
    Transport = kbmMWTCPIPIndyClientTransport1
    Left = 200
    Top = 8
  end
  object kbmMWPooledSession1: TkbmMWPooledSession
    ConnectionPool = kbmMWClientConnectionPool1
    AutoSessionName = True
    SessionName = 'JENS'
    Left = 304
    Top = 8
  end
  object kbmMWBinaryStreamFormat1: TkbmMWBinaryStreamFormat
    Version = '3.10'
    sfLargeFields = []
    sfCalculated = []
    sfLookup = []
    LargeFieldSize = 0
    sfDisplayWidth = []
    Left = 408
    Top = 8
  end
  object LoginQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@TARILOGIN')
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    TableName = 'TARILOGIN'
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 80
  end
  object DSLoginQuery: TDataSource
    DataSet = LoginQuery
    Left = 160
    Top = 80
  end
  object DSMonthlyTargets: TDataSource
    DataSet = MonthlyTargetsQuery
    Left = 160
    Top = 504
  end
  object kbmMWClientStoredProc1: TkbmMWClientStoredProc
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    CacheFlags = []
    SessionName = 'JENS'
    ConnectionPool = kbmMWClientConnectionPool1
    StoredProcName = 'GET_DETAILED_BALANCES'
    Overload = 0
    Params = <
      item
        DataType = ftInteger
        Name = 'BUSINESS_ID'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftInteger
        Name = 'ACCOUNT_ID'
        ParamType = ptInput
        Value = 100
      end
      item
        DataType = ftInteger
        Name = 'START_NO'
        ParamType = ptInput
        Value = 1
      end
      item
        DataType = ftBCD
        Name = 'BALANCE'
        ParamType = ptOutput
        Value = 0c
      end>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'BALANCE'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 272
    Top = 80
    object kbmMWClientStoredProc1BALANCE: TBCDField
      FieldName = 'BALANCE'
      Size = 2
    end
  end
  object DSStoredProc: TDataSource
    DataSet = kbmMWClientStoredProc1
    Left = 384
    Top = 80
  end
  object MemberBusinessesQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@MEMBERBUSINESSES')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    TableName = 'BUSINESS_MEMBERS'
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    OnCalcFields = MemberBusinessesQueryCalcFields
    Left = 56
    Top = 136
    object MemberBusinessesQueryWithinLocal: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'WithinLocal'
      Calculated = True
    end
    object MemberBusinessesQueryBusiness_id: TIntegerField
      FieldName = 'Business_id'
    end
    object MemberBusinessesQueryBusiness_Name: TStringField
      FieldName = 'Business_Name'
      Size = 50
    end
  end
  object DSMemberBusinesses: TDataSource
    DataSet = MemberBusinessesQuery
    Left = 160
    Top = 136
  end
  object BusinessQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@BUSINESSQUERY')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = '*'
    TableName = 'BUSINESSES'
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 192
  end
  object DSBusiness: TDataSource
    DataSet = BusinessQuery
    Left = 160
    Top = 192
  end
  object PastDataQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@PASTDATA')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 
      'Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Ex' +
      'penses;Potential_Units;Billed_Units'
    TableName = 'YEAR_DATA'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'ID'
    DetailFields = 'BUSINESS_ID'
    MasterSource = DSBusiness
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 248
  end
  object DSPastData: TDataSource
    DataSet = PastDataQuery
    Left = 160
    Top = 248
  end
  object PastInvoicesQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@PASTINVOICES')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 
      'Id;Business_Id;Inv_Date;Inv_No;Inv_Sale;Inv_Cogs;Inv_Units;Inv_I' +
      'tems;Isquote;Ispast'
    TableName = 'INVOICES'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'ID'
    DetailFields = 'BUSINESS_ID'
    MasterSource = DSBusiness
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 368
  end
  object DSPastInvoices: TDataSource
    DataSet = PastInvoicesQuery
    Left = 160
    Top = 368
  end
  object kbmMWSsTLSTransportPlugin1: TkbmMWSsTLSTransportPlugin
    Enabled = True
    TLSServer = SimpleTLSInternalServer1
    VerboseInfo = True
    Left = 544
    Top = 16
  end
  object SsPrivateKeyRingComponent1: TSsPrivateKeyRingComponent
    AllowPlainTextKeys = True
    CacheKeyInterfaces = False
    DefaultHashAlgorithm = haSHA1
    SessionKeyLifeSpan = 0.020833333333333330
    OnAdminPassword = SsPrivateKeyRingComponent1AdminPassword
    OnPassword = SsPrivateKeyRingComponent1Password
    Left = 604
    Top = 81
  end
  object SimpleTLSInternalServer1: TSimpleTLSInternalServer
    MyCertList = <>
    PrivateKeyRing = SsPrivateKeyRingComponent1
    PublicKeyAlgorithms = [pkaRSA, pkaDSA, pkaECDSA, pkaDH, pkaECDH]
    RootCertList = <>
    SessionKeyLifeSpan = 0.020833333333333330
    OnPassword = SimpleTLSInternalServer1Password
    ClientOrServer = cosClientSide
    Options.BulkCipherAES128 = prPrefer
    Options.BulkCipherAES256 = prAllowed
    Options.EphemeralECDHKeySize = ecs256
    Options.HashAlgorithmMD5 = prNotAllowed
    Options.KeyAgreementECDH = prAllowed
    Options.KeyAgreementECDHE = prAllowed
    Options.SignatureECDSA = prAllowed
    Options.VerifyServerName = [vsnIP, vsnDNS, vsnURI]
    TrustedCertList = <>
    Left = 524
    Top = 81
    InternalRootCerts = {
      545046300D545265736F7572636546696C652553696D706C65544C53496E7465
      726E616C53657276657231526F6F74436572747346696C650000}
    InternalMyCerts = {
      545046300D545265736F7572636546696C652353696D706C65544C53496E7465
      726E616C536572766572314D79436572747346696C650000}
    InternalTrustedCerts = {
      545046300D545265736F7572636546696C652853696D706C65544C53496E7465
      726E616C5365727665723154727573746564436572747346696C650000}
  end
  object kbmMWSimpleClient1: TkbmMWSimpleClient
    Transport = kbmMWTCPIPIndyClientTransport1
    Left = 48
    Top = 8
  end
  object TargetDataQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@TARGETDATA')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 
      'Id;Business_Id;Ps_Date;Pe_Date;Isplan;Sales;Grossprofit;Total_Ex' +
      'penses;Potential_Units;Billed_Units'
    TableName = 'YEAR_DATA'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'ID'
    DetailFields = 'BUSINESS_ID'
    MasterSource = DSBusiness
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 304
  end
  object DSTargetData: TDataSource
    DataSet = TargetDataQuery
    Left = 160
    Top = 304
  end
  object CurrentInvoicesQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    CacheFlags = []
    Query.Strings = (
      '@CURRENTINVOICES')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 
      'Id;Business_Id;Inv_Date;Inv_No;Inv_Sale;Inv_Cogs;Inv_Units;Inv_I' +
      'tems;Isquote;Ispast'
    TableName = 'INVOICES'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PS_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'PE_DATE'
        Attributes = [faRequired]
        DataType = ftDate
      end
      item
        Name = 'ISPLAN'
        Attributes = [faRequired]
        DataType = ftSmallint
      end
      item
        Name = 'SALES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'GROSSPROFIT'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'TOTAL_EXPENSES'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'POTENTIAL_UNITS'
        DataType = ftBCD
        Size = 2
      end
      item
        Name = 'BILLED_UNITS'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'ID'
    DetailFields = 'BUSINESS_ID'
    MasterSource = DSBusiness
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 432
  end
  object DSCurrentInvoices: TDataSource
    DataSet = CurrentInvoicesQuery
    Left = 160
    Top = 432
  end
  object MonthlyTargetsQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    ConnectionPool = kbmMWClientConnectionPool1
    CacheFlags = []
    Query.Strings = (
      '@MONTHLYTARGETS')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'Business_Id;Account_Id;Mth;Balance'
    TableName = 'MONTHLY_TARGETS'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ACCOUNT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MTH'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BALANCE'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    MasterFields = 'ID'
    DetailFields = 'BUSINESS_ID'
    MasterSource = DSBusiness
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 504
  end
  object TBConnectQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    ConnectionPool = kbmMWClientConnectionPool1
    CacheFlags = []
    Query.Strings = (
      '@TBCONNECT')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    KeyFields = 'BUSINESS_ID;TB_ALIAS;TB_DEPTID;LAST_MODIFIED;DATE_CREATED'
    TableName = 'TB_CONNECT'
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ACCOUNT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MTH'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BALANCE'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    DetailFields = 'BUSINESS_ID'
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 56
    Top = 576
  end
  object DSTBConnect: TDataSource
    DataSet = TBConnectQuery
    Left = 160
    Top = 576
  end
  object AliasQuery: TkbmMWClientQuery
    ClientAsTemplate = False
    QueryService = 'TARI_SAASQUERY'
    QueryServiceVersion = 'kbmMW_1.0'
    CacheParams = ptUnknown
    SessionName = 'JENS'
    ConnectionPool = kbmMWClientConnectionPool1
    CacheFlags = []
    Query.Strings = (
      '@ALIASQUERY')
    Params = <>
    TransportStreamFormat = kbmMWBinaryStreamFormat1
    FetchLargeFieldsOnDemand = True
    LargeFieldSize = 256
    FetchMaxRecords = 0
    RequeryDetails = True
    AutoResolveOnChange = False
    AutoResolveOnClose = False
    StatementPassthrough = True
    AttachedAutoRefresh = True
    AttachMaxCount = 1
    FieldDefs = <
      item
        Name = 'BUSINESS_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ACCOUNT_ID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'MTH'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'BALANCE'
        DataType = ftBCD
        Size = 2
      end>
    IndexDefs = <>
    SortOptions = []
    PersistentBackup = False
    ProgressFlags = [mtpcLoad, mtpcSave, mtpcCopy]
    LoadedCompletely = True
    SavedCompletely = False
    EnableVersioning = True
    FilterOptions = []
    Version = '7.15.00 Professional Edition'
    LanguageID = 0
    SortID = 0
    SubLanguageID = 0
    LocaleID = 0
    Left = 278
    Top = 136
  end
end
