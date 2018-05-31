// auchTypes

unit AuchTypes;

interface

uses Windows, Classes, Forms, SysUtils, Controls, graphics, dialogs,
  {TeeProcs, TeEngine, Chart,} Db, {TeeData, series,} stdctrls, Messages, Consts;

const
  NUM_DAYSINYEAR = 371;
  NUM_WEEKS = 53;
  NUM_MONTHS = 14;   // accounts for 13 4 week months + (1 or 2 days) or (Total)

  DPI = 300;
  PAST = 0;
  TARGET = 1;
  TRACK = 2;
  VARIANCE = 3;

  HEADERFONTSIZE = 22;
  TITLEFONTSIZE = 14;
  SECTIONFONTSIZE = 13;
  DETAILFONTSIZE = 10;

  DETAILEDTITLEFONTSIZE = 12;
  DETAILEDSECTIONFONTSIZE = 11;
  DETAILEDBODYFONTSIZE = 8;

  MAXWMFPAGES = 50;

  STRATAPDF = 50142;

  LOCKOFFSET = 10;

  {Message Constants}
  LOMSG_BASE           = WM_USER + $4510; {Change this if used by something else!}
  LoPastDatePeriods    = LOMSG_BASE;
  LoRefresh            = LOMSG_BASE+1;
  LoExpensesAdd        = LOMSG_BASE+2;
  LoDepartmentChange   = LOMSG_BASE+3;

  POSTING = 0;
  DELETION = 1;


type

  {Detailed balance types with element 0 for opening balance}
  TDetailedBalArray = array[0 .. NUM_DAYSINYEAR] of currency;
  TDetailedBalArrayPtr = ^TDetailedBalArray;

  TPastBalances = array[0..4] of currency;

  TTrackingBals = (trperactual, trperplan, trytdactual, trytdplan, trpervar, trytdvar);

  TConsolidateType = (ctNormal, ctBusiness, ctDepartment, ctCashFlow);

  TTrackBalances = array[trperactual..trytdvar] of currency;

  {Date/time Array for a full year}
  TDateTimeArray = array[0 .. NUM_DAYSINYEAR] of TDateTime;

  {Monthly/Weekly balance types with element 0 for opening Balance is as above plus one more element for total}
  TSummaryBalArray = array[0 .. NUM_WEEKS] of currency;
  TSummaryBalArrayPtr = ^TSummaryBalArray;

  {Monthly balance types with element 0 for opening Balance is as above plus one more element for total}
  TMonthlyBalArray = array[0 .. NUM_MONTHS] of currency;
  TMonthlyBalArrayPtr = ^TMonthlyBalArray;

  TExpenseAccRecPtr = ^TExpenseAccRecType;TExpenseAccRecType = record
    OldAccNo : Integer;
    NewAccno : Integer;
  end;

  TPlanDataRecPtr = ^TPlanDataRecType;TPlanDataRecType = record
    Accountno : integer;
    Nonzero : Boolean;
    Noncash : Boolean;
    WagesAcc : Boolean;
    InterestAcc : Boolean;
    InitialBalance : boolean;
		AccountTitle : string;
		AccountSubTitle : string;
		PastBalances : TPastBalances;
		FormatImage : string;
//    PastResult: currency;
		PastResultPc: currency;
		PlanTotal: currency;
		PlanTotalPc: currency;
		OpeningBalance : currency;
		PlanDetail: TDetailedBalArray;
		PlanDetaildisk: TDetailedBalArray;
		WagesCB : TCheckBoxState;
		PlanSummary: TSummaryBalArray;
		Account_Group: integer;
	end;

	TCashFlowRecPtr = ^TCashFlowRecType;TCashFlowRecType = record
		Accountno : integer;
		AccountTitle : String;
		AccountGroup : string;
		FormatImage : string;
		Nonzero : Boolean;
		Noncash : Boolean;
		WagesAcc : Boolean;
		InterestAcc : Boolean;
		InitialBalance : boolean;
		PlanTotal: currency;
		OpeningBalance : currency;
		DiskBalance : currency;
		PlanDetail: TDetailedBalArray;
		PlanDetaildisk: TDetailedBalArray;
		PlanSummary: TSummaryBalArray;
	end;

	// this one does not have a plandetaildisk array to save a little space.
	TCashFlowReportRecPtr = ^TCashFlowReportRecType;TCashFlowReportRecType = record
		Accountno : integer;
		AccountTitle : String;
//    AccountGroup : string[30];
//    FormatImage : string[50];
		Nonzero : Boolean;
		Noncash : Boolean;
		WagesAcc : Boolean;
		InterestAcc : Boolean;
		InitialBalance : boolean;
		PlanTotal: currency;
		OpeningBalance : currency;
		DiskBalance : currency;
		PlanDetail: TDetailedBalArray;
		PlanSummary: TSummaryBalArray;
	end;



	TValueType = (vtCurrency0, vtCurrency1, vtCurrency2, vtNumeric0, vtNumeric1, vtNumeric2, vtPercent0, vtPercent1, vtPercent2);
	TUltimateWIRecPtr = ^TUltimateWIRecType; TUltimateWIRecType = record
		Drivername : Integer;
		IsCashTarget : Boolean;
		BaseValue : Currency;
		ValueType : TValueType;
		TargetValue : Currency;
		PCChange : Currency;
		NPResult : Currency;
		CashResult : Currency;
		Cycles : Integer;
	end;

	TCashFlowType = (cfReceivables, cfStock, cfPayables, cfAccruedExpenses, cfTax);
	TUOType = (UOInteger, UOCurrency, UODate, UOString);

	TReportDataRecPtr = ^TreportDataRecType;TReportDataRecType = record
		Accountno : integer;
		Annualise : Boolean;
		FormatImage : string;
		Symbol : string;
		Accumulate : Boolean;
		AccountTitle : string;
		Nonzero : Boolean;
		PastBalances : TPastBalances;
		PlanTotal: currency;
		MonTotal: currency;
		PlanDetail : TDetailedBalArray;
		PlanSummary : TSummaryBalArray;
		MonDetail : TDetailedBalArray;
		MonSummary : TSummaryBalArray;
		TrackBalances : TTrackBalances;
		Account_Group: integer;
		Account_DR : boolean;
	end;

	TConsolidDeptRecPtr = ^TConsolidDeptRecType;TConsoliddeptRecType = record
		DeptId : integer;
		Name : string;
		CurrencySymbol : string;
		UnitDescS : string;
		UnitdescP : string;
		SummaryBalances : array[0..7] of TTrackBalances;
	end;


	TDepartRecPtr = ^TDepartRecType;TDepartRecType = record
		DeptId : integer;
		Name : string;
		CurrencySymbol : string;
		ReportCode1 : string;
		ReportCode2 : string;
		UnitDescS : string;
		UnitdescP : string;
	end;

	TInvType = (AnalysisInv, PlanInv, MonitorInv);
	TQuoteState = (Newquote, NoInvQuote, InvQuote);
	TRangeType = (RtSales, RtOtherIncome, RtExpenses, RtBalanceSheet);
	THelpHoursType = (HTInvoices, HTWorkback);
	TLicCheck = (LCLicOk, LCNoLic, LCExpired, LCInvalidLic, LCGrace, LCNotConnected, LCFileNameIncorrect, LCNotChecked);

	TInvoiceSortType =
	(stAsEntered,
	 stAverageRate,
	 stSales,
	 stGPPC,
	 stInvoiceNumber,
	 stdate);

	{Invoice Record}
	TInvoiceRecPtr = ^TInvoiceRec;TInvoiceRec = record
		Depart_ID : Integer;
		Inv_Type : TInvType;
		Invoice_Date : TDateTime;
		Invoice_LDate : LongInt;
		Invoice_ID : integer;
		Quote_Index : integer;
		Quote_Number: String;
		Invoice_Number: string;
		NetSales: currency;
		materials: currency;
		subcon: currency;
		gross: currency;
		Units: currency;
		TSunits : Currency;
		Rate: currency;
		gppc: currency;
		LastInv: Boolean;
		ToComplete: Currency;
	end;

	TQuoteFields = (QfSales, QfMaterials, QfSubCon, QFGP, QfGPPC, QfHours, QfTimeSheetHours, qfRate, QfEnd);
	TQuoteRepRows = (QrrQuote, QrrActual, QrrVariance);
	TQuoteValues = array[qfSales..qfEnd, QrrQuote..QrrVariance] of Currency;
	TQuoteSortType =
	(qstQuoteNumber,
	 qstCustomerName,
	 qstdate,
	 qstSales,
	 qstGPPC,
	 qstAverageRate,
	 qstHours);

	{Quote Record}
	TQuoteRecPtr = ^TQuoteRec;TQuoteRec = record
		Depart_ID : Integer;
		Quote_Date : TDateTime;
		Quote_LDate : LongInt;
		Quote_Number: string;
		Quote_Customer: string;
		Values : TQuoteValues; //array[qfSales..qfEnd, QrrQuote..QrrVariance] of Currency;
		HourstoRun : currency;
		HourstoRunS : string;
		LastInvDate : TDateTime;
	end;

	TServerRecPtr = ^TServerRec; TServerRec = record
		Name : string;
		Desc : String;
		Protocol : String;
		BFAdminFolder : string;
		AppFolder : string;
		NetworkPath : string;
		CorrectGDB : Boolean;
		Unix : Boolean;
		Embedded : Boolean;
	end;

		VS_FIXEDFILEINFO = record
		dwSignature,
		dwStrucVersion,
		dwFileVersionMS,
		dwFileVersionLS : cardinal;
		minor, major, build, release : word;
		dwProductVersionMS,
		dwProductVersionLS,
		dwFileFlagsMask,
		dwFileFlags,
		dwFileOS,
		dwFileType,
		dwFileSubtype : cardinal;
		dwFileDateMS, dwFileDateLS : cardinal;
	end;

  TDMCIntMessage = packed record
    Msg: Cardinal;
    WParam: ^Integer;
    LParam: ^Integer;
    Result: LRESULT;
  end;

	pVS_FIXEDFILEINFO = ^VS_FIXEDFILEINFO;

	TVersionFields = (Vfmajor, Vfminor, Vfrelease, Vfbuild);

  TEXEVersionData = record
    CompanyName,
    FileDescription,
    FileVersion,
    InternalName,
    LegalCopyright,
    LegalTrademarks,
    OriginalFileName,
    ProductName,
    ProductVersion,
    Comments,
    PrivateBuild,
    SpecialBuild: string;
  end;


{
type
	TCValueList=class(TChartValueList)
	Private
		fType : integer;
		fcumulative : Boolean;
	Protected
//    function GetValue(ValueIndex:longint):Double; override;
//    procedure SetValue(ValueIndex:Longint;Const AValue:Double); override;
		procedure ClearValues; override;
		function AddChartValue(Const Value: TChartValue):Longint; override;
		procedure InsertChartValue(ValueIndex:Longint; Const Value:TChartValue); override;
	public
		VCArray: ^TDetailedBalArray;
		VDArray: ^TDateTimeArray;
		VCount: integer;
		Property DataType : Integer read fType write fType;
		Property Cumulative : Boolean read fCumulative write fCumulative;
//    property Value[Index:Integer]:TChartValue read GetValue write SetValue; Override;
		Constructor Create(AOwner:TChartSeries; Const AName:String); override;
//    Function Count:Longint; override;
		Procedure Delete(ValueIndex:Longint); override;
		Procedure Scroll; override;
end;
}
const

	ZoomValues : Array[0..7] of Integer = (25, 50, 75, 100, 125, 150, 200, 250);

	{---- Common strings----}
		COPYRIGHT  = 'Copyright © 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 - Auchinlea Pty Ltd';
		RP_CRIGHTNOTICE = 'Copyright © 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 Auchinlea Pty Ltd - All Rights Reserved';
		PKIR_CRIGHTNOTICE = 'Copyright © 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011 Auchinlea Pty Ltd - All Rights Reserved';
		MASTERTBL = 'master.tbl';
		DEMOFILE = 'SAMPLE.FDB';
		DEMONAME = 'Sample';
		SC_TEMP = 'Shortcuts Mapping';

	{Period ranges}
		MAX_YEARS_ANL = 5;   // Maximum number of date ranges in analysis
		MAX_YEARS_PM = 10;   // Maximum number of date ranges in planning and monitoring

	{Account Numbers}
		SALES              = 10;
		FTEPROD            = 70;
		FTEOTHER           = 80;
		POTENTIAL          = 90;
		BILLED             = 100;
		COGS               = 110;    // Materials = COGS - SUBCONTRACTORS
		SUBCONTRACTORS     = 120;
		OTHERDIRECT        = 200;
		GROSSPROFIT        = 210;
		FIRSTEXPENSE       = 220;
		TOTALOTHEREXPENSES = 980;
		TOTALEXPENSES      = 990;
		TOTALNONCASHEXP    = 991;
		NETOPERATINGPROFIT = 1010;
		OTHERINCOME        = 1020;
		DEPNINTEREST       = 1025;
		NETPROFIT          = 1110;
		LOSSESFORWARD      = 1120;
		INCOMETAXCALCULATED = 1130;
		PROPOSEDDIVIDEND    = 1140;
		RETAINEDPROFIT      = 1150;

		FIRSTBALANCESHEET  = 1200;
		CASH_AT_BANK       = 1200;
    ACCOUNT_REC        = 1210;
    STOCK              = 1230;
    CASH_MAN_FUND      = 1240;
    MARKETSEC          = 1250;
    OTHER_CURRENT_ASSETS = 1260;
    TOTAL_CURRENT_ASSETS = 1265;
    NON_DEP_ASSETS     = 1300;
    DEP_ASSETS         = 1310;
    INTANG_ASSETS      = 1320;
    TOTALOTHERASSETS   = 1390;
    BANK_OVERDRAFT     = 1400;
    ACCOUNT_PAY        = 1410;
    ACCRUED_EXPENSES   = 1420;
    TAX_PAYABLE        = 1430;
    TAX_CASH_TIMING    = 1432;
    INC_TAX_PAYABLE    = 1440;
    DIVIDENDS_PAYABLE  = 1450;
    OTHER_CURRENT_LIAB = 1460;
    TOTAL_CURR_LIAB    = 1470;
    LOANS              = 1480;
    EQUITY             = 1490;
    // Movement Accounts
    TAX_ON_SALES           = 1501;
    TOTAL_GROSS_SALES      = 1502;
    CASH_RECEIPTS_AR       = 1503;
    STOCK_SOLD             = 1504;
    STOCK_DELIVERIES       = 1505;
    TAX_ON_STOCK_DELIVERIES = 1506;
    GROSS_STOCK_PURCHASES   = 1507;
    TAX_ON_SUBCONTRACTORS  = 1508;
    GROSS_SUBCONTRACTORS   = 1509;
    CASH_MAN_DEPOSITS      = 1510;
    CASH_MAN_WITHDRAWALS   = 1511;
    MARKET_SEC_PURCHASES   = 1512;
    MARKET_SEC_SALES       = 1513;
    OTHER_ASSETS_PURCHASES = 1514;
    OTHER_ASSETS_SALES     = 1515;
    NON_DEP_ASSET_PURCHASES = 1516;
    NON_DEP_ASSET_SALES     = 1517;
    DEP_ASSET_PURCHASES    = 1518;
    DEP_ASSET_SALES        = 1519;
    INTANG_ASSET_PURCHASES = 1520;
    INTANG_ASSET_SALES     = 1521;
    TOTAL_AP_INVOICES      = 1522;
    CASH_PAYMENTS_AP       = 1523;
    NET_EXPENSES_VIA_AP    = 1524;
    TAX_EXPENSES_VIA_AP    = 1525;
    GROSS_EXPENSES_VIA_AP  = 1526;
    NET_EXPENSES_ACCRUED   = 1527;
    TAX_EXPENSES_ACCRUED   = 1528;
    GROSS_EXPENSES_ACCRUED = 1529;
    CASH_PAYMENTS_AE       = 1530;
    TOTAL_TAX_COLLECTED    = 1531;
    TOTAL_TAX_PAID         = 1532;
    TAXPAID_REFUND         = 1533;
    INC_TAX_INCURRED       = 1534;
    INC_TAX_PAID           = 1535;
    DIV_DECLARED           = 1536;
    DIV_PAID               = 1537;
    OTHER_LIAB_INCURRED    = 1538;
    OTHER_LIAB_PAID        = 1539;
    LOANS_INCURRED         = 1540;
    LOANS_REPAID           = 1541;
    EQUITY_INJECTED        = 1542;
    EQUITY_WITHDRAWN       = 1543;
    AR_ADJUSTMENTS         = 1544;
    ST_ADJUSTMENTS         = 1545;
    AP_ADJUSTMENTS         = 1546;
    AE_ADJUSTMENTS         = 1547;
    TAX_ADJUSTMENTS        = 1548;
    AR_WRITEOFF            = 1549;
    ST_WRITEOFF            = 1550;
    NETTAXCASH             = 1551;
    NETTAXACCRUAL          = 1552;
    AR_DAYS                = 1560;
    STOCK_DAYS             = 1561;
    AP_DAYS                = 1562;
    AE_DAYS                = 1563;
    TAX_LOSSES             = 1564;
    GPPCACC                = 2020;
    GPBILLED               = 2040;
    LASTBALANCESHEET   = 1599;

    // Account Groups
    INCOMEACCOUNT = 'Income';
    COGSACCOUNT = 'Cost of Sales';
    EXPENSEACCOUNT = 'Expenses';
    PNLAPPROP = 'Profit and Loss Appropriation';
    CURASSETS = 'Current Assets';
    CURLIAB = 'Current Liabilities';
    OTHERASSETS = 'Other Assets';
    OTHERLIAB = 'Other Liabilities';
    TOTALEQUITY = 'Total Equity';
    CASHFLOWOTHER = 'Cash Flow - Other';
    CASHFLOWDIRECT = 'Cashflow Direct';
    AGINCOME = 1;
    AGCOGS = 2;
    AGDIRECTEXP = 3;
    AGEXPENSES = 4;
    AGDEPNINT = 5;
    AGPNL = 9;
    AGCURRASSETS = 10;
    AGCURRLIAB = 15;
    AGOTHERASSETS = 11;
    AGOTHERLIAB = 16;
    AGACTIVITY = 20;
    AGCFDIRECT = 30;
    AGCFOTHER = 31;

    // What if Accounts
    WBMATERIALS        = 1610;
    WBSUBCON           = 1620;
    WBMATERIALMU       = 1630;
    WBSUBCONMU         = 1640;
    WBLABOURMU         = 1650;
    WBLABOURRATE       = 1660;
    WHATIF             = 1990;
    DETAILEDOPT        = 2000;
    // Contents - 366 balances used for:
    // 0 - DETAILPLANGRAPHLIST (was 12) Items checked in Detail Targeting Window
    // 41 Detailed Targeting Combo Value
    // 42 Detailed Targeting Account to Edit Combo Value;
    // 50 Tracking Sales Combo Value
    // 51 Tracking Sales Period value
    // 52 Tracking Expenses Combo Value
    // 53 Tracking Expenses Period Value
    // 54 Tracking Other Income Combo Value
    // 55 Tracking Other Income Period Value

    SALESUNIT          = 10000;
    GPUNIT             = 10010;
    GPPC               = 10020;
    PRODUCTIVITY       = 10030;
    TOTALEXPPC         = 10040;
    NPPC               = 10050;
    TOTALEXPUNIT       = 10060;
    NPUNIT             = 10070;
    SALESWAGE          = 10080;
    GPWAGE             = 10090;
    NPWAGE             = 10100;
    SALESFTE           = 10110;
    GPFTE              = 10120;
    NPFTE              = 10130;
    TOTALFTE           = 10140;
    HRSPERDAY          = 10150;

  {Account Titles for those > 10000}
    SALESUNITTITLE = 'Sales (Gross Revenue) per '; // Unit Type added
    GPUNITTITLE = 'Gross Profit per ';
    GPPCTITLE = 'Gross Profit %';
    PRODUCTIVITYTITLE = '% to Potential';
    TOTALEXPPCTITLE = 'Total Expenses %';
    NPPCTITLE = 'Net Profit %';
    TOTALEXPUNITTITLE = 'Total Expenses per ';
    NPUNITTITLE = 'Net Profit per ';
    SALESWAGETITLE = 'Sale (Gross Revenue) per $ Wage';
    GPWAGETITLE = 'Gross Profit per $ Wage';
    NPWAGETITLE = 'Net Profit per $ Wage';
    SALESFTETITLE = 'Sales (Gross Revenue) per FTE';
    GPFTETITLE = 'Gross Profit per FTE';
    NPFTETITLE = 'Net Profit per FTE';
    TOTALFTETITLE = 'Total FTE Staff';
    HOURSPERDAYTITLE = 'Billed Hours (8hr day)';

    { Department Options}
    OPERIODSIZE = 'Period Size';
    OUSESTOCKDAYS = 'Use Stock Days';
    OARDAYSAVERAGE = 'AR Days Average';
    OSTOCKAVERAGE = 'Stock Average';
    OAPDAYSAVERAGE = 'AP Days Average';
    OAEDAYSAVERAGE = 'AE Days Average';
    OTAXRATE_SALES = 'Tax Rate - Sales';
    OTAXRATE_STOCK = 'Tax Rate - Stock';
    OTAXRATE_SUBCON = 'Tax Rate - Subcontractors';
    OTAXRATE_EXPENSES = 'Tax Rate - Expenses';
    OTAXPAYMENTQUARTERLY = 'Tax Payment Quarterly';
    OTAXACCOUNTINGMETHOD = 'Tax Accounting Method';
    OTAXPAIDDAY = 'Tax Paid Day';
    OFIRSTDAY = 'First Day';
    OFIRSTMONTH = 'First Month';
    OBANKACCOUNTLIABILITY = 'Bank Account Liability';
    OOVERDRAFTRATE = 'Bank Interest Rate';
    OCASHFLOWCALCREQUIRED = 'Cash Flow Calc Required';
    OINCOMETAXRATE = 'Income Tax Rate';
    ODIVIDENDRATE = 'Dividend Rate';
    OMINDIVIDEND = 'Minimum Dividend Amount';
    OMAXDIVIDEND = 'Maximum Dividend Amount';


    REPORTROUNDCURRENCY = '#,##0;(#,##0);-';
    REPORTCENTSCURRENCY = '#,##0.00;(#,##0.00);-';
    REPORTTENSCURRENCY = '#,##0.0;(#,##0.0);-';

  { Department Reporting Option Flags }
    RO_GROSSREVENUE = $0001;  // Gross Revenue
    RO_GP           = $0002;  // Gross Profit
    RO_GPPC         = $0004;  // Gross Profit %
    RO_POTUN        = $0008;  // Potential Units
    RO_ACTUN        = $0010;  // Actual Units
    RO_PROD         = $0020;  // Productivity
    RO_AVEUN        = $0040;  // Average Sale per unit
    RO_AVEGP        = $0080;  // Average GP per unit
    RO_ADDGT        = $0100;  // Add to group total
    RO_ADDOT        = $0200;  // Add to overall total
    RO_ADDIS        = $0400;  // Add to invoiced sales
    RO_ALL          = 2047;   // All report options on

  { Max no of accounts per master industry }
    MAXACC = 300;

  { Sizes of internal lists }
    SUMMARYPLANLIST = 22;
    DETAILEDPLANLIST = 14;
    DETAILEDTARGETLIST = 13;
    CASHFLOWLISTSIZE = 88;
    DETAILPLANGRAPHLIST = 12;
    DETAILEDEDITSTART = 5;
    WORKBACKLIST = 8;
    MONITORSALESLIST = 11;
    MONITORINGACCOUNTLIST = 1000;
    CASHFLOWREPLISTSIZE = 31;
    WORKCAPREPLISTSIZE = 40;
    BALSHEETREPLISTSIZE = 33;

  { CashReport Types}
    REPCASHFLOW = 0;
    REPWORKING = 1;
    REPBALANCE = 2;

  { PlanDetail Constants }
    PDSALES = 0;
    PDGROSS = 1;
    PDOTHER = 2;
    PDPOTENTIAL = 3;
    PDBILLED = 4;
    PDSALESUNIT = 5;
    PDGPUNIT = 6;
    PDGPPC = 7;
    PDPROD = 8;
    PDEND = 9; // this is always the last

  { MonitoringSales Constants }
    MSSALES = 0;
    MSCOGS = 1;
    MSGP = 2;
    MSGPPC = 3;
    MSPOTENTIAL = 4;
    MSBILLED = 5;
    MSGPUNIT = 6;
    MSEND = 7; // this is always the last

  { WHAT IF Constants }
    { Accounts }
    WISALES = 0;
    WIGP    = 1;
    WIPOTENTIAL = 2;
    WIBILLED = 3;
    WIGPPC  = 4;
    WISU  = 5;
    WIGPU  = 6;
    WIPROD = 7;
    WISALESPCI = 10;
    WIGPPCI = 11;
    WIPOTENTIALPCI = 12;
    WIBILLEDPCI = 13;
    WIGPPCPCI  = 14;
    WISUPCI  = 15;
    WIGPUPCI  = 16;
    WIPRODPCI = 17;


    { Account Sets }
    WIBASE = 0;
    WI1 = 1;
    WI2 = 2;
    WI3 = 3;

    { Monitoring Quotes - Average Rates }
    MMONTHLYTARGET = 0;
    MLASTMONTHMONITORED = 1;

  {Constants to match client setup errors which are used when passing messages about }
    NO_ANLDATERANGE = 0;
    NO_PLANDATERANGE = 1;
    NO_DIVISION = 2;

  {Constants for Licence Count errors which are used when passing messages about }
    NUM_EXCEEDED = 0;

  {Constants for Support Expired errors which are used when passing messages about }
    SUPPORT_EXPIRED = 0;

  {Constants for Revenue Group Errord which are used when passing message about }
    KEY_INDICATOR = 0;

  {Constants used by the new business wizard to signal the program what it needs to do next}
    NBW_ANALYSIS_PL = 0;  // Go to the Analysis Profit and Loss Summary
    NBW_PLANNING_DR = 1;  // Go to the Planning Date Ranges

  {HTML Reports Constants }
    REPORT_TEXT_FONT_SIZE = 2;   // Size of text in a report

  {Printer Orientation} // Redefined to avoid Using "Printers" in each report module
    PORTRAIT = 0;
    LANDSCAPE = 1;

  {PDF CONVERTER Interface }
{    NoPrompt = 1;
    UseFileName = 2;
    Concatenate = 4;
    DisableCompression = 8 ;
    EmbedFonts = 16 ;

    function PDFDriverInit( PrinterName : PChar ) : LONG; stdcall;
      external 'pdfintf.dll' name 'PDFDriverInit';
    function PDFDriverEnd() : LONG; stdcall;
      external 'pdfintf.dll' name 'PDFDriverEnd';
    function SetDefaultDirectory( Directory : PChar) : LONG; stdcall;
      external 'pdfintf.dll' name 'SetDefaultDirectory';
    function SetDefaultFileName( FileName : PChar) : LONG; stdcall;
      external 'pdfintf.dll' name 'SetDefaultFileName';
    function SetFileNameOptions( Options : SmallInt) : LONG; stdcall;
      external 'pdfintf.dll' name 'SetFileNameOptions';
}
  {Beep on Error - one day when used by all controls, allow user setting}
  HigBeepOnErrorB : boolean = true;

  { Windows and Controls Related Functions }
{
  procedure MDIvsSDI(form : TForm);
  function  mdiSdiParent(mdiParent, sdiParent : TComponent) : TComponent;

  procedure HiBeep;

  Function EncryptPassword(psword: String): string;
  procedure GetScaleFactors(form : TForm; var scaler, divis : integer);
  function FindWindowPartial(className, partTitle : string) : HWND;
  procedure ForceWindowToFront(handle : HWnd);
}
  function commandLineFlag(flagS : string) : boolean;
  function commandLineArgument(flagS : string; var settingS : string) : boolean;
//  function daysInMonth(year, month : Word) : Word;
  function GetlocaleCurrency: string;
//  function GetFixedVersionInfo : pVS_FIXEDFILEINFO;
//  procedure GetFixedVersInfo(var Pinfo : pVS_FIXEDFILEINFO) ;
  function GetEXEVersionData(const FileName: string): TEXEVersionData;
  function InputPwdQuery(const ACaption, APrompt: string;
    var Value: string; Setting : Boolean; FormColour:TColor): Boolean;

implementation

{
Constructor TCValueList.Create(AOwner:TChartSeries; Const AName:String);
begin
  inherited Create(AOwner,AName);
  VCount:=0;
//  VDArray := @fVDArray;
//  VCArray := @fVCArray;
  Ftype := 0;
end;
}
{ return a value from the Array }
{
Function TValueList.GetValue(ValueIndex:Longint):Double;
var
  j: Integer;
begin
  Result := 0;
  if fType = 0
    then begin
    if fCumulative then
      for j := 0 to ValueIndex do    // Iterate
        Result := Result + VCArray^[j]
    else
      result:=VCArray^[ValueIndex];
  end
  else
    result:=VDArray^[ValueIndex];
end;
}
{ set an Array value }
{
Procedure TValueList.SetValue(ValueIndex:Longint; Const AValue:Double);
begin
  if fType = 0
    then begin
    if fCumulative and (ValueIndex > 0)then
      VCArray^[ValueIndex]:=AValue - VCArray^[ValueIndex - 1]
    else
      VCArray^[ValueIndex]:=AValue;
  end
  else
    VCArray^[ValueIndex]:=AValue;
end;
}
{ clear all Array values to zero }
{
Procedure TCValueList.ClearValues;
var t:Longint;
begin
  if fType = 0 then
    if Assigned(VCArray) then
      for t:=0 to Count-1 do VCArray^[t]:=0
    else
    if Assigned(VDArray) then
      for t:=0 to Count-1 do VDArray^[t]:=0;
end;
}
{ If we use Series1.AddXY or Add methods, fill the Array with the new value }
{
Function TCValueList.AddChartValue(Const Value:TChartValue):Longint;
begin
  if fType = 0 then
    VCArray^[Count]:=Value
  else
    VDArray^[Count]:=Value;
  Inc(VCount);
  result:=VCount-1;
end;
}
{ Insert a new value in the Array at a specific "ValueIndex" position }
{
Procedure TCValueList.InsertChartValue(ValueIndex:Longint; Const Value:TChartValue);
var t:Longint;
begin
  if ftype = 0
    then begin
}    { scroll all values to make room for the new value }
{    for t:=Count-1 downto ValueIndex do VCArray^[t+1]:=VCArray^[t];
    VCArray^[ValueIndex]:=Value;
  end
  else begin
}    { scroll all values to make room for the new value }
{    for t:=Count-1 downto ValueIndex do VDArray^[t+1]:=VDArray^[t];
    VDArray^[ValueIndex]:=Value;
  end;
  Inc(VCount);
end;
}
{ return the number of points in the Array }
{
Function TValueList.Count:Longint;
begin
  result:=VCount;
end;
}
{ delete an Array value }
{
Procedure TCValueList.Delete(ValueIndex:Longint);
var t:Longint;
begin
  if fType = 0 then
    for t:=ValueIndex+1 to Count-1 do VCArray^[t-1]:=VCArray^[t]
  else
    for t:=ValueIndex+1 to Count-1 do VDArray^[t-1]:=VDArray^[t];
  Dec(VCount);
end;
}
{ circular scrolling of Array points }
{
Procedure TCValueList.Scroll;
var t:Longint;
    tmp:Double;
begin
  if ftype = 0
    then begin
    if Count>0 then
      begin
      tmp:=VCArray^[0];
      for t:=1 to Count-1 do VCArray^[t-1]:=VCArray^[t];
      VCArray^[Count-1]:=tmp;
    end;
  end
  else begin
		if Count>0 then
			begin
			tmp:=VDArray^[0];
			for t:=1 to Count-1 do VDArray^[t-1]:=VDArray^[t];
			VDArray^[Count-1]:=tmp;
		end;
	end;
end;
}
// commandLineFlag: checks whether the flag given is provided on the command line
function commandLineFlag(flagS : string) : boolean;
var
	i : integer;
begin
	result := false;
	for i := 1 to paramCount do // start at 1 'cos 0 is prog
		if paramStr(i) = flagS then begin
			result := true;
			exit;
		end;
end;

procedure GetScaleFactors(form : TForm; var scaler, divis : integer);
begin
	if (form.FormStyle = fsMDIChild) or (form.FormStyle = fsMDIForm) then
		divis := 720
	else divis := 640;

  scaler := screen.width div 2 + 320;
end;

// commandLineArgument: searches the command line for the given flag and fetches the
// argument associated with it. Returns false if the flag is not found, or true if found,
// with the argument value in <settingS>.
function commandLineArgument(flagS : string; var settingS : string) : boolean;
var
  i : integer;
begin
  result   := false;
  settingS := '';
  for i := 1 to paramCount-1 do // start at 1 'cos 0 is prog, stop at paramCount-1 to leave room for final argument
    if paramStr(i) = flagS then
    begin
      result   := true;
      settingS := paramStr(i+1);
      exit;
    end;
end;

// daysInMonth:
{function daysInMonth(year, month : Word) : Word;
var yearTemp, monthTemp, dayTemp : Word;
begin
  case month of
    9, 4, 6, 11: result := 30;
    2: if year mod 4 <> 0 then result := 28 // definitely not a leap-year
       else if year mod 100 <> 0 then result := 29 // definitely is a leap-year
       else begin // otherwise turn of century year -> more complex
         if year < 100
         then begin // need to resolve two digit year
           DecodeDate(Date, yearTemp, monthTemp, dayTemp);

           if year >= (yearTemp-TwoDigitYearCenturyWindow) div 100 then
             inc(year, yearTemp - (yearTemp mod 100)) // put into current century
           else
             inc(year, yearTemp - (yearTemp mod 100) + 100); // put into next century
         end;
         if IsLeapYear(year) then result := 29 else result := 28;
       end;
    else result := 31;
  end;
end;
}

function GetlocaleCurrency: string;
var
  BufSize: Integer;
begin
// Obtain Unique record Number for Dept_ID Field.
  BufSize := GetLocaleInfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SCURRENCY, nil, 0);
  SetLength(Result, BufSize);
  GetLocaleinfo(LOCALE_SYSTEM_DEFAULT, LOCALE_SCURRENCY, PChar(Result), BufSize);
  SetLength(Result, BufSize - 1);
end;

{ ---------------------------------------------------------------------------- }
{ -- GetFixedVersionInfo - Returns a pointer to the version information        }
{                          structure for this file                             }
{ ---------------------------------------------------------------------------- }
{
function GetFixedVersionInfo : pVS_FIXEDFILEINFO;
var
  dummy : cardinal;
  size : cardinal;
  ptr : Pointer;
begin
  size := GetFileVersionInfoSize(pChar(paramStr(0)), dummy);
  ptr := AllocMem(size);
  GetFileVersionInfo(pChar(paramStr(0)), dummy, size, ptr);
  VerQueryValue(ptr, '\', Pointer(result), size);
  FreeMem(ptr);
end;
}
{ ---------------------------------------------------------------------------- }
{ -- GetFixedVersInfo - Pass a record to get the version information           }
{                          structure for this file                             }
{ ---------------------------------------------------------------------------- }
{
procedure GetFixedVersInfo(var Pinfo : pVS_FIXEDFILEINFO) ;
var
  dummy : cardinal;
  size : cardinal;
  ptr : Pointer;
begin
  size := GetFileVersionInfoSize(pChar(paramStr(0)), dummy);
  ptr := AllocMem(size);
  GetFileVersionInfo(pChar(paramStr(0)), dummy, size, ptr);
  VerQueryValue(ptr, '\', Pointer(Pinfo), size);
  FreeMem(ptr);
end;
}

function GetEXEVersionData(const FileName: string): TEXEVersionData;
type
  PLandCodepage = ^TLandCodepage;
  TLandCodepage = record
    wLanguage,
    wCodePage: word;
  end;
var
  dummy,
  len: cardinal;
  buf, pntr: pointer;
  exeName, lang: string;

begin
  if length(Filename) < 1 then
    exeName := paramStr(0)
  else
    exeName := FileName;
  len := GetFileVersionInfoSize(PChar(exeName), dummy);
  if len = 0 then
    RaiseLastOSError;
  GetMem(buf, len);
  try
    if not GetFileVersionInfo(PChar(exeName), 0, len, buf) then
      RaiseLastOSError;

    if not VerQueryValue(buf, '\VarFileInfo\Translation\', pntr, len) then
      RaiseLastOSError;

    lang := Format('%.4x%.4x', [PLandCodepage(pntr)^.wLanguage, PLandCodepage(pntr)^.wCodePage]);

    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\CompanyName'), pntr, len){ and (@len <> nil)} then
      result.CompanyName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileDescription'), pntr, len){ and (@len <> nil)} then
      result.FileDescription := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\FileVersion'), pntr, len){ and (@len <> nil)} then
      result.FileVersion := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\InternalName'), pntr, len){ and (@len <> nil)} then
      result.InternalName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalCopyright'), pntr, len){ and (@len <> nil)} then
      result.LegalCopyright := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\LegalTrademarks'), pntr, len){ and (@len <> nil)} then
      result.LegalTrademarks := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\OriginalFileName'), pntr, len){ and (@len <> nil)} then
      result.OriginalFileName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductName'), pntr, len){ and (@len <> nil)} then
      result.ProductName := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\ProductVersion'), pntr, len){ and (@len <> nil)} then
      result.ProductVersion := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\Comments'), pntr, len){ and (@len <> nil)} then
      result.Comments := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\PrivateBuild'), pntr, len){ and (@len <> nil)} then
      result.PrivateBuild := PChar(pntr);
    if VerQueryValue(buf, PChar('\StringFileInfo\' + lang + '\SpecialBuild'), pntr, len){ and (@len <> nil)} then
      result.SpecialBuild := PChar(pntr);
  finally
    FreeMem(buf);
  end;
end;

function InputPwdQuery(const ACaption, APrompt: string;
  var Value: string; Setting : Boolean; FormColour:TColor): Boolean;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  Edit2: TEdit;
  LoopResult : Boolean;
  DialogUnits: TPoint;
  ButtonTop, ButtonWidth, ButtonHeight: Integer;

  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    I: Integer;
    Buffer: array[0..51] of Char;
  begin
    for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
    for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;
begin
  Result := False;
  Form := TForm.Create(Application);
  with Form do
    try
      Color := FormColour;
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      BorderIcons := [];
      Caption := ACaption;
      ClientWidth := MulDiv(180, DialogUnits.X, 4);
      if setting then
        ClientHeight := MulDiv(82, DialogUnits.Y, 8)
      else
        ClientHeight := MulDiv(63, DialogUnits.Y, 8);
      Position := poScreenCenter;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := True;
        Left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Edit := TEdit.Create(Form);
      Edit2 := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(19, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        Text := Value;
        SelectAll;
      end;
      with Edit2 do
        begin
        Parent := Form;
        Left := Prompt.Left;
        Top := MulDiv(38, DialogUnits.Y, 8);
        Width := MulDiv(164, DialogUnits.X, 4);
        MaxLength := 255;
        PasswordChar := '*';
        Text := Value;
        SelectAll;
      end;
      if setting then
        ButtonTop := MulDiv(60, DialogUnits.Y, 8)
      else
        ButtonTop := MulDiv(41, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(50, DialogUnits.X, 4);
      ButtonHeight := MulDiv(14, DialogUnits.Y, 8);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgOK;
        ModalResult := mrOk;
        Default := True;
        SetBounds(MulDiv(38, DialogUnits.X, 4), ButtonTop, ButtonWidth,
       ButtonHeight);
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(MulDiv(92, DialogUnits.X, 4), ButtonTop, ButtonWidth,
          ButtonHeight);
      end;
      LoopResult := false;
      if not setting then Edit2.Visible := False;

      while LoopResult = False do
        begin
        ActiveControl := Edit;
        if ShowModal = mrOk then
          begin
          if (Not Setting) or (Setting and (Edit.text = Edit2.text))
            then begin
            Value := Edit.Text;
            Result := True;
            LoopResult := True;
          end
          else if Setting then MessageDlg('Both passwords must be the same.' + #13#10 +
          'Try Again', mtInformation, [mbOk], 0);
        end
        else begin
          Result := False;
          Value := '';
          LoopResult := True;
        end;
      end;    // while
    finally
      Form.Free;
    end;
end;

end.


