unit MYOBDM;

interface

uses
  SysUtils, Classes, DB, DBTables, Messages, IB_Components, IBODataset,
  MYOBInterGlobals, Variants, cxStyles, cxClasses, cxGridTableView, dialogs;

const
  // these definition are for the System Data Table
  MYOBDBPATH = 1;
  MYOBDBTYPE = 2;
  LASTSUPPORTDATE = 3;
  LASTTRANSDATE = 4;
  TARISERVICEDEPT = 5;
  TARISALESDEPT = 6;

type
  TDMMYOBInterface = class(TDataModule)
    MYOBDatabase: TDatabase;
    IB_Query1: TIB_Query;
    IB_Query2: TIB_Query;
    IB_Query3: TIB_Query;
    StyleRepository: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    TARI_DEV_ExpressStyle: TcxGridTableViewStyleSheet;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    GridTableViewStyleSheetUserFormat1: TcxGridTableViewStyleSheet;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    GridTableViewStyleSheetUserFormat2: TcxGridTableViewStyleSheet;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    GridTableViewStyleSheetUserFormat4: TcxGridTableViewStyleSheet;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    GridTableViewStyleSheetBrick: TcxGridTableViewStyleSheet;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    GridTableViewStyleSheetDesert: TcxGridTableViewStyleSheet;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    GridTableViewStyleSheetEggplant: TcxGridTableViewStyleSheet;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    GridTableViewStyleSheetLilac: TcxGridTableViewStyleSheet;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    GridTableViewStyleSheetMaple: TcxGridTableViewStyleSheet;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    GridTableViewStyleSheetRainyDay: TcxGridTableViewStyleSheet;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    GridTableViewStyleSheetRose: TcxGridTableViewStyleSheet;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    GridTableViewStyleSheetSlate: TcxGridTableViewStyleSheet;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    GridTableViewStyleSheetSpruce: TcxGridTableViewStyleSheet;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    GridTableViewStyleSheetWheat: TcxGridTableViewStyleSheet;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    FBStaffReport: TIBOQuery;
    FBStaffReportFIRSTNAME: TStringField;
    FBStaffReportLASTNAME: TStringField;
    FBStaffReportSALES: TBCDField;
    FBStaffReportCOGS: TBCDField;
    FBStaffReportTOTAL_MINS: TBCDField;
    FBStaffReportFULLNAME: TStringField;
    FBStaffReportTARI_RATE: TCurrencyField;
    FBStaffReportTARI_HOURS: TCurrencyField;
    DSStaffReport: TDataSource;
    FBStaffReportGROSS_PROFIT: TCurrencyField;
    FBStaffReportPRODUCTIVITY: TCurrencyField;
    FBStaffPaidHours: TIBOQuery;
    FBStaffPaidHoursSTAFF_ID: TIntegerField;
    FBStaffPaidHoursPAID_MINUTES: TLargeintField;
    DSStaffPaidHours: TDataSource;
    FBStaffReportSTAFF_ID: TIntegerField;
    FBStaffReportPAID_MINUTES: TIntegerField;
    FBStaffReportPAID_HOURS: TCurrencyField;
    FBClientReport: TIBOQuery;
    FBTransactionsReport: TIBOQuery;
    FBClientReportFIRSTNAME: TStringField;
    FBClientReportLASTNAME: TStringField;
    FBClientReportSALES: TBCDField;
    FBClientReportCOGS: TBCDField;
    FBClientReportTOTAL_MINS: TBCDField;
    FBTransactionsReportTRANS_ID: TIntegerField;
    FBTransactionsReportTRANS_DATE: TDateField;
    FBTransactionsReportFIRSTNAME: TStringField;
    FBTransactionsReportLASTNAME: TStringField;
    FBTransactionsReportSALES: TBCDField;
    FBTransactionsReportCOGS: TBCDField;
    FBTransactionsReportTOTAL_MINS: TBCDField;
    FBClientReportLAST_DATE: TDateField;
    SPUpdateComponents: TIBOStoredProc;
    MYOB_Acc_Activities: TTable;
    MYOB_Acc_ActivitiesAccountActivityID: TIntegerField;
    MYOB_Acc_ActivitiesAccountID: TIntegerField;
    MYOB_Acc_ActivitiesFinancialYear: TSmallintField;
    MYOB_Acc_ActivitiesPeriod: TSmallintField;
    MYOB_Acc_ActivitiesAmount: TFloatField;
    MYOB_AccSubClass: TTable;
    MYOB_AccSubClassSubAccountTypeID: TStringField;
    MYOB_AccSubClassDescription: TStringField;
    MYOB_AccClass: TTable;
    MYOB_AccClassAccountClassificationID: TStringField;
    MYOB_AccClassDescription: TStringField;
    QryMyobAccounts: TQuery;
    QryMyobAccountsAccountID: TIntegerField;
    QryMyobAccountsParentAccountID: TIntegerField;
    QryMyobAccountsIsInactive: TStringField;
    QryMyobAccountsAccountName: TStringField;
    QryMyobAccountsAccountNumber: TStringField;
    QryMyobAccountsAccountTypeID: TStringField;
    QryMyobAccountsAccountClassificationID: TStringField;
    QryMyobAccountsThisYearOpeningBalance: TFloatField;
    QryMyobAccountsIsCreditBalance: TStringField;
    QryMyobAccountsAccountLevel: TSmallintField;
    QryMyobAccountsSubAccountClassificationID: TStringField;
    QryExtract_TB: TQuery;
    QryExtract_TBAccountID: TIntegerField;
    QryExtract_TBParentAccountID: TIntegerField;
    QryExtract_TBIsInactive: TStringField;
    QryExtract_TBAccountName: TStringField;
    QryExtract_TBAccountNumber: TStringField;
    QryExtract_TBAccountTypeID: TStringField;
    QryExtract_TBAccountClassificationID: TStringField;
    QryExtract_TBThisYearOpeningBalance: TFloatField;
    QryExtract_TBChangeAmount: TFloatField;
    QryExtract_TBIsCreditBalance: TStringField;
    QryExtract_TBAccountLevel: TSmallintField;
    QryExtract_TBAccountID_1: TIntegerField;
    TblMYOB_Data: TTable;
    TblMYOB_DataCompanyName: TStringField;
    TblMYOB_DataAddress: TStringField;
    TblMYOB_DataPhone: TStringField;
    TblMYOB_DataFaxNumber: TStringField;
    TblMYOB_DataEmail: TStringField;
    TblMYOB_DataABN: TStringField;
    TblMYOB_DataABNBranch: TStringField;
    TblMYOB_DataACN: TStringField;
    TblMYOB_DataGSTRegistrationNumber: TStringField;
    TblMYOB_DataSalesTaxNumber: TStringField;
    TblMYOB_DataCompanyRegistrationNumber: TStringField;
    TblMYOB_DataCurrentFinancialYear: TSmallintField;
    TblMYOB_DataLastMonthInFinancialYear: TSmallintField;
    TblMYOB_DataConversionDate: TDateField;
    TblMYOB_DataPeriodsPerYear: TSmallintField;
    TblMYOB_DataPayeeNumber: TStringField;
    TblMYOB_DataBankCode: TStringField;
    TblMYOB_DataBankID: TStringField;
    TblMYOB_DataBSBCode: TStringField;
    TblMYOB_DataBankAccountNumber: TStringField;
    TblMYOB_DataBankAccountName: TStringField;
    TblMYOB_DataIsSelfBalancing: TStringField;
    TblMYOB_DataStatementParticulars: TStringField;
    TblMYOB_DataStatementCode: TStringField;
    TblMYOB_DataStatementReference: TStringField;
    TblMYOB_DataLastPurgeDate: TDateField;
    TblMYOB_DataLastBackupDate: TDateField;
    TblMYOB_DataDatabaseVersion: TStringField;
    TblMYOB_DataDataFileCountry: TStringField;
    TblMYOB_DataDriverBuildNumber: TIntegerField;
    TblMYOB_DataUseRetailManagerLink: TStringField;
    TblMYOB_DataUseMultipleCurrencies: TStringField;
    TblMYOB_DataUseCostCentres: TStringField;
    TblMYOB_DataCostCentresRequired: TStringField;
    TblMYOB_DataUseSimplifiedTaxSystem: TStringField;
    TblMYOB_DataSimplifiedTaxSystemDate: TDateField;
    TblMYOB_DataUseDailyAgeing: TStringField;
    TblMYOB_DataFirstAgeingPeriod: TSmallintField;
    TblMYOB_DataSecondAgeingPeriod: TSmallintField;
    TblMYOB_DataThirdAgeingPeriod: TSmallintField;
    TblMYOB_DataIdentifyAgeByName: TStringField;
    TblMYOB_DataLockPeriodIsActive: TStringField;
    TblMYOB_DataLockPeriodDate: TDateField;
    TblMYOB_DataLockThirteenthPeriod: TStringField;
    TblMYOB_DataDefaultCustomerTermsID: TIntegerField;
    TblMYOB_DataDefaultCustomerPriceLevelID: TStringField;
    TblMYOB_DataDefaultCustomerTaxCodeID: TIntegerField;
    TblMYOB_DataDefaultUseCustomerTaxCode: TStringField;
    TblMYOB_DataDefaultCustomerFreightTaxCodeID: TIntegerField;
    TblMYOB_DataDefaultSupplierTaxCodeID: TIntegerField;
    TblMYOB_DataDefaultUseSupplierTaxCode: TStringField;
    TblMYOB_DataDefaultSupplierFreightTaxCodeID: TIntegerField;
    TblMYOB_DataDefaultCustomerCreditLimit: TFloatField;
    TblMYOB_DataDefaultSupplierTermsID: TIntegerField;
    TblMYOB_DataDefaultSupplierCreditLimit: TFloatField;
    TblMYOB_DataInvoiceSubject: TStringField;
    TblMYOB_DataInvoiceMessage: TStringField;
    TblMYOB_DataIncludeInvoiceNumber: TStringField;
    TblMYOB_DataInvoiceQuoteSubject: TStringField;
    TblMYOB_DataInvoiceQuoteMessage: TStringField;
    TblMYOB_DataIncludeInvoiceQuoteNumber: TStringField;
    TblMYOB_DataInvoiceOrderSubject: TStringField;
    TblMYOB_DataInvoiceOrderMessage: TStringField;
    TblMYOB_DataIncludeInvoiceOrderNumber: TStringField;
    TblMYOB_DataPurchaseSubject: TStringField;
    TblMYOB_DataPurchaseMessage: TStringField;
    TblMYOB_DataIncludePurchaseNumber: TStringField;
    TblMYOB_DataPurchaseQuoteSubject: TStringField;
    TblMYOB_DataPurchaseQuoteMessage: TStringField;
    TblMYOB_DataIncludePurchaseQuoteNumber: TStringField;
    TblMYOB_DataPurchaseOrderSubject: TStringField;
    TblMYOB_DataPurchaseOrderMessage: TStringField;
    TblMYOB_DataIncludePurchaseOrderNumber: TStringField;
    TblMYOB_DataStatementSubject: TStringField;
    TblMYOB_DataStatementMessage: TStringField;
    TblMYOB_DataUseAuditTracking: TStringField;
    TblMYOB_DataUseCreditLimitWarning: TStringField;
    TblMYOB_DataLimitTypeID: TStringField;
    TblMYOB_DataChangeControl: TStringField;
    DSMYOBInfo: TDataSource;
    DSExtractTB: TDataSource;
    DSMyob_Accounts: TDataSource;
    FB_MYOBTARIDB: TIBODatabase;
    FB_Myob_Accounts: TIBOTable;
    FB_Myob_AccountsACCOUNT_ID: TIntegerField;
    FB_Myob_AccountsACCOUNT_NUMBER: TStringField;
    FB_Myob_AccountsACCOUNT_TITLE: TStringField;
    FB_Myob_AccountsACCOUNT_CLASS: TIntegerField;
    FB_Myob_AccountsACCOUNT_SUBCLASS: TIntegerField;
    FB_MYOB_TB: TIBOTable;
    FB_MYOB_TBPERIOD_END: TDateField;
    FB_MYOB_TBMYOB_ACCOUNT: TIntegerField;
    FB_MYOB_TBAMOUNT: TBCDField;
    FB_AccountMapping: TIBOTable;
    FB_AccountMappingMYOB_ACCOUNT: TIntegerField;
    FB_AccountMappingTARI_ACCOUNT: TIntegerField;
    FB_AccountClass: TIBOTable;
    FB_AccountClassCLASS_ID: TIntegerField;
    FB_AccountClassCLASS_NAME: TStringField;
    FB_AccountClassMYOB_CLASS: TStringField;
    FB_AccSubClass: TIBOTable;
    FB_AccSubClassSUBCLASS_ID: TIntegerField;
    FB_AccSubClassSUBCLASS_NAME: TStringField;
    FB_AccSubClassMYOB_SUBCLASS: TStringField;
    FB_Account_Bals: TIBOTable;
    FB_Account_BalsACCOUNT_ID: TIntegerField;
    FB_Account_BalsDETAILED_BALANCES: TBlobField;
    FB_Account_BalsBASE_BALANCE: TBCDField;
    FB_MYOB_Info: TIBOTable;
    FB_MYOB_InfoBUSINESS_ID: TIntegerField;
    FB_MYOB_InfoBUSINESS_NAME: TStringField;
    FB_MYOB_InfoTB_DATE: TDateField;
    FB_MYOB_InfoYEAR_PERIODS: TIntegerField;
    FB_MYOB_InfoFIRST_PERIOD: TDateField;
    FB_MYOB_InfoLAST_PERIOD: TDateField;
    FB_MYOB_InfoRE_ACCOUNT: TIntegerField;
    DSFB_MYOBInfo: TDataSource;
    DSAccountMapping: TDataSource;
    DSFB_MYOB_TB: TDataSource;
    DSFB_MYOB_Accounts: TDataSource;
    SP_Delete_TB: TIBOStoredProc;
    IB_Query4: TIB_Query;
    FB_MyobAccountListing: TIBOQuery;
    FBSystem_Data: TIBOTable;
    FBSystem_DataSYSTEM_ID: TIntegerField;
    FBSystem_DataSTR_FIELD: TStringField;
    FBSystem_DataINT_FIELD: TIntegerField;
    FBSystem_DataNUM_FIELD: TBCDField;
    FBSystem_DataDATE_FIELD: TDateTimeField;
    procedure MYOBDatabaseAfterConnect(Sender: TObject);
    procedure MYOBDatabaseBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure FB_AccountClassAfterInsert(DataSet: TDataSet);
    procedure FB_AccSubClassAfterInsert(DataSet: TDataSet);
    procedure FB_MYOBTARIDBBeforeConnect(Sender: TIB_Connection);
    procedure FB_MYOBTARIDBAfterConnect(Sender: TIB_Connection);
  private
    { Private declarations }
  public
    { Public declarations }
    MYOBPath : String;
    BusinessEndofWeekDay : Integer;
    function GetMYOBPath: String;
    Procedure SetMYOBPath(Path: String);
    function GetMYOBDBType: TDatabaseType;
    Procedure SetMYOBDBType(dbType: TDatabaseType);
    function GetTARIServiceDept: Integer;
    Procedure SetTARIServiceDept(DeptID: Integer; DeptName: String);
    function GetTARISalesDept: Integer;
    Procedure SetTARISalesDept(DeptID: Integer; DeptName: String);
    function GetLastSupportDate: TDateTime;
    Procedure SetLastSupportDate(NewDate: TDateTime);
    function GetLastTransDate: TDateTime;
    Procedure SetLastTransDate(NewDate: TDateTime);
    function getBalances(var Balances : array of currency; Accountno : integer): Boolean;
    function setBalances(var Balances : array of currency; Accountno : integer): Boolean;
  end;

var
  DMMYOBInterface: TDMMYOBInterface;

implementation

{$R *.dfm}

procedure TDMMYOBInterface.MYOBDatabaseAfterConnect(Sender: TObject);
var
  I: Integer;
  Indicies : Tstringlist;
  IdxFound : Boolean;
begin
  TblMYOB_Data.Active := True;
  MYOB_AccClass.Active := True;
  MYOB_AccSubClass.Active := True;
end;

procedure TDMMYOBInterface.MYOBDatabaseBeforeConnect(Sender: TObject);
var
  DBAliases : TstringList;
  I : Integer;
  AliasFound : Boolean;
  AParams: TStringList;
  UserSelected, KeyLocation, HostPath: string;
begin
  AParams := TStringList.Create;
  DBAliases := TStringList.Create;
  AliasFound := False;
//  session.NetFileDir := ExtractFileDrive(SCPath) + '\';
  try
    Session.GetAliasNames(DBAliases);
    { fill a list box with alias names for the user to select from }
    for I := 0 to DBAliases.Count - 1 do
      if DBAliases[i] = 'MYOBTARI' then
        AliasFound := True;
  finally
    DBAliases.Free;
  end;
  AParams := TStringList.Create;

  if not AliasFound then
    begin
    UserSelected := 'C:\Premier10\bigClearwtr10.MYO';
    KeyLocation := 'C:\Premier10\614018258003.key';
    HostPath := 'C:\Premier10\MYOBP.exe';
      try
        with AParams do
        begin
        Add('DRIVER=MYOB_ODBC');
        Add('TYPE=SERVER');
        Add('DATABASE=' + UserSelected);
        Add('KEY=' + KeyLocation);
        Add('HOST_EXE_PATH='+ HostPath);
        Add('NETWORK_PROTOCOL=NETBIOS');
        Add('DRIVER_COMPLETION=DRIVER_NOPROMPT');
        end;
        Session.AddAlias('MYOBTARI', 'MYOB_ODBC', AParams);
      finally
        AParams.Free;
      end;
    end;
//  Scdatabase.AliasName := 'SC2TARI';
end;

function TDMMYOBInterface.GetMYOBPath: String;
var
  varg : Variant;
begin
  Result := '';
  if not FBSystem_Data.Active then exit;
  Varg := MYOBDBPATH;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataSTR_FIELD.Value;
end;

Procedure TDMMYOBInterface.SetMYOBPath(Path: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := MYOBDBPATH;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := MYOBDBPATH;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataSTR_FIELD.Value := Path;
  FBSystem_Data.post;
end;

function TDMMYOBInterface.GetMYOBDBType: TDatabaseType;
var
  varg : Variant;
begin
  Result := dtParadox;
  if not FBSystem_Data.Active then exit;
  Varg := MYOBDBTYPE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := TDatabaseType(FBSystem_DataINT_FIELD.Value);
end;

Procedure TDMMYOBInterface.SetMYOBDBType(dbType: TDatabaseType);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := MYOBDBTYPE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := MYOBDBTYPE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := Integer(dbType);
  FBSystem_Data.post;
end;

function TDMMYOBInterface.GetTARIServiceDept: Integer;
var
  varg : Variant;
begin
  Result := -1;
  if not FBSystem_Data.Active then exit;
  Varg := TARISERVICEDEPT;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMMYOBInterface.SetTARIServiceDept(DeptID: Integer; DeptName: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISERVICEDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARISERVICEDEPT;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := DeptID;
  FBSystem_DataSTR_FIELD.Value := DeptName;
  FBSystem_Data.post;
end;

function TDMMYOBInterface.GetTARISalesDept: Integer;
var
  varg : Variant;
begin
  Result := -1;
  if not FBSystem_Data.Active then exit;
  Varg := TARISALESDEPT;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataINT_FIELD.Value;
end;

Procedure TDMMYOBInterface.SetTARISalesDept(DeptID: Integer; DeptName: String);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := TARISALESDEPT;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := TARISALESDEPT;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataINT_FIELD.Value := DeptID;
  FBSystem_DataSTR_FIELD.Value := DeptName;
  FBSystem_Data.post;
end;

function TDMMYOBInterface.GetLastSupportDate: TDateTime;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := LASTSUPPORTDATE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataDATE_FIELD.Value;
end;

Procedure TDMMYOBInterface.SetLastSupportDate(NewDate: TDateTime);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := LASTSUPPORTDATE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := LASTSUPPORTDATE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataDATE_FIELD.Value := NewDate;
  FBSystem_Data.post;
end;

function TDMMYOBInterface.GetLastTransDate: TDateTime;
var
  varg : Variant;
begin
  Result := 0;
  if not FBSystem_Data.Active then exit;
  Varg := LASTTRANSDATE;
  if FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    Result := FBSystem_DataDATE_FIELD.Value;
end;

Procedure TDMMYOBInterface.SetLastTransDate(NewDate: TDateTime);
var
  varg : Variant;
begin
  if not FBSystem_Data.Active then exit;
  Varg := LASTTRANSDATE;
  if not FBSystem_Data.locate('SYSTEM_ID', varg, []) then
    begin
    FBSystem_Data.Insert;
    FBSystem_DataSYSTEM_ID.value := LASTTRANSDATE;
    end
  else
    FBSystem_Data.edit;
  FBSystem_DataDATE_FIELD.Value := NewDate;
  FBSystem_Data.post;
end;

procedure TDMMYOBInterface.DataModuleCreate(Sender: TObject);
begin
  MYOBDatabase.Connected := False;
  FB_MYOBTARIDB.Connected := False;
end;

procedure TDMMYOBInterface.FB_AccountClassAfterInsert(DataSet: TDataSet);
begin
  FB_AccountClassClass_ID.Value := FB_AccountClass.GeneratorValue('GEN_ACCOUNT_CLASS_ID', 1);
end;

procedure TDMMYOBInterface.FB_AccSubClassAfterInsert(DataSet: TDataSet);
begin
  FB_AccSubClassSubClass_ID.Value := FB_AccSubClass.GeneratorValue('GEN_ACCOUNT_SUBCLASS_ID', 1);
end;

function TDMMYOBInterface.getBalances(var Balances : array of currency; Accountno : integer): Boolean;
Var
  tempstream : TmemoryStream;
  varg : Variant;
  found, found1 : Boolean;
  daystostart, daystoend, offset : integer;
begin
  Found := False;
  Result := False;
  tempstream := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * 325);
  varg := AccountNo;
  FillChar(Balances, sizeof(TDetailedBalArray), #0);
  found := FB_Account_Bals.Locate('Account_ID',varg,[]);
  FillChar(tempstream.memory^, tempstream.size, #0);
  tempstream.Seek(0, soFromBeginning);
  if found then
    begin
    FB_Account_BalsDETAILED_BALANCES.SavetoStream(tempstream);
    tempstream.Seek(0, soFromBeginning);
    if (tempstream.read(Balances, Sizeof(currency) * 325) > 0) then
      Result := True;
    end
  else
    Result := True;
  tempstream.Free;
end;

function TDMMYOBInterface.setBalances(var Balances : array of currency; Accountno : integer): Boolean;
Var
  tempstream : TmemoryStream;
  Found : boolean;
  varg : variant;
begin
  Result := False;
  tempstream := TmemoryStream.create;
  tempstream.setsize(sizeof(Currency) * 325);
  FillChar(tempstream.memory^, tempstream.size, #0);
  // we dump balances into tempstream but save to DB from tempstream1
  tempstream.Write(Balances, Sizeof(currency) * 325);

  varg := AccountNo;
  found := FB_Account_Bals.Locate('Account_ID',varg,[]);
  if not found then
    begin
    FB_Account_Bals.Insert;
    FB_Account_BalsAccount_ID.value := AccountNo;
    end
  else
    FB_Account_Bals.Edit;
  tempstream.Seek(0,  soFromBeginning);
  FB_Account_BalsDETAILED_BALANCES.LoadFromStream(tempstream);
  FB_Account_Bals.Post;
  tempstream.Free;
end;

procedure TDMMYOBInterface.FB_MYOBTARIDBBeforeConnect(Sender: TIB_Connection);
begin
{
  SC2TARIDB.Server := GGLobals.Servers.CurrentServer.ServerName;
  SC2TARIDB.Username := 'SYSDBA';
  SC2TARIDB.Password := 'masterkey';
  SC2TARIDB.Protocol := GGlobals.Servers.CurrentServer.realprotocol;
}

  FB_MYOBTARIDB.Path := 'C:\Program Files\Focus Based Management\TARI For Business\Data\MYOBTari.Fdb';
  FB_MYOBTARIDB.Server := 'Devwork1';
  FB_MYOBTARIDB.Username := 'SYSDBA';
  FB_MYOBTARIDB.Password := 'masterkey';
end;

procedure TDMMYOBInterface.FB_MYOBTARIDBAfterConnect(Sender: TIB_Connection);
begin
  FB_Myob_Accounts.active := True;
  FB_MYOB_TB.Active := True;
  FB_AccountMapping.Active := True;
  FB_AccountClass.Active := True;
  FB_AccSubClass.Active := True;
  FB_Account_Bals.Active := True;
  FB_MYOB_Info.Active := True;
end;

end.
