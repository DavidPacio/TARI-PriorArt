// auchTypes

unit auchtypesnew;

interface

uses Windows, Classes, Forms, SysUtils, Controls, graphics, dialogs,
  TeeProcs, TeEngine, Chart, Db, TeeData, series, stdctrls;

const
  NUM_DAYSINYEAR = 371;
  NUM_WEEKS = 53;

  DPI = 300;
  PAST = 0;
  TARGET = 1;
  TRACK = 2;

  HEADERFONTSIZE = 22;
  TITLEFONTSIZE = 14;
  SECTIONFONTSIZE = 13;
  DETAILFONTSIZE = 10;

  DETAILEDTITLEFONTSIZE = 12;
  DETAILEDSECTIONFONTSIZE = 11;
  DETAILEDBODYFONTSIZE = 8;

  STRATAPDF = 50142;
  
type
  {Detailed balance types with element 0 for opening balance}
  TDetailedBalArray = array[0 .. NUM_DAYSINYEAR] of currency;
  TPastBalances = array[0..4] of currency;

  {Date/time Array for a full year}
  TDateTimeArray = array[0 .. NUM_DAYSINYEAR] of TDateTime;

  {Monthly/Weekly balance types with element 0 for opening Balance is as above plus one more element for total}
  TSummaryBalArray = array[0 .. NUM_WEEKS] of currency;

  TPlanDataRecPtr = ^TPlanDataRecType;TPlanDataRecType = record
    Accountno : integer;
    Nonzero : Boolean;
    AccountTitle : array [0..60] of char;
    AccountSubTitle : array [0..120] of char;
    PastBalances : TPastBalances;
    FormatImage : string[50];
//    PastResult: currency;
    PastResultPc: currency;
    PlanTotal: currency;
    PlanTotalPc: currency;
    PlanDetail: TDetailedBalArray;
    PlanDetaildisk: TDetailedBalArray;
    WagesCB : TCheckBoxState;
    PlanSummary: TSummaryBalArray;
  end;

  TReportDataRecPtr = ^TreportDataRecType;TReportDataRecType = record
    Accountno : integer;
    Annualise : Boolean;
    FormatImage : string[50];
    Symbol : string[10];
    AccountTitle : array [0..60] of char;
    PastBalances : TPastBalances;
    PlanTotal: currency;
  end;

  TDepartRecPtr = ^TDepartRecType;TDepartRecType = record
    DeptId : integer;
    Name : string[60];
    CurrencySymbol : string[10];
    ReportCode1 : string[30];
    ReportCode2 : string[30];
    UnitDescS : string[50];
    UnitdescP : string[50];
  end;

  TInvType = (AnalysisInv, PlanInv, MonitorInv);
  TQuoteState = (Newquote, NoInvQuote, InvQuote);
  TRangeType = (RtSales, RtOtherIncome, RtExpenses, RtBalanceSheet);
  TLicCheck = (LCLicOk, LCNoLic, LCInvalidLic);

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
    Quote_Number: String[20];
    Invoice_Number: string[20];
    NetSales: currency;
    materials: currency;
    subcon: currency;
    gross: currency;
    Units: currency;
    Rate: currency;
    gppc: currency;
    LastInv: Boolean;
    ToComplete: Currency;
  end;

  TQuoteSortType =
  (qstAsEntered,
   qstAverageRate,
   qstSales,
   qstGPPC,
   qstQuoteNumber,
   qstdate);

  {Quote Record}
  TQuoteRecPtr = ^TQuoteRec;TQuoteRec = record
    Depart_ID : Integer;
//    Inv_Type : TInvType;
    Quote_Date : TDateTime;
    Quote_LDate : LongInt;
    Quote_Number: array [0..20] of char;
//    Invoice_Number: string[20];
    NetValue: currency;
    materials: currency;
    subcon: currency;
    gross: currency;
    Units: currency;
    Rate: currency;
    gppc: currency;
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

  pVS_FIXEDFILEINFO = ^VS_FIXEDFILEINFO;

type
  TValueList=class(TChartValueList)
  Private
    fType : integer;
    fcumulative : Boolean;
  Protected
    function GetValue(ValueIndex:longint):Double; override;
    procedure SetValue(ValueIndex:Longint;Const AValue:Double); override;
    procedure ClearValues; override;
    function AddChartValue(Const Value: TChartValue):Longint; override;
    procedure InsertChartValue(ValueIndex:Longint; Const Value:TChartValue); override;
  public
    VCArray: ^TDetailedBalArray;
    VDArray: ^TDateTimeArray;
    VCount: integer;
    Property DataType : Integer read fType write fType;
    Property Cumulative : Boolean read fCumulative write fCumulative;
    Constructor Create(AOwner:TChartSeries; Const AName:String); override;
    Function Count:Longint; override;
    Procedure Delete(ValueIndex:Longint); override;
    Procedure Scroll; override;
end;

const

  {---- Common strings----}
    COPYRIGHT  = 'Copyright © 2000 - Auchinlea Pty Ltd';
    RP_CRIGHTNOTICE = 'Copyright © 2000 Auchinlea Pty Ltd - All Rights Reserved';
    PKIR_CRIGHTNOTICE = 'Copyright © 1999 Auchinlea Pty Ltd - All Rights Reserved';

  {Period ranges}
    MAX_YEARS_ANL = 5;   // Maximum number of date ranges in analysis
    MAX_YEARS_PM = 10;   // Maximum number of date ranges in planning and monitoring

  {Account Numbers}
    SALES              = 1;
    FTEPROD            = 7;
    FTEOTHER           = 8;
    POTENTIAL          = 9;
    BILLED             = 10;
    COGS               = 11;    // Materials = COGS - SUBCONTRACTORS
    SUBCONTRACTORS     = 12;
    GROSSPROFIT        = 21;
    FIRSTEXPENSE       = 22;
    TOTALOTHEREXPENSES = 98;
    TOTALEXPENSES      = 99;
    NETOPERATINGPROFIT = 101;
    OTHERINCOME        = 102;
    NETPROFIT          = 111;
    FIRSTBALANCESHEET  = 112;
    ACREC              = 121;
    STOCK              = 131;
    BANK               = 141;
    ACPAY              = 151;
    LASTBALANCESHEET   = 160;
    WBMATERIALS        = 161;
    WBSUBCON           = 162;
    WBMATERIALMU       = 163;
    WBSUBCONMU         = 164;
    WBLABOURMU         = 165;
    WBLABOURRATE       = 166;
    WHATIF             = 199;
    DETAILEDOPT        = 200;
    SALESUNIT          = 1000;
    GPUNIT             = 1001;
    GPPC               = 1002;
    PRODUCTIVITY       = 1003;
    TOTALEXPPC         = 1004;
    NPPC               = 1005;
    TOTALEXPUNIT       = 1006;
    NPUNIT             = 1007;
    SALESWAGE          = 1008;
    GPWAGE             = 1009;
    NPWAGE             = 1010;
    SALESFTE           = 1011;
    GPFTE              = 1012;
    NPFTE              = 1013;
    TOTALFTE           = 1014;
    HRSPERDAY          = 1015;

  {Account Titles for those > 1000}
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
    HOURSPERDAYTITLE = 'Billable Hrs per Staff 8hr Day';

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
    SUMMARYPLANLIST = 23;
    DETAILEDPLANLIST = 12;
    DETAILEDTARGETLIST = 13;
    DETAILPLANGRAPHLIST = 12;
    DETAILEDEDITSTART = 5;
    WORKBACKLIST = 8;
    MONITORSALESLIST = 12;

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
  procedure MDIvsSDI(form : TForm);
  function  mdiSdiParent(mdiParent, sdiParent : TComponent) : TComponent;

  procedure HiBeep;

  Function EncryptPassword(psword: String): string;
  procedure GetScaleFactors(form : TForm; var scaler, divis : integer);
  function FindWindowPartial(className, partTitle : string) : HWND;
  procedure ForceWindowToFront(handle : HWnd);

  function commandLineFlag(flagS : string) : boolean;
  function commandLineArgument(flagS : string; var settingS : string) : boolean;
  function daysInMonth(year, month : Word) : Word;
  function GetlocaleCurrency: string;
  function GetFixedVersionInfo : pVS_FIXEDFILEINFO;

implementation

Constructor TValueList.Create(AOwner:TChartSeries; Const AName:String);
begin
  inherited Create(AOwner,AName);
  VCount:=0;
//  VDArray := @fVDArray;
//  VCArray := @fVCArray;
  Ftype := 0;
end;

{ return a value from the Array }
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

{ set an Array value }
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

{ clear all Array values to zero }
Procedure TValueList.ClearValues;
var t:Longint;
begin
  if fType = 0 then
    if Assigned(VCArray) then
      for t:=0 to Count-1 do VCArray^[t]:=0
    else
    if Assigned(VDArray) then
      for t:=0 to Count-1 do VDArray^[t]:=0;
end;

{ If we use Series1.AddXY or Add methods, fill the Array with the new value }
Function TValueList.AddChartValue(Const Value:TChartValue):Longint;
begin
  if fType = 0 then
    VCArray^[Count]:=Value
  else
    VDArray^[Count]:=Value;
  Inc(VCount);
  result:=VCount-1;
end;

{ Insert a new value in the Array at a specific "ValueIndex" position }
Procedure TValueList.InsertChartValue(ValueIndex:Longint; Const Value:TChartValue);
var t:Longint;
begin
  if ftype = 0
    then begin
    { scroll all values to make room for the new value }
    for t:=Count-1 downto ValueIndex do VCArray^[t+1]:=VCArray^[t];
    VCArray^[ValueIndex]:=Value;
  end
  else begin
    { scroll all values to make room for the new value }
    for t:=Count-1 downto ValueIndex do VDArray^[t+1]:=VDArray^[t];
    VDArray^[ValueIndex]:=Value;
  end;
  Inc(VCount);
end;

{ return the number of points in the Array }
Function TValueList.Count:Longint;
begin
  result:=VCount;
end;

{ delete an Array value }
Procedure TValueList.Delete(ValueIndex:Longint);
var t:Longint;
begin
  if fType = 0 then
    for t:=ValueIndex+1 to Count-1 do VCArray^[t-1]:=VCArray^[t]
  else
    for t:=ValueIndex+1 to Count-1 do VDArray^[t-1]:=VDArray^[t];
  Dec(VCount);
end;

{ circular scrolling of Array points }
Procedure TValueList.Scroll;
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

var
// permute from into to by table
  mtab : array[0..7, 0..63] of char =(
  #13#7#10#0#6#9#5#15#8#4#3#10#11#14#12#5#2#11#9#6#15#12#0#3#4#1#14#13#1#2#7#8#1#2#12#15#10#4#0#3#13#14#6#9#7#8#9#6#15#1#5#12#3#10#14#5#8#7#11#0#4#13#2#11,
  #4#1#3#10#15#12#5#0#2#11#9#6#8#7#6#9#11#14#12#15#0#3#10#5#14#13#7#8#13#14#1#2#13#6#14#9#4#1#2#14#11#13#5#0#1#10#8#3#0#11#3#5#9#4#15#2#7#8#12#15#10#7#6#12,
  #12#9#0#7#9#2#14#1#10#15#3#4#6#12#5#11#1#14#13#0#2#8#7#13#15#5#4#10#8#3#11#6#0#4#6#11#7#9#0#6#4#2#13#1#9#15#3#8#15#3#1#14#12#5#11#0#2#12#14#7#5#10#8#13,
  #2#4#8#15#7#10#13#6#4#1#3#12#11#7#14#0#12#2#5#9#10#13#0#3#1#11#15#5#6#8#9#14#14#11#5#6#4#1#3#10#2#12#15#0#13#2#8#5#11#8#0#15#7#14#9#4#12#7#10#9#1#13#6#3,
  #7#10#1#15#0#12#11#5#14#9#8#3#9#7#4#8#13#6#2#1#6#11#12#2#3#0#4#14#10#13#15#4#13#3#4#9#6#10#1#12#11#0#2#5#0#13#14#2#8#15#7#4#15#1#10#7#5#6#12#11#3#8#9#14,
  #10#13#1#11#6#8#11#5#9#4#12#2#15#3#2#14#0#6#13#1#3#15#4#10#14#9#7#12#5#0#8#7#13#1#2#4#3#6#12#11#0#13#5#14#6#8#15#2#7#10#8#5#4#9#11#5#9#0#14#3#10#7#1#12,
  #15#0#9#5#6#10#12#7#8#7#2#12#3#13#5#2#1#14#7#8#11#4#0#3#14#11#13#6#4#1#10#15#3#13#12#11#15#3#6#0#4#10#1#7#8#4#11#14#13#8#0#6#2#15#9#5#7#1#10#12#14#2#5#9,
  #14#4#3#15#2#13#5#3#13#14#6#9#11#2#0#5#4#1#10#12#15#6#9#10#1#8#12#7#8#11#7#0#0#15#10#5#14#4#12#3#7#8#12#3#13#1#3#6#15#12#6#11#2#9#5#0#4#2#11#14#1#7#8#13);

//	the initial permutation IP, counting from zero
//	N.B. pt0[32] is inverse of IP-1, with halves flipped
  pt0 : array [0..95] of char =
     #57#49#41#33#25#17#9#1#59#51#43#35#27#19#11#3#61#53#45#37#29#21#13#5#63#55#47#39#31#23#15#7#56#48#40#32#24#16#8#0#58#50#42#34#26#18#10#2#60#52#44#36#28#20#12#4#62#54#46#38#30#22#14#6#57#49#41#33#25#17#9#1#59#51#43#35#27#19#11#3#61#53#45#37#29#21#13#5#63#55#47#39#31#23#15#7;

//	the E selection, packing six bits per byte
  pt1 : array[0..63] of char =
	#31#0#1#2#3#4#64#64#3#4#5#6#7#8#64#64#7#8#9#10#11#12#64#64#11#12#13#14#15#16#64#64#15#16#17#18#19#20#64#64#19#20#21#22#23#24#64#64#23#24#25#26#27#28#64#64#27#28#29#30#31#0#64#64;

//	the P permutation, four bits per byte down to 32 bits
  pt2 : array [0..31] of char =
	#27#10#35#40#56#19#51#32#0#26#42#49#8#33#58#17#1#11#43#25#59#50#2#16#34#24#57#9#41#18#3#48;

//	the inverse of IP
  pt3: array [0..63] of char =
	#39#7#47#15#55#23#63#31#38#6#46#14#54#22#62#30#37#5#45#13#53#21#61#29#36#4#44#12#52#20#60#28#35#3#43#11#51#19#59#27#34#2#42#10#50#18#58#26#33#1#41#9#49#17#57#25#32#0#40#8#48#16#56#24;

//	IP-1-1, preceded by flip

  pt4: array [0..63] of char =
	 #7#39#15#47#23#55#31#63#6#38#14#46#22#54#30#62#5#37#13#45#21#53#29#61#4#36#12#44#20#52#28#60#3#35#11#43#19#51#27#59#2#34#10#42#18#50#26#58#1#33#9#41#17#49#25#57#0#32#8#40#16#48#24#56;

  bit: array [0..7] of byte =
       ($01, $02, $04, $08, $10, $20, $40, $80);
// PC1 * LS1 * PC2 */
  p0: array [0..63] of char =
	 #9#50#33#18#48#16#49#128#32#56#1#8#18#41#42#128#2#34#25#24#43#57#10#128#58#0#35#26#17#40#51#128#21#27#38#53#36#3#6#128#46#29#4#52#22#28#45#128#60#20#37#62#14#19#5#128#44#13#12#61#54#30#11#128;
// PC2-1 * LS1 * PC2 */
  p1: array [0..63] of char =
	#10#14#18#30#29#11#13#128#19#4#24#25#22#2#17#1283#27#28#5#26#6#16#128#1#21#9#12#0#8#20#128#57#53#61#46#45#51#59#128#34#32#33#56#52#49#50#128#43#58#41#60#38#62#48#128#36#54#42#35#40#44#37#128;
// PC2-1 * LS1 * LS1 * PC2 */
  p2: array [0..63] of char =
	#24#17#28#20#8#25#2#128#5#29#1#21#16#18#27#128#30#12#0#11#9#13#3#128#14#6#4#22#10#19#26#128#54#62#44#50#49#60#35#128#61#57#53#36#38#58#41#128#56#42#32#40#59#37#43#128#45#48#33#46#34#52#51#128;
//	/* reverse order */
  pt: array [0..15] of Pchar =
	(p1, p2, p2, p2, p2, p2, p2, p1,
         p2, p2, p2, p2, p2, p2, p1, p0);
  kss: array [0..15, 0..7] of char =
        (('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        ('1','2','3','4','5','6','7','8'),
        #0#0#0#0#0#0#0#0);

//         Statics
   amap : array [0..31] of char =
        ('0', '1', '2', '3', '4', '5', '6', '7',
	'8', '9', 'a', 'b', 'c', 'd', 'e', 'f',
	'g', 'h', 'j', 'k', 'n', 'o', 'p', 'q',
	'r', 's', 't', 'u', 'w', 'x', 'y', 'z'
	);


Function EncryptPassword(psword: String): string;
Var
   m, n, sz, min : short;
   ppsword : array [0..29] of char;
   penpsword : array [0..29] of char;
   tbuf : array [0..29] of char;
   buf : array [0..511] of char;
   ks: array [0..15, 0..7] of char;
   p, pend, s : Pchar;

   function _px( tto, ffrom, tab: Pchar; n: Integer): Integer;
   var
      j, val: integer;
   begin
     val := 0;
     n := n - 1;
     while (0 <= n) do
       begin
       j := 7;
       while (j >= 0) do
         begin
         val := val shr 1;
         if (integer(ffrom[integer(tab^) shr integer(3)]) and bit[integer(tab^) and 7]) <> 0 then
           val := val or 128;
         tab := tab + 1;
         j := j - 1;
         end;
       tto^ := char(val);
       tto := tto + 1;
       n := n - 1;
       end;
     result := 1;
   end;

//	build key schedule from key
   function bldks(ks, key: Pchar): Pchar;
   var
     i : integer;
     os, s : Pchar;
   begin
     i := 15;
     os := key;
     s := ks;
     while (i >= 0) do
       begin
       _px(s, os, pt[i], 8);
       os := s;
       s := s + 8;
       i := i - 1;
       end;
     i := (16 * 8) - 1;
     s := ks;
     while (i >= 0) do
       begin
       s^ := char(integer(s^) and integer(#63));
       s := s + 1;
       i := i - 1;
       end;
     result := ks;
   end;

//	encrypt a block of text
   function encrypt(data, ks: Pchar): Pchar;
   var
     j, i : integer;
     pk, pv : Pchar;
     dbuf : array [0..12] of char;
     sbuf : array [0..7] of char;
     ubuf : array [0..3] of char;
     v : char;
   begin
     FillChar(dbuf, SizeOf(dbuf), #0);
     FillChar(sbuf, SizeOf(sbuf), #0);
     FillChar(ubuf, SizeOf(ubuf), #0);
     _px(dbuf, data, @pt0[0], 8);
     pk := ks;
     i := 15;
     while ( i >= 0) do
       begin
       _px(sbuf, @dbuf[4], pt1, 8);
       pv := sbuf;
       j := 7;
       while (j >= 0) do
         begin
         pv^ := mtab[j][integer(pv^) xor integer(pk^)];
         j := j - 1;
         pk := pk + 1;
         end;
       _px(ubuf, sbuf, pt2, 4);
       pv := dbuf;
       j := 3;
       while (j >= 0) do
         begin
         v := pv[4];
         pv[4] := char(integer(pv[0]) xor integer(ubuf[j]));
         pv[0] := v;
         j := j - 1;
         pv := pv + 1;
         end;
       i := i - 1;
       end;
   _px(data, dbuf, pt4, 8);
   result := data;
   end;

// Functions main block
begin
  FillChar(penpsword, SizeOf(penpsword), #0);
  FillChar(tbuf, SizeOf(tbuf), #0);
  FillChar(buf, SizeOf(buf), #0);
  for m := 0 to 15 do
    for n := 0 to 7 do
      ks[m][n] := #0;
  strPcopy(ppsword, psword);
  bldks(@ks[0][0], strPcopy(tbuf, 'Hartley'));
  p := buf;
  s := ppsword;
  while ((s^ <> #0) and (p < @buf[512 - 8])) do
    begin
    n := 0;
    while (n < 8) do
      begin
      p[n] := #0;
      n := n + 1;
      end;
    n := strlen(s);
    min := 8;
    if (n < min) then
      min := n;
    strLcopy(p, s, min);
    s := s + min;
    encrypt(p, @ks[0][0]);
    p := p + 8;
    end;

  if (((p - buf) mod 2) <> 0) then
    begin
    p^ := #0;
    p := p + 1;
    end;
  pend := p;
  s := penpsword;
  p := buf;
  sz := 20;
  while ((p < pend) and (s < @penpsword[sz - 3])) do
    begin
    s^ := amap[integer(p[0]) and integer(#31)];
    s := s + 1;
    s^ := amap[((integer(p[0]) shr 5) and integer(#7)) + ((integer(p[1]) shl 3) and integer(#24))];
    s := s + 1;
    s^ := amap[(integer(p[1]) shr 3) and integer(#31)];
    s := s + 1;
    p := p + 2;
    end;
  s^ := #0;
  result := strpas(penpsword);
end;

procedure MDIvsSDI(form : TForm);
begin
  if (form.owner = Application.MainForm) and
     (Application.MainForm.FormStyle = fsMDIForm) and
     (form.formStyle = fsNormal)
  then begin
    if form.Position <> poScreenCenter then
      form.formStyle := fsMDIChild
    else begin
      form.formStyle := fsMDIChild;
      // MDI doesn't correctly position centered forms because of the tool bar.
      // So move them a bit higher up on the screen.
      form.Top := form.Top div 2;
    end

  end;

end;

function mdiSdiParent(mdiParent, sdiParent : TComponent) : TComponent;
begin
  if Application.MainForm.FormStyle = fsMDIForm then
    result := mdiParent
  else result := sdiParent;
end;

// A global Beep fn that only beeps if HigBeepOnErrorB is set
procedure HiBeep;
begin
  if HigBeepOnErrorB then
    MessageBeep($FFFFFFFF);
end;

// FindWindowPartial - like API function FindWindow, but both className
// and partTitle must be specified, and the title is only required to
// match up to the length of partTitle. This allows it to handle MDI
// windows in which the child has been maximized, and at the same time
// cope with the design-time version of the window if Delphi is open.
function FindWindowPartial(className, partTitle : string) : HWND;
type
  TfindWindowRecord = record
    className : string;
    partTitle : string;
    windowHandle : hWnd;
  end;
  PfindWindowRecord = ^TfindWindowRecord;
var rec : TfindWindowRecord;
//
  function EnumWndProc(handle : hWnd; recP : PFindWindowRecord) : boolean; stdcall;
  var
    classNameCa : array[0 .. 30] of char;
    windowNameCa : array[0 .. 70] of char;
  begin
    result := true;
    GetClassName(handle, classNameCa, 30);
    if strComp(classNameCa, PChar(recP.className)) = 0
    then begin
      GetWindowText(handle, windowNameCa, 70);
      if strLComp(windowNameCa, PChar(recP.partTitle), Length(recP.partTitle)) = 0
      then begin
        recP.windowHandle := handle;
        result := false;
      end;
    end;
  end;

// FindWindowPartial
begin
  rec.windowHandle := 0;
  rec.className := className;
  rec.partTitle := partTitle;
  EnumWindows(@EnumWndProc, Integer(@rec));
  result := rec.windowHandle;
end;

procedure ForceWindowToFront(handle : HWnd);
var
  wndPlc : TWindowPlacement;
begin
  wndPlc.length := sizeof(TWindowPlacement);

  GetWindowPlacement(handle, @wndPlc);
  if wndPlc.showCmd = SW_SHOWMINIMIZED then
    ShowWindow(handle, SW_RESTORE)
  else
    ShowWindow(handle, wndPlc.showCmd);
  BringWindowToTop(handle);
  SetForegroundWindow(handle);
end;

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
    if paramStr(i) = flagS then begin
      result   := true;
      settingS := paramStr(i+1);
      exit;
    end;
end;

// daysInMonth:
function daysInMonth(year, month : Word) : Word;
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

end.

