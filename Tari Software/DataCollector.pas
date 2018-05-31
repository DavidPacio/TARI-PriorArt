unit DataCollector;
{$WARN SYMBOL_PLATFORM OFF}
interface

uses
	Windows, Classes, Controls, SysUtils, stdctrls, DMClient, AuchTypes, printers,
	{$IFDEF Video} Forms, Messages, OleCtrls, TSCRECLib_TLB,{$ENDIF}
	variants, registry, inifiles, dialogs, LGLobals, DateUtils, DB, strUtils;

type

//  TShortCutEvent = procedure (var Msg: TWMKey; var Handled: Boolean) of object;

  TDataCollector = class(TObject)
  private
    { Private declarations }
    detailedTotal: boolean;
    DetailedArray: TDetailedBalarray;
//    NewDeptID : integer;
//    procedure DateRangesAfterPost(DataSet: TDataSet);
//    procedure DataModuleDestroy(Sender: TObject);
//    procedure QuotesAfterPost(DataSet: TDataSet);
    function OkToExclude(deptid : integer): Boolean;
    //    NewQuoteID : Integer;
  public
    { Public declarations }
    Planloaded : Boolean;
    PlanExploaded: Boolean;
    Monitoringloaded : Boolean;
    MonitoringExploaded: Boolean;
    AccountingFmt : Boolean;
    psdate : TDateTime; // planning start date
    pedate : TDateTime; // planning end date
    msdate : TDateTime; // Monitoring start date
    medate : TDateTime; // Monitoring end date
    DetailedOptions : TDetailedBalArray;
    procedure getPlanningData;
    procedure getReportData;
    procedure ClearReportDataList;
    procedure ClearDeptReportDataList;
    procedure reloadPastBalances;
    procedure PutPastBalances;
    procedure getPlanningExpData(AdjustOtherExpenses : Boolean);
    procedure getMonitoringExpData;
    procedure setPlanningData;
//    procedure RefreshPlanningData;
    procedure setPlanningExpData;
    procedure setMonitoringExpData;
    procedure ClearPlanDataList;
    procedure ClearPlanExpDataList;
    procedure ClearMonitorExpDataList;
    procedure getMonitoringData;
    procedure setMonitoringData;
    procedure clearMonitoringDataList;
    procedure GetQuotes(StartDate, EndDate: TDateTime);
    procedure clearQuoteList;
//    procedure SetInvoiceFilter(IType : Integer; StartDate, EndDate : TDateTime);
    procedure getPastBalances(var balances : Array of currency; Accountno : Integer);
    procedure GetConsolidatedList(CurrentDept: Integer; Consolidated : TConsolidateType);
    procedure ClearConsolidatedList;
    procedure CalculateReportData;
    procedure CalculateMonitorKeyReportData(Mwages: TreportDataRecPtr; SummaryType : integer; perstart, Sdate, edate: TDateTime);
    procedure CalculateMonitorDPLReportData(SummaryType : integer; perstart, Sdate, edate: TDateTime);
    procedure CalculateKeys(TotalNoColumns, DetailedReportingPeriod: integer);
    function getBalances(var Balances : array of currency; Accountno : integer; UsePlanData: Boolean; ConType : TConsolidateType): Boolean;
    function getDeptBalances(var Balances : array of currency; DeptId : Integer; Accountno : integer; UsePlanData : Boolean): Boolean;
    function setBalances(var Balances : array of currency; Dept_id : Integer; Accountno : integer; UsePlanData: Boolean): Boolean;
    procedure GetWages(ReportWages: TReportDataRecPtr);
    Function LocateAccountTitle(Accountno : integer): boolean;
    function getAccountSubTitle(SubTitle: Pchar; Accountno : Integer): boolean;
    function GetPastBalance(Accountno : Integer; pastDate: TDateTime): Currency;
    function setPastBalance(balance : Pcurrency; Accountno : Integer): Boolean;
    function clearPastBalance(balance : Pcurrency; Accountno : Integer): Boolean;
    function getRateBalances(var Balances : array of currency; MonitorDate : TDateTime): Boolean;
    function updateArray(var barray: array of currency;  Astart, Aend : integer; {PeriodStart, StartDate, EndDate: double;}
                     new: currency; roundto: Extended): boolean;
    function getTotalBalance(const balances: array of currency; periodstart, startdate, enddate : Double): currency;
//    function SetDBPassword(pwd: string): Boolean;
    procedure CopyNewPlanData(SrcStart, SrcEnd, DstStart : TDateTime; SrcPlan, ClearData : Boolean; Range : TRangeType);
    procedure sortQuotes(SortType: TQuoteSortType);
    procedure getTrackingkeyData(Sumcum : Boolean; StartDate, EndDate, perstart: TDate; SummaryType: integer);
    procedure getDeptTrackingkeyData(Var DeptReportDataRec : TConsolidDeptRecPtr; StartDate, EndDate, perstart: TDate; SummaryType: integer);
    procedure GPCatchUp(Callidx : Integer; CatchupAmount : Currency;var NewUnits, NewTari : Array of Currency; EndDate : TDate);
    procedure GetMonitoringAccountArray(NotGraph: Boolean);
    procedure getDetailedPLData(Sumcum : Boolean; StartDate, EndDate, perstart: TDate; SummaryType: integer);
    procedure GetDetailedOptions(CurrentDept : Integer);
    procedure SetDetailedOptions(CurrentDept : Integer);
    function DoesUserOptionExist(OptName: String): Boolean;
    function GetUserOption(OptName: String; Otype : TUOType): Variant;
    function SetUserOption(OptName: String; Otype : TUOType; Ovalue : Variant): Boolean;
    procedure getPlanBalanceonDateEx(DeptID : Integer; Baldate: TDateTime; AccountNo: integer; var Balance: Currency; Var PreviousDayNonZero: Boolean);
    function SetPlanBalanceonDateEx(DeptID : Integer; Baldate: TDateTime; AccountNo: integer; Balance: Currency): Boolean;
    procedure CalcNetProfit;
    procedure RoundArray(var balances: array of currency; startdate, enddate : double);
    procedure CheckPNLAdds(IsPlanData : Boolean);
    function roundCurrency(var value: currency; const noDP: smallint): currency;
    procedure CalculateCrossKeyReportData;
    procedure RefreshMonitoringData(DeptID : Integer; PlanDataRec : TPlanDataRecPtr);
    function GetLargestValue(DataRec : TPlanDataRecPtr; Reportindex: Integer): Currency;
    function GetLargestValueReport(DataRec : TReportDataRecPtr; Reportindex: Integer): Currency;
    function FindFirstandLastPlanDates(DeptId:integer; var Sdate, Edate : TDateTime): Boolean;
    function FindConsolidDeptindex(Deptid : integer): integer;
  end;

var
  DataCollect: TDataCollector;
  PlanDataList : TList;
  PlanExpDataList: TList;
  ReportDataList : TList;
  DeptReportDataList : TList;
  ConsolidList: TList;
  QuoteList : TList;
  MonitoringDataList : TList;
  MonitoringExpDataList : TList;
  Prototype : string;
  VersionInfo : String;
  Slashchar : char;
  SummaryPeriodIndexArray : array[0 .. NUM_WEEKS + 1] of Integer;
  MonitoringAccountarray : array[0..MONITORINGACCOUNTLIST - 1] of integer;
  DetailedExpensesPast : Boolean;
  SortLoopcnt : Integer;
  TestPtr : Pointer;
{$IFDEF Video}
  CamtasiaRecorder1 : TCamtasiaRecorder;
  TakeCount : Integer;
{$ENDIF}

function getListPastBalance(ListIndex: integer): currency;
procedure setListPastBalance(ListIndex: integer; balance : currency);
function getListPlanBalance(ListIndex: integer): currency;
procedure setListPlanBalance(Listindex: integer; balance : currency; DoUpdateArray : Boolean);
function getaccountlistindex(accountno: integer): integer;
function getsummarylistindex(accountno: integer): integer;
function getMonitoringSaleslistindex(accountno: integer): integer;
function getMonitoringSalesInputindex(accountno: integer): integer;
function getMonitoringAccountlistindex(accountno: integer): integer;
function getKeyaccountlistindex(accountno: integer): integer;
function getexpaccountlistindex(accountno: integer): integer;
function GetReportAccountIndex(accountNo : Integer): Integer;
procedure sortExpenseList(UseLPlanData : Boolean);
function createSummaryIndex(SummaryType: Integer; StartDate, Enddate: TDateTime): Integer;
procedure UpdateBalances(var Barray: array of currency; new: currency);
procedure AdjustBalances(var Barray, totalexp: array of currency; new: currency);
procedure UpdateFromSummaryBalances(var Barray, totalExp: array of currency; new: currency; fromperiod, toperiod, AccountNo: integer);
function getWIBalance(WIset, WIAccount : integer): currency;
procedure setWIBalance(WIset, WIAccount : integer; balance : Currency);
function FindPrinterIndex(NewPrinter : string): integer;
function BuildSummary(AccountNo: Integer; Startdate, Enddate: TDateTime; Detail: TDetailedBalArray; var Summary: TSummaryBalArray): Currency;
function GetFileModDate(Filename: String): TDateTime;
function CheckFileName(basefolder, filename: String): string;
function ReportFileInuse(Filename: String): Boolean;
procedure ShowConcatMessage(Flname: String);

const
  SummaryPlan : array[0..SUMMARYPLANLIST  - 1] of
   integer = (SALES, COGS, GROSSPROFIT, TOTALEXPENSES,
              NETOPERATINGPROFIT, OTHERINCOME,
              NETPROFIT, POTENTIAL, BILLED, SUBCONTRACTORS,
              ACCOUNT_REC, CASH_AT_BANK, STOCK, ACCOUNT_PAY, FTEPROD, FTEOTHER, WHATIF,
              SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY, HRSPERDAY);  // DETAILEDOPT

  DetailedPlan : array[0..DETAILEDPLANLIST - 1] of
   integer = (SALES, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT,  NETPROFIT,
   // these are editable
             OTHERINCOME, POTENTIAL, BILLED, SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY, FTEOTHER, FTEPROD);

  DetailPlanGraph : array[0..DETAILPLANGRAPHLIST - 1] of
   integer = (SALES, GROSSPROFIT, TOTALEXPENSES, NETOPERATINGPROFIT,
             OTHERINCOME, NETPROFIT, POTENTIAL, BILLED, SALESUNIT, GPUNIT,
             GPPC, PRODUCTIVITY);

  WorkBackAccounts : array[0..WORKBACKLIST - 1] of
   integer = (SALES, GROSSPROFIT, WBMATERIALS, WBSUBCON, WBMATERIALMU, WBSUBCONMU,
             WBLABOURMU, WBLABOURRATE);

  KeyReportAccounts : array[0..19] of
   integer = (SALES, GROSSPROFIT, GPPC, TOTALEXPENSES, TOTALEXPPC,
              NETPROFIT, NPPC, POTENTIAL, BILLED, PRODUCTIVITY, HRSPERDAY, FTEPROD,
              SALESUNIT, GPUNIT, TOTALEXPUNIT, NPUNIT, {SALESWAGE, GPWAGE, NPWAGE,}
              FTEOTHER, SALESFTE, GPFTE, NPFTE);

  ConSolidKeyAccounts : array[0..7] of
   integer = (SALES, GROSSPROFIT, GPPC, POTENTIAL, BILLED, PRODUCTIVITY,
              SALESUNIT, GPUNIT);

  KeyTargets : array[0..DETAILEDTARGETLIST - 1] of
   integer = (SALES, GROSSPROFIT, GPPC, TOTALEXPENSES, NETOPERATINGPROFIT, OTHERINCOME, NETPROFIT,
              POTENTIAL, BILLED, PRODUCTIVITY, HRSPERDAY, SALESUNIT, GPUNIT);

  MonitoringSalesAccounts : array[0..MONITORSALESLIST - 1] of
   integer = (SALES, COGS, SUBCONTRACTORS, GROSSPROFIT, OTHERINCOME,
           POTENTIAL, BILLED, SALESUNIT, GPUNIT, GPPC, PRODUCTIVITY);    // DETAILEDOPT

  MonitoringSalesInput : array[0..MONITORSALESLIST - 1] of
    integer = (SALES, COGS, GROSSPROFIT, GPPC, POTENTIAL, BILLED, GPUNIT, SUBCONTRACTORS,
            OTHERINCOME, SALESUNIT, PRODUCTIVITY);  // DETAILEDOPT

{  CashFlowMain : array[0.. CASHFLOWLIST - 1] of
    integer = (CASH_AT_BANK, ACCOUNT_REC, STOCK, CASH_MAN_FUND,
              MARKETSEC, OTHER_CURRENT_ASSETS, TOTAL_CURRENT_ASSETS, NON_DEP_ASSETS,
              DEP_ASSETS, INTANG_ASSETS, BANK_OVERDRAFT, ACCOUNT_PAY, ACCRUED_EXPENSES,
              TAX_PAYABLE, INC_TAX_PAYABLE, DIVIDENDS_PAYABLE, OTHER_CURRENT_LIAB,
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
              TAX_ADJUSTMENTS, INC_TAX_INCURRED, INC_TAX_PAID, DIV_DECLARED, DIV_PAID,
              OTHER_LIAB_INCURRED, OTHER_LIAB_PAID, LOANS_INCURRED, LOANS_REPAID,
              EQUITY_INJECTED, EQUITY_WITHDRAWN, AR_DAYS, STOCK_DAYS, AP_DAYS, AE_DAYS);
}
const
  NoPrompt = 1;
  UseFileName = 2;
  Concatenate = 4;
  DisableCompression = 8;
  EmbedFonts = 16;
  OverwriteFile = $0000;
  ConfirmOverWrite = $1000;
  AppendFile = $2000;
  AddDateTime = $3000;
  AddIDNumber = $4000;

implementation

{ ---------------------------------------------------------------------------- }
{ -- Balance array's manipuations routines                                     }
{ ---------------------------------------------------------------------------- }
{
  Routine to manipulate an array of currencys so that the total equals that
  passed. Takes into account the current balance of each elment and uses this
  to calculate the new balances as a percentage of the overall total.

  barray: The array of currencys to manipulate
  astart: The first element in the array to use
  aend:   The last element in the array to use
  new:    The new total the astart to aend element must total too

  Roundto:
  This string can be of zero length in which case maximum
  procision is retained, else it should be one of the following:-
  0         for rounding to the nearest whole currency figure;
  0.0       for rounding to the first decimal place or;
  0.00      etc for further precision.

  11/10/1999 Implementation failed to roundto correctly. We need
                 an extended which multiplies then divides each element of the array
                 to correctly get the right result.
                 0 means no rounding,
                 1 means move the decimal place to the right , round and move to the left, etc.

  If the current sum or the array is zero, it will divide the New value evenly
  and rounded dynamically if roundto is not zero length.
  If the new value is zero, the array will be initialized.
  In all other cases, the sum of the array will equal the new value by
  apportioning the new value based on the relative values of each element.
  ---------------------------------------------------------------------------- }
function TDataCollector.updateArray(var barray: array of currency; Astart, Aend : integer; {PeriodStart, StartDate, EndDate: double;}
                     new: currency; roundto: Extended): boolean;
var
  temp, temp1, temp2, temp3, temp4, temp5: extended;
  {astart, aend,} Cn : integer;
//  temprnd: extended;
begin
//  astart := trunc(StartDate) - trunc(PeriodStart);
//  aend := trunc(EndDate) - trunc(PeriodStart);
  temp1 := new;
  temp := 0;
  for cn := astart to aend do
    temp := temp + barray[cn];
  if new = 0 then
    begin
    for cn := astart to aend do
      barray[cn] := 0;
    end
  else
    if temp = 0 then
      begin
      temp3 := 0;
      temp4 := 0;
      temp2 := aend - (astart - 1);
      if temp2 > 0 then
        temp1 := temp1 / temp2;
      for cn := astart to aend do
        begin
        barray[cn] := temp1;
        if roundto > 0 then
          barray[cn] := round(roundto * 10 * barray[cn]) / (roundto * 10)
        else
          barray[cn] := round(barray[cn]);
        temp3 := temp3 + barray[cn];
        temp4 := temp4 + temp1;
        temp5 := temp4 - temp3;
        if temp5 > 1 then
          begin
          barray[cn] := barray[cn] + 1;
          temp3 := temp3 + 1;
          end;
        if temp5 < -1 then
          begin
          barray[cn] := barray[cn] - 1;
          temp3 := temp3 - 1;
          end;
        if cn = aend then
          barray[cn] := barray[cn] + new - temp3;
        end;
      end
    else
      begin
      temp4 := new;
      for cn := astart to aend do
        begin
        if (cn >= astart) AND (cn <= aend) then
          begin
          temp3 := barray[cn];
          if (temp4 <> 0) and (abs(temp) > 0.000001) then
            barray[cn] := barray[cn] * temp4 / temp;
          if roundto > 0 then
            barray[cn] := round(roundto * 10 * barray[cn]) / (roundto * 10)
          else
            barray[cn] := round(barray[cn]);
          temp4 := temp4 - barray[cn];
          temp := temp - temp3;
          if cn = aend then
            begin
            if roundto > 0 then
              temp4 := round(roundto * 10 * temp4) / (roundto * 10)
            else
              temp4 := round(temp4);
            barray[cn] := barray[cn] + temp4;
            end;
          end;
        end;
      end;
    result := True;
end;


procedure TDataCollector.RoundArray(var balances: array of currency; startdate, enddate : double);
var
  I: Integer;
  TmpRounded, TmpActual : Currency;
begin
  TmpRounded := 0;
  TmpActual := 0;
  for I := 0 to Trunc(Enddate) - Trunc(StartDate) do    // Iterate
    begin
    tmpactual := TmpActual + Balances[i];
    Balances[I] := Round(TmpActual) - tmpRounded;
    tmprounded := Tmprounded + Balances[I];
    end;    // for
end;

{ ---------------------------------------------------------------------------- }
{ -- gettotalbalance - Returns the total of all values with the range in the passed array   }
{ ---------------------------------------------------------------------------- }
function TDataCollector.getTotalBalance(const balances: array of currency; periodstart, startdate, enddate : double): currency;
var
  astart, aend, balIndex: integer;
begin
  result := 0;
  astart := trunc(Periodstart) - trunc(Startdate);
  aend := trunc(Enddate) - trunc(startDate);
  for balIndex := astart to aend do
    begin
    result := result  + balances[balIndex];
    if detailedTotal then
      DetailedArray[balindex] := DetailedArray[Balindex] + balances[balindex];
    end;
end;

procedure TDataCollector.GetConsolidatedList(CurrentDept: Integer; Consolidated : TConsolidateType);
var
  DeptRec : TDepartRecPtr;
  varg : Variant;
//  found : boolean;
  procedure LoadDept;
    begin
    DeptRec.DeptId := DataModuleClient.DeptConsolidDept_ID.value;
		DeptRec.Name := DataModuleClient.DeptConsolidRevenue_Group_Name.AsString;
		DeptRec.CurrencySymbol := DataModuleClient.DeptConsolidCurrency.AsString;
		DeptRec.ReportCode1 := DataModuleClient.DeptConsolidReport_Code1.AsString;
		DeptRec.ReportCode2 := DataModuleClient.DeptConsolidReport_Code2.AsString;
		DeptRec.UnitDescS := DataModuleClient.DeptConsolidSingular_UnitDesc.AsString;
		DeptRec.UnitDescP := DataModuleClient.DeptConsolidPlural_UnitDesc.AsString;
    end;

begin
  if Assigned(ConsolidList) then
    ClearConsolidatedList;
  if not Assigned(ConsolidList) then
    ConsolidList := TList.Create;
// this need rewriting
  DataModuleClient.DeptConsolid.active := True;
  if Consolidated = ctNormal then
    begin
    varg := CurrentDept;
    DataModuleClient.DeptConsolid.Locate('Dept_ID',Varg, []);
    new(DeptRec);
    LoadDept;
    ConsolidList.add(DeptRec);
    end
  else if Consolidated = ctBusiness then
    begin
    DataModuleClient.BusinessesRef.First;
    while DataModuleClient.BusinessesRef.eof = false do
      begin
      if DataModuleClient.BusinessesRefEXCLUDE_FROM_REPORTING.Value = 0 then
        begin
        DataModuleClient.DeptConsolid.First;
        while DataModuleClient.DeptConsolid.eof = false do
          begin
          //Check to see if this department is to be excluded
          if (DataModuleClient.DeptConsolidBranch_id.Value = DataModuleClient.BusinessesRefBRANCH_ID.Value)
             and (DataModuleClient.DeptConsolidEXCLUDE_FROM_REPORTING.Value = 0)
             and (DataModuleClient.DeptConsolidHIDDEN_DEPT.Value = 0) then
            begin
            new(DeptRec);
            LoadDept;
            ConsolidList.add(DeptRec);
            end;
          DataModuleClient.DeptConsolid.next;
          end;    // while
        end;
      DataModuleClient.BusinessesRef.next;
      end;    // while
    end
  else if Consolidated = ctDepartment then
    begin
    DataModuleClient.DeptConsolid.First;
    while DataModuleClient.DeptConsolid.eof = false do
      begin
      //Check to see if this department is to be excluded
      if (DataModuleClient.DeptConsolidEXCLUDE_FROM_REPORTING.Value = 0)
         and (DataModuleClient.DeptConsolidHIDDEN_DEPT.Value = 0) then
        begin
        new(DeptRec);
        LoadDept;
        ConsolidList.add(DeptRec);
        end;
      DataModuleClient.DeptConsolid.next;
      end;    // while
    end;
  DataModuleClient.DeptConsolid.active := False;
end;

function TDataCollector.FindConsolidDeptindex(Deptid : integer): integer;
var
  index: integer;
  Consolist : TDepartRecPtr;
begin
  Result := -1;  // if not found
  if Assigned(ConsolidList) then
    begin
    for index := 0 to ConsolidList.Count - 1 do
      begin
      Consolist := TDepartRecPtr(ConsolidList.Items[index]);
      if Consolist.DeptId = deptid then
        Result := index;
      end;
    end;
end;

procedure TDataCollector.ClearConsolidatedList;
var
  index: integer;
  Consolist : TDepartRecPtr;
begin
  if Assigned(ConsolidList) then
    begin
    for index := 0 to ConsolidList.Count - 1 do
      begin
      Consolist := TDepartRecPtr(ConsolidList.Items[index]);
      dispose(Consolist);
      end;
    ConsolidList.clear;
//    ConsolidList.free;
    end;
end;

procedure TDataCollector.getPlanningData;
var
  J: Integer;
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
  Lastdate : TDateTime;
begin
  if Assigned(PlanDataList) then
    begin
    if PlanDataList.Count > 0 then
      ClearPlanDataList;
    end;
  SortLoopcnt := 0;
  if not Assigned(PlanDataList) then
    PlanDataList := Tlist.create;
  DetailedTotal := false;
  DataModuleClient.DateRangers.IndexName := 'PK_DATERANGERS';
  DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
  DataModuleClient.DateRangers.Refresh;
  // What period is selected
  DataModuleClient.DateRef.first;
  // If Consolidated we must sort these dates by Period End Date and
  // increment J only when the Period end date changes.
  if (ConsolidList.count > 1) then
    begin
    DataModuleClient.DateRef.Active := False;
    DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
    DataModuleClient.Dateref.Filter := '';
    DataModuleClient.Dateref.Filtered := False;
    DataModuleClient.DateRef.Active := True;
    end
  else
    begin
    DataModuleClient.DateRef.Active := False;
    DataModuleClient.Dateref.Filter := 'Dept_ID = ' + inttostr(DataModuleClient.DepartmentsDEPT_ID.value);
    DataModuleClient.Dateref.Filtered := True;
    DataModuleClient.DateRef.Active := True;
   end;
  Lastdate := 0;
  J := 0;
  while DataModuleClient.DateRef.eof = False do
    begin
    if (LastDate <> DataModuleClient.DateRefEndDate.value) or (ConsolidList.count = 1) then
      inc(j);
    LastDate := DataModuleClient.DateRefEndDate.value;
    DataModuleClient.DateRef.edit;
    DataModuleClient.DateRefD_Index.value := j;
    DataModuleClient.DateRef.post;
    DataModuleClient.DateRef.Next;
    end;    // while
  if (ConsolidList.count > 1) then
    DataModuleClient.DateRef.IndexName := 'PK_DATERANGERS';
  DataModuleClient.DateRangers.Refresh;
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';

  for cn := 0 to integer(Trunc(sizeof(SummaryPlan)/sizeof(integer)) - 1) do
    begin
    new(PlanDatarec);
    FillChar(PlanDatarec^, sizeof(TPlanDataRecType), #0);
    // Get Account Titles
    PlanDatarec.Accountno := SummaryPlan[cn];
    if PlanDataRec.AccountNo < 10000 then
      begin
      if LocateAccountTitle(SummaryPlan[cn]) then
        begin
				PlanDatarec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.asstring;
				PlanDatarec.AccountSubTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_SUBTITLE.AsString;
        if DATAMODULECLIENT.AccountDetailsNON_CASH.Value <> 0 then
          PlanDataRec.Noncash := True
        else
          PlanDataRec.Noncash := False;
        if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.Value <> 0 then
          PlanDataRec.WagesAcc := True
        else
          PlanDataRec.WagesAcc := False;
        if DATAMODULECLIENT.AccountDetailsINTEREST_ACCOUNT.Value <> 0 then
          PlanDatarec.InterestAcc := true
        else
          PlanDatarec.InterestAcc := False;
        end;
      // Get Past Balance
//      if PlanDatarec.Accountno = TOTALOTHEREXPENSES then
//        Ltotal := 0;
      getPastBalances(PlanDataRec.PastBalances, SummaryPlan[cn]);
//        PlanDataRec^.PastResult := 0;
      // Set psdate and pedate and get Plan Balances
      if not getBalances(PlanDataRec.PlanDetail, SummaryPlan[cn], True, ctDepartment) then
        PlanDataRec.PlanTotal := 0
      else
        move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
      if (PlanDataRec.Accountno <> WHATIF) and (PlanDataRec.Accountno <> DETAILEDOPT) then
        begin
        PlanDataRec.PlanTotal := GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
        if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
          PlanDataRec.PlanTotal := PlanDataRec.PlanTotal / (Trunc(pedate - psdate) + 1);
        end;
      end;
    PlanDataList.Add(PlanDataRec);
    end;
  PlanLoaded := True;
end;

procedure TDataCollector.CheckPNLAdds(IsPlanData : Boolean);
var
  I,J, AStart, Aend : Integer;
  TOTALEXPRec : TPlanDataRecPtr;
  AccountRec : TPlanDataRecPtr;
  DirectRec : TPlanDataRecPtr;
  DepnIntRec : TPlanDataRecPtr;
begin
  TOTALEXPRec := PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)];
  TotalExpRec.PlanTotal := 0;
  new(DirectRec);
  FillChar(DirectRec^, sizeof(TPlanDataRecType), #0);
  new(DepnIntRec);
  FillChar(DepnIntRec^, sizeof(TPlanDataRecType), #0);
  if GGlobals.Produce_AccountFmt then
    begin
    I := getaccountlistindex(OTHERDIRECT);
    if I < 0 then
      begin
      DirectRec.Accountno := OTHERDIRECT;
      if LocateAccountTitle(OTHERDIRECT) then
        begin
				DirectRec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
				DirectRec.AccountSubTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_SUBTITLE.AsString;
        end;
      PlanDataList.Add(DirectRec);
      end;
    I := getaccountlistindex(DEPNINTEREST);
    if I < 0 then
      begin
      DepnIntRec.Accountno := DEPNINTEREST;
      if LocateAccountTitle(DEPNINTEREST) then
        begin
				DepnIntRec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
				DepnIntRec.AccountSubTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_SUBTITLE.AsString;
        end;
      PlanDataList.Add(DepnIntRec);
      end;
    DirectRec.PlanTotal := 0;
    DepnIntRec.PlanTotal := 0;
    end;
  astart := 0;
  aend := trunc(pedate) - trunc(psdate);
  for I := astart to aend do    // Iterate
    begin
    TOTALEXPRec.PlanDetail[I] := 0;
    if GGlobals.Produce_AccountFmt then
      begin
      DirectRec.PlanDetail[I] := 0;
      DepnIntRec.PlanDetail[I] := 0;
      end;
    end;
  // Get the real expense Total
  for I := 0 to PlanExpDataList.count -1 do    // Iterate
    begin
    AccountRec := PlanExpDataList.Items[I];
    // Planning Data
    for J := astart to aend do    // Iterate
      begin
      if GGlobals.Produce_AccountFmt then
        begin
        if AccountRec.Account_Group = AGDIRECTEXP then
          begin
          DirectRec.PlanDetail[J] := DirectRec.PlanDetail[J] + AccountRec.PlanDetail[J];
          DirectRec.PlanTotal := DirectRec.PlanTotal + AccountRec.PlanDetail[J];
          end
        else if AccountRec.Account_Group = AGDEPNINT then
          begin
          DepnIntRec.PlanDetail[J] := DepnIntRec.PlanDetail[J] + AccountRec.PlanDetail[J];
          DepnIntRec.PlanTotal := DepnIntRec.PlanTotal + AccountRec.PlanDetail[J];
          end
        else
          begin
          TOTALEXPRec.PlanDetail[J] := TOTALEXPRec.PlanDetail[J] + AccountRec.PlanDetail[J];
          TotalExpRec.PlanTotal := TotalExpRec.PlanTotal + AccountRec.PlanDetail[J];
          end
        end
      else
        begin
        TOTALEXPRec.PlanDetail[J] := TOTALEXPRec.PlanDetail[J] + AccountRec.PlanDetail[J];
        TotalExpRec.PlanTotal := TotalExpRec.PlanTotal + AccountRec.PlanDetail[J];
        end;
      end;
    end;
  // Past Data
  for J := 0 to 4 do    // Iterate
    begin
    TOTALEXPRec.PastBalances[J] := 0;
    if GGlobals.Produce_AccountFmt then
      begin
      DirectRec.PastBalances[J] := 0;
      DepnIntRec.PastBalances[J] := 0;
      end;
    for I := 0 to PlanExpDataList.count -1 do    // Iterate
      begin
      AccountRec := PlanExpDataList.Items[I];
      if GGlobals.Produce_AccountFmt then
        begin
        if AccountRec.Account_Group = AGDIRECTEXP then
          DirectRec.PastBalances[J] := DirectRec.pastBalances[J] + AccountRec.pastBalances[J]
        else if AccountRec.Account_Group = AGDEPNINT then
          DepnIntRec.PastBalances[J] := DepnIntRec.PastBalances[J] + AccountRec.PastBalances[J]
        else
          TOTALEXPRec.PastBalances[J] := TOTALEXPRec.PastBalances[J] + AccountRec.PastBalances[J];
        end
      else
        TOTALEXPRec.PastBalances[J] := TOTALEXPRec.PastBalances[J] + AccountRec.PastBalances[J];
      end;
    end;
  if GGlobals.Produce_AccountFmt then
    AccountingFmt := True
  else
    AccountingFmt := False;
  CalcNetProfit;
end;

procedure TDataCollector.getMonitoringData;
var
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
begin
  if Assigned(MonitoringDataList) then
    begin
    if MonitoringDataList.Count > 0 then
      ClearMonitoringDataList;
    end;
  if not Assigned(MonitoringDataList) then
    MonitoringDataList := Tlist.create;
  DetailedTotal := false;
  psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';
  for cn := 0 to integer(Trunc(sizeof(MonitoringSalesAccounts)/sizeof(integer)) - 1) do
    begin
    new(PlanDatarec);
    FillChar(PlanDatarec^, sizeof(TPlanDataRecType), #0);
    // Get Account Titles
    PlanDatarec.Accountno := MonitoringSalesAccounts[cn];
    if PlanDataRec.AccountNo < 10000 then
      begin
      if LocateAccountTitle(PlanDatarec.Accountno) then
        begin
				PlanDatarec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
				PlanDatarec.AccountSubTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_SUBTITLE.AsString;
        if DATAMODULECLIENT.AccountDetailsNON_CASH.Value <> 0 then
          PlanDataRec.Noncash := True
        else
          PlanDataRec.Noncash := False;
        if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.Value <> 0 then
          PlanDataRec.WagesAcc := True
        else
          PlanDataRec.WagesAcc := False;
        if DATAMODULECLIENT.AccountDetailsINTEREST_ACCOUNT.Value <> 0 then
          PlanDatarec.InterestAcc := true
        else
          PlanDatarec.InterestAcc := False;
        end;
      // Get Past Balance
//      if PlanDatarec.Accountno = TOTALOTHEREXPENSES then
//        Ltotal := 0;
//      getPastBalances(PlanDataRec.PastBalances, SummaryPlan[cn]);
//        PlanDataRec^.PastResult := 0;
      // Set psdate and pedate and get Plan Balances
      if not getBalances(PlanDataRec.PlanDetail, MonitoringSalesAccounts[cn], False, ctDepartment) then
        PlanDataRec.PlanTotal := 0
      else
        move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
      PlanDataRec.PlanTotal := GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
      if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal / (Trunc(pedate - psdate) + 1);
      end;
    MonitoringDataList.Add(PlanDataRec);
    end;
  MonitoringLoaded := True;
end;

procedure TDataCollector.RefreshMonitoringData(DeptID : Integer; PlanDataRec : TPlanDataRecPtr);
begin
   psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
   pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
   if not getDeptBalances(PlanDataRec.PlanDetail, DeptID, PlanDataRec.Accountno, False) then
     PlanDataRec.PlanTotal := 0
   else
     move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
   PlanDataRec.PlanTotal := GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
end;


procedure TDataCollector.getReportData;
var
//  SelectedDate: TDateTime;
  J: Integer;
  cn : integer;
//  LTotal : currency;
  ReportDataRec : TReportDataRecPtr;
  PlanDetail: TDetailedBalArray;
  LastDate : TDateTime;
begin
  if Assigned(ReportDataList)
    then begin
    if ReportDataList.Count > 0 then
      ClearReportDataList;
  end;
  if not Assigned(ReportDataList) then
    ReportDataList := Tlist.create;
  DetailedTotal := false;

  // What period is selected
  DataModuleClient.DateRef.first;
  if (ConsolidList.count > 1) then
    DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
  J := 0;
  Lastdate := 0;
  while DataModuleClient.DateRef.eof = False do
  begin
    if (LastDate <> DataModuleClient.DateRefEndDate.value) or (ConsolidList.count = 1) then
      inc(j);
    LastDate := DataModuleClient.DateRefEndDate.value;
    DataModuleClient.DateRef.edit;
    DataModuleClient.DateRefD_Index.value := j;
    DataModuleClient.DateRef.post;
    DataModuleClient.DateRef.Next;
  end;    // while
  if (ConsolidList.count > 1) then
    DataModuleClient.DateRef.IndexName := 'PK_DATERANGERS';
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';
  DataModuleClient.DateRangers.Refresh;
  for cn := 0 to integer(Trunc(sizeof(KeyReportAccounts)/sizeof(integer)) - 1) do
    begin
    new(ReportDatarec);
    FillChar(ReportDatarec^, sizeof(TReportDataRecType), #0);
    // Get Account Titles
    ReportDatarec.Accountno := KeyReportAccounts[cn];
    ReportDataRec.Annualise := True;
    ReportDataRec.FormatImage := REPORTROUNDCURRENCY;
    ReportDataRec.Symbol := '';
    if ReportDataRec.AccountNo < 10000 then
      begin
      if LocateAccountTitle(ReportDataRec.AccountNo) then
				ReportDatarec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
      // Get Past Balance
      getPastBalances(ReportDataRec.PastBalances, KeyReportAccounts[cn]);
      // Set psdate and pedate and get Plan Balances
      FillChar(PlanDetail, Sizeof(TDetailedBalArray), #0);
      if not getBalances(PlanDetail, KeyReportAccounts[cn], True, ctDepartment) then
        ReportDataRec.PlanTotal := 0
      else
        begin
        ReportDataRec.PlanTotal := GetTotalBalance(
          PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
        if (ReportDataRec.Accountno = FTEOTHER) or (ReportDataRec.Accountno = FTEPROD) then
          ReportDataRec.PlanTotal := ReportDataRec.PlanTotal / (Trunc(pedate - psdate) + 1);
        end;
      end;
    ReportDataList.Add(ReportDataRec);
    end;
  CalculateReportData;
end;

procedure TDataCollector.getTrackingkeyData(Sumcum : Boolean; StartDate, EndDate, perstart: TDate; SummaryType: integer);
var
  DetailEnd: Integer;
  I: Integer;
  J: Integer;
  cn : integer;
  ReportDataRec : TReportDataRecPtr;
  WagesRec : TReportDataRecPtr;
begin
  if Assigned(ReportDataList) then
    begin
    if ReportDataList.Count > 0 then
      ClearReportDataList;
    end;
  if not Assigned(ReportDataList) then
    ReportDataList := Tlist.create;
  DetailedTotal := false;
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';

  for cn := 0 to integer(Trunc(sizeof(KeyReportAccounts)/sizeof(integer)) - 1) do
    begin
    new(ReportDatarec);
    FillChar(ReportDatarec^, sizeof(TReportDataRecType), #0);
    // Get Account Titles
    ReportDatarec.Accountno := KeyReportAccounts[cn];
    ReportDataRec.Annualise := False;
    ReportDataRec.FormatImage := REPORTROUNDCURRENCY;
    ReportDataRec.Accumulate := False;
    if reportDataRec.accountNo = SALES then
      ReportDataRec.Symbol := '';

    ReportDataRec.Symbol := '';
    if ReportDataRec.AccountNo < 10000 then
      begin
      ReportDataRec.accumulate := Sumcum;
      if (ReportDataRec.Accountno = FTEProd) or (ReportDataRec.Accountno = FTEOTHER) then
        ReportDataRec.accumulate := False;
      if LocateAccountTitle(ReportDataRec.Accountno) then
				ReportDatarec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
      // Set psdate and pedate and get Plan Balances
      psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
      pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
      msdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
      medate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
// get actual data
      if not getBalances(ReportDataRec^.MonDetail, KeyReportAccounts[cn], False, ctDepartment) then
        begin
        ReportDataRec.TrackBalances[trytdactual] := 0;
        ReportDataRec.TrackBalances[trperactual] := 0;
        end
      else
        begin
        ReportDataRec.TrackBalances[trytdactual] := GetTotalBalance(
          ReportDataRec^.MonDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        if (ReportDataRec.Accountno = FTEOTHER) or (ReportDataRec.Accountno = FTEPROD) then
          ReportDataRec.TrackBalances[trytdactual] := ReportDataRec.TrackBalances[trytdactual] / (Trunc(EndDate - StartDate) + 1);

        ReportDataRec.TrackBalances[trperactual] := GetTotalBalance(
          ReportDataRec^.MonDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        if (ReportDataRec.Accountno = FTEOTHER) or (ReportDataRec.Accountno = FTEPROD) then
          ReportDataRec.TrackBalances[trperactual] := ReportDataRec.TrackBalances[trperactual] / (Trunc(EndDate - perstart) + 1);
        end;

// get Plan data
      if not getBalances(ReportDataRec^.PlanDetail, KeyReportAccounts[cn], True, ctDepartment) then
        begin
        ReportDataRec.TrackBalances[trytdPlan] := 0;
        ReportDataRec.TrackBalances[trperPlan] := 0;
        end
      else
        begin
        ReportDataRec.TrackBalances[trytdPlan] := GetTotalBalance(
          ReportDataRec^.PlanDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        if (ReportDataRec.Accountno = FTEOTHER) or (ReportDataRec.Accountno = FTEPROD) then
          ReportDataRec.TrackBalances[trytdPlan] := ReportDataRec.TrackBalances[trytdPlan] / (Trunc(EndDate - StartDate) + 1);
        ReportDataRec.TrackBalances[trperPlan] := GetTotalBalance(
          ReportDataRec^.PlanDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        if (ReportDataRec.Accountno = FTEOTHER) or (ReportDataRec.Accountno = FTEPROD) then
          ReportDataRec.TrackBalances[trperPlan] := ReportDataRec.TrackBalances[trperplan] / (Trunc(EndDate - perstart) + 1);
        end;
      end;
    ReportDataList.Add(ReportDataRec);
    end;
  New(WagesRec);
  FillChar(Wagesrec^, sizeof(TReportDataRecType), #0);
  WagesRec.Accumulate := sumcum;
  // get Wages balances
{
  for I := FIRSTEXPENSE to (TOTALEXPENSES - 1) do    // Iterate
    begin
    LocateAccountTitle(I);
    if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.value > 0 then
      begin
      for Cnt := trperactual to trytdvar do    // Iterate
        wagesTmp[Cnt] := 0;
      if not getBalances(WagesRec^.MonDetail, I, False, ctDepartment) then
        begin
        wagesTmp[trytdactual] := 0;
        WagesTmp[trperactual] := 0;
        end
      else
        begin
        WagesTmp[trytdactual] := GetTotalBalance(
          WagesRec^.MonDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        WagesTmp[trperactual] := GetTotalBalance(
          WagesRec^.MonDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        end;

      // get Plan data
      if not getBalances(WagesRec^.PlanDetail, I, True, ctDepartment) then
        begin
        WagesTmp[trytdPlan] := 0;
        WagesTmp[trperPlan] := 0;
        end
      else
        begin
        WagesTmp[trytdPlan] := GetTotalBalance(
          WagesRec^.PlanDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        WagesTmp[trperPlan] := GetTotalBalance(
          WagesRec^.PlanDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
      // Add accumulated balance to master record
        end;
      for Cnt := trperactual to trytdvar do    // Iterate
        WagesRec.TrackBalances[Cnt] := WagesRec.TrackBalances[Cnt] + WagesTmp[Cnt];
    end;
  end;
}

  // BuildSummary Data for Plan and Monitoring
  for I := 0 to ReportDataList.Count do    // Iterate
    begin
    if I < ReportDataList.count then
      ReportDataRec := ReportDataList.items[i]
    else
      ReportDataRec := WagesRec;
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.PlanDetail, ReportDataRec^.PlanSummary);
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.MonDetail, ReportDataRec^.MonSummary);
    if sumcum and ReportDataRec.Accumulate then
      begin
      if SummaryType = 0 then
        begin
        DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1;
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanDetail[J] := ReportDataRec.PlanDetail[J] + ReportDataRec.PlanDetail[J - 1];
          ReportDataRec.MonDetail[J] := ReportDataRec.MonDetail[J] + ReportDataRec.MonDetail[J - 1];
          end;    // for
        end
      else
        begin
        if Summarytype < 7 then
          Detailend := 1
        else
          Detailend := 0;
        while (SummaryPeriodIndexArray[Detailend] <> 0) and (Detailend < (NUM_WEEKS - 1)) do inc(Detailend);
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanSummary[J] := ReportDataRec.PlanSummary[J] + ReportDataRec.PlanSummary[J - 1];
          ReportDataRec.MonSummary[J] := ReportDataRec.MonSummary[J] + ReportDataRec.MonSummary[J - 1];
          end;    // for
        end;
      end;
    end;    // for
  CalculateMonitorKeyReportData(wagesRec, SummaryType, perstart, StartDate, EndDate);
  Dispose(WagesRec);
end;

procedure TDataCollector.getDeptTrackingkeyData(Var DeptReportDataRec : TConsolidDeptRecPtr; StartDate, EndDate, perstart: TDate; SummaryType: integer);
var
  I: Integer;
  II: TTrackingBals;
  cn : integer;
  AccountNo : Integer;
  DetailBalances : TDetailedBalarray;
begin
  DetailedTotal := false;
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';
  for I := 0 to 7 do    // Iterate
    begin
    for II := trperactual to trytdvar do    // Iterate
      DeptReportDataRec.SummaryBalances[I][II] := 0;
    end;    // for
  for cn := 0 to integer(Trunc(sizeof(ConSolidKeyAccounts)/sizeof(integer)) - 1) do
    begin
    // Get Account Titles

    Accountno := ConSolidKeyAccounts[cn];
//    ReportDataRec.Annualise := False;
//    ReportDataRec.FormatImage := REPORTROUNDCURRENCY;
//    ReportDataRec.Accumulate := False;
//    if accountNo = SALES then
//      ReportDataRec.Symbol := '';

//    ReportDataRec.Symbol := '';
    if AccountNo < 10000 then
      begin
      // Set psdate and pedate and get Plan Balances
      psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
      pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
      msdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
      medate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
// get actual data
      if not getDeptBalances(DetailBalances, DeptReportDataRec.deptid,  AccountNo, False) then
        begin
        DeptReportDataRec.SummaryBalances[cn][trytdactual] := 0;
        DeptReportDataRec.SummaryBalances[cn][trperactual] := 0;
        end
      else
        begin
        DeptReportDataRec.SummaryBalances[cn][trytdactual] := GetTotalBalance(
          DetailBalances,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        if (Accountno = FTEOTHER) or (Accountno = FTEPROD) then
          DeptReportDataRec.SummaryBalances[cn][trytdactual] := DeptReportDataRec.SummaryBalances[cn][trytdactual] / (Trunc(EndDate - StartDate) + 1);

        DeptReportDataRec.SummaryBalances[cn][trperactual] := GetTotalBalance(
          DetailBalances,
          double(perstart),
          double(StartDate),
          double(EndDate));
        if (Accountno = FTEOTHER) or (Accountno = FTEPROD) then
          DeptReportDataRec.SummaryBalances[cn][trperactual] := DeptReportDataRec.SummaryBalances[cn][trperactual] / (Trunc(EndDate - perstart) + 1);
        end;

// get Plan data
      if not getDeptBalances(DetailBalances, DeptReportDataRec.deptid,  AccountNo, True) then
        begin
        DeptReportDataRec.SummaryBalances[cn][trytdPlan] := 0;
        DeptReportDataRec.SummaryBalances[cn][trperPlan] := 0;
        end
      else
        begin
        DeptReportDataRec.SummaryBalances[cn][trytdPlan] := GetTotalBalance(
          DetailBalances,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        if (Accountno = FTEOTHER) or (Accountno = FTEPROD) then
          DeptReportDataRec.SummaryBalances[cn][trytdPlan] := DeptReportDataRec.SummaryBalances[cn][trytdPlan] / (Trunc(EndDate - StartDate) + 1);
        DeptReportDataRec.SummaryBalances[cn][trperPlan] := GetTotalBalance(
          DetailBalances,
          double(perstart),
          double(StartDate),
          double(EndDate));
        if (Accountno = FTEOTHER) or (Accountno = FTEPROD) then
          DeptReportDataRec.SummaryBalances[cn][trperPlan] := DeptReportDataRec.SummaryBalances[cn][trperplan] / (Trunc(EndDate - perstart) + 1);
        end;
      end;
    end;
{
  for I := FIRSTEXPENSE to (TOTALEXPENSES - 1) do    // Iterate
    begin
    LocateAccountTitle(I);
    if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.value > 0 then
      begin
      for Cnt := trperactual to trytdvar do    // Iterate
        wagesTmp[Cnt] := 0;
      if not getBalances(WagesRec^.MonDetail, I, False, ctDepartment) then
        begin
        wagesTmp[trytdactual] := 0;
        WagesTmp[trperactual] := 0;
        end
      else
        begin
        WagesTmp[trytdactual] := GetTotalBalance(
          WagesRec^.MonDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        WagesTmp[trperactual] := GetTotalBalance(
          WagesRec^.MonDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        end;

      // get Plan data
      if not getBalances(WagesRec^.PlanDetail, I, True, ctDepartment) then
        begin
        WagesTmp[trytdPlan] := 0;
        WagesTmp[trperPlan] := 0;
        end
      else
        begin
        WagesTmp[trytdPlan] := GetTotalBalance(
          WagesRec^.PlanDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        WagesTmp[trperPlan] := GetTotalBalance(
          WagesRec^.PlanDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
      // Add accumulated balance to master record
        end;
      for Cnt := trperactual to trytdvar do    // Iterate
        WagesRec.TrackBalances[Cnt] := WagesRec.TrackBalances[Cnt] + WagesTmp[Cnt];
    end;
  end;
}

  // BuildSummary Data for Plan and Monitoring
{
  for I := 0 to ReportDataList.Count do    // Iterate
    begin
    if I < ReportDataList.count then
      ReportDataRec := ReportDataList.items[i]
    else
      ReportDataRec := WagesRec;
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.PlanDetail, ReportDataRec^.PlanSummary);
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.MonDetail, ReportDataRec^.MonSummary);
    if sumcum and ReportDataRec.Accumulate then
      begin
      if SummaryType = 0 then
        begin
        DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1;
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanDetail[J] := ReportDataRec.PlanDetail[J] + ReportDataRec.PlanDetail[J - 1];
          ReportDataRec.MonDetail[J] := ReportDataRec.MonDetail[J] + ReportDataRec.MonDetail[J - 1];
          end;    // for
        end
      else
        begin
        if Summarytype < 7 then
          Detailend := 1
        else
          Detailend := 0;
        while (SummaryPeriodIndexArray[Detailend] <> 0) and (Detailend < (NUM_WEEKS - 1)) do inc(Detailend);
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanSummary[J] := ReportDataRec.PlanSummary[J] + ReportDataRec.PlanSummary[J - 1];
          ReportDataRec.MonSummary[J] := ReportDataRec.MonSummary[J] + ReportDataRec.MonSummary[J - 1];
          end;    // for
        end;
      end;
    end;    // for
  CalculateMonitorKeyReportData(wagesRec, SummaryType, perstart, StartDate, EndDate);
  Dispose(WagesRec);
}
end;

procedure TDataCollector.GPCatchUp(Callidx : Integer; CatchupAmount : Currency;var NewUnits, NewTari : Array of Currency; EndDate : TDate);
var
  I ,K : Integer;
  GPBal, UnitsBal : TDetailedBalArray;
  NewGP, OldUnits, OldTari : array[0..7] of currency;
  Cnt : Integer;
  CurrGP : Currency;
begin
  psdate := Enddate + 1;
  pedate := Psdate + (8 * 7); // 6 weeks ahead
  if CatchupAmount < 0 then
    CatchupAmount := CatchupAmount * -1;
// get actual data
  getBalances(GPBal, GROSSPROFIT, True, ctDepartment);
  getBalances(UnitsBal, BILLED, True, ctDepartment);
  CurrGP := 0;
  for Cnt := 0 to 7 do    // Iterate
    begin
    K := cnt * 7 + 7;
    NewGp[cnt] := 0;
    OldUnits[cnt] := 0;
    for I := (k - 7) to (K - 1) do    // Iterate
      begin
      newGP[cnt] := NewGP[cnt] + GPBal[I];
      OldUnits[cnt] := OldUnits[cnt] + UnitsBal[I];
      end;
    if OldUnits[cnt] <> 0 then
      OldTari[cnt] := NewGP[cnt] / OldUnits[cnt]
    else
      OldTari[cnt] := 0;
    if Callidx = -1 then
      begin
      NewUnits[cnt] := OldUnits[cnt];
      NewTari[cnt] := OldTari[cnt];
      end
    else
      begin
      NewUnits[cnt] := 0;
      NewTari[cnt] := 0;
      end;
    if cnt <= Callidx then
      currGP := currGP + NewGP[cnt];
    end;
  if Callidx > -1 then
    begin
    for I := 0 to Callidx do    // Iterate
      begin
      if CurrGP <> 0 then
        newGP[i] := NewGP[i] + CatchupAmount * NewGP[I]/CurrGp;
      if OldUnits[I] <> 0 then
        NewTari[i] := NewGP[i] / OldUnits[i]
      else
        NewTari[i] := 0;
      if OldTari[i] <> 0 then
        NewUnits[i] := NewGP[i] / OldTari[i]
      else
        NewUnits[i] := 0;
      end;
    end;    // for
end;

procedure TDataCollector.getDetailedPLData(SumCUM : Boolean; StartDate, EndDate, perstart: TDate; SummaryType: integer);
var
  DetailEnd: Integer;
//  NoofPeriods: Integer;
  I: Integer;
  J: Integer;
  cn : integer;
	ReportDataRec : TReportDataRecPtr;
	ReportDIREXP : TReportDataRecPtr;
	ReportSALES : TReportDataRecPtr;
	ReportCOGS : TReportDataRecPtr;
	ReportGP : TReportDataRecPtr;
	ReportTotalExp : TReportDataRecPtr;
	ReportNOP : TReportDataRecPtr;
	ReportOTHERINC : TReportDataRecPtr;
	ReportDEPNINTExp : TReportDataRecPtr;
	ReportNP : TReportDataRecPtr;
//  PlanDetail: TDetailedBalArray;
//  SubTitle : array[0..120] of char;
begin
	ReportDIREXP := nil;
	ReportSALES := nil;
	ReportCOGS := nil;
	ReportNOP := nil;
	ReportOTHERINC := nil;
	ReportDEPNINTExp := nil;

  if Assigned(ReportDataList) then
    begin
    if ReportDataList.Count > 0 then
      ClearReportDataList;
    end;
  if not Assigned(ReportDataList) then
    ReportDataList := Tlist.create;
  DetailedTotal := false;
  psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value;
  pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.Value;
  msdate := DataModuleClient.DepartmentsCurrentMonitoringStart.Value;
  medate := DataModuleClient.DepartmentsCurrentMonitoringEnd.Value;
  Cn:= 0;
  while MonitoringAccountArray[cn] <> 0 do
    begin
    new(ReportDatarec);
    FillChar(ReportDatarec^, sizeof(TReportDataRecType), #0);
    // Get Account Titles
    ReportDatarec.Accountno := MonitoringAccountArray[cn];
    ReportDataRec.Annualise := False;
    ReportDataRec.FormatImage := REPORTROUNDCURRENCY;
    if reportDataRec.accountNo = SALES then
      ReportDataRec.Symbol := '';

    ReportDataRec.Symbol := '';
    if ReportDataRec.AccountNo < 10000 then
      begin
      ReportDataRec.accumulate := Sumcum;
      if LocateAccountTitle(ReportDatarec.Accountno)then
        begin
				ReportDatarec.AccountTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
				ReportDataRec.Account_Group :=  DATAMODULECLIENT.accountDetailsAccount_group.value;
				if Datamoduleclient.AccountDetailsACCOUNT_DR.value = 1 then
          ReportDataRec.Account_DR := true
        else
          ReportDataRec.Account_DR := False;
        end;
      // get actual data
      if not getBalances(ReportDataRec^.MonDetail, MonitoringAccountArray[cn], False, ctDepartment) then
        begin
        ReportDataRec.TrackBalances[trytdactual] := 0;
        ReportDataRec.TrackBalances[trperactual] := 0;
        end;
{
      else
        begin
        ReportDataRec.TrackBalances[trytdactual] := GetTotalBalance(
          ReportDataRec^.MonDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));

        ReportDataRec.TrackBalances[trperactual] := GetTotalBalance(
          ReportDataRec^.MonDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        end;
}
      // get Plan data
      if not getBalances(ReportDataRec^.PlanDetail, MonitoringAccountArray[cn], True, ctDepartment) then
        begin
        ReportDataRec.TrackBalances[trytdPlan] := 0;
        ReportDataRec.TrackBalances[trperPlan] := 0;
        end;
{
      else
        begin
        ReportDataRec.TrackBalances[trytdPlan] := GetTotalBalance(
          ReportDataRec^.PlanDetail,
          double(StartDate),
          double(StartDate),
          double(EndDate));
        ReportDataRec.TrackBalances[trperPlan] := GetTotalBalance(
          ReportDataRec^.PlanDetail,
          double(perstart),
          double(StartDate),
          double(EndDate));
        end;
}
      end;
    ReportDataList.Add(ReportDataRec);
    inc(cn);
    end;
  ReportGP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(GROSSPROFIT)]);
  ReportTotalExp := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(TOTALEXPENSES)]);
  ReportNP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETPROFIT)]);
  if GGlobals.Produce_AccountFmt then
    begin
    ReportSALES := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(SALES)]);
    ReportCOGS := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(COGS)]);
    ReportDIREXP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(OTHERDIRECT)]);
    ReportNOP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETOPERATINGPROFIT)]);
    ReportOTHERINC := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(OTHERINCOME)]);
    ReportDEPNINTExp := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(DEPNINTEREST)]);

    FillChar(ReportDIREXP^.PlanDetail, Sizeof(TDetailedBalArray), #0);
    FillChar(ReportTotalExp^.PlanDetail, Sizeof(TDetailedBalArray), #0);
    FillChar(ReportDEPNINTExp^.PlanDetail, Sizeof(TDetailedBalArray), #0);
    FillChar(ReportDIREXP^.MonDetail, Sizeof(TDetailedBalArray), #0);
    FillChar(ReportTotalExp^.MonDetail, Sizeof(TDetailedBalArray), #0);
    FillChar(ReportDEPNINTExp^.MonDetail, Sizeof(TDetailedBalArray), #0);
    // get totals
    for J := 0 to ReportDataList.Count - 1 do    // Iterate
      begin
      ReportDataRec := ReportDataList.items[J];
      ReportDataRec.PlanTotal := 0;
      ReportDataRec.MonTotal := 0;
      for I := 0 to trunc(EndDate - Startdate) do    // Iterate
        begin
        if (ReportDataRec.Account_Group = AGDIRECTEXP) and (ReportDataRec.Accountno <> OTHERDIRECT) then
          begin
          ReportDIREXP.PlanDetail[i] := ReportDIREXP.PlanDetail[i] + ReportDataRec.plandetail[i];
          ReportDIREXP.MonDetail[i] := ReportDIREXP.MonDetail[i] + ReportDataRec.Mondetail[i];
          end;
        if (ReportDataRec.Account_Group = AGEXPENSES) and (ReportDataRec.Accountno <> TOTALEXPENSES) then
          begin
          ReportTotalExp.PlanDetail[i] := ReportTotalExp.PlanDetail[i] + ReportDataRec.plandetail[i];
          ReportTotalExp.MonDetail[i] := ReportTotalExp.MonDetail[i] + ReportDataRec.Mondetail[i];
          end;
        if (ReportDataRec.Account_Group = AGDEPNINT) and (ReportDataRec.Accountno <> DEPNINTEREST) then
          begin
          ReportDEPNINTExp.PlanDetail[i] := ReportDEPNINTExp.PlanDetail[i] + ReportDataRec.plandetail[i];
          ReportDEPNINTExp.MonDetail[i] := ReportDEPNINTExp.MonDetail[i] + ReportDataRec.Mondetail[i];
          end;
        ReportDataRec.PlanTotal := ReportDataRec.PlanTotal + ReportDataRec.plandetail[i];
        ReportDataRec.MonTotal := ReportDataRec.MonTotal + ReportDataRec.Mondetail[i];
        end;
      end;
      ReportGP.PlanTotal := ReportSALES.PlanTotal - ReportCOGS.PlanTotal - ReportDIREXP.PlanTotal;
      ReportNOP.PlanTotal := ReportGP.PlanTotal - ReportTotalExp.PlanTotal;
      ReportNP.PlanTotal := ReportNOP.PlanTotal + ReportOTHERINC.PlanTotal - ReportDEPNINTExp.PlanTotal;
      ReportGP.monTotal := ReportSALES.monTotal - ReportCOGS.monTotal - ReportDIREXP.MonTotal;
      ReportNOP.MonTotal := ReportGP.monTotal - ReportTotalExp.MonTotal;
      ReportNP.MonTotal := ReportNOP.MonTotal + ReportOTHERINC.MonTotal - ReportDEPNINTExp.MonTotal;
    end;
  for I := 0 to trunc(EndDate - Startdate) do    // Iterate
    begin
    if GGlobals.Produce_AccountFmt then
      begin
      ReportGP.PlanDetail[i] := ReportSALES.PlanDetail[i] - ReportCOGS.PlanDetail[i] - ReportDIREXP.PlanDetail[i];
      ReportNOP.PlanDetail[i] := ReportGP.PlanDetail[i] - ReportTotalExp.PlanDetail[i];
      ReportNP.PlanDetail[i] := ReportNOP.PlanDetail[i] + ReportOTHERINC.PlanDetail[i] - ReportDEPNINTExp.PlanDetail[i];
      ReportGP.monDetail[i] := ReportSALES.monDetail[i] - ReportCOGS.monDetail[i] - ReportDIREXP.MonDetail[i];
      ReportNOP.MonDetail[i] := ReportGP.monDetail[i] - ReportTotalExp.MonDetail[i];
      ReportNP.MonDetail[i] := ReportNOP.MonDetail[i] + ReportOTHERINC.MonDetail[i] - ReportDEPNINTExp.MonDetail[i];
      end
    else
      ReportNP.MonDetail[i] := ReportGP.monDetail[i] - ReportTotalExp.monDetail[i];
    end;    // for

  for I := 0 to ReportDataList.Count - 1 do    // Iterate
    begin
    ReportDataRec := ReportDataList.items[i];
    ReportDataRec.TrackBalances[trytdPlan] := GetTotalBalance(ReportDataRec^.PlanDetail, double(StartDate), double(StartDate), double(EndDate));
    ReportDataRec.TrackBalances[trperPlan] := GetTotalBalance(ReportDataRec^.PlanDetail, double(perstart), double(StartDate), double(EndDate));
    ReportDataRec.TrackBalances[trytdactual] := GetTotalBalance(ReportDataRec^.MonDetail, double(StartDate), double(StartDate), double(EndDate));
    ReportDataRec.TrackBalances[trperactual] := GetTotalBalance(ReportDataRec^.MonDetail, double(perstart), double(StartDate), double(EndDate));
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.PlanDetail, ReportDataRec^.PlanSummary);
    BuildSummary(ReportDataRec.accountNo, msdate, medate, ReportDataRec.MonDetail, ReportDataRec^.MonSummary);
    if sumcum and ReportDataRec.Accumulate then
      begin
      if SummaryType = 0 then
        begin
        DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1;
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanDetail[J] := ReportDataRec.PlanDetail[J] + ReportDataRec.PlanDetail[J - 1];
          ReportDataRec.MonDetail[J] := ReportDataRec.MonDetail[J] + ReportDataRec.MonDetail[J - 1];
          end;    // for
        end
      else
        begin
        if Summarytype < 7 then
          Detailend := 1
        else
          Detailend := 0;
        while (SummaryPeriodIndexArray[Detailend] <> 0) and (Detailend < (NUM_WEEKS - 1)) do inc(Detailend);
        for J := 1 to DetailEnd do    // Iterate
          begin
          ReportDataRec.PlanSummary[J] := ReportDataRec.PlanSummary[J] + ReportDataRec.PlanSummary[J - 1];
          ReportDataRec.MonSummary[J] := ReportDataRec.MonSummary[J] + ReportDataRec.MonSummary[J - 1];
          end;    // for
        end;
      end;
  end;    // for
  CalculateMonitorDPLReportData(SummaryType, perstart, StartDate, EndDate);
end;

function GetReportAccountIndex(accountNo : Integer): Integer;
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to ReportDataList.Count - 1 do    // Iterate
    begin
    if TReportDataRecPtr(ReportDataList.Items[I]).Accountno = AccountNo then
      Result := I;
  end;    // for
end;

function TDataCollector.GetLargestValue(DataRec : TPlanDataRecPtr; Reportindex: Integer): Currency;
var
  I, maxarray : Integer;
begin
  I := 0;
  Result := 0;
  if ReportIndex = 0 then
    maxarray := NUM_DAYSINYEAR
  else
    Maxarray := NUM_WEEKS;
  while I <= Maxarray do
    begin
    if Reportindex = 0 then
      if Abs(DataRec.PlanDetail[I]) > Result then
        Result := Abs(DataRec.PlanDetail[I]);
    if Reportindex > 0 then
      if Abs(DataRec.PlanSummary[I]) > Result then
        Result := Abs(DataRec.PlanSummary[I]);
    inc(I);
    end;    // while
end;

function TDataCollector.GetLargestValueReport(DataRec : TReportDataRecPtr; Reportindex: Integer): Currency;
var
  I, maxarray : Integer;
  TrackBal : TTrackingBals;
begin
  I := 0;
  Result := 0;
  if ReportIndex = 0 then
    maxarray := NUM_DAYSINYEAR
  else
    Maxarray := NUM_WEEKS;
  for TrackBal := trperactual to trytdplan do    // Iterate
    begin
    if Abs(DataRec.trackbalances[TrackBal]) > Result then
        Result := Abs(DataRec.trackbalances[TrackBal]);
    end;
  while I <= Maxarray do
    begin
    if Reportindex = 0 then
      if Abs(DataRec.PlanDetail[I]) > Result then
        Result := Abs(DataRec.PlanDetail[I]);
    if Reportindex > 0 then
      if Abs(DataRec.PlanSummary[I]) > Result then
        Result := Abs(DataRec.PlanSummary[I]);
    inc(I);
    end;    // while
end;

procedure TDataCollector.CalculateKeys(TotalNoColumns, DetailedReportingPeriod: integer);
var
  I, J: Integer;
  SalesRec : TPlanDataRecPtr;
  GPRec : TPlanDataRecPtr;
  PotentialRec : TPlanDataRecPtr;
  BilledRec : TPlanDataRecPtr;
  HoursPerDayRec : TPlanDataRecPtr;
  DataRec : TPlanDataRecPtr;
  SingleUnit : String;
  PluralUnit : String;
begin
  if ConsolidList.Count <= 1 then
    begin
		SingleUnit := DataModuleClient.DepartmentsSingular_unitDesc.AsString;
		PluralUnit := DataModuleClient.DepartmentsPlural_unitDesc.AsString;
    end
  else
    begin
    SingleUnit := 'Unit';
    PluralUnit := 'Units';
    end;
  SalesRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]);
  GPRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]);
  PotentialRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(POTENTIAL)]);
  BilledRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(BILLED)]);
  HoursPerDayRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(HRSPERDAY)]);
  for I := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) do    // Iterate
    begin
    DataRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(KeyTargets[I])]);
      case KeyTargets[I] of    //
      GPPC: begin
            DataRec.FormatImage := REPORTTENSCURRENCY;
            DataRec.AccountTitle := GPPCTITLE;
            if SalesRec.PlanTotal <> 0 then
              DataRec.PlanTotal := GPRec.PlanTotal * 100 / SalesRec.PlanTotal
            else
              DataRec.PlanTotal := 0;

            for J := 0 to TotalNoColumns - 2 do    // Iterate Don't do the Total Column
              begin
              if DetailedReportingPeriod = 0 then
                begin
                if SalesRec.PlanDetail[J] <> 0 then
                  DataRec.PlanDetail[J] := GPRec.PlanDetail[J] * 100 / SalesRec.PlanDetail[J]
                else
                  DataRec.PlanDetail[J] := 0;
                end
              else
                begin
                if SalesRec.PlanSummary[J] <> 0 then
                  DataRec.PlanSummary[J] := GPRec.PlanSummary[J] * 100 / SalesRec.PlanSummary[J]
                else
                  DataRec.PlanSummary[J] := 0;
                end;
              end;
            end;
      PRODUCTIVITY:
            begin
            DataRec.FormatImage := REPORTTENSCURRENCY;
            DataRec.AccountTitle := PRODUCTIVITYTITLE;
            if PotentialRec.PlanTotal <> 0 then
              DataRec.PlanTotal := BilledRec.PlanTotal * 100 / PotentialRec.PlanTotal
            else
              DataRec.PlanTotal := 0;

            for J := 0 to TotalNoColumns - 2 do    // Iterate Don't do the Total Column
              begin
              if DetailedReportingPeriod = 0 then
                begin
                if PotentialRec.PlanDetail[J] <> 0 then
                  DataRec.PlanDetail[J] := BilledRec.PlanDetail[J] * 100 / PotentialRec.PlanDetail[J]
                else
                  DataRec.PlanDetail[J] := 0;
                end
              else
                begin
                if PotentialRec.PlanSummary[J] <> 0 then
                  DataRec.PlanSummary[J] := BilledRec.PlanSummary[J] * 100 / PotentialRec.PlanSummary[J]
                else
                  DataRec.PlanSummary[J] := 0;
                end;
              end;
            if SingleUnit = 'Hour' then
              begin
              HoursPerDayRec.AccountTitle := HOURSPERDAYTITLE;
              HoursPerDayRec.FormatImage := 'Mins';
              HoursPerDayRec.Nonzero := True;
              HoursPerDayRec.PlanTotal := 480 * DataRec.PlanTotal / 6000;
              for J := 0 to TotalNoColumns - 2 do    // Iterate Don't do the Total Column
                begin
                if DetailedReportingPeriod = 0 then
                  HoursPerDayRec.PlanDetail[J] := 480 * DataRec.PlanDetail[J] / 6000
                else
                  HoursPerDayRec.PlanSummary[J] := 480 * DataRec.PlanSummary[J] / 6000;
                end;
              end;
            end;
      SALESUNIT:
            begin
            DataRec.AccountTitle := SALESUNITTITLE + SingleUnit;
            if BilledRec.PlanTotal <> 0 then
              DataRec.PlanTotal := SalesRec.PlanTotal / BilledRec.PlanTotal
            else
              DataRec.PlanTotal := 0;

            for J := 0 to TotalNoColumns - 2 do    // Iterate Don't do the Total Column
              begin
              if DetailedReportingPeriod = 0 then
                begin
                if BilledRec.PlanDetail[J] <> 0 then
                  DataRec.PlanDetail[J] := SalesRec.PlanDetail[J] / BilledRec.PlanDetail[J]
                else
                  DataRec.PlanDetail[J] := 0;
                end
              else
                begin
                if BilledRec.PlanSummary[J] <> 0 then
                  DataRec.PlanSummary[J] := SalesRec.PlanSummary[J] / BilledRec.PlanSummary[J]
                else
                  DataRec.PlanSummary[J] := 0;
                end;
              end;
            // Here is where to find the max size and set the reportformat
            if GetLargestValue(DataRec, DetailedReportingPeriod) > 9999.0 then
              DataRec.FormatImage := REPORTROUNDCURRENCY
            else
              DataRec.FormatImage := REPORTCENTSCURRENCY;
            end;
      GPUNIT:
            begin
            DataRec.AccountTitle := GPUNITTITLE + SingleUnit;
            if BilledRec.PlanTotal <> 0 then
              DataRec.PlanTotal := GPRec.PlanTotal / BilledRec.PlanTotal
            else
              DataRec.PlanTotal := 0;
            for J := 0 to TotalNoColumns - 2 do    // Iterate Don't do the Total Column
              begin
              if DetailedReportingPeriod = 0 then
                begin
                if BilledRec.PlanDetail[J] <> 0 then
                  DataRec.PlanDetail[J] := GPRec.PlanDetail[J] / BilledRec.PlanDetail[J]
                else
                  DataRec.PlanDetail[J] := 0;
                end
              else
                begin
                if BilledRec.PlanSummary[J] <> 0 then
                  DataRec.PlanSummary[J] := GPRec.PlanSummary[J] / BilledRec.PlanSummary[J]
                else
                  DataRec.PlanSummary[J] := 0;
                end;
              end;
            if GetLargestValue(DataRec, DetailedReportingPeriod) > 9999.0 then
              DataRec.FormatImage := REPORTROUNDCURRENCY
            else
              DataRec.FormatImage := REPORTCENTSCURRENCY;
            end;
      POTENTIAL:
          begin
            DataRec.AccountTitle := 'Potential Saleable ' + PluralUnit;
            if GetLargestValue(DataRec, DetailedReportingPeriod) > 9999.0 then
              DataRec.FormatImage := REPORTROUNDCURRENCY
            else
              DataRec.FormatImage := REPORTTENSCURRENCY;
          end;
      BILLED:
          begin
            DataRec.AccountTitle := 'Billed / Target ' + PluralUnit;
            if GetLargestValue(DataRec, DetailedReportingPeriod) > 9999.0 then
              DataRec.FormatImage := REPORTROUNDCURRENCY
            else
              DataRec.FormatImage := REPORTTENSCURRENCY;
          end;
      HRSPERDAY: ;
      else
        begin
        DataRec.FormatImage := REPORTROUNDCURRENCY;
        end;
      end;    // case
    end;    // for
end;

procedure TDataCollector.CalculateReportData;
var
  J: Integer;
  I: Integer;
  ReportSales : TReportDataRecPtr;
  ReportGP : TReportDataRecPtr;
  ReportTotalExp : TReportDataRecPtr;
  ReportNP : TReportDataRecPtr;
  ReportPotential : TReportDataRecPtr;
  ReportBilled : TReportDataRecPtr;
  ReportFTEProd : TReportDataRecPtr;
  ReportFTEOther : TReportDataRecPtr;
  ReportHoursPerDay : TReportDataRecPtr;
  ReportData : TReportDataRecPtr;
  ReportWages : TReportDataRecPtr;
  SingleUnit : String;
  PluralUnit : String;
begin
  ReportSales := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(SALES)]);
  ReportGP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(GROSSPROFIT)]);
  ReportTotalExp := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(TOTALEXPENSES)]);
  ReportNP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETPROFIT)]);
  ReportPotential := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(POTENTIAL)]);
  ReportBilled := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(BILLED)]);
  ReportFTEProd := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(FTEPROD)]);
  ReportFTEOther := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(FTEOTHER)]);
  ReportHoursPerDay := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(HRSPERDAY)]);
  ReportFteOther.AccountTitle := TOTALFTETITLE;
  ReportFTEOther.Annualise := False;
  ReportFTEOther.FormatImage := REPORTTENSCURRENCY;
  ReportFTEOther.Symbol := '';
  ReportFTEProd.Annualise := False;
  ReportFTEProd.FormatImage := REPORTTENSCURRENCY;
  ReportFTEProd.Symbol := '';

  // If Consoldated use 'Unit' as description
  if ConsolidList.Count <= 1
    then begin
		SingleUnit := DataModuleClient.DepartmentsSingular_unitDesc.AsString;
		PluralUnit := DataModuleClient.DepartmentsPlural_unitDesc.AsString;
  end
  else begin
    SingleUnit := 'Unit';
    PluralUnit := 'Units';
  end;

  // Get Wages Total
  New(ReportWages);
  GetWages(ReportWages);
  for I := 0 to ReportDataList.Count - 1 do    // Iterate
    begin
    ReportData := TReportDataRecPtr(ReportDataList.Items[I]);
    if ReportData.AccountNo = POTENTIAL then
      ReportData.AccountTitle := 'Potential ' + PluralUnit;
    if ReportData.AccountNo = BILLED then
      ReportData.AccountTitle := 'Billed / Target ' + PluralUnit;

    if (ReportData.Accountno >= 10000) and (ReportData.Accountno <> TOTALFTE) then
      begin
        case ReportData.Accountno of    //
          SALESUNIT:
                  begin
                    ReportData.AccountTitle := SALESUNITTITLE + SingleUnit;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportBilled.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportSales.PlanTotal / ReportBilled.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportBilled.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportSales.PastBalances[J] / ReportBilled.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          GPUNIT:
                  begin
                    ReportData.AccountTitle := GPUNITTITLE + SingleUnit;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportBilled.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportGP.PlanTotal / ReportBilled.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportBilled.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportGP.PastBalances[J] / ReportBilled.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          GPPC:
                  begin
                    ReportData.AccountTitle := GPPCTITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    ReportData.Symbol := '%';
                    if ReportSales.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportGP.PlanTotal * 100 / ReportSales.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportSales.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportGP.PastBalances[J] * 100 / ReportSales.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          PRODUCTIVITY:
                  begin
                    ReportData.AccountTitle := PRODUCTIVITYTITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTTENSCURRENCY;
                    ReportData.Symbol := '%';
                    if ReportPotential.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportBilled.PlanTotal * 100 / ReportPotential.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportPotential.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportBilled.PastBalances[J] * 100 / ReportPotential.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                    if SingleUnit = 'Hour'
                      then begin
                      ReportHoursPerDay.AccountTitle := HOURSPERDAYTITLE;
                      ReportHoursPerDay.Symbol := 'Mins';
                      ReportHoursPerDay.Annualise := False;
                      ReportHoursPerDay.FormatImage := REPORTTENSCURRENCY;
                      ReportHoursPerDay.PlanTotal := 480 * ReportData.PlanTotal / 6000;
                      for J := 0 to 4 do    // Iterate
                        ReportHoursPerDay.PastBalances[J] := 480 * ReportData.PastBalances[J] / 6000;
                    end;
                  end;
          TOTALEXPPC:
                  begin
                    ReportData.AccountTitle := TOTALEXPPCTITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    ReportData.Symbol := '%';
                    if ReportSales.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportTotalExp.PlanTotal * 100 / ReportSales.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportSales.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportTotalExp.PastBalances[J] * 100 / ReportSales.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          NPPC:
                  begin
                    ReportData.AccountTitle := NPPCTITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    ReportData.Symbol := '%';
                    if ReportSales.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportNP.PlanTotal * 100 / ReportSales.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportSales.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportNP.PastBalances[J] * 100 / ReportSales.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          TOTALEXPUNIT:
                  begin
                    ReportData.AccountTitle := TOTALEXPUNITTITLE + SingleUnit;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportBilled.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportTotalExp.PlanTotal / ReportBilled.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportBilled.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportTotalExp.PastBalances[J] / ReportBilled.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          NPUNIT:
                  begin
                    ReportData.AccountTitle := NPUNITTITLE + SingleUnit;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportBilled.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportNP.PlanTotal / ReportBilled.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportBilled.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportNP.PastBalances[J] / ReportBilled.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          SALESWAGE:
                  begin
                    ReportData.AccountTitle := SALESWAGETITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportWages.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportSales.PlanTotal / ReportWages.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportWages.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportSales.PastBalances[J] / ReportWages.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          GPWAGE:
                  begin
                    ReportData.AccountTitle := GPWAGETITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportWages.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportGP.PlanTotal / ReportWages.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportWages.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportGP.PastBalances[J] / ReportWages.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          NPWAGE:
                  begin
                    ReportData.AccountTitle := NPWAGETITLE;
                    ReportData.Annualise := False;
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                    if ReportWages.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportNP.PlanTotal / ReportWages.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportWages.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportNP.PastBalances[J] / ReportWages.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          SALESFTE:
                  begin
                    ReportData.AccountTitle := SALESFTETITLE;
                    ReportData.Annualise := True;
                    if ReportFTEOther.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportSales.PlanTotal / ReportFTEOther.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportFTEOther.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportSales.PastBalances[J] / ReportFTEOther.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          GPFTE:
                  begin
                    ReportData.AccountTitle := GPFTETITLE;
                    ReportData.Annualise := True;
                    if ReportFTEOther.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportGP.PlanTotal / ReportFTEOther.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportFTEOther.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportGP.PastBalances[J] / ReportFTEOther.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
          NPFTE:
                  begin
                    ReportData.AccountTitle := NPFTETITLE;
                    ReportData.Annualise := True;
                    if ReportFTEOther.PlanTotal <> 0 then
                      ReportData.PlanTotal := ReportNP.PlanTotal / ReportFTEOther.PlanTotal
                    else
                      ReportData.PlanTotal := 0;
                    for J := 0 to 4 do    // Iterate
                      begin
                      if ReportFTEOther.PastBalances[J] <> 0 then
                        ReportData.PastBalances[J] := ReportNP.PastBalances[J] / ReportFTEOther.PastBalances[J]
                      else
                        ReportData.PastBalances[J] := 0;
                    end;    // for
                  end;
        end;    // case
      end;
    end;    // for
  Dispose(ReportWages);
end;

procedure TDataCollector.CalculateMonitorKeyReportData(Mwages: TreportDataRecPtr; SummaryType : integer; perstart, Sdate, edate: TDateTime);
var
  I, k, kk: Integer;
  ReportSales : TReportDataRecPtr;
  ReportGP : TReportDataRecPtr;
  ReportTotalExp : TReportDataRecPtr;
  ReportNP : TReportDataRecPtr;
  ReportPotential : TReportDataRecPtr;
  ReportBilled : TReportDataRecPtr;
  ReportFTEProd : TReportDataRecPtr;
  ReportFTEOther : TReportDataRecPtr;
  ReportHoursPerDay : TReportDataRecPtr;
  ReportData : TReportDataRecPtr;
  SingleUnit : String;
  PluralUnit : String;
  TrackBal : TTrackingBals;
//  Perioddays{, ytddays }: integer;
  DetailEnd, SummaryEnd, daysinYear : integer;
begin
  ReportSales := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(SALES)]);
  ReportGP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(GROSSPROFIT)]);
  ReportTotalExp := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(TOTALEXPENSES)]);
  ReportNP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETPROFIT)]);
  ReportPotential := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(POTENTIAL)]);
  ReportBilled := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(BILLED)]);
  ReportFTEProd := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(FTEPROD)]);
  ReportFTEOther := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(FTEOTHER)]);
  ReportHoursPerDay := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(HRSPERDAY)]);
  ReportFteOther.AccountTitle := TOTALFTETITLE;
  ReportFTEOther.Annualise := False;
  ReportFTEOther.FormatImage := REPORTTENSCURRENCY;
  ReportFTEOther.Symbol := '';
  ReportFTEProd.Annualise := False;
  ReportFTEProd.FormatImage := REPORTTENSCURRENCY;
  ReportFTEProd.Symbol := '';
  daysinyear := trunc(Edate) - trunc(SDate);

  // If Consoldated use 'Unit' as description
  if ConsolidList.Count <= 1
    then begin
		SingleUnit := DataModuleClient.DepartmentsSingular_unitDesc.AsString;
		PluralUnit := DataModuleClient.DepartmentsPlural_unitDesc.AsString;
  end
  else begin
    SingleUnit := 'Unit';
    PluralUnit := 'Units';
  end;
  if ReportFTEProd.TrackBalances[trperactual] = 0 then
    ReportFTEProd.TrackBalances[trperactual] := ReportFTEProd.TrackBalances[trperPlan];
  if ReportFTEProd.TrackBalances[trytdactual] = 0 then
    ReportFTEProd.TrackBalances[trytdactual] := ReportFTEProd.TrackBalances[trytdPlan];
  if ReportFTEOther.TrackBalances[trperactual] = 0 then
    ReportFTEOther.TrackBalances[trperactual] := ReportFTEOther.TrackBalances[trperPlan];
  if ReportFTEOther.TrackBalances[trytdactual] = 0 then
    ReportFTEOther.TrackBalances[trytdactual] := ReportFTEOther.TrackBalances[trytdPlan];
  ReportNP.TrackBalances[trperactual] := ReportGP.TrackBalances[trperactual] - ReportTotalExp.TrackBalances[trperactual];
  ReportNP.TrackBalances[trytdactual] := ReportGP.TrackBalances[trytdactual] - ReportTotalExp.TrackBalances[trytdactual];
  DetailEnd := -1;
  SummaryEnd := -1;
  if SummaryType = 0 then
    DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1
  else
    begin
    if Summarytype < 7 then
      I := 1
    else
      I := 0;
    while (SummaryPeriodIndexArray[I] <> 0) and (I < (NUM_WEEKS - 1)) do inc(I);
    SummaryEnd := I + 1;
    end;
  if DetailEnd > 0 then
    begin
    for k := 0 to DetailEnd - 1 do    // Iterate
      begin
      if ReportFTEProd.MonDetail[k] = 0 then
        ReportFTEProd.MonDetail[k] := ReportFTEProd.PlanDetail[k];
      if ReportFTEOther.MonDetail[k] = 0 then
        ReportFTEOther.MonDetail[k] := ReportFTEOther.PlanDetail[k];
      ReportNP.MonDetail[k] := ReportGP.monDetail[k] - ReportTotalExp.monDetail[K];
      end;
    end
  else
    begin
    for k := 0 to SummaryEnd - 1 do    // Iterate
      begin
      if ReportFTEProd.MonSummary[k] = 0 then
        ReportFTEProd.MonSummary[k] := ReportFTEProd.PlanSummary[k];
      if ReportFTEOther.MonSummary[k] = 0 then
        ReportFTEOther.MonSummary[k] := ReportFTEOther.PlanSummary[k];
      ReportNP.MonSummary[k] := ReportGP.monSummary[k] - ReportTotalExp.monSummary[K];
      end;
    end;
{  perioddays := Trunc(edate - perstart) + 1;
  ytddays := trunc(edate - sdate) + 1;
  if perioddays > 365 then
    perioddays := 365;
  if ytddays > 365 then
    ytddays := 365;
}
  for I := 0 to ReportDataList.Count - 1 do    // Iterate
    begin
    ReportData := TReportDataRecPtr(ReportDataList.Items[I]);
    ReportData.PlanTotal := 0;
    Reportdata.MonTotal := 0;

    for KK := 0 to DaysinYear do    // Iterate
      begin
      Reportdata.PlanTotal := Reportdata.PlanTotal + Reportdata.Plandetail[kk];
      Reportdata.MonTotal := Reportdata.MonTotal + Reportdata.MonDetail[kk];
      end;    // for

    if ReportData.AccountNo = POTENTIAL then
      begin
      ReportData.AccountTitle := 'Potential ' + PluralUnit;
      if GetLargestValueReport(ReportData, SummaryType) > 9999.0 then
        ReportData.FormatImage := REPORTROUNDCURRENCY
      else
        ReportData.FormatImage := REPORTTENSCURRENCY;
      end;
    if ReportData.AccountNo = BILLED then
      begin
      ReportData.AccountTitle := 'Billed / Target ' + PluralUnit;
      if GetLargestValueReport(ReportData, SummaryType) > 9999.0 then
        ReportData.FormatImage := REPORTROUNDCURRENCY
      else
        ReportData.FormatImage := REPORTTENSCURRENCY;
      end;
    if (ReportData.Accountno >= 10000) and (ReportData.Accountno <> TOTALFTE) then
      begin
        case ReportData.Accountno of    //
          SALESUNIT:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      end;
                    if ReportBilled.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportSales.TrackBalances[Trackbal] / ReportBilled.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if ReportBilled.PlanTotal <> 0 then
                    ReportData.PlanTotal := ReportSales.PlanTotal / ReportBilled.PlanTotal;
                  if ReportBilled.MonTotal <> 0 then
                    ReportData.MonTotal := ReportSales.MonTotal / ReportBilled.MonTotal;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportSales.PlanDetail[k] / ReportBilled.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportBilled.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportSales.MonDetail[k] / ReportBilled.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportSales.PlanSummary[k] / ReportBilled.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportBilled.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportSales.MonSummary[k] / ReportBilled.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  ReportData.AccountTitle := SALESUNITTITLE + SingleUnit;
                  ReportData.Annualise := False;
                  if GetLargestValueReport(ReportData, SummaryType) > 9999.0 then
                    ReportData.FormatImage := REPORTROUNDCURRENCY
                  else
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                  end;
          GPUNIT:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := GPUNITTITLE + SingleUnit;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      end;
                    if ReportBilled.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportGP.TrackBalances[Trackbal] / ReportBilled.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if ReportBilled.PlanTotal <> 0 then
                    ReportData.PlanTotal := ReportGP.PlanTotal / ReportBilled.PlanTotal;
                  if ReportBilled.MonTotal <> 0 then
                    ReportData.MonTotal := ReportGP.MonTotal / ReportBilled.MonTotal;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportGP.PlanDetail[k] / ReportBilled.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportBilled.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportGP.MonDetail[k] / ReportBilled.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportGP.PlanSummary[k] / ReportBilled.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportBilled.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportGP.MonSummary[k] / ReportBilled.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  if GetLargestValueReport(ReportData, SummaryType) > 9999.0 then
                    ReportData.FormatImage := REPORTROUNDCURRENCY
                  else
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                  end;
          GPPC:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := GPPCTITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      ReportData.Symbol := '%';
                      end;
                    if ReportSales.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportGP.TrackBalances[Trackbal] * 100 / ReportSales.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if ReportSales.PlanTotal <> 0 then
                    ReportData.PlanTotal := ReportGP.PlanTotal * 100 / ReportSales.PlanTotal;
                  if ReportSales.MonTotal <> 0 then
                    ReportData.MonTotal := ReportGP.MonTotal * 100 / ReportSales.MonTotal;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportGP.PlanDetail[k] * 100 / ReportSales.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportSales.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportGP.MonDetail[k] * 100 / ReportSales.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportGP.PlanSummary[k] * 100 / ReportSales.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportSales.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportGP.MonSummary[k] * 100 / ReportSales.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          PRODUCTIVITY:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := PRODUCTIVITYTITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTTENSCURRENCY;
                      ReportData.Symbol := '%';
                      end;
                    if ReportPotential.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportBilled.TrackBalances[Trackbal] * 100 / ReportPotential.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    if (SingleUnit = 'Hour') then
                      begin
                      ReportHoursPerDay.AccountTitle := HOURSPERDAYTITLE;
                      ReportHoursPerDay.Symbol := 'Mins';
                      ReportHoursPerDay.Annualise := False;
                      ReportHoursPerDay.FormatImage := REPORTTENSCURRENCY;
                      ReportHoursPerDay.TrackBalances[Trackbal] := 480 * ReportData.TrackBalances[Trackbal] / 6000;
                      end;
                    end;
                  if ReportPotential.PlanTotal <> 0 then
                    ReportData.PlanTotal := ReportBilled.PlanTotal * 100 / ReportPotential.PlanTotal;
                  if ReportPotential.MonTotal <> 0 then
                    ReportData.MonTotal := ReportBilled.MonTotal * 100 / ReportPotential.MonTotal;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportPotential.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportBilled.PlanDetail[k] * 100 / ReportPotential.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.PlanDetail[k] := 480 * ReportData.PlanDetail[k] / 6000;
                      if ReportPotential.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportBilled.MonDetail[k] * 100 / ReportPotential.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.MonDetail[k] := 480 * ReportData.MonDetail[k] / 6000;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportPotential.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportBilled.PlanSummary[k] * 100 / ReportPotential.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.PlanSummary[k] := 480 * ReportData.PlanSummary[k] / 6000;
                      if ReportPotential.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportBilled.MonSummary[k] * 100 / ReportPotential.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.MonSummary[k] := 480 * ReportData.MonSummary[k] / 6000;
                      end;
                    end;
                  end;
          TOTALEXPPC:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := TOTALEXPPCTITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      ReportData.Symbol := '%';
                      end;
                    if ReportSales.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportTotalExp.TrackBalances[Trackbal] * 100 / ReportSales.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 Then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportTotalExp.PlanDetail[k] * 100 / ReportSales.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportSales.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportTotalExp.MonDetail[k] * 100 / ReportSales.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportTotalExp.PlanSummary[k] * 100 / ReportSales.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportSales.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportTotalExp.MonSummary[k] * 100 / ReportSales.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          NPPC:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := NPPCTITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      ReportData.Symbol := '%';
                      end;
                    if ReportSales.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportNP.TrackBalances[Trackbal] * 100 / ReportSales.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportNP.PlanDetail[k] * 100 / ReportSales.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportSales.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportNP.MonDetail[k] * 100 / ReportSales.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportSales.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportNP.PlanSummary[k] * 100 / ReportSales.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportSales.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportNP.MonSummary[k] * 100 / ReportSales.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          TOTALEXPUNIT:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := TOTALEXPUNITTITLE + SingleUnit;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      end;
                    if ReportBilled.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportTotalExp.TrackBalances[Trackbal] / ReportBilled.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportTotalExp.PlanDetail[k] / ReportBilled.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportBilled.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportTotalExp.MonDetail[k] / ReportBilled.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportTotalExp.PlanSummary[k] / ReportBilled.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportBilled.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportTotalExp.MonSummary[k] / ReportBilled.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          NPUNIT:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := NPUNITTITLE + SingleUnit;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                      end;
                    if ReportBilled.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportNP.TrackBalances[Trackbal] / ReportBilled.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportNP.PlanDetail[k] / ReportBilled.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportBilled.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportNP.MonDetail[k] / ReportBilled.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportBilled.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportNP.PlanSummary[k] / ReportBilled.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportBilled.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportNP.MonSummary[k] / ReportBilled.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  if GetLargestValueReport(ReportData, SummaryType) > 9999.0 then
                    ReportData.FormatImage := REPORTROUNDCURRENCY
                  else
                    ReportData.FormatImage := REPORTCENTSCURRENCY;
                  end;
{          SALESWAGE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual
                      then begin
                      ReportData.AccountTitle := SALESWAGETITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                    end;
                    if MWages.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportSales.TrackBalances[Trackbal] / MWages.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                  end;
                  if DetailEnd > 0
                    then begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportSales.PlanDetail[k] / MWages.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if MWages.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportSales.MonDetail[k] / MWages.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                    end;
                  end
                  else begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportSales.PlanSummary[k] / MWages.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if MWages.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportSales.MonSummary[k] / MWages.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                    end;
                  end;
                end;
          GPWAGE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual
                      then begin
                      ReportData.AccountTitle := GPWAGETITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                    end;
                    if MWages.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportGP.TrackBalances[Trackbal] / MWages.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                  end;
                  if DetailEnd > 0
                    then begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportGP.PlanDetail[k] / MWages.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if MWages.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportGP.MonDetail[k] / MWages.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                    end;
                  end
                  else begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportGP.PlanSummary[k] / MWages.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if MWages.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportGP.MonSummary[k] / MWages.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                    end;
                  end;
                end;
          NPWAGE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual
                      then begin
                      ReportData.AccountTitle := NPWAGETITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTCENTSCURRENCY;
                    end;
                    if MWages.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportNP.TrackBalances[Trackbal] / MWages.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                  end;
                  if DetailEnd > 0
                    then begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportNP.PlanDetail[k] / MWages.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if MWages.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportNP.MonDetail[k] / MWages.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                    end;
                  end
                  else begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if MWages.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportNP.PlanSummary[k] / MWages.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if MWages.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportNP.MonSummary[k] / MWages.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                    end;
                  end;
                end;
}
          SALESFTE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := SALESFTETITLE;
                      ReportData.Annualise := False;
                      end;
                    if ReportFTEOther.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportSales.TrackBalances[Trackbal] / ReportFTEOther.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportSales.PlanDetail[k] / ReportFTEOther.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportFTEOther.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportSales.MonDetail[k] / ReportFTEOther.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportSales.PlanSummary[k] / ReportFTEOther.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportFTEOther.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportSales.MonSummary[k] / ReportFTEOther.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          GPFTE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := GPFTETITLE;
                      ReportData.Annualise := False;
                      end;
                    if ReportFTEOther.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportGP.TrackBalances[Trackbal] / ReportFTEOther.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportGP.PlanDetail[k] / ReportFTEOther.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportFTEOther.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportGP.MonDetail[k] / ReportFTEOther.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportGP.PlanSummary[k] / ReportFTEOther.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportFTEOther.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportGP.MonSummary[k] / ReportFTEOther.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          NPFTE:
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := NPFTETITLE;
                      ReportData.Annualise := False;
                      end;
                    if ReportFTEOther.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportNP.TrackBalances[Trackbal] / ReportFTEOther.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    end;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportNP.PlanDetail[k] / ReportFTEOther.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if ReportFTEOther.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportNP.MonDetail[k] / ReportFTEOther.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportFTEOther.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportNP.PlanSummary[k] / ReportFTEOther.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if ReportFTEOther.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportNP.MonSummary[k] / ReportFTEOther.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      end;
                    end;
                  end;
          end;    // case
      end;
    if (ReportData.Accountno <> TOTALEXPENSES) and (ReportData.Accountno <> TOTALEXPPC) then
      begin
      ReportData.TrackBalances[trperVar] := ReportData.TrackBalances[trperActual] - ReportData.TrackBalances[trperPlan];
      ReportData.TrackBalances[trYtdVar] := ReportData.TrackBalances[trytdActual] - ReportData.TrackBalances[trytdPlan];
      end
    else
      begin
      ReportData.TrackBalances[trperVar] := ReportData.TrackBalances[trperPlan] - ReportData.TrackBalances[trperActual];
      ReportData.TrackBalances[trYtdVar] := ReportData.TrackBalances[trytdPlan] - ReportData.TrackBalances[trytdActual];
      end;
    if ReportData.Accountno = PRODUCTIVITY then
      begin
      if (SingleUnit = 'Hour') then
        begin
        ReportHoursPerDay.TrackBalances[trpervar] := 480 * ReportData.TrackBalances[trpervar] / 6000;
        ReportHoursPerDay.TrackBalances[trytdvar] := 480 * ReportData.TrackBalances[trytdvar] / 6000;
        end;
      end;
    end;    // for
end;

procedure TDataCollector.CalculateCrossKeyReportData;
var
  I: Integer;
  kk: Integer;
  ReportRec : TConsolidDeptRecPtr;
  UnitsAreHours : Boolean;
begin
  {
   SALES = 0,
   GROSSPROFIT = 1,
   GPPC = 2,
   POTENTIAL = 3,
   BILLED = 4,
   PRODUCTIVITY = 5,
   SALESUNIT = 6,
   GPUNIT = 7
  }
  UnitsAreHours := True;
  for kk := 0 to DeptReportDataList.Count - 1 do    // Iterate
    begin
    ReportRec := TConsolidDeptRecPtr(DeptReportDataList.Items[kk]);
    if (KK < DeptReportDataList.Count - 1)  and (ReportRec.UnitDescS <> 'Hour') then
      UnitsAreHours := False;
    for I := 0 to 7 do    // Iterate
      begin
        case ConSolidKeyAccounts[I] of    //
        SALESUNIT:
                  begin
                  ReportRec.SummaryBalances[I][trperactual] := 0;
                  ReportRec.SummaryBalances[I][trperPlan] := 0;
                  ReportRec.SummaryBalances[I][trytdactual] := 0;
                  ReportRec.SummaryBalances[I][trytdPlan] := 0;
                  if ReportRec.SummaryBalances[4][trperActual] <> 0 then
                    ReportRec.SummaryBalances[I][trperactual] := ReportRec.SummaryBalances[0][trperactual] / ReportRec.SummaryBalances[4][trperactual];
                  if ReportRec.SummaryBalances[4][trperplan] <> 0 then
                    ReportRec.SummaryBalances[I][trperplan] := ReportRec.SummaryBalances[0][trperplan] / ReportRec.SummaryBalances[4][trperplan];
                  if ReportRec.SummaryBalances[4][trytdActual] <> 0 then
                    ReportRec.SummaryBalances[I][trytdactual] := ReportRec.SummaryBalances[0][trytdactual] / ReportRec.SummaryBalances[4][trytdactual];
                  if ReportRec.SummaryBalances[4][trytdplan] <> 0 then
                    ReportRec.SummaryBalances[I][trytdplan] := ReportRec.SummaryBalances[0][trytdplan] / ReportRec.SummaryBalances[4][trytdplan];
                  end;
        GPUNIT:
                  begin
                  ReportRec.SummaryBalances[I][trperactual] := 0;
                  ReportRec.SummaryBalances[I][trperPlan] := 0;
                  ReportRec.SummaryBalances[I][trytdactual] := 0;
                  ReportRec.SummaryBalances[I][trytdPlan] := 0;
                  if ReportRec.SummaryBalances[4][trperActual] <> 0 then
                    ReportRec.SummaryBalances[I][trperactual] := ReportRec.SummaryBalances[1][trperactual] / ReportRec.SummaryBalances[4][trperactual];
                  if ReportRec.SummaryBalances[4][trperplan] <> 0 then
                    ReportRec.SummaryBalances[I][trperplan] := ReportRec.SummaryBalances[1][trperplan] / ReportRec.SummaryBalances[4][trperplan];
                  if ReportRec.SummaryBalances[4][trytdActual] <> 0 then
                    ReportRec.SummaryBalances[I][trytdactual] := ReportRec.SummaryBalances[1][trytdactual] / ReportRec.SummaryBalances[4][trytdactual];
                  if ReportRec.SummaryBalances[4][trytdplan] <> 0 then
                    ReportRec.SummaryBalances[I][trytdplan] := ReportRec.SummaryBalances[1][trytdplan] / ReportRec.SummaryBalances[4][trytdplan];
                  end;
        GPPC:
                  begin
                  ReportRec.SummaryBalances[I][trperactual] := 0;
                  ReportRec.SummaryBalances[I][trperPlan] := 0;
                  ReportRec.SummaryBalances[I][trytdactual] := 0;
                  ReportRec.SummaryBalances[I][trytdPlan] := 0;
                  if ReportRec.SummaryBalances[0][trperActual] <> 0 then
                    ReportRec.SummaryBalances[I][trperactual] := ReportRec.SummaryBalances[1][trperactual] * 100 / ReportRec.SummaryBalances[0][trperactual];
                  if ReportRec.SummaryBalances[0][trperplan] <> 0 then
                    ReportRec.SummaryBalances[I][trperplan] := ReportRec.SummaryBalances[1][trperplan] * 100 / ReportRec.SummaryBalances[0][trperplan];
                  if ReportRec.SummaryBalances[0][trytdActual] <> 0 then
                    ReportRec.SummaryBalances[I][trytdactual] := ReportRec.SummaryBalances[1][trytdactual] * 100 / ReportRec.SummaryBalances[0][trytdactual];
                  if ReportRec.SummaryBalances[0][trytdplan] <> 0 then
                    ReportRec.SummaryBalances[I][trytdplan] := ReportRec.SummaryBalances[1][trytdplan] * 100 / ReportRec.SummaryBalances[0][trytdplan];
                  end;
        PRODUCTIVITY:
                  begin
                  ReportRec.SummaryBalances[I][trperactual] := 0;
                  ReportRec.SummaryBalances[I][trperPlan] := 0;
                  ReportRec.SummaryBalances[I][trytdactual] := 0;
                  ReportRec.SummaryBalances[I][trytdPlan] := 0;
                  if ReportRec.SummaryBalances[3][trperActual] <> 0 then
                    ReportRec.SummaryBalances[I][trperactual] := ReportRec.SummaryBalances[4][trperactual] * 100 / ReportRec.SummaryBalances[3][trperactual];
                  if ReportRec.SummaryBalances[3][trperplan] <> 0 then
                    ReportRec.SummaryBalances[I][trperplan] := ReportRec.SummaryBalances[4][trperplan] * 100 / ReportRec.SummaryBalances[3][trperplan];
                  if ReportRec.SummaryBalances[3][trytdActual] <> 0 then
                    ReportRec.SummaryBalances[I][trytdactual] := ReportRec.SummaryBalances[4][trytdactual] * 100 / ReportRec.SummaryBalances[3][trytdactual];
                  if ReportRec.SummaryBalances[3][trytdplan] <> 0 then
                    ReportRec.SummaryBalances[I][trytdplan] := ReportRec.SummaryBalances[4][trytdplan] * 100 / ReportRec.SummaryBalances[3][trytdplan];
                  end;
{                  if (SingleUnit = 'Hour') then
                    begin
                    ReportHoursPerDay.AccountTitle := HOURSPERDAYTITLE;
                    ReportHoursPerDay.Symbol := 'Mins';
                    ReportHoursPerDay.Annualise := False;
                    ReportHoursPerDay.FormatImage := REPORTTENSCURRENCY;
                    ReportHoursPerDay.TrackBalances[Trackbal] := 480 * ReportData.TrackBalances[Trackbal] / 6000;
                    end;
                  begin
                  for TrackBal := trperactual to trytdplan do    // Iterate
                    begin
                    if trackBal = trperactual then
                      begin
                      ReportData.AccountTitle := PRODUCTIVITYTITLE;
                      ReportData.Annualise := False;
                      ReportData.FormatImage := REPORTTENSCURRENCY;
                      ReportData.Symbol := '%';
                      end;
                    if ReportPotential.TrackBalances[Trackbal] <> 0 then
                      ReportData.TrackBalances[Trackbal] := ReportBilled.TrackBalances[Trackbal] * 100 / ReportPotential.TrackBalances[Trackbal]
                    else
                      ReportData.TrackBalances[Trackbal] := 0;
                    if (SingleUnit = 'Hour') then
                      begin
                      ReportHoursPerDay.AccountTitle := HOURSPERDAYTITLE;
                      ReportHoursPerDay.Symbol := 'Mins';
                      ReportHoursPerDay.Annualise := False;
                      ReportHoursPerDay.FormatImage := REPORTTENSCURRENCY;
                      ReportHoursPerDay.TrackBalances[Trackbal] := 480 * ReportData.TrackBalances[Trackbal] / 6000;
                      end;
                    end;
                  if ReportPotential.PlanTotal <> 0 then
                    ReportData.PlanTotal := ReportBilled.PlanTotal * 100 / ReportPotential.PlanTotal;
                  if ReportPotential.MonTotal <> 0 then
                    ReportData.MonTotal := ReportBilled.MonTotal * 100 / ReportPotential.MonTotal;
                  if DetailEnd > 0 then
                    begin
                    for k := 0 to DetailEnd - 1 do    // Iterate
                      begin
                      if ReportPotential.PlanDetail[k] <> 0 then
                        ReportData.PlanDetail[k] := ReportBilled.PlanDetail[k] * 100 / ReportPotential.PlanDetail[k]
                      else
                        ReportData.PlanDetail[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.PlanDetail[k] := 480 * ReportData.PlanDetail[k] / 6000;
                      if ReportPotential.MonDetail[k] <> 0 then
                        ReportData.MonDetail[k] := ReportBilled.MonDetail[k] * 100 / ReportPotential.MonDetail[k]
                      else
                        ReportData.MonDetail[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.MonDetail[k] := 480 * ReportData.MonDetail[k] / 6000;
                      end;
                    end
                  else
                    begin
                    for k := 0 to SummaryEnd - 1 do    // Iterate
                      begin
                      if ReportPotential.PlanSummary[k] <> 0 then
                        ReportData.PlanSummary[k] := ReportBilled.PlanSummary[k] * 100 / ReportPotential.PlanSummary[k]
                      else
                        ReportData.PlanSummary[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.PlanSummary[k] := 480 * ReportData.PlanSummary[k] / 6000;
                      if ReportPotential.MonSummary[k] <> 0 then
                        ReportData.MonSummary[k] := ReportBilled.MonSummary[k] * 100 / ReportPotential.MonSummary[k]
                      else
                        ReportData.MonSummary[k] := 0;
                      if (SingleUnit = 'Hour') then
                        ReportHoursPerDay.MonSummary[k] := 480 * ReportData.MonSummary[k] / 6000;
                      end;
                    end;
                  end;
                  }
        end;    // case
      ReportRec.SummaryBalances[I][trperVar] := ReportRec.SummaryBalances[I][trperActual] - ReportRec.SummaryBalances[I][trperPlan];
      ReportRec.SummaryBalances[I][trytdVar] := ReportRec.SummaryBalances[I][trytdActual] - ReportRec.SummaryBalances[I][trytdPlan];
      end;    // for
    end;    // for
  if UnitsAreHours then
    begin
    ReportRec := TConsolidDeptRecPtr(DeptReportDataList.Items[DeptReportDataList.Count - 1]);
    ReportRec.UnitDescS := 'Hour';
    ReportRec.UnitdescP := 'Hours';
    end;
end;

procedure TDataCollector.CalculateMonitorDPLReportData(SummaryType : integer; perstart, Sdate, edate: TDateTime);
var
  k: Integer;
  SummaryEnd: Integer;
  DetailEnd: Integer;
  I: Integer;
	ReportSALES : TReportDataRecPtr;
	ReportCOGS : TReportDataRecPtr;
	ReportOTHERDIRECT : TReportDataRecPtr;
	ReportGP : TReportDataRecPtr;
	ReportTotalExp : TReportDataRecPtr;
	ReportNOP : TReportDataRecPtr;
	ReportOtherInc : TReportDataRecPtr;
	ReportDEPNINT : TReportDataRecPtr;
	ReportNP : TReportDataRecPtr;
	ReportData : TReportDataRecPtr;
//  TrackBal : TTrackingBals;
begin
	ReportSALES := Nil;
	ReportCOGS := Nil;
	ReportOTHERDIRECT := Nil;
	ReportDEPNINT := Nil;
	if GGlobals.Produce_AccountFmt then
    begin
    ReportSALES := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(SALES)]);
    ReportCOGS := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(COGS)]);
    ReportOTHERDIRECT := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(OTHERDIRECT)]);
    ReportDEPNINT := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(DEPNINTEREST)]);
    end;
  ReportGP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(GROSSPROFIT)]);
  ReportTotalExp := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(TOTALEXPENSES)]);
  ReportNOP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETOPERATINGPROFIT)]);
  ReportOtherInc := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(OTHERINCOME)]);
  ReportNP := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETPROFIT)]);

  if GGlobals.Produce_AccountFmt then
    begin
		ReportGP.TrackBalances[trperactual] := ReportSALES.TrackBalances[trperactual] - ReportCOGS.TrackBalances[trperactual] - ReportOTHERDIRECT.TrackBalances[trperactual];
    ReportNOP.TrackBalances[trperactual] := ReportGP.TrackBalances[trperactual] - ReportTotalexp.TrackBalances[trperactual];
    ReportNP.TrackBalances[trperactual] := ReportNOP.TrackBalances[trperactual] + ReportOtherInc.TrackBalances[trperactual] - ReportDEPNINT.TrackBalances[trperactual];

    ReportGP.TrackBalances[trperPlan] := ReportSALES.TrackBalances[trperPlan] - ReportCOGS.TrackBalances[trperPlan] - ReportOTHERDIRECT.TrackBalances[trperPlan];
    ReportNOP.TrackBalances[trperPlan] := ReportGP.TrackBalances[trperPlan] - ReportTotalexp.TrackBalances[trperPlan];
    ReportNP.TrackBalances[trperPlan] := ReportNOP.TrackBalances[trperPlan] + ReportOtherInc.TrackBalances[trperPlan] - ReportDEPNINT.TrackBalances[trperPlan];

    ReportGP.TrackBalances[trYtdactual] := ReportSALES.TrackBalances[trYtdactual] - ReportCOGS.TrackBalances[trYtdactual] - ReportOTHERDIRECT.TrackBalances[trYtdactual];
    ReportNOP.TrackBalances[trYtdactual] := ReportGP.TrackBalances[trYtdactual] - ReportTotalexp.TrackBalances[trYtdactual];
    ReportNP.TrackBalances[trYtdactual] := ReportNOP.TrackBalances[trYtdactual] + ReportOtherInc.TrackBalances[trYtdactual] - ReportDEPNINT.TrackBalances[trYtdactual];

    ReportGP.TrackBalances[trYtdPlan] := ReportSALES.TrackBalances[trYtdPlan] - ReportCOGS.TrackBalances[trYtdPlan] - ReportOTHERDIRECT.TrackBalances[trYtdPlan];
    ReportNOP.TrackBalances[trYtdPlan] := ReportGP.TrackBalances[trYtdPlan] - ReportTotalexp.TrackBalances[trYtdPlan];
    ReportNP.TrackBalances[trYtdPlan] := ReportNOP.TrackBalances[trYtdPlan] + ReportOtherInc.TrackBalances[trYtdPlan] - ReportDEPNINT.TrackBalances[trYtdPlan];

    end
  else
    begin
    ReportNOP.TrackBalances[trperactual] := ReportGP.TrackBalances[trperactual] - ReportTotalexp.TrackBalances[trperactual];
    ReportNP.TrackBalances[trperactual] := ReportNOP.TrackBalances[trperactual] + ReportOtherInc.TrackBalances[trperactual];
    ReportNOP.TrackBalances[trperPlan] := ReportGP.TrackBalances[trperPlan] - ReportTotalexp.TrackBalances[trperPlan];
    ReportNP.TrackBalances[trperPlan] := ReportNOP.TrackBalances[trperPlan] + ReportOtherInc.TrackBalances[trperPlan];
    ReportNOP.TrackBalances[trYtdactual] := ReportGP.TrackBalances[trYtdactual] - ReportTotalexp.TrackBalances[trYtdactual];
    ReportNP.TrackBalances[trYtdactual] := ReportNOP.TrackBalances[trYtdactual] + ReportOtherInc.TrackBalances[trYtdactual];
    ReportNOP.TrackBalances[trYtdPlan] := ReportGP.TrackBalances[trYtdPlan] - ReportTotalexp.TrackBalances[trYtdPlan];
    ReportNP.TrackBalances[trYtdPlan] := ReportNOP.TrackBalances[trYtdPlan] + ReportOtherInc.TrackBalances[trYtdPlan];
    end;
  for I := 0 to ReportDataList.Count - 1 do    // Iterate
    begin
    ReportData := TReportDataRecPtr(ReportDataList.Items[I]);
    if not ReportData.Account_DR then

//    if (ReportData.Accountno < FIRSTEXPENSE) or (ReportData.AccountNo > TOTALEXPENSES) then
      begin
      ReportData.TrackBalances[trperVar] := ReportData.TrackBalances[trperActual] - ReportData.TrackBalances[trperPlan];
      ReportData.TrackBalances[trYtdVar] := ReportData.TrackBalances[trytdActual] - ReportData.TrackBalances[trytdPlan];
      end
    else
      begin
      ReportData.TrackBalances[trperVar] := ReportData.TrackBalances[trperPlan] - ReportData.TrackBalances[trperActual];
      ReportData.TrackBalances[trYtdVar] := ReportData.TrackBalances[trytdPlan] - ReportData.TrackBalances[trytdActual];
      end;
    end;    // for
  DetailEnd := -1;
  SummaryEnd := -1;
  if SummaryType = 0 then
    DetailEnd := Trunc(DataModuleClient.DepartmentsCurrentMonitoringEnd.value
                - DataModuleClient.DepartmentsCurrentMonitoringStart.value) + 1
  else
    begin
    if Summarytype < 7 then
      I := 1
    else
      I := 0;
    while (SummaryPeriodIndexArray[I] <> 0) and (I < (NUM_WEEKS - 1)) do inc(I);
    SummaryEnd := I;
    end;
  if DetailEnd > 0 then
    begin
    for k := 0 to DetailEnd - 1 do
      begin   // Iterate
      ReportNOP.MonDetail[k] := ReportGP.monDetail[k] - ReportTotalExp.monDetail[K];
      ReportNP.MonDetail[k] := ReportNOP.monDetail[k] - ReportOtherInc.monDetail[K];
      end;
    end
  else
    begin
    for k := 0 to SummaryEnd - 1 do
      begin   // Iterate
      ReportNOP.MonSummary[k] := ReportGP.monSummary[k] - ReportTotalExp.monSummary[K];
      ReportNP.MonSummary[k] := ReportNOP.monSummary[k] - ReportOtherInc.monSummary[K];
      end;
    end;
end;

procedure TDataCollector.GetWages(ReportWages: TReportDataRecPtr);
var
  K: Integer;
  I: Integer;
//  SubTitle : array[0..120] of char;
  PastBal : TPastBalances;
  PlanDetail : TDetailedBalArray;
begin
  FillChar(ReportWages^, sizeof(TReportDataRecType), #0);
  DATAMODULECLIENT.AccountDetails.IndexName := 'PK_ACCOUNT_TITLES';

  for I := FIRSTEXPENSE to (TOTALEXPENSES - 1) do    // Iterate
    begin
    if LocateAccountTitle(I) and (DataModuleClient.AccountDetailsWAGE_ACCOUNT.Value <> 0)
      then begin
      FillChar(PastBal, Sizeof(TPastBalances), #0);
      getPastBalances(PastBal, I);
      for K := 0 to 4 do    // Iterate
        begin
        ReportWages.PastBalances[K] := ReportWages.PastBalances[K] + PastBal[K];
      end;    // for
      FillChar(PlanDetail, Sizeof(TDetailedBalArray), #0);
      // Set psdate and pedate and get Plan Balances
      if getBalances(PlanDetail, I, True, ctDepartment) then
        ReportWages.PlanTotal := ReportWages.PlanTotal +
          GetTotalBalance(
          PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
    end;
  end;    // for
end;

procedure TDataCollector.ReloadPastBalances;
begin
end;

procedure TDataCollector.PutPastBalances;
var
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
begin
  for cn := 0 to PlanDataList.count - 1
    do begin
    PlanDatarec := PlanDataList.Items[cn];
    if (DataModuleClient.DateRangersD_Index.value > 0) then
      begin
      if (PlanDataRec.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] <> 0) then
        setPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno)
      else
        ClearPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno);
      end;

    // Get Past Balances
//    getPastBalances(PlanDataRec.PastBalances, PlanDatarec.Accountno);
  end;
end;

procedure TDataCollector.getPlanningExpData(AdjustOtherExpenses : Boolean);
var
  I: Integer;
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
  PlanDataTotalRec : TPlanDataRecPtr;
  PlanExpDataRec : TPlanDataRecPtr;
  TotalPastBalances : TPastBalances;
  TotalPlanBalance{, tempbal, tempbal1} : Currency;
  varg, varg1 : variant;
//  cm : integer;
begin
  if Assigned(PlanExpDataList) then
    begin
    if PlanExpDataList.Count > 0 then
      ClearPlanExpDataList;
    end;
  if not Assigned(PlanExpDataList) then
    PlanExpDataList := Tlist.create;
  fillchar(DetailedArray, sizeof(TDetailedBalArray), #0);
  Fillchar(TotalPastBalances, sizeof(TPastBalances), #0);
  // check that Total Other Expenses has not been deleted/
  varg1 := TOTALOTHEREXPENSES;
  if (DataModuleClient.AccountDetails.Locate('ACCOUNT_NUMBER',varg1,[]) = false) then
    begin
    DataModuleClient.AccountDetails.Insert;
    DataModuleClient.AccountDetailsACCOUNT_NUMBER.AsInteger := TOTALOTHEREXPENSES;
    DataModuleClient.AccountDetailsACCOUNT_TITLE.AsString := 'Total Other Expenses';
    DataModuleClient.AccountDetailsACCOUNT_GROUP.AsInteger := 4;
    DataModuleClient.AccountDetails.Post;
    end;
//  TotalPastBalance := 0;
  PlanDataTotalRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  TotalPlanBalance := PlanDataTotalRec.PlanTotal;
  Fillchar(PlanDataTotalRec.PlanDetail, sizeof(TDetailedBalArray), #0);
  DetailedTotal := True;
  // Set psdate and pedate and get Plan Balances
  for cn := FIRSTEXPENSE to TOTALOTHEREXPENSES do
    begin
    Varg := cn;
    if DataModuleClient.AccountDetails.Locate('Account_Number',varg,[]) then
      begin
      new(PlanDatarec);
      FillChar(PlanDatarec^, sizeof(TPlanDataRecType), #0);
      PlanDatarec.Accountno := cn;
      // Get Account Titles
			PlanDatarec.AccountTitle :=DataModuleClient.AccountDetailsACCOUNT_TITLE.asstring;
      if DATAMODULECLIENT.AccountDetailsNON_CASH.Value <> 0 then
        PlanDataRec.Noncash := True
      else
        PlanDataRec.Noncash := False;
      if DATAMODULECLIENT.AccountDetailsWAGE_ACCOUNT.Value <> 0 then
        PlanDataRec.WagesAcc := True
      else
        PlanDataRec.WagesAcc := False;
      if DATAMODULECLIENT.AccountDetailsINTEREST_ACCOUNT.Value <> 0 then
        PlanDatarec.InterestAcc := true
      else
        PlanDatarec.InterestAcc := False;
      PlanDatarec.Account_Group := DataModuleClient.AccountDetailsACCOUNT_GROUP.Value;
      getPastBalances(PlanDataRec.PastBalances, cn);
      if cn <> TOTALOTHEREXPENSES then
        for I := 0 to 4 do    // Iterate
          TotalPastBalances[I] := TotalPastBalances[I] + PlanDataRec.PastBalances[I];

      if not getBalances(PlanDataRec.PlanDetail, cn, True, ctDepartment) then
        PlanDataRec.PlanTotal := 0
      else
        move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
      PlanDataRec.PlanTotal := GetTotalBalance(
        PlanDataRec^.PlanDetail,
        double(psdate),
        double(psdate),
        double(pedate));
      for I := 0 to trunc(pedate) - trunc(psdate) do    // Iterate
        PlanDataTotalRec.PlanDetail[I] := PlanDataTotalRec.PlanDetail[I] + PlanDataRec.PlanDetail[I];
      PlanExpDataList.Add(PlanDataRec);
      end;
    end;
  PlanExpLoaded := True;
  PlanDataTotalRec.PlanTotal := GetTotalBalance(
        PlanDataTotalRec^.PlanDetail,
        double(psdate),
        double(psdate),
        double(pedate));
  PlanExpDataRec := PlanExpDataList.Items[getExpAccountListIndex(TOTALOTHEREXPENSES)];
  // This account carries any difference for Past Result
  for I := 0 to 4 do
    PlanExpDataRec.PastBalances[I] := PlanDatatotalRec.PastBalances[I] - TotalPastBalances[I];

  // if the total of planned expenses is not zero then the plan must agree with
  // the new total obtained unless AdjustOtherExpenses is True.
  if AdjustOtherExpenses and (PlanDataTotalRec.PlanTotal <> TotalPlanBalance) then
    begin
    // now its time to adjust Total Other Expense
    updateArray(PlanExpDataRec.PlanDetail,
                  0, DaysBetween(pedate, psdate),
                  PlanExpDataRec.PlanTotal - PlanDataTotalRec.PlanTotal + TotalPlanBalance,
                  6);
    PlanExpDataRec.PlanTotal := PlanExpDataRec.PlanTotal - PlanDataTotalRec.PlanTotal + TotalPlanBalance;
    end;
//  move(DetailedArray, PlanDataTotalrec.PlanDetail, sizeof(TDetailedBalArray));
{  else
    begin
    if TotalPlanBalance <> 0 then
      begin
      move(DetailedArray, PlanDatarec.PlanDetail, sizeof(TDetailedBalArray));
      // now set the new total
      PlanDataRec.PlanTotal := GetTotalBalance(
        PlanDataRec^.PlanDetail,
        double(psdate),
        double(psdate),
        double(pedate));
      end
    else // make the temp array equal to the distribution in Total Expenses
      move(PlanDatarec.PlanDetail, DetailedArray, sizeof(TDetailedBalArray));

    if TotalPlanBalance = 0 then
      begin
      move(DetailedArray, PlanDatarec.PlanDetail, sizeof(TDetailedBalArray));
      // now set the new total
      PlanDataRec.PlanTotal := GetTotalBalance(
        PlanDataRec^.PlanDetail,
        double(psdate),
        double(psdate),
        double(pedate));
      end;
    end;
}
  BuildSummary(PlanDataTotalRec.accountNo, psdate, pedate, PlanDataTotalRec.PlanDetail, PlanDataTotalRec^.PlanSummary);
  for cn := 0 to PlanExpDataList.count - 1 do    // Iterate
    begin
    PlanExpDataRec := PlanExpDataList.Items[cn];
    BuildSummary(PlanExpDataRec.accountNo, psdate, pedate, PlanExpDataRec.PlanDetail, PlanExpDataRec^.PlanSummary);
    end;
  sortExpenseList(True);
end;

procedure TDataCollector.getMonitoringExpData;
var
  cn : integer;
  astart, aend, balIndex: integer;
  MonitorDataRec : TPlanDataRecPtr;
  varg : variant;
  TempPlanTotal : currency;
  TempDetail: TDetailedBalArray;
  TotalExpensesBal: TDetailedBalArray;
  OldStr, Newstr : string;
begin
  if Assigned(MonitoringExpDataList) then
    begin
    if MonitoringExpDataList.Count > 0 then
      ClearMonitorExpDataList;
    end;
  if not Assigned(MonitoringExpDataList) then
    MonitoringExpDataList := Tlist.create;
  fillchar(DetailedArray, sizeof(TDetailedBalArray), #0);
  fillchar(TotalExpensesBal, sizeof(TDetailedBalArray), #0);
//  TotalPastBalance := 0;
  MonitoringExpLoaded := False;
  DetailedTotal := True;
  psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  astart := 0;
  aend := trunc(pedate) - trunc(psdate);
  for cn := FIRSTEXPENSE to TOTALEXPENSES do
    begin
    Varg := cn;
    if DataModuleClient.AccountDetails.Locate('Account_Number',varg,[])then
      begin
      fillchar(DetailedArray, sizeof(TDetailedBalArray), #0);
			Oldstr := DATAMODULECLIENT.AccountDetailsACCOUNT_TITLE.asstring;
      if not getBalances(TempDetail, cn, True, ctDepartment) then
        TempPlanTotal := 0
      else
        TempPlanTotal := GetTotalBalance(
        tempDetail,
        double(psdate),
        double(psdate),
        double(pedate));
      if (length(oldstr) > 0) or (TempPlanTotal <> 0) then
        begin
        new(MonitorDatarec);
        FillChar(MonitorDatarec^, sizeof(TPlanDataRecType), #0);
        MonitorDatarec.Accountno := cn;
				// Get Account Titles
				if (Not AnsiContainsText(OldStr, ' /')) and (Not AnsiContainsText(OldStr, '/ ')) then
					Newstr := AnsiReplaceStr(Oldstr, '/', ' / ')
				else
          NewStr := OldStr;
        MonitorDatarec.AccountTitle := newStr;
				MonitorDatarec.AccountSubTitle := DATAMODULECLIENT.AccountDetailsACCOUNT_SUBTITLE.asstring;
        getBalances(MonitorDatarec^.PlanDetail, cn, False, ctDepartment);
//         then  TempPlanTotal := 0;
        move(MonitorDataRec.PlanDetail, MonitorDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
        for balIndex := astart to aend do
          begin
          if cn <> TOTALEXPENSES then
            TotalExpensesBal[balindex] := TotalExpensesBal[balindex]  + MonitorDatarec^.PlanDetail[balIndex]
          else
            MonitorDatarec^.PlanDetail[balIndex] := TOTALEXPENSESBal[balindex];
          end;
        MonitorDataRec.PlanTotal := GetTotalBalance(
          MonitorDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
        MonitoringExpDataList.Add(MonitorDataRec);
        end;
      end;
    if Cn = TOTALOTHEREXPENSES then
      sortExpenseList(False);
    end;
  MonitoringExpLoaded := True;
end;

function TDataCollector.GetUserOption(OptName: String; Otype : TUOType): Variant;
var
  varg, Varg1 : Variant;
begin
  varg := OptName;
  result := 0;
  if DataModuleClient.OptionNames.Locate('OPTION_NAME', Varg, []) then
    begin
    Varg1 := DataModuleClient.OptionNamesNAME_INDEX.Value;
    if DataModuleClient.UserOptions.Locate('NAMEINDEX', Varg1, []) then
      begin
      case Otype of    //
        UOInteger:
          Result := DataModuleClient.UserOptionsINTEGER_VALUE.value;
        UOCurrency:
          Result := DataModuleClient.UserOptionsCURRENCY_VALUE.value;
        UODate:
          Result := DataModuleClient.UserOptionsDATETIME_VALUE.Value;
        UOString:
          Result := DataModuleClient.UserOptionsSTRING_VALUE.Value;
        end;    // case
      end;
    end;
end;

function TDataCollector.DoesUserOptionExist(OptName: String): Boolean;
var
  varg, Varg1 : Variant;
begin
  DataModuleClient.DeptOptions.Active := False;
  DataModuleClient.DeptOptions.Filter := 'DEPT_ID=' + DataModuleClient.CashFlowDeptDEPT_ID.AsString;
  DataModuleClient.DeptOptions.Filtered := True;
  DataModuleClient.DeptOptions.active := True;
  varg := OptName;
  result := False;
  if DataModuleClient.OptionNames.Locate('OPTION_NAME', Varg, []) then
    begin
    Varg1 := DataModuleClient.OptionNamesNAME_INDEX.Value;
    if DataModuleClient.UserOptions.Locate('NAMEINDEX', Varg1, []) then
      Result := True;
    end;
end;

function TDataCollector.SetUserOption(OptName: String; Otype : TUOType; Ovalue : Variant): Boolean;
var
  varg, Varg1 : Variant;
begin
  varg := OptName;
  if not DataModuleClient.OptionNames.Locate('OPTION_NAME', Varg, []) then
    begin
    DataModuleClient.OptionNames.Insert;
		DataModuleClient.OptionNamesOPTION_NAME.AsString := Optname;
    DataModuleClient.OptionNames.Post;
    DataModuleClient.OptionNames.refresh;
    DataModuleClient.OptionNames.Locate('OPTION_NAME', Varg, []);
    end;

  Varg1 := DataModuleClient.OptionNamesNAME_INDEX.Value;
  if DataModuleClient.UserOptions.Locate('NAMEINDEX', Varg1, []) then
    DataModuleClient.UserOptions.Edit
  else
    begin
    DataModuleClient.UserOptions.Insert;
    DataModuleClient.UserOptionsOPTION_GROUP_ID.Value := DataModuleClient.DeptOptionsOPTION_GROUP_ID.Value;
    DataModuleClient.UserOptionsNAMEINDEX.Value := Varg1;
    end;
  case Otype of    //
    UOInteger:
      DataModuleClient.UserOptionsINTEGER_VALUE.value := Ovalue;
    UOCurrency:
      DataModuleClient.UserOptionsCURRENCY_VALUE.value := Ovalue;
    UODate:
      DataModuleClient.UserOptionsDATETIME_VALUE.Value := Ovalue;
    UOString:
			DataModuleClient.UserOptionsSTRING_VALUE.AsString := OValue;
    end;    // case
  DataModuleClient.UserOptions.Post;
  DataModuleClient.UserOptions.Refresh;
  Result := True;
end;

procedure TDataCollector.getPlanBalanceonDateEx(Deptid : Integer; Baldate: TDateTime; AccountNo: integer; var Balance: Currency; Var PreviousDayNonZero: Boolean);
Var
  I: Integer;
  tempstream : TmemoryStream;
  Tempbalances : TDetailedBalArray;
  varg : Variant;
  found : Boolean;
  d, m, y : Word;
  daystostart : integer;
//  DeptRec : TdepartRecPtr;
begin
  Balance := 0;
  PreviousDayNonZero := False;
  tempstream := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  decodeDate(Baldate, y, m, d);
  varg := VarArraycreate([0,3], VarVariant);
//  DeptRec := TDepartRecPtr(ConsolidList.items[0]);
  varg[0] := DeptID; // DataModuleClient.DepartmentsDEPT_ID.Value;
  varg[1] := AccountNo;
  varg[2] := Y;
  FillChar(tempstream.memory^, tempstream.size, #0);
  FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
  tempstream.Seek(0, soFromBeginning);
  found := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
  if found then
    DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream);
  tempstream.Seek(0, soFromBeginning);
  I := (DaysinYear(Baldate) + 1) * Sizeof(Currency);
  if (tempstream.read(TempBalances, I) > 0) then
    begin
		daystostart := DayOfTheYear(BalDate);
    if Daystostart > 0 then
      begin
      if tempbalances[Daystostart - 1] <> 0 then
        PreviousDayNonZero := True;
      end
    else
      begin
      balance := 0;
      getPlanBalanceonDateEx(DeptID, (Baldate - 1), AccountNo, Balance, PreviousDayNonZero);
      if Balance <> 0 then
        PreviousDayNonZero := True
      else
        PreviousDayNonZero := False;
      end;
    Balance := tempBalances[DaystoStart];
    end;
  tempstream.Free;
end;

function TDataCollector.SetPlanBalanceonDateEx(DeptID : Integer; Baldate: TDateTime; AccountNo: integer; Balance: Currency): Boolean;
Var
  I : integer;
  tempstream : TmemoryStream;
  Tempbalances : TDetailedBalArray;
  Found : boolean;
  varg : variant;
//  recdate : double;
  d, m, y : Word;
  daystostart : integer;
begin
  Result := False;
  tempstream := TmemoryStream.create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  FillChar(tempstream.memory^, tempstream.size, #0);
  FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
  // see if we have any balances for the year
  decodeDate(Baldate, y, m, d);
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := DeptID; // DataModuleClient.DepartmentsDept_ID.value;
  varg[1] := AccountNo;
  varg[2] := y;
  found := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
  if not found then
    begin
    DataModuleClient.PlanData.Insert;
    DataModuleClient.PlanDataDept_ID.value := DeptID; // DataModuleClient.DepartmentsDept_ID.value;
    DataModuleClient.PlanDataAccount_Number.Value := AccountNo;
    DataModuleClient.PlanDataD_Year.value := Y;
    DataModuleClient.PlanDataD_TYPE.Value := 1;
    end
  else
    begin
    DataModuleClient.PlanData.Edit;
    tempstream.Seek(0,  soFromBeginning);
    DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream);
    end;
  // get the balances to Tempbalances
  I := DaysInyear(Baldate) + 1;
  tempstream.Seek(0,  soFromBeginning);
  if (tempstream.read(tempBalances, Sizeof(currency) * I) > 0) then
    begin
		daystostart := DayOfTheYear(BalDate);
    // set the new balance
    tempbalances[daystostart] := Balance;
    // send back to stream
    tempstream.seek(0, soFromBeginning);
    tempstream.Write(tempbalances, Sizeof(currency) * I);
    end;
  DataModuleClient.PlanDataD_Bals.LoadFromStream(tempstream);
  DataModuleClient.PlanData.Post;
  tempstream.Free;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearPlanDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearPlanDataList;
var
  index: integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  if PlanLoaded
    then begin
    for index := 0 to PlanDataList.Count - 1
      do begin
      PlanDataRec := TPlanDataRecPtr(PlanDataList.Items[index]);
      dispose(PlanDataRec);
//      PlanDataList.Delete(index);
    end;
    PlandataList.clear;
//    PlandataList.free;
  end;
  PlanLoaded := False;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearMonitoringDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearMonitoringDataList;
var
  index: integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  if Assigned(MonitoringDataList)
    then begin
    for index := 0 to MonitoringDataList.Count - 1
      do begin
      PlanDataRec := TPlanDataRecPtr(MonitoringDataList.Items[index]);
      dispose(PlanDataRec);
    end;
    MonitoringDataList.clear;
    MonitoringDataList.free;
    MonitoringDataList := nil;
  end;
  MonitoringLoaded := False;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearReportDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearReportDataList;
var
  index: integer;
  ReportDataRec: TReportDataRecPtr;
begin
  if Assigned(ReportDataList)
    then begin
    for index := 0 to ReportDataList.Count - 1
      do begin
      ReportDataRec := TReportDataRecPtr(ReportDataList.Items[index]);
      dispose(ReportDataRec);
    end;
    ReportdataList.clear;
//    ReportdataList.free;
  end;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearDeptReportDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearDeptReportDataList;
var
  index: integer;
  DeptReportDataRec: TConsolidDeptRecPtr;
begin
  if Assigned(DeptReportDataList) then
    begin
    for index := 0 to DeptReportDataList.Count - 1 do
      begin
      DeptReportDataRec := TConsolidDeptRecPtr(DeptReportDataList.Items[index]);
      dispose(DeptReportDataRec);
      end;
    DeptReportdataList.clear;
    end;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearPlanExpDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearPlanExpDataList;
var
  index: integer;
  PlanDataRec: TPlanDataRecPtr;
begin
  if Assigned(PlanExpDataList)
    then begin
    for index := 0 to PlanExpDataList.Count - 1
      do begin
      PlanDataRec := TPlanDataRecPtr(PlanExpDataList.Items[index]);
      dispose(PlanDataRec);
//      PlanExpDataList.delete(index);
    end;
    PlanExpdataList.clear;
//    PlanExpDataList.free;
  end;
  PlanExpLoaded := False;
end;

{ ---------------------------------------------------------------------------- }
{ -- clearPlanExpDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearMonitorExpDataList;
var
  index: integer;
  MonitorDataRec: TPlanDataRecPtr;
begin
//  if MonitoringExpLoaded
//    then begin
    for index := 0 to MonitoringExpDataList.Count - 1
      do begin
      MonitorDataRec := TPlanDataRecPtr(MonitoringExpDataList.Items[index]);
      dispose(MonitorDataRec);
    end;
    MonitoringExpdataList.clear;
    MonitoringExpdataList.free;
    MonitoringExpDataList := Nil;
//    MonitoringExpLoaded := False;
//  end;
end;

procedure TDataCollector.setPlanningData;
var
  cn : integer;
  ltotal : currency;
  PlanDataRec : TPlanDataRecPtr;
begin
  psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  for cn := 0 to PlanDataList.count - 1 do
    begin
    PlanDataRec := PlanDataList.items[cn];
    if PlanDataRec.AccountNo < 10000 then
      begin
      // Set Past Balance
//      if PlanDatarec.Accountno = TOTALOTHEREXPENSES then
//        Ltotal := 0;
      // All data for past information may have changed so we go through the lot
      DataModuleClient.DateRangers.First;
      while DataModuleClient.DateRangers.Eof = False do
        begin
        if DataModuleClient.DateRangersD_Index.value > 0 then
          begin
          if PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] <> 0 then
            setPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno)
          else
            ClearPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno);
          end;
        DataModuleClient.DateRangers.next;
        end;    // while

      // Set Plan Balances
      //Update Array with Total
      if (PlanDataRec.Accountno <> WHATIF) and (PlanDataRec.Accountno <> DETAILEDOPT) then
        begin
        ltotal := GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
        if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
          ltotal := ltotal / (Trunc(pedate - psdate) + 1);

        if (PlanDataRec.PlanTotal <>  ltotal) then
          begin
          if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
            PlanDataRec.planTotal := PlanDataRec.PlanTotal * (Trunc(pedate - psdate) + 1);
          if (GGlobals.UnitRounding = 0)
            and ((PlanDataRec.Accountno = BILLED) or (PlanDataRec.Accountno = BILLED))  then
            updateArray(  PlanDataRec.PlanDetail,
                  0, DaysBetween(pedate, psdate),
                  PlanDataRec.PlanTotal,
                  1)
          else
            updateArray(  PlanDataRec.PlanDetail,
                  0, DaysBetween(pedate, psdate),
                  PlanDataRec.PlanTotal,
                  6);
          end;
        end;
      if CompareMem(pointer(@PlanDataRec.PlanDetail), Pointer(@PlanDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False then
        begin
        setBalances(PlanDataRec.PlanDetail, DataModuleClient.DepartmentsDept_id.Value, PlanDatarec.Accountno, True);
        move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
        end;
      end;
    end;
end;

procedure TDataCollector.setMonitoringData;
var
  cn, J, K : integer;
  PlanDataRec : TPlanDataRecPtr;
  FirstMDate, LastMDate : Integer;
begin
  psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  K := Trunc(pedate) - trunc(psdate) + 1;
  FirstMdate := k + 1;
  LastMdate := -1;
  for cn := 0 to MonitoringDataList.count - 1 do
    begin
    PlanDataRec := MonitoringDataList.items[cn];
    if PlanDataRec.AccountNo < 10000 then
      begin
      // Set Past Balance
//      if PlanDatarec.Accountno = TOTALOTHEREXPENSES then
//        Ltotal := 0;
      // Set Plan Balances
      //Update Array with Total
      if PlanDataRec.AccountNo < 2000 then
        begin
        J := k;
        while (PlanDataRec.PlanDetail[J] = 0) and (J >= 0) do
          dec(j);
        if J > LastMdate then LastMDate := J;
        J := 0;
        while (PlanDataRec.PlanDetail[J] = 0) and (J < K) do
          inc(j);
        if J < FirstMdate then FirstMDate := J;
        end;
      if CompareMem(pointer(@PlanDataRec.PlanDetail), Pointer(@PlanDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False then
        begin
        setBalances(PlanDataRec.PlanDetail, DataModuleClient.DepartmentsDept_id.Value, PlanDatarec.Accountno, False);
        move(PlanDataRec.PlanDetail, PlanDatarec.PlanDetaildisk, sizeof(TDetailedBalArray));
        end;
      end;
    end;
  // Update LastMonitored Date in Department
  DataModuleClient.Departments.edit;
  // if no data but the FirstMonitoringDate is the current period, delete both
  if (LastMDate = -1) and (DataModuleClient.DepartmentsFirstMonitoringdate.value >= psdate) then
    begin
    DataModuleClient.DepartmentsLast_Monitored.Clear;
    DataModuleClient.DepartmentsFirstMonitoringDate.Clear
    end
  else
    begin
    if (LastMDate > -1) and (DataModuleClient.DepartmentsLast_Monitored.value < (psdate + LastMdate)) then
      DataModuleClient.DepartmentsLast_Monitored.value := psdate + LastMDate;
    if (FirstMDate < (K + 1))
      and ((DataModuleClient.DepartmentsFirstMonitoringDate.value > (psdate + FirstMDate))
      or (DataModuleClient.DepartmentsFirstMonitoringDate.IsNull)) then
      DataModuleClient.DepartmentsFirstMonitoringDate.value := psdate + FirstMDate;
    end;
  DataModuleClient.Departments.Post;
end;

// This procedure restores values
// from the file overwriting values currently held in memory.
// It excludes past data values as they are direct.
{
procedure TDataCollector.RefreshPlanningData;
var
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
begin
  //
  psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  for cn := 0 to PlanDataList.count - 1
    do begin
    PlanDataRec := PlanDataList.items[cn];
    if PlanDataRec.AccountNo < 10000
      then begin
      move(PlanDataRec.PlanDetailDisk, PlanDatarec.PlanDetail, sizeof(TDetailedBalArray));
      if PlanDataRec.Accountno <> WHATIF
        then PlanDataRec.PlanTotal := GetTotalBalance(
          PlanDataRec^.PlanDetail,
          double(psdate),
          double(psdate),
          double(pedate));
    end;
  end;
end;
}
procedure TDataCollector.setPlanningExpData;
var
  cn : integer;
  ltotal : currency;
  PlanDataRec : TPlanDataRecPtr;
  varg : variant;
begin
  //
  psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  for cn := 0 to PlanExpDataList.count - 1 do
    begin
    PlanDataRec := PlanExpDataList.items[cn];
    // Set Past Balance
    if PlanDatarec.Accountno = 560 then
      varg := 0;
      DataModuleClient.DateRangers.First;
      while DataModuleClient.DateRangers.Eof = False do
        begin
        if DataModuleClient.DateRangersD_Index.value > 0 then
          begin
          if PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1] <> 0 then
            setPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno)
          else
            ClearPastBalance(@PlanDataRec^.PastBalances[DataModuleClient.DateRangersD_Index.value - 1], PlanDatarec.Accountno);
          end;
        DataModuleClient.DateRangers.next;
        end;    // while

    // Set Plan Balances
    //Update Array with Total
     varg := PlanDataRec.Accountno;
     if DataModuleClient.AccountDetails.Locate('Account_Number', varg, []) = true then
      begin
      DataModuleClient.AccountDetails.edit;
      if PlanDataRec.WagesCB = cbChecked then
        DataModuleClient.AccountDetailsAccount_SubTitle.value := 'W'
      else
        DataModuleClient.AccountDetailsAccount_SubTitle.value := '';
      DataModuleClient.AccountDetails.Post;
      end;
    ltotal := GetTotalBalance(
      PlanDataRec^.PlanDetail,
      double(psdate),
      double(psdate),
      double(pedate));
    if (PlanDataRec.PlanTotal <>  ltotal) then
        updateArray(PlanDataRec.PlanDetail,
                  0, DaysBetween(pedate, psdate),
                  PlanDataRec.PlanTotal,
                  6);
    if CompareMem(pointer(@PlanDataRec.PlanDetail), Pointer(@PlanDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False then
      setBalances(PlanDataRec.PlanDetail, DataModuleClient.DepartmentsDept_id.Value, PlanDatarec.Accountno, True);
    end;
end;

procedure TDataCollector.setMonitoringExpData;
var
  cn, J, K : integer;
//  ltotal : currency;
  MonitorDataRec : TPlanDataRecPtr;
  varg : variant;
  FirstMdate, LastMDate : Integer;
begin
  psdate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  pedate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  K := Trunc(pedate) - trunc(psdate) + 1;
  FirstMdate := k + 1;
  LastMdate := -1;
  for cn := 0 to MonitoringExpDataList.count - 1
    do begin
    MonitorDataRec := MonitoringExpDataList.items[cn];
    // Set Past Balance
    // Set Plan Balances
    //Update Array with Total
    J := k;
    while (MonitorDataRec.PlanDetail[J] = 0) and (J >= 0) do
      dec(j);
    if J > LastMdate then LastMDate := J;
    J := 0;
    while (monitorDataRec.PlanDetail[J] = 0) and (J <= K) do
      inc(j);
    if J < FirstMdate then FirstMDate := J;
    varg := MonitorDataRec.Accountno;
    if CompareMem(pointer(@MonitorDataRec.PlanDetail), Pointer(@MonitorDataRec.PlanDetailDisk), Sizeof(currency) * NUM_DAYSINYEAR) = False then
      setBalances(MonitorDataRec.PlanDetail, DataModuleClient.DepartmentsDept_id.Value, MonitorDatarec.Accountno, False);
  end;
  DataModuleClient.Departments.edit;
  if (LastMDate > -1) and (DataModuleClient.DepartmentsLast_Monitored.value < (psdate + LastMdate))
    then DataModuleClient.DepartmentsLast_Monitored.value := psdate + LastMDate;
  if (FirstMDate < (K + 1)) and (DataModuleClient.DepartmentsFirstMonitoringDate.value > (psdate + FirstMDate))
    then DataModuleClient.DepartmentsFirstMonitoringDate.value := psdate + FirstMDate;
  DataModuleClient.Departments.Post;
end;

Function TDataCollector.LocateAccountTitle(Accountno : integer): Boolean;
var
  varg : Variant;
begin
  Varg := Accountno;
  Result := DataModuleClient.AccountDetails.Locate('ACCOUNT_NUMBER',varg, []);
end;

function TDataCollector.getAccountSubTitle(SubTitle: Pchar; Accountno : Integer): Boolean;
var
  varg,varg1 : Variant;
begin
  Varg := Accountno;
  // Assume True
  Result := true;
  varg1 := DataModuleClient.AccountDetails.Lookup('Account_Number',varg,'Account_SubTitle');
  if (VarType(varg1) <> varString)
    then Result := False
  else strPcopy(SubTitle, varg1);
end;

procedure TDataCollector.getPastBalances(var balances : Array of currency;Accountno : Integer);
var
  I: Integer;
  varg : Variant;
  pastdate : double;
  DeptRec : TDepartRecPtr;
begin
  varg := VarArraycreate([0,3], VarVariant);
  varg[1] := AccountNo;
  for I := 0 to 4 do Balances[I] := 0;
  for I := 0 to ConsolidList.Count - 1 do    // Iterate
  begin
    DeptRec := TDepartRecPtr(ConsolidList.items[I]);
    varg[0] := DeptRec.DeptID;
    if (ConsolidList.count = 1) or (Not OKtoExclude(DeptRec.DeptId))then
    begin
      DataModuleClient.DateRef.IndexName := 'ENDDATEIDX';
      DataModuleClient.DateRef.First;
      while DataModuleClient.DateRef.Eof = False do
      begin
        pastdate := trunc(DataModuleClient.DateRefEndDate.asfloat);
        varg[2] := pastdate;
        if DataModuleClient.DateRefDept_ID.value = DeptRec.DeptId then
        begin
          if DataModuleClient.ActualDataLU.Locate('Dept_id;Account_Number;PeriodEnd', varg, []) then
            Balances[DataModuleClient.DateRefD_Index.value - 1] := Balances[DataModuleClient.DateRefD_Index.value - 1]
              + DataModuleClient.ActualDataLUBal.Value;

//          Varg1 := DataModuleClient.ActualData.Lookup('Dept_ID;Account;Date',varg,'Bal');
//          if (Varg1 <> null)
//            and (VarType(varg1) <> varBoolean) or ((varType(varg1) = varBoolean) and (varg1 = True)) then
//          Balances[DataModuleClient.wwDateRefIndex.value - 1] := Balances[DataModuleClient.wwDateRefIndex.value - 1] + varg1;
        end;
        DataModuleClient.DateRef.next;
      end;    // while
    end; // if add
  end;    // for
end;

function TDataCollector.GetPastBalance(Accountno : Integer; pastDate: TDateTime): Currency;
var
  varg : Variant;
begin
  Result := 0;
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := DataModuleClient.DepartmentsDept_ID.value;
  varg[1] := AccountNo;
  varg[2] := pastdate;
  if DataModuleClient.ActualDataLU.Locate('Dept_ID;Account_Number;Periodend',varg,[]) then
    Result := DataModuleClient.ActualDataLUBal.Value;
end;

function TDataCollector.setPastBalance(balance : Pcurrency;Accountno : Integer): Boolean;
var
  varg {, varg1} : Variant;
  pastdate : double;
begin
  // Assume True
  Result := true;
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := DataModuleClient.DepartmentsDept_ID.value;
  varg[1] := AccountNo;
  pastdate := trunc(DataModuleClient.DateRangersEndDate.asfloat);
  varg[2] := pastdate;
  if not DataModuleClient.ActualData.Locate('Dept_ID;Account_Number;Periodend',varg,[])
    then begin
    DataModuleClient.ActualData.Insert;
    DataModuleClient.ActualDataDept_ID.value := DataModuleClient.DepartmentsDept_ID.value;
    DataModuleClient.ActualDataAccount_Number.Value := AccountNo;
    DataModuleClient.ActualDataPeriodEnd.value := trunc(DataModuleClient.DateRangersEndDate.asfloat);
    end
  else
    DataModuleClient.ActualData.Edit;
  DataModuleClient.ActualDataBal.Value := Balance^;
  DataModuleClient.ActualData.Post;
end;

function TDataCollector.ClearPastBalance(balance : Pcurrency;Accountno : Integer): Boolean;
var
  varg{, varg1} : Variant;
  pastdate : double;
begin
  // Assume True
  Result := true;
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := DataModuleClient.DepartmentsDept_ID.value;
  varg[1] := AccountNo;
  pastdate := trunc(DataModuleClient.DateRangersEndDate.asfloat);
  varg[2] := pastdate;
  if not DataModuleClient.ActualData.Locate('Dept_ID;Account_Number;PeriodEnd',varg,[]) then
    Result := False
  else
    DataModuleClient.ActualData.Delete;
end;

function TDataCollector.getRateBalances(var Balances : array of currency; MonitorDate : TDateTime): Boolean;
var
  GPbal : TDetailedBalArray;
  BilledBal : TDetailedBalArray;
  d, m, y : Word;
  Days : word;
  TargetGP, TargetBilled {, TrackedGP, TrackedBilled }: Currency;
begin
  Result := True;
  decodeDate(monitordate, y, m, d);
  psDate := EncodeDate(Y, M, Word(1));
  Days := DaysinMonth(psDate);
  peDate := EncodeDate(Y, M, Days);
  getBalances(GPBal, GROSSPROFIT, True, ctDepartment);
  GetBalances(BilledBal, BILLED, True, ctDepartment);
  TargetGP := GetTotalBalance(GPBal, double(psdate), double(psdate), double(pedate));
  TargetBilled := GetTotalBalance(BilledBal, double(psdate), double(psdate), double(pedate));
  if TargetBilled <> 0 then
    Balances[MMONTHLYTARGET] := TargetGP / TargetBilled
  else
    Balances[MMONTHLYTARGET] := 0;
  if M > 1 then
    Dec(M)
  else begin
    M := 12;
    Dec(Y);
  end;
  psDate := EncodeDate(Y, M, Word(1));
  Days := DaysinMonth(psDate);
  peDate := EncodeDate(Y, M, Days);
  getBalances(GPBal, GROSSPROFIT, False, ctDepartment);
  GetBalances(BilledBal, BILLED, False, ctDepartment);
  TargetGP := GetTotalBalance(GPBal, double(psdate), double(psdate), double(pedate));
  TargetBilled := GetTotalBalance(BilledBal, double(psdate), double(psdate), double(pedate));
  if TargetBilled <> 0 then
    Balances[MLASTMONTHMONITORED] := TargetGP / TargetBilled
  else
    Balances[MLASTMONTHMONITORED] := 0;
end;

function TDataCollector.getBalances(var Balances : array of currency; Accountno : integer; UsePlanData : Boolean; ConType : TConsolidateType): Boolean;
Var
  J: Integer;
  I: Integer;
  Tempbalances : TDetailedBalArray;
  DeptRec : TdepartRecPtr;
begin
  Result := False;
  FillChar(Balances, sizeof(TDetailedBalArray), #0);
  ///
  if ConType = ctCashflow then
    begin
    DataModuleClient.Departments.First;
    while DataModuleClient.Departments.eof = False do
      begin
      if DataModuleClient.DepartmentsEXCLUDE_FROM_CASHFLOW.Value = 0 then
        begin
        FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
        if getDeptBalances(TempBalances, DataModuleClient.DepartmentsDept_Id.Value, Accountno, UsePlanData) then
          begin
          Result := True;
          for J := 0 to NUM_DAYSINYEAR - 1 do    // Iterate
            Balances[J] := Balances[J] + Tempbalances[J];
          end;
        end;
      DataModuleClient.Departments.next;
      end;    // while
    end
  else
    begin
    for I := 0 to ConsolidList.Count - 1 do    // Iterate
      begin
      DeptRec := TDepartRecPtr(ConsolidList.items[I]);
      if (ConsolidList.count = 1) or (not OKtoExclude(DeptRec.DeptId)) then
        begin
        FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
        if getDeptBalances(TempBalances, DeptRec.DeptId, Accountno, UsePlanData) then
          begin
          Result := True;
          for J := 0 to NUM_DAYSINYEAR - 1 do    // Iterate
            Balances[J] := Balances[J] + Tempbalances[J];
          end;
        end;
      end;    // for
    end;
end;

function TDataCollector.FindFirstandLastPlanDates(DeptId:integer; var Sdate, Edate : TDateTime): Boolean;
var
  I: Integer;
  Tempbalances : TDetailedBalArray;
  tempstream : TmemoryStream;
  foundS : Boolean;
  y : Word;
  daysinyear, lastnonzero : integer;
begin
  result := False; // assume we dont have any.
  FoundS := False;
  tempstream := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
  DataModuleClient.PlanData.Active := false;
  DataModuleClient.PlanData.Filter := '(DEPT_ID=' + inttostr(Deptid)+ ') and (ACCOUNT_NUMBER=' + inttostr(GROSSPROFIT) + ')';
  DataModuleClient.PlanData.Filtered := True;
  DataModuleClient.PlanData.Active := True;
  DataModuleClient.PlanData.First;
  Sdate := 0;
  Edate := 0;
  while DataModuleClient.PlanData.Eof = False do
    begin
    FillChar(tempstream.memory^, tempstream.size, #0);
    FillChar(TempBalances, sizeof(TDetailedBalArray), #0);
    tempstream.Seek(0, soFromBeginning);
    DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream);
    tempstream.Seek(0, soFromBeginning);
    Y := word(DataModuleClient.PlanDataD_YEAR.AsInteger);
    Edate := EncodeDate(Y, word(1), word(1));
    if (Not founds) then
      Sdate := Edate;
    Daysinyear := DaysinaYear(Y);
    lastnonzero := 0;
    if (tempstream.read(TempBalances, Sizeof(currency) * DaysinYear) > 0) then
      begin
      for I := 0 to Daysinyear - 1 do    // Iterate
        begin
        if (Tempbalances[I] <> 0) then
          begin
          Result := true;
          if (Not foundS) and (Tempbalances[I] <> 0) then
            begin
            Sdate := Sdate + I;
            foundS := True;
            end;
          Lastnonzero := I;
          end;
        end;      // for
      end;
    if lastnonzero > 0 then
      Edate := Edate + lastnonzero;
    DataModuleClient.PlanData.Next;
    end;    // while
  tempstream.Free;
  DataModuleClient.PlanData.Active := false;
  DataModuleClient.PlanData.Filter := '';
  DataModuleClient.PlanData.Filtered := False;
  DataModuleClient.PlanData.Active := True;
end;

function TDataCollector.getDeptBalances(var Balances : array of currency; DeptId : Integer; Accountno : integer; UsePlanData : Boolean): Boolean;
Var
  tempstream : TmemoryStream;
  tempstream1 : TmemoryStream;
  varg : Variant;
  found, found1 : Boolean;
  d, m, y, y1 : Word;
	daystostart, daystoend, offset : integer;
begin
  Result := False;
  Found1 := False;
  tempstream := TmemoryStream.Create;
  tempstream1 := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  tempstream1.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  decodeDate(psdate, y, m, d);
  decodeDate(pedate, y1, m, d);
  varg := VarArraycreate([0,3], VarVariant);
  varg[1] := AccountNo;
  FillChar(Balances, sizeof(TDetailedBalArray), #0);
  varg[0] := DeptId;
  if (ConsolidList.count = 1) or (not OKtoExclude(DeptId)) then
    begin
    if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
      Varg[2] := word(0)
    else
      varg[2] := Y;
    if UsePlanData then
      found := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[])
    else
      found := DataModuleClient.MonitoringDataLU.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
    Offset := 0;
    FillChar(tempstream.memory^, tempstream.size, #0);
    FillChar(tempstream1.memory^, tempstream1.size, #0);
    tempstream.Seek(0, soFromBeginning);
    if found then
      begin
      if UsePlanData then
        DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream)
      else
        DataModuleClient.MonitoringDataLUD_Bals.SavetoStream(tempstream);
      if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
        daystostart := 0
      else
				daystostart := DayOfTheYear(psdate);
      tempstream.Seek(Sizeof(currency) * daystoStart,  soFromBeginning);
      if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
        daystoend := 365
      else
				daystoend := DaysInYear(psdate) - DayOfTheYear(psdate);
      offset := Sizeof(currency) * daystoend;
      tempstream1.Seek(0, soFromBeginning);
      tempstream1.CopyFrom(tempstream, offset);
      end;
    if (Y <> Y1) and (AccountNo <> WHATIF) and (Accountno <> DETAILEDOPT)then
      begin
      varg[2] := Y1;
      if UsePlanData then
        found1 := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[])
      else
        found1 := DataModuleClient.MonitoringDataLU.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
      tempstream.Seek(0, soFromBeginning);
      if found1 then
        begin
        if UsePlanData then
          DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream)
        else
          DataModuleClient.MonitoringDataLUD_Bals.SavetoStream(tempstream);
				daystostart := DayOfTheYear(pedate) + 1;
        tempstream.Seek(0, soFromBeginning);
        tempstream1.Seek(offset, sofromBeginning);
        tempstream1.CopyFrom(tempstream, sizeof(Currency) * DaysToStart);
        end;
      end;
    if (found) or (found1) then
      begin
      tempstream1.Seek(0, soFromBeginning);
      if (tempstream1.read(Balances, Sizeof(currency) * integer(Trunc(pedate) - Trunc(psdate) + 1)) > 0) then
        Result := True;
      end;
    end;
  tempstream.Free;
  tempstream1.Free;
  if (AccountNo < FTEPROD) or ((BILLED < AccountNo) AND (AccountNo < AR_DAYS)) then
    RoundArray(Balances, psdate, pedate);
end;

function TDataCollector.setBalances(var Balances : array of currency; Dept_id : Integer; Accountno : integer; UsePlanData : Boolean): Boolean;
Var
  tempstream, tempstream1 : TmemoryStream;
  Found : boolean;
  varg : variant;
//  recdate : double;
  d, m, y, y1 : Word;
  daystostart, daystoend, offset : integer;
begin
  Result := False;
  tempstream := TmemoryStream.create;
  tempstream1 := TmemoryStream.Create;
  tempstream.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  tempstream1.setsize(sizeof(Currency) * NUM_DAYSINYEAR);
  FillChar(tempstream.memory^, tempstream.size, #0);
  FillChar(tempstream1.memory^, tempstream1.size, #0);
  // we dump balances into tempstream but save to DB from tempstream1
  tempstream.Write(Balances, Sizeof(currency) * NUM_DAYSINYEAR);

  decodeDate(psdate, y, m, d);
  decodeDate(pedate, y1, m, d);
  varg := VarArraycreate([0,3], VarVariant);
  varg[0] := Dept_id;
  varg[1] := AccountNo;
  if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
    varg[2] := word(0)
  else
    varg[2] := y;
  if UsePlanData then
    found := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[])
  else
    found := DataModuleClient.MonitoringData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);

  if not found then
    begin
    if UsePlanData then
      begin
      DataModuleClient.PlanData.Insert;
      DataModuleClient.PlanDataDept_ID.value := Dept_id;
      DataModuleClient.PlanDataAccount_Number.Value := AccountNo;
      if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
        DataModuleClient.PlanDataD_Year.value := 0
      else
        DataModuleClient.PlanDataD_Year.value := Y;
      DataModuleClient.PlanDataD_TYPE.Value := 1;
      end
    else
      begin
      DataModuleClient.MonitoringData.Insert;
      DataModuleClient.MonitoringDataDept_ID.value := Dept_id;
      DataModuleClient.MonitoringDataAccount_Number.Value := AccountNo;
      DataModuleClient.MonitoringDataD_TYPE.Value := 2;
      if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
        DataModuleClient.MonitoringDataD_Year.value := 0
      else
        DataModuleClient.MonitoringDataD_Year.value := Y;
      end;
    end
  else
    begin
    if UsePlanData then
      DataModuleClient.PlanData.Edit
    else
      DataModuleClient.MonitoringData.Edit;
    tempstream.Seek(0,  soFromBeginning);
    if UsePlanData then
      DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream1)
    else
      DataModuleClient.MonitoringDataD_bals.SavetoStream(tempstream1);
    end;
  if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
    daystostart := 0
  else
		daystostart := DayOfTheYear(psdate);
  tempstream.seek(0, soFromBeginning);
  tempstream1.Seek(Sizeof(currency) * daystoStart,  soFromBeginning);
  if (AccountNo = WHATIF) or (AccountNo = DETAILEDOPT) then
    daystoend := 365
  else
		daystoend := DaysInYear(psdate) - DayOfTheYear(psdate);
	offset := Sizeof(currency) * daystoend;
  tempstream1.CopyFrom(tempstream, offset);
  if UsePlanData then
    Begin
    DataModuleClient.PlanDataD_Bals.LoadFromStream(tempstream1);
    DataModuleClient.PlanDataD_TYPE.Value := 1;
    DataModuleClient.PlanData.Post;
    end
  else
    begin
    DataModuleClient.MonitoringDataD_Bals.LoadFromStream(tempstream1);
    DataModuleClient.MonitoringDataD_TYPE.Value := 2;
    DataModuleClient.MonitoringData.Post;
    end;
  if (y <> y1) and (AccountNo <> WHATIF) and (AccountNo <> DETAILEDOPT) then
    begin
    FillChar(tempstream1.memory^, tempstream1.size, #0);
    varg[2] := y1;
    if UsePlanData then
      found := DataModuleClient.PlanData.Locate('Dept_ID;Account_Number;D_Year',varg,[])
    else
      found := DataModuleClient.MonitoringData.Locate('Dept_ID;Account_Number;D_Year',varg,[]);
    if not found then
      begin
      if UsePlanData then
        Begin
        DataModuleClient.PlanData.Insert;
        DataModuleClient.PlanDataDept_ID.value := Dept_id;
        DataModuleClient.PlanDataAccount_Number.Value := AccountNo;
        DataModuleClient.PlanDataD_Year.value := Y1;
        DataModuleClient.PlanDataD_TYPE.Value := 1;
        end
      else
        begin
        DataModuleClient.MonitoringData.Insert;
        DataModuleClient.MonitoringDataDept_ID.value := Dept_id;
        DataModuleClient.MonitoringDataAccount_Number.Value := AccountNo;
        DataModuleClient.MonitoringDataD_Year.value := Y1;
        DataModuleClient.MonitoringDataD_TYPE.Value := 2;
        end;
      end
    else
      begin
      if UsePlanData then
        DataModuleClient.PlanData.Edit
      else
        DataModuleClient.MonitoringData.Edit;
      tempstream1.Seek(0,  soFromBeginning);
      if UsePlanData then
        DataModuleClient.PlanDataD_Bals.SavetoStream(tempstream1)
      else
        DataModuleClient.MonitoringDataD_Bals.SavetoStream(tempstream1);
    end;
    daystostart := DayOfTheYear(pedate) + 1;
    tempstream1.Seek(0,  soFromBeginning);
    tempstream.Seek(offset, sofromBeginning);
    tempstream1.CopyFrom(tempstream, sizeof(Currency) * DaysToStart);
    if UsePlanData then
      begin
      DataModuleClient.PlanDataD_Bals.LoadFromStream(tempstream1);
      DataModuleClient.PlanData.Post;
      end
    else
      begin
      DataModuleClient.MonitoringDataD_Bals.LoadFromStream(tempstream1);
      DataModuleClient.MonitoringData.Post;
      end;
    end;
    tempstream.Free;
    tempstream1.Free;
end;

procedure TDataCollector.CopyNewPlanData(SrcStart, SrcEnd, DstStart : TDateTime; SrcPlan, ClearData : Boolean; Range : TRangeType);
var
  I, J: Integer;
  Fbalances : TDetailedBalArray;
  TotalBal : Currency;
  StartAcc, EndAcc : integer;
begin
  Startacc := 0;
  EndAcc := 0;
  case Range of    //
    RtSales:        begin
                    StartAcc := SALES;
                    EndAcc := GROSSPROFIT;
                    end;
    RtOtherIncome:  Begin
                    StartAcc := OTHERINCOME;
                    EndAcc := NETPROFIT;
                    end;
    RtExpenses:     Begin
                    StartAcc := FIRSTEXPENSE;
                    EndAcc := NETOPERATINGPROFIT;
                    End;
    RtBalanceSheet: Begin
                    StartAcc := FIRSTBALANCESHEET;
                    EndAcc := LASTBALANCESHEET;
                    End;
  end;    // case

  for I := StartAcc to EndAcc do    // Iterate
    begin
    FillChar(Fbalances, Sizeof(TDetailedBalArray), #0);
    psdate := SrcStart;
    pedate := SrcEnd;
    if Not ClearData then
      begin
      if getBalances(FBalances, I, SrcPlan, ctDepartment) then
        begin
        TotalBal := GetTotalBalance(Fbalances,
        double(psdate),
        double(psdate),
        double(pedate));
        end
      else
        TotalBal := 0;
      end
    else
      begin
      TotalBal := 0;
      for J := 0 to NUM_DAYSINYEAR do    // Iterate
        fBalances[J] := 0;
      end;
    if (ClearData) or (TotalBal <> 0) then
      begin
      psdate := DstStart;
      pedate := DstStart + Srcend - SrcStart;
      SetBalances(fBalances, DataModuleClient.DepartmentsDept_id.Value, I, True);
      end;
    end;    // for
end;

procedure TDataCollector.CalcNetProfit;
var
  daysinyear: integer;
  j: integer;
  TCOGS, TGP, TDIRECT, TNOP, TNP : currency;
  PlanSalesDataRec : TPlanDataRecPtr;
  PlanCogsDataRec : TPlanDataRecPtr;
  PlanGPDataRec : TPlanDataRecPtr;
  PlanExpDataRec : TPlanDataRecPtr;
  PlanNOPDataRec : TPlanDataRecPtr;
  PlanOtherDataRec : TPlanDataRecPtr;
  PlanNPDataRec : TPlanDataRecPtr;
	PlanDirectExpDataRec : TPlanDataRecPtr;
	PlanDepnIntExpDataRec : TPlanDataRecPtr;
begin
	PlanDirectExpDataRec := nil;
	PlanDepnIntExpDataRec := nil;
	PlanSalesDataRec := PlanDataList.Items[GetAccountListIndex(SALES)];
  PlanCogsDataRec := PlanDataList.Items[GetAccountListIndex(COGS)];
  PlanGPDataRec := PlanDataList.Items[GetAccountListIndex(GROSSPROFIT)];
  PlanExpDataRec := PlanDataList.Items[GetAccountListIndex(TOTALEXPENSES)];
  PlanNOPDataRec := PlanDataList.Items[GetAccountListIndex(NETOPERATINGPROFIT)];
  PlanOtherDataRec := PlanDataList.Items[GetAccountListIndex(OTHERINCOME)];
  PlanNPDataRec := PlanDataList.Items[GetAccountListIndex(NETPROFIT)];
  if AccountingFmt then
    begin
    PlanDirectExpDataRec := PlanDataList.Items[GetAccountListIndex(OTHERDIRECT)];
    PlanDepnIntExpDataRec := PlanDataList.Items[GetAccountListIndex(DEPNINTEREST)];
    end;
  daysinyear := trunc(pedate) - trunc(psdate);
  TCOGS := 0;
  TGP := 0;
  TDIRECT := 0;
  TNOP := 0;
  TNP := 0;
  RoundArray(PlanSalesDataRec.PlanDetail, psdate, pedate);
  RoundArray(PlanGPDataRec.PlanDetail, psdate, pedate);
  RoundArray(PlanOtherDataRec.PlanDetail, psdate, pedate);
  for j := 0 to daysinyear do    // Iterate
    begin
    PlanCogsDataRec.PlanDetail[j] := PlanSalesDataRec.PlanDetail[j] - PlanGPDataRec.PlanDetail[j];
    TCOGS := TCOGS + PlanCogsDataRec.PlanDetail[j];
    if AccountingFmt then
      begin
			PlanGPDataRec.PlanDetail[j] := PlanGPDataRec.PlanDetail[j] - PlanDirectExpDataRec.PlanDetail[j];
      TGP := TGP + PlanGPDataRec.PlanDetail[j];
      PlanDirectExpDataRec.PlanDetail[j] := PlanDirectExpDataRec.PlanDetail[j] + PlanCogsDataRec.PlanDetail[j];
      TDIRECT := TDIRECT + PlanDirectExpDataRec.PlanDetail[j];
      end;
    PlanNOPDataRec.PlanDetail[j] := PlanGPDataRec.PlanDetail[j] - PlanExpDataRec.PlanDetail[j];
    TNOP := TNOP + PlanNopDataRec.PlanDetail[j];
    PlanNPDataRec.PlanDetail[j] := PlanNOPDataRec.PlanDetail[j] + PlanOtherDataRec.PlanDetail[j];
    if AccountingFmt then
      begin
      PlanNPDataRec.PlanDetail[j] := PlanNPDataRec.PlanDetail[j] - PlanDepnIntExpDataRec.PlanDetail[j];
      end;
    TNP := TNP + PlanNPDataRec.PlanDetail[j];
    PlanCogsDataRec.PlanTotal := TCOGS;
    if AccountingFmt then
      PlanGPDataRec.PlanTotal := TGP;
    PlanNOPDataRec.PlanTotal := TNOP;
    PlanNPDataRec.PlanTotal := TNP;
    if AccountingFmt then
      PlanDirectExpDataRec.planTotal := TDIRECT;
    end;    // for
  // Do past data
  for j := 0 to 4 do    // Iterate
    begin
    PlanCogsDataRec.PastBalances[j] := PlanSalesDataRec.PastBalances[j] - PlanGPDataRec.PastBalances[j];
    if AccountingFmt then
      begin
      PlanGPDataRec.PastBalances[j] := PlanGPDataRec.PastBalances[j] - PlanDirectExpDataRec.PastBalances[j];
      PlanDirectExpDataRec.PastBalances[j] := PlanDirectExpDataRec.PastBalances[j] + PlanCogsDataRec.PastBalances[j];
      end;
    PlanNOPDataRec.PastBalances[j] := PlanGPDataRec.PastBalances[j] - PlanExpDataRec.PastBalances[j];
    PlanNPDataRec.PastBalances[j] := PlanNOPDataRec.PastBalances[j] + PlanOtherDataRec.PastBalances[j];
    if AccountingFmt then
      PlanNPDataRec.PastBalances[j] := PlanNPDataRec.PastBalances[j] - PlanDepnIntExpDataRec.PastBalances[j];
    end;    // for
end;

function getaccountlistindex(accountno: integer): integer;
var
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
begin
  Result := -1; //PlanDataList
  for cn := 0 to PlanDataList.count - 1 do
    begin
    PlanDataRec := PlanDataList.Items[cn];
    if PlanDataRec.AccountNo = accountno then
      begin
      Result := cn;
      break;
      end;
    end;
end;

function getSummarylistindex(accountno: integer): integer;
var
  cn : integer;
begin
  Result := -1;
  for cn := 0 to SUMMARYPLANLIST - 1
    do begin
    if Summaryplan[cn] = accountno
      then begin
      Result := cn;
      break;
    end;
  end;
end;

function getMonitoringAccountlistindex(accountno: integer): integer;
var
  cn : integer;
begin
  Result := -1;
  for cn := 0 to MONITORINGACCOUNTLIST - 1
    do begin
    if MonitoringAccountArray[cn] = accountno
      then begin
      Result := cn;
      break;
    end;
  end;
end;

function getMonitoringSaleslistindex(accountno: integer): integer;
var
  cn : integer;
begin
  Result := -1;
  for cn := 0 to MONITORSALESLIST - 1
    do begin
    if MonitoringSalesAccounts[cn] = accountno
      then begin
      Result := cn;
      break;
    end;
  end;
end;

function getMonitoringSalesInputindex(accountno: integer): integer;
var
  cn : integer;
begin
  Result := -1;
  for cn := 0 to MONITORSALESLIST - 1
    do begin
    if MonitoringSalesInput[cn] = accountno
      then begin
      Result := cn;
      break;
    end;
  end;
end;

function getKeyaccountlistindex(accountno: integer): integer;
var
  cn : integer;
begin
  Result := -1;
  for cn := 0 to integer(Trunc(sizeof(KeyReportAccounts)/sizeof(integer)) - 1)
    do begin
    if KeyReportAccounts[cn] = accountno
      then begin
      Result := cn;
      break;
    end;
  end;
end;

function getExpAccountListindex(accountno: integer): integer;
var
  cn : integer;
  PlanDataRec : TPlanDataRecPtr;
begin
  Result := -1;
  for cn := 0 to PlanExpDataList.count - 1 do
    begin
    PlanDataRec := PlanExpDataList.Items[cn];
    if PlanDataRec.AccountNo = accountno then
      begin
      Result := cn;
      break;
      end;
    end;
end;

function getListpastbalance(Listindex: integer): currency;
begin
  if DataModuleClient.DateRangersD_Index.value > 0 then
    Result := TPlanDataRecPtr(PlanDataList.Items[Listindex]).PastBalances[DataModuleClient.DateRangersD_Index.value - 1]
  else
    Result := 0;
end;

procedure setListPastBalance(Listindex: integer; balance : currency);
begin
  if DataModuleClient.DateRangersD_Index.Value > 0 then
    TPlanDataRecPtr(PlanDataList.Items[Listindex]).PastBalances[DataModuleClient.DateRangersD_Index.Value - 1] := balance;
end;

function getListPlanbalance(Listindex: integer): currency;
begin
  Result := TPlanDataRecPtr(PlanDataList.Items[Listindex]).PlanTotal;
end;

procedure setListPlanBalance(Listindex: integer; balance : currency; doUpdateArray : Boolean);
var
  PlanDataRec : TPlanDataRecPtr;
begin
  PlanDataRec := PlanDataList.items[listindex];
  PlanDataRec.PlanTotal := balance;
  if doUpdateArray then
    begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    if (PlanDataRec.Accountno <> WHATIF) and (PlanDataRec.Accountno <> DETAILEDOPT) then
      begin
      if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal * (Trunc(DataCollect.pedate - DataCollect.psdate) + 1);
      if (GGlobals.unitRounding = 0)
        and ((PlanDataRec.Accountno = BILLED) or (PlanDataRec.Accountno = BILLED))  then
        DataCollect.updateArray(  PlanDataRec.PlanDetail,
                  0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
                  PlanDataRec.PlanTotal,
                  1)
      else
        DataCollect.updateArray(  PlanDataRec.PlanDetail,
                  0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
                  PlanDataRec.PlanTotal,
                  6);
      if (PlanDataRec.Accountno = FTEOTHER) or (PlanDataRec.Accountno = FTEPROD) then
        PlanDataRec.PlanTotal := PlanDataRec.PlanTotal / (Trunc(DataCollect.pedate - DataCollect.psdate) + 1);
      end;
    end;
end;

procedure sortExpenseList(UseLPlanData : Boolean);

  function sortExpTitle(item1, Item2: pointer): integer;
    begin
    if TPlanDataRecPtr(item1).AccountNo = TOTALOTHEREXPENSES then
      result := 1
    else
      begin
      if (length(TPlanDataRecPtr(item1).AccountTitle) > 0) and (length(TPlanDataRecPtr(item2).AccountTitle) > 0) then
        begin
        if (TPlanDataRecPtr(item1).AccountTitle = TPlanDataRecPtr(item2).AccountTitle) then
          begin
          if TPlanDataRecPtr(item1).AccountNo < TPlanDataRecPtr(item2).AccountNo then
            Result := -1
          else if TPlanDataRecPtr(item1).AccountNo = TPlanDataRecPtr(item2).AccountNo then
            Result := 0
          else
            Result := 1;
          end
        else
          if (TPlanDataRecPtr(item1).AccountTitle < TPlanDataRecPtr(item2).AccountTitle) then
            result := -1
          else
          result := 1;
        end
      else
        begin
        if (TPlanDataRecPtr(item1).AccountTitle = TPlanDataRecPtr(item2).AccountTitle) then
          begin
          if TPlanDataRecPtr(item1).AccountNo < TPlanDataRecPtr(item2).AccountNo then
            Result := -1
          else
            if TPlanDataRecPtr(item1).AccountNo = TPlanDataRecPtr(item2).AccountNo then
              Result := 0
            else
              Result := 1;
          end
        else
          if TPlanDataRecPtr(item1).AccountTitle < TPlanDataRecPtr(item2).AccountTitle then
            result := 1
          else
            result := -1;
        end;
      end;
    end;

  function sortExpGroupTitle(item1, Item2: pointer): integer;
    begin
    if (TPlanDataRecPtr(item1).Account_Group < TPlanDataRecPtr(item2).Account_Group) then
      result := -1
    else if (TPlanDataRecPtr(item1).Account_Group > TPlanDataRecPtr(item2).Account_Group) then
      result := 1
    else begin
      if (TPlanDataRecPtr(item1).AccountNo = TOTALOTHEREXPENSES) then
        begin
        if TPlanDataRecPtr(item1).AccountNo = TPlanDataRecPtr(item2).AccountNo then
          Result := 0
        else
          result := 1;
        end
      else
        begin
        if (length(TPlanDataRecPtr(item1).AccountTitle) > 0) and (length(TPlanDataRecPtr(item2).AccountTitle) > 0) then
          begin
          if (TPlanDataRecPtr(item1).AccountTitle = TPlanDataRecPtr(item2).AccountTitle) then
            begin
            if TPlanDataRecPtr(item1).AccountNo < TPlanDataRecPtr(item2).AccountNo then
              Result := -1
            else if TPlanDataRecPtr(item1).AccountNo = TPlanDataRecPtr(item2).AccountNo then
              Result := 0
            else
              Result := 1;
            end
          else
            if (TPlanDataRecPtr(item1).AccountTitle < TPlanDataRecPtr(item2).AccountTitle) then
              result := -1
            else
            result := 1;
          end
        else
          begin
          if (TPlanDataRecPtr(item1).AccountTitle = TPlanDataRecPtr(item2).AccountTitle) then
            begin
            if TPlanDataRecPtr(item1).AccountNo < TPlanDataRecPtr(item2).AccountNo then
              Result := -1
            else
              if TPlanDataRecPtr(item1).AccountNo = TPlanDataRecPtr(item2).AccountNo then
                Result := 0
              else
                Result := 1;
            end
          else
            if TPlanDataRecPtr(item1).AccountTitle < TPlanDataRecPtr(item2).AccountTitle then
              result := 1
            else
              result := -1;
          end;
        end;
      end;
    end;
begin

  if UseLPlanData then
    begin
    if GGlobals.Produce_AccountFmt then
      PlanExpDataList.sort(@sortExpGroupTitle)
    else
      PlanExpDataList.sort(@sortExpTitle)
    end
  else
    begin
    if GGlobals.Produce_AccountFmt then
      MonitoringExpDataList.sort(@sortExpGroupTitle)
    else
      MonitoringExpDataList.sort(@sortExpTitle);
    end;
end;

function BuildSummary(AccountNo: Integer; Startdate, Enddate : TDateTime; Detail: TDetailedBalArray; var Summary: TSummaryBalArray): Currency;
var
  daysinyear: Integer;
  k, m : Integer;
  j: Integer;
//  Startdate, Enddate : TDateTime;
begin
  k := 0;
  m := -1;     // because the start period is the first date
  Result := 0;
{
  if UsePlanDates then
    begin
    StartDate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    Enddate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    end
  else
    begin
    StartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
    Enddate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
    end;
}
  // initialise the Summary Array
  fillchar(Summary, sizeof(TSummaryBalArray), #0);
  // Calculate the days in period
  daysinyear := trunc(EndDate) - trunc(StartDate);
  for j := 0 to DaysInYear do    // Iterate
    begin
    Summary[k] := Summary[k] + Detail[j];
    Result := Result + Detail[j];
    if (SummaryPeriodIndexArray[k] = j) then
      begin
      if (AccountNo = FTEPROD) or (AccountNo = FTEOTHER) then
        Summary[K] := Summary[k] / (J - m);
      M := J;
      inc(k);
      end;    // while
    end;    // for
end;
{
procedure buildMonitorsummary(ListIndex: integer; UseMonExpenseList: Boolean);
var
//  SumCount: Integer;
  daysinyear: Integer;
//  m: integer;
  k: Integer;
  j: Integer;
  PlanDataRec : TPlanDataRecPtr;
  Startdate, Enddate : TDateTime;
begin
  k := 0;
  StartDate := DataModuleClient.DepartmentsCurrentMonitoringStart.value;
  Enddate := DataModuleClient.DepartmentsCurrentMonitoringEnd.value;
  if UseMonExpenseList then
    PlanDataRec := MonitoringExpDataList.items[ListIndex]
  else
    PlanDataRec := MonitoringDataList.items[ListIndex];
  // initialise the Summary Array
  fillchar(PlanDataRec^.PlanSummary, sizeof(TSummaryBalArray), #0);
  // Calculate the days in period
  daysinyear := trunc(EndDate) - trunc(StartDate);
  PlanDataRec.PlanTotal := 0;
  for j := 0 to DaysInYear do    // Iterate
    begin
    PlanDataRec.PlanSummary[k] := PlanDataRec.PlanSummary[k] + PlanDataRec.PlanDetail[j];
    PlanDataRec.PlanTotal := PlanDataRec.PlanTotal + PlanDataRec.PlanDetail[j];
    if (SummaryPeriodIndexArray[k] = j)
      then begin
      inc(k);
    end;    // while
  end;    // for
end;
}

function createSummaryIndex(SummaryType: Integer; StartDate, Enddate: TDateTime): Integer;
var
  m: integer;
  TempDate: TDateTime;
  Year, Year1, Month, Month1, Day, Day1: word;
  SumCount: Integer;
  k: Integer;
  daysinyear: Integer;
  j: Integer;
//  Startdate, Enddate : TDateTime;
begin
//  StartDate := DataModuleClient.psdate;
//  DepartmentsCurrentPlanStart.value;
//  Enddate := DataModuleClient.pedate;
//  DepartmentsCurrentPlanEnd.value;
  for j := 0 to NUM_WEEKS + 1 do    // Iterate
    SummaryPeriodIndexArray[j] := 0;
  daysinyear := trunc(EndDate) - trunc(StartDate);
  // Calculate the days in the first period
  k := DataModuleClient.DepartmentsLastDayOfWeek.value;
  SumCount := 0;
  m := 0;
  case SummaryType of    //
    1:  begin   // Weekly based on end of week nomination
        m := DayofWeek(StartDate) - 1; // Zero based
        for j := 0 to DaysInYear - 1 do    // Iterate
          begin
          if m = k then
            begin
            SummaryPeriodIndexArray[SumCount] := j;
            inc(SumCount);
            end;
          inc(m);
          if m = 7 then m := 0;
          end; // for
        if SummaryPeriodIndexArray[SumCount - 1] < DaysInYear then
          begin
          SummaryPeriodIndexArray[SumCount] := DaysInYear;
          inc(Sumcount);
          end;
        Result := Sumcount;
        end;
    2:  begin  // 4 Weekly based on Starting date
        for j := 0 to DaysInYear - 1 do    // Iterate
          begin
          inc(m);
          if m = 28 then
            begin
            SummaryPeriodIndexArray[SumCount] := j;
            inc(SumCount);
            m := 0;
            end;
          end;    // for
        if SummaryPeriodIndexArray[SumCount - 1] < DaysInYear then
          begin
          SummaryPeriodIndexArray[SumCount] := DaysInYear;
          inc(Sumcount);
          end;
        Result := Sumcount;
        end;
    3:  begin  // 4 / 5 Weekly based on Starting Date
        DecodeDate(StartDate, Year, Month, Day);
        DecodeDate(Enddate, Year1, Month1, Day1);
        Day := MonthDays[IsLeapYear(Year), Month];
          TempDate := EncodeDate(Year, Month, Day);
        while (Year < Year1) or ((year = year1) and (Month <= Month1)) do
          begin
          while (DayofWeek(TempDate) - 1) <> k do  // Find the last "end of Week" for this month
            TempDate := TempDate - 1;
          if (TempDate < Startdate) and (Trunc(Enddate - startdate) > 35) then
            begin
            inc(Month);
            if Month = 13 then
              begin
              Month := 1;
              inc(Year);
              end;
            Day := MonthDays[IsLeapYear(Year), Month];
            TempDate := EncodeDate(Year, Month, Day);
            while (DayofWeek(TempDate) - 1) <> k do  // Find the last "end of Week" for this next month
              TempDate := TempDate - 1;
            end;
          if TempDate > EndDate then
            TempDate := EndDate;
          // Added 1 to correct the offset calculation
          SummaryPeriodIndexArray[SumCount] := trunc(TempDate) - trunc(StartDate);
          inc(SumCount);
          inc(Month);
          if Month = 13 then
            begin
            Month := 1;
            inc(Year);
            end;
          Day := MonthDays[IsLeapYear(Year), Month];
          TempDate := EncodeDate(Year, Month, Day);
          end;    // while
        if SummaryPeriodIndexArray[SumCount - 1] < DaysInYear then
          begin
          SummaryPeriodIndexArray[SumCount] := DaysInYear;
          inc(Sumcount);
          end;
        Result := Sumcount;
        end;
    4:  begin  // ^ Monthly based on
        DecodeDate(StartDate, Year, Month, Day);
        DecodeDate(EndDate, Year1, Month1, Day1);
        Day := MonthDays[IsLeapYear(Year), Month];
        TempDate := EncodeDate(Year, Month, Day);
        while (Year < Year1) or ((year = year1) and (Month <= Month1)) do
          begin
          if TempDate > EndDate then
            TempDate := EndDate;
          SummaryPeriodIndexArray[SumCount] := trunc(TempDate) - trunc(StartDate);
          inc(SumCount);
          inc(Month);
          if Month = 13 then
            begin
            Month := 1;
            inc(Year);
            end;
          Day := MonthDays[IsLeapYear(Year), Month];
          TempDate := EncodeDate(Year, Month, Day);
          end;    // while
        Result := Sumcount;
        end;
    5:  begin  // ^ Quarterly based on
        DecodeDate(StartDate, Year, Month, Day);
        DecodeDate(EndDate, Year1, Month1, Day1);
        Month := Month + 2; // Takes us to the end of the 3rd Month
        if Month > 12 then
          begin
          Month := Month - 12;
          inc(Year);
          end;
        Day := MonthDays[IsLeapYear(Year), Month];
        TempDate := EncodeDate(Year, Month, Day);
        while (Year < Year1) or ((year = year1) and (Month <= Month1)) do
          begin
          if TempDate > EndDate then
            TempDate := EndDate;
          SummaryPeriodIndexArray[SumCount] := trunc(TempDate) - trunc(StartDate);
          inc(SumCount);
          inc(Month, 3);
          if Month > 12 then
            begin
            Month := Month - 12;
            inc(Year);
            end;
          Day := MonthDays[IsLeapYear(Year), Month];
          TempDate := EncodeDate(Year, Month, Day);
          end;    // while
        Result := Sumcount;
        end;
    6:  begin  // 6 Monthly based on
        DecodeDate(StartDate, Year, Month, Day);
        DecodeDate(EndDate, Year1, Month1, Day1);
        Month := Month + 5; // Takes us to the end of the 6th Month
        if Month > 12 then
          begin
          Month := Month - 12;
          inc(Year);
          end;
        Day := MonthDays[IsLeapYear(Year), Month];
        TempDate := EncodeDate(Year, Month, Day);
        while (Year < Year1) or ((year = year1) and (Month <= Month1)) do
          begin
          if TempDate > EndDate then
            TempDate := EndDate;
          SummaryPeriodIndexArray[SumCount] := trunc(TempDate) - trunc(StartDate);
          inc(SumCount);
          inc(Month, 6);
          if Month > 12 then
            begin
            Month := Month - 12;
            inc(Year);
            end;
          Day := MonthDays[IsLeapYear(Year), Month];
          TempDate := EncodeDate(Year, Month, Day);
          end;    // while
        Result := Sumcount;
        end;
    7:  begin  // Yearly - but who would use this??
        SummaryPeriodIndexArray[SumCount] := trunc(EndDate) - trunc(StartDate);
        inc(SumCount);
        Result := Sumcount;
         end;
  else
    Result := 0;
  end;    // case
end;

procedure UpdateBalances(var Barray: array of currency; new: currency);
begin
//  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
//  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.updateArray(Barray,
                  0, DaysBetween(DataCollect.pedate, DataCollect.psdate),
                   new, 6);
end;

procedure AdjustBalances(var Barray, totalexp: array of currency; new: currency);
var
  j : integer;
  temparray : TDetailedBalArray;
begin
  // save the old balances for the update
  move(barray, temparray, sizeof(TDetailedBalArray));
  UpdateBalances(Barray, new);
  for j := 0 to NUM_DAYSINYEAR do    // Iterate
    begin
    totalexp[j] := totalexp[j] - temparray[j] + barray[j];
    end;    // for
end;

procedure UpdateFromSummaryBalances(var Barray, totalExp: array of currency; new: currency; fromperiod, toperiod, AccountNo: integer);
var
  j : integer;
  temparray : TDetailedBalArray;
begin
//  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
//  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  move(barray, temparray, sizeof(TDetailedBalArray));
  if ((GGlobals.UnitRounding = 0)
    and ((AccountNo = BILLED) or (AccountNo = POTENTIAL))) or ((AccountNo >= FIRSTEXPENSE) and (AccountNo <= TOTALEXPENSES)) then
    DataCollect.updateArray(Barray,
                  DaysBetween(IncDay(DataCollect.msdate, fromperiod), DataCollect.msdate),
                  DaysBetween(IncDay(DataCollect.msdate, toperiod), DataCollect.msdate),
                  new, 1)
  else
    DataCollect.updateArray(Barray,
                  DaysBetween(IncDay(DataCollect.msdate, fromperiod), DataCollect.msdate),
                  DaysBetween(IncDay(DataCollect.msdate, toperiod), DataCollect.msdate),
                  new, 6);
  for j := fromperiod to toperiod do    // Iterate
    begin
    totalexp[j] := totalexp[j] - temparray[j] + barray[j];
    end;    // for
end;

// Get What If balance from the Detailed Array in the WHATIF account Record
function getWIBalance(WIset, WIAccount : integer): currency;
var
  PlanDataRec : TPlanDataRecPtr;
begin
  PlanDataRec := PlanDataList.items[GetAccountListIndex(WHATIF)];
  Result := PlanDataRec.PlanDetail[WIset * 20 + WIAccount];
end;

// Set What If balance to the Detailed Array in the WHATIF account Record
procedure setWIBalance(WIset, WIAccount : integer; balance : Currency);
var
  PlanDataRec : TPlanDataRecPtr;
begin
  PlanDataRec := PlanDataList.items[GetAccountListIndex(WHATIF)];
  PlanDataRec.PlanDetail[WIset * 20 + WIAccount] := Balance;
end;

function FindPrinterIndex(NewPrinter : string): integer;
var
  I : integer;
  S1 : Array[0..120] of char;
  S2 : Array[0..120] of char;
  Maxlen : Cardinal;
begin
  Result := printer.Printers.indexof(NewPrinter);
  if Result < 0 then
    begin
    StrPcopy(S1, NewPrinter);
    Maxlen := Strlen(S1);
    for I := 0 to Printer.Printers.count - 1 do    // Iterate
      begin
      StrPCopy(S2, Printer.Printers.strings[I]);
      if (Strlen(S2) >= Maxlen) and (AnsiStrLIComp(S1, S2, MaxLen) = 0) then
        begin
        Result := I;
        Break;
        end;
      end;    // for
    end;
end;

procedure TDataCollector.GetQuotes(StartDate, EndDate: TDateTime);
var
  I : TQuoteFields;
  J : TQuoteRepRows;
  QuoteDataRec : TQuoteRecPtr;
  Invoicesfound : Boolean;
  ReportDept : Boolean;
  LastDeptid : integer;
begin
	ReportDept := false;
  if Assigned(QuoteList) then
    begin
    if QuoteList.Count > 0 then
      ClearQuoteList;
    end;
  if not assigned(QuoteList) then
    QuoteList := Tlist.create;
  // we free up the constraint to look at all quotes
  DataModuleClient.QuotesLU.First;
  LastDeptid := -1;
  while DataModuleClient.QuotesLU.eof = False do
    begin
    Invoicesfound := False;
    if DataModuleClient.QuotesLuDept_Id.Value <> LastDeptid then
      begin
      ReportDept := False;
      LastDeptid := DataModuleClient.QuotesLuDept_Id.Value;
      // see if the department is in the consolidation list
      if FindConsolidDeptindex(DataModuleClient.QuotesLuDept_Id.value) > -1 then
        ReportDept := True;
      end;
		if (ReportDept) then
      begin
      new(QuoteDataRec);
//      K := sizeof(TQuoteRec);
      Fillchar(QuoteDataRec^, sizeof(TQuoteRec), #0);
//      K := QuotesLuDept_Id.Value;
      QuoteDataRec.Depart_ID := DataModuleClient.QuotesLuDept_Id.Value;
      QuoteDataRec.Quote_Date := DataModuleClient.QuotesLUQ_Date.Value;
			QuoteDataRec.Quote_Number := DataModuleClient.QuotesLUQuote_Number.AsString;
			QuoteDataRec.Quote_Customer := DataModuleClient.QuotesLUCustomerName.AsString;
      QuoteDataRec.Values[qfSales, QrrQuote] := DataModuleClient.QuotesLUQ_Value.Value;
      QuoteDataRec.Values[qfMaterials, QrrQuote] := DataModuleClient.QuotesLUQ_Materials.Value;
      QuoteDataRec.Values[qfSubCon, QrrQuote] := DataModuleClient.QuotesLUQ_Subcontractors.Value;
      QuoteDataRec.Values[qfHours, QrrQuote] := DataModuleClient.QuotesLUTargetUnits.Value;
      QuoteDataRec.Values[qfTimeSheetHours, QrrQuote] := DataModuleClient.QuotesLUTargetUnits.Value;
      DataModuleClient.InvQuoteLU.First;
      while DataModuleClient.InvQuoteLu.eof = False do
        begin
        if (DataModuleClient.InvQuoteLUINV_DATE.Value >= StartDate)
          and (DataModuleClient.InvQuoteLUINV_DATE.Value <= Enddate) and (ReportDept) then
          begin
          Invoicesfound := True;
          QuoteDataRec.Values[QfSales, qrrActual] := QuoteDataRec.Values[QfSales, qrrActual] + DataModuleClient.InvQuoteLUNetSales.Value;
          QuoteDataRec.Values[QfMaterials, qrrActual] := QuoteDataRec.Values[QfMaterials, qrrActual] + DataModuleClient.InvQuoteLUMaterialsatCost.Value;
          QuoteDataRec.Values[QfSubCon, qrrActual] := QuoteDataRec.Values[QfSubCon, qrrActual] + DataModuleClient.InvQuoteLUSubcontractors.Value;
          QuoteDataRec.Values[QfHours, qrrActual] := QuoteDataRec.Values[QfHours, qrrActual] + DataModuleClient.InvQuoteLUUnitsRequired.Value;
          QuoteDataRec.Values[QfTimeSheetHours, qrrActual] := QuoteDataRec.Values[QfTimeSheetHours, qrrActual] + DataModuleClient.InvQuoteLURecordedUnits.Value;
          if QuoteDataRec.LastInvDate < DataModuleClient.InvQuoteLUInv_Date.value then
            begin
            QuoteDataRec.LastInvDate := DataModuleClient.InvQuoteLUInv_Date.value;
            if DataModuleClient.InvQuoteLUOrderComplete.value = 0 then
              begin
              if DataModuleClient.InvQuoteLUUnitstoRun.Value <> 0 then
                QuoteDataRec.HourstoRun := DataModuleClient.InvQuoteLUUnitsToRun.Value
              else
                begin
                QuoteDataRec.HourstoRunS := 'Not Available';
                QuoteDataRec.HourstoRun := -1;
                end;
              end
            else
              QuoteDataRec.HourstoRun := 0;
            end;
          end;
        DataModuleClient.InvQuoteLU.Next;
        end;
      // Calculate Values on Rows
      for J := QrrQuote to QrrActual do    // Iterate
        begin
        QuoteDataRec.Values[QfGP, J] := QuoteDataRec.Values[QFSales, J]
          - QuoteDataRec.Values[QfMaterials, J] - QuoteDataRec.values[QfSubcon, J];
        if QUoteDataRec.Values[QFSales, J] <> 0 then
          QuoteDataRec.Values[QfGPPC, J] := QuoteDataRec.Values[QFGP, J] * 100 / QuoteDataRec.Values[QFSales, J];
        if GGlobals.TimeSheetRate and (QuoteDataRec.Values[QfTimeSheetHours, J] <> 0) then
          QuoteDataRec.Values[QFRate, J] := QuoteDataRec.Values[QFGP, J] / QUoteDataRec.Values[QFTimeSheetHours, J];
        if (Not GGlobals.TimeSheetRate) and (QUoteDataRec.Values[QFHours, J] <> 0) then
          QuoteDataRec.Values[QFRate, J] := QuoteDataRec.Values[QFGP, J] / QUoteDataRec.Values[QFHours, J];
        end;    // for
      // Calculate All Valiances
      for I := QfSales to QFEnd do    // Iterate
        QuoteDataRec.Values[I, qrrVariance] := QuoteDataRec.values[I, QrrQuote] - QuoteDataRec.Values[I, QrrActual];
      // Reverse the values for Sales, GP and Rate
      QuoteDataRec.Values[qfSales, QrrVariance] := QuoteDataRec.Values[qfSales, QrrVariance] * -1;
      QuoteDataRec.Values[qfGP, QrrVariance] := QuoteDataRec.Values[qfGP, QrrVariance] * -1;
      QuoteDataRec.Values[qfGPPC, QrrVariance] := QuoteDataRec.Values[qfGPPC, QrrVariance] * -1;
      QuoteDataRec.Values[qfRate, QrrVariance] := QuoteDataRec.Values[qfRate, QrrVariance] * -1;
      if Invoicesfound then
        QuoteList.Add(QuoteDataRec);
      end;
    DataModuleClient.QuotesLU.Next;
    end;    // while
end;

{ ---------------------------------------------------------------------------- }
{ -- clearPlanDataList - Frees the memory allocated to items in the list   }
{                        and clears the list ready for reloading.          }
{ ---------------------------------------------------------------------------- }
procedure TDataCollector.clearQuoteList;
var
  index: integer;
  QuoteDataRec: TQuoteRecPtr;
begin
  if Assigned(QuoteList) then
    begin
    for index := 0 to QuoteList.Count - 1 do
      begin
      QuoteDataRec := TQuoteRecPtr(QuoteList.Items[index]);
      dispose(QuoteDataRec);
      end;
    QuoteList.clear;
    QuoteList.free;
    QuoteList := nil;
    end;
end;

function TDataCollector.OkToExclude(deptid : integer): Boolean;
begin
  DataModuleClient.DeptRef2.indexName := 'BRANCH_DEPT_IDX';
  DataModuleClient.DeptRef2.First;
  Result := False;
  while DataModuleClient.DeptRef2.eof = False do
    begin
    if (DataModuleClient.DeptRef2Dept_Id.value = deptid) and (DataModuleClient.DeptRef2Exclude_from_Reporting.value > 0) then
      Result := True;
    DataModuleClient.DeptRef2.next;
    end;    // while
end;

procedure TDataCollector.sortQuotes(SortType: TQuoteSortType);

{
  TQuoteRecPtr = ^TQuoteRec;TQuoteRec = record
    Depart_ID : Integer;
    Quote_LDate : LongInt;
    Values : TQuoteValues; //array[qfSales..qfEnd, QrrQuote..QrrVariance] of Currency;
    HourstoRun : currency;
    HourstoRunS : string[20];
    LastInvDate : TDateTime;
  end;
}

//    Quote_Number: string[20];

  function QuoteNumber(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Quote_Number < TQuoteRecPtr(item2).Quote_Number then
      result := -1
    else
      if TQuoteRecPtr(item1).Quote_Number > TQuoteRecPtr(item2).Quote_Number then
        Result := 1
      else
        result := 0;
    end;
//    Quote_Customer and Date
  function CustomerName(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Quote_Customer < TQuoteRecPtr(item2).Quote_Customer then
      result := -1
    else
      if TQuoteRecPtr(item1).Quote_Customer > TQuoteRecPtr(item2).Quote_Customer then
        Result := 1
      else
        begin
        if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
          Result := -1
        else
          if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
            Result := 1
          else
            result := 0;
        end;
    end;
//    Quote_Date and Number
  function QuoteDate(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
      Result := -1
    else
      if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
        Result := 1
      else
        begin
        if TQuoteRecPtr(item1).Quote_Number < TQuoteRecPtr(item2).Quote_Number then
          result := -1
        else
          if TQuoteRecPtr(item1).Quote_Number > TQuoteRecPtr(item2).Quote_Number then
            Result := 1
          else
            result := 0;
        end;
    end;
// QuoteSales
  function QuoteSales(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Values[qfSales, QrrQuote] < TQuoteRecPtr(item2).Values[qfSales, QrrQuote] then
      result := -1
    else
      if TQuoteRecPtr(item1).Values[qfSales, QrrQuote] > TQuoteRecPtr(item2).Values[qfSales, QrrQuote] then
        Result := 1
      else
        begin
        if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
          Result := -1
        else
          if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
            Result := 1
          else
            result := 0;
        end;
    end;
// QuoteGPPC
  function QuoteGPPC(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Values[qfGPPC, QrrQuote] < TQuoteRecPtr(item2).Values[qfGPPC, QrrQuote] then
      result := -1
    else
      if TQuoteRecPtr(item1).Values[qfGPPC, QrrQuote] > TQuoteRecPtr(item2).Values[qfGPPC, QrrQuote] then
        Result := 1
      else
        begin
        if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
          Result := -1
        else
          if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
            Result := 1
          else
            result := 0;
        end;
    end;
// Quote Rate
  function QuoteRate(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Values[qfRate, QrrQuote] < TQuoteRecPtr(item2).Values[qfRate, QrrQuote] then
      result := -1
    else
      if TQuoteRecPtr(item1).Values[qfRate, QrrQuote] > TQuoteRecPtr(item2).Values[qfRate, QrrQuote] then
        Result := 1
      else
        begin
        if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
          Result := -1
        else
          if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
            Result := 1
          else
            result := 0;
        end;
    end;
// Quote Hours
  function QuoteHours(item1, Item2: pointer): integer;
    begin
    if TQuoteRecPtr(item1).Values[qfHours, QrrQuote] < TQuoteRecPtr(item2).Values[qfHours, QrrQuote] then
      result := -1
    else
      if TQuoteRecPtr(item1).Values[qfHours, QrrQuote] > TQuoteRecPtr(item2).Values[qfHours, QrrQuote] then
        Result := 1
      else
        begin
        if TQuoteRecPtr(Item1).Quote_date < TQuoteRecPtr(Item2).Quote_Date then
          Result := -1
        else
          if TQuoteRecPtr(Item1).Quote_date > TQuoteRecPtr(Item2).Quote_Date then
            Result := 1
          else
            result := 0;
        end;
    end;

begin
  case SortType of    //
    qstQuoteNumber: QuoteList.sort(@QuoteNumber);
    qstCustomerName: QuoteList.sort(@CustomerName);
    qstDate: QuoteList.sort(@QuoteDate);
    qstSales: QuoteList.sort(@QuoteSales);
    qstGPPC: QuoteList.Sort(@QuoteGPPC);
    qstAverageRate: QuoteList.sort(@QuoteRate);
    qstHours: QuoteList.sort(@QuoteHours);
  end;    // case
end;

procedure TDataCollector.GetMonitoringAccountArray(NotGraph: Boolean);
var
  I,J,cnt : integer;
begin
  // Start loading a new array
  fillchar(MonitoringAccountarray, MONITORINGACCOUNTLIST, #0);
  Cnt := 0;
  if (GGlobals.Produce_AccountFmt) then
    begin
    MonitoringAccountArray[cnt] := SALES;
    inc(cnt);
    MonitoringAccountArray[cnt] := COGS;
    inc(cnt);
    // get directexpenses from
    if not Datamoduleclient.AccountsGrouping.active then
      Datamoduleclient.AccountsGrouping.active := True;
    Datamoduleclient.AccountsGrouping.First;
    while Datamoduleclient.AccountsGrouping.Eof = false do
      begin
      if Datamoduleclient.AccountsGroupingAccount_group.Value = AGDIRECTEXP then
        begin
        MonitoringAccountArray[cnt] := DataModuleClient.AccountsGroupingACCOUNT_NUMBER.value;
        inc(cnt);
        end;
      Datamoduleclient.AccountsGrouping.Next;
      end;    // while
    MonitoringAccountArray[cnt] := OTHERDIRECT;
    inc(cnt);
    MonitoringAccountArray[cnt] := GROSSPROFIT;
    inc(cnt);

    Datamoduleclient.AccountsGrouping.First;
    while Datamoduleclient.AccountsGrouping.Eof = false do
      begin
      if Datamoduleclient.AccountsGroupingAccount_group.Value = AGEXPENSES then
        begin
        MonitoringAccountArray[cnt] := DataModuleClient.AccountsGroupingACCOUNT_NUMBER.value;
        inc(cnt);
        end;
      Datamoduleclient.AccountsGrouping.Next;
      end;    // while
    MonitoringAccountArray[cnt] := TOTALEXPENSES;
    inc(cnt);
    MonitoringAccountArray[cnt] := NETOPERATINGPROFIT;
    inc(cnt);
    MonitoringAccountArray[cnt] := OTHERINCOME;
    inc(cnt);

    Datamoduleclient.AccountsGrouping.First;
    while Datamoduleclient.AccountsGrouping.Eof = false do
      begin
      if Datamoduleclient.AccountsGroupingAccount_group.Value = AGDEPNINT then
        begin
        MonitoringAccountArray[cnt] := DataModuleClient.AccountsGroupingACCOUNT_NUMBER.value;
        inc(cnt);
        end;
      Datamoduleclient.AccountsGrouping.Next;
      end;    // while
    MonitoringAccountArray[cnt] := DEPNINTEREST;
    inc(cnt);
    MonitoringAccountArray[cnt] := NETPROFIT;
    inc(cnt);
    end
  else
    begin
    if NotGraph then
      begin
      for I := getsummarylistindex(SALES) to getsummarylistindex(GROSSPROFIT) do
        begin   // Iterate
        MonitoringAccountArray[cnt] := SummaryPlan[I];
        Inc(cnt);
        end;
      end
    else
      begin
      for I := getsummarylistindex(SALES) to getsummarylistindex(NETPROFIT) do
        begin   // Iterate
        MonitoringAccountArray[cnt] := SummaryPlan[I];
        inc(cnt);
        end;
      end;

    DATAMODULECLIENT.ExpAccounts.Active := True;
    DATAMODULECLIENT.ExpAccounts.First;
    while DATAMODULECLIENT.ExpAccounts.eof = false do
      begin
      if (length(DataModuleClient.ExpAccountsACCOUNT_TITLE.Value) > 0) then
        begin
        MonitoringAccountArray[cnt] := DataModuleClient.ExpAccountsACCOUNT_NUMBER.value;
        inc(cnt);
        end;
      DATAMODULECLIENT.ExpAccounts.Next;
      end;    // while
    DATAMODULECLIENT.ExpAccounts.Active := False;
    // add TOTALOTHER EXPENSES and TOTALEXPENSES
 // exclude Total Other expenses because we are now including it in the SQL fetch of expenses
 //   MonitoringAccountArray[cnt] := TOTALOTHEREXPENSES;
 //   inc(cnt);
    MonitoringAccountArray[cnt] := TOTALEXPENSES;
    inc(cnt);

    if NotGraph then
      begin
      for J := getsummarylistindex(NETOPERATINGPROFIT) to getsummarylistindex(NETPROFIT) do    // Iterate
        begin
        MonitoringAccountArray[cnt] := SummaryPlan[J];
        inc(cnt);
        end;    // for
      end;
    end;
    // Check other expenses is just before Total Expenses in the array.
  j :=  getMonitoringAccountlistindex(TOTALOTHEREXPENSES);
  if J > -1 then
    while (MonitoringAccountArray[j] = TOTALOTHEREXPENSES) and (MonitoringAccountArray[j + 1] <> TOTALEXPENSES) and ((J + 1) < cnt) do
      begin
      MonitoringAccountArray[j] := MonitoringAccountArray[j + 1];
      MonitoringAccountArray[j + 1] := TOTALOTHEREXPENSES;
      inc(j);
      end;    // while
end;

procedure TDataCollector.GetDetailedOptions(CurrentDept : Integer);
begin
  GetConsolidatedList(CurrentDept, ctNormal);
  GetBalances(DetailedOptions, DETAILEDOPT, True, ctDepartment);
end;

procedure TDataCollector.SetDetailedOptions(CurrentDept : Integer);
begin
  GetConsolidatedList(CurrentDept, ctNormal);
  SetBalances(DetailedOptions, DataModuleClient.DepartmentsDept_id.Value, DETAILEDOPT, True);
end;

function TDataCollector.roundCurrency(var value: currency; const noDP: smallint): currency;

  function decimalpicture(noDP: smallint):string;
  var
     c : byte;
  begin
    result:='';
    for c := 1 to noDp do
      result := result+'0';
    if noDp > 0 then result := '.'+result;
    result := '0' + result;
    for c := 2 to 3 do   {Could substitute number in thousands group WININI here}
      result := '#'+ result;
    result:= '#'+ result;
  end;
var
  numStr: string;
begin
  // Convert to string rounded to noDP
  numStr := FormatFloat(DecimalPicture(noDp), value);

  // then convert it back
  value := StrToFloat(numStr);
  result := Value;
end;



function GetFileModDate(Filename: String): TDateTime;
var
  Handle_Info : _BY_HANDLE_FILE_INFORMATION;
  FileNameC : array [0..200] of char;
  FileHandle : THandle;
  Systime : TSystemTime;
//  FileInfo : TWin32FileInfoData;
begin
  StrPCopy(FileNameC, FileName);
  if Not FileExists(FileName) then
    FileHandle := createfile(FileNameC, DWord(GENERIC_WRITE),
      DWord(FILE_SHARE_WRITE), nil, DWord(CREATE_NEW), DWord(FILE_ATTRIBUTE_HIDDEN), 0)
  else
    FileHandle := createfile(FileNameC, DWord(GENERIC_READ),
      DWord(FILE_SHARE_READ), nil, DWord(OPEN_EXISTING), DWord(FILE_ATTRIBUTE_HIDDEN), 0);

  if FileHandle = INVALID_HANDLE_VALUE then
    begin
    GetLastError;
    Result := 0;
    exit;
    end;
  if GetFileInformationByHandle(hfile(FileHandle), Handle_Info) then
    begin
    FileTimeToSystemTime(_FileTime(Handle_Info.ftLastWriteTime), Systime);
    Result := SystemTimeToDateTime(systime);
    end
  else
    Result := 0;
  CloseHandle(FileHandle);
end;

function ReportFileInuse(Filename: String): Boolean;
var
  FName, fname1, tmpfile : string;
begin
  result := True;
  FName := fileName;
  Fname1 := ChangeFileExt(Fname, '');
  tmpfile := fname1 + '.tmp';
  if fileexists(tmpfile) then
    DeleteFile(tmpfile);
  if (RenameFile(Filename, tmpfile)) then
    begin
    renameFile(tmpfile, filename);
    Result := False;
    end;
end;

function CheckFileName(basefolder, filename: String): string;
var
  I: Integer;
  FName, fname1, Fext, goodname, flname, tmpfile : string;
begin
  FName := BaseFolder + fileName;
  fext := ExtractFileExt(Filename);
  Fname1 := ChangeFileExt(Fname, '');
  tmpfile := fname1 + '.tmp';
  if fileexists(tmpfile) then
    DeleteFile(tmpfile);
  goodname := '';
  if fileexists(Fname) then
    begin
    for I := 0 to 10 do    // Iterate
      begin
      if I = 0 then
        flname := fname
      else
        flname := fname1 + '(' + inttostr(I) + ')' + fext;
      if not FileExists(flname) then
        begin
        if length(goodname) < 1 then
          Goodname := Flname;
        end
      else
        begin
        if (RenameFile(Flname, Fname1 + '.tmp')) then
          begin
          renameFile(fname1 + '.tmp', flname);
          if length(goodname) < 1 then
            Goodname := Flname;
          // Clean up
          deleteFile(flname);
          end;
        end;
      if fileexists(tmpfile) then
        DeleteFile(tmpfile);
      end;
    end;
  if length(goodname) < 1 then
    Result := fname
  else
    Result := goodname;
end;

procedure ShowConcatMessage(Flname: String);
begin
  showmessage('The Concatenation file (' + Flname + ') is still open preventing concatenation.'
   + #13#10#13#10 + 'The report will display but will not appended.' + #13#10#13#10 + 'Close Acrobat Reader to allow concatenation.');
end;

end.
