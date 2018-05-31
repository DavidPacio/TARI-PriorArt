object DMUserM: TDMUserM
  OldCreateOrder = False
  Height = 771
  Width = 1102
  object FBMADMINDB: TIBODatabase
    CacheStatementHandles = False
    SQLDialect = 3
    DatabaseName = 'FBMADMIN'
    Params.Strings = (
      'USER NAME=SYSDBA'
      
        'PATH=C:\Program Files (x86)\Focus Based Management\fbmproductadm' +
        'in.fdb'
      'SERVER=devwin7'
      'SQL DIALECT=3'
      'PROTOCOL=TCP/IP')
    BeforeConnect = FBMADMINDBBeforeConnect
    AfterConnect = FBMADMINDBAfterConnect
    Isolation = tiCommitted
    Left = 48
    Top = 8
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object DSUsers: TDataSource
    DataSet = Users
    Left = 152
    Top = 80
  end
  object DSTARIDatabases: TDataSource
    DataSet = TARIDatabases
    Left = 152
    Top = 144
  end
  object TARIDatabases: TIBOTable
    ColumnAttributes.Strings = (
      'LOK_ON_DATABASES.DATABASE_ALIAS=REQUIRED'
      'LOK_ON_DATABASES.LICENCED_TO_ACCESS=REQUIRED'
      'LOK_ON_DATABASES.IS_MASTER=REQUIRED')
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    TableName = 'LOK_ON_DATABASES'
    FieldOptions = []
    Left = 48
    Top = 144
    object TARIDatabasesDATABASE_ALIAS: TStringField
      FieldName = 'DATABASE_ALIAS'
      Origin = 'LOK_ON_DATABASES.DATABASE_ALIAS'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object TARIDatabasesBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Origin = 'LOK_ON_DATABASES.BUSINESS_NAME'
      Size = 100
    end
    object TARIDatabasesFILE_NAME: TStringField
      FieldName = 'FILE_NAME'
      Origin = 'LOK_ON_DATABASES.FILE_NAME'
      Size = 60
    end
    object TARIDatabasesLICENCED_TO_ACCESS: TSmallintField
      FieldName = 'LICENCED_TO_ACCESS'
      Origin = 'LOK_ON_DATABASES.LICENCED_TO_ACCESS'
      Required = True
    end
    object TARIDatabasesIS_MASTER: TSmallintField
      FieldName = 'IS_MASTER'
      Origin = 'LOK_ON_DATABASES.IS_MASTER'
      Required = True
    end
  end
  object UserRoles: TIBOTable
    ColumnAttributes.Strings = (
      'USERROLES.ROLE_NAME=REQUIRED')
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    TableName = 'USERROLES'
    FieldOptions = []
    Left = 48
    Top = 208
    object UserRolesROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Origin = 'USERROLES.ROLE_NAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object UserRolesROLE_DESCRIPTION: TStringField
      FieldName = 'ROLE_DESCRIPTION'
      Origin = 'USERROLES.ROLE_DESCRIPTION'
      Size = 50
    end
  end
  object DSUserRoles: TDataSource
    DataSet = UserRoles
    Left = 152
    Top = 208
  end
  object DBServers: TIBOTable
    ColumnAttributes.Strings = (
      'SERVERS.SERVERNAME=REQUIRED'
      'SERVERS.ADMINFOLDER=REQUIRED'
      'SERVERS.LOKONFOLDER=REQUIRED'
      'SERVERS.NETWORKPATH=REQUIRED')
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    TableName = 'SERVERS'
    FieldOptions = []
    Left = 48
    Top = 272
    object DBServersSERVERNAME: TStringField
      FieldName = 'SERVERNAME'
      Origin = 'SERVERS.SERVERNAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 30
    end
    object DBServersSERVERDESC: TStringField
      FieldName = 'SERVERDESC'
      Origin = 'SERVERS.SERVERDESC'
      Size = 60
    end
    object DBServersADMINFOLDER: TStringField
      FieldName = 'ADMINFOLDER'
      Origin = 'SERVERS.ADMINFOLDER'
      Required = True
      Size = 200
    end
    object DBServersLOKONFOLDER: TStringField
      FieldName = 'LOKONFOLDER'
      Origin = 'SERVERS.LOKONFOLDER'
      Required = True
      Size = 200
    end
    object DBServersNETWORKPATH: TStringField
      FieldName = 'NETWORKPATH'
      Origin = 'SERVERS.NETWORKPATH'
      Required = True
      Size = 200
    end
  end
  object DSDBServers: TDataSource
    DataSet = DBServers
    Left = 152
    Top = 272
  end
  object Rolesref: TIBOTable
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    IndexFieldNames = 'Role_description'
    TableName = 'USERROLES'
    FieldOptions = []
    Left = 264
    Top = 152
    object RolesrefROLE_DESCRIPTION: TStringField
      DisplayWidth = 30
      FieldName = 'ROLE_DESCRIPTION'
      Size = 50
    end
    object RolesrefROLE_NAME: TStringField
      FieldName = 'ROLE_NAME'
      Required = True
      Visible = False
      Size = 30
    end
  end
  object DSRolesref: TDataSource
    DataSet = Rolesref
    Left = 360
    Top = 152
  end
  object Users: TIBOTable
    ColumnAttributes.Strings = (
      'USERS.USER_NAME=REQUIRED')
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    AfterEdit = UsersAfterEdit
    AfterDelete = UsersAfterDelete
    AfterInsert = UsersAfterInsert
    AfterPost = UsersAfterPost
    TableName = 'USERS'
    FieldOptions = []
    Left = 48
    Top = 80
    object UsersUSER_NAME: TStringField
      DisplayLabel = 'User Name'
      DisplayWidth = 16
      FieldName = 'USER_NAME'
      Origin = 'USERS.USER_NAME'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 50
    end
    object UsersFIRST_NAME: TStringField
      DisplayLabel = 'First Name'
      DisplayWidth = 14
      FieldName = 'FIRST_NAME'
      Origin = 'USERS.FIRST_NAME'
      Size = 30
    end
    object UsersMIDDLE_NAME: TStringField
      DisplayLabel = 'Middle Name'
      DisplayWidth = 14
      FieldName = 'MIDDLE_NAME'
      Origin = 'USERS.MIDDLE_NAME'
      Size = 30
    end
    object UsersLAST_NAME: TStringField
      DisplayLabel = 'Last Name'
      DisplayWidth = 17
      FieldName = 'LAST_NAME'
      Origin = 'USERS.LAST_NAME'
      Size = 30
    end
    object usersROLE_DESCRIPTION: TStringField
      DisplayLabel = 'Role Rescription'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'ROLE_DESCRIPTION'
      LookupDataSet = UserRoles
      LookupKeyFields = 'ROLE_NAME'
      LookupResultField = 'ROLE_DESCRIPTION'
      KeyFields = 'LOK_ON_ROLE'
      Size = 30
      Lookup = True
    end
    object UsersLOK_ON_ROLE: TStringField
      DisplayWidth = 30
      FieldName = 'LOK_ON_ROLE'
      Origin = 'USERS.LOK_ON_ROLE'
      Visible = False
      Size = 30
    end
    object UsersDBPASSWORD: TVarBytesField
      FieldName = 'DBPASSWORD'
      Origin = 'USERS.DBPASSWORD'
      OnGetText = UsersPASSSTRINGGetText
      OnSetText = UsersPASSSTRINGSetText
      Size = 32
    end
  end
  object qryListofTables: TIB_Query
    DatabaseName = 'BusinessDB_1'
    IB_Connection = DataModuleClient.ClientDatabase
    SQL.Strings = (
      'SELECT RDB$RELATION_NAME FROM RDB$RELATIONS'
      'WHERE ( NOT (RDB$RELATION_NAME STARTING WITH '#39'RDB$'#39') )'
      'ORDER BY RDB$RELATION_NAME')
    Left = 48
    Top = 416
  end
  object CreateLicencingScript: TIB_Script
    SQL.Strings = (
      'SET SQL DIALECT 3;'
      ''
      '/*'
      'CONNECT '
      
        ' '#39'DEVWORK1:C:\Program Files\Focus Based Management\Tari for Busi' +
        'ness\Proto\MASTER.FDB'#39' '
      ' USER '#39'SYSDBA'#39' '
      ' PASSWORD '#39'masterkey'#39';'
      '*/'
      ''
      
        '/***************************************************************' +
        '***************/'
      
        '/****                                Tables                     ' +
        '           ****/'
      
        '/***************************************************************' +
        '***************/'
      ''
      'CREATE TABLE LICENCING ('
      '    LIC_ID            INTEGER NOT NULL,'
      '    BUSINESS_NAME     VARCHAR(100) CHARACTER SET NONE,'
      '    CONTACT_NAME      VARCHAR(100) CHARACTER SET NONE,'
      '    ADDRESS1          VARCHAR(50) CHARACTER SET NONE,'
      '    ADDRESS2          VARCHAR(50) CHARACTER SET NONE,'
      '    SUBURB            VARCHAR(50) CHARACTER SET NONE,'
      '    STATE_REGION      VARCHAR(30) CHARACTER SET NONE,'
      '    POST_CODE         VARCHAR(20) CHARACTER SET NONE,'
      '    COUNTRY           VARCHAR(40) CHARACTER SET NONE,'
      '    PHONE_NUMBER      VARCHAR(40) CHARACTER SET NONE,'
      '    FAX_NUMBER        VARCHAR(40) CHARACTER SET NONE,'
      '    EMAIL_ADDRESS     VARCHAR(60) CHARACTER SET NONE,'
      '    SERIALNUMBER      VARCHAR(20) CHARACTER SET NONE,'
      '    SUPPLIER_ID       INTEGER,'
      '    SITENUMBER        INTEGER,'
      '    LICENCEENAME      VARCHAR(100) CHARACTER SET NONE,'
      '    LICENCETYPE       VARCHAR(5) CHARACTER SET NONE,'
      '    BUSINESSFILENAME  VARCHAR(100) CHARACTER SET NONE,'
      '    EXPIRYDATE         DATE,'
      '    NUMBEROFUSERS     INTEGER,'
      '    LICENCENUMBER     VARCHAR(20) CHARACTER SET NONE'
      ');'
      ''
      ''
      ''
      ''
      ''
      
        '/***************************************************************' +
        '***************/'
      
        '/****                             Primary Keys                  ' +
        '           ****/'
      
        '/***************************************************************' +
        '***************/'
      ''
      
        'ALTER TABLE LICENCING ADD CONSTRAINT PK_LIC_ID PRIMARY KEY (LIC_' +
        'ID)'
      'USING INDEX PK_LICENCING;'
      ''
      ''
      
        '/***************************************************************' +
        '***************/'
      
        '/****                              Privileges                   ' +
        '           ****/'
      
        '/***************************************************************' +
        '***************/'
      ''
      ''
      '/* Privileges of users */'
      'GRANT ALL ON LICENCING TO "ADMIN" WITH GRANT OPTION;'
      'GRANT ALL ON LICENCING TO PUBLIC;')
    Left = 152
    Top = 416
  end
  object Licencing: TIBOTable
    DatabaseName = 'FBMADMIN'
    IB_Connection = FBMADMINDB
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    TableName = 'LICENCING'
    FieldOptions = []
    Left = 48
    Top = 344
    object LicencingLIC_ID: TIntegerField
      FieldName = 'LIC_ID'
      Required = True
    end
    object LicencingBUSINESS_NAME: TStringField
      FieldName = 'BUSINESS_NAME'
      Size = 100
    end
    object LicencingCONTACT_NAME: TStringField
      FieldName = 'CONTACT_NAME'
      Size = 100
    end
    object LicencingADDRESS1: TStringField
      FieldName = 'ADDRESS1'
      Size = 50
    end
    object LicencingADDRESS2: TStringField
      FieldName = 'ADDRESS2'
      Size = 50
    end
    object LicencingSUBURB: TStringField
      FieldName = 'SUBURB'
      Size = 50
    end
    object LicencingSTATE_REGION: TStringField
      FieldName = 'STATE_REGION'
      Size = 30
    end
    object LicencingPOST_CODE: TStringField
      FieldName = 'POST_CODE'
    end
    object LicencingCOUNTRY: TStringField
      FieldName = 'COUNTRY'
      Size = 40
    end
    object LicencingPHONE_NUMBER: TStringField
      FieldName = 'PHONE_NUMBER'
      Size = 40
    end
    object LicencingFAX_NUMBER: TStringField
      FieldName = 'FAX_NUMBER'
      Size = 40
    end
    object LicencingEMAIL_ADDRESS: TStringField
      FieldName = 'EMAIL_ADDRESS'
      Size = 60
    end
    object LicencingSERIALNUMBER: TStringField
      FieldName = 'SERIALNUMBER'
    end
    object LicencingSUPPLIER_ID: TIntegerField
      FieldName = 'SUPPLIER_ID'
    end
    object LicencingSITENUMBER: TIntegerField
      FieldName = 'SITENUMBER'
    end
    object LicencingLICENCEENAME: TStringField
      FieldName = 'LICENCEENAME'
      Size = 100
    end
    object LicencingLICENCETYPE: TStringField
      FieldName = 'LICENCETYPE'
      Size = 5
    end
    object LicencingBUSINESSFILENAME: TStringField
      FieldName = 'BUSINESSFILENAME'
      Size = 100
    end
    object LicencingEXPIRYDATE: TDateField
      FieldName = 'EXPIRYDATE'
    end
    object LicencingNUMBEROFUSERS: TIntegerField
      FieldName = 'NUMBEROFUSERS'
    end
    object LicencingLICENCENUMBER: TStringField
      FieldName = 'LICENCENUMBER'
    end
  end
  object clInternetConnection1: TclInternetConnection
    Left = 624
    Top = 40
  end
  object clUploader1: TclUploader
    InternetAgent = 'Mozilla/4.0 (compatible; Clever Internet Suite)'
    Connection = clInternetConnection1
    KeepConnection = True
    UserName = 'FBM'
    Password = 'fbmmaster'
    UseHttpRequest = True
    HttpRequest = clHttpRequest1
    UseSimpleRequest = True
    RequestMethod = 'POST'
    Left = 824
    Top = 48
  end
  object clHttpRequest1: TclHttpRequest
    Header.ContentType = 'application/x-www-form-urlencoded'
    Header.Accept = 'text/html */*'
    Header.AcceptLanguage = 'en-us'
    Left = 624
    Top = 120
  end
  object clHtmlParser1: TclHtmlParser
    ParseMethod = pmAll
    Left = 808
    Top = 120
  end
  object dbCheckConnect: TIBODatabase
    CacheStatementHandles = True
    SQLDialect = 3
    DatabaseName = 'TARIDBCHECK'
    Params.Strings = (
      'PROTOCOL=TCP/IP'
      'SERVER=DEVWIN7'
      
        'PATH=C:\Program Files (x86)\Focus Based Management\Tari for Busi' +
        'ness\Data\new2ABCDruck.fdb'
      'USER NAME=SYSDBA')
    AfterConnect = dbCheckConnectAfterConnect
    BeforeDisconnect = dbCheckConnectBeforeDisconnect
    Isolation = tiCommitted
    Left = 48
    Top = 576
    SavedPassword = '.JuMbLe.01.432B0639073E0E4B49'
  end
  object checkDBCursor: TIBOQuery
    DatabaseName = 'TARIDBCHECK'
    IB_Connection = dbCheckConnect
    PreparedEdits = True
    PreparedInserts = False
    RecordCountAccurate = True
    SQL.Strings = (
      'GRANT FBMADMIN to admins')
    FieldOptions = []
    Left = 144
    Top = 640
  end
  object GrantScript: TIB_Script
    IB_Connection = dbCheckConnect
    Left = 48
    Top = 640
  end
  object TblLOSystem: TIBOTable
    ColumnAttributes.Strings = (
      'LOSYSTEM.DBVERSION=REQUIRED'
      'LOSYSTEM.GRANT_SET=REQUIRED')
    DatabaseName = 'TARIDBCHECK'
    IB_Connection = dbCheckConnect
    PreparedEdits = True
    PreparedInserts = True
    RecordCountAccurate = True
    TableName = 'LOSYSTEM'
    FieldOptions = []
    Left = 144
    Top = 568
    object TblLOSystemDBVERSION: TStringField
      FieldName = 'DBVERSION'
      Origin = 'LOSYSTEM.DBVERSION'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object TblLOSystemDBPASSWORD: TVarBytesField
      FieldName = 'DBPASSWORD'
      Origin = 'LOSYSTEM.DBPASSWORD'
      Size = 32
    end
    object TblLOSystemGRANT_SET: TSmallintField
      FieldName = 'GRANT_SET'
      Origin = 'LOSYSTEM.GRANT_SET'
      Required = True
    end
  end
end
