unit CashFlowEngine;
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
  Windows, Classes, Controls, SysUtils, stdctrls, DMClient, DataCollector, AuchTypes, printers,
	{$IFDEF Video} Forms, Messages, OleCtrls, TSCRECLib_TLB,{$ENDIF}
  variants, registry, inifiles, dialogs, LGLobals, DateUtils;

type

  TCashFlowEngine = class(Tobject)
  private
//    PeriodType : Integer;
    procedure getCashFlowData;
    procedure setCashFlowData;
    procedure clearCashFlowDataList;
//    function totalBalanceArray(const balances: array of currency): currency;
//    function roundCurrency(var value: currency; const noDP: smallint): currency;
  public
    CashFlowDataList : TList;
    psdate, pedate : TDateTime;
    CashFlowloaded : Boolean;
    ShowBankOD : boolean;
    BankisOD : Boolean; // If false, indicates CASH_AT_BANK has bank balance, If true BANK_OVERDRAFT has bank Balance
                        // Balances are multiplied by -1 on conversion.
    SaveCashFlow : Boolean;  // Default is True;
    PeriodCount : integer;
    Dept_id : Integer;
    NetProfitAfterTax : Currency;
    BankDataRec : TCashFlowRecPtr;
    ARDataRec : TCashFlowRecPtr;
    StockDataRec : TCashFlowRecPtr;
    CMFDataRec : TCashFlowRecPtr;
    MSDataRec : TCashFlowRecPtr;
    OCADataRec : TCashFlowRecPtr;
    TCADataRec : TCashFlowRecPtr;
    NDADataRec : TCashFlowRecPtr;
    DADataRec : TCashFlowRecPtr;
    IADataRec : TCashFlowRecPtr;
    BankODDataRec : TCashFlowRecPtr;
    APDataRec : TCashFlowRecPtr;
    AEDataRec : TCashFlowRecPtr;
    TAXPAYDataRec : TCashFlowRecPtr;
    TAXTIMINGDataRec : TCashFlowRecPtr;
    INCTAXDataRec : TCashFlowRecPtr;
    DIVDataRec : TCashFlowRecPtr;
    OCLDataRec : TCashFlowRecPtr;
    LOANSDataRec : TCashFlowRecPtr;
    EQUITYDataRec : TCashFlowRecPtr;
    SalesRec : TCashFlowRecPtr;
    StockSoldRec : TCashFlowRecPtr;
    SubcontractorsRec : TCashFlowRecPtr;
    TAXSalesRec : TCashFlowRecPtr;
    GrossSalesRec : TCashFlowRecPtr;
    ARCashReceiptsRec : TCashFlowRecPtr;
    StockDeliveriesRec : TCashFlowRecPtr;
    TaxStockRec : TCashFlowRecPtr;
    GrossStockDelRec : TCashFlowRecPtr;
    TaxSubcontractorsRec : TCashFlowRecPtr;
    GrossSubContractorsRec : TCashFlowRecPtr;
    CashManagementDepsRec : TCashFlowRecPtr;
    CashmanagementWdrlsRec : TCashFlowRecPtr;
    MarketSecPurchasesRec : TCashFlowRecPtr;
    MarketSecSalesRec : TCashFlowRecPtr;
    OtherAssetsPurchRec : TCashFlowRecPtr;
    OtherAssetsSalesRec : TCashFlowRecPtr;
    NonDepnAssetsPurchRec : TCashFlowRecPtr;
    NonDepnAssetsSalesRec : TCashFlowRecPtr;
    DepnAssetsPurchRec : TCashFlowRecPtr;
    DepnAssetsSalesRec : TCashFlowRecPtr;
    IntangAssetsPurchRec : TCashFlowRecPtr;
    IntangAssetsSalesRec : TCashFlowRecPtr;
    ExpensesViaAPRec : TCashFlowRecPtr;
    TaxExpensesAPrec : TcashFlowRecPtr;
    GrossExpviaAPRec : TcashFlowRecPtr;
    TotalInvoicesAPRec : TcashFlowRecPtr;
    CashPaymentsAPRec : TCashFlowrecPtr;
    IncTaxIncurredRec : TCashFlowRecPtr;
    IncTaxPaidRec : TCashFlowRecPtr;
    ExpensesAERec : TCashFlowRecPtr;
    TaxExpensesAERec : TCashFlowRecPtr;
    GrossExpensesAccruedRec : TCashFlowRecPtr;
    CashPaymentsAERec : TCashFlowRecPtr;
    TotalTaxCollectedRec : TCashFlowRecPtr;
    TotalTaxPaidRec : TCashFlowRecPtr;
    TaxPaidRefundRec : TCashFlowRecPtr;
    DividendDeclaredRec : TCashFlowRecPtr;
    DividendPaidRec : TCashFlowRecPtr;
    OtherLiabIncurredRec : TCashFlowRecPtr;
    OtherLiabPaidRec : TCashFlowRecPtr;
    LoansIncurredRec : TCashFlowRecPtr;
    LoansRepaidRec : TCashFlowRecPtr;
    EquityInjectedRec : TCashFlowRecPtr;
    EquityWithdrawnRec : TCashFlowRecPtr;
    ARAdjustmentsRec : TCashFlowRecPtr;
    STAdjustmentsRec : TCashFlowRecPtr;
    APAdjustmentsRec : TCashFlowRecPtr;
    AEAdjustmentsRec : TCashFlowRecPtr;
    TAXAdjustmentsRec : TCashFlowRecPtr;
    NETTAXCASHRec : TCashFlowRecPtr;
    NETTAXACCRUALRec : TCashFlowRecPtr;
    AR_WriteOffRec : TCashFlowRecPtr;
    ST_WriteOffRec : TCashFlowRecPtr;
    AR_DaysRec : TCashFlowRecPtr;
    Stock_DaysRec : TCashFlowRecPtr;
    AP_DaysRec : TCashFlowRecPtr;
    AE_DaysRec : TCashFlowRecPtr;
    GPRec : TCashFlowRecPtr;
    TotalexpensesRec : TCashFlowRecPtr;
    NOPRec : TCashFlowRecPtr;
    NPRec : TCashFlowRecPtr;
    OTHERIncomeRec : TCashFlowRecPtr;
    PotentialRec : TCashFlowRecPtr;
    BilledRec : TCashFlowRecPtr;
    SalesUnitRec : TCashFlowRecPtr;
    GPUnitRec : TCashFlowRecPtr;
    GPPCRec : TCashFlowRecPtr;
    ProdRec : TCashFlowRecPtr;
    ARMoveavg, StockMoveAvg, APMoveavg, AEMoveAvg : integer;
    NPAfterTax : TDetailedBalArray;
    DADepreciation : TDetailedBalArray;
    NonCashInterest : TDetailedBalArray;
    NonCashCMF : TDetailedBalArray;
    NonCashMSec : TDetailedBalArray;
    NonCashOAssets : TDetailedBalArray;
    NonCashNDAssets : TDetailedBalArray;
    NonCashIntAssets : TDetailedBalArray;
    NonCashOLiab : TDetailedBalArray;
    PNLInterest : TDetailedBalArray;
    Property CashFlowList: TList read CashflowDataList;
    constructor create(DeptID : integer; StartDate, EndDate: TDateTime; PeriodType: integer);
    Destructor Destroy; override;
    Procedure CalculateAll;
//    Procedure CalculateThisPeriod(PeriodNum : integer);
    procedure calculateBSDays(monthFrom, MonthTo: Integer; CFType : TCashFlowType);
    procedure defineBSDays(cfType : TCashFlowType);
    procedure calculateBSBalance(month: integer; cfType : TCashFlowType);
    procedure calculateStockturn(monthFrom, MonthTo: integer);
    procedure defineStockturn;
    procedure calculateStockBalances(month: integer);
    // Moved to datacollector.pas  3/12/2003
    procedure SetBSBalance(BSrec : TCashFlowRecPtr);
    procedure UpdateBSBalance(BSrec : TCashFlowRecPtr; newBalance : Currency; ForceUpdate : Boolean);
    procedure BuildBSSummary(BSrec : TCashFlowRecPtr);
    procedure BuildBSDetail(BSrec : TCashFlowRecPtr); // from Summary (AR_DAys, etc.)
    procedure ProcessIncomeTaxDividend;
    procedure ProcessExpenses;
    procedure ProcessJournalstoAdjustments;
    procedure ProcessAccountsReceivable;
    procedure ProcessStock;
    procedure ProcessAccountsPayable;
    procedure ProcessAccruedExpenses;
    procedure ProcessTax;
    procedure ProcessCash;
    procedure CheckBank;
    function BankChange: Currency;
    procedure JrnlUpdateBSBalance(MainAccount, DRAccount, CRAccount: Integer);
    procedure SaveCashFlowData;
    procedure Checkround;
    procedure CorrectBankAccount(IsOD : Boolean);
    function GetCashFlowAccountIndex(accountNo : Integer): Integer;
    function IsAccountSaved(Accountno: Integer): Boolean;
    procedure CorrectBusinessCentre;
  end;

var
  CASHFE : TCashFlowEngine;
{$IFDEF Video}
  CamtasiaRecorder1 : TCamtasiaRecorder;
  TakeCount : Integer;
{$ENDIF}
  // Negative values in the following array indicate which accounts are to be ''consolidated'' during getting of balances
  // see
  CashFlowMain : array[0.. CASHFLOWLISTSIZE - 1] of
    integer = (CASH_AT_BANK, ACCOUNT_REC, STOCK, CASH_MAN_FUND,
              MARKETSEC, OTHER_CURRENT_ASSETS, NON_DEP_ASSETS,
              DEP_ASSETS, INTANG_ASSETS, BANK_OVERDRAFT, ACCOUNT_PAY, ACCRUED_EXPENSES,
              TAX_PAYABLE, TAX_CASH_TIMING, INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB,
              LOANS, EQUITY, -SALES, -STOCK_SOLD, -SUBCONTRACTORS, TAX_ON_SALES, // STOCK SOLD is SALES - GP - SUBCONTRACTORS
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
              -GROSSPROFIT, -TOTALEXPENSES, -NETOPERATINGPROFIT,  -NETPROFIT,
              // these are editable
              -OTHERINCOME, -POTENTIAL, -BILLED, -SALESUNIT, -GPUNIT, -GPPC, -PRODUCTIVITY);

implementation


procedure TCashFlowEngine.getCashFlowData;
var
  I: Integer;
  cn : integer;
  CashflowDataRec : TCashFlowRecPtr;
  HasPriorBalance : Boolean;
  ConsolType : TConsolidateType;
begin
  if Assigned(CashFlowDataList) then
    begin
    if CashFlowDataList.Count > 0 then
      ClearCashFlowDataList;
    end;
  if not Assigned(CashFlowDataList) then
    CashFlowDataList := Tlist.create;

  DataCollect.psdate := psdate;
  DataCollect.pedate := pedate;
  for cn := 0 to integer(Trunc(sizeof(CashFlowMain)/sizeof(integer)) - 1) do
    begin
    new(CashFlowDatarec);
    FillChar(CashFlowDatarec^, sizeof(TCashFlowRecType), #0);
    // Get Account Titles
    if CashFlowMain[cn] < 0 then
      ConsolType := ctCashFlow
    else
      ConsolType := ctNormal;
    CashFlowDatarec.Accountno := abs(CashFlowMain[cn]);
    CashFlowDataRec.AccountGroup := DataModuleClient.GetAccountGroup(CashFlowDatarec.Accountno);
    CashFlowDataRec.FormatImage := REPORTROUNDCURRENCY;
//    ReportDataRec.Symbol := '';
    // These are the balance sheet accounts
    // so we get any opening balance which is the day before the current plan dat
    if (CashFlowDataRec.AccountNo <= EQUITY) and (CashFlowDataRec.AccountNo >= FIRSTBALANCESHEET) then
      begin
      HasPriorBalance := False;
      if CashFlowDatarec.Accountno <> BANK_OVERDRAFT then
        DataCollect.getPlanBalanceonDateEx(Dept_id, (psdate - 1), CashFlowDataRec.AccountNo, CashflowDataRec.OpeningBalance, HasPriorBalance)
      else
        CashflowDataRec.OpeningBalance := 0;
      CashFlowDataRec.DiskBalance := CashflowDataRec.OpeningBalance;
      if HasPriorBalance then
        CashflowDataRec.InitialBalance := False
      else
        CashflowDataRec.InitialBalance := True;
      end;
    if not DataCollect.LocateAccountTitle(abs(CashFlowMain[cn])) then
      begin
      CashFlowDatarec.AccountTitle := '';
//      ShowMessage('No account for - ' + inttostr(CashFlowMain[cn]));
      end
    else
      begin
			CashflowDataRec.AccountTitle := DataModuleClient.AccountDetailsACCOUNT_TITLE.AsString;
        if DATAMODULECLIENT.AccountDetailsNON_CASH.Value <> 0 then
          CashflowDataRec.Noncash := True
        else
          CashflowDataRec.Noncash := False;
        if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.Value <> 0 then
          CashflowDataRec.WagesAcc := True
        else
          CashflowDataRec.WagesAcc := False;
        if DATAMODULECLIENT.AccountDetailsINTEREST_ACCOUNT.Value <> 0 then
          CashflowDataRec.InterestAcc := true
        else
          CashflowDataRec.InterestAcc := False;
      end;
    FillChar(CashflowDataRec.PlanDetail, Sizeof(TDetailedBalArray), #0);

    if not DataCollect.getBalances(CashflowDataRec.PlanDetail, abs(CashFlowMain[cn]), True, consolType) then
      CashFlowDataRec.PlanTotal := 0
    else
      begin
      CashFlowDataRec.PlanTotal := DataCollect.GetTotalBalance(
        CashflowDataRec.PlanDetail,
        double(psdate),
        double(psdate),
        double(pedate));
      move(CashFlowDataRec.PlanDetail, CashFlowDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
      end;
    if (CashflowDataRec.Accountno >= CASH_AT_BANK) and (CashflowDataRec.Accountno <= EQUITY) then
      begin
      if (CashflowDataRec.OpeningBalance <> 0) and (CashflowDataRec.PlanTotal = 0) then
        begin
        for I := 0 to Daysbetween(psdate, pedate) do    // Iterate
          CashflowDataRec.PlanDetail[I] := CashflowDataRec.OpeningBalance;
        end;
      end;
    if CashflowDataRec.Accountno = BANK_OVERDRAFT then
      begin
      FillChar(CashflowDataRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
      CashflowDataRec.OpeningBalance := 0;
      end;
    CashFlowDataList.Add(CashFlowDataRec);
    end;
//  CalculateReportData;
end;

procedure TCashFlowEngine.SaveCashFlowData;
begin
  setCashFlowData;
end;

function TCashFlowEngine.IsAccountSaved(Accountno: Integer): Boolean;
var
  I: Integer;
begin
  result := True;
  for I := 0 to CASHFLOWLISTSIZE - 1 do    // Iterate
    begin
    if (abs(CashFlowMain[i]) = Accountno)  and (CashFlowMain[i] < 0) then
      begin
      Result := False;
      break;
      end;
    end;    // for
end;

procedure TCashFlowEngine.setCashFlowData;
var
  cn : integer;
//  d, m, y : Word;
  CashFlowDataRec : TCashFlowRecPtr;
//  tempdate : TDateTime;
//  tempbal : Currency;
begin
  for cn := 0 to CashFlowDataList.count - 1 do
    begin
    CashFlowDataRec := CashFlowDataList.items[cn];
    // we have possibly an opening balance to store
    if CashFlowDataRec.AccountNo <= EQUITY then
      begin
      if CashFlowDatarec.InitialBalance OR (CashFlowDataRec.OpeningBalance <> CashFlowDataRec.DiskBalance) then // store it
        DataCollect.SetPlanBalanceonDateEx(Dept_Id, (psdate - 1), CashFlowDataRec.Accountno, CashflowDataRec.OpeningBalance);
      end;
    if (IsAccountSaved(CashFlowDataRec.Accountno)) and (CompareMem(pointer(@CashFlowDataRec.PlanDetail), Pointer(@CashFlowDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False) then
      begin
{      tempdate := psdate - 1;
      i := DayofTheYear(psdate);
      i := DayOfTheYear(tempdate);
      if (CashFlowDataRec.Accountno = CASH_AT_BANK) then
        begin
        for i := 0 to 365 do
          begin
          tempdate := psdate + i;
          decodeDate(tempdate, y, m, d);
          tempbal := m * 100 + d;
          CashFlowDataRec.PlanDetail[i] := m * 100 + d;
          end;
        end;
 }
      DataCollect.setBalances(CashFlowDataRec.PlanDetail, Dept_Id, CashFlowDatarec.Accountno, True);
      move(CashFlowDataRec.PlanDetail, CashFlowDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
      end;
    end;
end;

function TCashFlowEngine.GetCashFlowAccountIndex(accountNo : Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to CashFlowDataList.Count - 1 do    // Iterate
    begin
    if TCashFlowRecPtr(CashFlowDataList.Items[I]).Accountno = AccountNo then
      Result := I;
  end;    // for
end;

{ ---------------------------------------------------------------------------- }
{ -- clearCashFlowDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TCashFlowEngine.clearCashFlowDataList;
var
  index: integer;
  CashFlowDataRec: TCashFlowRecPtr;
begin
  if CashFlowLoaded then
    begin
    for index := 0 to CashFlowDataList.Count - 1 do
      begin
      CashFlowDataRec := TCashFlowRecPtr(CashFlowDataList.Items[index]);
      dispose(CashFlowDataRec);
//      PlanDataList.Delete(index);
      end;
    CashFlowDataList.clear;
//    PlandataList.free;
    end;
  CashFlowLoaded := False;
end;

{function TCashFlowEngine.totalBalanceArray(const balances: array of currency): currency;
var
  balIndex: integer;
begin
  result := 0;
  for balIndex := 0 to PeriodCount -1 do
    result  := result + balances[balIndex];
end;
}

// MonthFrom , MonthTo are zerobased, Moving average and Opening balance and Var for array
procedure TCashFlowEngine.calculateBSDays(monthFrom, MonthTo: integer; CFType : TCashFlowType);
var
  monthNum, mths, moveavg: integer;
  daysInMonth: TDateTime;
  temp, OpeningBal: currency;
  BSAccountRec : TCashFlowRecPtr;
  BSDaysRec : TCashFlowRecPtr;
  CFInputRec : TCashFlowRecPtr;
  CFOutputRec : TCashFlowRecPtr;
begin
// All these types calculate Days outstanding based on a default of 2 months of "Input" averaged
// against the current period Balance
  BSAccountRec := Nil;
  BSDaysRec := Nil;
  CFInputRec := Nil;
  CFOutputRec := Nil;
  moveavg := 0;
  case CFType of    //
    cfReceivables:
      begin
      BSAccountRec := ARDataRec;
      BSDaysRec := AR_DaysRec;
      CFInputRec := GrossSalesRec;
      CFOutputRec := ARCashReceiptsRec;
      Moveavg := ARMoveavg;
      end;
    cfPayables:
      begin
      BSAccountRec := APDataRec;
      BSDaysRec := AP_DaysRec;
      CFInputRec := TotalInvoicesAPRec;
      CFOutputRec := CashPaymentsAPRec;
      moveAvg := APMoveavg;
      end;
    cfAccruedExpenses:
      begin
      BSAccountRec := AEDataRec;
      BSDaysRec := AE_DAysRec;
      CFInputRec := GrossExpensesAccruedRec;
      CFOutputRec := CashPaymentsAERec;
      Moveavg := AEMoveAvg;
      end;
  end;    // case

  if Moveavg = 0 then // default
    Moveavg := 2;
  // Zero the days o/s as were about to re-calculate it
  for monthNum := monthFrom to MonthTo do
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

      DataCollect.roundCurrency(BSDaysRec.planSummary[monthNum], 6);
      end;
    end;
  BuildBSDetail(BSDaysRec);
end;

procedure TCashFlowEngine.defineBSDays(cfType : TCashFlowType);
var
  I: Integer;
  defDays, totDaysOS, totSalesInv: currency;
  curMonth: integer;
  daysInMonth: TDateTime;
  BSAccountRec : TCashFlowRecPtr;
  BSDaysRec : TCashFlowRecPtr;
  CFInputRec : TCashFlowRecPtr;
//  CFOutputRec : TCashFlowRecPtr;
begin
  BSAccountRec := Nil;
  BSDaysRec := Nil;
  CFInputRec := Nil;
//  CFOutputRec := Nil;
  case CFType of    //
    cfReceivables:
      begin
      BSAccountRec := ARDataRec;
      BSDaysRec := AR_DaysRec;
      CFInputRec := GrossSalesRec;
//      CFOutputRec := ARCashReceiptsRec;
      end;
    cfPayables:
      begin
      BSAccountRec := APDataRec;
      BSDaysRec := AP_DaysRec;
      CFInputRec := TotalInvoicesAPRec;
//      CFOutputRec := CashPaymentsAPRec;
      end;
    cfAccruedExpenses:
      begin
      BSAccountRec := AEDataRec;
      BSDaysRec := AE_DAysRec;
      CFInputRec := GrossExpensesAccruedRec;
//      CFOutputRec := CashPaymentsAERec;
      end;
  end;    // case

  // Total the number of days + invoices
  totDaysOS := 0;
  totSalesInv := 0;
  for I := 0 to Cashfe.PeriodCount - 1 do    // Iterate
    begin
    TotDaysOS := TotDaysOS + BSDaysRec.PlanSummary[i];
    TotSalesInv := TotSalesInv + CFInputRec.PlanSummary[i];
    end;    // for
  // If there are no days but there is an opening balance, calculate
  // default days
  if (totDaysOS = 0) and (BSAccountRec.OpeningBalance <> 0) then
    begin
    daysInMonth := Trunc(pedate) - trunc(psdate) + 1;
    if totSalesInv <> 0 then
      defDays := BSAccountRec.OpeningBalance * daysInMonth / totSalesInv
    else
      defDays := 0;

    DataCollect.roundCurrency(defDays, 6);
    BSDaysRec.PlanTotal := 0;
    for curMonth := 0 to PeriodCount - 1 do
      begin
      BSDaysRec.PlanSummary[curMonth] := defDays;
      BSDaysRec.PlanTotal := BSDaysRec.PlanTotal + BSDaysRec.PlanSummary[curMonth];
      if BSDaysRec.PlanSummary[curMonth] <> 0 then
        calculateBSBalance(curMonth, cfType);
      end;
    BuildBSDetail(BSDaysRec);
    end;
end;

procedure TCashFlowEngine.calculateBSBalance(month: integer; cfType : TCashFlowType);
var
  mths, moveavg: integer;
  temp: currency;
  daysInMonth: TDateTime;
  OpeningBal : Currency;
  BSAccountRec : TCashFlowRecPtr;
  BSDaysRec : TCashFlowRecPtr;
  CFInputRec : TCashFlowRecPtr;
  CFOutputRec : TCashFlowRecPtr;
  CFAdjustRec : TCashFlowRecPtr;
//  CFNCAdjustRec : TCashFlowRecPtr; // to be used for non cash adjustment
begin
  BSAccountRec := Nil;
  BSDaysRec := Nil;
  CFInputRec := Nil;
  CFOutputRec := Nil;
  CFAdjustRec := Nil;
  moveavg := 0;
  case CFType of    //
    cfReceivables:
      begin
      BSAccountRec := ARDataRec;
      BSDaysRec := AR_DaysRec;
      CFInputRec := GrossSalesRec;
      CFOutputRec := ARCashReceiptsRec;
      CFAdjustRec := ARAdjustmentsRec;
      moveAvg := ARMoveavg;
      end;
    cfPayables:
      begin
      BSAccountRec := APDataRec;
      BSDaysRec := AP_DaysRec;
      CFInputRec := TotalInvoicesAPRec;
      CFOutputRec := CashPaymentsAPRec;
      CFAdjustRec := APAdjustmentsRec;
      moveAvg := APMoveavg;
      end;
    cfAccruedExpenses:
      begin
      BSAccountRec := AEDataRec;
      BSDaysRec := AE_DAysRec;
      CFInputRec := GrossExpensesAccruedRec;
      CFOutputRec := CashPaymentsAERec;
      CFAdjustRec := AEAdjustmentsRec;
      Moveavg := AEMoveavg;
      end;
  end;    // case
  // If there are days  then use that to calculate the balance
  if Month = 0 then
    OpeningBal := BSAccountRec.OpeningBalance
  else
    OpeningBal := BSAccountRec.planSummary[month - 1];

  if BSDaysRec.PlanSummary[month] <> 0 then
    begin
    Mths := Month - moveAvg;
    if Mths < 0 then
      DaysInMonth := SummaryPeriodIndexArray[Month] + 1
    else
      DaysInMonth := SummaryPeriodIndexArray[Month] - SummaryPeriodIndexArray[Mths] + 1;
    mths := Month;
    temp := 0;
    while (Mths >= 0) and ((Month - mths) < moveavg) do
      begin
      temp := temp + CFInputRec.planSummary[mths];
      dec(mths);
      end;    // while

    if (daysInMonth <> 0) and (temp <> 0) then
      begin
      BSAccountRec.PlanSummary[month] := (BSDaysRec.PlanSummary[month] * temp) / daysInMonth;
      DataCollect.roundCurrency(BSAccountRec.PlanSummary[month], 0);
      CFOutputRec.PlanSummary[month] := OpeningBal
                                      + CFInputRec.PlanSummary[month]
                                      - BSAccountRec.PlanSummary[month];
{
      if CFOutputRec.PlanSummary[month] > (OpeningBal + CFInputRec.PlanSummary[month]) then
        begin
        CFOutputRec.PlanSummary[month] := OpeningBal + CFInputRec.PlanSummary[month];
        BSAccountRec.PlanSummary[month] := 0;
        end;
}
      DataCollect.roundCurrency(CFOutputRec.PlanSummary[month], 0);
      end;

    temp := CFInputRec.PlanSummary[month] + OpeningBal;
    if (temp > 0) and (temp < CFOutputRec.PlanSummary[month]) then
      CFOutputRec.PlanSummary[month] := temp;
    if (CFOutputRec.PlanSummary[month] < 0) then
      CFOutputRec.PlanSummary[month] := 0;

    BSAccountRec.PLanSummary[month] := OpeningBal
                                       + CFInputRec.PlanSummary[month]
                                       - CFOutputRec.PlanSummary[month]
                                       - CFAdjustRec.PlanSummary[Month];

{
    if temp < BSAccountRec.PlanSummary[month] then
      BSAccountRec.PlanSummary[month] := temp;

    CFOutputRec.PlanSummary[month] := OpeningBal
                                      + CFInputRec.PlanSummary[month]
                                      - BSAccountRec.PlanSummary[month];
//                                      - CFAdjustRec.PlanSummary[Month];
}
    end
  else
    begin
    CFOutputRec.PlanSummary[month] := OpeningBal + CFInputRec.PlanSummary[month];
    BSAccountRec.PlanSummary[month] := 0;
    end;
end;

{ ---------------------------------------------------------------------------- }
{ -- calculateStockturn - Calculate balances for stockturns, opening balance    }
{                        and stock delivery                                    }
{ ---------------------------------------------------------------------------- }
procedure TCashFlowEngine.calculateStockturn(monthFrom, MonthTo: integer);
var
  monthNum, mths: integer;
  daysInMonth: TDateTime;
  temp: currency;
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
  if StockMoveAvg = 0 then
    StockMoveavg := 2;
  for monthNum := monthFrom to MonthTo do
    begin
    if Monthnum = 0 then
      OpeningBal := STOCKDataRec.OpeningBalance
    else
      OpeningBal := STOCKDataRec.PLanSummary[MonthNum - 1];

    // Work out the closing balance for the month
    temp := abs(OpeningBal) - abs(STOCKSoldRec.PlanSummary[monthNum]);

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
    if STOCKDataRec.PlanSummary[monthNum] <> 0 then
      if temp <> 0 then
        STOCK_DaysRec.PlanSummary[monthNum] := STOCKDataRec.PLanSummary[monthNum] * daysInMonth / temp
      else
        STOCK_DaysRec.PlanSummary[monthNum] := 0;
  //end;
    // Calculate Stockturns here
    if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) and (STOCK_DaysRec.PlanSummary[monthNum] <> 0) then
      STOCK_DaysRec.PlanSummary[monthNum] := 365 / STOCK_DaysRec.PlanSummary[monthNum];

    if STOCKDataRec.PLanSummary[monthNum] = 0 then
      STOCK_DaysRec.PlanSummary[monthNum] := 0;

    DataCollect.roundCurrency(STOCK_DaysRec.PlanSummary[monthNum], 6);
    end;
end;

{ ---------------------------------------------------------------------------- }
{ -- defineStockturn - Called when setting the opening balance figure. If there}
{                      is no stockturn calculate the default based on the OPBal}
{ ---------------------------------------------------------------------------- }
procedure TCashFlowEngine.defineStockturn;
var
  I : Integer;
  defDays, totStockturns, totCOGS: currency;
  curMonth: integer;
  daysInMonth: TDateTime;
//  OpeningBal : currency;
begin
  // Total the number of stockturns
  totStockTurns := 0;
  totCOGS := 0;
  for I := 0 to Cashfe.PeriodCount - 1 do    // Iterate
    begin
    totStockturns := totStockturns + STOCK_DaysRec.PlanSummary[i];
    totCOGS := totCOGS + STOCKSoldRec.PlanSummary[i];
    end;    // for
  // If there are no stickturns but there is an opening balance, calculate
  // default stockturns
  if (totStockturns = 0) and (STOCKDataRec.OpeningBalance <> 0) then
    begin
    daysInMonth := SummaryPeriodIndexArray[PeriodCount - 1];

    if totCOGS <> 0 then
      DefDays := STOCKDataRec.OpeningBalance * daysInMonth / totCogs
    else
      defDays := 0;
    // Calculate Stockturns here
    if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) and (defDays <> 0) then
      DefDays := 365 / DefDays;

    DataCollect.roundCurrency(defDays, 6);

    for curMonth := 0 to PeriodCount - 1 do
      begin
      STOCK_DaysRec.PlanSummary[Curmonth] := defDays;
      STOCK_DaysRec.PlanTotal := STOCK_DaysRec.PlanTotal + STOCK_DaysRec.PlanSummary[curMonth];
      calculateStockBalances(curMonth);
      end;
    BuildBSDetail(STOCK_DaysRec);
    end;
end;

{ ---------------------------------------------------------------------------- }
{ -- calculateBalances - Calculate the closing balance from the stockturn    }
{                          for the passed month                                }
{ ---------------------------------------------------------------------------- }
procedure TCashFlowEngine.calculateStockBalances(month: integer);
var
  mths: integer;
  temp, tempDays: currency;
  daysInMonth: TDateTime;
//  STOCKDataRec : TCashFlowRecPtr;
//  STOCKDaysRec : TCashFlowRecPtr;
//  STOCKTotalInvRec : TCashFlowRecPtr;
//  STOCKTotalRecRec : TCashFlowRecPtr;
//  STOCKAdjustment : TCashFlowRecPtr;
  OpeningBal : currency;
begin
// This should be used for stock adjustments but we don't see how yet!
//  STOCKAdjustment := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(ST_ADJUSTMENTS)]);

  if Month = 0 then
    OpeningBal := STOCKDataRec.OpeningBalance
  else
    OpeningBal := STOCKDataRec.PLanSummary[Month - 1];

  // If there is a stockturn then use that to calculate the balance
  if STOCK_DaysRec.PLanSummary[month] <> 0 then
    begin
    // Convert StockTurns into Days OS
    if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) then
      tempDays := 365 / STOCK_DaysRec.PLanSummary[month]
    else
      tempDays := STOCK_DaysRec.PLanSummary[month];
    // Add up all the cost of goods
    mths := 0;
    temp := 0;
    daysInMonth := 0;
    while( (month + mths) < PeriodCount) and (mths < StockmoveAvg) do
      begin
      // Add up all the cost of goods
      temp := temp + STOCKSoldRec.PlanSummary[Month + mths];
      // this is incremented here to ensure we get the right maximum - not very efficient.
      daysInMonth := SummaryPeriodIndexArray[Month + mths];
      inc(mths);
      end;
    if Month > 0 then
      daysInMonth := DaysInMonth - SummaryPeriodIndexArray[Month - 1];

// jm 22.05.98 replace with the above
//    for curMonth := month+1 to NumberOfMonths do
//      temp := temp + mCostofGoods[curMonth];

    if (daysInMonth <> 0) and (temp <> 0) then
      begin
      STOCKDataRec.PLanSummary[month] := tempDays * temp / daysInMonth;
      DataCollect.roundCurrency(STOCKDataRec.PLanSummary[month], 0);
      STOCKDeliveriesRec.PlanSummary[month] := STOCKDataRec.PLanSummary[month]
                                             + STOCKSoldRec.PlanSummary[month]
                                             - STAdjustmentsRec.PlanSummary[month]
                                             - OpeningBal;
      end;
    temp := STOCKSoldRec.PlanSummary[month] - OpeningBal;

    if (temp > 0) and (temp > STOCKDeliveriesRec.PlanSummary[month]) then
      STOCKDeliveriesRec.PlanSummary[month] := temp;

    STOCKDataRec.PLanSummary[month] := OpeningBal
                                       - STOCKSoldRec.PlanSummary[month]
                                       + STOCKDeliveriesRec.PlanSummary[month]
                                       - STAdjustmentsRec.PlanSummary[month];

// Very suspicious, 25.05.98 Should now be OK. STOCKDataRec.PLanSummary[month]
//    STOCKDeliveriesRec.PlanSummary[month] := STOCKDataRec.PLanSummary[month]
//                                             + STOCKSoldRec.PlanSummary[month]
//                                             - STOCKAdjustment.PlanSummary[month]
//                                             - OpeningBal;
    end
  else
    begin
    STOCKDeliveriesRec.PlanSummary[month] := STOCKSoldRec.PlanSummary[month];
    STOCKDataRec.PLanSummary[month] := 0;
    end;
  DataCollect.roundCurrency(STOCKDeliveriesRec.PlanSummary[month], 0);
  DataCollect.roundCurrency(STOCKDataRec.PLanSummary[month], 0);
end;

procedure TCashFlowEngine.ProcessIncomeTaxDividend;
var
  I : Integer;
  LossesFwd, TaxRate, DivRate, MinDiv, MaxDiv : Currency;
  DailyMin, DailyMax : extended;
  temp, PeriodDiv, Taxableinc : Currency;
  YtdDiv, YTDTax, YtdNP, SBDivMin, SBDivMax, SBPC : Currency;
  PreviousBalance : Boolean;
begin
  DataCollect.getPlanBalanceonDateEx(Dept_ID, psdate - 1, TAX_LOSSES, Lossesfwd, previousBalance);
  TaxRate := DataCollect.GetUserOption(OINCOMETAXRATE, UOCurrency);
  DivRate := DataCollect.GetUserOption(ODIVIDENDRATE, UOCurrency);
  MinDiv := DataCollect.GetUserOption(OMINDIVIDEND, UOCurrency);
  MaxDiv := DataCollect.GetUserOption(OMAXDIVIDEND, UOCurrency);
  temp := trunc(peDate) - trunc(psDate) + 1; // days in year
  // We use IncTaxIncurredRec for Accruing Tax
  // We use DividendDeclaredRec for accruing Dividend
  FillChar(IncTaxIncurredRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(DividendDeclaredRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  IncTaxIncurredRec.OpeningBalance := 0;
  DividendDeclaredRec.OpeningBalance := 0;
  // Each Days tax will be calcculated based on Losses forward and
  DailyMin := 0;
  DailyMax := 0;
  YTDNP := 0;
  YTDTax := 0;
  YTDDiv := 0;
  if MinDiv > 0 then
    DailyMin := MinDiv / temp;
  if MaxDiv > 0 then
    DailyMax := MaxDiv / temp;
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if NPRec.PlanDetail[I] > 0 then
      begin
      // do we have a taxable income after losses
      if LossesFwd >= NPRec.PlanDetail[I] then
        Begin
        LossesFwd := LossesFwd - NPRec.PlanDetail[I];
        IncTaxIncurredRec.PlanDetail[I] := 0;
        end
      else
        begin
        Taxableinc := NPRec.PlanDetail[I] - LossesFwd;
        LossesFwd := 0;
        IncTaxIncurredRec.PlanDetail[I] := Round((TaxableInc * TaxRate) / 100);
        end;
      end
    else
      LossesFwd := LossesFwd - NPRec.PlanDetail[I];
    // If we have losses forward, then save then
    if LossesFwd > 0 then
      DataCollect.SetPlanBalanceonDateEx(Dept_ID, pedate, TAX_LOSSES, temp);
    // Must be smart ro get
    NPAfterTax[I] := NPRec.PlanDetail[I] - IncTaxIncurredRec.PlanDetail[I];
    YtdTax := YTDTax + IncTaxIncurredRec.PlanDetail[I];
    // What is the YTD Profit after Tax  // If negative
    YtdNP := YTDNP + NPRec.PlanDetail[I];
    // now for Mr Dividend
    if YtdNP  > 0 then
      NetProfitAfterTax := YTDNP - YTDTAX - Lossesfwd
    else
      NetProfitAfterTax := 0;
    // How much should we have YTD based on Min, Max and then %
    SBDivMin := 0;
    SBDivMax := 0;
    if DailyMin > 0 then
      SBDivMin := Trunc(DailyMin * (I + 1));
    if DailyMax > 0 then
      SBDivMax := Trunc(DailyMax * (I + 1));
    // Maintain a minumum
    if (SBDIVMin > 0) and (YTDDiv < SBDivMin) then // Includes when No DivRate or No Profit
      PeriodDiv := Round(SBDivMin - YTDDiv)
    else
      PeriodDiv := 0;
    if (DivRate > 0) and (YTDNP > 0) then
      begin
      SBPC := Trunc((NetProfitAfterTax * DivRate) / 100);
      // Max is a limiter
      if (SBDivMax > 0) and (SBDivMax < SBPC) then
        SBPC := SBDivMax;
      DividendDeclaredRec.PlanDetail[I] := round(SBPC - YTDDiv); // DivDataRec.OpeningBalance + SBPC;
      end;
    if DividendDeclaredRec.PlanDetail[I] < PeriodDiv then
      DividendDeclaredRec.PlanDetail[I] := PeriodDiv;
    YtdDiv := YTDDiv + DividendDeclaredRec.PlanDetail[I];
    end;    // for
end;

procedure TCashFlowEngine.ProcessExpenses;
var
  I, J: Integer;
  BSAccountRec : TCashFlowRecPtr;
  ExpAccountRec : TDetailedBalArray;
//  AccumulatedAdjustment : Currency;
  Taxamount, acctotal : Currency;
  BSAccountNo : integer;
//  ATitle : string;
begin
  // initialise
  FillChar(ExpensesViaAPRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(TotalExpensesRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(TaxExpensesAPRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(GrossExpviaAPRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(ExpensesAERec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(TaxExpensesAERec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(GrossExpensesAccruedRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(AR_WriteOffRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(ST_WriteOffRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  FillChar(DADepreciation, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashInterest, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashCMF, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashMSec, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashOAssets, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashNDAssets, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashIntAssets, Sizeof(TDetailedBalArray), #0);
  FillChar(NonCashOLiab, Sizeof(TDetailedBalArray), #0);
  FillChar(PNLInterest, Sizeof(TDetailedBalArray), #0);

  DataModuleClient.ExpAccounts.First;
  while DataModuleClient.ExpAccounts.Eof = False do
    begin
//    atitle :=  inttostr(DataModuleClient.ExpAccountsACCOUNT_NUMBER.Value);
    if DataModuleClient.ExpAccountsNON_CASH.value > 0 then
      begin
      // we must have a BS account to update
      BSaccountNo := DataModuleClient.Dept_AccountsBALANCE_SHEET_ACCOUNT.value;
      if BSAccountNo = 0 then
        messagedlg('Expense Account (' + DataModuleClient.ExpAccountsACCOUNT_TITLE.AsString + ') is flagged as ''Non Cash'','
        + #13#10 + 'however no Balance Sheet account has been assigned.'
        + #13#10 + 'There may be a discrepancy between the Profit and Loss'
        + #13#10 + 'and Balance Sheet until this rectfied.'
				+ #13#10 + 'Goto ''Setup'' to correct this problem.' , mtWarning, [mbOK], 0)
      else
        begin
        if BSAccountNo = ACCOUNT_REC then
          BSAccountNo := AR_WRITEOFF;
        if BSAccountNo = STOCK then
          BSAccountNo := ST_WRITEOFF;
      // Loan Interest payments shoudl be flagged as Non Cash and credited against Loans
        BSAccountRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(BSAccountNo)]);
        if DataCollect.getbalances(ExpAccountRec, DataModuleClient.ExpAccountsACCOUNT_NUMBER.Value, True, ctCashFlow) then
          begin
          for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
            TotalExpensesRec.PlanDetail[I] := TotalExpensesRec.PlanDetail[I] + ExpAccountRec[I];
           case BSAccountNo of    //
            CASH_MAN_FUND:        for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashCMF[J] := NonCashCMF[J] + ExpAccountRec[J];
            MARKETSEC:            for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashMSec[J] := NonCashMSec[J] + ExpAccountRec[J];
            OTHER_CURRENT_ASSETS: for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashOAssets[J] := NonCashOAssets[J] + ExpAccountRec[J];
            NON_DEP_ASSETS:       for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashNDAssets[J] := NonCashNDAssets[J] + ExpAccountRec[J];
            DEP_ASSETS:           for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    DADepreciation[J] := DADepreciation[J] + ExpAccountRec[J];
            INTANG_ASSETS:        for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashIntAssets[J] := NonCashIntAssets[J] + ExpAccountRec[J];
            OTHER_CURRENT_LIAB:   for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashOLiab[J] := NonCashOLiab[J] + ExpAccountRec[J];
            LOANS:                for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
                                    NonCashInterest[J] := NonCashInterest[J] + ExpAccountRec[J];
           else
            for J := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
              BSAccountRec.Plandetail[J] := BSAccountRec.Plandetail[J] + ExpAccountRec[J];
           end;
          end;
        end;
      end
    else
    if DataModuleClient.Dept_AccountsPAID_VIA_AP.Value > 0 then // accumulate and calc tax for AP
      begin
      if DataCollect.getbalances(ExpAccountRec, DataModuleClient.ExpAccountsACCOUNT_NUMBER.Value, True, ctCashFlow) then
        begin
        for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
          begin
          // calc and add tax to AP expenses tax
          Taxamount := 0;
          if DataModuleClient.Dept_AccountsTAX_RATE.Value > 0 then
            taxAmount := Round(ExpAccountrec[I] * DataModuleClient.Dept_AccountsTAX_RATE.Value) / 100;
          if DataModuleClient.ExpAccountsINTEREST_ACCOUNT.Value > 0 then
            PNLInterest[i] := PNLInterest[I] + ExpAccountRec[I];
          // add to net and calc Gross value, day by day
          ExpensesViaAPRec.PlanDetail[i] := ExpensesViaAPRec.PlanDetail[i] + ExpaccountRec[i];
          TaxExpensesAPRec.PlanDetail[I] := TaxExpensesAPRec.PlanDetail[I] + Taxamount;
          GrossExpviaAPRec.PlanDetail[i] := ExpensesViaAPRec.PlanDetail[i] + TaxExpensesAPRec.PlanDetail[I];
          TotalExpensesRec.PlanDetail[I] := TotalExpensesRec.PlanDetail[I] + ExpAccountRec[I];
          end;
        end;    // for
      end
    else // catch all else
      begin
      if DataCollect.getbalances(ExpAccountRec, DataModuleClient.ExpAccountsACCOUNT_NUMBER.Value, True, ctCashFlow) then
        begin
        acctotal := 0;
        for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
          begin
          Acctotal := acctotal + ExpaccountRec[i];
          // calc and add tax to AP expenses tax
          Taxamount := 0;
          if DataModuleClient.Dept_AccountsTAX_RATE.Value > 0 then
            taxAmount := round(ExpAccountrec[I] * DataModuleClient.Dept_AccountsTAX_RATE.Value) / 100;
          if DataModuleClient.ExpAccountsINTEREST_ACCOUNT.Value > 0 then
            PNLInterest[i] := PNLInterest[I] + ExpAccountRec[I];
          // add to net and calc Gross value, day by day
          ExpensesAERec.PlanDetail[i] := ExpensesAERec.PlanDetail[i] + ExpaccountRec[i];
          TaxExpensesAERec.PlanDetail[I] := TaxExpensesAERec.PlanDetail[I] + Taxamount;
          GrossExpensesAccruedRec.PlanDetail[i] := ExpensesAERec.PlanDetail[i] + TaxExpensesAERec.PlanDetail[I];
          TotalExpensesRec.PlanDetail[I] := TotalExpensesRec.PlanDetail[I] + ExpAccountRec[I];
          end;
        end;    // for
      end;
    DataModuleClient.ExpAccounts.next;
    end;    // while
  // Ensure COGS is correct
  // Get GROSSPROFIT
//  if DataCollect.getbalances(ExpAccountRec, GROSSPROFIT, True, ctNormal) then
//    begin
//    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
//      StockSoldRec.PlanDetail[I] := SalesRec.PlanDetail[i] - ExpAccountRec[i] - SubcontractorsRec.Plandetail[i];
//    end;
//  DataCollect.RoundArray(TaxExpensesAERec.PlanDetail, psdate, pedate);
//  DataCollect.RoundArray(GrossExpensesAccruedRec.PlanDetail, psdate, pedate);
//  DataCollect.RoundArray(TaxExpensesAPRec.PlanDetail, psdate, pedate);
//  DataCollect.RoundArray(GrossExpviaAPRec.PlanDetail, psdate, pedate);
  BuildSummary(TaxExpensesAERec.Accountno, psdate, pedate, TaxExpensesAERec.PlanDetail, TaxExpensesAERec^.PlanSummary);
  BuildSummary(GrossExpensesAccruedRec.Accountno, psdate, pedate, GrossExpensesAccruedRec.PlanDetail, GrossExpensesAccruedRec^.PlanSummary);
  BuildSummary(TaxExpensesAPRec.Accountno, psdate, pedate, TaxExpensesAPRec.PlanDetail, TaxExpensesAPRec^.PlanSummary);
  BuildSummary(GrossExpviaAPRec.Accountno, psdate, pedate, GrossExpviaAPRec.PlanDetail, GrossExpviaAPRec^.PlanSummary);
  BuildSummary(AR_WriteOffRec.Accountno, psdate, pedate, AR_WriteOffRec.PlanDetail, AR_WriteOffRec^.planSummary);
  BuildSummary(ST_WriteOffRec.Accountno, psdate, pedate, ST_WriteOffRec.PlanDetail, ST_WriteOffRec^.planSummary);
end;

procedure TCashFlowEngine.ProcessJournalstoAdjustments;
var
  CFRecPtr : TCashFlowRecPtr;
//  BSAccountRecPtr : TCashFlowRecPtr;
  BSAccount : Integer;
  DayOffset : Integer;
  varg : Variant;
  PostAmount : Currency;
  FoundEquity, FoundTaxDiv : Boolean;
begin
  // We Initialise All Posting Accounts except for Bank, AR, Stock, AP AE, Tax, INC and DIV.
  // as these will be done separately.
  DataModuleClient.BSAccounts.First;
  while DataModuleClient.BSAccounts.Eof = False do
    begin
    if Not DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.IsNull then
      begin
      CFRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.Value)]);
      FillChar(CFRecPtr.PlanDetail, Sizeof(TDetailedBalArray), #0);
      end;
    if (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> ACCOUNT_REC)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> STOCK)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> ACCOUNT_PAY)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> ACCRUED_EXPENSES)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> TAX_PAYABLE)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> INC_TAX_PAYABLE)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> DIVIDENDS_PAYABLE)
      and (Not DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.IsNull) then
      begin
      CFRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.Value)]);
      FillChar(CFRecPtr.PlanDetail, Sizeof(TDetailedBalArray), #0);
      end;
    DataModuleClient.BSAccounts.Next;
    end;    // while
  DatamoduleClient.SetJournalFilter(Dept_id, Psdate, Pedate);
  DataModuleClient.JournalTbl.First;
  while DataModuleClient.JournalTbl.Eof = False do
    begin
    // Check to see is this journal is between equity and (IncTax or Dividend) then the equity post
    // is zero because we want the EquityInjected / withdrawn to be cash in or out only.
    // tax and dividend are both automatic and by journals and accumulative
    // Equity shown on the CashFlow window is calculated as a net result from Assets and Liabilities
    DataModuleClient.JrnlEntries.First;
    FoundEquity := False;
    FoundTaxDiv := False;
    while DataModuleClient.JrnlEntries.Eof = False do
      begin
      if DataModuleClient.JrnlEntriesACCOUNT_NO.Value = EQUITY then
        FoundEquity := True;
      if (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = INC_TAX_PAYABLE) or (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = DIVIDENDS_PAYABLE) then
        FoundTaxDiv := True;
      DataModuleClient.JrnlEntries.Next;
      end;

    DataModuleClient.JrnlEntries.First;
    while DataModuleClient.JrnlEntries.Eof = False do
      begin
      if DataModuleClient.JrnlEntriesACCOUNT_NO.Value <> CASH_AT_BANK then
        begin
        varg := DataModuleClient.JrnlEntriesACCOUNT_NO.Value;
        if DataModuleClient.BSAccounts.Locate('ACCOUNT_NUMBER', varg, []) then
          begin
          if DataModuleClient.JrnlEntriesDR_AMOUNT.Value > 0 then
            begin
            BSAccount := DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.Value;
            PostAmount := DataModuleClient.JrnlEntriesDR_AMOUNT.Value;
            // all adjustments to increase these accounts are negative Cash Receipts
            if (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = ACCOUNT_REC)
               or (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = STOCK) then
              PostAmount := Postamount * -1;
            if (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = EQUITY) and (FoundEquity) and (FoundTaxDiv) then
              PostAmount := 0;
            end
          else
            begin
            BSAccount := DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.Value;
            PostAmount := DataModuleClient.JrnlEntriesCR_AMOUNT.Value;
            // all adjustments to increase these accounts are negative Cash Payments
            if (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = ACCOUNT_PAY)
              or (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = ACCRUED_EXPENSES)
              or (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = TAX_PAYABLE) then
              PostAmount := Postamount * -1;
            if (DataModuleClient.JrnlEntriesACCOUNT_NO.Value = EQUITY) and (FoundEquity) and (FoundTaxDiv) then
              PostAmount := 0;
            end;
          CFRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(BSAccount)]);
          DayOffset := Trunc(DataModuleClient.JournalTblJNL_DATE.Value - psdate);
          CFRecPtr.PlanDetail[DayOffset] := CFRecPtr.PlanDetail[DayOffset] + Postamount;
          end;
        end;
      DataModuleClient.JrnlEntries.Next;
      end;    // while
    DataModuleClient.JournalTbl.Next;
    end;    // while

// This is posting which is now done in CalculateCash
{
  DataModuleClient.BSAccounts.First;
  while DataModuleClient.BSAccounts.Eof = False do
    begin
    CFRecPtr := nil;
    if Not DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.IsNull then
      begin
      CFRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.Value)]);
      BuildSummary(CFRecPtr.accountNo, True, CFRecPtr.PlanDetail, CFRecPtr^.planSummary);
      end;
    if (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> 1210)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> 1230)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> 1410)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> 1420)
      and (DataModuleClient.BSAccountsACCOUNT_NUMBER.Value <> 1430)
      and (Not DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.IsNull) then
      begin
      CFRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.Value)]);
      BuildSummary(CFRecPtr.accountNo, True, CFRecPtr.PlanDetail, CFRecPtr^.planSummary);
      JrnlUpdateBSBalance(DataModuleClient.BSAccountsACCOUNT_NUMBER.value,
                          DataModuleClient.BSAccountsDR_CASHFLOW_ACCOUNT.value,
                          DataModuleClient.BSAccountsCR_CASHFLOW_ACCOUNT.Value);
      BSAccountRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsACCOUNT_NUMBER.Value)]);
      BuildBSSummary(BSAccountRecPtr);
      end;
    DataModuleClient.BSAccounts.Next;
    end;    // while
}
end;

procedure TCashFlowEngine.JrnlUpdateBSBalance(MainAccount, DRAccount, CRAccount: Integer);
begin
end;

procedure TCashFlowEngine.ProcessAccountsReceivable;
Var
  TaxRateSales : Currency;
  I, K : Integer;
  perstart, perend : TDate;
  OpeningBalance : Currency;
begin
  TaxRateSales := DataCollect.GetUserOption(OTAXRATE_SALES, UOCurrency);
  ARMoveavg := Trunc(DataCollect.GetUserOption(OARDAYSAVERAGE, UOCurrency));
//  FillChar(ARCashReceiptsRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    TAXSalesRec.PlanDetail[i] := 0;
    SalesRec.PlanDetail[I] := round(SalesRec.PlanDetail[I]);
    if TaxRateSales > 0 then
      TAXSalesRec.PlanDetail[i] := SalesRec.PlanDetail[I] * TaxRateSales / 100;
    GrossSalesRec.PlanDetail[I] := SalesRec.PlanDetail[I] + TAXSalesRec.PlanDetail[i];
    end;    // for
  DataCollect.RoundArray(TaxSalesRec.PlanDetail, psdate, pedate);
  DataCollect.RoundArray(GrossSalesRec.PlanDetail, psdate, pedate);
  // buildsummary array for sales
  BuildSummary(ARCashReceiptsRec.accountNo, psdate, pedate, ARCashReceiptsRec.PlanDetail, ARCashReceiptsRec^.planSummary);
  BuildSummary(GrossSalesRec.accountNo, psdate, pedate, GrossSalesRec.PlanDetail, GrossSalesRec^.planSummary);
  BuildBSSummary(ARDataRec);
  AR_DaysRec.Plantotal := 0;
  for I := 0 to PeriodCount - 1 do    // Iterate
    AR_DaysRec.PlanTotal := AR_DaysRec.PlanTotal + AR_DaysRec.PlanSummary[I];
  if (ARDataRec.OpeningBalance <> 0) and (AR_DaysRec.PlanTotal = 0)  then
    defineBSDays(cfReceivables);
  if (ARDataRec.OpeningBalance = 0) and (AR_DaysRec.PlanTotal = 0)  then
    for I := 0 to PeriodCount - 1 do    // Iterate
      begin
      if I = 0 then
        begin
        Perstart := Psdate;
        OpeningBalance := ARDataRec.OpeningBalance
        end
      else
        begin
        Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
        OpeningBalance := ARDataRec.PlanSummary[I - 1];
        end;
      PerEnd := psdate + SummaryPeriodIndexArray[I];

      ARCashReceiptsRec.PlanSummary[I] := OpeningBalance
                                  + GrossSalesRec.PlanSummary[I]
                                  - ARDataRec.PlanSummary[I]
                                  - ARAdjustmentsRec.PlanSummary[I];
{      if ARCashReceiptsRec.PlanSummary[I] > (OpeningBalance + GrossSalesRec.PlanSummary[I] - AR_WriteOffRec.PlanSummary[I] - ARAdjustmentsRec.PlanSummary[I]) then
        begin
        ARDataRec.PlanSummary[I] := 0;
        ARCashReceiptsRec.PlanSummary[I] := OpeningBalance + GrossSalesRec.PlanSummary[I] - AR_WriteOffRec.PlanSummary[I] - ARAdjustmentsRec.PlanSummary[I];
        end;
}
      DataCollect.updateArray(ARCashReceiptsRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  ARCashReceiptsRec.PlanSummary[I],
                  0);
      end;
  // calculate cash receipts and balances
  for I := 0 to PeriodCount - 1 do    // Iterate
    begin
//    roundCurrency(GrossSalesRec.PlanSummary[I], 0);
    if AR_DaysRec.PlanSummary[I] <> 0 then
      calculateBSBalance(I, cfReceivables)
    else
      begin
      if I = 0 then
        OpeningBalance := ARDataRec.OpeningBalance
      else
        OpeningBalance := ARDataRec.PlanSummary[I - 1];
{      if ARCashReceiptsRec.PlanSummary[I] > (OpeningBalance + GrossSalesRec.PlanSummary[I] - AR_WriteOffRec.PlanSummary[I] - ARAdjustmentsRec.PlanSummary[I]) then
        ARCashReceiptsRec.PlanSummary[I] := (OpeningBalance + GrossSalesRec.PlanSummary[I] - AR_WriteOffRec.PlanSummary[I] - ARAdjustmentsRec.PlanSummary[I]);
}
      ARDataRec.PlanSummary[I] := OpeningBalance
                                  + GrossSalesRec.PlanSummary[I]
                                  - ARCashReceiptsRec.PlanSummary[I]
                                  - ARAdjustmentsRec.PlanSummary[I];
      end;
    // update detailed array for cash receipts
//    function TDataCollector.updateArray(var barray: array of currency; PeriodStart, StartDate, EndDate: double;
//                     new: currency; roundto: Extended): boolean;

    if I = 0 then
      Perstart := Psdate
    else
      Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
    PerEnd := psdate + SummaryPeriodIndexArray[I];
    if trunc(ARCashReceiptsRec.PlanSummary[I]) = Trunc(GrossSalesRec.planSummary[I]) then
      begin
      for K := Trunc(perStart - psdate) to Trunc(perEnd - psdate) do    // Iterate
        begin
        ARCashReceiptsRec.plandetail[K] := GrossSalesRec.Plandetail[K];
        end;    // for
      end
    else
      DataCollect.updateArray(ARCashReceiptsRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  ARCashReceiptsRec.PlanSummary[I],
                  0);
    end;
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      OpeningBalance := ARDataRec.OpeningBalance
    else
      OpeningBalance := ARDataRec.PlanDetail[I - 1];
    if ARCashReceiptsRec.Plandetail[I] > (OpeningBalance + GrossSalesRec.PlanDetail[I] - AR_WriteOffRec.PlanDetail[I] - ARAdjustmentsRec.PlanDetail[I]) then
      ARCashReceiptsRec.PlanDetail[I] := (OpeningBalance + GrossSalesRec.PlanDetail[I] - AR_WriteOffRec.PlanDetail[I] - ARAdjustmentsRec.PlanDetail[I]);
    ARDataRec.PlanDetail[I] := OpeningBalance
                               + GrossSalesRec.PlanDetail[I]
                               - ARCashReceiptsRec.PlanDetail[I]
                               - ARAdjustmentsRec.PlanDetail[I]
                               - AR_WriteOffRec.PlanDetail[I];
    end;    // for
//  Checkround;
end;

procedure TCashFlowEngine.ProcessStock;
Var
  I: Integer;
  TaxRateStock : Currency;
  K : Integer;
  perstart, perend : TDate;
  Opening_Balance : Currency;
begin
  StockMoveavg := Trunc(DataCollect.GetUserOption(OSTOCKAVERAGE, UOCurrency));
  TaxRateStock := DataCollect.GetUserOption(OTAXRATE_STOCK, UOCurrency);
//  FillChar(StockDeliveriesRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  // buildsummary array for sales
  BuildSummary(StockDeliveriesRec.accountNo, psdate, pedate, StockDeliveriesRec.PlanDetail, StockDeliveriesRec^.planSummary);
  BuildSummary(StockSoldRec.accountNo, psdate, pedate, StockSoldRec.PlanDetail, StockSoldRec^.planSummary);
  Stock_DaysRec.Plantotal := 0;
  for I := 0 to PeriodCount - 1 do    // Iterate
    Stock_DaysRec.PlanTotal := Stock_DaysRec.PlanTotal + Stock_DaysRec.PlanSummary[I];
  if (StockDataRec.OpeningBalance <> 0) and (Stock_DaysRec.PlanTotal = 0)  then
    defineStockturn;
  if (StockDataRec.OpeningBalance = 0) and (Stock_DaysRec.PlanTotal = 0)  then
    begin
//    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    for I := 0 to PeriodCount - 1 do    // Iterate
      begin
      if i = 0 then
        begin
        Perstart := Psdate;
        Opening_Balance := StockDataRec.OpeningBalance;
        end
      else
        begin
        Opening_Balance := StockDataRec.PlanSummary[I - 1];
        Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
        end;
      PerEnd := psdate + SummaryPeriodIndexArray[I];
      StockDeliveriesRec.PlanSummary[I] := StockDataRec.PlanSummary[I]
                                    - Opening_Balance
                                    + StockSoldRec.PlanSummary[I]
                                    + STAdjustmentsRec.PlanSummary[I];
      DataCollect.updateArray(StockDeliveriesRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  StockDeliveriesRec.PlanSummary[I],
                  0);
      End;
    end
  else
    begin
    // calculate cash receipts and balances
    for I := 0 to PeriodCount - 1 do    // Iterate
      begin
      DataCollect.roundCurrency(StockSoldRec.PlanSummary[I], 0);
      if Stock_DaysRec.PlanSummary[I] <> 0 then
        calculateStockBalances(I);
      // update detailed array for cash receipts
      //    function TDataCollector.updateArray(var barray: array of currency; PeriodStart, StartDate, EndDate: double;
      //                     new: currency; roundto: Extended): boolean;
      if I = 0 then
        Perstart := Psdate
      else
        Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
      PerEnd := psdate + SummaryPeriodIndexArray[I];
      if trunc(StockDeliveriesRec.PlanSummary[I]) = Trunc(StockSoldRec.planSummary[I]) then
        begin
        for K := Trunc(perStart - psdate) to Trunc(perEnd - psdate) do    // Iterate
          begin
          StockDeliveriesRec.plandetail[K] := StockSoldRec.Plandetail[K];
          end;    // for
        end
      else
        DataCollect.updateArray(StockDeliveriesRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  StockDeliveriesRec.PlanSummary[I],
                  0);
      end;
    end;
  DataCollect.RoundArray(StockDeliveriesRec.PlanDetail, psdate, pedate);
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      StockDataRec.PlanDetail[I] := StockDataRec.OpeningBalance
                                    + StockDeliveriesRec.PlanDetail[I]
                                    - StockSoldRec.PlanDetail[I]
                                    - STAdjustmentsRec.PlanDetail[I]
    else
      StockDataRec.PlanDetail[I] := StockDataRec.PlanDetail[I - 1]
                                    + StockDeliveriesRec.PlanDetail[I]
                                    - StockSoldRec.PlanDetail[I]
                                    - STAdjustmentsRec.PlanDetail[I];
    end;    // for
  // calculate Gross deliveries
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    TaxStockRec.PlanDetail[i] := 0;
    StockDeliveriesRec.PlanDetail[I] := round(StockDeliveriesRec.PlanDetail[I]);
    if TaxRateStock > 0 then
      TaxStockRec.PlanDetail[i] := Round(StockDeliveriesRec.PlanDetail[I] * TaxRateStock / 100);
    GrossStockDelRec.PlanDetail[I] := StockDeliveriesRec.PlanDetail[I] + TaxStockRec.PlanDetail[i];
    end;    // for
  DataCollect.RoundArray(TaxStockRec.PlanDetail, psdate, pedate);
  DataCollect.RoundArray(GrossStockDelRec.PlanDetail, psdate, pedate);
end;

procedure TCashFlowEngine.ProcessAccountsPayable;
Var
  TaxRateSubCon : Currency;
  I, K : Integer;
  perstart, perend : TDate;
  OpeningBalance : Currency;
begin
  TaxRateSubCon := DataCollect.GetUserOption(OTAXRATE_SUBCON, UOCurrency);
  APMoveavg := Trunc(DataCollect.GetUserOption(OAPDAYSAVERAGE, UOCurrency));
//  FillChar(CashPaymentsAPRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  // Calculate Tax on Subcontractors and Add to grossAP Invoices
  TaxSubcontractorsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(TAX_ON_SUBCONTRACTORS)]);
  GrossSubContractorsRec := TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(GROSS_SUBCONTRACTORS)]);
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    TaxSubcontractorsRec.PlanDetail[i] := 0;
    if TaxRateSubCon > 0 then
      TaxSubcontractorsRec.PlanDetail[i] := SubcontractorsRec.PlanDetail[I] * TaxRateSubCon / 100;
    GrossSubContractorsRec.PlanDetail[I] := SubContractorsRec.PlanDetail[I] + TaxSubcontractorsRec.PlanDetail[i];
    // get Gross from Stock, Expenses and Suncontractors
    TotalInvoicesAPRec.plandetail[I] := GrossStockDelRec.PlanDetail[I] + GrossSubContractorsRec.PlanDetail[I] + GrossExpviaAPRec.PlanDetail[i];
    end;    // for
  // buildsummary array for sales
  DataCollect.RoundArray(TaxSubcontractorsRec.PlanDetail, psdate, pedate);
  DataCollect.RoundArray(GrossSubContractorsRec.PlanDetail, psdate, pedate);
  DataCollect.RoundArray(TotalInvoicesAPRec.PlanDetail, psdate, pedate);
  BuildSummary(TotalInvoicesAPRec.accountNo, psdate, pedate, TotalInvoicesAPRec.PlanDetail, TotalInvoicesAPRec^.planSummary);
  BuildSummary(CashPaymentsAPRec.accountNo, psdate, pedate, CashPaymentsAPRec.PlanDetail, CashPaymentsAPRec^.planSummary);
  AP_DaysRec.Plantotal := 0;
  for I := 0 to PeriodCount - 1 do    // Iterate
    AP_DaysRec.PlanTotal := AP_DaysRec.PlanTotal + AP_DaysRec.PlanSummary[I];
  if (APDataRec.OpeningBalance <> 0) and (AP_DaysRec.PlanTotal = 0)  then
      defineBSDays(cfPayables);
  if (APDataRec.OpeningBalance = 0) and (AP_DaysRec.PlanTotal = 0)  then
    for I := 0 to PeriodCount - 1 do    // Iterate
      begin
      if I = 0 then
        begin
        Perstart := Psdate;
        OpeningBalance := APDataRec.OpeningBalance;
        end
      else
        begin
        OpeningBalance := APDataRec.PlanSummary[I - 1];
        Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
        end;
      PerEnd := psdate + SummaryPeriodIndexArray[I];
      CashPaymentsAPRec.PlanSummary[I] := OpeningBalance
                                  + TotalInvoicesAPRec.PlanSummary[I]
                                  - APDataRec.PlanSummary[I]
                                  - APAdjustmentsRec.PlanSummary[I];
{      if CashPaymentsAPRec.PlanSummary[I] > (OpeningBalance + TotalInvoicesAPRec.PlanSummary[I] - APAdjustmentsRec.PlanSummary[I]) then
        begin
        APDataRec.PlanSummary[I] := 0;
        CashPaymentsAPRec.PlanSummary[I] := OpeningBalance + TotalInvoicesAPRec.PlanSummary[I] - APAdjustmentsRec.PlanSummary[I];
        end;
}
      DataCollect.updateArray(CashPaymentsAPRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  CashPaymentsAPRec.PlanSummary[I],
                  0);
      end;
  // calculate cash receipts and balances
  for I := 0 to PeriodCount - 1 do    // Iterate
    begin
    if AP_DaysRec.PlanSummary[I] <> 0 then
      calculateBSBalance(I, cfPayables)
    else
      begin
      if I = 0 then
        OpeningBalance := APDataRec.OpeningBalance
      else
        OpeningBalance := APDataRec.PlanSummary[I - 1];
{      if CashPaymentsAPRec.PlanSummary[I] > (OpeningBalance + TotalInvoicesAPRec.PlanSummary[I] - APAdjustmentsRec.PlanSummary[I]) then
        CashPaymentsAPRec.PlanSummary[I] := (OpeningBalance + TotalInvoicesAPRec.PlanSummary[I] - APAdjustmentsRec.PlanSummary[I]);
}
      APDataRec.PlanSummary[I] := OpeningBalance
                                  + TotalInvoicesAPRec.PlanSummary[I]
                                  - CashPaymentsAPRec.PlanSummary[I]
                                  - APAdjustmentsRec.PlanSummary[I];
      end;
    // update detailed array for cash receipts
//    function TDataCollector.updateArray(var barray: array of currency; PeriodStart, StartDate, EndDate: double;
//                     new: currency; roundto: Extended): boolean;
    if I = 0 then
      Perstart := Psdate
    else
      Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
    PerEnd := psdate + SummaryPeriodIndexArray[I];
    if trunc(CashPaymentsAPRec.PlanSummary[I]) = Trunc(TotalInvoicesAPRec.planSummary[I]) then
      begin
      for K := Trunc(perStart - psdate) to Trunc(perEnd - psdate) do    // Iterate
        begin
        CashPaymentsAPRec.plandetail[K] := TotalInvoicesAPRec.Plandetail[K];
        end;    // for
      end
    else
      DataCollect.updateArray(CashPaymentsAPRec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  CashPaymentsAPRec.PlanSummary[I],
                  0);
    end;
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      APDataRec.PlanDetail[I] := APDataRec.OpeningBalance
                                 + Round(TotalInvoicesAPRec.PlanDetail[I])
                                 - Round(CashPaymentsAPRec.PlanDetail[I])
                                 - Round(APAdjustmentsRec.PlanDetail[I])
    else
      APDataRec.PlanDetail[I] := APDataRec.PlanDetail[I - 1]
                                 + Round(TotalInvoicesAPRec.PlanDetail[I])
                                 - Round(CashPaymentsAPRec.PlanDetail[I])
                                 - Round(APAdjustmentsRec.PlanDetail[I]);
    end;    // for
end;

procedure TCashFlowEngine.ProcessAccruedExpenses;
Var
  I, K : Integer;
  perstart, perend : TDate;
  OpeningBalance : Currency;
begin
  AEMoveavg := Trunc(DataCollect.GetUserOption(OAEDAYSAVERAGE, UOCurrency));
//  FillChar(CashPaymentsAERec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  // buildsummary array for sales
  BuildSummary(GrossExpensesAccruedRec.accountNo, psdate, pedate, GrossExpensesAccruedRec.PlanDetail, GrossExpensesAccruedRec^.planSummary);
  BuildSummary(CashPaymentsAERec.accountNo, psdate, pedate, CashPaymentsAERec.PlanDetail, CashPaymentsAERec^.planSummary);
  AE_DaysRec.Plantotal := 0;
  for I := 0 to PeriodCount - 1 do    // Iterate
    AR_DaysRec.PlanTotal := AE_DaysRec.PlanTotal + AE_DaysRec.PlanSummary[I];
  if (AEDataRec.OpeningBalance <> 0) and (AE_DaysRec.PlanTotal = 0)  then
      defineBSDays(cfAccruedExpenses);
  if (AEDataRec.OpeningBalance = 0) and (AE_DaysRec.PlanTotal = 0)  then
    for I := 0 to PeriodCount - 1 do    // Iterate
      begin
      if I = 0 then
        begin
        Perstart := Psdate;
        OpeningBalance := AEDataRec.OpeningBalance;
        end
      else
        begin
        OpeningBalance := AEDataRec.PlanSummary[I - 1];
        Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
        end;
      PerEnd := psdate + SummaryPeriodIndexArray[I];
      CashPaymentsAERec.PlanSummary[I] := OpeningBalance
                                  + GrossExpensesAccruedRec.PlanSummary[I]
                                  - AEDataRec.PlanSummary[I]
                                  - AEAdjustmentsRec.PlanSummary[I];
{
      if CashPaymentsAERec.PlanSummary[I] > (OpeningBalance + GrossExpensesAccruedRec.PlanSummary[I] - AEAdjustmentsRec.PlanSummary[I]) then
        begin
        AEDataRec.PlanSummary[I] := 0;
        CashPaymentsAERec.PlanSummary[I] := OpeningBalance + GrossExpensesAccruedRec.PlanSummary[I] - AEAdjustmentsRec.PlanSummary[I];
        end;
}
      DataCollect.updateArray(CashPaymentsAERec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  CashPaymentsAERec.PlanSummary[I],
                  0);
      end;
  // calculate cash receipts and balances
  for I := 0 to PeriodCount - 1 do    // Iterate
    begin
    if AE_DaysRec.PlanSummary[I] <> 0 then
      calculateBSBalance(I, cfAccruedExpenses)
    else
      begin
      if I = 0 then
        OpeningBalance := AEDataRec.OpeningBalance
      else
        OpeningBalance := AEDataRec.PlanSummary[I - 1];
{
      if CashPaymentsAERec.PlanSummary[I] > (OpeningBalance + GrossExpensesAccruedRec.PlanSummary[I] - AEAdjustmentsRec.PlanSummary[I]) then
        CashPaymentsAERec.PlanSummary[I] := (OpeningBalance + GrossExpensesAccruedRec.PlanSummary[I] - AEAdjustmentsRec.PlanSummary[I]);
}
      AEDataRec.PlanSummary[I] := OpeningBalance
                                  + GrossExpensesAccruedRec.PlanSummary[I]
                                  - CashPaymentsAERec.PlanSummary[I]
                                  - AEAdjustmentsRec.PlanSummary[I];
      end;
    // update detailed array for cash receipts
//    function TDataCollector.updateArray(var barray: array of currency; PeriodStart, StartDate, EndDate: double;
//                     new: currency; roundto: Extended): boolean;
    if I = 0 then
      Perstart := Psdate
    else
      Perstart := psdate + SummaryPeriodIndexArray[I - 1] + 1;
    PerEnd := psdate + SummaryPeriodIndexArray[I];
    if trunc(CashPaymentsAERec.PlanSummary[I]) = Trunc(GrossExpensesAccruedRec.planSummary[I]) then
      begin
      for K := Trunc(perStart - psdate) to Trunc(perEnd - psdate) do    // Iterate
        begin
        CashPaymentsAERec.plandetail[K] := GrossExpensesAccruedRec.Plandetail[K];
        end;    // for
      end
    else
    DataCollect.updateArray(CashPaymentsAERec.PlanDetail,
                  DaysBetween(Perstart, psdate),
                  DaysBetween(PerEnd, psdate),
                  CashPaymentsAERec.PlanSummary[I],
                  0);
    end;
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      AEDataRec.PlanDetail[I] := AEDataRec.OpeningBalance
                                 + Round(GrossExpensesAccruedRec.PlanDetail[I])
                                 - Round(CashPaymentsAERec.PlanDetail[I])
                                 - Round(AEAdjustmentsRec.PlanDetail[I])
    else
      AEDataRec.PlanDetail[I] := AEDataRec.PlanDetail[I - 1]
                                 + Round(GrossExpensesAccruedRec.PlanDetail[I])
                                 - Round(CashPaymentsAERec.PlanDetail[I])
                                 - Round(AEAdjustmentsRec.PlanDetail[I]);
    end;    // for
end;

procedure TCashFlowEngine.ProcessTax;
var
  I: Integer;
  TotalNetInvAP : Currency;
  TotalTaxAP : Currency;
  CashBasis : Boolean;
  PayRefund : currency;
  AveTaxAP, AveTaxAE : currency;
  TaxMethod, firstMonth : integer;
  Taxpayday, y, d, m : word;
  TaxRateSales{, TaxRateStock, TaxRateSubcon, TaxRateExpensesAP, TaxRateExpensesAE} : currency;
begin
  TaxRateSales := DataCollect.GetUserOption(OTAXRATE_SALES, UOCurrency);
  AveTaxAP := 0;
  AveTaxAE := 0;
//  TaxRateStock := DataCollect.GetUserOption(OTAXRATE_STOCK, UOCurrency);
//  TaxRateSubCon := DataCollect.GetUserOption(OTAXRATE_SUBCON, UOCurrency);
//  TaxRateExpensesAE := DataCollect.GetUserOption(OTAXRATE_EXPENSES, UOCurrency);
//  TaxRAteExpensesAP := TaxRateExpensesAE;
  TaxMethod := DataCollect.GetUserOption(OTAXPAYMENTQUARTERLY, UOInteger);
  TaxPayDay := DataCollect.GetUserOption(OTAXPAIDDAY, UOInteger);
  FirstMonth := DataCollect.GetUserOption(OFIRSTMONTH, UOInteger);
  FillChar(TaxPaidRefundRec.PlanDetail, Sizeof(TDetailedBalArray), #0);

  if DataCollect.GetUserOption(OTAXACCOUNTINGMETHOD, UOInteger) = 1 then
    CashBasis := True
  else
    CashBasis := False;

  // calculate Expenses Tax Rate for AP and AE based on InvoicesAccrued
  // Options - Base the rate on the plan average   -- This One!!
  //           Base the rate on the daily rate
  if CashBasis then
    begin
    // get totals
    TotalNetInvAP := 0;
    TotalTaxAP := 0;
    ExpensesAERec.PlanTotal := 0;
    TaxExpensesAERec.PlanTotal := 0;
    for I := 0 to trunc(peDate) - trunc(psDate) do
      begin    // Iterate
      TotalNetInvAP := TotalNetInvAP + StockDeliveriesRec.PlanDetail[I] + SubcontractorsRec.PlanDetail[I] + ExpensesViaAPRec.PlanDetail[I];
      TotalTaxAP := TotalTaxAP + TaxStockRec.PlanDetail[i] + TaxSubcontractorsRec.PlanDetail[i] + TaxExpensesAPrec.PlanDetail[I];
      ExpensesAERec.PlanTotal := ExpensesAERec.PlanTotal + ExpensesAERec.Plandetail[I];
      TaxExpensesAERec.PlanTotal := TaxExpensesAERec.PlanTotal + TaxExpensesAERec.PlanDetail[I];
      end;
    AveTaxAP := 0;
    if TotalNetInvAP > 0 then
      AveTaxAP := TotalTaxAP / TotalNetInvAP;
    AveTaxAE := 0;
    if ExpensesAERec.PlanTotal > 0 then
      AveTaxAE := TaxExpensesAERec.PlanTotal / ExpensesAERec.PlanTotal;
    end;

  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    decodedate(psdate + i, y, m, d);
    if (d = 1) and ((TaxMethod = 0) or ((TaxMethod = 1) and (((m - 1) mod 3) = Firstmonth))) then
      begin
      if I = 0 then
        PayRefund := TaxPayDataRec.OpeningBalance
      else
        Payrefund := TAXPAYDataRec.PlanDetail[I - 1];
      TaxPaidRefundRec.PlanDetail[I + Taxpayday - 1] := Payrefund;
      end;
    if I = 0 then
      begin
      TAXPAYDataRec.PlanDetail[I] := TaxPayDataRec.OpeningBalance;
      TAXTIMINGDataRec.PlanDetail[I] :=  TAXTIMINGDataRec.OpeningBalance;
      end
    else
      begin
      TAXPAYDataRec.PlanDetail[I] := TAXPAYDataRec.PlanDetail[I - 1];
      TAXTIMINGDataRec.PlanDetail[I] := TAXTIMINGDataRec.PlanDetail[I - 1];
      end;
    if CashBasis then
      begin
      // first record Accrual Tax Calculations
      NETTAXACCRUALRec.PlanDetail[I] := TAXSalesRec.Plandetail[I] - (TaxStockRec.PlanDetail[I] + TaxSubcontractorsRec.PlanDetail[I]
                                        + TaxExpensesAPRec.PlanDetail[I] + TaxExpensesAERec.PlanDetail[I]);


      TotalTaxCollectedRec.planDetail[I] := ARCashReceiptsRec.Plandetail[I] - Round((ARCashReceiptsRec.Plandetail[I] / (1 + (TaxRateSales / 100))));
      TotalTaxPaidRec.PlanDetail[I] :=  CashPaymentsAPRec.PlanDetail[I] - Round((CashPaymentsAPRec.PlanDetail[I] / (1 + aveTaxAP)))
                                        + CashPaymentsAERec.PlanDetail[I] - Round((CashPaymentsAERec.PlanDetail[I] / (1 + AveTaxAE)));
      // Record the opposite side for balancing purposes
      NETTAXCASHRec.PlanDetail[i] := TotalTaxCollectedRec.planDetail[I] - TotalTaxPaidRec.PlanDetail[I];
      end
    else
      begin
      TotalTaxCollectedRec.planDetail[I] := TAXSalesRec.Plandetail[I]; // + TaxAdjustmentsRec.PlanDetail[I];
      TotalTaxPaidRec.PlanDetail[I] := TaxStockRec.PlanDetail[I] + TaxSubcontractorsRec.PlanDetail[I]
                                        + TaxExpensesAPRec.PlanDetail[I] + TaxExpensesAERec.PlanDetail[I];
      end;;    // for
    TAXPAYDataRec.PlanDetail[I] := TAXPAYDataRec.PlanDetail[I]
                                   + TotalTaxCollectedRec.planDetail[I]
                                   - TotalTaxPaidRec.PlanDetail[I]
                                   - TaxPaidRefundRec.planDetail[I]
                                   - TAXAdjustmentsRec.PlanDetail[I];
    TAXTIMINGDataRec.PlanDetail[I] := TAXTIMINGDataRec.PlanDetail[I]
                                   + NETTAXACCRUALRec.PlanDetail[I]
                                   - NETTAXCASHRec.PlanDetail[i];
    end;
  BuildBSSummary(TAXPAYDataRec);
end;

procedure TCashFlowEngine.ProcessCash;
var
  I: Integer;
  BankOpeningBalance, OpeningBalAR, OpeningBalST : Currency;
//  InterestAmt, InterestRate : Currency;
begin
  if BankisOD then
    CorrectBankAccount(True);
  BankisOD := False;
//  InterestRate := DataCollect.GetUserOption(OOVERDRAFTRATE, UOCurrency);
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      begin
      BankOpeningBalance := BankDataRec.OpeningBalance;
      CMFDataRec.PlanDetail[I] := CMFDataRec.OpeningBalance + CashManagementDepsRec.PlanDetail[I]- NonCashCMF[I] - CashmanagementWdrlsRec.PlanDetail[I];
      MSDataRec.PlanDetail[I] := MSDataRec.OpeningBalance + MarketSecPurchasesRec.PlanDetail[I] - NonCashMSec[I] - MarketSecSalesRec.PlanDetail[I];
      OCADataRec.PlanDetail[I] := OCADataRec.OpeningBalance + OtherAssetsPurchRec.PlanDetail[I] - NonCashOAssets[I] - OtherAssetsSalesRec.PlanDetail[I];
      NDADataRec.PlanDetail[I] := NDADataRec.OpeningBalance + NonDepnAssetsPurchRec.PlanDetail[I] - NonCashNDAssets[I] - NonDepnAssetsSalesRec.PlanDetail[I];
      DADataRec.PlanDetail[I] := DADataRec.OpeningBalance + DepnAssetsPurchRec.PlanDetail[I] - DepnAssetsSalesRec.PlanDetail[I] - DADepreciation[I];
      IADataRec.PlanDetail[I] := IADataRec.OpeningBalance + IntangAssetsPurchRec.PlanDetail[I] - NonCashIntAssets[I] - IntangAssetsSalesRec.PlanDetail[I];
      INCTAXDataRec.PlanDetail[I] := INCTAXDataRec.OpeningBalance + IncTaxIncurredRec.PlanDetail[I] - IncTaxPaidRec.Plandetail[I];
      DIVDataREc.PlanDetail[I] := DivDataRec.OpeningBalance + DividendDeclaredRec.PlanDetail[I] - DividendPaidRec.PlanDetail[I];
      OCLDataRec.PlanDetail[I] := OCLDataRec.OpeningBalance + OtherLiabIncurredRec.PlanDetail[I] + NonCashOLiab[I] - OtherLiabPaidRec.PlanDetail[I];
      LOANSDataRec.PlanDetail[I] := LOANSDataRec.OpeningBalance + LoansIncurredRec.PlanDetail[I] + NonCashInterest[I] - LoansRepaidRec.PlanDetail[I];
      end
    else
      begin
      BankOpeningBalance := BankDataRec.Plandetail[I - 1];
      CMFDataRec.PlanDetail[I] := CMFDataRec.PlanDetail[I - 1] + CashManagementDepsRec.PlanDetail[I]- NonCashCMF[I] - CashmanagementWdrlsRec.PlanDetail[I];
      MSDataRec.PlanDetail[I] := MSDataRec.PlanDetail[I - 1] + MarketSecPurchasesRec.PlanDetail[I] - NonCashMSec[I] - MarketSecSalesRec.PlanDetail[I];
      OCADataRec.PlanDetail[I] := OCADataRec.PlanDetail[I - 1] + OtherAssetsPurchRec.PlanDetail[I] - NonCashOAssets[I] - OtherAssetsSalesRec.PlanDetail[I];
      NDADataRec.PlanDetail[I] := NDADataRec.PlanDetail[I - 1] + NonDepnAssetsPurchRec.PlanDetail[I] - NonCashNDAssets[I] - NonDepnAssetsSalesRec.PlanDetail[I];
      DADataRec.PlanDetail[I] := DADataRec.PlanDetail[I - 1] + DepnAssetsPurchRec.PlanDetail[I] - DepnAssetsSalesRec.PlanDetail[I] - DADepreciation[I];
      IADataRec.PlanDetail[I] := IADataRec.PlanDetail[I - 1] + IntangAssetsPurchRec.PlanDetail[I] - NonCashIntAssets[I] - IntangAssetsSalesRec.PlanDetail[I];
      INCTAXDataRec.PlanDetail[I] := INCTAXDataRec.PlanDetail[I - 1] + IncTaxIncurredRec.PlanDetail[I] - IncTaxPaidRec.Plandetail[I];
      DIVDataREc.PlanDetail[I] := DivDataRec.PlanDetail[I - 1] + DividendDeclaredRec.PlanDetail[I] - DividendPaidRec.PlanDetail[I];
      OCLDataRec.PlanDetail[I] := OCLDataRec.PlanDetail[I - 1] + OtherLiabIncurredRec.PlanDetail[I] + NonCashOLiab[I] - OtherLiabPaidRec.PlanDetail[I];
      LOANSDataRec.PlanDetail[I] := LOANSDataRec.PlanDetail[I - 1] + LoansIncurredRec.PlanDetail[I] + NonCashInterest[I] - LoansRepaidRec.PlanDetail[I];
      end;
//    if (BankOpeningBalance < 0) and (InterestRate <> 0) then
//      InterestAmt := abs(BankOpeningBalance) * InterestRate / 36500;
    BankDataRec.Plandetail[I] := BankOpeningBalance
                                 + ARCashReceiptsRec.plandetail[I]
                                 + CashmanagementWdrlsRec.PlanDetail[I]
                                 + MarketSecSalesRec.PlanDetail[I]
                                 + OtherAssetsSalesRec.PlanDetail[I]
                                 + NonDepnAssetsSalesRec.PlanDetail[I]
                                 + DepnAssetsSalesRec.PlanDetail[I]
                                 + IntangAssetsSalesRec.PlanDetail[I]
                                 + OtherLiabIncurredRec.PlanDetail[I]
                                 + EquityInjectedRec.PlanDetail[I]
                                 + LoansIncurredRec.PlanDetail[I]
// + AR and Stock
                                 + ARAdjustmentsRec.PlanDetail[I]
                                 + STAdjustmentsRec.PlanDetail[I]
                                 + OTHERIncomeRec.PlanDetail[I]
// - AP, AE and Tax ADJUSTMENTS
                                 - APAdjustmentsRec.PlanDetail[I]
                                 - AEAdjustmentsRec.PlanDetail[I]
                                 - TAXAdjustmentsRec.PlanDetail[I]

                                 - CashManagementDepsRec.PlanDetail[I]
                                 - MarketSecPurchasesRec.PlanDetail[I]
                                 - OtherAssetsPurchRec.PlanDetail[I]
                                 - NonDepnAssetsPurchRec.PlanDetail[I]
                                 - DepnAssetsPurchRec.PlanDetail[I]
                                 - IntangAssetsPurchRec.PlanDetail[I]
                                 - CashPaymentsAPRec.PlanDetail[I]
                                 - CashPaymentsAERec.PlanDetail[I]
                                 // TAXPAYREFUND
                                 - TaxPaidRefundRec.plandetail[I]
                                 - IncTaxPaidRec.PlanDetail[I]
//                                 - round(NetTaxPayableRec.PlanDetail[I]) // Income tax
                                 - DividendPaidRec.PlanDetail[I]
                                 - OtherLiabPaidRec.PlanDetail[I]
                                 - LoansRepaidRec.PlanDetail[I]
                                 - EquityWithdrawnRec.PlanDetail[I]
                                 ;
    end;    // for
  BuildBSSummary(BankDataRec);
  CheckBank;
  // Adjust for mon cash issues
  for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
    begin
    if I = 0 then
      begin
      OpeningBalAR := ARDataRec.OpeningBalance;
      OpeningBalST := StockDataRec.OpeningBalance;
      end
    else
      begin
      OpeningBalAR := ARDataRec.PlanDetail[I - 1];
      OpeningBalST := StockDataRec.PlanDetail[I - 1];
      end;
//    if ARCashReceiptsRec.PlanDetail[I] > (OpeningBalAR + GrossSalesRec.PlanDetail[I] - ARAdjustmentsRec.PlanDetail[I] - AR_WriteOffRec.PlanDetail[I]) then
//       ARCashReceiptsRec.PlanDetail[I] := OpeningBalAR + GrossSalesRec.PlanDetail[I] - ARAdjustmentsRec.PlanDetail[I] - AR_WriteOffRec.PlanDetail[I];
    ARDataRec.PlanDetail[I] := OpeningBalAR
                               + Round(GrossSalesRec.PlanDetail[I])
                               - Round(ARCashReceiptsRec.PlanDetail[I])
                               - Round(ARAdjustmentsRec.PlanDetail[I])
                               - Round(AR_WriteOffRec.PlanDetail[I]);
    StockDataRec.PlanDetail[I] := OpeningBalST
                               + Round(StockDeliveriesRec.PlanDetail[I])
                               - Round(StockSoldRec.PlanDetail[I])
                               - Round(STAdjustmentsRec.PlanDetail[I])
                               - Round(ST_WriteOffRec.PlanDetail[I]);
    end;    // for
end;

procedure TCashFlowEngine.Checkround;
var
  J, K: Integer;
  TmpRecPtr : TCashFlowRecPtr;
begin
  for J := 0 to (CASHFLOWLISTSIZE - 1) do    // Iterate
    begin
    TmpRecPtr := TCashFlowRecPtr(CashFlowDataList.Items[J]);
    for K := 0 to 100 do    // Iterate
      begin
      if TmpRecPtr.PlanDetail[K] <> Round(TmpRecPtr.PlanDetail[K]) then
        begin
        MEssagedlg('Not Rounded = ' + TmpRecPtr.AccountTitle, mtinformation, [mbok], 0);
        break;
        end;
      end;    // for
    end;    // for
end;

procedure TCashFlowEngine.CalculateAll;
var
  I: Integer;
begin
// 1. Initialise balance sheet balances with their opening balance
//  I := DataCollect.GetUserOption(OPERIODSIZE, UOInteger);
  I := 4;
  Periodcount := createSummaryIndex(I, psdate, pedate);
  I := 0;
  while abs(CashFlowMain[I]) <> SALES do
    begin
    SetBSBalance(TCashFlowRecPtr(CashFlowDataList.Items[I]));
    inc(i);
    end;    // while
  for I := 0 to trunc(pedate) - trunc(psdate) do    // Iterate
    begin
    StockSoldRec.PlanDetail[I] := SalesRec.Plandetail[I] - GPRec.PlanDetail[I] - SubcontractorsRec.PlanDetail[I];
    NOPRec.PlanDetail[i] := GPRec.planDetail[i] - TotalexpensesRec.planDetail[i];
    NPRec.PlanDetail[i] := NOPRec.planDetail[i] + OTHERIncomeRec.planDetail[i];
    end;
  ProcessIncomeTaxDividend;
// 2. process expenses
  DataModuleClient.ExpAccounts.Active := True;
  DataModuleClient.Dept_Accounts.Active := False;

  DataModuleClient.Dept_Accounts.Filter := 'DEPT_ID=' + inttostr(Dept_ID);
  DataModuleClient.Dept_Accounts.Filtered := True;
  DataModuleClient.Dept_Accounts.active := True;
  if SaveCashFlow then
    DataModuleClient.CreateDeptExpenseAccountRecords;

  // make list of Expenses that affect BS accounts.
  // All non cash expenses must affect BS accounts.
  // get detailed balance and make the other side of the journal.

  ProcessExpenses;
  DataModuleClient.ExpAccounts.Active := False;
  DataModuleClient.Dept_Accounts.Active := False;

// 3. process journals
     // All journals must only affect BS accounts except for tax and dividends which affect PNL Appropriation
  ProcessJournalstoAdjustments;
// 4. calc AR, STOCK, AP, AE
  ProcessAccountsReceivable;
  ProcessStock;
  ProcessAccountsPayable;
  ProcessAccruedExpenses;
// 5. calc TAX
  ProcessTax;
// 6. calc Total receipts and payments for static accounts.
  ProcessCash;
  DataModuleClient.BSAccounts.First;
  while DataModuleClient.BSAccounts.Eof = False do
    begin
    BuildBSSummary(TCashFlowRecPtr(CashFlowDataList.Items[GetCashFlowAccountIndex(DataModuleClient.BSAccountsACCOUNT_NUMBER.Value)]));
    DataModuleClient.BSAccounts.next;
    end;
end;

procedure TCashFlowEngine.SetBSBalance(BSrec : TCashFlowRecPtr);
var
  I: Integer;
begin
  // initialise the detail array
  FillChar(BSRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
  if (BSRec.Openingbalance <> 0) then
    begin
    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
      begin
      BSrec.PlanDetail[I] := BSRec.Openingbalance;
      end;    // for
    end;
  BuildBSSummary(BSrec);
end;

procedure TCashFlowEngine.UpdateBSBalance(BSrec : TCashFlowRecPtr; newBalance : Currency; ForceUpdate : Boolean);
var
  I: Integer;
  adjustbal : currency;
begin
  if BSRec.PlanTotal = 0 then
    adjustbal := newbalance
  else
    adjustbal := newBalance - BSREC.OpeningBalance;
  if (AdjustBal <> 0) or (ForceUpdate) then
    begin
    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
      begin
      if ForceUpdate then
        BSrec.PlanDetail[I] := adjustbal
      else
        BSrec.PlanDetail[I] := BSrec.PlanDetail[I] + adjustbal;
      end;    // for
    end;
  BSrec.OpeningBalance := newbalance;
  BuildBSSummary(BSrec);
end;

procedure TCashFlowEngine.BuildBSSummary(BSrec : TCashFlowRecPtr);
var
  K: Integer;
begin
  K := 0;
  if BSREC.Accountno = TAX_PAYABLE then
    K := 0;
    
  while SummaryPeriodIndexArray[k] <> 0 do
    begin
    BSrec.PlanSummary[K] := BSrec.plandetail[SummaryPeriodIndexArray[k]];
    inc(k);
    end;    // while
end;

procedure TCashFlowEngine.BuildBSDetail(BSrec : TCashFlowRecPtr);
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

procedure TCashFlowEngine.CorrectBusinessCentre;
var
  CopiedOne : Boolean;
  Varg : Variant;
begin
// IF no accounts exist in the range FIRSTBALANCESHEET to LASTBALANCESHEET for the cashflow department - THEN
// if a department has a balance in Bank Account and has more that 2 records in Dept_options, then
// move records from that dept to the CashFlowDept for this business.
// Delete any department records in the range of FIRSTBALANCESHEET to LASTBALANCESHEET.
// These accounts should not exist in visible departments.
  DataModuleClient.CF_BS_Accounts.MasterSource := DataModuleClient.DSCashFlowDept;
  DataModuleClient.CF_BS_Accounts.Filter := '(' + inttostr(FIRSTBALANCESHEET) + ' <= ACCOUNT_NUMBER AND ACCOUNT_NUMBER < ' + inttostr(LASTBALANCESHEET) + ' )';
  DataModuleClient.CF_BS_Accounts.Filtered := True;
  DataModuleClient.CF_BS_Accounts.active := True;
  if DataModuleClient.CF_BS_Accounts.recordcount > 2 then
    begin
    DataModuleClient.CF_BS_Accounts.active := False;
    exit;
    end;
  DataModuleClient.CF_BS_Accounts.active := False;
  DataModuleClient.CF_BS_Accounts.MasterSource := DataModuleClient.DSDepartments;
  DataModuleClient.CF_BS_Accounts.active := True;
  DataModuleClient.CFBS_Lookup.active := True;
  CopiedOne := False;
  varg := vararraycreate([0,3], VarVariant);
  DataModuleClient.Departments.First;
  while DataModuleClient.Departments.Eof = False do
    begin
    DataModuleClient.CF_BS_Accounts.Refresh;
    if DataModuleClient.CF_BS_Accounts.RecordCount > 0 then
      begin
      DataModuleClient.CF_BS_Accounts.First;
      while DataModuleClient.CF_BS_Accounts.Eof = False do
        begin
        varg[0] := DataModuleClient.CashFlowDeptDEPT_ID.Value;
        varg[1] := DataModuleClient.CF_BS_AccountsAccount_Number.Value;
        Varg[2] := DataModuleClient.CF_BS_AccountsD_Year.Value;
        varg[3] := DataModuleClient.CF_BS_AccountsD_Type.Value;
        if (Not CopiedOne) and (Not DataModuleClient.CFBS_Lookup.Locate('DEPT_ID;ACCOUNT_NUMBER;D_YEAR;D_TYPE', varg, [])) then
          begin
          DataModuleClient.CF_BS_Accounts.Edit;
          DataModuleClient.CF_BS_AccountsDEPT_ID.Value := DataModuleClient.CashFlowDeptDEPT_ID.Value;
          DataModuleClient.CF_BS_Accounts.Post;
          end
        else
          DataModuleClient.CF_BS_Accounts.Delete;
        DataModuleClient.CFBS_Lookup.Refresh;
        DataModuleClient.CF_BS_Accounts.Next;
        end;    // while
      if (Not CopiedOne) then
        CopiedOne := True;
      end;
    // here we update any journals attached to the department
    DataModuleClient.CFBS_Journals.Active := False;
    DataModuleClient.CFBS_Journals.Filter := 'DEPT_ID=' + DataModuleClient.DepartmentsDEPT_ID.AsString;
    DataModuleClient.CFBS_Journals.Filtered := True;
    DataModuleClient.CFBS_Journals.Active := True;
    if DataModuleClient.CFBS_Journals.RecordCount > 0 then
      begin
      DataModuleClient.CFBS_Journals.First;
      while DataModuleClient.CFBS_Journals.Eof = false do
        begin
        DataModuleClient.CFBS_Journals.edit;
        DataModuleClient.CFBS_JournalsDept_ID.Value := DataModuleClient.CashFlowDeptDEPT_ID.Value;
        DataModuleClient.CFBS_Journals.Post;
        DataModuleClient.CFBS_Journals.Next;
        end;    // while
      DataModuleClient.JournalTbl.Refresh;
      end;
    DataModuleClient.CFBS_Journals.Active := False;
    DataModuleClient.Departments.Next;
    end;    // while
  DataModuleClient.CFBS_Lookup.active := False;
  DataModuleClient.CF_BS_Accounts.active := False;
  DataModuleClient.CF_BS_Accounts.MasterSource := DataModuleClient.DSCashFlowDept;
end;

constructor TCashFlowEngine.create(DeptID : integer; StartDate, EndDate: TDateTime; PeriodType: integer);
begin
  SaveCashFlow := True;
  psdate := StartDate;
  Pedate := EndDate;
  PeriodType := PeriodType; // Default is 4 = monthly
  DataModuleClient.BSAccounts.active := True;
  CorrectBusinessCentre;
  DataCollect.GetConsolidatedList(Deptid, ctNormal);
  Dept_id := Deptid; // set the dept id for this engine
  // set filter for Dept Options
  DataModuleClient.DeptOptions.Active := False;
  DataModuleClient.DeptOptions.Filter := 'DEPT_ID=' + inttostr(Dept_ID);
  DataModuleClient.DeptOptions.Filtered := True;
  DataModuleClient.DeptOptions.active := True;

  PeriodCount := createSummaryIndex(PeriodType, psdate, pedate);
  BankisOD := False;
  // get the list filled
  getCashFlowData;
  // GLOBALS OPTIONS
  if DataCollect.GetUserOption(OBANKACCOUNTLIABILITY, UOInteger) <> 0 then
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
  CheckBank;
end;

destructor TCashFlowEngine.Destroy;
//var
//  CheckBal : currency;
begin
  // Save Account balances
//  Checkbal := ARDataRec.PlanSummary[0];
//  BuildBSDetail(ARDataRec);
//  Checkbal := AR_DaysRec.PlanSummary[0];
  if SaveCashFlow then
    begin
    BuildBSDetail(AR_DaysRec);
    BuildBSDetail(Stock_DaysRec);
    BuildBSDetail(AP_DaysRec);
    BuildBSDetail(AE_DaysRec);
    if BankisOD then
      CorrectBankAccount(True);
    saveCashFlowData;
  // Call XXX to tidy up Account List
    end;
  clearCashFlowDataList;
  inherited destroy;
end;

procedure TCashFlowEngine.CheckBank;
var
  ShouldbeOD : Boolean;
begin
  if (ShowBankOD) OR
     (BankODDataRec.plandetail[SummaryPeriodIndexArray[Periodcount - 1]] > 0) OR
     (BankDataRec.plandetail[SummaryPeriodIndexArray[Periodcount - 1]] < 0) then
    ShouldbeOD := True
  else
    ShouldbeOD := False;
  if (Not ShouldbeOD) and (BankisOD) then
      CorrectBankAccount(BankisOD);
  if (ShouldbeOD) and (NOT BankisOD) then
      CorrectBankAccount(BankisOD);
  BankIsOD := ShouldbeOD;
end;

function TCashFlowEngine.BankChange: Currency;
begin
  if BankIsOD then
    result := BankODDataRec.OpeningBalance - BankODDataRec.plandetail[SummaryPeriodIndexArray[Periodcount - 1]]
  else
    Result := BankDataRec.plandetail[SummaryPeriodIndexArray[Periodcount - 1]] - BankDataRec.OpeningBalance;
end;


procedure TCashFlowEngine.CorrectBankAccount(IsOD : Boolean);
var
  I: Integer;
  Tempbalances : TDetailedBalArray;
begin
  FillChar(Tempbalances, Sizeof(TDetailedBalArray), #0);
//  move(CashFlowDataRec.PlanDetail, CashFlowDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
  if IsOD then // BankOD has the balances
    begin
    move(BankODDataRec.PlanDetail, Tempbalances, sizeof(TDetailedBalArray));
    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
      begin
      TempBalances[I] := Tempbalances[i] * -1;
      end;    // for
    move(Tempbalances, BankDataRec.PlanDetail, sizeof(TDetailedBalArray));
    BankDataRec.OpeningBalance := BankODDataRec.OpeningBalance * -1;
    FillChar(BankODDataRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
    BankODDataRec.OpeningBalance := 0;
    end
  else
    begin
    move(BankDataRec.PlanDetail, Tempbalances, sizeof(TDetailedBalArray));
    for I := 0 to trunc(peDate) - trunc(psDate) do    // Iterate
      begin
      TempBalances[I] := Tempbalances[i] * -1;
      end;    // for
    move(Tempbalances, BankODDataRec.PlanDetail, sizeof(TDetailedBalArray));
    BankODDataRec.OpeningBalance := BankDataRec.OpeningBalance * -1;
    FillChar(BankDataRec.PlanDetail, Sizeof(TDetailedBalArray), #0);
    BankDataRec.OpeningBalance := 0;
    end;
  BuildBSSummary(BankDataRec);
  BuildBSSummary(BankODDataRec);
end;

end.
