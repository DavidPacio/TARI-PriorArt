unit TargetPDFReports;

interface

Uses windows, graphics, classes, sysutils, auchTypes, DMClient,
    DataCollector, printers, CustomPDFReport;

Type

  TPLTrendReport = class(TCustomReport)
  private
    procedure CheckColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    procedure RepBody;  Override;
  public
    constructor Create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    property DetailWidth;
    property Consolidate;
    Property UseColor;
    property currentFont;
    property DefaultOrientation;
    Property DocTitle;
    procedure DoPDFReport;  Override;
  end;

  TKeyTrendReport = class(TCustomReport)
  private
    procedure CheckColumns;
    function RowOut(AccountRec : TReportDataRecPtr): Boolean;
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    procedure RepBody;  Override;
  public
    constructor Create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    property DetailWidth;
    property Consolidate;
    Property UseColor;
    property currentFont;
    property DefaultOrientation;
    procedure DoPDFReport;  Override;
  end;

  TDPLTrendReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
    TotalNoColumns: Integer;
    PageStartColNo, PageEndColNo : integer;
    procedure MakeColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
    function PCSalesRowOut(AccountRec : TPlanDataRecPtr): Boolean;
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  Protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    procedure RepBody;  Override;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    property DetailWidth;
    property Consolidate;
    Property UseColor;
    property currentFont;
    property DefaultOrientation;
    procedure DoPDFReport;  Override;
  end;

  TKeyTargetReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
    TotalNoColumns: Integer;
    PageStartColNo, PageEndColNo : integer;
    procedure MakeColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
//    procedure CalculateKeys;
    procedure SetAccount(AccountRec : TPlanDataRecPtr);
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    procedure RepBody;  Override;
  public
    DetailedReportingPeriod : integer;
    constructor Create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    property DetailWidth;
    property Consolidate;
    Property UseColor;
    property currentFont;
    property DefaultOrientation;
    procedure DoPDFReport;  Override;
  end;

  Var
    Totalpages : integer;

implementation


{TPLTrendreport}
constructor TPLTrendReport.create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);

  DataCollect.GetConsolidatedList(Consolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
end;

destructor TPLTrendReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TPLTrendReport.DoPDFReport;
begin
  CheckColumns; // Check out zero value columns
  if DetailWidth < 19.00 then
    DefaultOrientation := poPortrait
  else
    DefaultOrientation := poLandscape;
  SetPage;
  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);
  PDF.Title := DocTitle;

  PDFPtr.PageContentCompression := True;
  PDFPtr.JPEGCompression := True;

  PDF.BeginDoc;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Size := 12;
  PDF.Canvas.Font.Style := [fsBold];
  PDF.Canvas.Pen.Width := cmtopx(PENWIDTH);
  PDF.Canvas.Pen.Color := clBlack;
  PDF.Canvas.Pen.Style := psSolid;

  RepPageHeader;

  RepBody;

  RepPageFooter;

  TotalPages := Pdf.PageNumber;

  PDF.EndDoc;
end;

procedure TPLTrendReport.CheckColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  AccountRec : TPlanDataRecPtr;
  ItemsToDelete : array[1..18] of Boolean;
begin
  // initialise
  for I := 1 to Columns.count - 1 do
   ItemsToDelete[I] := true;

  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.MinorCol = 1
      then begin
      AccountRec := PlanDataList.Items[getaccountlistindex(SALES)];
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
        then ItemsToDelete[I] := False;
      AccountRec := PlanDataList.Items[getaccountlistindex(GROSSPROFIT)];
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
        then ItemsToDelete[I] := False;
      AccountRec := PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)];
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
        then ItemsToDelete[I] := False;
      AccountRec := PlanDataList.Items[getaccountlistindex(NETPROFIT)];
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
        then ItemsToDelete[I] := False;
      if ItemsToDelete[I] = False
        then begin
        ItemsToDelete[I - 1] := False;
        ItemsToDelete[I + 1] := False;
      end;
    end;
  end;
  for I := 18 downto 1 do    // Iterate
    begin
    if ItemsToDelete[I] and (I <= Columns.count - 1)
      then begin
      repcol := TRepColPtr(Columns.Items[I]);
      Dispose(Columns.Extract(RepCol));
//      Columns.Delete(I);
    end;
  end;    // for
  // Adjust the starting positions for each remaining column
  DetailWidth := TITLEWIDTH;
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.Minorcol = 0 then
      Repcol.start := DetailWidth;
    if Repcol.minorcol = 1
      then begin
      Repcol.start := DetailWidth;
      DetailWidth := DetailWidth + DOLLARWIDTH;
    end;
    if Repcol.minorcol = 2
      then begin
      Repcol.start := DetailWidth;
      DetailWidth := DetailWidth + PERCENTWIDTH;
    end;
  end;
end;

procedure TPLTrendReport.RepPageHeader;
var
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
  ColY : integer;
//  Subtitle : array[0..15] of char;
  annualiseStr : string[5];
begin
  If PageNumber <> 0
    then begin
    RepPageFooter;
    PDF.NewPage;
  end;
  CX := LM;
  CY := TM;
//  SetBookMarks;
  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := HEADERFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  CentreText(LM, RM, DataModuleClient.BusinessDetailsBusiness_Name.Value);

  CY := CY + PDF.Canvas.TextHeight('A');
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  Pdf.Canvas.Font.Size := TITLEFONTSIZE;

//  setline;
  CentreText(LM, RM, Reportname);

  PDF.Canvas.Font.Style := [];
  Pdf.Canvas.Font.Size := SECTIONFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY + round(Metrics.tmHeight * 1.5);

  if Consolidate then
    LeftText('Department/Revenue Group: Consolidated')
  else
    LeftText('Department/Revenue Group: ' + DataModuleClient.DepartmentsRevenue_Group_Name.Value);

  // Output Group Header
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight * 0.75);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  ColY := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0
      then begin
      if Repcol.AnnualFactor = 1 then
        AnnualiseStr := ''
      else begin
        Annualised := True;
        AnnualiseStr := '*';
      end;
      CY := ColY;
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      PDF.Canvas.Font.Style := [fsBold];
      if (Repcol.Source = PAST) then
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Past' + AnnualiseStr)
      else
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr);
      CY := CY + Metrics.tmHeight;
      PDF.Canvas.Font.Style := [];
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Repcol.FromDate + ' to ' + Repcol.ToDate);
      if NewY > Yext then Yext := NewY;
      NewY := CY;
    end;
  end;    // for
  // Output Column Headings for subcolumns
  Yext := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  CY := Yext + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if RepCol.minorcol = 1
      then begin
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, '$');
    end;
    if Repcol.minorcol = 2
      then begin
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, '%');
    end;
  end;    // for
  CY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0
      then begin
      with PDF.canvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), Yext);
        Lineto(DetailOffset + cmtopx(repcol.start) + cmtopx(Repcol.width), Yext);
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;
    if Repcol.minorCol = 2
      then begin
      with PDF.canvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), Yext);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;
  end;
  with PDF.canvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  inc(PageNumber);
end;

procedure TPLTrendReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0
      then begin
      with PDF.canvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;
    if Repcol.minorCol = 2
      then begin
      with PDF.canvas do
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
      end;    // with
    end;
  end;

  with PDF.canvas do
    begin
    moveto(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  if Annualised
    then begin
    PDF.Canvas.Font.Style := [fsItalic];
    PDF.Canvas.Font.Size := 10;
    CY := BM - cmtopx(0.55) - PDF.Canvas.TextHeight('A');
    LeftText('* These figures have been Annualised for comparative purposes');
  end;

  PDF.Canvas.Font.Style := [fsItalic];
  PDF.Canvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  LeftText(formatDateTime('dddddd h:nn:ss am/pm', Now));
  PDF.Canvas.Font.Style := [];
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  RightText('Page ' + InttoStr(PageNumber));
end;

procedure TPLTrendReport.RepBody;
var
  I: Integer;
  Metrics: TTextMetric;
begin
  PDF.Canvas.Font.Name := CurrentFont;
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  // Set to Baseline
  DrawTop := CY;

  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  PDF.Canvas.Font.Style := [fsBold, fsUnderline];
  LeftinColumn(0, 'Income');
  PDF.Canvas.Font.Style := [];
  CY := CY + Metrics.tmHeight;
  // Rowout(AccountNum)
  if rowout(PlanDataList.Items[getaccountlistindex(SALES)]) then
    CY := CY + Metrics.tmHeight;
  if rowout(PlanDataList.Items[getaccountlistindex(COGS)])
    then begin
    CY := CY + Metrics.tmHeight ;
    horzLine(2, 0);
    if rowout(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]) then
     CY := CY + Metrics.tmHeight ;
  end;
  horzLine(1, 0);
  // Heading
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  LeftinColumn(0, 'Less Expenses');
  PDF.Canvas.Font.Style := [];
  CY := CY + Metrics.tmHeight;
  for I := 0 to PlanExpDataList.count -1 do    // Iterate
    begin
    if rowout(PlanExpDataList.Items[I]) then
      CY := CY + Metrics.tmHeight ;
    if CY + cmtopx(4.0) > BM then
      RepPageHeader;
  end;    // for
  horzLine(2, 0);
//  CY := CY + Metrics.tmHeight;
  if rowout(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]) then
    CY := CY + Metrics.tmHeight ;
  horzLine(1, 0);
//  CY := CY + Metrics.tmHeight;
  if rowout(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]) then
    CY := CY + Metrics.tmHeight ;
  if rowout(PlanDataList.Items[getaccountlistindex(OTHERINCOME)])
    then begin
    CY := CY + Metrics.tmHeight ;
    horzLine(2, 0);
    if rowout(PlanDataList.Items[getaccountlistindex(NETPROFIT)]) then
      CY := CY + Metrics.tmHeight ;
  end;
end;

function TPLTrendReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
  TextAmount : string[50];
  TextImage : string[50];
begin
  NonZero := false;

  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorcol = 1
      then begin
      if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
        ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
        then nonzero := True;
    end;
  end;

  if Nonzero
    then begin
    LeftinColumn(0, StrPas(AccountRec.AccountTitle));
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '';
      if Repcol.minorcol = 1
        then begin
        TextImage := '0';
        if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0))
          then textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PastBalances[Repcol.DateIdx - 1] / Repcol.annualFactor);
        if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)
          then textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanTotal / Repcol.annualFactor);
      end;
      if Repcol.minorcol = 2
        then begin
        TextImage := '0.0';
        if (Repcol.Source = PAST)
           and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1] <> 0)
           and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)
           then textAmount := formatFloat(REPORTTENSCURRENCY, AccountRec.PastBalances[Repcol.DateIdx - 1] * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1]);
        if (Repcol.Source = TARGET)
           and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal <> 0)
           and (AccountRec.PlanTotal <> 0)
           then textAmount := formatFloat(REPORTTENSCURRENCY, AccountRec.PlanTotal * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal);
      end;
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
    end;    // for
  end;
  Result := NonZero;
end;

{TKeyTrendreport}
constructor TKeyTrendReport.create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);

  DataCollect.GetConsolidatedList(Consolidate);
  DataCollect.getReportData;
end;

destructor TKeyTrendReport.Destroy;
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TKeyTrendReport.DoPDFReport;
begin
  CheckColumns; // Check out zero value columns
  if DetailWidth < 19.00 then
    DefaultOrientation := poPortrait
  else
    DefaultOrientation := poLandscape;
  SetPage;
  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);

  PDF.BeginDoc;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Size := 12;
  PDF.Canvas.Font.Style := [fsBold];
  PDF.Canvas.Pen.Width := cmtopx(PENWIDTH);
  PDF.Canvas.Pen.Color := clBlack;
  PDF.Canvas.Pen.Style := psSolid;

  RepPageHeader;

  RepBody;

  RepPageFooter;

  TotalPages := Pdf.PageNumber;

  PDF.EndDoc;
end;

procedure TKeyTrendReport.CheckColumns;
var
  I: Integer;
  repcol : TRepColPtr;
  AccountRec : TReportDataRecPtr;
  ItemsToDelete : array[1..18] of Boolean;
begin
  // initialise
  for I := 1 to Columns.count - 1 do
   ItemsToDelete[I] := true;
  for I := 1 to Columns.count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    AccountRec := ReportDataList.Items[GetReportAccountIndex(SALES)];
    if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
      ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[GetReportAccountIndex(GROSSPROFIT)];
    if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
      ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[GetReportAccountIndex(TOTALEXPENSES)];
    if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
      ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
    AccountRec := ReportDataList.Items[GetReportAccountIndex(NETPROFIT)];
    if ((Repcol.Source = PAST) and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)) or
      ((Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0))
      then ItemsToDelete[I] := False;
  end;
  for I := Columns.count downto 1 do    // Iterate
    begin
    if ItemsToDelete[I] and (I <= Columns.count - 1)
      then begin
      repcol := TRepColPtr(Columns.Items[I]);
      Dispose(Columns.Extract(RepCol));
//      Columns.Delete(I);
    end;
  end;    // for
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
  annualiseStr : string[5];
begin
  If PageNumber <> 0
    then begin
    RepPageFooter;
    PDF.NewPage;
  end;
  CX := LM;
  CY := TM;
//  SetBookMarks;
  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := HEADERFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  CentreText(LM, RM, DataModuleClient.BusinessDetailsBusiness_Name.Value);

  CY := CY + PDF.Canvas.TextHeight('A');
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  Pdf.Canvas.Font.Size := TITLEFONTSIZE;

//  setline;
  CentreText(LM, RM, Reportname);

  PDF.Canvas.Font.Style := [];
  Pdf.Canvas.Font.Size := SECTIONFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY + round(Metrics.tmHeight * 1.5);

  if Consolidate then
    LeftText('Department/Revenue Group: Consolidated')
  else
    LeftText('Department/Revenue Group: ' + DataModuleClient.DepartmentsRevenue_Group_Name.Value);

  // Output Group Header
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight * 0.75);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
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
    PDF.Canvas.Font.Style := [fsBold];
    if (Repcol.Source = PAST) then
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Past' + AnnualiseStr)
    else
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr);
    CY := CY + Metrics.tmHeight;
    PDF.Canvas.Font.Style := [];
    CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Repcol.FromDate + ' to ' + Repcol.ToDate);
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDF.canvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  inc(PageNumber);
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
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;

  with PDF.canvas do
    begin
    moveto(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  if Annualised
    then begin
    PDF.Canvas.Font.Style := [fsItalic];
    PDF.Canvas.Font.Size := 10;
    CY := BM - cmtopx(0.55) - PDF.Canvas.TextHeight('A');
    LeftText('* These figures have been Annualised for comparative purposes');
  end;

  PDF.Canvas.Font.Style := [fsItalic];
  PDF.Canvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  LeftText(formatDateTime('dddddd h:nn:ss am/pm', Now));
  PDF.Canvas.Font.Style := [];
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  RightText('Page ' + InttoStr(PageNumber));
end;

procedure TKeyTrendReport.RepBody;
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
  PDF.Canvas.Font.Name := CurrentFont;
  Pdf.Canvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  DrawTop := CY;

  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  PDF.Canvas.Font.Style := [];
  // Rowout(AccountNum)
  SectionContainsValidLine := False;
  for I := 0 to ReportDataList.count - 1
    do begin
    AccountRec := TReportDataRecPtr(ReportDataList.Items[I]);
    if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
      PDF.Canvas.Font.Style := [fsBold]
    else if (AccountRec.Accountno = HRSPERDAY) then
      PDF.Canvas.Font.Style := [fsBold,fsItalic]
    else
      PDF.Canvas.Font.Style := [];
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
  TextAmount : string[50];
  TextImage : string[50];
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
    LeftinColumn(0, StrPas(AccountRec.AccountTitle));
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
constructor TDPLTrendReport.create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);

  DataCollect.GetConsolidatedList(Consolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;
  DataCollect.getPlanningExpData(False);
  BodyFontSize := 8;
  ColMargin := 0.05;
  Narrowrep := False;
end;

destructor TDPLTrendReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearPlanExpDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TDPLTrendReport.DoPDFReport;
var
  j: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
begin
  // create the correct summary.
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
      TotalNoColumns :=  createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) + 1
    else TotalNoColumns := DaysinYear + 2;
  PageStartColNo := 0;
  if TotalNoColumns < 15
    then PageEndColNo := TotalNoColumns - 1
  else PageEndColNo := 14;   // Set up the first 15 columns

  for j := 0 to 6 do    // Iterate  // Use 6 as this only need
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
  SetPage;
//  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);

  PDF.BeginDoc;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Size := 12;
  PDF.Canvas.Font.Style := [fsBold];
  PDF.Canvas.Pen.Width := cmtopx(PENWIDTH);
  PDF.Canvas.Pen.Color := clBlack;
  PDF.Canvas.Pen.Style := psSolid;

  RepPageHeader;

  RepBody;

  RepPageFooter;

  TotalPages := Pdf.PageNumber;

  PDF.EndDoc;
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
  If PageNumber <> 0
    then begin
    RepPageFooter;
    PDF.NewPage;
  end;
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := HEADERFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  CentreText(LM, RM, DataModuleClient.BusinessDetailsBusiness_Name.Value);

  CY := CY + PDF.Canvas.TextHeight('A');
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  if NarrowRep then
    Pdf.Canvas.Font.Size := TITLEFONTSIZE
  else
    Pdf.Canvas.Font.Size := DETAILEDTITLEFONTSIZE;

//  setline;
  CentreText(LM, RM, Reportname + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value));

  PDF.Canvas.Font.Style := [];
  if NarrowRep then
    Pdf.Canvas.Font.Size :=  SECTIONFONTSIZE
  else
    Pdf.Canvas.Font.Size :=  DETAILEDSECTIONFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY + round(Metrics.tmHeight * 1.5);


  // Calculate Width of Report for this page
  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);

  if Consolidate then
    LeftText('Department/Revenue Group: Consolidated')
  else
    LeftText('Department/Revenue Group: ' + DataModuleClient.DepartmentsRevenue_Group_Name.Value);

  // Output Group Header
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight * 0.75);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    Pdf.Canvas.Font.Size :=   DETAILFONTSIZE
  else
    Pdf.Canvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDF.Canvas.Font.Style := [fsBold];
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
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDF.canvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  inc(PageNumber);
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
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;

  with PDF.canvas do
    begin
    moveto(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with

  PDF.Canvas.Font.Style := [fsItalic];
  PDF.Canvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  LeftText(formatDateTime('dddddd h:nn:ss am/pm', Now));
  PDF.Canvas.Font.Style := [];
  if NarrowRep then
    PDF.Canvas.Font.Size := DETAILFONTSIZE
  else
    Pdf.Canvas.Font.Size := BodyFontSize;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  RightText('Page ' + InttoStr(PageNumber));
end;

procedure TDPLTrendReport.RepBody;
var
  I: Integer;
  Metrics: TTextMetric;
begin
  while PageStartColNo < TotalNoColumns do
    begin
    PDF.Canvas.Font.Name := CurrentFont;
    if NarrowRep then
      PDF.Canvas.Font.Size := DETAILFONTSIZE
    else
      Pdf.Canvas.Font.Size := BodyFontSize;
    SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
    GetTextMetrics(PDF.Canvas.Handle, Metrics);

    // Set to Baseline
    DrawTop := CY;

    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    PDF.Canvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Income');
    PDF.Canvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    // Rowout(AccountNum)
    if rowout(PlanDataList.Items[getaccountlistindex(SALES)]) then
      CY := CY + Metrics.tmHeight;
    if rowout(PlanDataList.Items[getaccountlistindex(COGS)])
      then begin
      CY := CY + Metrics.tmHeight ;
      horzLine(2, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)])
        then begin
        CY := CY + Metrics.tmHeight ;
        PCSalesRowOut(PlanDataList.Items[getaccountlistindex(GROSSPROFIT)]);
        CY := CY + Metrics.tmHeight ;
      end;
    end;
    horzLine(1, 0);
    // Heading
    PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
    LeftinColumn(0, 'Less Expenses');
    PDF.Canvas.Font.Style := [];
    CY := CY + Metrics.tmHeight;
    for I := 0 to PlanExpDataList.count -1 do    // Iterate
      begin
      if rowout(PlanExpDataList.Items[I]) then
        CY := CY + Metrics.tmHeight ;
      if CY + cmtopx(4.0) > BM then
        RepPageHeader;
    end;    // for
    horzLine(2, 0);
  //  CY := CY + Metrics.tmHeight;
    if rowout(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)])
      then begin
      CY := CY + Metrics.tmHeight ;
      PCSalesRowOut(PlanDataList.Items[getaccountlistindex(TOTALEXPENSES)]);
      CY := CY + Metrics.tmHeight ;
    end;
    horzLine(1, 0);
  //  CY := CY + Metrics.tmHeight;
    if rowout(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)])
      then begin
      CY := CY + Metrics.tmHeight ;
      PCSalesRowOut(PlanDataList.Items[getaccountlistindex(NETOPERATINGPROFIT)]);
      CY := CY + Metrics.tmHeight ;
    end;
    if rowout(PlanDataList.Items[getaccountlistindex(OTHERINCOME)])
      then begin
      CY := CY + Metrics.tmHeight ;
      horzLine(2, 0);
      if rowout(PlanDataList.Items[getaccountlistindex(NETPROFIT)])
        then begin
        CY := CY + Metrics.tmHeight ;
        PCSalesRowOut(PlanDataList.Items[getaccountlistindex(NETPROFIT)]);
        CY := CY + Metrics.tmHeight ;
      end;
    end;

    PageStartColNo := PageEndColNo + 1;
    PageEndColNo := PageStartColNo + 14;
    if PageEndColNo > (TotalNoColumns - 1) then
      PageEndColNo := TotalNoColumns - 1;
    if PageStartColNo < TotalNoColumns then
      RepPageHeader;
  end;    // while
end;

function TDPLTrendReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
  TextAmount : string[50];
  TextImage : string[50];
begin
  if AccountRec.Nonzero
    then begin
    LeftinColumn(0, StrPas(AccountRec.AccountTitle));
    TextImage := '0';
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if RepCol.source = 1 then
        textAmount := formatfloat(REPORTROUNDCURRENCY, AccountRec.PlanTotal)
      else begin
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
  TextAmount : string[50];
  TextImage : string[50];
  SalesRec : TPlanDataRecPtr;
begin
  if AccountRec.Nonzero
    then begin
    SalesRec := PlanDataList.Items[getaccountlistindex(SALES)];
    LeftinColumn(0, StrPas(AccountRec.AccountTitle) + ' %');
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
//  Repcol.ColNo := 0;
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
//    Repcol.ColNo := I + 1;
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
  DetailWidth := cx;
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
constructor TKeyTargetReport.create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);

  DataCollect.GetConsolidatedList(Consolidate);
  if DataCollect.Planloaded = false then
    DataCollect.getPlanningData;

  BodyFontSize := 8;
  ColMargin := 0.05;
  Narrowrep := False;
end;

destructor TKeyTargetReport.Destroy;
begin
  DataCollect.ClearPlanDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TKeyTargetReport.DoPDFReport;
var
  j: Integer;
  DaysinYear : integer;
  SummaryPtr : TPlanDataRecPtr;
begin
  // create the correct summary.
  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
  if DetailedReportingPeriod > 0 then
      TotalNoColumns :=  createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCurrentPlanStart.value, DataModuleClient.DepartmentsCurrentPlanEnd.value) + 1
    else TotalNoColumns := DaysinYear + 2;
  PageStartColNo := 0;
  if TotalNoColumns < 15
    then PageEndColNo := TotalNoColumns - 1
  else PageEndColNo := 14;   // Set up the first 15 columns

  for J := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1) do
    begin
    SummaryPtr := PlanDataList.Items[GetaccountListIndex(KeyTargets[j])];
    BuildSummary(SummaryPtr.Accountno, True, SummaryPtr.PlanDetail, SummaryPtr.PlanSummary);
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

  if DetailedReportingPeriod > 4
    then begin
    DefaultOrientation := poPortrait;
    Narrowrep := True;
  end
  else
    DefaultOrientation := poLandscape;
  SetPage;
//  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);

  PDF.BeginDoc;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Size := 12;
  PDF.Canvas.Font.Style := [fsBold];
  PDF.Canvas.Pen.Width := cmtopx(PENWIDTH);
  PDF.Canvas.Pen.Color := clBlack;
  PDF.Canvas.Pen.Style := psSolid;

  RepPageHeader;

  RepBody;

  RepPageFooter;

  TotalPages := Pdf.PageNumber;

  PDF.EndDoc;
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
  If PageNumber <> 0
    then begin
    RepPageFooter;
    PDF.NewPage;
  end;
  CX := LM;
  CY := TM;
//  SetBookMarks;

  MakeColumns;

  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := HEADERFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  CentreText(LM, RM, DataModuleClient.BusinessDetailsBusiness_Name.Value);

  CY := CY + PDF.Canvas.TextHeight('A');
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  if NarrowRep then
    Pdf.Canvas.Font.Size := TITLEFONTSIZE
  else
    Pdf.Canvas.Font.Size := DETAILEDTITLEFONTSIZE;

//  setline;
  CentreText(LM, RM, Reportname + ' for the period ending '
   + FormatDateTime('dd MMM yyy', DataModuleClient.DepartmentsCurrentPlanEnd.value));

  PDF.Canvas.Font.Style := [];
  if NarrowRep then
    Pdf.Canvas.Font.Size :=  SECTIONFONTSIZE
  else
    Pdf.Canvas.Font.Size :=  DETAILEDSECTIONFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY + round(Metrics.tmHeight * 1.5);

  // Calculate Width of Report for this page
  DetailOffset := LM + round((RM - LM - cmtopx(DetailWidth))/ 2);

  if Consolidate then
    LeftText('Department/Revenue Group: Consolidated')
  else
    LeftText('Department/Revenue Group: ' + DataModuleClient.DepartmentsRevenue_Group_Name.Value);

  // Output Group Header
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight * 0.75);
  // set Top of box
  DrawTop := CY;
  CY := CY + round(Metrics.tmHeight / 2);
  // Set baseline
  if NarrowRep then
    Pdf.Canvas.Font.Size :=   DETAILFONTSIZE
  else
    Pdf.Canvas.Font.Size := BodyFontSize;
  CY := CY + Metrics.tmAscent;
  Yext := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    PDF.Canvas.Font.Style := [fsBold];
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
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;
  with PDF.canvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with
  inc(PageNumber);
end;

procedure TKeyTargetReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
begin
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDF.canvas do
      begin
      MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
      Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
    end;    // with
  end;

  with PDF.canvas do
    begin
    moveto(DetailOffset + cmtopx(DetailWidth), DrawTop);
    LineTo(DetailOffset + cmtopx(DetailWidth), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
  end;    // with

  PDF.Canvas.Font.Style := [fsItalic];
  PDF.Canvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  LeftText(formatDateTime('dddddd h:nn:ss am/pm', Now));
  PDF.Canvas.Font.Style := [];
  if NarrowRep then
    PDF.Canvas.Font.Size := DETAILFONTSIZE
  else
    Pdf.Canvas.Font.Size := BodyFontSize;
  CY := BM - cmtopx(0.05) - PDF.Canvas.TextHeight('A');
  RightText('Page ' + InttoStr(PageNumber));
end;

procedure TKeyTargetReport.RepBody;
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
  while PageStartColNo < TotalNoColumns do
    begin
    PDF.Canvas.Font.Name := CurrentFont;
    if NarrowRep then
      PDF.Canvas.Font.Size := DETAILFONTSIZE
    else
      Pdf.Canvas.Font.Size := BodyFontSize;
    SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
    GetTextMetrics(PDF.Canvas.Handle, Metrics);

    // Set to Baseline
    DrawTop := CY;

    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    PDF.Canvas.Font.Style := [];
    // Rowout(AccountNum)
    SectionContainsValidLine := False;
    for I := 0 to integer(Trunc(sizeof(KeyTargets)/sizeof(integer)) - 1)
      do begin
      AccountRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(KeyTargets[I])]);
      if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
        PDF.Canvas.Font.Style := [fsBold]
      else if (AccountRec.Accountno = HRSPERDAY) then
        PDF.Canvas.Font.Style := [fsBold, fsItalic]
      else
        PDF.Canvas.Font.Style := [];
      if AccountRec.Accountno = NETOPERATINGPROFIT
        then begin
        DataRec := TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(OTHERINCOME)]);
        AccountRec.Nonzero := DataRec.Nonzero;
      end;
      if rowout(AccountRec)
        then begin
        CY := CY + Metrics.tmHeight;
        SectionContainsValidLine := True;
      end;
      if SectionContainsValidLine and
        (AccountRec.Accountno = GPPC) // or (AccountRec.Accountno = TOTALEXPPC))
        then begin
        horzLine(2, 0);
        SectionContainsValidLine := False;
      end;
      if SectionContainsValidLine and
        ((AccountRec.Accountno = NETPROFIT) or (AccountRec.Accountno = HRSPERDAY))
        then begin
        horzLine(1, 0);
        SectionContainsValidLine := False;
      end;
    end;

    PageStartColNo := PageEndColNo + 1;
    PageEndColNo := PageStartColNo + 14;
    if PageEndColNo > (TotalNoColumns - 1) then
      PageEndColNo := TotalNoColumns - 1;
    if PageStartColNo < TotalNoColumns then
      RepPageHeader;
  end;    // while
end;

function TKeyTargetReport.RowOut(AccountRec : TPlanDataRecPtr): Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
  TextAmount : string[50];
  TextImage : string[50];
  SmallerFont : Boolean;
begin
  if AccountRec.Nonzero
    then begin
    LeftinColumn(0, StrPas(AccountRec.AccountTitle));
    TextImage := '0';
    SmallerFont := False;
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if AccountRec.FormatImage <> 'Mins'
        then begin
        if RepCol.source = 1 then
          textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanTotal)
        else begin
          if DetailedReportingPeriod = 0 then
            textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanDetail[RepCol.DateIdx])
          else
            textAmount := formatfloat(AccountRec.FormatImage, AccountRec.PlanSummary[RepCol.DateIdx]);
        end;
      end
      else begin
        SmallerFont := True;
        PDF.Canvas.Font.Size := PDF.Canvas.Font.Size - 1;
        if (Repcol.Source = 1) then
          Textamount := inttostr(trunc(AccountRec.PlanTotal)) + 'hr ' + inttostr(trunc(AccountRec.PlanTotal * 60) mod 60) + 'mins'
        else begin
          if DetailedReportingPeriod = 0 then
            textAmount := inttostr(trunc(AccountRec.PlanDetail[RepCol.DateIdx])) + 'hr ' + inttostr(trunc(AccountRec.PlanDetail[RepCol.DateIdx] * 60) mod 60) + 'mins'
          else
            textAmount := inttostr(trunc(AccountRec.PlanSummary[RepCol.DateIdx])) + 'hr ' + inttostr(trunc(AccountRec.PlanSummary[RepCol.DateIdx] * 60) mod 60) + 'mins';
        end;
      end;
      DecAligninColumn(I, TextAmount, textImage);
      if SmallerFont
        then begin
        PDF.Canvas.Font.Size := PDF.Canvas.Font.Size + 1;
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
  DetailWidth := cx;
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

end.
