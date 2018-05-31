unit TargetPDFReports;

interface

Uses windows, graphics, classes, sysutils, auchTypes, DMClient,
    DataCollector, printers, CustomPDFReport, ppReport, ppPaintBox,
    CashFlowReportingEngine, dialogs, TargetDisclaimer;

Type

  TPLTrendReport = class(TCustomReport)
  private
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : Boolean;  Override;
    Function isnonzero(AccountRec : TPlanDataRecPtr): Boolean;
  public
    OffsetTitle : Boolean;
		constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
		destructor Destroy; override;
    function Hasdata(DateIdx : Integer; IsPast : Boolean): Boolean;
    procedure CheckColumns;
    function GetNextPage: Boolean;  Override;
  end;

  TKeyTrendReport = class(TCustomReport)
  private
    function RowOut(AccountRec : TReportDataRecPtr): Boolean;
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : Boolean;  Override;
  public
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
//    property DefaultOrientation;
    function Hasdata(DateIdx : Integer; IsPast : Boolean): Boolean;
    procedure CheckColumns;
    function GetNextPage :Boolean;  Override;
  end;

  TDPLTrendReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
    ExpensesStart : Integer;
    procedure MakeColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
    function PCSalesRowOut(AccountRec : TPlanDataRecPtr): Boolean;
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : boolean;  Override;
  public
    DetailedReportingPeriod : integer;
    OffsetTitle : Boolean;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
//    property DefaultOrientation;
    procedure CheckColumns;
    function GetNextPage:Boolean;  Override;
  end;

  TKeyTargetReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
//    TotalNoColumns: Integer;
//    PageStartColNo, PageEndColNo : integer;
    procedure MakeColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : Boolean;  Override;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    procedure CheckColumns;
    function GetNextPage:Boolean;  Override;
  end;

  TCashFlowReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
//    TotalNoColumns: Integer;
//    PageStartColNo, PageEndColNo : integer;
    TotalAmounts : TSummaryBalArray;
    GroupTotal : Currency;
    ReportRec : TCashFlowReportRecPtr;
    procedure MakeColumns;
    function RowOut(LineTitle: string; AccountRec: TSummaryBalArray; LineTotal: Currency): Boolean;
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : boolean;  Override;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
//    property DefaultOrientation;
    procedure CheckColumns;
    Function BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean): Boolean;
    function GetNextPage:Boolean;  Override;
    procedure CashAccountOut(DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
  end;

  TDetailedWorkingCapitalReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
//    TotalNoColumns: Integer;
//    PageStartColNo, PageEndColNo : integer;
    TotalAmounts : TSummaryBalArray;
    GroupTotal : Currency;
    isAdding : Boolean;
    SectionSizes : Array[1..9] of integer;
    SectionPrinted : Array[1..9] of Boolean;
    ReportRec : TCashFlowReportRecPtr;
    procedure MakeColumns;
    function RowOut(LineTitle: string; AccountRec: TSummaryBalArray; LineTotal: Currency; DecimalPlaces: Integer): Boolean;
    function HasBalance(DataRec : TCashFlowReportRecPtr): Boolean;
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : boolean;  Override;
    procedure Drawlines;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    procedure CheckColumns;
    Function BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean; DecimalPlaces: Integer): Boolean;
    function GetNextPage:Boolean;  Override;
    procedure CashAccountOut(TitlePrefix : string; DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
  end;

  TBalanceSheetReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    isBalanceSheet : Boolean;
    isBalanceRatios : Boolean;
    ChartDates : TDateTimeArray;
//    TotalNoColumns: Integer;
//    PageStartColNo, PageEndColNo : integer;
    TotalAmounts : TSummaryBalArray;
    GroupTotal : Currency;
    SectionSizes : Array[1..9] of integer;
    SectionPrinted : Array[1..9] of Boolean;
    TotalCurrentAssets : TMonthlyBalArray;
    TotalAssets : TMonthlyBalArray;
    TotalCurrentLiabilities : TMonthlyBalArray;
    TotalLiabilities : TMonthlyBalArray;
    TotalEquity : TMonthlyBalArray;
    TotalEBIT : TMonthlyBalArray;
    ReportRec : TCashFlowReportRecPtr;
    procedure MakeColumns;
    function RowOut(LineTitle: string; AccountRec: array of currency; LineTotal: Currency; DecimalPlaces: Integer): Boolean;
//    function HasBalance(DetailArray: TDetailedBalArray): Boolean;
    procedure calcequity;
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    function RepBody : boolean;  Override;
    procedure Drawlines;
    function AnnualiseFactor(periodNo : Integer): extended;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    procedure CheckColumns;
    Function BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean; DecimalPlaces: Integer): Boolean;
    function GetNextPage:Boolean;  Override;
    procedure CashAccountOut(TitlePrefix : string; DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
    Function BSAccountOut(DataRec: TCashFlowReportRecPtr; LineHeight : Integer): Boolean;
  end;

  Var
    Totalpages : integer;
    IsCashFlowReport : Boolean;
    IncludeDisclaimer : Boolean;
    DisclaimerRef, Disclaimer : string;

implementation


{TPLTrendreport}
constructor TPLTrendReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolidate);
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
  DataCollect.checkPNLAdds(True);  // True is for Planning data.
  OffsetTitle := False;
end;

destructor TPLTrendReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;


function TPLTrendReport.GetNextPage: Boolean;
begin
//  Result := False;
  if PageNumber = 1 then
    begin
    if AccountingFmt then
      TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]).AccountTitle := 'Earnings Before Interest, Tax, Depreciation & Amortisation';
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;

  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

function TPLTrendReport.Hasdata(DateIdx : Integer; IsPast : Boolean): Boolean;
var
  AccountRec : TPlanDataRecPtr;
begin
  result := False;
  AccountRec := PlanDataList.Items[getaccountlistindex(SALES)];
  if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not isPast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
  AccountRec := PlanDataList.Items[getaccountlistindex(GROSSPROFIT)];
  if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not isPast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
  AccountRec := PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)];
  if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not Ispast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
  AccountRec := PlanDataList.Items[getaccountlistindex(NETPROFIT)];
  if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not IsPast) and (AccountRec.PlanTotal <> 0)) then
       Result := True;
end;

procedure TPLTrendReport.CheckColumns;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  DetailWidth := TITLEWIDTH;
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.Minorcol = 0 then
      Repcol.start := DetailWidth;
    if Repcol.minorcol = 1 then
      begin
      Repcol.start := DetailWidth;
      DetailWidth := DetailWidth + DOLLARWIDTH;
      end;
    if Repcol.minorcol = 2 then
      begin
      Repcol.start := DetailWidth;
      DetailWidth := DetailWidth + PERCENTWIDTH;
      end;
    end;
end;

procedure TPLTrendReport.RepPageHeader;
var
  I: Integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
  ColY : integer;
	annualiseStr : string;
begin
  CX := LM;
  CY := TM;
  RM := LM + cmtopx(detailWidth);
  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  PDFCanvas.Font.Style := [];
  PDFCanvas.Font.Size := DETAILFONTSIZE;
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  ColY := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      if Repcol.AnnualFactor = 1 then
        AnnualiseStr := ''
      else
        begin
        Annualised := True;
        AnnualiseStr := '*';
				end;
      CY := ColY;
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      PDFCanvas.Font.Style := [fsBold];
      if (Repcol.Source = PAST) then
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Past' + AnnualiseStr)
      else
				CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr);
      CY := CY + Metrics.tmHeight;
      PDFCanvas.Font.Style := [];
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Repcol.FromDate + ' to ' + Repcol.ToDate);
      if NewY > Yext then
        Yext := NewY;
      NewY := CY;
      end;
    end;    // for
  // Output Column Headings for subcolumns
  Yext := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  CY := Yext + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if RepCol.minorcol = 1 then
      begin
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
			CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, DataModuleClient.DepartmentsCURRENCY.AsString);
      end;
    if Repcol.minorcol = 2 then
      begin
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, '%');
      end;
    end;    // for
  CY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      with PDFCanvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), Yext);
        Lineto(DetailOffset + cmtopx(repcol.start) + cmtopx(Repcol.width), Yext);
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;    // with
      end;
    if Repcol.minorCol = 2 then
      begin
      with PDFCanvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), Yext);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;    // with
      end;
    end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
end;

procedure TPLTrendReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      with PDFCanvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;    // with
      end;
    if Repcol.minorCol = 2 then
      begin
      with PDFCanvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;    // with
      end;
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  if Annualised then
    begin
    PDFCanvas.Font.Style := [fsItalic];
    PDFCanvas.Font.Size := 10;
    CY := BM - cmtopx(0.55) - PDFCanvas.TextHeight('A');
    LeftText('* These figures have been Annualised for comparative purposes');
    end;
end;

Function TPLTrendReport.RepBody : Boolean;
var
  I: Integer;
  Metrics: TTextMetric;
  outputExp, outputOI : Boolean;
begin
  Result := False;
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);

  // Set to Baseline
  DrawTop := CY;

  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  if not SectionsComplete[1] then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Income');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    // Rowout(AccountNum)
    if rowout(PlanDataList.Items[getaccountlistindex(SALES)]) then
      CY := CY + Metrics.tmHeight;
// here
    if rowout(PlanDataList.Items[getaccountlistindex(COGS)]) then
      begin
      CY := CY + Metrics.tmHeight ;
      // here we place any direct expenses + Line + the subtotal
      if AccountingFmt then
        begin
        OffsetTitle := True;
        for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
          begin
          // here we only output expense with account group = AGDIRECTEXP
          if TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDIRECTEXP then
            begin
            if rowout(PlanExpDataList.Items[I]) then
              CY := CY + Metrics.tmHeight ;
            end;
          end;    // for
        OffsetTitle := False;
        horzLine(2, 0);
        if rowout(PlanDataList.Items[getaccountlistindex(OTHERDIRECT)]) then
          CY := CY + Metrics.tmHeight ;
        StartIndex := 0; // required for accountfmt
        end;
      horzLine(2, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]) then
      CY := CY + Metrics.tmHeight ;
      end;
    horzLine(1, 0);
    SectionsComplete[1] := True;
    end;
  // Heading
  if SectionsComplete[2] and (Not sectionsComplete[3]) then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderLine];
    LeftinColumn(0, 'Less Expenses (Continued)');
    PDFCanvas.Font.Style := [];
    end;
  if Not SectionsComplete[2] then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderLine];
    LeftinColumn(0, 'Less Expenses');
    PDFCanvas.Font.Style := [];
    SectionsComplete[2] := True;
    end;
  if Not SectionsComplete[3] then
    begin
    CY := CY + Metrics.tmHeight;
    for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
      begin
      outputExp := True;
      // here we only output expense with account group = AGEXPENSES
      if AccountingFmt and (TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group <> AGEXPENSES) then
        outputExp := False;
      if outputexp and (rowout(PlanExpDataList.Items[I])) then
        CY := CY + Metrics.tmHeight ;
// Break here
      if (CY + Metrics.tmHeight * 4) > BM then
        begin
        If I < (PlanExpDataList.count -1) then
          StartIndex := I + 1;
        Result := True;
        exit;
        end;
      end;    // for
    SectionsComplete[2] := True;
    StartIndex := 0; // required for accountfmt
    end;
  if Not SectionsComplete[3] then
    begin
    horzLine(2, 0);
    if rowout(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]) then
      CY := CY + Metrics.tmHeight ;
    SectionsComplete[3] := True;
    if (CY + Metrics.tmHeight * 4) > BM then
      begin
      Result := True;
      exit;
      end;
    end;
  if Not SectionsComplete[4] then
    begin
    horzLine(1, 0);
    if rowout(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]) then
      CY := CY + Metrics.tmHeight ;
    SectionsComplete[4] := True;
    if (CY + Metrics.tmHeight * 5) > BM then
      begin
      Result := True;
      exit;
      end;
    end;
  if Not SectionsComplete[5] then
    begin
    // check that any of these accounts have a nonzero balance
    outputOI := isnonzero(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]);
    if AccountingFmt then
      begin
      I := StartIndex;
      while ((outputOI = False) and (I <= PlanExpDataList.count -1)) do
        begin
        if TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDEPNINT then
          outputOI := isnonzero(PlanExpDataList.Items[I]);
        inc(I);
        end;    // while
      end;
    if OutputOI then
      begin
      if rowout(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]) then
        CY := CY + Metrics.tmHeight ;
      if AccountingFmt then
        begin
        PDFCanvas.Font.Style := [];
        LeftinColumn(0, 'Less');
        CY := CY + Metrics.tmHeight;
        OffsetTitle := True;
        for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
          begin
          // here we only output expense with account group = AGDIRECTEXP
          if TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDEPNINT then
            begin
            if rowout(PlanExpDataList.Items[I]) then
              CY := CY + Metrics.tmHeight ;
            end;
          if (CY + Metrics.tmHeight * 4) > BM then
            begin
            If I < (PlanExpDataList.count -1) then
              StartIndex := I + 1;
            Result := True;
            exit;
            end;
          end;    // for
        OffsetTitle := False;
        horzLine(2, 0);
        if rowout(PlanDataList.Items[getaccountlistindex(DEPNINTEREST)]) then
          CY := CY + Metrics.tmHeight ;
        end;
      horzLine(2, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(NETPROFIT)]) then
        CY := CY + Metrics.tmHeight ;
      end;
    SectionsComplete[5] := True;
    end;
end;

Function TPLTrendReport.isnonzero(AccountRec : TPlanDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I: Integer;
  repcol : TRepColPtr;
begin
  NonZero := False;
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorcol = 1 then
      begin
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)) then
        nonzero := True;
      end;
    end;
  result := nonzero;
end;

function TPLTrendReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I: Integer;
  repcol : TRepColPtr;
	TextAmount : string;
	TextImage : string;
begin
  NonZero := isnonzero(AccountRec);

  if Nonzero then
    begin
    if OffsetTitle then
      LeftinColumn(0, '  ' + AccountRec.AccountTitle)
    else
      LeftinColumn(0, AccountRec.AccountTitle);
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '';
      if Repcol.minorcol = 1 then
        begin
        TextImage := '0';
        if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) then
					textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PastBalances[Repcol.DateIdx - 1] / Repcol.annualFactor);
        if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0) then
          textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanTotal / Repcol.annualFactor);
        end;
      if Repcol.minorcol = 2 then
        begin
        TextImage := '0.0';
        if (Repcol.Source = PAST)
            and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1] <> 0)
            and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0) then
					textAmount := formatFloat(REPORTTENSCURRENCY, AccountRec.PastBalances[Repcol.DateIdx - 1] * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1]);
        if (Repcol.Source = TARGET)
            and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal <> 0)
            and (AccountRec.PlanTotal <> 0) then
          textAmount := formatFloat(REPORTTENSCURRENCY, AccountRec.PlanTotal * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal);
        end;
      if length(textImage) > 0 then
				DecAligninColumn(I, TextAmount, textImage);
      end;    // for
    end;
  Result := NonZero;
end;

{TKeyTrendreport}
constructor TKeyTrendReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolidate);
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  DataCollect.getReportData;
end;

destructor TKeyTrendReport.Destroy;
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TKeyTrendReport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

function TKeyTrendReport.Hasdata(DateIdx : Integer; IsPast : Boolean): Boolean;
var
  AccountRec : TReportDataRecPtr;
begin
  result := False;
  if Assigned(ReportDataList) then
    begin
    AccountRec := reportDataList.Items[getSummarylistindex(SALES)];
    if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not isPast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
    AccountRec := ReportDataList.Items[getSummarylistindex(GROSSPROFIT)];
    if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not isPast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
    AccountRec := ReportDataList.Items[getSummarylistindex(TOTALEXPENSES)];
    if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not Ispast) and (AccountRec.PlanTotal <> 0)) then
        Result := True;
    AccountRec := ReportDataList.Items[getSummarylistindex(NETPROFIT)];
    if ((isPast) and (AccountRec.PastBalances[DateIdx - 1] <> 0)) or
        ((not IsPast) and (AccountRec.PlanTotal <> 0)) then
       Result := True;
    end;
end;

procedure TKeyTrendReport.CheckColumns;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  // Adjust the starting positions for each remaining column
  DetailWidth := TITLEWIDTH;
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    Repcol.start := DetailWidth;
    DetailWidth := DetailWidth + KEYINDICATORWIDTH;
    end;
end;

procedure TKeyTrendReport.RepPageHeader;
var
  ColY: Integer;
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  Subtitle : array[0..15] of char;
	annualiseStr : string;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;
  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  PDFCanvas.Font.Style := [];
  PDFCanvas.Font.Size := SECTIONFONTSIZE;
  GetTextMetrics(PDFCanvas.Handle, Metrics);

 // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Font.Size := DETAILFONTSIZE;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  ColY := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.AnnualFactor = 1 then
      AnnualiseStr := ''
    else begin
      Annualised := True;
      AnnualiseStr := '*';
    end;
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    CY := ColY;
    PDFCanvas.Font.Style := [fsBold];
    if (Repcol.Source = PAST) then
			CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Past' + AnnualiseStr)
    else
			CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr);
    CY := CY + Metrics.tmHeight;
    PDFCanvas.Font.Style := [];
    CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Repcol.FromDate + ' to ' + Repcol.ToDate);
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
end;

procedure TKeyTrendReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(Rightedge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  CY := CY + cmtopx(2.0); // Adjusted to bottom;


  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Font.Size := 10;
  if Annualised then
    I := 1
  else
    I := 2;
  CY := BM - cmtopx(0.55) - PDFCanvas.TextHeight('A') * I;
  LeftText('# TARI = Target Average Rate Index (applicable to Target Period)');
  if Annualised Then
    begin
    PDFCanvas.Font.Style := [fsItalic];
    PDFCanvas.Font.Size := 10;
    CY := BM - cmtopx(0.55) - PDFCanvas.TextHeight('A');
    LeftText('* These figures have been Annualised for comparative purposes.');
    end;
end;

Function TKeyTrendReport.RepBody : Boolean;
var
  I: Integer;
//  colno: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  AccountRec : TReportDataRecPtr;
//  NewY, Yext: integer;
//  Subtitle : array[0..15] of char;
  SectionContainsValidLine : Boolean;
begin
  Result := False;
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // Set to Baseline
  DrawTop := CY;

  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  PDFCanvas.Font.Style := [];
  // Rowout(AccountNum)
  SectionContainsValidLine := False;
  for I := 0 to ReportDataList.count - 1
    do begin
    AccountRec := TReportDataRecPtr(ReportDataList.Items[I]);
    if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
      PDFCanvas.Font.Style := [fsBold]
    else if (AccountRec.Accountno = HRSPERDAY) then
      PDFCanvas.Font.Style := [fsBold,fsItalic]
    else
      PDFCanvas.Font.Style := [];
    if rowout(ReportDataList.Items[I])
      then begin
      CY := CY + Metrics.tmHeight;
      SectionContainsValidLine := True;
    end;
    if SectionContainsValidLine and
      ((AccountRec.Accountno = GPPC) or (AccountRec.Accountno = TOTALEXPPC))
      then begin
      horzLine(2, 0);
      SectionContainsValidLine := False;
    end;
    if SectionContainsValidLine and
      ((AccountRec.Accountno = NPPC) or (AccountRec.Accountno = FTEPROD)
      or (AccountRec.Accountno = NPUNIT) or (AccountRec.Accountno = NPWAGE))
      then begin
      horzLine(1, 0);
      SectionContainsValidLine := False;
    end;
  end;
end;

function TKeyTrendReport.RowOut(AccountRec : TReportDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
  TextImage : string;
begin
  NonZero := false;

  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
      ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
      then nonzero := True;
  end;

  if Nonzero
    then begin
    if AccountRec.Accountno <> GPUNIT then
      LeftinColumn(0, AccountRec.AccountTitle)
    else
      LeftinColumn(0, '# ' + AccountRec.AccountTitle);
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '0';
      if AccountRec.Annualise
        then begin
        if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0))
					then textAmount := formatFloat(AccountRec.FormatImage, AccountRec.PastBalances[Repcol.DateIdx - 1] / Repcol.annualFactor);
        if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)
          then textAmount := formatFloat(AccountRec.FormatImage, AccountRec.PlanTotal / Repcol.annualFactor);
      end
      else begin
        if AccountRec.Symbol <> 'Mins'
          then begin
          if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0))
            then textAmount := formatFloat(AccountRec.FormatImage, AccountRec.PastBalances[Repcol.DateIdx - 1]);
          if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)
            then textAmount := formatFloat(AccountRec.FormatImage, AccountRec.PlanTotal);
        end
        else begin
          if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0))
            then Textamount := inttostr(trunc(AccountRec.PastBalances[RepCol.DateIdx - 1])) + 'hr ' + inttostr(trunc(AccountRec.PastBalances[RepCol.DateIdx - 1] * 60) mod 60) + 'mins';
          if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)
            then textAmount := inttostr(trunc(AccountRec.PlanTotal)) + 'hr ' + inttostr(trunc(AccountRec.PlanTotal * 60) mod 60) + 'mins';
        end;
      end;
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
    end;    // for
  end;
  Result := NonZero;
end;

{TDPLTrendreport}
constructor TDPLTrendReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;
  OffsetTitle := False;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolidate);
  DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
  DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
  DataCollect.checkPNLAdds(True);  // True is for Planning data.
  BodyFontSize := 8;
  ExpensesStart := 0;
  //  ColMargin := 0.05;
  Narrowrep := False;
end;

destructor TDPLTrendReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TDPLTrendReport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    if AccountingFmt then
      TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]).AccountTitle := 'Earnings Before Interest, Tax, Depreciation & Amortisation';
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TDPLTrendReport.CheckColumns;
var
  I: Integer;
  j, kk: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
  realCols : integer;
begin
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
    begin
    RealCols := createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value);
    TotalNoColumns :=  Realcols + 1;
    end
  else
    begin
    Realcols := DaysinYear + 1;
    TotalNoColumns := RealCols + 1;
    end;
//  PageStartColNo := 0;
//  if TotalNoColumns < 15
//    then PageEndColNo := TotalNoColumns - 1
//  else PageEndColNo := 14;   // Set up the first 15 columns

  for j := 0 to 6 do    // Iterate  // Use 6 as this only need
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(SummaryPlan[j])];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    if DetailedReportingPeriod > 0 then
      begin
      SummaryPtr.PlanTotal := 0;
      for I := 0 to RealCols - 1 do    // Iterate
        SummaryPtr.PlanTotal := SummaryPtr.PlanTotal + SummaryPtr.PlanSummary[I];
      end;
    end;    // for
  if AccountingFmt then
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(OTHERDIRECT)];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    if DetailedReportingPeriod > 0 then
      begin
      SummaryPtr.PlanTotal := 0;
      for I := 0 to RealCols - 1 do    // Iterate
        SummaryPtr.PlanTotal := SummaryPtr.PlanTotal + SummaryPtr.PlanSummary[I];
      end;
    setAccount(SummaryPtr);
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(DEPNINTEREST)];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    if DetailedReportingPeriod > 0 then
      begin
      SummaryPtr.PlanTotal := 0;
      for I := 0 to RealCols - 1 do    // Iterate
        SummaryPtr.PlanTotal := SummaryPtr.PlanTotal + SummaryPtr.PlanSummary[I];
      end;
    setAccount(SummaryPtr);
    end;
    
  for j := 0 to PlanExpDataList.count - 1 do
    Begin    // Iterate
    SummaryPtr := PlanExpDataList.Items[J];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    if DetailedReportingPeriod > 0 then
      begin
      SummaryPtr.PlanTotal := 0;
      for I := 0 to RealCols - 1 do    // Iterate
        SummaryPtr.PlanTotal := SummaryPtr.PlanTotal + SummaryPtr.PlanSummary[I];
      end;
    end;
//  sortExpenseList(True);  This appears unnecessary

  // Find any zero accounts
  for J := 0 to 6 do    // Iterate
    setAccount(PlanDataList.Items[J]);
  for J := 0 to PlanExpDataList.count -1 do    // Iterate
    setAccount(PlanExpDataList.Items[J]);

  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
  end;
  if DetailedReportingPeriod > 4
    then begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
  end
  else
    DefaultOrientation := poLandscape;
  kk := Realcols;
  if RealCols > NUM_COLUMNS then
    KK := NUM_COLUMNS - 1;
  Narrowrep := False;
  if (DetailedReportingPeriod > 4) then
    begin
    Narrowrep := True;
    DefaultOrientation := poPortrait;
    DetailWidth := TITLEWIDTH + TotalNoColumns * DOLLARWIDTH;
    end
  else
    begin
    if RealCols > (NUM_COLUMNS - 1) then
      DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
    else
      DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
    DefaultOrientation := poLandscape;
    end;
  RightEdge := DetailWidth;
end;

procedure TDPLTrendReport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  ColY : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    PDFCanvas.Font.Size :=   DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDFCanvas.Font.Style := [fsBold];
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    if (PageStartColNo + I) <> TotalNoColumns then
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx]))
    else
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Total');
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(Rightedge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
end;

procedure TDPLTrendReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  CY := CY + cmtopx(2.0);
end;

Function TDPLTrendReport.RepBody : Boolean;
var
  I: Integer;
  Metrics: TTextMetric;
  NewPage : Boolean;
  outputExp, outputOI : Boolean;
begin
  PDFCanvas.Font.Name := CurrentFont;
  NewPage := True;
  if NarrowRep then
    PDFCanvas.Font.Size := DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
   // Set to Baseline
  DrawTop := CY;
  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  PDFCanvas.Font.Style := [];
  if not SectionsComplete[1] then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Income');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    // Rowout(AccountNum)
    if rowout(PlanDataList.Items[getaccountlistindex(SALES)]) then
      CY := CY + Metrics.tmHeight;
    if rowout(PlanDataList.Items[getaccountlistindex(COGS)]) then
      begin
      CY := CY + Metrics.tmHeight ;
      // here we place any direct expenses + Line + the subtotal
      if AccountingFmt then
        begin
        OffsetTitle := True;
        for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
          begin
          // here we only output expense with account group = AGDIRECTEXP
          if TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDIRECTEXP then
            begin
            if rowout(PlanExpDataList.Items[I]) then
              CY := CY + Metrics.tmHeight ;
            end;
          end;    // for
        OffsetTitle := False;
        horzLine(2, 0);
        if rowout(PlanDataList.Items[getaccountlistindex(OTHERDIRECT)]) then
          CY := CY + Metrics.tmHeight ;
        StartIndex := 0; // required for accountfmt
        end;
      horzLine(1, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]) then
        begin
        CY := CY + Metrics.tmHeight ;
        PCSalesRowOut(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]);
        CY := CY + Metrics.tmHeight ;
        end;
      end;
    horzLine(1, 0);
    // Heading
    PDFCanvas.Font.Style := [fsBold, fsUnderLine];
    NewPage := False;
    SectionsComplete[1] := True;
    end;
  // Section 2 = Expenses Started
  // Section 3 = Expenses Completed
  If SectionsComplete[2] and (not SectionsComplete[3]) Then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Expenses (Continued)');
    PDFCanvas.Font.Style := [];
    NewPage := False;
    end;

  if Not SectionsComplete[2] then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Less Expenses');
    PDFCanvas.Font.Style := [];
    NewPage := False;
    end;

  if not SectionsComplete[2] or (Not SectionsComplete[3]) then
    begin
    SectionsComplete[2] := True;
    CY := CY + Metrics.tmHeight;
    for I := ExpensesStart to PlanExpDataList.count -1 do    // Iterate
      begin
      outputExp := True;
      // here we only output expense with account group = AGEXPENSES
      if AccountingFmt and (TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group <> AGEXPENSES) then
        outputExp := False;
      if outputexp and (rowout(PlanExpDataList.Items[I])) then
        CY := CY + Metrics.tmHeight ;
      if (CY + Metrics.tmHeight * 7) > BM then
        begin
        If I < (PlanExpDataList.count -1) then
          ExpensesStart := I + 1;
        Result := True;
        exit;
        end;
      end;    // for
    SectionsComplete[3] := True;
    NewPage := False;
    end;
  if not SectionsComplete[4] then
    begin
    if Not NewPage then
      horzLine(2, 0);
    if rowout(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]) then
      begin
      CY := CY + Metrics.tmHeight ;
      PCSalesRowOut(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
      CY := CY + Metrics.tmHeight ;
      end;
    NewPage := False;
    SectionsComplete[4] := True;
    if (CY + Metrics.tmHeight * 7) > BM then
      begin
      Result := True;
      exit;
      end;
    end;
  if not SectionsComplete[5] then
    begin
    if Not NewPage then
      horzLine(1, 0);
    //  CY := CY + Metrics.tmHeight;
    if rowout(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]) then
      begin
      CY := CY + Metrics.tmHeight ;
      PCSalesRowOut(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]);
      CY := CY + Metrics.tmHeight ;
      horzLine(1, 0);
      end;
    SectionsComplete[5] := True;
    if (CY + Metrics.tmHeight * 7) > BM then
      begin
      Result := True;
      exit;
      end;
    end;
  if not SectionsComplete[6] then
    begin
    outputOI := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]).Nonzero;
    if AccountingFmt then
      begin
      for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
        begin
        // here we only output expense with account group = AGDIRECTEXP
        if (TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDEPNINT) and (TPlanDataRecPtr(PlanExpDataList.Items[I]).Nonzero) then
          outputOI := True;
        end;
      end;
    if outputOI then
      begin
      if rowout(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]) then
        CY := CY + Metrics.tmHeight ;
      if AccountingFmt then
        begin
        PDFCanvas.Font.Style := [];
        LeftinColumn(0, 'Less');
        CY := CY + Metrics.tmHeight;
        OffsetTitle := True;
        for I := StartIndex to PlanExpDataList.count -1 do    // Iterate
          begin
          // here we only output expense with account group = AGDIRECTEXP
          if TPlanDataRecPtr(PlanExpDataList.Items[I]).Account_Group = AGDEPNINT then
            begin
            if rowout(PlanExpDataList.Items[I]) then
              CY := CY + Metrics.tmHeight ;
            end;
          end;    // for
        OffsetTitle := False;
        horzLine(2, 0);
        if rowout(PlanDataList.Items[getaccountlistindex(DEPNINTEREST)]) then
          CY := CY + Metrics.tmHeight ;
        end;
      horzLine(1, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(NETPROFIT)]) then
        begin
        CY := CY + Metrics.tmHeight ;
        PCSalesRowOut(PlanDataList.Items[getaccountlistindex(NETPROFIT)]);
        CY := CY + Metrics.tmHeight ;
        end;
      end;
    SectionsComplete[6] := True;
    end;
    PageStartColNo := PageEndColNo + 1;
    PageEndColNo := PageStartColNo + NUM_COLUMNS - 1;
    if PageEndColNo > (TotalNoColumns - 1) then
      PageEndColNo := TotalNoColumns - 1;
    ExpensesStart := 0;
    Result := False;
    Initsections;
    if PageStartColNo < TotalNoColumns then
      Result := True;
end;

function TDPLTrendReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
begin
  if AccountRec.Nonzero then
    begin
    if OffsetTitle then
      LeftinColumn(0, '  ' + AccountRec.AccountTitle)
    else
      LeftinColumn(0, AccountRec.AccountTitle);
    TextImage := '0';
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanTotal)
      else
        begin
        if DetailedReportingPeriod = 0 then
          textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanDetail[RepCol.DateIdx])
        else
					textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanSummary[RepCol.DateIdx]);
        end;
			DecAligninColumn(I, TextAmount, textImage);
      end;
    end;
  Result := AccountRec.Nonzero;
end;

function TDPLTrendReport.PCSalesRowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
  SalesRec : TPlanDataRecPtr;
begin
  if AccountRec.Nonzero
    then begin
    SalesRec := PlanDataList.Items[getaccountlistindex(SALES)];
    LeftinColumn(0, AccountRec.AccountTitle + ' %');
    TextImage := '0';
    TextAmount := '-';
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if RepCol.source = 1
        then begin
        if SalesRec.PlanTotal <> 0 then
					textAmount := formatfloat(REPORTTENSCURRENCY, AccountRec.PlanTotal * 100 / SalesRec.PlanTotal);
      end
      else begin
        if DetailedReportingPeriod = 0
          then begin
          if SalesRec.PlanDetail[RepCol.DateIdx] <> 0 then
            textAmount := formatfloat(REPORTTENSCURRENCY, AccountRec.PlanDetail[RepCol.DateIdx] * 100 / SalesRec.PlanDetail[RepCol.DateIdx]);
        end
        else begin
        if SalesRec.PlanSummary[RepCol.DateIdx] <> 0 then
            textAmount := formatfloat(REPORTTENSCURRENCY, AccountRec.PlanSummary[RepCol.DateIdx] * 100 / SalesRec.PlanSummary[RepCol.DateIdx]);
        end;
      end;
			DecAligninColumn(I, TextAmount, textImage);
    end;
  end;
  Result := AccountRec.Nonzero;
end;

procedure TDPLTrendReport.MakeColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  cx : Extended;
begin
  Columns.clear;
  cx := 0;
  New(Repcol);
  Repcol.Majorcol := 1;
  repcol.Minorcol := 0;
  Repcol.Start := cx;
  if Narrowrep then
    Repcol.Width := TITLEWIDTH
  else
    Repcol.Width := DETAILEDTITLEWIDTH;
  cx := cx + Repcol.Width;
  Columns.add(Repcol);
  for I := 0 to (PageEndColNo - PageStartColNo) do    // Iterate
    begin
    New(Repcol);
    Repcol.Majorcol := I + 2;
    repcol.Minorcol := 0;
    Repcol.Start := cx;
    Repcol.Source := 0; // Normal Balances
    if Narrowrep then
      Repcol.Width := DOLLARWIDTH
    else
      Repcol.Width := DETAILEDCOLWIDTH;
    Repcol.DateIdx := PageStartColNo + I;
    if (PageStartColNo + I + 1) = TotalNoColumns
      then begin
      if Narrowrep then
        Repcol.Width := DOLLARWIDTH
      else
        Repcol.Width := DETAILEDTOTALCOLWIDTH;
      Repcol.DateIdx := PageStartColNo + I;
      Repcol.Source := 1; // Use Totals for this Column
    end;
    cx := cx + Repcol.Width;
    Columns.add(Repcol);
  end;    // for
  RightEdge := cx;
end;

procedure TDPLTrendReport.SetAccount(AccountRec : TPlanDataRecPtr);
var
  daysinyear: Integer;
  I: Integer;
begin
  AccountRec.Nonzero := False;
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  I := 0;
  while (I < DaysinYear) and (not AccountRec.NonZero) do    // Iterate
    begin
    if ((I = 0) and (AccountRec.PlanTotal <> 0)) or (AccountRec.PlanDetail[I] <> 0) then
      AccountRec.Nonzero := True;
    inc(I);
  end;
end;

{TKeyTargetReport}
constructor TKeyTargetReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolidate);
  if DataCollect.Planloaded = false then
    begin
    DataCollect.psdate := DataModuleClient.DepartmentsCurrentPlanStart.value;
    DataCollect.pedate := DataModuleClient.DepartmentsCurrentPlanEnd.value;
    DataCollect.getPlanningData;
    end;

  BodyFontSize := 8;
//  ColMargin := 0.05;
  Narrowrep := False;
end;

destructor TKeyTargetReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TKeyTargetReport.CheckColumns;
var
  j, kk: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
  realCols : integer;
begin

  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
    begin
    RealCols := createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value);
    TotalNoColumns :=  Realcols + 1;
    end
  else
    begin
    Realcols := DaysinYear + 1;
    TotalNoColumns := RealCols + 1;
    end;
//  PageStartColNo := 0;
//  if TotalNoColumns < 15
//    then PageEndColNo := TotalNoColumns - 1
//  else PageEndColNo := 14;   // Set up the first 15 columns

  for J := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) do
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(KeyTargets[j])];
    BuildSummary(SummaryPtr.Accountno, DataModuleClient.DepartmentsCURRENTPLANSTART.Value, DataModuleClient.DepartmentsCURRENTPLANEND.Value, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    end;

  DataCollect.CalculateKeys(TotalNoColumns, DetailedReportingPeriod);
  // Find any zero accounts
  for J := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1)
    do setAccount(PlanDataList.Items[getaccountlistindex(KeyTargets[J])]);

  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCurrentPlanStart.value + SummaryPeriodIndexArray[j];
    end;

  if DetailedReportingPeriod > 4 then
    begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
    end
  else
    DefaultOrientation := poLandscape;
  KK := realCols;
  if RealCols > NUM_COLUMNS then
    KK := NUM_COLUMNS - 1;
  Narrowrep := False;
  if (DetailedReportingPeriod > 4) then
    begin
    Narrowrep := True;
    DefaultOrientation := poPortrait;
    DetailWidth := TITLEWIDTH + TotalNoColumns * DOLLARWIDTH;
    end
  else
    begin
    if RealCols > NUM_COLUMNS then
      DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
    else
      DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
    DefaultOrientation := poLandscape;
    end;
  RightEdge := DetailWidth;
end;

function TKeyTargetReport.GetNextPage : Boolean;
begin

  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TKeyTargetReport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  ColY : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  PDFCanvas.Font.Style := [];
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    PDFCanvas.Font.Size :=   DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDFCanvas.Font.Style := [fsBold];
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    if (PageStartColNo + I) <> TotalNoColumns then
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx]))
    else
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Total');
    if NewY > Yext then Yext := NewY;
    NewY := CY;
    end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
end;

procedure TKeyTargetReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
end;

Function TKeyTargetReport.RepBody : Boolean;
var
  I: Integer;
//  colno: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
//  repcol : TRepColPtr;
//  NewY, Yext: integer;
//  Subtitle : array[0..15] of char;
  SectionContainsValidLine : Boolean;
  AccountRec : TPlanDataRecPtr;
  DataRec : TPlanDataRecPtr;
begin
  PDFCanvas.Font.Name := CurrentFont;
  if NarrowRep then
    PDFCanvas.Font.Size := DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);

  // Set to Baseline
  DrawTop := CY;
  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  PDFCanvas.Font.Style := [];
  // Rowout(AccountNum)
  SectionContainsValidLine := False;
  for I := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) Do
    begin
    AccountRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(KeyTargets[I])]);
    if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
      PDFCanvas.Font.Style := [fsBold]
    else if (AccountRec.Accountno = HRSPERDAY) then
      PDFCanvas.Font.Style := [fsBold, fsItalic]
    else
      PDFCanvas.Font.Style := [];
    if AccountRec.Accountno = NETOPERATINGPROFIT then
      begin
      DataRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]);
      AccountRec.Nonzero := DataRec.Nonzero;
      end;
    if rowout(AccountRec) Then
      begin
      CY := CY + Metrics.tmHeight;
      SectionContainsValidLine := True;
      end;
    if SectionContainsValidLine and (AccountRec.Accountno = GPPC) Then // or (AccountRec.Accountno = TOTALEXPPC))
      begin
      horzLine(2, 0);
      SectionContainsValidLine := False;
      end;
    if SectionContainsValidLine and
        ((AccountRec.Accountno = NETPROFIT) or (AccountRec.Accountno = HRSPERDAY)) then
      begin
      horzLine(1, 0);
      SectionContainsValidLine := False;
      end;
    end;
  PageStartColNo := PageEndColNo + 1;
  PageEndColNo := PageStartColNo + NUM_COLUMNS - 1;
  if PageEndColNo > (TotalNoColumns - 1) then
    PageEndColNo := TotalNoColumns - 1;
  Result := False;
  if PageStartColNo < TotalNoColumns then
    Result := True;
end;

function TKeyTargetReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
  SmallerFont : Boolean;
begin
  if AccountRec.Nonzero then
    begin
    if AccountRec.Accountno <> GPUNIT then
      LeftinColumn(0, AccountRec.AccountTitle)
    else
      LeftinColumn(0, '# ' + AccountRec.AccountTitle);
    TextImage := '0';
    SmallerFont := False;
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if AccountRec.FormatImage <> 'Mins' then
        begin
        if RepCol.source = 1 then
          textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanTotal)
				else
          begin
          if DetailedReportingPeriod = 0 then
            textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanDetail[RepCol.DateIdx])
					else
						textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanSummary[RepCol.DateIdx]);
          end;
        end
      else
        begin
        SmallerFont := True;
        PDFCanvas.Font.Size := PDFCanvas.Font.Size - 1;
        if (Repcol.Source = 1) then
          Textamount := inttostr(trunc(AccountRec.PlanTotal)) + 'hr ' + inttostr(trunc(AccountRec.PlanTotal * 60) mod 60) + 'mins'
        else
          begin
          if DetailedReportingPeriod = 0 then
            textAmount := inttostr(trunc(AccountRec.PlanDetail[RepCol.DateIdx])) + 'hr ' + inttostr(trunc(AccountRec.PlanDetail[RepCol.DateIdx] * 60) mod 60) + 'mins'
					else
            textAmount := inttostr(trunc(AccountRec.PlanSummary[RepCol.DateIdx])) + 'hr ' + inttostr(trunc(AccountRec.PlanSummary[RepCol.DateIdx] * 60) mod 60) + 'mins';
          end;
        end;
			DecAligninColumn(I, TextAmount, textImage);
      if SmallerFont then
        begin
        PDFCanvas.Font.Size := PDFCanvas.Font.Size + 1;
        SmallerFont := False;
        end;
      end;
    end;
  Result := AccountRec.Nonzero;
end;

procedure TKeyTargetReport.MakeColumns;
var
  I : Integer;
  repcol : TRepColPtr;
  cx : Extended;
begin
  Columns.clear;
  cx := 0;
  New(Repcol);
  Repcol.Majorcol := 1;
  Repcol.Start := cx;
  if Narrowrep then
    Repcol.Width := TITLEWIDTH
  else
    Repcol.Width := DETAILEDTITLEWIDTH;
  cx := cx + Repcol.Width;
  Columns.add(Repcol);
  for I := 0 to (PageEndColNo - PageStartColNo) do    // Iterate
    begin
    New(Repcol);
    Repcol.Majorcol := I + 2;
    Repcol.Start := cx;
    Repcol.Source := 0; // Normal Balances
    if Narrowrep then
      Repcol.Width := DOLLARWIDTH
    else
      Repcol.Width := DETAILEDCOLWIDTH;
    Repcol.DateIdx := PageStartColNo + I;
    if (PageStartColNo + I + 1) = TotalNoColumns then
      begin
      if Narrowrep then
        Repcol.Width := DOLLARWIDTH
      else
        Repcol.Width := DETAILEDTOTALCOLWIDTH;
      Repcol.DateIdx := PageStartColNo + I;
      Repcol.Source := 1; // Use Totals for this Column
      end;
    cx := cx + Repcol.Width;
    Columns.add(Repcol);
    end;    // for
  RightEdge := cx;
end;

procedure TKeyTargetReport.SetAccount(AccountRec : TPlanDataRecPtr);
var
  daysinyear: Integer;
  I: Integer;
begin
  AccountRec.Nonzero := False;
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  I := 0;
  while (I < DaysinYear) and (not AccountRec.NonZero) do    // Iterate
    begin
    if ((I = 0) and (AccountRec.PlanTotal <> 0)) or (AccountRec.PlanDetail[I] <> 0) then
      AccountRec.Nonzero := True;
    inc(I);
    end;
end;

{TCashFlowreport}
constructor TCashFlowReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := True;
  DataCollect.GetConsolidatedList(DataModuleClient.CashFlowDeptDEPT_ID.Value, Consolidate);
  CFREngine := TCashFlowReportingEngine.create(REPCASHFLOW, Consolid, DataModuleClient.BusinessesTARGET_START.Value, DataModuleClient.BusinessesTARGET_END.Value, 4);
  BodyFontSize := 8;
  Narrowrep := False;
end;

destructor TCashFlowReport.Destroy;
begin
//  Cashfe.CheckBank;
  CFREngine.Destroy;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TCashFlowReport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TCashFlowReport.CheckColumns;
var
  j, kk: Integer;
//  DaysinYear : integer;
//  SummaryPtr : TPlanDataRecPtr;
  realCols : integer;
begin
  realCols := CFREngine.PeriodCount;
  TotalNoColumns :=  Realcols + 1;
{  if DetailedReportingPeriod > 0 then
    begin
    RealCols := createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value);
    TotalNoColumns :=  Realcols + 1;
    end
  else
    begin
    Realcols := DaysinYear + 1;
    TotalNoColumns := RealCols + 1;
    end;
}
//  PageStartColNo := 0;
//  if TotalNoColumns < 15
//    then PageEndColNo := TotalNoColumns - 1
//  else PageEndColNo := 14;   // Set up the first 15 columns

{  for j := 0 to 6 do    // Iterate  // Use 6 as this only need
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(SummaryPlan[j])];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
    end;    // for
  for j := 0 to PlanExpDataList.count - 1 do
    Begin    // Iterate
    SummaryPtr := PlanExpDataList.Items[J];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
  end;
  sortExpenseList(True);
}
  // Find any zero accounts
{
  for J := 0 to 6 do    // Iterate
    setAccount(PlanDataList.Items[J]);
  for J := 0 to PlanExpDataList.count -1 do    // Iterate
    setAccount(PlanExpDataList.Items[J]);
}
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := CFREngine.psdate + j
    else
      ChartDates[j] := CFREngine.psdate + SummaryPeriodIndexArray[j];
    end;
  if DetailedReportingPeriod > 4 then
    begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
    end
  else
    DefaultOrientation := poLandscape;
  kk := Realcols;
//  if RealCols > 15 then
//    KK := 14;
  Narrowrep := False;
{  if (DetailedReportingPeriod > 4) then
    begin
    Narrowrep := True;
    DefaultOrientation := poPortrait;
    DetailWidth := TITLEWIDTH + TotalNoColumns * DOLLARWIDTH;
    end
  else
    begin
}
  if RealCols > (NUM_COLUMNS - 1) then
    DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
  else
    DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
  DefaultOrientation := poLandscape;
//    end;
  RightEdge := DetailWidth;
end;

procedure TCashFlowReport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  ColY : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    PDFCanvas.Font.Size :=   DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDFCanvas.Font.Style := [fsBold];
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    if (PageStartColNo + I) <> TotalNoColumns then
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx]))
    else
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Full Period');
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(Rightedge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
end;

procedure TCashFlowReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  CY := CY + cmtopx(2.0);
end;

Function TCashFlowReport.RepBody : Boolean;
var
  I: Integer;
  Metrics: TTextMetric;
//  BankSummary : TSummaryBalArray;
begin
  PDFCanvas.Font.Name := CurrentFont;
  if NarrowRep then
    PDFCanvas.Font.Size := DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
   // Set to Baseline
  DrawTop := CY;
  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);

  PDFCanvas.Font.Style := [];
  // Rowout(BankAccount - Opening Balance)
//  if Cashfe.BankisOD then
//    Cashfe.CorrectBankAccount(True);
  CFREngine.GetAccountRec(CASH_AT_BANK, ReportRec);
  BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, ReportRec.OpeningBalance, True);
  rowout('Opening Bank Balance', ReportRec.PlanSummary, ReportRec.OpeningBalance);
  CY := CY + Metrics.tmHeight;
  horzLine(1, 0);
  PDFCanvas.Font.Style := [fsBold];
  LeftinColumn(0, 'Add - Receipts');
  CY := CY + Metrics.tmHeight;
  for I := 0 to NUM_WEEKS do    // Iterate
    TotalAmounts[I] := 0;
  GroupTotal := 0;
  PDFCanvas.Font.Style := [];
  // Rowout(AR Cash Receipts)
  CashAccountOut(CFREngine.GetAccountRec(CASH_RECEIPTS_AR, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(MARKET_SEC_SALES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(CASH_MAN_WITHDRAWALS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(OTHER_ASSETS_SALES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(NON_DEP_ASSET_SALES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(DEP_ASSET_SALES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(INTANG_ASSET_SALES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(OTHER_LIAB_INCURRED, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(EQUITY_INJECTED, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(LOANS_INCURRED, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(AR_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(ST_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(OTHERINCOME, ReportRec), Metrics.tmHeight);
  horzLine(2, 0);
//  CY := CY + Metrics.tmHeight;
  rowout('Total Receipts', TotalAmounts, GroupTotal);
  CY := CY + Metrics.tmHeight;
  horzLine(2, 0);
//  CY := CY + Metrics.tmHeight;
  PDFCanvas.Font.Style := [fsBold];
  LeftinColumn(0, 'Subtract - Payments');
  CY := CY + Metrics.tmHeight;
  for I := 0 to NUM_WEEKS do    // Iterate
    TotalAmounts[I] := 0;
  GroupTotal := 0;
  PDFCanvas.Font.Style := [];
  // Rowout(AR Cash Receipts)
  CashAccountOut(CFREngine.GetAccountRec(CASH_PAYMENTS_AP, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(CASH_PAYMENTS_AE, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(CASH_MAN_DEPOSITS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(MARKET_SEC_PURCHASES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(OTHER_ASSETS_PURCHASES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(NON_DEP_ASSET_PURCHASES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(DEP_ASSET_PURCHASES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(INTANG_ASSET_PURCHASES, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(TAXPAID_REFUND, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(INC_TAX_PAID, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(DIV_PAID, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(OTHER_LIAB_PAID, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(LOANS_REPAID, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(EQUITY_WITHDRAWN, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(AP_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(AE_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
  CashAccountOut(CFREngine.GetAccountRec(TAX_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
  horzLine(2, 0);
  rowout('Total Payments', TotalAmounts, GroupTotal);
  CY := CY + Metrics.tmHeight;
  horzLine(1, 0);
  CFREngine.GetAccountRec(CASH_AT_BANK, ReportRec);
  BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False);
  rowout('Closing Bank Balance', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount - 1]);
//  if Cashfe.BankisOD then
//    Cashfe.CorrectBankAccount(False);
  CY := CY + round(Metrics.tmHeight / 2);

  PageStartColNo := PageEndColNo + 1;
  PageEndColNo := PageStartColNo + NUM_COLUMNS - 1;
  if PageEndColNo > (TotalNoColumns - 1) then
    PageEndColNo := TotalNoColumns - 1;
  Result := False;
  if PageStartColNo < TotalNoColumns then
    Result := True;
end;

function TCashFlowReport.RowOut(LineTitle: string; AccountRec: TSummaryBalArray; LineTotal: Currency): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
  TextImage : string;
begin
  LeftinColumn(0, LineTitle);
  TextImage := '0';
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if RepCol.source = 1 then
      textAmount := formatfloat(REPORTROUNDCURRENCY, LineTotal)
		else
      textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec[RepCol.DateIdx]);
    DecAligninColumn(I, TextAmount, textImage);
    end;
  Result := True;
end;

procedure TCashFlowReport.MakeColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  cx : Extended;
begin
  Columns.clear;
  cx := 0;
  New(Repcol);
//  Repcol.ColNo := 0;
  Repcol.Start := cx;
  if Narrowrep then
    Repcol.Width := TITLEWIDTH
  else
    Repcol.Width := DETAILEDTITLEWIDTH;
  cx := cx + Repcol.Width;
  repcol.Majorcol := 1;
  repcol.Minorcol := 0;
  Columns.add(Repcol);
  for I := 0 to (PageEndColNo - PageStartColNo) do    // Iterate
    begin
    New(Repcol);
//    Repcol.ColNo := intostr(I + 1);
    repcol.Majorcol := I + 2;
    repcol.Minorcol := 0;
    Repcol.Start := cx;
    Repcol.Source := 0; // Normal Balances
    if Narrowrep then
      Repcol.Width := DOLLARWIDTH
    else
      Repcol.Width := DETAILEDCOLWIDTH;
    Repcol.DateIdx := PageStartColNo + I;
    if (PageStartColNo + I + 1) = TotalNoColumns
      then begin
      if Narrowrep then
        Repcol.Width := DOLLARWIDTH
      else
        Repcol.Width := DETAILEDTOTALCOLWIDTH;
      Repcol.DateIdx := PageStartColNo + I;
      Repcol.Source := 1; // Use Totals for this Column
    end;
    cx := cx + Repcol.Width;
    Columns.add(Repcol);
  end;    // for
  RightEdge := cx;
end;

Function TCashFlowReport.BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean): Boolean;
var
  K: Integer;
begin
  ArrayTotal := 0;
  Result := False;
  K := 0;
  while SummaryPeriodIndexArray[k] <> 0 do
    begin
    if Not IsOpeningBal then
      begin
      SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]]);
      ArrayTotal := ArrayTotal + SummaryArray[K];
      if (Result = False) and (SummaryArray[K] <> 0) then
        Result := True;
      end
    else
      begin
      if K = 0 then
        SummaryArray[K] := OpeningBal
      else
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k - 1]]);
      end;
    inc(k);
    end;    // while
end;

procedure TCashFlowReport.CashAccountOut(DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
var
  I : Integer;
  HasBalance : Boolean;
begin
  for I := 0 to NUM_DAYSINYEAR do    // Iterate
    DataRec.PlanDetail[I] := round(DataRec.PlanDetail[I]);
  BuildSummary(DataRec.Accountno, CFREngine.psdate, CFREngine.pedate, DataRec.PlanDetail, DataRec.planSummary);
  HasBalance := False;
  DataRec.PlanTotal := 0;
  for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
    begin
    if (HasBalance = False) and (DataRec.PlanSummary[I] <> 0) then
      HasBalance := True;
    DataRec.PlanTotal := DataRec.PlanTotal + DataRec.PlanSummary[I];
    end;
  if HasBalance then
    begin
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      Totalamounts[I] := TotalAmounts[I] + DataRec.PlanSummary[I];
    GroupTotal := GroupTotal + DataRec.PlanTotal;
    rowout(DataRec.AccountTitle, DataRec.PlanSummary, DataRec.PlanTotal);
    CY := CY + LineHeight;
    end;
end;

{TDetailedWorkingCapitalreport}
constructor TDetailedWorkingCapitalReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
Var
  I : Integer;
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := True;
  DataCollect.GetConsolidatedList(DataModuleClient.CashFlowDeptDEPT_ID.Value, Consolidate);
  CFREngine := TCashFlowReportingEngine.create(REPWORKING, Consolid, DataModuleClient.BusinessesTARGET_START.Value, DataModuleClient.BusinessesTARGET_END.Value, 4);
  BodyFontSize := 8;
//  ColMargin := 0.05;
  Narrowrep := False;
  isadding := True;
  for I := 1 to 9 do    // Iterate
    begin
    SectionPrinted[I] := False;;
    SectionSizes[I] := 0;
    end;
  // Sections
  // 1 = AR
  // 2 = Stock
  // 3 = AP
  // 4 = AE
  // 5 = Expense Summary
  // 6 = Tax
  SectionSizes[1] := 19;
  SectionSizes[2] := 13;
  SectionSizes[3] := 26;
  SectionSizes[4] := 13;
  SectionSizes[5] := 16;
  SectionSizes[6] := 32;
end;

destructor TDetailedWorkingCapitalreport.Destroy;
begin
  CFREngine.Destroy;
//  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TDetailedWorkingCapitalreport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TDetailedWorkingCapitalreport.CheckColumns;
var
  j, kk: Integer;
//  DaysinYear : integer;
//  SummaryPtr : TPlanDataRecPtr;
  realCols : integer;
begin
  realCols := CFREngine.PeriodCount;
  TotalNoColumns :=  Realcols + 1;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := CFREngine.psdate + j
    else
      ChartDates[j] := CFREngine.psdate + SummaryPeriodIndexArray[j];
    end;
  if DetailedReportingPeriod > 4 then
    begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
    end
  else
    DefaultOrientation := poLandscape;
  kk := Realcols;
  Narrowrep := False;
  if RealCols > (NUM_COLUMNS - 1) then
    DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
  else
    DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
  DefaultOrientation := poLandscape;
  RightEdge := DetailWidth;
end;

procedure TDetailedWorkingCapitalreport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  ColY : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    PDFCanvas.Font.Size :=   DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDFCanvas.Font.Style := [fsBold];
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    if (PageStartColNo + I) <> TotalNoColumns then
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx]))
    else
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Full Period');
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(Rightedge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
end;

procedure TDetailedWorkingCapitalreport.RepPageFooter;
//var
//  I: Integer;
//  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
{
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
}
  CY := CY + cmtopx(2.0);
end;

procedure TDetailedWorkingCapitalReport.Drawlines;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), Drawtop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  CY := CY + cmtopx(2.0);
end;

Function TDetailedWorkingCapitalreport.RepBody : Boolean;
var
  I: Integer;
  Metrics: TTextMetric;
  SubTotalSummary : TSummaryBalArray;
  TotalSubTotal : Currency;
  SubSectionPrinted : Boolean;
  MainRec : TCashFlowReportRecPtr;
begin
  Result := False;
  PDFCanvas.Font.Name := CurrentFont;
  if NarrowRep then
    PDFCanvas.Font.Size := DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
   // Set to Baseline
  // Test to see if we have AR Balance and therefore something to printout
  CFREngine.GetAccountRec(ACCOUNT_REC, MainRec);
  if (Not Result) and (Not SectionPrinted[1]) then
    begin
    SectionPrinted[1] := True;
    if (BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0)) then
      begin
      CY := CY + Metrics.tmHeight * 2;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Accounts Receivable');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      CashAccountOut('Add: ', CFREngine.GetAccountRec(TOTAL_GROSS_SALES, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(CASH_RECEIPTS_AR, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(AR_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(AR_WRITEOFF, ReportRec), Metrics.tmHeight);
      horzLine(1, 0);

      BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, 0, False, 0);
      rowout('Closing Balance', MainRec.PlanSummary, MainRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
  //    CY := CY + Metrics.tmHeight;
      CFREngine.GetAccountRec(AR_DAYS, ReportRec);
      CFREngine.calculateBSDays(cfReceivables);
//      BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False, 2);
      rowout('Days Outstandings', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount], 2);

      CFREngine.GetAccountRec(TAX_ON_SALES, MainRec);
      if HasBalance(MainRec) then
        begin
        CY := CY + Metrics.tmHeight;
        horzLine(1, 0);
  //      CY := CY + Metrics.tmHeight;
        CashAccountOut('', CFREngine.GetAccountRec(SALES, ReportRec), Metrics.tmHeight);
        CashAccountOut('Add: ', MainRec, Metrics.tmHeight);
        horzLine(2, 0);
        CashAccountOut('= ', CFREngine.GetAccountRec(TOTAL_GROSS_SALES, ReportRec), Metrics.tmHeight);
        CY := CY - round(Metrics.tmHeight / 2);
        end
      else
      CY := CY + round(Metrics.tmHeight / 2);
      Drawlines;
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[2]) > (BM - cmtopx(0.85)) then
    Result := True;

  // Test to see if we have Stock Balance and therefore something to printout
  CFREngine.GetAccountRec(STOCK, MainRec);
  if (Not Result) and (Not SectionPrinted[2])then
    begin
    SectionPrinted[2] := True;
    if (BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0)) then
      begin
      CY := CY + Metrics.tmHeight * 2;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Stock On Hand');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      CashAccountOut('Add: ', CFREngine.GetAccountRec(STOCK_DELIVERIES, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(STOCK_SOLD, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(ST_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(ST_WRITEOFF, ReportRec), Metrics.tmHeight);
      horzLine(1, 0);

      BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, 0, False, 0);
      rowout('Closing Balance', MainRec.PlanSummary, MainRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
  //    CY := CY + Metrics.tmHeight;
      CFREngine.GetAccountRec(STOCK_DAYS, ReportRec);
      CFREngine.calculateStockturn;
//      BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False, 2);
      if (DataCollect.GetUserOption(OUSESTOCKDAYS, UOInteger) = 0) then
        rowout('Stockturns', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount], 2)
      else
        rowout('Stock Days Held', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount], 2);
      CY := CY + round(Metrics.tmHeight / 2);
      Drawlines;
      end;
    end;

  if  (CY + Metrics.tmHeight * SectionSizes[3]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Accounts Payable Balance and therefore something to printout
  CFREngine.GetAccountRec(ACCOUNT_PAY, MainRec);
  if (Not Result) and (Not SectionPrinted[3]) then
    begin
    SectionPrinted[3] := True;
    if (BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0)) then
      begin
      CY := CY + Metrics.tmHeight * 2;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Accounts Payable');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      CashAccountOut('Add: ', CFREngine.GetAccountRec(TOTAL_AP_INVOICES, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(CASH_PAYMENTS_AP, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(AP_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
      horzLine(1, 0);

      BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, 0, False, 0);
      rowout('Closing Balance', MainRec.PlanSummary, MainRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
//    CY := CY + Metrics.tmHeight;
      CFREngine.GetAccountRec(AP_DAYS, ReportRec);
      CFREngine.calculateBSDays(cfPayables);
//      BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False, 2);
      rowout('Days Outstanding', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount], 2);

      if hasBalance(CFREngine.GetAccountRec(GROSS_STOCK_PURCHASES, ReportRec)) and
        (HasBalance(CFREngine.GetAccountRec(GROSS_SUBCONTRACTORS, ReportRec)) or
        HasBalance(CFREngine.GetAccountRec(GROSS_EXPENSES_VIA_AP, ReportRec))) then
        begin
        if HasBalance(CFREngine.GetAccountRec(TAX_ON_STOCK_DELIVERIES, ReportRec)) then
          begin
          CY := CY + Metrics.tmHeight;
          horzLine(1, 0);
//      CY := CY + Metrics.tmHeight;
          CashAccountOut('', CFREngine.GetAccountRec(STOCK_DELIVERIES, ReportRec), Metrics.tmHeight);
          CashAccountOut('Add: ', CFREngine.GetAccountRec(TAX_ON_STOCK_DELIVERIES, ReportRec), Metrics.tmHeight);
          horzLine(2, 0);
          CashAccountOut('= ', CFREngine.GetAccountRec(GROSS_STOCK_PURCHASES, ReportRec), Metrics.tmHeight);
          end
        else
          CashAccountOut('', CFREngine.GetAccountRec(GROSS_STOCK_PURCHASES, ReportRec), Metrics.tmheight);
        CashAccountOut('Add: ', CFREngine.GetAccountRec(GROSS_SUBCONTRACTORS, ReportRec), Metrics.tmheight);
        CashAccountOut('Add: ', CFREngine.GetAccountRec(GROSS_EXPENSES_VIA_AP, ReportRec), Metrics.tmheight);
        horzLine(2, 0);
        CashAccountOut('= ', CFREngine.GetAccountRec(TOTAL_AP_INVOICES, ReportRec), Metrics.tmheight);
        CY := CY - round(Metrics.tmHeight / 2);
        end
      else
        CY := CY + round(Metrics.tmHeight / 2);
      Drawlines;
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[4]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Accrued Expenses Balance and therefore something to printout
  CFREngine.GetAccountRec(ACCRUED_EXPENSES, MainRec);
  if (Not Result) and (Not SectionPrinted[4]) then
    begin
    SectionPrinted[4] := True;
    if (BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0)) then
      begin
      CY := CY + Metrics.tmHeight * 2;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Accrued Expenses');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      CashAccountOut('Add: ', CFREngine.GetAccountRec(GROSS_EXPENSES_ACCRUED, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(CASH_PAYMENTS_AE, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(AE_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
      horzLine(1, 0);

      BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, 0, False, 0);
      rowout('Closing Balance', MainRec.PlanSummary, MainRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
//    CY := CY + Metrics.tmHeight;
      CFREngine.GetAccountRec(AE_DAYS, ReportRec);
      CFREngine.calculateBSDays(cfAccruedExpenses);
//      BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False, 2);
      rowout('Days Outstanding', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount], 2);
      CY := CY + round(Metrics.tmHeight / 2);
      Drawlines;
      end;
    end;

  if  (CY + Metrics.tmHeight * SectionSizes[5]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Accrued Expenses Balance and therefore something to printout

  if (Not Result) and (Not SectionPrinted[5]) then
    begin
    SectionPrinted[5] := True;
    if (HasBalance(CFREngine.GetAccountRec(TAX_EXPENSES_VIA_AP, MainRec))
      or HasBalance(CFREngine.GetAccountRec(TAX_EXPENSES_ACCRUED, ReportRec))) then
      begin
      CY := CY + Metrics.tmHeight * 1;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Expense Details');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      SubSectionPrinted := False;
      if HasBalance(MainRec) then
        begin
//      CY := CY + Metrics.tmHeight;
        SubSectionPrinted := True;
        CashAccountOut('', CFREngine.GetAccountRec(NET_EXPENSES_VIA_AP, ReportRec), Metrics.tmHeight);
        CashAccountOut('Add: ', mainrec, Metrics.tmHeight);
        horzLine(2, 0);
        CashAccountOut('= ', CFREngine.GetAccountRec(GROSS_EXPENSES_VIA_AP, ReportRec), Metrics.tmHeight);
        end;
      if HasBalance(CFREngine.GetAccountRec(TAX_EXPENSES_ACCRUED, MainRec)) then
        begin
        if SubSectionPrinted then
          horzLine(1, 0);
//      CY := CY + Metrics.tmHeight;
        CashAccountOut('', CFREngine.GetAccountRec(NET_EXPENSES_ACCRUED, ReportRec), Metrics.tmHeight);
        CashAccountOut('Add: ', MainRec, Metrics.tmHeight);
        horzLine(2, 0);
        CashAccountOut('= ', CFREngine.GetAccountRec(GROSS_EXPENSES_ACCRUED, ReportRec), Metrics.tmHeight);
        end;
      CY := CY - round(Metrics.tmHeight / 2);
      Drawlines;
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[6]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Accrued Expenses Balance and therefore something to printout
  CFREngine.GetAccountRec(TAX_PAYABLE, MainRec);
  if (Not Result) and (Not SectionPrinted[6]) then
    begin
    SectionPrinted[6] := True;
    if (BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0)) then
      begin
      CY := CY + Metrics.tmHeight * 1;
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Tax - GST, VAT, WST');
      PDFCanvas.Font.Style := [];
      CY := CY + round(Metrics.tmHeight / 2);
      DrawTop := CY;
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      if DataCollect.GetUserOption(OTAXACCOUNTINGMETHOD, UOInteger) = 1 then
        begin
        PDFCanvas.Font.Style := [];
{      Cashfe.TotalTaxCollectedRec.PlanTotal := 0;
      Cashfe.TotalTaxPaidRec.PlanTotal := 0;
      for I := 0 to Cashfe.PeriodCount - 1 do
        begin
        Cashfe.TotalTaxCollectedRec.PlanTotal := Cashfe.TotalTaxCollectedRec.PlanTotal + Cashfe.TotalTaxCollectedRec.PlanSummary[I];
        Cashfe.TotalTaxPaidRec.PlanTotal := Cashfe.TotalTaxPaidRec.PlanTotal + Cashfe.TotalTaxPaidRec.PlanSummary[I];
        end;
}
        CFREngine.GetAccountRec(TOTAL_TAX_COLLECTED, MainRec);
        BuildSummary(MainRec.Accountno, CFREngine.psdate, CFREngine.pedate, MainRec.PlanDetail, MainRec.planSummary);
        rowout('Add - Tax Collected based on Cash Receipts', MainRec.PlanSummary, MainRec.PlanTotal, 0);
        CY := CY + Metrics.tmHeight;
        horzLine(2, 0);

        CFREngine.GetAccountRec(TOTAL_TAX_PAID, MainRec);
        BuildSummary(MainRec.Accountno, CFREngine.psdate, CFREngine.pedate, MainRec.PlanDetail, MainRec.planSummary);
        rowout('Add - Tax Collected based on Cash Receipts', MainRec.PlanSummary, MainRec.PlanTotal, 0);
        CY := CY + Metrics.tmHeight;
        horzLine(1, 0);
        end
      else
        begin
        PDFCanvas.Font.Style := [fsBold];
        LeftinColumn(0, 'Add - Tax Collected On Invoice');
        PDFCanvas.Font.Style := [];
        CY := CY + Metrics.tmHeight;
        CashAccountOut('', CFREngine.GetAccountRec(TOTAL_TAX_COLLECTED, MainRec), Metrics.tmHeight);
        horzLine(2, 0);
        PDFCanvas.Font.Style := [fsBold];
        LeftinColumn(0, 'Less - Tax Paid On Invoice');
        PDFCanvas.Font.Style := [];
        CY := CY + Metrics.tmHeight;
        CashAccountOut('', CFREngine.GetAccountRec(TAX_ON_STOCK_DELIVERIES, ReportRec), Metrics.tmHeight);
        CashAccountOut('', CFREngine.GetAccountRec(TAX_ON_SUBCONTRACTORS, ReportRec), Metrics.tmHeight);
        CashAccountOut('', CFREngine.GetAccountRec(TAX_EXPENSES_VIA_AP, ReportRec), Metrics.tmHeight);
        CashAccountOut('', CFREngine.GetAccountRec(TAX_EXPENSES_ACCRUED, ReportRec), Metrics.tmHeight);
        horzLine(2, 0);
        CashAccountOut('', CFREngine.GetAccountRec(TOTAL_TAX_PAID, ReportRec), Metrics.tmHeight);
        horzLine(1, 0);
        end;
      end;

    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      SubTotalSummary[I] := MainRec.planSummary[I] - ReportRec.PlanSummary[I];
    TotalSubTotal := MainRec.PlanTotal - ReportRec.PlanTotal;
    if HasBalance(CFREngine.GetAccountRec(TAX_CASH_TIMING, MainRec)) then
      rowout('Sub Total - (Net Cash Basis)*', SubTotalSummary, TotalSubTotal, 0)
    else
      rowout('Sub Total*', SubTotalSummary, TotalSubTotal, 0);
    CY := CY + Metrics.tmHeight;
    CashAccountOut('Less: ', CFREngine.GetAccountRec(TAXPAID_REFUND, ReportRec), Metrics.tmHeight);
    horzLine(1, 0);
    CashAccountOut('Less: ', CFREngine.GetAccountRec(TAX_ADJUSTMENTS, ReportRec), Metrics.tmHeight);
    CFREngine.GetAccountRec(TAX_PAYABLE, ReportRec);
    BuildCFSummary(ReportRec.planTotal, ReportRec.PlanDetail, ReportRec.PlanSummary, 0, False, 0);
    rowout('Closing Balance', ReportRec.PlanSummary, ReportRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
    if BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, MainRec.OpeningBalance, True, 0) then
      begin
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      PDFCanvas.Font.Style := [fsBold];
      LeftinColumn(0, 'Tax Timing Balance');
      PDFCanvas.Font.Style := [];
      CY := CY + Metrics.tmHeight;
      rowout('Opening Balance', MainRec.PlanSummary, MainRec.OpeningBalance, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(1, 0);
      for I := 0 to CFRENgine.PeriodCount - 1 do    // Iterate
        TotalAmounts[I] := 0;
      GroupTotal := 0;
      Isadding := True;
      CashAccountOut('Add: ', CFREngine.GetAccountRec(TAX_ON_SALES, ReportRec), Metrics.tmHeight);
      IsAdding := False;
      CashAccountOut('Less: ', CFREngine.GetAccountRec(TAX_ON_STOCK_DELIVERIES, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(TAX_ON_SUBCONTRACTORS, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(TAX_EXPENSES_VIA_AP, ReportRec), Metrics.tmHeight);
      CashAccountOut('Less: ', CFREngine.GetAccountRec(TAX_EXPENSES_ACCRUED, ReportRec), Metrics.tmHeight);
      horzLine(2, 0);
      rowout('Sub - Total', Totalamounts, GroupTotal, 0);
      CY := CY + Metrics.tmHeight;
      Isadding := True;
      CFREngine.GetAccountRec(TOTAL_TAX_COLLECTED, MainRec);
      CFREngine.GetAccountRec(TOTAL_TAX_PAID, ReportRec);
      for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
        SubTotalSummary[I] := MainRec.planSummary[I] - ReportRec.PlanSummary[I];
      TotalSubTotal := MainRec.PlanTotal - ReportRec.PlanTotal;
      rowout('*Net Cash Basis', SubTotalSummary, TotalSubTotal, 0);
      CY := CY + Metrics.tmHeight;
      CFREngine.GetAccountRec(TAX_CASH_TIMING, MainRec);
      BuildCFSummary(MainRec.planTotal, MainRec.PlanDetail, MainRec.PlanSummary, 0, False, 0);
      rowout('Closing Balance', MainRec.PlanSummary, MainRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
      end;
    CY := CY + round(Metrics.tmHeight / 2);
    Drawlines;
    end;
  CY := CY + round(Metrics.tmHeight / 2);

end;

function TDetailedWorkingCapitalreport.RowOut(LineTitle: string; AccountRec: TSummaryBalArray; LineTotal: Currency; DecimalPlaces: Integer): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
begin
  LeftinColumn(0, LineTitle);
  TextImage := '0';
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if DecimalPlaces = 0 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTROUNDCURRENCY, LineTotal)
      else
        textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec[RepCol.DateIdx]);
      end
    else if DecimalPlaces = 1 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTTENSCURRENCY, LineTotal)
      else
        textAmount := formatfloat(REPORTTENSCURRENCY, AccountRec[RepCol.DateIdx]);
      end
    else if DecimalPlaces = 2 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTCENTSCURRENCY, LineTotal)
      else
        textAmount := formatfloat(REPORTCENTSCURRENCY, AccountRec[RepCol.DateIdx]);
      end;
    DecAligninColumn(I, TextAmount, textImage);
    end;
  Result := True;
end;

procedure TDetailedWorkingCapitalreport.MakeColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  cx : Extended;
begin
  Columns.clear;
  cx := 0;
  New(Repcol);
//  Repcol.ColNo := 0;
  Repcol.Start := cx;
  if Narrowrep then
    Repcol.Width := TITLEWIDTH
  else
    Repcol.Width := DETAILEDTITLEWIDTH;
  cx := cx + Repcol.Width;
  repcol.Majorcol := 1;
  repcol.Minorcol := 0;
  Columns.add(Repcol);
  for I := 0 to (PageEndColNo - PageStartColNo) do    // Iterate
    begin
    New(Repcol);
//    Repcol.ColNo := intostr(I + 1);
    repcol.Majorcol := I + 2;
    repcol.Minorcol := 0;
    Repcol.Start := cx;
    Repcol.Source := 0; // Normal Balances
    if Narrowrep then
      Repcol.Width := DOLLARWIDTH
    else
      Repcol.Width := DETAILEDCOLWIDTH;
    Repcol.DateIdx := PageStartColNo + I;
    if (PageStartColNo + I + 1) = TotalNoColumns
      then begin
      if Narrowrep then
        Repcol.Width := DOLLARWIDTH
      else
        Repcol.Width := DETAILEDTOTALCOLWIDTH;
      Repcol.DateIdx := PageStartColNo + I;
      Repcol.Source := 1; // Use Totals for this Column
    end;
    cx := cx + Repcol.Width;
    Columns.add(Repcol);
  end;    // for
  RightEdge := cx;
end;

function TDetailedWorkingCapitalReport.HasBalance(DataRec : TCashFlowReportRecPtr): Boolean;
var
  I: Integer;
begin
  result := False;
  I := 0;
  while (Not Result) and (I < (Trunc(CFREngine.pedate) - Trunc(CFREngine.psdate) + 1)) do
    begin
    if Round(DataRec.planDetail[I]) <> 0 then
      Result := True;
    Inc(I);
    end;    // while
end;

Function TDetailedWorkingCapitalreport.BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean; DecimalPlaces: Integer): Boolean;
var
  K: Integer;
begin
  ArrayTotal := 0;
  Result := False;
  K := 0;
  while SummaryPeriodIndexArray[k] <> 0 do
    begin
    if Not IsOpeningBal then
      begin
      if DecimalPlaces = 0 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]]);
      if DecimalPlaces = 1 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]] * 100) / 100;
      if DecimalPlaces = 2 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]] * 100) / 100;
      ArrayTotal := ArrayTotal + SummaryArray[K];
      if (Result = False) and (SummaryArray[K] <> 0) then
        Result := True;
      end
    else
      begin
      if K = 0 then
        SummaryArray[K] := OpeningBal
      else
        begin
        if DecimalPlaces = 0 then
          SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k - 1]]);
        if DecimalPlaces = 1 then
          SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k - 1]] * 10) / 10;
        end;
      if (Result = False) and (SummaryArray[K] <> 0) then
        Result := True;
      end;
    inc(k);
    end;    // while
end;

procedure TDetailedWorkingCapitalReport.CashAccountOut(TitlePrefix : string; DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
var
  I : Integer;
  HasBalance : Boolean;
begin
  for I := 0 to NUM_DAYSINYEAR do    // Iterate
    DataRec.PlanDetail[I] := round(DataRec.PlanDetail[I]);
  BuildSummary(DataRec.Accountno, CFREngine.psdate, CFREngine.pedate, DataRec.PlanDetail, DataRec.planSummary);
  HasBalance := False;
  DataRec.PlanTotal := 0;
  for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
    begin
    if (HasBalance = False) and (DataRec.PlanSummary[I] <> 0) then
      HasBalance := True;
    DataRec.PlanTotal := DataRec.PlanTotal + DataRec.PlanSummary[I];
    end;
  if HasBalance then
    begin
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if isadding then
        Totalamounts[I] := TotalAmounts[I] + DataRec.PlanSummary[I]
      else
        Totalamounts[I] := TotalAmounts[I] - DataRec.PlanSummary[I];
      end;
    if isadding then
      GroupTotal := GroupTotal + DataRec.PlanTotal
    else
      GroupTotal := GroupTotal - DataRec.PlanTotal;
    rowout(TitlePrefix + DataRec.AccountTitle, DataRec.PlanSummary, DataRec.PlanTotal, 0);
    CY := CY + LineHeight;
    end;
end;

{TBalanceSheetReport}
constructor TBalanceSheetReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
Var
  I : Integer;
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := True;
  DataCollect.GetConsolidatedList(DataModuleClient.CashFlowDeptDEPT_ID.Value, Consolidate);
  CFREngine := TCashFlowReportingEngine.create(REPBALANCE, Consolid, DataModuleClient.BusinessesTARGET_START.Value, DataModuleClient.BusinessesTARGET_END.Value, 4);
  BodyFontSize := 8;
//  ColMargin := 0.05;
  Narrowrep := False;
  for I := 1 to 9 do    // Iterate
    begin
    SectionPrinted[I] := False;;
    SectionSizes[I] := 0;
    end;
  // Sections
  // 1 = Total Assets - Balance Sheet
  // 1 = Total Assets - Balance Sheet
  // 1 = Total Assets - Balance Sheet
  // 1 = Total Assets - Balance Sheet
  // 5 = P and L Appropriation
  // 6 = Balance Sheet Ratios
  SectionSizes[1] := 10;
  SectionSizes[2] := 15;
  SectionSizes[3] := 15;
  SectionSizes[4] := 10;
  SectionSizes[5] := 10;
  SectionSizes[6] := 32;
  SectionSizes[7] := 22;
  IsBalanceSheet := True; // the first section is a balance sheet
  isBalanceRatios := False;
end;

destructor TBalanceSheetReport.Destroy;
begin
  CFREngine.Destroy;
//  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TBalanceSheetReport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  CY := 0;
  if not onlastpage then
    begin
    RepPageHeader;
    Result := RepBody;
    RepPageFooter;
    end
  else
    begin
    Result := False;
    CY := 10;
    end;
  if PlaceDisclaimer and (Result = False) and (OnlastPage = false) then
    begin
    onlastpage := True;
    Result := True;
    DisclaimPageno := PageNumber + 1;
    CY := BM + 1;
    end;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TBalanceSheetReport.CheckColumns;
var
  j, kk: Integer;
//  DaysinYear : integer;
//  SummaryPtr : TPlanDataRecPtr;
  realCols : integer;
begin
  realCols := CFREngine.PeriodCount;
  TotalNoColumns :=  Realcols + 1;
  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := CFREngine.psdate + j
    else
      ChartDates[j] := CFREngine.psdate + SummaryPeriodIndexArray[j];
    end;
  if DetailedReportingPeriod > 4 then
    begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
    end
  else
    DefaultOrientation := poLandscape;
  kk := Realcols;
  Narrowrep := False;
  if RealCols > (NUM_COLUMNS - 1) then
    DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
  else
    DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
  DefaultOrientation := poLandscape;
  RightEdge := DetailWidth;
end;

procedure TBalanceSheetReport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
//  ColY : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    PDFCanvas.Font.Size :=   DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDFCanvas.Font.Style := [fsBold];
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    if IsBalanceSheet then
      begin
      if (PageStartColNo + I) = 1 then
        CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', CFREngine.psdate - 1))
      else
        CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx - 1]));
      end
    else
      begin
      if (PageStartColNo + I) <> TotalNoColumns then
        CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, FormatDateTime('dd MMM yyy', ChartDates[RepCol.DateIdx]))
      else
        CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Full Period');
      end;

    if NewY > Yext then Yext := NewY;
    NewY := CY;
    end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(Rightedge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
end;

procedure TBalanceSheetReport.RepPageFooter;
begin
  CY := CY + cmtopx(2.0);
end;

procedure TBalanceSheetReport.Drawlines;
var
  I: Integer;
  repcol : TRepColPtr;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;

  with PDFCanvas do
    begin
    moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), Drawtop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  CY := CY + cmtopx(2.0);
end;

Function TBalanceSheetReport.RepBody : Boolean;
var
  I: Integer;
  Metrics: TTextMetric;
  PNLInterestSummary : TSummaryBalArray;
  TotalSubTotal : Currency;
  SectionCount : Integer;
  EquityRec : TCashFlowReportRecPtr;
  ReportARec : TCashFlowReportRecPtr;
  ReportBRec : TCashFlowReportRecPtr;
//  SubSectionPrinted : Boolean;
begin
  Result := False;
  PDFCanvas.Font.Name := CurrentFont;
  if NarrowRep then
    PDFCanvas.Font.Size := DETAILFONTSIZE
  else
    PDFCanvas.Font.Size := BodyFontSize;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
   // Set to Baseline
  CFREngine.GetAccountRec(EQUITY, EquityRec);
  for I := 0 to NUM_WEEKS do    // Iterate
    EquityRec.PlanSummary[I] := 0;
  // BalanceSheet
  if (Not Result) and (Not SectionPrinted[1]) then
    begin
    SectionPrinted[1] := True;
    // initialise totalarrays
    FillChar(TotalCurrentAssets, Sizeof(TMonthlyBalArray), #0);
    FillChar(TotalAssets, Sizeof(TMonthlyBalArray), #0);
    FillChar(TotalCurrentLiabilities, Sizeof(TMonthlyBalArray), #0);
    FillChar(TotalLiabilities, Sizeof(TMonthlyBalArray), #0);
    FillChar(TotalEquity, Sizeof(TMonthlyBalArray), #0);
    FillChar(TotalEBIT, Sizeof(TMonthlyBalArray), #0);

    DrawTop := CY;
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Current Assets');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to NUM_WEEKS do    // Iterate
      TotalAmounts[I] := 0;
    CfrEngine.correctBankAccount;
    SectionCount := 0;
    if BSAccountOut(CFREngine.GetAccountRec(CASH_AT_BANK, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(ACCOUNT_REC, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(STOCK, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(CASH_MAN_FUND, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(MARKETSEC, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(OTHER_CURRENT_ASSETS, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if SectionCount > 1 then
      begin
      horzLine(2, 0);
      rowout('Total Current Assets', TotalAmounts, TotalAmounts[CFREngine.PeriodCount], 0);
      CY := CY + Metrics.tmHeight;
      end;
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      begin
      EquityRec.PlanSummary[I] := EquityRec.PlanSummary[I] + TotalAmounts[I];
      TotalCurrentAssets[I] := TotalAmounts[I];
      end;
  end;
  if (Not Result) and (Not SectionPrinted[2]) then
    begin
    SectionPrinted[2] := True;
    horzLine(1, 0);
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Other Assets');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to NUM_WEEKS do    // Iterate
      TotalAmounts[I] := 0;
    SectionCount := 0;
    if BSAccountOut(CFREngine.GetAccountRec(NON_DEP_ASSETS, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(DEP_ASSETS, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(INTANG_ASSETS, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if SectionCount > 1 then
      begin
      horzLine(2, 0);
      rowout('Total Other Assets', TotalAmounts, TotalAmounts[CFREngine.PeriodCount], 0);
      CY := CY + Metrics.tmHeight;
      end;
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      begin
      EquityRec.PlanSummary[I] := EquityRec.PlanSummary[I] + TotalAmounts[I];
      TotalAssets[I] := TotalCurrentAssets[I] + TotalAmounts[I];
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[3]) > (BM - cmtopx(0.85)) then
    Result := True;
  if (Not Result) and (Not SectionPrinted[3]) then
    begin
    SectionPrinted[3] := True;
    horzLine(1, 0);
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Current Liabilities');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to NUM_WEEKS do    // Iterate
      TotalAmounts[I] := 0;
    SectionCount := 0;
    if BSAccountOut(CFREngine.GetAccountRec(BANK_OVERDRAFT, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(ACCOUNT_PAY, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(ACCRUED_EXPENSES, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(TAX_PAYABLE, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(TAX_CASH_TIMING, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(INC_TAX_PAYABLE, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(DIVIDENDS_PAYABLE, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if BSAccountOut(CFREngine.GetAccountRec(OTHER_CURRENT_LIAB, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if SectionCount > 1 then
      begin
      horzLine(2, 0);
      rowout('Total Current Liabilities', TotalAmounts, TotalAmounts[CFREngine.PeriodCount], 0);
      CY := CY + Metrics.tmHeight;
      end;
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      begin
      EquityRec.PlanSummary[I] := EquityRec.PlanSummary[I] - TotalAmounts[I];
      TotalCurrentLiabilities[I] := TotalAmounts[I];
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[4]) > (BM - cmtopx(0.85)) then
    Result := True;
  if (Not Result) and (Not SectionPrinted[4]) then
    begin
    SectionPrinted[4] := True;
    horzLine(1, 0);
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Other Liabilities');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to NUM_WEEKS do    // Iterate
      TotalAmounts[I] := 0;
    SectionCount := 0;
    if BSAccountOut(CFREngine.GetAccountRec(LOANS, ReportRec), Metrics.tmHeight) then
      inc(SectionCount);
    if SectionCount > 1 then
      begin
      horzLine(2, 0);
      rowout('Total Other Liabilities', TotalAmounts, TotalAmounts[CFREngine.PeriodCount], 0);
      CY := CY + Metrics.tmHeight;
      end;
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      begin
      EquityRec.PlanSummary[I] := EquityRec.PlanSummary[I] - TotalAmounts[I];
      TotalLiabilities[I] := TotalCurrentLiabilities[I] + TotalAmounts[I];
      end;
    end;
  if  (CY + Metrics.tmHeight * SectionSizes[5]) > (BM - cmtopx(0.85)) then
    Result := True;
  if (Not Result) and (Not SectionPrinted[5]) then
    begin
    SectionPrinted[5] := True;
    horzLine(1, 0);
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Equity');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to NUM_WEEKS do    // Iterate
      TotalAmounts[I] := 0;
//    SectionCount := 0;
    rowout('Total Equity', EquityRec.PlanSummary, EquityRec.PlanSummary[CFREngine.PeriodCount], 0);
    EquityRec.OpeningBalance := EquityRec.PlanSummary[0];
//    CY := CY + Metrics.tmHeight;
    CY := CY + round(Metrics.tmHeight / 2);
    Drawlines;
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      TotalEquity[I] := EquityRec.PlanSummary[I];
    IsBalanceSheet := False;
    end;

  if  (CY + Metrics.tmHeight * SectionSizes[6]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Stock Balance and therefore something to printout
  if (Not Result) and (Not SectionPrinted[6]) then
    begin
    SectionPrinted[6] := True;
    CalcEquity;
    // calculate EBIT
    TotalSubTotal := 0;
//    TotalTemp1 := 0;
    CFREngine.GetAccountRec(NETPROFIT, ReportRec);
    // calculate Interest Summary
    BuildSummary(FIRSTEXPENSE, CFREngine.psdate, CFREngine.pedate, CFREngine.ConPNLInterest, PNLInterestSummary);
    BuildSummary(ReportRec.Accountno, CFREngine.psdate, CFREngine.pedate, ReportRec.PlanDetail, ReportRec.planSummary);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      TotalEBIT[I] := ReportRec.PlanSummary[i] + PNLInterestSummary[I];
      TotalEBIT[CFREngine.PeriodCount] := TotalEBIT[CFREngine.PeriodCount] + TotalEBIT[I];
      TotalSubTotal := TotalSubTotal + PNLInterestSummary[I];
      end;
    CY := CY + Metrics.tmHeight * 2;
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Equity Movement');
    PDFCanvas.Font.Style := [];
    CY := CY + round(Metrics.tmHeight / 2);
    DrawTop := CY;
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    BuildCFSummary(EquityRec.planTotal, EquityRec.PlanDetail, EquityRec.PlanSummary, EquityRec.OpeningBalance, True, 0);
    rowout('Opening Balance', EquityRec.PlanSummary, EquityRec.OpeningBalance, 0);
    CY := CY + Metrics.tmHeight;
    horzLine(1, 0);
    if TotalSubTotal <> 0 then
      begin
      rowout('Earnings Before Interest and Tax (EBIT)', TotalEBIT, TotalEBIT[CFREngine.PeriodCount], 0);
      CY := CY + Metrics.tmHeight;
      rowout('Less Total Interest Expense', PNLInterestSummary, Totalsubtotal, 0);
      CY := CY + Metrics.tmHeight;
      horzLine(2, 0);
      end;
    CashAccountOut('Add: ', CFREngine.GetAccountRec(NETPROFIT, ReportRec), Metrics.tmHeight);
    CashAccountOut('Less: ', CFREngine.GetAccountRec(INC_TAX_INCURRED, ReportRec), Metrics.tmHeight);
    CashAccountOut('Less: ', CFREngine.GetAccountRec(DIV_DECLARED, ReportRec), Metrics.tmHeight);
    CashAccountOut('Add: ', CFREngine.GetAccountRec(EQUITY_INJECTED, ReportRec), Metrics.tmHeight);
    CashAccountOut('Less: ', CFREngine.GetAccountRec(EQUITY_WITHDRAWN, ReportRec), Metrics.tmHeight);
    horzLine(1, 0);
    BuildCFSummary(EquityRec.planTotal, EquityRec.PlanDetail, EquityRec.PlanSummary, 0, False, 0);
    rowout('Closing Balance', EquityRec.PlanSummary, EquityRec.PlanSummary[CFREngine.PeriodCount - 1], 0);
    CY := CY + round(Metrics.tmHeight / 2);
    Drawlines;
    end;

  if  (CY + Metrics.tmHeight * SectionSizes[7]) > (BM - cmtopx(0.85)) then
    Result := True;
  // Test to see if we have Stock Balance and therefore something to printout
  if (Not Result) and (Not SectionPrinted[7]) then
    begin
    CalcEquity;
    BuildCFSummary(EquityRec.planTotal, EquityRec.PlanDetail, EquityRec.PlanSummary, EquityRec.OpeningBalance, True, 0);
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      TotalEquity[I] := EquityRec.PlanSummary[I];
    SectionPrinted[7] := True;
    RightEdge := RightEdge - TRepColPtr(Columns[Columns.count - 1]).Width;
    Columns.count := Columns.count - 1;
    CY := CY + Metrics.tmHeight * 2;
    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'Financial Ratios');
    PDFCanvas.Font.Style := [];
    CY := CY + round(Metrics.tmHeight / 2);
    DrawTop := CY;
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    // Current Assets
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalCurrentLiabilities[I]  <> 0  then
        TotalAmounts[I] := TotalCurrentAssets[I] / TotalCurrentLiabilities[I]
      else
        TotalAmounts[I] := 0
      end;    // for
    TotalSubTotal := 0;
    rowout('Current Assets Ratio', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Quick Assets
    CFREngine.GetAccountRec(STOCK, ReportRec);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalCurrentLiabilities[I]  <> 0  then
        TotalAmounts[I] := (TotalCurrentAssets[I] - ReportRec.PlanSummary[I]) / TotalCurrentLiabilities[I]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Quick Assets Ratio', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Cash Ratio
    CFREngine.GetAccountRec(CASH_AT_BANK, ReportRec);
    CFREngine.GetAccountRec(CASH_MAN_FUND, ReportARec);
    CFREngine.GetAccountRec(MARKETSEC, ReportBRec);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      TotalSubTotal := ReportARec.PlanSummary[I] + ReportBRec.PlanSummary[I];
      if not (ReportRec.PlanSummary[I] < 0) then
        TotalSubTotal := TotalSubTotal + ReportRec.PlanSummary[I];
      if TotalCurrentLiabilities[I]  <> 0  then
        TotalAmounts[I] := TotalSubTotal / TotalCurrentLiabilities[I]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Cash Ratio', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    horzLine(1, 0);

    // Net Revenue / Net Working Capital
    CFREngine.GetAccountRec(SALES, ReportRec);
    BuildSummary(ReportRec.Accountno, CFREngine.psdate, CFREngine.pedate, ReportRec.PlanDetail, ReportRec.planSummary);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if (TotalCurrentAssets[i] - TotalCurrentLiabilities[I])  <> 0  then
        TotalAmounts[I] := (ReportRec.planSummary[I] * AnnualiseFactor(i)) / (TotalCurrentAssets[i] - TotalCurrentLiabilities[I])
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Net Revenue / Net Working Capital', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Debt to Equity Ratio
    CFREngine.GetAccountRec(LOANS, ReportRec);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalEquity[i]  <> 0  then
        TotalAmounts[I] := ReportRec.planSummary[I] / TotalEquity[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Debt to Equity Ratio', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Debt to Assets Ratio
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalAssets[i]  <> 0  then
        TotalAmounts[I] := ReportRec.planSummary[I] / TotalAssets[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Debt to Assets Ratio', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Times Interest Earned
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if PNLInterestSummary[i]  <> 0  then //PNLInterestSummary
        TotalAmounts[I] := TotalEBIT[I] / PNLInterestSummary[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Times Interest Earned', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    horzLine(1, 0);

    // EBIT on Total Assets %   #
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalAssets[i]  <> 0  then
        TotalAmounts[I] := TotalEBIT[I] * AnnualiseFactor(I) * 100 / TotalAssets[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Return on Total Assets (using EBIT) %', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    horzLine(1, 0);

    PDFCanvas.Font.Style := [fsBold];
    LeftinColumn(0, 'The Du Pont Identity');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;

    // Profit Margin %  #1
    CFREngine.GetAccountRec(SALES, ReportRec);
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if ReportRec.planSummary[I]  <> 0  then
        TotalAmounts[I] := TotalEBIT[I] * 100 / ReportRec.planSummary[I]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Profit Margin (EBIT / Sales) %', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Asset TurnOver  #2
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalAssets[I]  <> 0  then
        TotalAmounts[I] := (ReportRec.planSummary[I] * AnnualiseFactor(i)) / TotalAssets[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Asset Turnover', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    // Asset TurnOver  #3
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalEquity[i]  <> 0  then
        TotalAmounts[I] := TotalAssets[i] / TotalEquity[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Equity Multiplier', TotalAmounts, Totalsubtotal, 2);
    CY := CY + Metrics.tmHeight;

    horzLine(2, 0);

    // ROE (EBIT)   #Result
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      begin
      if TotalEquity[i]  <> 0  then
        TotalAmounts[I] := TotalEBIT[I] * AnnualiseFactor(i) * 100 / TotalEquity[i]
      else
        TotalAmounts[I] := 0
      end;    // for
    rowout('Return on Equity (using EBIT) %', TotalAmounts, Totalsubtotal, 2);
    CY := CY + round(Metrics.tmHeight / 2);
    Drawlines;
    Columns.count := Columns.count - 1;
    end;
  CY := CY + round(Metrics.tmHeight / 2);
end;

function TBalanceSheetReport.RowOut(LineTitle: string; AccountRec: array of currency; LineTotal: Currency; DecimalPlaces: Integer): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
  TextImage : string;
begin
  LeftinColumn(0, LineTitle);
  TextImage := '0';
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if DecimalPlaces = 0 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTROUNDCURRENCY, LineTotal)
			else
        textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec[RepCol.DateIdx]);
      end
    else if DecimalPlaces = 1 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTTENSCURRENCY, LineTotal)
      else
        textAmount := formatfloat(REPORTTENSCURRENCY, AccountRec[RepCol.DateIdx]);
      end
    else if DecimalPlaces = 2 then
      begin
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTCENTSCURRENCY, LineTotal)
      else
        textAmount := formatfloat(REPORTCENTSCURRENCY, AccountRec[RepCol.DateIdx]);
      end;
    DecAligninColumn(I, TextAmount, textImage);
    end;
  Result := True;
end;

procedure TBalanceSheetReport.MakeColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  cx : Extended;
begin
  Columns.clear;
  cx := 0;
  New(Repcol);
//  Repcol.ColNo := 0;
  Repcol.Start := cx;
  if Narrowrep then
    Repcol.Width := TITLEWIDTH
  else
    Repcol.Width := DETAILEDTITLEWIDTH;
  cx := cx + Repcol.Width;
  repcol.Majorcol := 1;
  repcol.Minorcol := 0;
  Columns.add(Repcol);
  for I := 0 to (PageEndColNo - PageStartColNo) do    // Iterate
    begin
    New(Repcol);
//    Repcol.ColNo := intostr(I + 1);
    repcol.Majorcol := I + 2;
    repcol.Minorcol := 0;
    Repcol.Start := cx;
    Repcol.Source := 0; // Normal Balances
    if Narrowrep then
      Repcol.Width := DOLLARWIDTH
    else
      Repcol.Width := DETAILEDCOLWIDTH;
    Repcol.DateIdx := PageStartColNo + I;
    if (PageStartColNo + I + 1) = TotalNoColumns
      then begin
      if Narrowrep then
        Repcol.Width := DOLLARWIDTH
      else
        begin
        if isbalancesheet then
          Repcol.Width := DETAILEDCOLWIDTH
        else
          Repcol.Width := DETAILEDTOTALCOLWIDTH;
        end;
      Repcol.DateIdx := PageStartColNo + I;
      Repcol.Source := 1; // Use Totals for this Column
    end;
    cx := cx + Repcol.Width;
    Columns.add(Repcol);
  end;    // for
  RightEdge := cx;
end;

{
function TBalanceSheetReport.HasBalance(DetailArray: TDetailedBalArray): Boolean;
var
  I: Integer;
begin
  result := False;
  I := 0;
  while (Not Result) and (I < (Trunc(cashfe.pedate) - Trunc(Cashfe.psdate) + 1)) do
    begin
    if Round(DetailArray[I]) <> 0 then
      Result := True;
    Inc(I);
    end;    // while
end;
}

Function TBalanceSheetReport.BuildCFSummary(var ArrayTotal: Currency; DetailArray: TDetailedBalArray;var SummaryArray : TSummaryBalArray; OpeningBal : currency; IsOpeningBal : Boolean; DecimalPlaces: Integer): Boolean;
var
  K: Integer;
begin
  ArrayTotal := 0;
  Result := False;
  K := 0;
  while SummaryPeriodIndexArray[k] <> 0 do
    begin
    if Not IsOpeningBal then
      begin
      if DecimalPlaces = 0 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]]);
      if DecimalPlaces = 1 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]] * 100) / 100;
      if DecimalPlaces = 2 then
        SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k]] * 100) / 100;
      ArrayTotal := ArrayTotal + SummaryArray[K];
      if (Result = False) and (SummaryArray[K] <> 0) then
        Result := True;
      end
    else
      begin
      if K = 0 then
        SummaryArray[K] := OpeningBal
      else
        begin
        if DecimalPlaces = 0 then
          SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k - 1]]);
        if DecimalPlaces = 1 then
          SummaryArray[K] := round(DetailArray[SummaryPeriodIndexArray[k - 1]] * 10) / 10;
        end;
      if (Result = False) and (SummaryArray[K] <> 0) then
        Result := True;
      end;
    inc(k);
    end;    // while
  if IsOpeningBal then
    begin
    if DecimalPlaces = 0 then
      SummaryArray[CFREngine.PeriodCount] := round(DetailArray[SummaryPeriodIndexArray[CFREngine.PeriodCount - 1]]);
    if DecimalPlaces = 1 then
       SummaryArray[CFREngine.PeriodCount] := round(DetailArray[SummaryPeriodIndexArray[CFREngine.PeriodCount - 1]] * 10) / 10;
    if SummaryArray[CFREngine.PeriodCount] <> 0 then
      Result := True;      
    end;
end;

procedure TBalanceSheetReport.CashAccountOut(TitlePrefix : string; DataRec: TCashFlowReportRecPtr; LineHeight : Integer);
var
  I : Integer;
  HasBalance : Boolean;
begin
  for I := 0 to NUM_DAYSINYEAR do    // Iterate
    DataRec.PlanDetail[I] := round(DataRec.PlanDetail[I]);
  BuildSummary(DataRec.Accountno, CFREngine.psdate, CFREngine.pedate, DataRec.PlanDetail, DataRec.planSummary);
  HasBalance := False;
  DataRec.PlanTotal := 0;
  for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
    begin
    if (HasBalance = False) and (DataRec.PlanSummary[I] <> 0) then
      HasBalance := True;
    DataRec.PlanTotal := DataRec.PlanTotal + DataRec.PlanSummary[I];
    end;
  if HasBalance then
    begin
    for I := 0 to CFREngine.PeriodCount - 1 do    // Iterate
      Totalamounts[I] := TotalAmounts[I] + DataRec.PlanSummary[I];
    GroupTotal := GroupTotal + DataRec.PlanTotal;
    rowout(TitlePrefix + DataRec.AccountTitle, DataRec.PlanSummary, DataRec.PlanTotal, 0);
    CY := CY + LineHeight;
    end;
end;

Function TBalanceSheetReport.BSAccountOut(DataRec: TCashFlowReportRecPtr; LineHeight : Integer): Boolean;
var
  I : Integer;
//  HasBalance : Boolean;
  ArrayTotal : Currency;
begin
  Result := BuildCFSummary(ArrayTotal, DataRec.PlanDetail, DataRec.PlanSummary, DataRec.OpeningBalance, True, 0);
  if Result then
    begin
    for I := 0 to CFREngine.PeriodCount do    // Iterate
      Totalamounts[I] := TotalAmounts[I] + DataRec.PlanSummary[I];
    rowout(DataRec.AccountTitle, DataRec.PlanSummary, DataRec.PlanSummary[CFREngine.PeriodCount], 0);
    CY := CY + LineHeight;
    end;
end;

procedure TBalanceSheetReport.calcequity;
var
  I: Integer;
  Temp : Currency;
  EquityRec : TCashFlowReportRecPtr;
  EquityInjectedRec : TCashFlowReportRecPtr;
  EquityWithdrawnRec : TCashFlowReportRecPtr;
  IncTaxIncurredRec : TCashFlowReportRecPtr;
  DividendDeclaredRec : TCashFlowReportRecPtr;
  NPRec : TCashFlowReportRecPtr;
begin
  CFREngine.GetAccountRec(EQUITY, EquityRec);
  CFREngine.GetAccountRec(EQUITY_INJECTED, EquityInjectedRec);
  CFREngine.GetAccountRec(EQUITY_WITHDRAWN, EquityWithdrawnRec);
  CFREngine.GetAccountRec(INC_TAX_INCURRED, IncTaxIncurredRec);
  CFREngine.GetAccountRec(DIV_DECLARED, DividendDeclaredRec);
  CFREngine.GetAccountRec(NETPROFIT, NPRec);
  for I := 0 to trunc(CFREngine.pedate) - trunc(CFREngine.psdate) do    // Iterate
    begin
    temp := NPRec.PlanDetail[I]
            + EquityInjectedRec.PlanDetail[I]
            - EquityWithdrawnRec.PlanDetail[I]
            - IncTaxIncurredRec.PlanDetail[I]
            - DividendDeclaredRec.PlanDetail[I];
    if I = 0 then
      EQUITYRec.PlanDetail[I] := equityRec.OpeningBalance + Temp

    else
      EQUITYRec.PlanDetail[I] := equityRec.PlanDetail[I - 1] + temp;
    end;    // for
end;
function TBalanceSheetReport.AnnualiseFactor(periodNo : Integer): extended;
var
  DaysinYear, DaysinPeriod : integer;
begin
  DaysinYear := trunc(CFREngine.pedate) - trunc(CFREngine.psdate) + 1;
  if periodno = 0 then
    DaysinPeriod := trunc(ChartDates[0]) - trunc(CFREngine.psdate) + 1
  else
    DaysinPeriod := trunc(ChartDates[periodno]) - trunc(ChartDates[periodno - 1]);
  result := DaysinYear / Daysinperiod;
end;

end.
