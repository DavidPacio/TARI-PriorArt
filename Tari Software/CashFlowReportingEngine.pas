unit CashFlowReportingEngine;
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
  Windows, Classes, Controls, SysUtils, stdctrls, DataCollector, AuchTypes, CashFlowEngine,
  variants, LGLobals, DMClient, dialogs;

type

// This engine handles 3 set of consolidated data which it obtains from creating instances
// of the CashFlowEngine from the Departments listed in the Consolidation List.
// After initialising the data records, a set of data is Added from each cashflowengine.
// The Dates for the report over ride any Planning data range contained in each department.

  TCashFlowReportingEngine = class(TObject)
  Private
    ConsolidDataList : TList;
    CashRec : TCashFlowRecPtr;
    ReportRec : TCashFlowReportRecPtr;
    procedure TransferData(RepType: Integer);
    procedure SetUpRecord;
    procedure AccumulateData;
//    procedure calculateBSBalance(month: integer; cfType : TCashFlowType);
    procedure BuildBSDetail(BSrec : TCashFlowReportRecPtr);
//    procedure calculateStockBalances(month: integer);
    procedure clearConsolidDataList;
    procedure CalcProfit;
  Public
    psdate, pedate : TDateTime;
    PeriodCount : integer;
    ListInitialised : Boolean;
    ConNPAfterTax : TDetailedBalArray;
    ConDADepreciation : TDetailedBalArray;
    ConPNLInterest : TDetailedBalArray;
    constructor create(CashReportType : Integer; Consolidated: TConsolidateType; StartDate, EndDate: TDateTime; PeriodType: integer);
    Destructor Destroy; override;
    procedure InitialiseList(RepType: Integer);
//    procedure CalcDays(cfType : TCashFlowType);
//    procedure CalcStock;
    function GetCashRepAccountIndex(accountNo : Integer): Integer;
    function GetAccountRec(AccountNo : Integer; var LocalRecPtr: TCashFlowReportRecPtr):TCashFlowReportRecPtr;
    procedure CorrectBankAccount;  // Only used by Balance sheet report
    procedure calculateBSDays(CFType : TCashFlowType);
    procedure calculateStockturn;
  End;

Var
  CFREngine : TCashFlowReportingEngine;

{29}
  CashFlowRep : array[0..CASHFLOWREPLISTSIZE - 1] of
      Integer = (AP_ADJUSTMENTS,
                AR_ADJUSTMENTS,
                AE_ADJUSTMENTS,
                CASH_AT_BANK,
                CASH_MAN_DEPOSITS,
                CASH_MAN_WITHDRAWALS,
                CASH_PAYMENTS_AE,
                CASH_PAYMENTS_AP,
                CASH_RECEIPTS_AR,
                DEP_ASSET_PURCHASES,
                DEP_ASSET_SALES,
                DIV_PAID,
                EQUITY_INJECTED,
                EQUITY_WITHDRAWN,
                INC_TAX_PAID,
                INTANG_ASSET_PURCHASES,
                INTANG_ASSET_SALES,
                LOANS_INCURRED,
                LOANS_REPAID,
                MARKET_SEC_PURCHASES,
                MARKET_SEC_SALES,
                NON_DEP_ASSET_PURCHASES,
                NON_DEP_ASSET_SALES,
                OTHER_ASSETS_PURCHASES,
                OTHER_ASSETS_SALES,
                OTHER_LIAB_INCURRED,
                OTHER_LIAB_PAID,
                OTHERINCOME,
                ST_ADJUSTMENTS,
                TAX_ADJUSTMENTS,
                TAXPAID_REFUND
                );

{
    integer = (CASH_AT_BANK, //ACCOUNT_REC, STOCK, CASH_MAN_FUND,
              //MARKETSEC, OTHER_CURRENT_ASSETS, NON_DEP_ASSETS,
              //DEP_ASSETS, INTANG_ASSETS, BANK_OVERDRAFT, ACCOUNT_PAY, ACCRUED_EXPENSES,
              //TAX_PAYABLE, TAX_CASH_TIMING, INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB,
              //LOANS, EQUITY, SALES, STOCK_SOLD, SUBCONTRACTORS, TAX_ON_SALES, // STOCK SOLD is SALES - GP - SUBCONTRACTORS
              //TOTAL_GROSS_SALES,
              CASH_RECEIPTS_AR, AR_ADJUSTMENTS,
              //STOCK_DELIVERIES, TAX_ON_STOCK_DELIVERIES,
              ST_ADJUSTMENTS,
              //GROSS_STOCK_PURCHASES, TAX_ON_SUBCONTRACTORS, GROSS_SUBCONTRACTORS,
              CASH_MAN_DEPOSITS, CASH_MAN_WITHDRAWALS, MARKET_SEC_PURCHASES, MARKET_SEC_SALES,
              OTHER_ASSETS_PURCHASES, OTHER_ASSETS_SALES, NON_DEP_ASSET_PURCHASES,
              NON_DEP_ASSET_SALES, DEP_ASSET_PURCHASES, DEP_ASSET_SALES,
              INTANG_ASSET_PURCHASES, INTANG_ASSET_SALES, //TOTAL_AP_INVOICES,
              CASH_PAYMENTS_AP,
              NET_EXPENSES_VIA_AP, TAX_EXPENSES_VIA_AP, GROSS_EXPENSES_VIA_AP, AP_ADJUSTMENTS,
              NET_EXPENSES_ACCRUED, TAX_EXPENSES_ACCRUED, GROSS_EXPENSES_ACCRUED, CASH_PAYMENTS_AE, AE_ADJUSTMENTS,
              TOTAL_TAX_COLLECTED, TOTAL_TAX_PAID,
              TAX_ADJUSTMENTS, TAXPAID_REFUND, INC_TAX_INCURRED, INC_TAX_PAID, DIV_DECLARED, DIV_PAID,
              OTHER_LIAB_INCURRED, OTHER_LIAB_PAID, LOANS_INCURRED, LOANS_REPAID,
              EQUITY_INJECTED, EQUITY_WITHDRAWN, AR_WRITEOFF, ST_WRITEOFF, NETTAXCASH, NETTAXACCRUAL,
              //AR_DAYS, STOCK_DAYS, AP_DAYS, AE_DAYS,
              //GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT,  NETPROFIT,
              // these are editable
              OTHERINCOME
              //, POTENTIAL, BILLED, SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY
              );
}
{38}
  WorkingCapRep : array[0.. WORKCAPREPLISTSIZE - 1] of
    Integer = ( ACCOUNT_PAY,
                ACCOUNT_REC,
                ACCRUED_EXPENSES,
                AE_ADJUSTMENTS,
                AE_DAYS,
                AP_ADJUSTMENTS,
                AP_DAYS,
                AR_ADJUSTMENTS,
                AR_DAYS,
                AR_WRITEOFF,
                CASH_AT_BANK,
                CASH_PAYMENTS_AE,
                CASH_PAYMENTS_AP,
                CASH_RECEIPTS_AR,
                GROSS_EXPENSES_ACCRUED,
                GROSS_EXPENSES_VIA_AP,
                GROSS_STOCK_PURCHASES,
                GROSS_SUBCONTRACTORS,
                NET_EXPENSES_ACCRUED,
                NET_EXPENSES_VIA_AP,
                SALES,
                ST_ADJUSTMENTS,
                ST_WRITEOFF,
                STOCK,
                STOCK_DAYS,
                STOCK_DELIVERIES,
                STOCK_SOLD,
                TAX_ADJUSTMENTS,
                TAX_CASH_TIMING,
                TAX_EXPENSES_ACCRUED,
                TAX_EXPENSES_VIA_AP,
                TAX_ON_SALES,
                TAX_ON_STOCK_DELIVERIES,
                TAX_ON_SUBCONTRACTORS,
                TAX_PAYABLE,
                TAXPAID_REFUND,
                TOTAL_AP_INVOICES,
                TOTAL_GROSS_SALES,
                TOTAL_TAX_COLLECTED,
                TOTAL_TAX_PAID
                );

{
    integer = (CASH_AT_BANK, ACCOUNT_REC, STOCK, CASH_MAN_FUND,
              MARKETSEC, OTHER_CURRENT_ASSETS, NON_DEP_ASSETS,
              DEP_ASSETS, INTANG_ASSETS, BANK_OVERDRAFT, ACCOUNT_PAY, ACCRUED_EXPENSES,
              TAX_PAYABLE, TAX_CASH_TIMING, INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB,
              LOANS, EQUITY, SALES, STOCK_SOLD, SUBCONTRACTORS, TAX_ON_SALES, // STOCK SOLD is SALES - GP - SUBCONTRACTORS
              TOTAL_GROSS_SALES, CASH_RECEIPTS_AR, AR_ADJUSTMENTS,
              STOCK_DELIVERIES, TAX_ON_STOCK_DELIVERIES, ST_ADJUSTMENTS,
              GROSS_STOCK_PURCHASES, TAX_ON_SUBCONTRACTORS, GROSS_SUBCONTRACTORS,
              CASH_MAN_DEPOSITS, CASH_MAN_WITHDRAWALS, MARKET_SEC_PURCHASES, MARKET_SEC_SALES,
              OTHER_ASSETS_PURCHASES, OTHER_ASSETS_SALES, NON_DEP_ASSET_PURCHASES,
              NON_DEP_ASSET_SALES, DEP_ASSET_PURCHASES, DEP_ASSET_SALES,
              INTANG_ASSET_PURCHASES, INTANG_ASSET_SALES, TOTAL_AP_INVOICES,
              CASH_PAYMENTS_AP, NET_EXPENSES_VIA_AP, TAX_EXPENSES_VIA_AP, GROSS_EXPENSES_VIA_AP, AP_ADJUSTMENTS,
              NET_EXPENSES_ACCRUED, TAX_EXPENSES_ACCRUED, GROSS_EXPENSES_ACCRUED, CASH_PAYMENTS_AE, AE_ADJUSTMENTS, TOTAL_TAX_COLLECTED, TOTAL_TAX_PAID,
              TAX_ADJUSTMENTS, TAXPAID_REFUND, INC_TAX_INCURRED, INC_TAX_PAID, DIV_DECLARED, DIV_PAID,
              OTHER_LIAB_INCURRED, OTHER_LIAB_PAID, LOANS_INCURRED, LOANS_REPAID,
              EQUITY_INJECTED, EQUITY_WITHDRAWN, AR_WRITEOFF, ST_WRITEOFF, NETTAXCASH, NETTAXACCRUAL,
              AR_DAYS, STOCK_DAYS, AP_DAYS, AE_DAYS,
              GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT,  NETPROFIT,
              // these are editable
              OTHERINCOME, POTENTIAL, BILLED, SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY);

}

{25}
    BalanceSheetRep : array[0.. BALSHEETREPLISTSIZE - 1] of
    Integer = (ACCOUNT_PAY,
              ACCOUNT_REC,
              ACCRUED_EXPENSES,
              AE_DAYS,
              AP_DAYS,
              AR_DAYS,
              BANK_OVERDRAFT,
              CASH_AT_BANK,
              CASH_MAN_FUND,
              DEP_ASSETS,
              DIV_DECLARED,
              DIVIDENDS_PAYABLE,
              EQUITY,
              EQUITY_INJECTED,
              EQUITY_WITHDRAWN,
              GROSS_EXPENSES_ACCRUED,
              INC_TAX_INCURRED,
              INC_TAX_PAYABLE,
              INTANG_ASSETS,
              LOANS,
              MARKETSEC,
              NETPROFIT,
              NON_DEP_ASSETS,
              OTHER_CURRENT_ASSETS,
              OTHER_CURRENT_LIAB,
              SALES,
              STOCK,
              STOCK_DAYS,
              STOCK_SOLD,
              TAX_CASH_TIMING,
              TAX_PAYABLE,
              TOTAL_AP_INVOICES,
              TOTAL_GROSS_SALES
              );
{
    integer = (CASH_AT_BANK, ACCOUNT_REC, STOCK, CASH_MAN_FUND,
              MARKETSEC, OTHER_CURRENT_ASSETS, NON_DEP_ASSETS,
              DEP_ASSETS, INTANG_ASSETS, BANK_OVERDRAFT, ACCOUNT_PAY, ACCRUED_EXPENSES,
              TAX_PAYABLE, TAX_CASH_TIMING, INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB,
              LOANS, EQUITY, SALES, STOCK_SOLD, SUBCONTRACTORS, TAX_ON_SALES, // STOCK SOLD is SALES - GP - SUBCONTRACTORS
              TOTAL_GROSS_SALES, CASH_RECEIPTS_AR, AR_ADJUSTMENTS,
              STOCK_DELIVERIES, TAX_ON_STOCK_DELIVERIES, ST_ADJUSTMENTS,
              GROSS_STOCK_PURCHASES, TAX_ON_SUBCONTRACTORS, GROSS_SUBCONTRACTORS,
              CASH_MAN_DEPOSITS, CASH_MAN_WITHDRAWALS, MARKET_SEC_PURCHASES, MARKET_SEC_SALES,
              OTHER_ASSETS_PURCHASES, OTHER_ASSETS_SALES, NON_DEP_ASSET_PURCHASES,
              NON_DEP_ASSET_SALES, DEP_ASSET_PURCHASES, DEP_ASSET_SALES,
              INTANG_ASSET_PURCHASES, INTANG_ASSET_SALES, TOTAL_AP_INVOICES,
              CASH_PAYMENTS_AP, NET_EXPENSES_VIA_AP, TAX_EXPENSES_VIA_AP, GROSS_EXPENSES_VIA_AP, AP_ADJUSTMENTS,
              NET_EXPENSES_ACCRUED, TAX_EXPENSES_ACCRUED, GROSS_EXPENSES_ACCRUED, CASH_PAYMENTS_AE, AE_ADJUSTMENTS, TOTAL_TAX_COLLECTED, TOTAL_TAX_PAID,
              TAX_ADJUSTMENTS, TAXPAID_REFUND, INC_TAX_INCURRED, INC_TAX_PAID, DIV_DECLARED, DIV_PAID,
              OTHER_LIAB_INCURRED, OTHER_LIAB_PAID, LOANS_INCURRED, LOANS_REPAID,
              EQUITY_INJECTED, EQUITY_WITHDRAWN, AR_WRITEOFF, ST_WRITEOFF, NETTAXCASH, NETTAXACCRUAL,
              AR_DAYS, STOCK_DAYS, AP_DAYS, AE_DAYS,
              GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT,  NETPROFIT,
              // these are editable
              OTHERINCOME, POTENTIAL, BILLED, SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY);

}


implementation

constructor TCashFlowReportingEngine.create(CashReportType : Integer; Consolidated: TConsolidateType; StartDate, EndDate: TDateTime; PeriodType: integer);
begin
  psdate := StartDate;
  Pedate := EndDate;
  PeriodType := PeriodType; // Default is 4 = monthly
  PeriodCount := createSummaryIndex(PeriodType, psdate, pedate);
  ListInitialised := False;
  if assigned(ConsolidDataList) then
    ConsolidDataList.Clear;
  FillChar(ConNPAfterTax, sizeof(TDetailedBalArray), #0);
  FillChar(ConDADepreciation, sizeof(TDetailedBalArray), #0);
  FillChar(ConPNLInterest, sizeof(TDetailedBalArray), #0);
  if Consolidated = ctBusiness then
    begin
    DataModuleClient.Businesses.First;
    while DataModuleClient.Businesses.eof = false do
      begin
      //  Check to see if this department is to be excluded
      if (DataModuleClient.BusinessesEXCLUDE_FROM_REPORTING.Value = 0) then
        begin
        CashFe := TCashFlowEngine.Create(DataModuleClient.CashFlowDeptDEPT_ID.Value, psdate, pedate, 4);
        cashfe.SaveCashFlow := False;
        cashfe.CalculateAll;
        CalcProfit;
        TransferData(CashReportType);
        Cashfe.Destroy;
        end;
      DataModuleClient.Businesses.next;
      end;    // while
    End
  else
    begin
    CashFe := TCashFlowEngine.Create(DataModuleClient.CashFlowDeptDEPT_ID.Value, psdate, pedate, 4);
    cashfe.SaveCashFlow := False;
    // What is NP
    cashfe.CalculateAll;
    CalcProfit;
    TransferData(CashReportType);
    Cashfe.Destroy;
    end;
{  for I := 0 to ConsolidList.Count - 1 do    // Iterate
    begin
    CashFe := TCashFlowEngine.Create(I, psdate, pedate, 4);
    Cashfe
    Cashfe.CalculateAll;
    // Transfer data
    Cashfe.Destroy;
    end;    // for
}

  // GLOBALS OPTIONS
{  if DataCollect.GetUserOption(OBANKACCOUNTLIABILITY, UOInteger) <> 0 then
    ShowBankOD := true
  else
    ShowBankOD := false;
  // Set up the pointers
  BankDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_AT_BANK)]);
  ARDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ACCOUNT_REC)]);
  StockDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK)]);
  CMFDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_MAN_FUND)]);
  MSDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(MARKETSEC)]);
  OCADataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_CURRENT_ASSETS)]);
  NDADataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NON_DEP_ASSETS)]);
  DADataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DEP_ASSETS)]);
  IADataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INTANG_ASSETS)]);
  BankODDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(BANK_OVERDRAFT)]);
  APDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ACCOUNT_PAY)]);
  AEDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ACCRUED_EXPENSES)]);
  TAXPAYDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_PAYABLE)]);
  INCTAXDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INC_TAX_PAYABLE)]);
  DIVDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DIVIDENDS_PAYABLE)]);
  OCLDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_CURRENT_LIAB)]);
  LOANSDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(LOANS)]);
  EQUITYDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(EQUITY)]);
//     GROSSPROFIT, , // STOCK SOLD is SALES - GP - SUBCONTRACTORS
  SalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(SALES)]);
  StockSoldRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_SOLD)]);
  SubcontractorsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(SUBCONTRACTORS)]);
  TAXSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_ON_SALES)]);
  GrossSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TOTAL_GROSS_SALES)]);
  ARCashReceiptsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_RECEIPTS_AR)]);
  StockDeliveriesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_DELIVERIES)]);
  TaxStockRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_ON_STOCK_DELIVERIES)]);
  GrossStockDelRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSS_STOCK_PURCHASES)]);
  TaxSubcontractorsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_ON_SUBCONTRACTORS)]);
  GrossSubContractorsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSS_SUBCONTRACTORS)]);
  CashManagementDepsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_MAN_DEPOSITS)]);
  CashmanagementWdrlsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_MAN_WITHDRAWALS)]);
  MarketSecPurchasesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(MARKET_SEC_PURCHASES)]);
  MarketSecSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(MARKET_SEC_SALES)]);
  OtherAssetsPurchRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_ASSETS_PURCHASES)]);
  OtherAssetsSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_ASSETS_SALES)]);
  NonDepnAssetsPurchRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NON_DEP_ASSET_PURCHASES)]);
  NonDepnAssetsSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NON_DEP_ASSET_SALES)]);
  DepnAssetsPurchRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DEP_ASSET_PURCHASES)]);
  DepnAssetsSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DEP_ASSET_SALES)]);
  IntangAssetsPurchRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INTANG_ASSET_PURCHASES)]);
  IntangAssetsSalesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INTANG_ASSET_SALES)]);
  ExpensesViaAPRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NET_EXPENSES_VIA_AP)]);
  TaxExpensesAPrec := TcashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_EXPENSES_VIA_AP)]);
  GrossExpviaAPRec := TcashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSS_EXPENSES_VIA_AP)]);
  TotalInvoicesAPRec := TcashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TOTAL_AP_INVOICES)]);
  CashPaymentsAPRec := TCashFlowrecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_PAYMENTS_AP)]);
  ExpensesAERec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NET_EXPENSES_ACCRUED)]);
  TaxExpensesAERec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_EXPENSES_ACCRUED)]);
  GrossExpensesAccruedRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSS_EXPENSES_ACCRUED)]);
  CashPaymentsAERec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(CASH_PAYMENTS_AE)]);
  TotalTaxCollectedRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TOTAL_TAX_COLLECTED)]);
  TotalTaxPaidRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TOTAL_TAX_PAID)]);
  TaxPaidRefundRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAXPAID_REFUND)]);
  IncTaxIncurredRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INC_TAX_INCURRED)]);
  IncTaxPaidRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(INC_TAX_PAID)]);
  DividendDeclaredRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DIV_DECLARED)]);
  DividendPaidRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DIV_PAID)]);
  OtherLiabIncurredRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_LIAB_INCURRED)]);
  OtherLiabPaidRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHER_LIAB_PAID)]);
  LoansIncurredRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(LOANS_INCURRED)]);
  LoansRepaidRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(LOANS_REPAID)]);
  EquityInjectedRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(EQUITY_INJECTED)]);
  EquityWithdrawnRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(EQUITY_WITHDRAWN)]);
  ARAdjustmentsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AR_ADJUSTMENTS)]);
  STAdjustmentsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ST_ADJUSTMENTS)]);
  APAdjustmentsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AP_ADJUSTMENTS)]);
  AEAdjustmentsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AE_ADJUSTMENTS)]);
  TAXAdjustmentsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_ADJUSTMENTS)]);
  AR_WriteOffRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AR_WRITEOFF)]);
  ST_WriteOffRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ST_WRITEOFF)]);
  TAXTIMINGDataRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_CASH_TIMING)]);
  NETTAXCASHRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NETTAXCASH)]);
  NETTAXACCRUALRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NETTAXACCRUAL)]);

  AR_DaysRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AR_DAYS)]);
  BuildBSSummary(AR_DaysRec);
  Stock_DaysRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_DAYS)]);
  BuildBSSummary(Stock_DaysRec);
  AP_DaysRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AP_DAYS)]);
  BuildBSSummary(AP_DaysRec);
  AE_DaysRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(AE_DAYS)]);
  BuildBSSummary(AE_DaysRec);
  GPRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSSPROFIT)]);
  TotalexpensesRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TOTALEXPENSES)]);
  NOPRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NETOPERATINGPROFIT)]);
  NPRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(NETPROFIT)]);
  OTHERIncomeRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(OTHERINCOME)]);
  PotentialRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(POTENTIAL)]);
  BilledRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(BILLED)]);
  SalesUnitRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(SALESUNIT)]);
  GPUnitRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GPUNIT)]);
  GPPCRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GPPC)]);
  ProdRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(PRODUCTIVITY)]);
}
end;

destructor TCashFlowReportingEngine.Destroy;
begin
  ClearConsolidDataList;
  inherited destroy;
end;

procedure TCashFlowReportingEngine.clearConsolidDataList;
var
  index: integer;
  CashFlowRepDataRec: TCashFlowReportRecPtr;
begin
  for index := 0 to ConsolidDataList.Count - 1 do
    begin
    CashFlowRepDataRec := TCashFlowReportRecPtr(ConsolidDataList.Items[index]);
    dispose(CashFlowREpDataRec);
    end;
  ConSolidDataList.clear;
end;

function TCashFlowReportingEngine.GetCashRepAccountIndex(accountNo : Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to ConsolidDataList.Count - 1 do    // Iterate
    begin
    if TCashFlowReportRecPtr(ConsolidDataList.Items[I]).Accountno = AccountNo then
      Result := I;
    end;    // for
  if Result = -1 then
    messagedlg('This account number was not found in the Cash Flow Report List = ' + inttostr(AccountNo), mtInformation, [mbOK], 0);
end;

procedure TCashFlowReportingEngine.SetUpRecord;
begin
  ReportRec.Accountno := CashRec.Accountno;
  ReportRec.AccountTitle := CashRec.AccountTitle;
  ReportRec.Nonzero := CashRec.Nonzero;
  ReportRec.Noncash := CashRec.Noncash;
  ReportRec.PlanTotal := 0;
  ReportRec.OpeningBalance := 0;
  ReportRec.DiskBalance := 0;
  fillchar(ReportRec.PlanDetail, sizeof(TDetailedBalArray), #0);
  fillchar(ReportRec.PlanSummary, sizeof(TSummaryBalArray), #0);
end;

procedure TCashFlowReportingEngine.InitialiseList(RepType: Integer);
var
  I: Integer;
begin
  if not assigned(ConsolidDataList) then
    ConsolidDataList := Tlist.Create;
  case RepType of    //
    REPCASHFLOW:  Begin
                  for I := 0 to CASHFLOWREPLISTSIZE - 1 do    // Iterate
                    begin
                    New(ReportRec);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(CashFlowRep[I])]);
                    SetUpRecord;
                    ConsolidDataList.Add(ReportRec);
                    end;    // for
                  End;
    REPWORKING:   Begin
                  for I := 0 to WORKCAPREPLISTSIZE - 1 do    // Iterate
                    begin
                    New(ReportRec);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(WorkingCapRep[I])]);
                    SetUpRecord;
                    ConsolidDataList.Add(ReportRec);
                    end;    // for
                  End;
    REPBALANCE:   Begin
                  for I := 0 to BALSHEETREPLISTSIZE - 1 do    // Iterate
                    begin
                    New(ReportRec);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(BalanceSheetRep[I])]);
                    SetUpRecord;
                    ConsolidDataList.Add(ReportRec);
                    end;    // for
                  End;
  end;    // case
end;

procedure TCashFlowReportingEngine.AccumulateData;
var
  I: Integer;
begin
  ReportRec.OpeningBalance := ReportRec.OpeningBalance + CashRec.OpeningBalance;
  ReportRec.PlanTotal := ReportRec.PlanTotal + CashRec.PlanTotal;
  for I := 0 to NUM_DAYSINYEAR do    // Iterate
    begin
    if I <= NUM_WEEKS then
      ReportRec.planSummary[I] :=  ReportRec.planSummary[I] + CashRec.PlanSummary[I];
    ReportRec.PlanDetail[I] := ReportRec.PlanDetail[I] + CashRec.PlanDetail[I];
    end;    // for
end;

procedure TCashFlowReportingEngine.TransferData(RepType: Integer);
var
  I : integer;
begin
  if Not ListInitialised then
    begin
    InitialiseList(Reptype);
    ListInitialised := True;
    end;
    // Correct the Bank Account
  if Cashfe.BankisOD then
    Cashfe.CorrectBankAccount(True);
  case RepType of    //
    REPCASHFLOW:  Begin
                  for I := 0 to CASHFLOWREPLISTSIZE - 1 do    // Iterate
                    begin
                    ReportRec := TCashFlowReportRecPtr(ConsolidDataList.Items[GetCashRepAccountIndex(CashFlowRep[I])]);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(CashFlowRep[I])]);
                    AccumulateData;
                    end;
                  End;
    REPWORKING:   Begin
                  for I := 0 to WORKCAPREPLISTSIZE - 1 do    // Iterate
                    begin
                    ReportRec := TCashFlowReportRecPtr(ConsolidDataList.Items[GetCashRepAccountIndex(WorkingCapRep[I])]);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(WorkingCapRep[I])]);
                    AccumulateData;
                    end;
                  End;
    REPBALANCE:   Begin
                  for I := 0 to BALSHEETREPLISTSIZE - 1 do    // Iterate
                    begin
                    ReportRec := TCashFlowReportRecPtr(ConsolidDataList.Items[GetCashRepAccountIndex(BalanceSheetRep[I])]);
                    CashRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[CashFe.GetCashFlowAccountIndex(BalanceSheetRep[I])]);
                    AccumulateData;
                    end;
                  for I := 0 to NUM_DAYSINYEAR do    // Iterate
                    begin
                    ConNPAfterTax[i] := ConNPAfterTax[I] + Cashfe.NPAfterTax[i];
                    ConDADepreciation[i] := ConDADepreciation[I] + Cashfe.DADepreciation[I];
                    ConPNLInterest[i] := ConPNLInterest[i] + Cashfe.PNLInterest[i];
                    end;    // for
                  End;
  end;    // case
  if Cashfe.BankisOD then
    Cashfe.CorrectBankAccount(False);
end;

function TCashFlowReportingEngine.GetAccountRec(AccountNo : Integer; var LocalRecPtr: TCashFlowReportRecPtr):TCashFlowReportRecPtr;
begin
  LocalRecPtr := TCashFlowReportRecPtr(ConsolidDataList.Items[GetCashRepAccountIndex(AccountNo)]);
  result := LocalRecPtr;
end;

procedure TCashFlowReportingEngine.BuildBSDetail(BSrec : TCashFlowReportRecPtr);
var
  I, J, K: Integer;
begin
  for I := 0 to periodcount - 1 do    // Iterate
    begin
    if I = 0 then
      J := 0
    else
      J := SummaryPeriodIndexArray[I - 1] + 1;

    for k := J to SummaryPeriodIndexArray[I] do    // Iterate
      BSrec.plandetail[K] := BSrec.PlanSummary[I];
    end;    // for
end;

procedure TCashFlowReportingEngine.calculateBSDays(CFType : TCashFlowType);
var
  monthNum, mths, moveavg, totaldays: integer;
  daysInMonth: TDateTime;
  temp, OpeningBal: currency;
  TotalInput : currency;
  BSAccountRec : TCashFlowReportRecPtr;
  BSDaysRec : TCashFlowReportRecPtr;
  CFInputRec : TCashFlowReportRecPtr;
  CFOutputRec : TCashFlowReportRecPtr;
begin
// All these types calculate Days outstanding based on a default of 2 months of "Input" averaged
// against the current period Balance
  BSAccountRec := Nil;
  BSDaysRec := Nil;
  CFInputRec := Nil;
  CFOutputRec := Nil;
  case CFType of    //
    cfReceivables:
      begin
      GetAccountRec(ACCOUNT_REC, BSAccountRec);
      GetAccountRec(AR_DAYS, BSDaysRec);
      GetAccountRec(TOTAL_GROSS_SALES, CFInputRec);
      GetAccountRec(CASH_RECEIPTS_AR, CFOutputRec);
      end;
    cfPayables:
      begin
      GetAccountRec(ACCOUNT_PAY, BSAccountRec);
      GetAccountRec(AP_DAYS, BSDaysRec);
      GetAccountRec(TOTAL_AP_INVOICES, CFInputRec);
      GetAccountRec(CASH_PAYMENTS_AP, CFOutputRec);
      end;
    cfAccruedExpenses:
      begin
      GetAccountRec(ACCRUED_EXPENSES, BSAccountRec);
      GetAccountRec(AE_DAYS, BSDaysRec);
      GetAccountRec(GROSS_EXPENSES_ACCRUED, CFInputRec);
      GetAccountRec(CASH_PAYMENTS_AE, CFOutputRec);
      end;
  end;    // case

  Moveavg := 2;
  totaldays := SummaryPeriodIndexArray[CFREngine.PeriodCount - 1];
  TotalInput := 0;
  // Zero the days o/s as were about to re-calculate it
  for monthNum := 0 to CFREngine.PeriodCount do
    begin
    if MonthNum = 0 then
      OpeningBal := BSAccountRec.OpeningBalance
    else
      OpeningBal := BSAccountRec.planSummary[monthNum-1];

    // If no opening bal and days o/s and invoices are the same or less that the
    // cash receipts (Which are also non zero) then let the cash receipts equal
    // the invoices. (JM Not sure if this condition will ever be true
    // but TW orignal code includes it, so i did)
    if (OpeningBal = 0) and (BSDaysRec.planSummary[monthNum] = 0) and
       (CFInputRec.planSummary[monthNum] <= CFOutputRec.Plansummary[monthNum]) and
       (CFInputRec.planSummary[monthNum] <> 0) then
        CFOutputRec.Plansummary[monthNum] := CFInputRec.planSummary[monthNum];

    // Work out the total receivable for this period
    temp := OpeningBal + CFInputRec.Plansummary[monthNum];
    totalinput := totalinput + CFInputRec.Plansummary[monthNum];
    // If its less then the cash receipts then let the receipts equal it
    if temp < CFOutputRec.Plansummary[monthNum] then
      CFOutputRec.Plansummary[monthNum] := temp;

    // Now subtract the cash receipts from the opening balance
    temp := temp - CFOutputRec.Plansummary[monthNum];

    // Set the closing balance
    BSAccountRec.planSummary[monthNum]:= temp;

    // Initialise value
    BSDaysRec.planSummary[monthNum] := 0;
    // Now work out the days o/s for this period, only if there is a balance to work with
    if temp <> 0 then
      begin
      Mths := MonthNum - moveAvg;
      if Mths < 0 then
        DaysInMonth := SummaryPeriodIndexArray[MonthNum] + 1
      else
        DaysInMonth := SummaryPeriodIndexArray[MonthNum] - SummaryPeriodIndexArray[Mths] + 1;

      mths := MonthNum;
      temp := 0;
      if (MonthNum < periodcount) then
        begin
        while (Mths >= 0) and ((MonthNum - mths) < moveavg) do
          begin
          temp := temp + CFInputRec.planSummary[mths];
          dec(mths);
          end;    // while

        if BSAccountRec.planSummary[monthNum] <> 0 then
          if temp <> 0 then
            BSDaysRec.planSummary[monthNum] := BSAccountRec.planSummary[monthNum] * daysInMonth / temp
          else
            BSDaysRec.planSummary[monthNum] := 0;
        end
      else
        begin
        if BSAccountRec.planSummary[monthNum] <> 0 then
          if totalinput <> 0 then
            BSDaysRec.planSummary[monthNum] := BSAccountRec.planSummary[monthNum] * totaldays / totalinput
          else
            BSDaysRec.planSummary[monthNum] := 0;
        end;
      DataCollect.roundCurrency(BSDaysRec.planSummary[monthNum], 6);
      end;
    end;
  BuildBSDetail(BSDaysRec);
end;

procedure TCashFlowReportingEngine.calculateStockturn;
var
  monthNum, mths, StockMoveavg, totaldays: integer;
  daysInMonth: TDateTime;
  temp: currency;
  TotalStockSold : currency;
  Stock_DaysRec : TCashFlowReportRecPtr;
  StockSoldRec : TCashFlowReportRecPtr;
  StockDataRec : TCashFlowReportRecPtr;
  STOCKDeliveriesRec : TCashFlowReportRecPtr;
//  STOCKDataRec : TCashFlowRecPtr;
//  STOCKDaysRec : TCashFlowRecPtr;
//  STOCKTotalInvRec : TCashFlowRecPtr;
//  STOCKTotalRecRec : TCashFlowRecPtr;
  OpeningBal : currency;
begin
//  STOCKDataRec := StockDataRec; //TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK)]);
//  STOCKDaysRec := Stock_DaysRec; //TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_DAYS)]);
//  STOCKTotalInvRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_SOLD)]);
//  STOCKTotalRecRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(STOCK_DELIVERIES)]);
  GetAccountRec(STOCK_SOLD, StockSoldRec);
  GetAccountRec(STOCK_DAYS, Stock_DaysRec);
  GetAccountRec(STOCK, StockDataRec);
  GetAccountRec(STOCK_DELIVERIES, STOCKDeliveriesRec);
  StockMoveavg := 2;
  totaldays := SummaryPeriodIndexArray[CFREngine.PeriodCount - 1];
  totalStockSold := 0;
  for monthNum := 0 to PeriodCount do
    begin
    if Monthnum = 0 then
      OpeningBal := STOCKDataRec.OpeningBalance
    else
      OpeningBal := STOCKDataRec.PLanSummary[MonthNum - 1];

    // Work out the closing balance for the month
    temp := abs(OpeningBal) - abs(STOCKSoldRec.PlanSummary[monthNum]);
    totalStockSold := totalStockSold + abs(STOCKSoldRec.PlanSummary[monthNum]);
    // If its less then zero and less then the stock delivery then make them equal
    if (temp < 0) and ( abs(temp) > STOCKDeliveriesRec.PlanSummary[monthNum]) then
      STOCKDeliveriesRec.PlanSummary[monthNum] := abs(temp); //????

    // Now add stoc                       k delivery to the opening balance
    temp := temp + STOCKDeliveriesRec.PlanSummary[monthNum];
    // Set the closing balance
    STOCKDataRec.PLanSummary[monthNum] := temp;

    mths := 0;
    temp := 0;
    daysInMonth := 0;
    while( (monthNum + mths) < PeriodCount) and (mths < StockmoveAvg) do
      begin
      // Add up all the cost of goods
      temp := temp + STOCKSoldRec.PlanSummary[MonthNum + mths];
      daysInMonth := SummaryPeriodIndexArray[MonthNum + mths];
      inc(mths);
      end;
    if MonthNum > 0 then
      daysInMonth := DaysInMonth - SummaryPeriodIndexArray[MonthNum - 1];
    // Zero the stockturns as were about to re-calculate it
    STOCK_DaysRec.PlanSummary[monthNum] := 0;
    // Calculate Stock Days First
    if monthNum < PeriodCount then
      begin
      if STOCKDataRec.PlanSummary[monthNum] <> 0 then
        if temp <> 0 then
          STOCK_DaysRec.PlanSummary[monthNum] := STOCKDataRec.PLanSummary[monthNum] * daysInMonth / temp
        else
          STOCK_DaysRec.PlanSummary[monthNum] := 0;
        // Calculate Stockturns here
      if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) and (STOCK_DaysRec.PlanSummary[monthNum] <> 0) then
        STOCK_DaysRec.PlanSummary[monthNum] := 365 / STOCK_DaysRec.PlanSummary[monthNum];

      if STOCKDataRec.PLanSummary[monthNum] = 0 then
        STOCK_DaysRec.PlanSummary[monthNum] := 0;
      end
    else
      begin
      if totalStockSold <> 0 then
        STOCK_DaysRec.PlanSummary[monthNum] := STOCKDataRec.PLanSummary[monthNum] * totaldays / totalStockSold
      else
        STOCK_DaysRec.PlanSummary[monthNum] := 0;
        // Calculate Stockturns here
      if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) and (STOCK_DaysRec.PlanSummary[monthNum] <> 0) then
        STOCK_DaysRec.PlanSummary[monthNum] := 365 / STOCK_DaysRec.PlanSummary[monthNum];

      if STOCKDataRec.PLanSummary[monthNum] = 0 then
        STOCK_DaysRec.PlanSummary[monthNum] := 0;
      end;

    DataCollect.roundCurrency(STOCK_DaysRec.PlanSummary[monthNum], 6);
    end;
  BuildBSDetail(STOCK_DaysRec);
end;


{ ---------------------------------------------------------------------------- }
{ -- calculateBalances - Calculate the closing balance from the stockturn    }
{                          for the passed month                                }
{ ---------------------------------------------------------------------------- }
(*
procedure TCashFlowReportingEngine.calculateStockBalances(month: integer);
var
  mths: integer;
  temp, tempDays: currency;
  daysInMonth: TDateTime;
  STOCKDataRec : TCashFlowReportRecPtr;
  STOCKDaysRec : TCashFlowReportRecPtr;
  STOCKSoldRec : TCashFlowReportRecPtr;
  STOCKWriteOffsRec : TCashFlowReportRecPtr;
  STOCKAdjustmentRec : TCashFlowReportRecPtr;
  STOCKDeliveriesRec : TCashFlowReportRecPtr;
  OpeningBal : currency;
begin
// This should be used for stock adjustments but we don't see how yet!
  GetAccountRec(STOCK_DELIVERIES, STOCKDeliveriesRec);
  GetAccountRec(STOCK, STOCKDataRec);
  GetAccountRec(STOCK_SOLD, STOCKSoldRec);
  GetAccountRec(ST_ADJUSTMENTS, STOCKAdjustmentRec);
  GetAccountRec(ST_WRITEOFF, STOCKWriteOffsRec);
  GetAccountRec(STOCK_DAYS, STOCKDaysRec);

  if Month = 0 then
    OpeningBal := STOCKDataRec.OpeningBalance
  else
    OpeningBal := STOCKDataRec.PLanSummary[Month - 1];

  // If there is a stockturn then use that to calculate the balance
  if STOCKDaysRec.PLanSummary[month] <> 0 then
    begin
    // Convert StockTurns into Days OS
    if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) then
      tempDays := 365 / STOCKDaysRec.PLanSummary[month]
    else
      tempDays := STOCKDaysRec.PLanSummary[month];
    // Add up all the cost of goods
    mths := 0;
    temp := 0;
    daysInMonth := 0;
    while( (month + mths) < PeriodCount) and (mths < 2) do  // 2 is the default
      begin
      // Add up all the cost of goods
      temp := temp + STOCKSoldRec.PlanSummary[Month + mths];
      // this is incremented here to ensure we get the right maximum - not very efficient.
      daysInMonth := SummaryPeriodIndexArray[Month + mths];
      inc(mths);
      end;
    if Month > 0 then
      daysInMonth := DaysInMonth - SummaryPeriodIndexArray[Month - 1];

    if daysInMonth <> 0 then
      STOCKDataRec.PLanSummary[month] := tempDays * temp / daysInMonth
    else
      STOCKDataRec.PLanSummary[month] := 0;

    temp := OpeningBal - STOCKDataRec.PLanSummary[month];

    if (temp > 0) and (temp > STOCKDataRec.PLanSummary[month]) then
      STOCKDataRec.PLanSummary[month] := temp;

    STOCKDeliveriesRec.PlanSummary[month] := STOCKDataRec.PLanSummary[month]
                                             + STOCKSoldRec.PlanSummary[month]
//                                             - STOCKAdjustment.PlanSummary[month]
                                             - OpeningBal;
    end
  else
    begin
    STOCKDeliveriesRec.PlanSummary[month] := STOCKSoldRec.PlanSummary[month];
    STOCKDataRec.PLanSummary[month] := 0;
    end;
  DataCollect.roundCurrency(STOCKDeliveriesRec.PlanSummary[month], 0);
  DataCollect.roundCurrency(STOCKDataRec.PLanSummary[month], 0);
end;

*)

procedure TCashFlowReportingEngine.CorrectBankAccount; // Only called for Balance Sheet Report
var
  I: Integer;
  Tempbalances : TDetailedBalArray;
  BankRec, BankODRec : TCashFlowReportRecPtr;
begin
  FillChar(Tempbalances, Sizeof(TDetailedBalArray), #0);
//  move(CashFlowDataRec.PlanDetail, CashFlowDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
  CFREngine.GetAccountRec(CASH_AT_BANK, BankRec);
  if (BankRec.plandetail[SummaryPeriodIndexArray[CFREngine.PeriodCount - 1]] < 0) then
    begin
    CFREngine.GetAccountRec(BANK_OVERDRAFT, BankODRec);
    move(BankRec.PlanDetail, Tempbalances, sizeof(TDetailedBalArray));
    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
      begin
      TempBalances[I] := Tempbalances[i] * -1;
      end;    // for
    move(Tempbalances, BankODRec.PlanDetail, sizeof(TDetailedBalArray));
    BankODRec.OpeningBalance := BankRec.OpeningBalance * -1;
    FillChar(BankRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
    BankRec.OpeningBalance := 0;
    i := 0;
    while SummaryPeriodIndexArray[i] <> 0 do
      begin
      BankODRec.PlanSummary[i] := BankODRec.plandetail[SummaryPeriodIndexArray[i]];
      inc(i);
      end;    // while
    end;
end;

procedure TCashFlowReportingEngine.CalcProfit;
var
  I : Integer;
  SalesRec : TCashFlowRecPtr;
  StockSoldRec : TCashFlowRecPtr;
  SubcontractorsRec : TCashFlowRecPtr;
  TotalExpensesRec : TCashFlowRecPtr;
  NOPREC : TCashFlowRecPtr;
  OTHERIncomeRec : TCashFlowRecPtr;
  NPREC : TCashFlowRecPtr;
begin
  SalesRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(SALES)]);
  StockSoldRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(STOCK_SOLD)]);
  SubcontractorsRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(SUBCONTRACTORS)]);
  TotalexpensesRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(TOTALEXPENSES)]);
  OTHERIncomeRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(OTHERINCOME)]);
  NOPRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(NETOPERATINGPROFIT)]);
  NPRec := TCashFlowRecPtr(cashfe.CashFlowDataList.Items[cashfe.GetCashFlowAccountIndex(NETPROFIT)]);
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    NOPREC.PlanDetail[I] := SalesRec.PlanDetail[I] - StockSoldRec.PlanDetail[I] - SubcontractorsRec.PlanDetail[i] - TotalExpensesRec.PlanDetail[I];
    NPRec.PlanDetail[I] := NOPREC.PlanDetail[I] + OTHERIncomeRec.PlanDetail[I];
    end;
  BuildSummary(SalesRec.Accountno, psdate, pedate, SalesRec.PlanDetail, SalesRec.planSummary);
  BuildSummary(StockSoldRec.Accountno, psdate, pedate, StockSoldRec.PlanDetail, StockSoldRec.planSummary);
  BuildSummary(SubcontractorsRec.Accountno, psdate, pedate, SubcontractorsRec.PlanDetail, SubcontractorsRec.planSummary);
  BuildSummary(TotalExpensesRec.Accountno, psdate, pedate, TotalExpensesRec.PlanDetail, TotalExpensesRec.planSummary);
  BuildSummary(OtherIncomeRec.Accountno, psdate, pedate, OtherIncomeRec.PlanDetail, OtherIncomeRec.planSummary);
  BuildSummary(NOPRec.Accountno, psdate, pedate, NOPRec.PlanDetail, NOPRec.planSummary);
  BuildSummary(NPRec.Accountno, psdate, pedate, NPRec.PlanDetail, NPRec.planSummary);
end;


end.
