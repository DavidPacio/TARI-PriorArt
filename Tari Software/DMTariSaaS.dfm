object DMTSaas: TDMTSaas
  OldCreateOrder = False
  Height = 598
  Width = 622
  object TARI_FB: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    Params.Strings = (
      'SERVER=www.tari.com.au'
      'USER NAME=TARI_RCLIENT'
      'PROTOCOL=TCP/IP'
      'PATH=tarisaas')
    Isolation = tiCommitted
    Left = 64
    Top = 24
    SavedPassword = '.JuMbLe.01.5A2B17220D220B5B42505A4B'
  end
  object MembersTbl: TIBOTable
    ColumnAttributes.Strings = (
      'MEMBERS.ID=REQUIRED'
      'MEMBERS.AUTHORITY_LEVEL=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    TableName = 'MEMBERS'
    FieldOptions = []
    Left = 56
    Top = 96
    object MembersTblID: TIntegerField
      FieldName = 'ID'
      Origin = 'MEMBERS.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MembersTblFIRSTNAME: TStringField
      FieldName = 'FIRSTNAME'
      Origin = 'MEMBERS.FIRSTNAME'
      Size = 30
    end
    object MembersTblLASTNAME: TStringField
      FieldName = 'LASTNAME'
      Origin = 'MEMBERS.LASTNAME'
      Size = 30
    end
    object MembersTblUSERNAME: TStringField
      FieldName = 'USERNAME'
      Origin = 'MEMBERS.USERNAME'
      Size = 60
    end
    object MembersTblPASS_WORD: TStringField
      FieldName = 'PASS_WORD'
      Origin = 'MEMBERS.PASS_WORD'
      Size = 30
    end
    object MembersTblAUTHORITY_LEVEL: TSmallintField
      FieldName = 'AUTHORITY_LEVEL'
      Origin = 'MEMBERS.AUTHORITY_LEVEL'
      Required = True
    end
    object MembersTblLAST_BUSINESS_ID: TIntegerField
      FieldName = 'LAST_BUSINESS_ID'
      Origin = 'MEMBERS.LAST_BUSINESS_ID'
    end
    object MembersTblCONSULTANT_CODE: TStringField
      FieldName = 'CONSULTANT_CODE'
      Origin = 'MEMBERS.CONSULTANT_CODE'
    end
  end
  object DSMembers: TDataSource
    DataSet = MembersTbl
    Left = 168
    Top = 96
  end
  object DSMemberBusinesses: TDataSource
    DataSet = MembersBusinessesqry
    Left = 160
    Top = 168
  end
  object BusinessesLUTbl: TIBOTable
    ColumnAttributes.Strings = (
      'BUSINESSES.ID=REQUIRED'
      'BUSINESSES.SAMPLEDATA=REQUIRED'
      'BUSINESSES.CONSOLIDATED=REQUIRED'
      'BUSINESSES.FLAGGED_DELETE=REQUIRED'
      'BUSINESSES.CURRENCY_SYM=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    AllowHorizontalRefinement = False
    MasterFields = 'ID=BUSINESS_ID'
    MasterSource = DSMemberBusinesses
    TableName = 'BUSINESSES'
    FieldOptions = []
    Left = 48
    Top = 232
    object BusinessesLUTblID: TIntegerField
      FieldName = 'ID'
      Origin = 'BUSINESSES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object BusinessesLUTblBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Origin = 'BUSINESSES.BUSINESS_NAME'
      Size = 60
    end
    object BusinessesLUTblCITY: TStringField
      FieldName = 'CITY'
      Origin = 'BUSINESSES.CITY'
      Size = 40
    end
    object BusinessesLUTblSAMPLEDATA: TSmallintField
      FieldName = 'SAMPLEDATA'
      Origin = 'BUSINESSES.SAMPLEDATA'
      Required = True
    end
    object BusinessesLUTblCONSOLIDATED: TSmallintField
      FieldName = 'CONSOLIDATED'
      Origin = 'BUSINESSES.CONSOLIDATED'
      Required = True
    end
    object BusinessesLUTblFLAGGED_DELETE: TSmallintField
      FieldName = 'FLAGGED_DELETE'
      Origin = 'BUSINESSES.FLAGGED_DELETE'
      Required = True
    end
    object BusinessesLUTblCURRENCY_SYM: TStringField
      FieldName = 'CURRENCY_SYM'
      Origin = 'BUSINESSES.CURRENCY_SYM'
      Required = True
      FixedChar = True
      Size = 4
    end
  end
  object DSBusinesses: TDataSource
    DataSet = BusinessesLUTbl
    Left = 168
    Top = 232
  end
  object InvoicesTbl: TIBOTable
    ColumnAttributes.Strings = (
      'INVOICES.ID=REQUIRED'
      'INVOICES.BUSINESS_ID=REQUIRED'
      'INVOICES.ISQUOTE=REQUIRED'
      'INVOICES.ISPAST=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    MasterFields = 'Business_ID=BUSINESS_ID'
    MasterSource = DSMemberBusinesses
    TableName = 'INVOICES'
    FieldOptions = []
    Left = 48
    Top = 312
    object InvoicesTblID: TIntegerField
      FieldName = 'ID'
      Origin = 'INVOICES.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object InvoicesTblBUSINESS_ID: TIntegerField
      FieldName = 'BUSINESS_ID'
      Origin = 'INVOICES.BUSINESS_ID'
      Required = True
    end
    object InvoicesTblINV_DATE: TDateField
      FieldName = 'INV_DATE'
      Origin = 'INVOICES.INV_DATE'
    end
    object InvoicesTblINV_NO: TStringField
      FieldName = 'INV_NO'
      Origin = 'INVOICES.INV_NO'
      Size = 60
    end
    object InvoicesTblINV_SALE: TBCDField
      FieldName = 'INV_SALE'
      Origin = 'INVOICES.INV_SALE'
      Precision = 18
      Size = 2
    end
    object InvoicesTblINV_COGS: TBCDField
      FieldName = 'INV_COGS'
      Origin = 'INVOICES.INV_COGS'
      Precision = 18
      Size = 2
    end
    object InvoicesTblINV_UNITS: TBCDField
      FieldName = 'INV_UNITS'
      Origin = 'INVOICES.INV_UNITS'
      Precision = 18
      Size = 2
    end
    object InvoicesTblINV_ITEMS: TBCDField
      FieldName = 'INV_ITEMS'
      Origin = 'INVOICES.INV_ITEMS'
      Precision = 18
      Size = 2
    end
    object InvoicesTblISQUOTE: TSmallintField
      FieldName = 'ISQUOTE'
      Origin = 'INVOICES.ISQUOTE'
      Required = True
    end
    object InvoicesTblISPAST: TSmallintField
      FieldName = 'ISPAST'
      Origin = 'INVOICES.ISPAST'
      Required = True
    end
  end
  object DSInvoices: TDataSource
    DataSet = InvoicesTbl
    Left = 160
    Top = 312
  end
  object YearDataTbl: TIBOTable
    ColumnAttributes.Strings = (
      'YEAR_DATA.ID=REQUIRED'
      'YEAR_DATA.BUSINESS_ID=REQUIRED'
      'YEAR_DATA.PS_DATE=REQUIRED'
      'YEAR_DATA.PE_DATE=REQUIRED'
      'YEAR_DATA.ISPLAN=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    MasterFields = 'BUSINESS_ID=BUSINESS_ID'
    MasterSource = DSMemberBusinesses
    TableName = 'YEAR_DATA'
    FieldOptions = []
    Left = 48
    Top = 392
    object YearDataTblID: TIntegerField
      FieldName = 'ID'
      Origin = 'YEAR_DATA.ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object YearDataTblBUSINESS_ID: TIntegerField
      FieldName = 'BUSINESS_ID'
      Origin = 'YEAR_DATA.BUSINESS_ID'
      Required = True
    end
    object YearDataTblPS_DATE: TDateField
      FieldName = 'PS_DATE'
      Origin = 'YEAR_DATA.PS_DATE'
      Required = True
    end
    object YearDataTblPE_DATE: TDateField
      FieldName = 'PE_DATE'
      Origin = 'YEAR_DATA.PE_DATE'
      Required = True
    end
    object YearDataTblISPLAN: TSmallintField
      FieldName = 'ISPLAN'
      Origin = 'YEAR_DATA.ISPLAN'
      Required = True
    end
    object YearDataTblSALES: TBCDField
      FieldName = 'SALES'
      Origin = 'YEAR_DATA.SALES'
      Precision = 18
      Size = 2
    end
    object YearDataTblGROSSPROFIT: TBCDField
      FieldName = 'GROSSPROFIT'
      Origin = 'YEAR_DATA.GROSSPROFIT'
      Precision = 18
      Size = 2
    end
    object YearDataTblTOTAL_EXPENSES: TBCDField
      FieldName = 'TOTAL_EXPENSES'
      Origin = 'YEAR_DATA.TOTAL_EXPENSES'
      Precision = 18
      Size = 2
    end
    object YearDataTblPOTENTIAL_UNITS: TBCDField
      FieldName = 'POTENTIAL_UNITS'
      Origin = 'YEAR_DATA.POTENTIAL_UNITS'
      Precision = 18
      Size = 2
    end
    object YearDataTblBILLED_UNITS: TBCDField
      FieldName = 'BILLED_UNITS'
      Origin = 'YEAR_DATA.BILLED_UNITS'
      Precision = 18
      Size = 2
    end
  end
  object DSYearData: TDataSource
    DataSet = YearDataTbl
    Left = 160
    Top = 392
  end
  object clInternetConnection1: TclInternetConnection
    Left = 344
    Top = 40
  end
  object clHttpRequest1: TclHttpRequest
    Header.ContentType = 'application/x-www-form-urlencoded'
    Header.Accept = 'text/html */*'
    Header.AcceptLanguage = 'en-us'
    Left = 464
    Top = 40
  end
  object clHtmlParser1: TclHtmlParser
    ParseMethod = pmAll
    Left = 344
    Top = 112
  end
  object clUploader1: TclUploader
    InternetAgent = 'Mozilla/4.0 (compatible; Clever Internet Suite)'
    Connection = clInternetConnection1
    KeepConnection = True
    UseHttpRequest = True
    HttpRequest = clHttpRequest1
    UseSimpleRequest = True
    RequestMethod = 'POST'
    Left = 464
    Top = 112
  end
  object MembersBusinessesqry: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'MEMBERID'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'BUSINESSES.SAMPLEDATA=BOOLEAN'
      'BUSINESS_MEMBERS.BUSINESS_ID=REQUIRED'
      'BUSINESSES.CURRENCY_SYM=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'SELECT BUSINESS_MEMBERS.BUSINESS_ID'
      '     , BUSINESSES.BUSINESS_NAME'
      '     , BUSINESSES.CITY'
      '     , BUSINESSES.CURRENCY_SYM'
      'FROM BUSINESS_MEMBERS'
      'JOIN BUSINESSES ON (BUSINESSES.ID=BUSINESS_MEMBERS.BUSINESS_ID)'
      
        'WHERE (BUSINESS_MEMBERS.MEMBER_ID=:MEMBERID) AND (BUSINESSES.SAM' +
        'PLEDATA=0) AND (BUSINESSES.CONSOLIDATED=0) AND (BUSINESSES.FLAGG' +
        'ED_DELETE=0)'
      'ORDER BY BUSINESSES.BUSINESS_NAME')
    FieldOptions = []
    Left = 56
    Top = 168
    object MembersBusinessesqryBUSINESS_ID: TIntegerField
      FieldName = 'BUSINESS_ID'
      Origin = 'BUSINESS_MEMBERS.BUSINESS_ID'
      Required = True
    end
    object MembersBusinessesqryBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Origin = 'BUSINESSES.BUSINESS_NAME'
      Size = 60
    end
    object MembersBusinessesqryCITY: TStringField
      FieldName = 'CITY'
      Origin = 'BUSINESSES.CITY'
      Size = 40
    end
    object MembersBusinessesqryCURRENCY_SYM: TStringField
      FieldName = 'CURRENCY_SYM'
      Origin = 'BUSINESSES.CURRENCY_SYM'
      Required = True
      FixedChar = True
      Size = 4
    end
  end
  object Detailed_TargetsQry: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'BusinessID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'AccountID'
        ParamType = ptInput
      end>
    Active = True
    ColumnAttributes.Strings = (
      'DETAILED_TARGETS.START_PERIOD=REQUIRED')
    DatabaseName = 'www.tari.com.au:tarisaas'
    IB_Connection = TARI_FB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    RequestLive = True
    SQL.Strings = (
      'SELECT START_PERIOD'
      '     , BALANCES'
      
        'FROM DETAILED_TARGETS where BUSINESS_ID=:BusinessID and ACCOUNT_' +
        'ID=:AccountID'
      'FOR UPDATE')
    FieldOptions = []
    Left = 344
    Top = 192
    object Detailed_TargetsQrySTART_PERIOD: TSmallintField
      FieldName = 'START_PERIOD'
      Origin = 'DETAILED_TARGETS.START_PERIOD'
      Required = True
    end
  end
  object DSDetailedTargets: TDataSource
    DataSet = Detailed_TargetsQry
    Left = 464
    Top = 192
  end
  object IB_DSDetailedTargets: TIB_DataSource
    Dataset = DetailedTargetIBQry
    Left = 464
    Top = 264
  end
  object DetailedTargetIBQry: TIB_Query
    ColumnAttributes.Strings = (
      'BALANCES=CURRENCY')
    DatabaseName = 'www.tari.com.au:tarisaas'
    FieldsAlignment.Strings = (
      'BALANCES=RIGHT')
    FieldsDisplayWidth.Strings = (
      'BALANCES=259'
      'START_PERIOD=124'
      'DB_KEY=270')
    FieldsVisible.Strings = (
      'BALANCES=TRUE'
      'BUSINESS_ID=FALSE'
      'ACCOUNT_ID=FALSE')
    IB_Connection = TARI_FB
    SQL.Strings = (
      'SELECT START_PERIOD'
      '     , BALANCES'
      '     , BUSINESS_ID'
      '     , ACCOUNT_ID'
      
        'FROM DETAILED_TARGETS where BUSINESS_ID=:BusinessID and ACCOUNT_' +
        'ID=:AccountID'
      'FOR UPDATE')
    AutoFetchAll = True
    RequestLive = True
    Left = 344
    Top = 264
    ParamValues = (
      'BUSINESSID=01000000'
      'ACCOUNTID=64000000')
  end
end
