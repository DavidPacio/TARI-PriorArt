unit DMMYOB;

interface

uses
  SysUtils, Classes, DB, DBTables, IB_Components, IBODataset, ADODB,
  IB_Access;

type

  TDetailedBalArray = array[0 .. 324] of currency;
  TDetailedBalArrayPtr = ^TDetailedBalArray;


  TDMMYOBData = class(TDataModule)
    MYOB_ODCB_DB: TDatabase;
    QryMyobAccounts: TQuery;
    DSExtractTB: TDataSource;
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
    FB_Myob_Accounts: TIBOTable;
    FB_MYOBTARIDB: TIBODatabase;
    FB_MYOB_TB: TIBOTable;
    FB_AccountMapping: TIBOTable;
    FB_Myob_AccountsACCOUNT_ID: TIntegerField;
    FB_Myob_AccountsACCOUNT_NUMBER: TStringField;
    FB_Myob_AccountsACCOUNT_TITLE: TStringField;
    FB_MYOB_TBPERIOD_END: TDateField;
    FB_MYOB_TBMYOB_ACCOUNT: TIntegerField;
    FB_MYOB_TBAMOUNT: TBCDField;
    FB_AccountMappingMYOB_ACCOUNT: TIntegerField;
    FB_AccountMappingTARI_ACCOUNT: TIntegerField;
    DSFB_MYOB_Accounts: TDataSource;
    DSFB_MYOB_TB: TDataSource;
    DSAccountMapping: TDataSource;
    DSMyob_Accounts: TDataSource;
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
    MYOB_AccClass: TTable;
    MYOB_AccClassAccountClassificationID: TStringField;
    MYOB_AccClassDescription: TStringField;
    MYOB_AccSubClass: TTable;
    MYOB_AccSubClassSubAccountTypeID: TStringField;
    MYOB_AccSubClassDescription: TStringField;
    FB_AccountClass: TIBOTable;
    FB_AccountClassCLASS_ID: TIntegerField;
    FB_AccountClassCLASS_NAME: TStringField;
    FB_AccountClassMYOB_CLASS: TStringField;
    FB_AccSubClass: TIBOTable;
    FB_AccSubClassSUBCLASS_ID: TIntegerField;
    FB_AccSubClassSUBCLASS_NAME: TStringField;
    FB_AccSubClassMYOB_SUBCLASS: TStringField;
    FB_Myob_AccountsACCOUNT_CLASS: TIntegerField;
    FB_Myob_AccountsACCOUNT_SUBCLASS: TIntegerField;
    QryMyobAccountsSubAccountClassificationID: TStringField;
    IB_Query1: TIB_Query;
    FB_MyobAccountListing: TIBOQuery;
    FB_Account_Bals: TIBOTable;
    FB_Account_BalsACCOUNT_ID: TIntegerField;
    FB_Account_BalsDETAILED_BALANCES: TBlobField;
    FB_MYOB_Info: TIBOTable;
    FB_MYOB_InfoBUSINESS_ID: TIntegerField;
    FB_MYOB_InfoBUSINESS_NAME: TStringField;
    FB_MYOB_InfoTB_DATE: TDateField;
    FB_MYOB_InfoYEAR_PERIODS: TIntegerField;
    MYOB_Acc_Activities: TTable;
    MYOB_Acc_ActivitiesAccountActivityID: TIntegerField;
    MYOB_Acc_ActivitiesAccountID: TIntegerField;
    MYOB_Acc_ActivitiesFinancialYear: TSmallintField;
    MYOB_Acc_ActivitiesPeriod: TSmallintField;
    MYOB_Acc_ActivitiesAmount: TFloatField;
    FB_Account_BalsBASE_BALANCE: TBCDField;
    SP_Delete_TB: TIBOStoredProc;
    FB_MYOB_InfoFIRST_PERIOD: TDateField;
    FB_MYOB_InfoLAST_PERIOD: TDateField;
    DSFB_MYOBInfo: TDataSource;
    FB_MYOB_InfoRE_ACCOUNT: TIntegerField;
    qrymyobSaleslines: TQuery;
    DSSalesLines: TDataSource;
    qrymyobSaleslinesSaleID: TIntegerField;
    qrymyobSaleslinesCardRecordID: TIntegerField;
    qrymyobSaleslinesInvoiceNumber: TStringField;
    qrymyobSaleslinesInvoiceDate: TDateField;
    qrymyobSaleslinesInvoiceStatusID: TStringField;
    qrymyobSaleslinesTotalLines: TFloatField;
    qrymyobSaleslinesTaxExclusiveFreight: TFloatField;
    qrymyobSaleslinesTotalTax: TFloatField;
    qrymyobSaleslinesSalesPersonID: TIntegerField;
    qrymyobSaleslinesItemSaleAmount: TFloatField;
    qrymyobSaleslinesItemQuantity: TFloatField;
    qrymyobSaleslinesCogs: TFloatField;
    qrymyobSaleslinesTimeSaleAmount: TFloatField;
    qrymyobSaleslinesHours: TFloatField;
    qrymyobSaleslinesItemCount: TIntegerField;
    qrymyobSaleslinesCustomerLastName: TStringField;
    qrymyobSaleslinesCustomerFirstName: TStringField;
    qrymyobSaleslinesCustomerIsIndividual: TStringField;
    qrymyobSaleslinesEmployeeLastName: TStringField;
    qrymyobSaleslinesEmployeeFirstName: TStringField;
    procedure FB_MYOBTARIDBBeforeConnect(Sender: TIB_Connection);
    procedure FB_MYOBTARIDBAfterConnect(Sender: TIB_Connection);
    procedure MYOB_ODCB_DBAfterConnect(Sender: TObject);
    procedure FB_AccountClassAfterInsert(DataSet: TDataSet);
    procedure FB_AccSubClassAfterInsert(DataSet: TDataSet);
    procedure MYOB_ODCB_DBBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function getBalances(var Balances : array of currency; Accountno : integer): Boolean;
    function setBalances(var Balances : array of currency; Accountno : integer): Boolean;
  end;

var
  DMMYOBData: TDMMYOBData;

implementation

{$R *.dfm}

procedure TDMMYOBData.FB_MYOBTARIDBBeforeConnect(Sender: TIB_Connection);
begin
//
  FB_MYOBTARIDB.Path := 'C:\Program Files\Focus Based Management\TARI For Business\Data\MYOBTari.Fdb';
  FB_MYOBTARIDB.Server := 'Devwork1';
  FB_MYOBTARIDB.Username := 'SYSDBA';
  FB_MYOBTARIDB.Password := 'masterkey';
end;

procedure TDMMYOBData.FB_MYOBTARIDBAfterConnect(Sender: TIB_Connection);
begin
// Connect to tables
  FB_Myob_Accounts.active := True;
  FB_MYOB_TB.Active := True;
  FB_AccountMapping.Active := True;
  FB_AccountClass.Active := True;
  FB_AccSubClass.Active := True;
  FB_Account_Bals.Active := True;
  FB_MYOB_Info.Active := True;
end;

procedure TDMMYOBData.MYOB_ODCB_DBAfterConnect(Sender: TObject);
begin
// make sure these tables are alive.
  TblMYOB_Data.Active := True;
  MYOB_AccClass.Active := True;
  MYOB_AccSubClass.Active := True;
end;

procedure TDMMYOBData.FB_AccountClassAfterInsert(DataSet: TDataSet);
begin
  FB_AccountClassClass_ID.Value := FB_AccountClass.GeneratorValue('GEN_ACCOUNT_CLASS_ID', 1);
end;

procedure TDMMYOBData.FB_AccSubClassAfterInsert(DataSet: TDataSet);
begin
  FB_AccSubClassSubClass_ID.Value := FB_AccSubClass.GeneratorValue('GEN_ACCOUNT_SUBCLASS_ID', 1);
end;

function TDMMYOBData.getBalances(var Balances : array of currency; Accountno : integer): Boolean;
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

function TDMMYOBData.setBalances(var Balances : array of currency; Accountno : integer): Boolean;
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

procedure TDMMYOBData.MYOB_ODCB_DBBeforeConnect(Sender: TObject);
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
{
  AParams := TStringList.Create;
  if not AliasFound then
    begin
    UserSelected := 'C:\Premier10\bigClearwtrV10.MYO';
    KeyLocation := 'C:\Premier10\614018258003.key';
    HostPath := 'C:\Premier10\MYOBP.exe';
      try
        with AParams do
        begin
        Add('DRIVER=MYOB_ODBC');
        Add('TYPE=MYOB_ODBC');
        Add('ODBC DSN=MYOB_TARI');
        Add('DATABASE NAME=' + UserSelected);
        Add('KEY=' + KeyLocation);
        Add('HOST_EXE_PATH='+ HostPath);
        Add('NETWORK_PROTOCOL=TCP_IP');
        Add('DRIVER_COMPLETION=DRIVER_PROMPT');
        end;
        Session.AddAlias('MYOBTARI', 'MYOB_ODBC', AParams);
      finally
        AParams.Free;
      end;
    end;
}
end;

end.
