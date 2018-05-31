object TARIDM: TTARIDM
  OldCreateOrder = False
  Left = 540
  Top = 203
  Height = 758
  Width = 531
  object ClientDatabase: TIBODatabase
    AliasName = 'TARIDB'
    SQLDialect = 3
    DatabaseName = 'BusinessDB_2'
    Params.Strings = (
      'CONNECT=;PWD=GEarSyStem'
      ''
      'SQL DIALECT=3'
      'ROLE NAME=FBMADMIN'
      
        'PATH=C:\Program Files\Focus Based Management\TARI for Business\D' +
        'ata\Sample.fdb'
      'USER NAME=SYSDBA'
      'SERVER=DEVWORK1'
      'PROTOCOL=TCP/IP')
    ParameterOrder = poNew
    BeforeConnect = ClientDatabaseBeforeConnect
    AfterConnect = ClientDatabaseAfterConnect
    BeforeDisconnect = ClientDatabaseBeforeDisconnect
    Isolation = tiCommitted
    Left = 48
    Top = 16
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object Departments: TIBOTable
    AutoFetchAll = True
    ColumnAttributes.Strings = (
      'DEPT_ID=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    IndexFieldNames = 'Dept_Id'
    TableName = 'DEPARTMENTS'
    FieldOptions = []
    Left = 48
    Top = 72
    object DepartmentsREVENUE_GROUP_NAME: TStringField
      DisplayWidth = 60
      FieldName = 'REVENUE_GROUP_NAME'
      Origin = 'DEPARTMENTS.REVENUE_GROUP_NAME'
      Size = 60
    end
    object DepartmentsCURRENCY: TStringField
      DisplayLabel = 'Currency'
      DisplayWidth = 9
      FieldName = 'CURRENCY'
      Origin = 'DEPARTMENTS.CURRENCY'
      Visible = False
      Size = 10
    end
    object DepartmentsLASTDAYOFWEEK: TSmallintField
      DisplayLabel = 'Last Day of Week'
      DisplayWidth = 18
      FieldName = 'LASTDAYOFWEEK'
      Origin = 'DEPARTMENTS.LASTDAYOFWEEK'
      Visible = False
    end
    object DepartmentsCURRENTMONITORINGSTART: TDateField
      DisplayLabel = 'CurrentMonitoringStart'
      DisplayWidth = 18
      FieldName = 'CURRENTMONITORINGSTART'
      Origin = 'DEPARTMENTS.CURRENTMONITORINGSTART'
      Visible = False
    end
    object DepartmentsCURRENTMONITORINGEND: TDateField
      DisplayLabel = 'CurrentMonitoringEnd'
      DisplayWidth = 18
      FieldName = 'CURRENTMONITORINGEND'
      Origin = 'DEPARTMENTS.CURRENTMONITORINGEND'
      Visible = False
    end
    object DepartmentsFIRSTMONITORINGDATE: TDateField
      DisplayLabel = 'FirstMonitoringDate'
      DisplayWidth = 18
      FieldName = 'FIRSTMONITORINGDATE'
      Origin = 'DEPARTMENTS.FIRSTMONITORINGDATE'
      Visible = False
    end
    object DepartmentsDEPT_ID: TIntegerField
      FieldName = 'DEPT_ID'
      Origin = 'DEPARTMENTS.DEPT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Visible = False
    end
    object DepartmentsREPORT_CODE1: TStringField
      FieldName = 'REPORT_CODE1'
      Origin = 'DEPARTMENTS.REPORT_CODE1'
      Visible = False
      Size = 30
    end
    object DepartmentsREPORT_CODE2: TStringField
      FieldName = 'REPORT_CODE2'
      Origin = 'DEPARTMENTS.REPORT_CODE2'
      Visible = False
      Size = 30
    end
    object DepartmentsLAST_MONITORED: TDateField
      FieldName = 'LAST_MONITORED'
      Origin = 'DEPARTMENTS.LAST_MONITORED'
      Visible = False
    end
    object DepartmentsEXCLUDE_FROM_REPORTING: TSmallintField
      FieldName = 'EXCLUDE_FROM_REPORTING'
      Origin = 'DEPARTMENTS.EXCLUDE_FROM_REPORTING'
      Visible = False
    end
    object DepartmentsSINGULAR_UNITDESC: TStringField
      FieldName = 'SINGULAR_UNITDESC'
      Origin = 'DEPARTMENTS.SINGULAR_UNITDESC'
      Visible = False
      Size = 50
    end
    object DepartmentsPLURAL_UNITDESC: TStringField
      FieldName = 'PLURAL_UNITDESC'
      Origin = 'DEPARTMENTS.PLURAL_UNITDESC'
      Visible = False
      Size = 50
    end
    object DepartmentsCURRENTPLANSTART: TDateField
      FieldName = 'CURRENTPLANSTART'
      Origin = 'DEPARTMENTS.CURRENTPLANSTART'
      Visible = False
    end
    object DepartmentsCURRENTPLANEND: TDateField
      FieldName = 'CURRENTPLANEND'
      Origin = 'DEPARTMENTS.CURRENTPLANEND'
      Visible = False
    end
    object DepartmentsCOPIEDFROM: TIntegerField
      FieldName = 'COPIEDFROM'
      Origin = 'DEPARTMENTS.COPIEDFROM'
      Visible = False
    end
    object DepartmentsFIRSTPLANDATE: TDateField
      FieldName = 'FIRSTPLANDATE'
      Origin = 'DEPARTMENTS.FIRSTPLANDATE'
      Visible = False
    end
    object DepartmentsLATESTPLANDATE: TDateField
      FieldName = 'LATESTPLANDATE'
      Origin = 'DEPARTMENTS.LATESTPLANDATE'
      Visible = False
    end
    object DepartmentsLASTSUMMARYPERIOD: TIntegerField
      FieldName = 'LASTSUMMARYPERIOD'
      Origin = 'DEPARTMENTS.LASTSUMMARYPERIOD'
      Visible = False
    end
    object DepartmentsINVGROUPNAME: TStringField
      FieldName = 'INVGROUPNAME'
      Origin = 'DEPARTMENTS.INVGROUPNAME'
      Visible = False
      Size = 50
    end
    object DepartmentsINVOICEPASSWORD: TStringField
      FieldName = 'INVOICEPASSWORD'
      Origin = 'DEPARTMENTS.INVOICEPASSWORD'
    end
  end
  object MonitoringData: TIBOTable
    AutoFetchAll = True
    ColumnAttributes.Strings = (
      'DEPT_ID=REQUIRED'
      'ACCOUNT_NUMBER=REQUIRED'
      'D_YEAR=REQUIRED'
      'D_TYPE=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    Filtered = True
    Filter = 'D_TYPE=2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    IndexName = 'RDB$PRIMARY9'
    MasterFields = 'DETAILED_BALANCES.Dept_ID=DEPARTMENTS.Dept_ID'
    MasterSource = DSDepartments
    TableName = 'DETAILED_BALANCES'
    FieldOptions = []
    Left = 48
    Top = 144
    object MonitoringDataDEPT_ID: TIntegerField
      FieldName = 'DEPT_ID'
      Origin = 'DETAILED_BALANCES.DEPT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataACCOUNT_NUMBER: TIntegerField
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'DETAILED_BALANCES.ACCOUNT_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataD_YEAR: TIntegerField
      FieldName = 'D_YEAR'
      Origin = 'DETAILED_BALANCES.D_YEAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataD_TYPE: TSmallintField
      FieldName = 'D_TYPE'
      Origin = 'DETAILED_BALANCES.D_TYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataD_BALS: TBlobField
      FieldName = 'D_BALS'
      Origin = 'DETAILED_BALANCES.D_BALS'
      Size = 8
    end
  end
  object DSDepartments: TDataSource
    DataSet = Departments
    Left = 128
    Top = 72
  end
  object DSMonitoringData: TDataSource
    DataSet = MonitoringData
    Left = 200
    Top = 144
  end
  object Business_Details: TIBOTable
    DatabaseName = 'BusinessDB_2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    TableName = 'BUSINESS_DETAILS'
    FieldOptions = []
    Left = 128
    Top = 16
    object Business_DetailsBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Required = True
      Size = 100
    end
  end
  object MonitoringDataLU: TIBOTable
    AutoFetchAll = True
    ColumnAttributes.Strings = (
      'DEPT_ID=REQUIRED'
      'ACCOUNT_NUMBER=REQUIRED'
      'D_YEAR=REQUIRED'
      'D_TYPE=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    Filtered = True
    Filter = 'D_Type=2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    TableName = 'DETAILED_BALANCES'
    FieldOptions = []
    Left = 48
    Top = 200
    object MonitoringDataLUDEPT_ID: TIntegerField
      FieldName = 'DEPT_ID'
      Origin = 'DETAILED_BALANCES.DEPT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataLUACCOUNT_NUMBER: TIntegerField
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'DETAILED_BALANCES.ACCOUNT_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataLUD_YEAR: TIntegerField
      FieldName = 'D_YEAR'
      Origin = 'DETAILED_BALANCES.D_YEAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataLUD_TYPE: TSmallintField
      FieldName = 'D_TYPE'
      Origin = 'DETAILED_BALANCES.D_TYPE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object MonitoringDataLUD_BALS: TBlobField
      FieldName = 'D_BALS'
      Origin = 'DETAILED_BALANCES.D_BALS'
      Size = 8
    end
  end
  object DepartmentServiceNameListing: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'DeptID'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'DEPARTMENTS.DEPT_ID=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    SQL.Strings = (
      'Select Dept_id, Revenue_group_name from Departments '
      'where (dept_id <> :DeptID) and'
      '(hidden_dept = 0)order by Revenue_Group_Name')
    FieldOptions = []
    Left = 48
    Top = 256
    object DepartmentServiceNameListingDEPT_ID: TIntegerField
      FieldName = 'DEPT_ID'
      Origin = 'DEPARTMENTS.DEPT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DepartmentServiceNameListingREVENUE_GROUP_NAME: TStringField
      FieldName = 'REVENUE_GROUP_NAME'
      Origin = 'DEPARTMENTS.REVENUE_GROUP_NAME'
      Size = 60
    end
  end
  object DSDeptServiceNames: TDataSource
    DataSet = DepartmentServiceNameListing
    Left = 144
    Top = 256
  end
  object DepartmentRetailNameListing: TIBOQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'DeptID'
        ParamType = ptInput
      end>
    ColumnAttributes.Strings = (
      'DEPARTMENTS.DEPT_ID=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    SQL.Strings = (
      'Select Dept_id, Revenue_group_name from Departments '
      
        'where (dept_id <> :DeptID) and (hidden_dept = 0) order by Revenu' +
        'e_Group_Name')
    FieldOptions = []
    Left = 48
    Top = 304
    object IntegerField1: TIntegerField
      FieldName = 'DEPT_ID'
      Origin = 'DEPARTMENTS.DEPT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'REVENUE_GROUP_NAME'
      Origin = 'DEPARTMENTS.REVENUE_GROUP_NAME'
      Size = 60
    end
  end
  object DSDeptRetailNameS: TDataSource
    DataSet = DepartmentRetailNameListing
    Left = 144
    Top = 304
  end
  object Account_Mapping: TIBOTable
    AutoFetchAll = True
    ColumnAttributes.Strings = (
      'ACCOUNT_NUMBER=REQUIRED')
    DatabaseName = 'BusinessDB_2'
    Filtered = True
    Filter = '(220 <= ACCOUNT_NUMBER) AND (ACCOUNT_NUMBER < 990)'
    IB_Connection = ClientDatabase
    RecordCountAccurate = True
    IndexFieldNames = 'ACCOUNT_NUMBER'
    TableName = 'ACCOUNT_TITLES'
    FieldOptions = []
    Left = 216
    Top = 16
    object Account_MappingACCOUNT_NUMBER: TIntegerField
      FieldName = 'ACCOUNT_NUMBER'
      Origin = 'ACCOUNT_TITLES.ACCOUNT_NUMBER'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object Account_MappingACCOUNT_TITLE: TStringField
      FieldName = 'ACCOUNT_TITLE'
      Origin = 'ACCOUNT_TITLES.ACCOUNT_TITLE'
      Size = 70
    end
    object Account_MappingACCOUNT_GROUP: TIntegerField
      FieldName = 'ACCOUNT_GROUP'
      Origin = 'ACCOUNT_TITLES.ACCOUNT_GROUP'
    end
  end
  object DSAccountMapping: TDataSource
    DataSet = Account_Mapping
    Left = 320
    Top = 16
  end
  object QryFB_Expenses: TIB_Query
    DatabaseName = 'SC_FDB_1'
    FieldsDisplayWidth.Strings = (
      'ACCOUNT_NO=88')
    IB_Connection = DMInterface.SC2TARIDB
    SQL.Strings = (
      
        'SELECT DISTINCT TRANS_DATE, ACCOUNT_NO, SUM(AMOUNT_PAID) AS ACC_' +
        'AMT'
      'FROM ACCOUNT_TRANS'
      'GROUP BY TRANS_DATE, ACCOUNT_NO'
      'HAVING (TRANS_DATE >= :STARTDATE) AND (TRANS_DATE <= :ENDDATE)'
      'ORDER BY ACCOUNT_NO, TRANS_DATE')
    Left = 224
    Top = 72
    ParamValues = (
      'STARTDATE=2006/03/01 00:00:00.0000'
      'ENDDATE=2006/03/31 00:00:00.0000')
  end
end
