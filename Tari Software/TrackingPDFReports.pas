unit TrackingPDFReports;

interface

Uses windows, graphics, classes, sysutils, auchTypes, DMClient,
    DataCollector, printers, CustomPDFReport, variants, InvoiceClass,
    lGlobals;

Type

  TQuotesReport = class(TCustomReport)
  private
    InvNumberText: string;
    StartItem : Integer;
    Procedure InvRowsOut(Rowheight : Integer);
    function RowOut(Balances: TQuoteValues; Rownum : TQuoteRepRows) : Boolean;
    function InvCount: Integer;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    Function RepBody : Boolean;  Override;
  public
    StartDate : TDateTime;
    EndDate : TDateTime;
//    UseActualUnits : Boolean;
		constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    function GetNextPage : Boolean;  Override;
  end;

  TInvoicesReport = class(TCustomReport)
  private
//    InvNumberText: string;
    StartItem : Integer;
 //   InvoiceO : TInvoiceDetail;
    Totals : array[1..8] of currency;
    procedure RowOut(Idx : integer);
  protected

    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    Function RepBody : Boolean;  Override;
  public
    StartDate : TDateTime;
    EndDate : TDateTime;
    PastInvoices : Boolean;
    LastPage : Boolean;
    LocalInvType : TInvType;
    InvoiceRate : Currency;
    LocalStartDate, LocalEndDate : TDateTime;
    InvoiceO : TInvoiceDetail;
    // hides the original but it works!
		constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    function GetNextPage : Boolean;  Override;
    procedure SortInvoices(sortType: TInvoiceSortType);
  end;

  TTrackingKeyReport = class(TCustomReport)
  private
    ShowAnnualiseNote : Boolean;
    CatchUpUnits, CatchupTari : array[0..7] of currency;
		CatchUpGP : Currency;
    BilledIdx, RateIdx : integer;
    function RowOut(AccountRec : TReportDataRecPtr): Boolean;
    procedure NewColumns;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    Function RepBody : Boolean;  Override;
  public
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    function GetNextPage: Boolean;  Override;
  end;

  TDeptTrackingKeyReport = class(TCustomReport)
  private
    ShowAnnualiseNote : Boolean;
//    CatchUpUnits, CatchupTari : array[0..7] of currency;
//    CatchUpGP : Currency;
//    BilledIdx, RateIdx : integer;
    DeptIndex : integer;
    HeightofRow : Integer;
    function RowOut(AccountIndex : Integer; DeptRec : TConsolidDeptRecPtr): Boolean;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    Function RepBody : Boolean;  Override;
  public
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    function GetNextPage: Boolean;  Override;
  end;

  TKeyTrendReport = class(TCustomReport)
  private
    Narrowrep: boolean;
    ChartDates : TDateTimeArray;
//    TotalNoColumns: Integer;
//    PageStartColNo, PageEndColNo : integer;
    procedure MakeColumns;
    function RowOut(AccountRec : TReportDataRecPtr) : Boolean;
    procedure SetAccount(AccountRec : TReportDataRecPtr);
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

  TTrackingDPLReport = class(TCustomReport)
  private
    StartIndex : Integer;
    function RowOut(AccountRec : TReportDataRecPtr): Boolean;
    function PCSalesRowOut(AccountRec : TReportDataRecPtr): Boolean;
  protected
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    Function RepBody : Boolean;  Override;
  public
    DetailedReportingPeriod : integer;
    OffsetTitle : Boolean;
    constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    function GetNextPage: Boolean;  Override;
  end;

Var
  Showdetail: Boolean;
  Totalpages : integer;
  QstartDate, QEndDate, PeriodStartDate : TDateTime;
  QuotesortType : TQuoteSortType;
  SummaryType : integer;
  PdfInvType: TInvType;
  IsCashFlowReport : Boolean;

implementation


{TQuotesReport}
constructor TQuotesReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolid);
//  if DataModuleClient.Planloaded = false then
  StartDate := QStartDate;
  EndDate := QEndDate;

  DataCollect.getQuotes(StartDate, EndDate);
  ColMargin := 0.05;
  StartItem := 0;
end;

destructor TQuotesReport.Destroy;
begin
  DataCollect.ClearQuoteList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TQuotesReport.GetNextPage: Boolean;
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

  RepPageHeader;

  Result := RepBody;
  RepPageFooter;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TQuotesReport.RepPageHeader;
var
  I: Integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  ColY : integer;
  Coltitle : string;
begin
  CX := LM;
  CY := TM;
  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);

  PDFCanvas.Font.Style := [];
  PDFCanvas.Font.Size := DETAILFONTSIZE;

  // set Top of box
  DrawTop := CY;
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight / 3);
  // Set baseline
  CY := CY + Metrics.tmAscent;
//  Yext := CY;
  ColY := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      CY := ColY;
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      PDFCanvas.Font.Style := [fsBold];
        case (RepCol.Majorcol - 1) of    //
        0: ColTitle := '';
				1: ColTitle := 'Sale ' + DataModuleClient.DepartmentsCurrency.AsString + '~A';
				2: ColTitle := 'Materials ' + DataModuleClient.DepartmentsCurrency.AsString + '~B';
				3: ColTitle := 'Subs '+ DataModuleClient.DepartmentsCurrency.AsString + '~C';
				4: ColTitle := 'Gross Profit ' + DataModuleClient.DepartmentsCurrency.AsString + '~D=A-(B+C)';
        5: ColTitle := 'GP%~E=D/A';
				6: ColTitle := 'Billed ' + DataModuleClient.DepartmentsPlural_UnitDesc.AsString + '~F';
        7: begin
						if DataModuleClient.DepartmentsPlural_UnitDesc.AsString = 'Hours' then
              ColTitle := 'Actual~Hours - G'
            else
              ColTitle := '';
           end;
        8: begin
						if (GGlobals.TimeSheetRate) and (DataModuleClient.DepartmentsPlural_UnitDesc.AsString = 'Hours') then
              ColTitle := 'Average Rate~H=D/G'
            else
              ColTitle := 'Average Rate~H=D/F';
           end;
        end;    // case
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Coltitle);
      end;
    end;    // for
  // Output Column Headings for subcolumns
//  Yext := Yext + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
  CY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 3);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      with PDFCanvas do
        begin
//        MoveTo(DetailOffset + cmtopx(repcol.start), Yext);
//        Lineto(DetailOffset + cmtopx(repcol.start) + cmtopx(Repcol.width), Yext);
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;    // with
      end;
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

procedure TQuotesReport.RepPageFooter;
var
  RateNote : String;
begin
  PDFCanvas.Font.Style := [fsItalic];
  PDFCanvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDFCanvas.TextHeight('A');
  if DataModuleClient.DepartmentsPlural_UnitDesc.Value = 'Hours' then
    begin
    if GGlobals.TimeSheetRate then
      RateNote := '(Rate calculated on Actual Hours)'
    else
      RateNote := '(Rate calculated on Billed Hours)';
    end;
  CX := DetailOffset + round(cmtopx(DetailWidth) / 2) - Round((PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN)) / 2);
  CentreandWrap(CY, CX, PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN) * 2, RateNote);
end;

Function TQuotesReport.RepBody : Boolean;
var
  I, J, TY, HeightofRow: Integer;
  Metrics: TTextMetric;
  QuoteDataRec : TQuoteRecPtr;
  JQR : TQuoteRepRows;
  repcol : TRepColPtr;
  Varg : Variant;
begin
  result := False;
  varg := VarArraycreate([0,2], VarVariant);
  PDFCanvas.Font.Name := CurrentFont;
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  for I := StartItem to QuoteList.count - 1 do    // Iterate
    begin
    InvNumberText := '';
    HeightofRow := CY;
    QuoteDataRec := QuoteList.items[I];
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    PDFCanvas.Font.Style := [fsBold];

    repcol := TRepColPtr(Columns.Items[0]);
    CX := DetailOffset + cmtopx(RepCol.start);
    PdfCanvas.TextOut(CX, CY, 'Group ID: ' + QuoteDataRec.Quote_Number);

    repcol := TRepColPtr(Columns.Items[2]);
    CX := DetailOffset + cmtopx(RepCol.start - 10);
    PdfCanvas.TextOut(CX, CY, 'Date: ' + FormatDateTime(GGlobals.DateFENH, QuoteDataRec.Quote_date));

    repcol := TRepColPtr(Columns.Items[4]);
    CX := DetailOffset + cmtopx(RepCol.start);
    PdfCanvas.TextOut(CX, CY, 'Customer / Name / Product: ' + QuoteDataRec.Quote_Customer);

    if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour')
         and (round(QuoteDataRec.HourstoRun) <> 0) then
      begin
      repcol := TRepColPtr(Columns.Items[7]);
      CX := DetailOffset + cmtopx(RepCol.start);
      if QuoteDataRec.HourstoRun > 0 then
        PdfCanvas.TextOut(CX, CY, 'Hours to Run: '+ formatfloat(REPORTROUNDCURRENCY, QuoteDataRec.Hourstorun))
      else
        PdfCanvas.TextOut(CX, CY, 'Hours to Run: '+ QuoteDataRec.HourstorunS);
      end;
    // Set to Baseline
    PDFCanvas.Font.Style := [];
    CY := CY + round(Metrics.tmHeight / 2);
    DrawTop := CY;

    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 3);
    for JQR := QrrQuote to QrrVariance do    // Iterate
      begin
      if Showdetail and (JQR = QrrActual) then
        begin
        Varg[0] := QuoteDataRec.Depart_ID;
        varg[1] := QuoteDataRec.Quote_Number;
        DataModuleClient.QuotesLU.Locate('Dept_ID;Quote_Number', varg, []);
        if InvCount > 1 then
          begin
          PDFCanvas.Font.Style := [fsItalic];
          InvRowsout(Metrics.tmHeight);
          PDFCanvas.Font.Style := [];
          CY := CY - Metrics.tmheight;
          TY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
          with PdfCanvas do
            begin
            Moveto(DetailOffset, TY);
            LineTo(DetailOffset + cmtopx(DetailWidth), TY);
            end;    // with
          CY := CY + Metrics.tmHeight * 2;
          end;
        end;
      if rowout(QuoteDataRec.Values, JQR) then
        begin
        if JQR <> QrrVariance then
          begin
          TY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 2);
          with PdfCanvas do
            begin
            Moveto(DetailOffset, TY);
            LineTo(DetailOffset + cmtopx(DetailWidth), TY);
            end;    // with
          CY := CY + Metrics.tmHeight * 2;
          end;
        end;
      end;    // for
    // Rowout(AccountNum)

    CY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 3);
    for J := 1 to Columns.Count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[J]);
      if Repcol.minorCol = 0 then
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
      Moveto(DetailOffset, DrawTop);
      LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
      LineTo(DetailOffset + cmtopx(RightEdge), CY);
      LineTo(DetailOffset, CY);
      Lineto(DetailOffset, DrawTop);
      end;    // with
    HeightofRow := CY - HeightofRow;
    // Check for remaining space. BM is adjust for current Footer height approx.
    if (I < (QuoteList.count - 1))
      and ((CY + HeightofRow) > (BM - cmtopx(0.05) - PDFCanvas.TextHeight('A') - cmtopx(4.0))) then
      begin
      StartItem := I + 1;
      Result := True;
      exit;
      end; //     RepPageHeader;
    end;    // for
end;

function TQuotesReport.RowOut(Balances: TQuoteValues; Rownum : TQuoteRepRows) : Boolean;
var
  I: TQuoteFields;
//  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
begin
//  PDFCanvas.Font.Style := [];
  Result := True;
  if RowNum = QrrQuote then
    CentreinColumn(0, 'Group Target')
  else
    if RowNum = QrrActual then
      begin
      if InvNumberText = '' then
        CentreinColumn(0, 'Invoice Total')
      else
        CentreinColumn(0, 'Invoice ' + InvNumberText);
      end
    else
    CentreinColumn(0, 'Variance');
  for I := qfSales to qfRate do    // Iterate
    begin
//    repcol := TRepColPtr(Columns.Items[Ord(I)]);
    textamount := '-';
    TextImage := '0.00';
    if (I <> QfTimeSheetHours)
			or ((I = QfTimeSheetHours) and (DataModuleClient.DepartmentsSingular_UnitDesc.AsString = 'Hour')) then
			Textamount := formatfloat(REPORTCENTSCURRENCY, Balances[I, RowNum]);
    if length(textImage) > 0 then
      DecAligninColumn(Ord(I) + 1, TextAmount, textImage);
    end;    // for
end;

Procedure TQuotesReport.InvRowsOut(Rowheight : Integer);
var
	TextAmount : string;
	TextImage : string;
  GPValue : Currency;
begin
//  PDFCanvas.Font.Style := [];
  DataModuleClient.InvQuoteLU.First;
  while DataModuleClient.InvQuoteLu.eof = False do
    begin
    if (DataModuleClient.InvQuoteLUINV_DATE.Value >= StartDate)
      and (DataModuleClient.InvQuoteLUINV_DATE.Value <= Enddate) then
      begin
			CentreinColumn(0, DataModuleClient.InvQuoteLUInvoice_Number.AsString);
      textamount := '-';
      TextImage := '0.00';
			Textamount := formatfloat(REPORTCENTSCURRENCY, DataModuleClient.InvQuoteLUNetSales.Value);
      if length(textImage) > 0 then
				DecAligninColumn(1, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      Textamount := formatfloat(REPORTCENTSCURRENCY, DataModuleClient.InvQuoteLUMaterialsatCost.Value);
      if length(textImage) > 0 then
        DecAligninColumn(2, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      Textamount := formatfloat(REPORTCENTSCURRENCY, DataModuleClient.InvQuoteLUSubcontractors.Value);
      if length(textImage) > 0 then
        DecAligninColumn(3, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      GPValue := DataModuleClient.InvQuoteLUNetSales.Value - DataModuleClient.InvQuoteLUMaterialsatCost.Value - DataModuleClient.InvQuoteLUSubcontractors.Value;
      Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue);
      if length(textImage) > 0 then
        DecAligninColumn(4, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue * 100 / DataModuleClient.InvQuoteLUNetSales.Value);
      if length(textImage) > 0 then
        DecAligninColumn(5, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      Textamount := formatfloat(REPORTCENTSCURRENCY, DataModuleClient.InvQuoteLUUnitsRequired.Value);
      if length(textImage) > 0 then
        DecAligninColumn(6, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour') then
        Textamount := formatfloat(REPORTCENTSCURRENCY, DataModuleClient.InvQuoteLURecordedUnits.Value);
      if length(textImage) > 0 then
        DecAligninColumn(7, TextAmount, textImage);
      textamount := '-';
      TextImage := '0.00';
      Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue / DataModuleClient.InvQuoteLUUnitsRequired.Value);
      if length(textImage) > 0 then
        DecAligninColumn(8, TextAmount, textImage);
      CY := CY + Rowheight;
      end;
    DataModuleClient.InvQuoteLU.Next;
    end;
end;

function TQuotesReport.InvCount: Integer;
begin
  result := 0;
  DataModuleClient.InvQuoteLU.First;
  while DataModuleClient.InvQuoteLu.eof = False do
    begin
    Inc(Result);
    if Result = 1 then
			InvNumberText := DataModuleClient.InvQuoteLUInvoice_Number.AsString
		else
      InvNumberText := '';
    DataModuleClient.InvQuoteLU.Next;
    end;
end;

{TInvoicesReport}
constructor TInvoicesReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
var
  I: Integer;
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  StartDate := QStartDate;
  EndDate := QEndDate;
  LocalInvType := PDFInvType;
  for I := 1 to 8 do    // Iterate
    Totals[I] := 0;
  ColMargin := 0.05;
  StartItem := 0;
end;

destructor TInvoicesReport.Destroy;
begin
  inherited destroy;
end;

function TInvoicesReport.GetNextPage: Boolean;
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

  RepPageHeader;
  // set lastPage for Footer
  Result := RepBody;

  if Result then
    LastPage := False
  else
    Lastpage := True;

  RepPageFooter;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TInvoicesReport.RepPageHeader;
var
  I: Integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  ColY : integer;
  Coltitle : string;
begin
  CX := LM;
  CY := TM;
  PDFCanvas.Font.Name := CurrentFont;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);

  PDFCanvas.Font.Style := [];
  PDFCanvas.Font.Size := DETAILFONTSIZE;

  // set Top of box
  DrawTop := CY;
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  CY := CY + round(Metrics.tmHeight / 3);
  // Set baseline
  CY := CY + Metrics.tmAscent;
//  Yext := CY;
  ColY := CY;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    if Repcol.minorCol = 0 then
      begin
      CY := ColY;
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      PDFCanvas.Font.Style := [fsBold];
        case (RepCol.Majorcol - 1) of    //
        0: ColTitle := '';
				1: ColTitle := 'Sale ' + DataModuleClient.DepartmentsCurrency.AsString + '~A';
        2: ColTitle := 'Materials ' + DataModuleClient.DepartmentsCurrency.AsString + '~B';
				3: ColTitle := 'Subs '+ DataModuleClient.DepartmentsCurrency.AsString + '~C';
				4: ColTitle := 'Gross Profit ' + DataModuleClient.DepartmentsCurrency.AsString + '~D=A-(B+C)';
        5: ColTitle := 'GP%~E=D/A';
				6: ColTitle := 'Billed ' + DataModuleClient.DepartmentsPlural_UnitDesc.AsString + '~F';
        7: begin
						if DataModuleClient.DepartmentsPlural_UnitDesc.AsString = 'Hours' then
              ColTitle := 'Actual~Hours - G'
            else
              ColTitle := '';
           end;
        8: begin
						if (GGlobals.TimeSheetRate) and (DataModuleClient.DepartmentsPlural_UnitDesc.AsString = 'Hours') then
              ColTitle := 'Average Rate~H=D/G'
            else
              ColTitle := 'Average Rate~H=D/F';
           end;
        end;    // case
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Coltitle);
      end;
    end;    // for
  CY := CY + Metrics.tmHeight - Metrics.tmAscent + round(Metrics.tmHeight / 3);
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

procedure TInvoicesReport.RepPageFooter;
var
  J : integer;
  RateNote : String;
  repcol : TRepColPtr;
  Metrics: TTextMetric;
	TextAmount : string;
	TextImage : string;
begin
  with PDFCanvas do
    begin
    Moveto(DetailOffset, CY);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    end;    // with
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  CY := CY + Metrics.tmHeight;
  PDFCanvas.font.Style := [fsBold];
  if not LastPage then
    CentreinColumn(0, 'Sub-Total')
  else
    CentreinColumn(0, 'Totals');
  textamount := '-';
  TextImage := '0.00';
	Textamount := formatfloat(REPORTCENTSCURRENCY, Totals[1]);
  if length(textImage) > 0 then
		DecAligninColumn(1, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  Textamount := formatfloat(REPORTCENTSCURRENCY, totals[2]);
  if length(textImage) > 0 then
    DecAligninColumn(2, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  Textamount := formatfloat(REPORTCENTSCURRENCY, totals[3]);
  if length(textImage) > 0 then
    DecAligninColumn(3, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  totals[4] := totals[1] - totals[2] - totals[3];
  Textamount := formatfloat(REPORTCENTSCURRENCY, totals[4]);
  if length(textImage) > 0 then
    DecAligninColumn(4, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  if totals[1] > 0 then
    Textamount := formatfloat(REPORTCENTSCURRENCY, totals[4] * 100 / totals[1]);
  if length(textImage) > 0 then
    DecAligninColumn(5, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  Textamount := formatfloat(REPORTCENTSCURRENCY, totals[6]);
  if length(textImage) > 0 then
    DecAligninColumn(6, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour') then
    Textamount := formatfloat(REPORTCENTSCURRENCY, totals[7]);
  if length(textImage) > 0 then
    DecAligninColumn(7, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  if (GGlobals.TimeSheetRate) and (DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours') then
    begin
    if Totals[7] <> 0 then
      Textamount := formatfloat(REPORTCENTSCURRENCY, totals[4] / totals[7]);
    End
  else
    begin
    if totals[6] <> 0 then
      Textamount := formatfloat(REPORTCENTSCURRENCY, totals[4] / totals[6]);
    end;
  if length(textImage) > 0 then
    DecAligninColumn(8, TextAmount, textImage);
  CY := CY + round(Metrics.tmHeight / 2);
//  CY := CY + round(Metrics.tmHeight / 2);
  PDFCanvas.font.Style := [];
  for J := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[J]);
    if Repcol.minorCol = 0 then
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
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
  // Check for remaining space. BM is adjust for current Footer height approx.
  PDFCanvas.Font.Style := [fsItalic];
  PDFCanvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDFCanvas.TextHeight('A');
  if DataModuleClient.DepartmentsPlural_UnitDesc.Value = 'Hours' then
    begin
//    if LocalInvType <> AnalysisInv then
//      begin
      if GGlobals.TimeSheetRate then
        RateNote := '(Rate calculated on Actual Hours)'
      else
        RateNote := '(Rate calculated on Billed Hours)';
//      end;
    end;
  CX := DetailOffset + round(cmtopx(DetailWidth) / 2) - Round((PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN)) / 2);
  CentreandWrap(CY, CX, PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN) * 2, RateNote);
end;

Function TInvoicesReport.RepBody : Boolean;
var

  I, HeightofRow: Integer;
  Metrics: TTextMetric;
  Varg : Variant;
begin
  result := False;
  varg := VarArraycreate([0,2], VarVariant);
  PDFCanvas.Font.Name := CurrentFont;
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  Varg[0] := DataModuleClient.DepartmentsDept_ID.value;
  HeightofRow := CY;
  PDFCanvas.Font.Style := [];
  DrawTop := CY;
  for I := StartItem to InvoiceO.InvoiceCount - 1 do    // Iterate
    begin
    CY := CY + Metrics.tmHeight;
    Rowout(I);
    if (I < (InvoiceO.InvoiceCount - 1))
      and ((CY + HeightofRow) > (BM - cmtopx(0.05) - PDFCanvas.TextHeight('A') - cmtopx(4.0))) then
      begin
      StartItem := I + 1;
      Result := True;
      break;
      end; //     RepPageHeader;
    end;    // for
  PDFCanvas.Font.Style := [];
  CY := CY + round(Metrics.tmHeight / 2);
end;

procedure TInvoicesReport.RowOut(Idx : integer);
var
	TextAmount : string;
	TextImage : string;
  GPValue : Currency;
  Invoice: TInvoiceRecPtr;
begin
  invoice := InvoiceO.getinvoice(idx);
  CentreinColumn(0, Invoice.Invoice_Number);
  textamount := '-';
  TextImage := '0.00';
  totals[1] := Totals[1] + Invoice.NetSales;
  Textamount := formatfloat(REPORTCENTSCURRENCY, Invoice.NetSales);
  if length(textImage) > 0 then
    DecAligninColumn(1, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  totals[2] := Totals[2] + Invoice.materials;
  Textamount := formatfloat(REPORTCENTSCURRENCY, Invoice.materials);
  if length(textImage) > 0 then
    DecAligninColumn(2, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  totals[3] := Totals[3] + Invoice.subcon;
  Textamount := formatfloat(REPORTCENTSCURRENCY, Invoice.subcon);
  if length(textImage) > 0 then
    DecAligninColumn(3, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  GPValue := Invoice.NetSales - Invoice.materials - Invoice.subcon;
  Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue);
  if length(textImage) > 0 then
    DecAligninColumn(4, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue * 100 / Invoice.NetSales);
  if length(textImage) > 0 then
    DecAligninColumn(5, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  totals[6] := Totals[6] + Invoice.Units;
  Textamount := formatfloat(REPORTCENTSCURRENCY, Invoice.Units);
  if length(textImage) > 0 then
    DecAligninColumn(6, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  totals[7] := Totals[7] + Invoice.TSunits;
  if (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour') then
    Textamount := formatfloat(REPORTCENTSCURRENCY, Invoice.TSunits);
  if length(textImage) > 0 then
    DecAligninColumn(7, TextAmount, textImage);
  textamount := '-';
  TextImage := '0.00';
  if (GGlobals.TimeSheetRate) and (DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours') then
    begin
    if Invoice.TSunits <> 0 then
      Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue / Invoice.TSUnits);
    End
  else
    begin
    if Invoice.Units <> 0 then
      Textamount := formatfloat(REPORTCENTSCURRENCY, GPValue / Invoice.Units)
    end;
  if length(textImage) > 0 then
    DecAligninColumn(8, TextAmount, textImage);
end;

procedure TInvoicesReport.SortInvoices(sortType: TInvoiceSortType);
begin

  InvoiceO.sortInvoiceList(sortType);
end;

{TTrackingKeyReport}
constructor TTrackingKeyReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  ShowAnnualiseNote := False;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolidate);
  DataCollect.getTrackingkeyData(False, QStartDate, QEndDate, periodstartDate, SummaryType);
end;

destructor TTrackingKeyReport.Destroy;
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

Function TTrackingKeyReport.GetNextPage : Boolean;
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

  RepPageHeader;

  Result := RepBody;

  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TTrackingKeyReport.RepPageHeader;
var
  ColY: Integer;
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext, midY, MidX: integer;
//  Subtitle : array[0..15] of char;
	annualiseStr : string;
  Sectionheading : string;
  TempLM, tempRM : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  // set Top of box
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Style := [fsBold];
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  DrawTop := CY;
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  Yext := CY;
  NewY := CY;
  ColY := CY;
  MidY := CY;
  MidX := CX;
  PDFCanvas.Font.Style := [];
  if PageNumber = 2 then
    begin
    repcol := TRepColPtr(Columns.Items[0]);
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    CY := ColY;
		CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Targets to catch up Gross Profit of ' + DataModuleClient.DepartmentsCURRENCY.AsString + formatFloat(REPORTROUNDCURRENCY, CatchupGP * -1));
    end;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    AnnualiseStr := '';
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    CY := ColY;
    if PageNumber = 1 then
      begin
      if (I = 2) or (I = 5) then
        begin
        PDFCanvas.Font.Style := [fsBold];
        if I = 2 then
          SectionHeading := 'Period - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
        if I = 5 then
          SectionHeading := 'Year to Date - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
        tempLM := CX - cmtopx(repcol.width);
        tempRM := tempLM + 3 * cmtopx(repcol.width) - 2 * cmtopx(COLMARGIN);
        Centretext(tempLM, tempRM, SectionHeading);
        end;
      CY := CY + Metrics.tmDescent + round(Metrics.tmHeight / 2);
      end;
    if I = 1 then
      begin
      MidY := CY;
      MidX := DetailOffset + cmtopx(repcol.start);
      end;
    if PageNumber = 1 then
      begin
      CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
      PDFCanvas.Font.Style := [];
      if (Repcol.Source = TRACK) then
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Actual' + AnnualiseStr)
      else
        if (Repcol.Source = TARGET) then
          CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr)
        else
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Variance' + AnnualiseStr);
      end;
    if PageNumber = 2 then
      begin
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Week Ending ' + Repcol.ToDate);
      end;
    if NewY > Yext then
      Yext := NewY;
    NewY := CY;
    end;    // for
  // Output Column Headings for subcolumns
  CY := CY + Metrics.tmDescent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      if (I = 1) or (I = 4) or (PageNumber = 2) then
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop)
      else
        MoveTo(DetailOffset + cmtopx(repcol.start), MidY);
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
    if PageNumber = 1 then
      begin
      Moveto(MidX, MidY);
      Lineto(DetailOffset + cmtopx(RightEdge), MidY);
      end;
  end;    // with
//  inc(PageNumber);
end;

procedure TTrackingKeyReport.RepPageFooter;
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
end;

Function TTrackingKeyReport.RepBody : Boolean;
var
  I, K: Integer;
  Metrics: TTextMetric;
  AccountRec : TReportDataRecPtr;
  SectionContainsValidLine : Boolean;
	TextAmount : string;
	TextImage : string;
begin
  result := False;
  PDFCanvas.Font.Name := CurrentFont;
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  // Set to Baseline
  DrawTop := CY;
  if PageNumber = 1 then
    begin
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    PDFCanvas.Font.Style := [];
    // Rowout(AccountNum)
    SectionContainsValidLine := False;
    for I := 0 to ReportDataList.count - 1 do
      begin
      AccountRec := TReportDataRecPtr(ReportDataList.Items[I]);
      if AccountRec.Accountno = GROSSPROFIT then
        CatchUpGP := AccountRec.TrackBalances[trytdvar];
      if (AccountRec.Accountno = BILLED) then
        BilledIdx := I;
      if (AccountRec.Accountno = GPUNIT) then
        RateIdx := I;
      if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
        PDFCanvas.Font.Style := [fsBold]
      else
        if (AccountRec.Accountno = HRSPERDAY) then
          PDFCanvas.Font.Style := [fsBold, fsItalic]
        else
          PDFCanvas.Font.Style := [];
      if rowout(ReportDataList.Items[I]) then
        begin
        CY := CY + Metrics.tmHeight;
        SectionContainsValidLine := True;
        end;
      if SectionContainsValidLine and
        ((AccountRec.Accountno = GPPC) or (AccountRec.Accountno = TOTALEXPPC)) then
        begin
        horzLine(2, 0);
        SectionContainsValidLine := False;
        end;
      if SectionContainsValidLine and
        ((AccountRec.Accountno = NPPC) or (AccountRec.Accountno = FTEPROD)
        or (AccountRec.Accountno = NPUNIT) or (AccountRec.Accountno = NPWAGE)) then
        begin
        horzLine(1, 0);
        SectionContainsValidLine := False;
        end;
      end;
    CY := CY - Round(Metrics.tmHeight / 2);
    RepPageFooter;
    end;

  // New Page
  // Show Current Targets for the next 6 weeks
  // show targets for recovery in 1 to 6 weeks
  if (CatchupGP < 0) and (PageNumber = 1) then
    begin
    NewColumns;
    Result := True;
    end;

  if (CatchupGP < 0) and (PageNumber = 2) then
    begin
    DrawTop := CY;
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
//    LeftinColumn(0, 'Targets to catch up Gross Profit of $' + formatFloat(REPORTROUNDCURRENCY, CatchupGP * -1));
//    CY := CY {+ Metrics.tmHeight} + round(Metrics.tmHeight / 2);
//    horzLine(1, 0);
    for k := -1 to 7 do    // Iterate
      begin
      CY := CY - round(Metrics.tmHeight / 3);
      DataCollect.GPCatchUp(K, CatchupGP, CatchUPUnits, CatchupTari, QEndDate);
      PDFCanvas.Font.Style := [fsBold];
      if K = -1 then
        LeftinColumn(0, 'Original Targets');
      if K = 0 then
        LeftinColumn(0, 'Targets to recover in ' + inttostr(K + 1) + ' Week');
      if K > 0 then
        LeftinColumn(0, 'Targets to recover in ' + inttostr(K + 1) + ' Weeks');
      PDFCanvas.Font.Style := [];
      CY := CY + Round(Metrics.tmHeight / 1);
      AccountRec := TReportDataRecPtr(ReportDataList.Items[BilledIdx]);
      LeftinColumn(0, AccountRec.AccountTitle);
      for I := 1 to 8 do    // Iterate
        begin
        textamount := '-';
        TextImage := '0';
        if CatchupUnits[i - 1] <> 0 then
            textAmount := formatFloat(REPORTROUNDCURRENCY, CatchupUnits[I - 1]);
        if length(textImage) > 0 then
          DecAligninColumn(I, TextAmount, textImage);
        end;    // for
      CY := CY + Round(Metrics.tmHeight / 1);
      AccountRec := TReportDataRecPtr(ReportDataList.Items[RateIdx]);
      LeftinColumn(0, '# ' + AccountRec.AccountTitle);
      for I := 1 to 8 do    // Iterate
        begin
        textamount := '-';
        TextImage := '0';
        if CatchupTari[I - 1] <> 0 then
          textAmount := formatFloat(REPORTCENTSCURRENCY, CatchupTari[I - 1]);
        if length(textImage) > 0 then
          DecAligninColumn(I, TextAmount, textImage);
        end;    // for
      CY := CY + Round(Metrics.tmHeight / 2);
      if k < 7 then // no line in the last
        horzLine(2, 0);
      end;    // for
    CY := CY - round(Metrics.tmHeight / 3);
    RepPageFooter;
    end;
end;

procedure TTrackingKeyReport.NewColumns;
var
  I: Integer;
  cx : extended;
  colnum: Integer;
  Repcol : TRepColPtr;
//  Consolid, UseCol : Boolean;
begin
  // Clean up old columns
  DeleteColumns;
  Columns := Tlist.Create;
  cx := TITLEWIDTH;
  colnum := 1;
  new(RepCol);
  Repcol.Majorcol := colnum;
  repcol.Minorcol := 0;
  Repcol.Start := 0;
  RepCol.Width := cx;
  Columnadd(Repcol);
  inc(Colnum);
  for I := 0 to 7 do    // Iterate
    begin
    new(RepCol);
    Repcol.Start := cx;
    Repcol.Majorcol := colnum;
    Repcol.Minorcol := 0;
    RepCol.Width := (KEYINDICATORWIDTH * 6) / 8;
    Repcol.DateIdx := 0;
    RepCol.Source := TARGET;
    RepCol.ToDate := FormatDateTime(GGlobals.getDateFENH, QEndDate + ((I + 1) * 7));
    cx := cx + Repcol.width;
    Columnadd(Repcol);
    inc(Colnum);
  end;    // for
//  CurrentReport.DetailWidth := cx;
end;

function TTrackingKeyReport.RowOut(AccountRec : TReportDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I : Integer;
  repcol : TRepColPtr;
  TrackBal : TTrackingBals;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
  Bals : Currency;
	annualiseStr : string;
begin
  NonZero := false;
  Bals := 0;

  for TrackBal := trperActual to trytdPlan do    // Iterate
    Bals := Bals + AccountRec.TrackBalances[TrackBal];
  if Bals <> 0 then nonzero := True;

  if Nonzero then
    begin
    if AccountRec.Annualise then
      annualiseStr := '*'
    else
      annualiseStr := '';
    if AccountRec.Accountno <> GPUNIT then
      LeftinColumn(0, AccountRec.AccountTitle + AnnualiseStr)
    else
      LeftinColumn(0, '# ' + AccountRec.AccountTitle + AnnualiseStr);
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '0';
      if (I < 3) or (I = 6)then
        TrackBal := TTRackingBals(I - 1)
      else
        if I = 3 then
          TrackBal := TTrackingBals(I + 1)
        else
          TrackBal := TTrackingBals(I - 2);

      if AccountRec.Annualise then
        begin
        ShowAnnualiseNote := True;
        if AccountRec.TrackBalances[TrackBal] <> 0 then
          textAmount := formatFloat(AccountRec.FormatImage, AccountRec.TrackBalances[TrackBal] / Repcol.annualFactor);
        end
      else
        begin
        if AccountRec.Symbol <> 'Mins' then
          begin
          if AccountRec.TrackBalances[TrackBal] <> 0 then
            textAmount := formatFloat(AccountRec.FormatImage, AccountRec.TrackBalances[TrackBal]);
          end
        else
          begin
          if AccountRec.TrackBalances[TrackBal] <> 0 then
            textAmount := inttostr(trunc(AccountRec.TrackBalances[TrackBal])) + 'hr ' + inttostr(trunc(AccountRec.TrackBalances[TrackBal] * 60) mod 60) + 'mins';
          end;
        end;
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
      end;    // for
    end;
  Result := NonZero;
end;

{TDeptTrackingKeyReport}
constructor TDeptTrackingKeyReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
var
  I, K: Integer;
  NewDeptRecPtr : TConsolidDeptRecPtr;
  TotalDeptRecPtr : TConsolidDeptRecPtr;
//  SummaryBalances : array[0..7] of TTrackBalances;
  TrackValue : TTrackingBals;
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  ShowAnnualiseNote := False;
  HeightofRow := 0;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolid {Consolidate});
  if Assigned(DeptReportDataList) then
    begin
    if DeptReportDataList.Count > 0 then
      DataCollect.ClearDeptReportDataList;
    end;
  if not Assigned(DeptReportDataList) then
    DeptReportDataList := Tlist.create;
  new(TotalDeptRecPtr);
  FillChar(TotalDeptRecPtr^, sizeof(TConsolidDeptRecPtr), #0);
  TotalDeptRecPtr.Name := 'Consolidated Total';
  TotalDeptRecPtr.UnitDescS := 'Unit';
  TotalDeptRecPtr.UnitDescP := 'Units';
  for I := 0 to  7 do    // Iterate
    begin
    for TrackValue := trperactual to trytdvar do    // Iterate
      begin
      TotalDeptRecPtr.SummaryBalances[I][Trackvalue] := 0;
      end;    // for
    end;    // for
  for I := 0 to ConsolidList.Count - 1 do    // Iterate
    begin
    New(NewDeptRecPtr);
    FillChar(NewDeptRecPtr^, sizeof(TConsolidDeptRecPtr), #0);
    NewDeptRecPtr.DeptId := TDepartRecPtr(ConsolidList.Items[i]).DeptId;
    NewDeptRecPtr.Name := TDepartRecPtr(ConsolidList.Items[i]).Name;
    NewDeptRecPtr.CurrencySymbol := TDepartRecPtr(ConsolidList.Items[i]).CurrencySymbol;
    NewDeptRecPtr.UnitDescS := TDepartRecPtr(ConsolidList.Items[i]).UnitDescS;
    NewDeptRecPtr.UnitdescP := TDepartRecPtr(ConsolidList.Items[i]).UnitdescP;
    DataCollect.getDeptTrackingkeyData(NewDeptRecPtr, QStartDate, QEndDate, periodstartDate, SummaryType);
    for K := 0 to 7 do    // Iterate
      begin
//      SummaryBalances[K][trperactual] := SummaryBalances[K][trperactual] + NewDeptRecPtr.SummaryBalances[K][trperactual];
//      SummaryBalances[K][trperplan] := SummaryBalances[K][trperPlan] + NewDeptRecPtr.SummaryBalances[K][trperplan];
//      SummaryBalances[K][trytdactual] := SummaryBalances[K][trytdactual] + NewDeptRecPtr.SummaryBalances[K][trytdactual];
//      SummaryBalances[K][trytdplan] := SummaryBalances[K][trytdplan] + NewDeptRecPtr.SummaryBalances[K][trytdplan];
      TotalDeptRecPtr.SummaryBalances[K][trperactual] := TotalDeptRecPtr.SummaryBalances[K][trperactual] + NewDeptRecPtr.SummaryBalances[K][trperactual];
      TotalDeptRecPtr.SummaryBalances[K][trperplan] := TotalDeptRecPtr.SummaryBalances[K][trperPlan] + NewDeptRecPtr.SummaryBalances[K][trperplan];
      TotalDeptRecPtr.SummaryBalances[K][trytdactual] := TotalDeptRecPtr.SummaryBalances[K][trytdactual] + NewDeptRecPtr.SummaryBalances[K][trytdactual];
      TotalDeptRecPtr.SummaryBalances[K][trytdplan] := TotalDeptRecPtr.SummaryBalances[K][trytdplan] + NewDeptRecPtr.SummaryBalances[K][trytdplan];
      end;    // for
    DeptReportDataList.add(NewDeptRecPtr);
    end;    // for
  DeptReportDataList.add(TotalDeptRecPtr);
  Datacollect.CalculateCrossKeyReportData;
end;

destructor TDeptTrackingKeyReport.Destroy;
begin
  DataCollect.ClearDeptReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

Function TDeptTrackingKeyReport.GetNextPage : Boolean;
begin
  if PageNumber = 1 then
    begin
    SetmapMode(PdfCanvas.Handle, MM_TEXT);
    SetPage;
    DeptIndex := 0;
    end;
  PDFCanvas.font.PixelsPerInch := getdevicecaps(PDFCanvas.Handle, LOGPIXELSX);
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Size := 12;
  PDFCanvas.Font.Style := [fsBold];
  PDFCanvas.Pen.Width := cmtopx(PENWIDTH);
  PDFCanvas.Pen.Color := clBlack;
  PDFCanvas.Pen.Style := psSolid;

  RepPageHeader;

  Result := RepBody;

  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TDeptTrackingKeyReport.RepPageHeader;
var
  ColY: Integer;
  I: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext{, midY, MidX}: integer;
//  Subtitle : array[0..15] of char;
	annualiseStr : string;
  Sectionheading : string;
  TempLM, tempRM : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  // set Top of box
  PDFCanvas.Font.Name := CurrentFont;
  PDFCanvas.Font.Style := [fsBold];
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  DrawTop := CY;
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  Yext := CY;
  NewY := CY;
  ColY := CY;
//  MidY := CY;
//  MidX := CX;
  PDFCanvas.Font.Style := [];
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    AnnualiseStr := '';
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    CY := ColY;
    if (I = 2) or (I = 5) then
      begin
      PDFCanvas.Font.Style := [fsBold];
      if I = 2 then
        SectionHeading := 'Period - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
      if I = 5 then
        SectionHeading := 'Year to Date - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
      tempLM := CX - cmtopx(repcol.width);
      tempRM := tempLM + 3 * cmtopx(repcol.width) - 2 * cmtopx(COLMARGIN);
      Centretext(tempLM, tempRM, SectionHeading);
      CY := CY + round(Metrics.tmHeight * 2);
      end;
//    if I = 1 then
//      begin
//      MidY := CY;
//      MidX := DetailOffset + cmtopx(repcol.start);
//      end;
//    if PageNumber = 1 then
//      begin
{      CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
      PDFCanvas.Font.Style := [];
      if (Repcol.Source = TRACK) then
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Actual' + AnnualiseStr)
      else
        if (Repcol.Source = TARGET) then
          CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr)
        else
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Variance' + AnnualiseStr);
}
//      end;
    if NewY > Yext then
      Yext := NewY;
    NewY := CY;
    end;    // for
  // Output Column Headings for subcolumns
  CY := CY + Metrics.tmDescent + round(Metrics.tmHeight / 2);

  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      if (I = 1) or (I = 4) then
        begin
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop);
        Lineto(DetailOffset + cmtopx(Repcol.Start), CY);
        end;
      end;    // with
    end;
  with PDFCanvas do
    begin
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
//    if PageNumber = 1 then
//      begin
//      Moveto(MidX, MidY);
//      Lineto(DetailOffset + cmtopx(RightEdge), MidY);
//      end;
    end;    // with
//  inc(PageNumber);
end;

procedure TDeptTrackingKeyReport.RepPageFooter;
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
    Moveto(DetailOffset, DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), DrawTop);
    LineTo(DetailOffset + cmtopx(RightEdge), CY);
    LineTo(DetailOffset, CY);
    Lineto(DetailOffset, DrawTop);
    end;    // with
end;

Function TDeptTrackingKeyReport.RepBody : Boolean;
var
  I: Integer;
  repcol : TRepColPtr;
  HighestRowH : integer;
  Metrics: TTextMetric;
  DeptRec : TConsolidDeptRecPtr;
  SectionContainsValidLine : Boolean;
begin
  result := False;
  PDFCanvas.Font.Name := CurrentFont;
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  HighestRowH := CY;
  // Set to Baseline
  // we have each dept with up to 8 accounts. we don't allow any dept to split over the page
  // we remember which dept we are up to checking the space available after each is printed
//  if PageNumber = 1 then
//    begin
    // Rowout(AccountNum)
  SectionContainsValidLine := False;
//    for I := 0 to ReportDataList.count - 1 do
//      begin
  HeightofRow := CY;
  while Deptindex < DeptReportDataList.count do
    begin
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    DeptRec := TConsolidDeptRecPtr(DeptReportDataList.Items[Deptindex]);
    DrawTop := CY;
    PDFCanvas.Font.Style := [fsBold];
    CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
    LeftInColumn(0, DeptRec.Name);
    PDFCanvas.Font.Style := [];
    for I := 1 to Columns.Count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      if (Repcol.Source = TRACK) then
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Actual')
      else
        if (Repcol.Source = TARGET) then
          CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target')
        else
        CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Variance');
      end;
    CY := CY + Metrics.tmHeight { + round(Metrics.tmHeight / 2)};
    horzLine(1, 0);
    PDFCanvas.Font.Style := [];
    for I := 0 to 7 do    // Iterate
      begin
      if (ConSolidKeyAccounts[I] = BILLED) or (ConSolidKeyAccounts[I] = GPUNIT) then
        PDFCanvas.Font.Style := [fsBold]
      else
        PDFCanvas.Font.Style := [];
      if rowout(I, DeptRec) then
        begin
        CY := CY + Metrics.tmHeight;
        SectionContainsValidLine := True;
        end;
      if SectionContainsValidLine and
        (ConSolidKeyAccounts[i] = GPPC) then
        begin
        horzLine(2, 0);
        SectionContainsValidLine := False;
        end;
      if SectionContainsValidLine and
        (ConSolidKeyAccounts[i] = NPPC) then
        begin
        horzLine(1, 0);
        SectionContainsValidLine := False;
        end;
      end;    // for
    CY := CY - Round(Metrics.tmHeight / 2);
    RepPageFooter;
    HighestRowH := CY - HighestRowH;
    if  HighestRowH > HeightofRow then
      HeightofRow := HighestRowH;
    inc(DeptIndex);
    HighestRowH := CY;
    if (DeptIndex < DeptReportDataList.count)
      and ((CY + HeightofRow) > (BM - cmtopx(0.05) - PDFCanvas.TextHeight('A') - cmtopx(7.0))) then
      begin
      Result := True;
      exit;
      end; //     RepPageHeader;
    end;
//    end;

  // New Page
  // Show Current Targets for the next 6 weeks
  // show targets for recovery in 1 to 6 weeks
{  if (CatchupGP < 0) and (PageNumber = 1) then
    begin
    NewColumns;
    Result := True;
    end;

  if (CatchupGP < 0) and (PageNumber = 2) then
    begin
    DrawTop := CY;
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
}
//    LeftinColumn(0, 'Targets to catch up Gross Profit of $' + formatFloat(REPORTROUNDCURRENCY, CatchupGP * -1));
//    CY := CY {+ Metrics.tmHeight} + round(Metrics.tmHeight / 2);
//    horzLine(1, 0);
{    for k := -1 to 7 do    // Iterate
      begin
      CY := CY - round(Metrics.tmHeight / 3);
      DataCollect.GPCatchUp(K, CatchupGP, CatchUPUnits, CatchupTari, QEndDate);
      PDFCanvas.Font.Style := [fsBold];
      if K = -1 then
        LeftinColumn(0, 'Original Targets');
      if K = 0 then
        LeftinColumn(0, 'Targets to recover in ' + inttostr(K + 1) + ' Week');
      if K > 0 then
        LeftinColumn(0, 'Targets to recover in ' + inttostr(K + 1) + ' Weeks');
      PDFCanvas.Font.Style := [];
      CY := CY + Round(Metrics.tmHeight / 1);
      AccountRec := TReportDataRecPtr(ReportDataList.Items[BilledIdx]);
      LeftinColumn(0, AccountRec.AccountTitle);
      for I := 1 to 8 do    // Iterate
        begin
        textamount := '-';
        TextImage := '0';
        if CatchupUnits[i - 1] <> 0 then
            textAmount := formatFloat(REPORTROUNDCURRENCY, CatchupUnits[I - 1]);
        if length(textImage) > 0 then
          DecAligninColumn(I, TextAmount, textImage);
        end;    // for
      CY := CY + Round(Metrics.tmHeight / 1);
      AccountRec := TReportDataRecPtr(ReportDataList.Items[RateIdx]);
      LeftinColumn(0, '# ' + AccountRec.AccountTitle);
      for I := 1 to 8 do    // Iterate
        begin
        textamount := '-';
        TextImage := '0';
        if CatchupTari[I - 1] <> 0 then
          textAmount := formatFloat(REPORTCENTSCURRENCY, CatchupTari[I - 1]);
        if length(textImage) > 0 then
          DecAligninColumn(I, TextAmount, textImage);
        end;    // for
      CY := CY + Round(Metrics.tmHeight / 2);
      if k < 7 then // no line in the last
        horzLine(2, 0);
      end;    // for
    CY := CY - round(Metrics.tmHeight / 3);
    RepPageFooter;
    end;
}
end;

function TDeptTrackingKeyReport.RowOut(AccountIndex : Integer; DeptRec : TConsolidDeptRecPtr): Boolean;
var
  Nonzero: boolean;
  I : Integer;
//  repcol : TRepColPtr;
  TrackBal : TTrackingBals;
  AccTitle : String;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
	FormatTextImage : string;
  Bals : Currency;
	annualiseStr : string;
begin
  NonZero := false;
  Bals := 0;

  for TrackBal := trperActual to trytdPlan do    // Iterate
    Bals := Bals + DeptRec.SummaryBalances[AccountIndex][TrackBal];
  if Bals <> 0 then nonzero := True;

  if Nonzero then
    begin
    AccTitle := '';
    if DataCollect.LocateAccountTitle(ConSolidKeyAccounts[AccountIndex])then
      AccTitle := DATAMODULECLIENT.accountDetailsACCOUNT_TITLE.AsString;
    annualiseStr := '';
      case ConSolidKeyAccounts[AccountIndex] of    //
        GPPC: Acctitle := 'Gross Profit %';
        POTENTIAL: Acctitle := 'Potential ' + DeptRec.UnitdescP;
        BILLED:  Acctitle := 'Billed ' + DeptRec.UnitdescP;
        PRODUCTIVITY: if DeptRec.UnitDescS = 'Hour' then
                      Acctitle := 'Productivity %'
                    else
                      AccTitle := 'Billed to Potential %';
        SALESUNIT: AccTitle := 'Sales per ' + DeptRec.UnitDescS;
        GPUNIT: AccTitle := 'Gross Profit per ' + DeptRec.UnitDescS;
      end;    // case
    if ConSolidKeyAccounts[AccountIndex] <> GPUNIT then
      LeftinColumn(0, AccTitle + AnnualiseStr)
    else
      LeftinColumn(0, '# ' + AccTitle + AnnualiseStr);
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
//      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '0';
      if (I < 3) or (I = 6)then
        TrackBal := TTRackingBals(I - 1)
      else
        if I = 3 then
          TrackBal := TTrackingBals(I + 1)
        else
          TrackBal := TTrackingBals(I - 2);
      if (ConSolidKeyAccounts[AccountIndex] <> POTENTIAL) and (ConSolidKeyAccounts[AccountIndex] <> BILLED) then
        FormatTextImage := REPORTTENSCURRENCY
      else
        FormatTextImage := REPORTROUNDCURRENCY;
      if (ConSolidKeyAccounts[AccountIndex] = SALESUNIT) or (ConSolidKeyAccounts[AccountIndex] = GPUNIT) then
        begin
        if abs(DeptRec.SummaryBalances[AccountIndex][TrackBal]) > 9999.9 then
          FormatTextImage := REPORTROUNDCURRENCY
        else
          FormatTextImage := REPORTCENTSCURRENCY;
        end;
      if (ConSolidKeyAccounts[AccountIndex] = SALES) or (ConSolidKeyAccounts[AccountIndex] = GROSSPROFIT) then
        FormatTextImage := REPORTROUNDCURRENCY;
      if DeptRec.SummaryBalances[AccountIndex][TrackBal] <> 0 then
        textAmount := formatFloat(FormatTextImage, DeptRec.SummaryBalances[AccountIndex][TrackBal]);
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
      end;    // for
    end;
  Result := NonZero;
end;


{TTrackingDPLReport}
constructor TTrackingDPLReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;
  OffsetTitle := False;
  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolid);
  DataCollect.GetMonitoringAccountArray(True);
  DataCollect.getDetailedPLData(False, QStartDate, QEndDate, periodstartDate, SummaryType);
  StartIndex := 0;
end;

destructor TTrackingDPLReport.Destroy;
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

function TTrackingDPLReport.GetNextPage: Boolean;
begin
  if PageNumber = 1 then
    begin
    if AccountingFmt then
      TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(NETOPERATINGPROFIT)]).AccountTitle := 'Earnings Before Interest, Tax, Depreciation & Amortisation';
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

  RepPageHeader;

  Result := RepBody;

  RepPageFooter;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TTrackingDPLReport.RepPageHeader;
var
  ColY: Integer;
  I: Integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext, midY, MidX: integer;
	annualiseStr : string;
  Sectionheading : string;
  TempLM, tempRM : integer;
begin
  CX := LM;
  CY := TM;
//  SetBookMarks;
  PDFCanvas.Font.Name := CurrentFont;
  // Set to Baseline
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  PDFCanvas.Font.Style := [];
  GetTextMetrics(PDFCanvas.Handle, Metrics);
  DrawTop := CY;
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  Yext := CY;
  ColY := CY;
  NewY := CY;
  MidY := CY;
  MidX := CX;
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    AnnualiseStr := '';
    CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
    CY := ColY;
    if (I = 2) or (I = 5)
      then begin
      PDFCanvas.Font.Style := [fsBold];
      if I = 2 then SectionHeading := 'Period - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
      if I = 5 then SectionHeading := 'Year to Date - ' + Repcol.FromDate + ' to ' + Repcol.ToDate;
      tempLM := CX - cmtopx(repcol.width);
      tempRM := tempLM + 3 * cmtopx(repcol.width) - 2 * cmtopx(COLMARGIN);
      Centretext(tempLM, tempRM, SectionHeading);
    end;
    CY := CY + Metrics.tmDescent + round(Metrics.tmHeight / 2);

//    CY := CY + round(Metrics.tmHeight * 1.5);
    if I = 1
      then begin
      MidY := CY;
      MidX := DetailOffset + cmtopx(repcol.start);
    end;
    CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
//    CY := CY + round(Metrics.tmHeight * 1.5);
    PDFCanvas.Font.Style := [];
    if (Repcol.Source = TRACK) then
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Actual' + AnnualiseStr)
    else if (Repcol.Source = TARGET) then
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Target' + AnnualiseStr)
    else
      CentreandWrap(CY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, 'Variance' + AnnualiseStr);
    if NewY > Yext then Yext := NewY;
    NewY := CY;
  end;    // for
  // Output Column Headings for subcolumns
  CY := CY + Metrics.tmDescent + round(Metrics.tmHeight / 2);
  for I := 1 to Columns.Count - 1 do    // Iterate
    begin
    repcol := TRepColPtr(Columns.Items[I]);
    with PDFCanvas do
      begin
      if (I = 1) or (I = 4) then
        MoveTo(DetailOffset + cmtopx(repcol.start), DrawTop)
      else
        MoveTo(DetailOffset + cmtopx(repcol.start), MidY);
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
    Moveto(MidX, MidY);
    Lineto(DetailOffset + cmtopx(RightEdge), MidY);
  end;    // with
//  inc(PageNumber);
end;

procedure TTrackingDPLReport.RepPageFooter;
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

{  PDFCanvas.Font.Style := [fsItalic];
  PDFCanvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDFCanvas.TextHeight('A');
  LeftText(formatDateTime('dddddd h:nn:ss am/pm', Now));
  PDFCanvas.Font.Style := [];
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  CY := BM - cmtopx(0.05) - PDFCanvas.TextHeight('A');
  RightText('Page ' + InttoStr(PageNumber));
}
end;

Function TTrackingDPLReport.RepBody : Boolean;
var
  Bals: Currency;
  LastLinescnt : integer;
  I: Integer;
  Metrics: TTextMetric;
  AccountRec : TReportDataRecPtr;
  ReportOtherInc : TReportDataRecPtr;
  TrackBal : TTrackingBals;
begin
  Result := False;
  PDFCanvas.Font.Name := CurrentFont;
  PdfCanvas.Font.Size := DETAILFONTSIZE;
  SetTextAlign(PDFCanvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  GetTextMetrics(PDFCanvas.Handle, Metrics);

  // Find out how many lines after NOP
  Bals := 0;
  I := GetReportAccountIndex(NETOPERATINGPROFIT);
  LastLinescnt := 0;
  if I > -1 then
    begin
    inc(I);
    while I < ReportDataList.count - 1 do
      begin
      ReportOtherInc := TReportDataRecPtr(ReportDataList.Items[I]);
      for TrackBal := trperActual to trytdPlan do    // Iterate
        Bals := Bals + ReportOtherInc.TrackBalances[TrackBal];
      if Bals <> 0 then
        inc(LastLinescnt);
      inc(I);
      end;    // while
    // if we have more than 3 accounts then we have some lines to draw
    if lastlinescnt > 3 then
      lastlinescnt := lastlinescnt + 4;
    end;
  // Set to Baseline
  DrawTop := CY;

  CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
  if Not SectionsComplete[1] then
    begin
    PDFCanvas.Font.Style := [fsBold, fsUnderline];
    LeftinColumn(0, 'Income');
    PDFCanvas.Font.Style := [];
    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
    end;

// herer we must check hoe much space we have on the page
//Section 1 = Sales to GrossProfit
//Section 2 = Expenses Started
//Section 3 = Expenses Continued for heading only
//Section 4 = Expenses Completed
//section 5 = NOP
//Section 6 = NP
  for I := Startindex to ReportDataList.count - 1 do
    begin
    AccountRec := TReportDataRecPtr(ReportDataList.Items[I]);
    if SectionsComplete[1] and (sectionsComplete[2]) and (SectionsComplete[3]) and (Not SectionsComplete[4]) then
      begin
      PDFCanvas.Font.Style := [fsBold, fsUnderLine];
      LeftinColumn(0, 'Less Expenses (Continued)');
      PDFCanvas.Font.Style := [];
      CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
      SectionsComplete[3] := False;
      end;

    if AccountRec.Accountno = TOTALEXPENSES then
      begin
      SectionsComplete[4] := True;  // the real end of expenses
      horzLine(2, 0);
      end;
    if AccountRec.Accountno = NETOPERATINGPROFIT then
      begin
      SectionsComplete[4] := True;  // the real end of expenses
      horzLine(2, 0);
      end;
    OffsetTitle := False;
    if (AccountRec.Account_Group = AGDIRECTEXP) or (AccountRec.Account_Group = AGDEPNINT) then
      OffsetTitle := True;
    if (AccountingFmt) and (AccountRec.Accountno = OTHERDIRECT) then
      horzLine(2, 0);
    if (AccountingFmt) and (AccountRec.Accountno = DEPNINTEREST) then
      horzLine(2, 0);

    if rowout(AccountRec) then
      begin
      CY := CY + Metrics.tmHeight;

      // how much space
    if (CY + Metrics.tmHeight * 2) > BM then
      begin
      if I < (ReportDataList.count - 1) then
        StartIndex := I + 1;
      if SectionsComplete[2] and (not SectionsComplete[4]) then
        SectionsComplete[3] := True;
      Result := True;
      exit;
      end;


      if Not SectionsComplete[1] then
        begin
        if (Not AccountingFmt) and (AccountRec.Accountno = COGS) then
          horzLine(2, 0);
        if (AccountingFmt) and (AccountRec.Accountno = OTHERDIRECT) then
          horzLine(2, 0);
        if AccountRec.Accountno = GROSSPROFIT then
          begin
          PCSalesRowOut(AccountRec);
          CY := CY + Metrics.tmHeight ;
          horzLine(1, 0);
          SectionsComplete[1] := True;
          end;
        end;
      if SectionsComplete[1] and (Not sectionsComplete[2]) and (Not SectionsComplete[3]) then
        begin
        PDFCanvas.Font.Style := [fsBold, fsUnderLine];
        LeftinColumn(0, 'Less Expenses');
        PDFCanvas.Font.Style := [];
        SectionsComplete[2] := True;
        CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 2);
        end;
      if Not SectionsComplete[4] then
        begin
        if AccountRec.Accountno = TOTALEXPENSES then
          begin
          SectionsComplete[4] := True;
          PCSalesRowOut(AccountRec);
          CY := CY + Metrics.tmHeight ;
          horzLine(1, 0);
          end;
        end;
      if AccountRec.Accountno = NETOPERATINGPROFIT then
        begin
        PCSalesRowOut(AccountRec);
        CY := CY + Metrics.tmHeight ;
        // here we decide to output the remainder of the accounts
        // if Other Income is Zero we don't
        SectionsComplete[5] := True;
 //       if OtherIncZero then break;
        if (CY + Metrics.tmHeight * lastlinescnt) > BM then
          begin
          if I < (ReportDataList.count - 1) then
          StartIndex := I + 1;
          Result := True;
          exit;
          end
        else
          horzLine(1, 0);
        end;
      if (not AccountingFmt) and (AccountRec.Accountno = OTHERINCOME) then
        horzLine(2, 0);
      if (AccountingFmt) and (AccountRec.Accountno = OTHERINCOME) then
        begin
        PDFCanvas.Font.Style := [];
        LeftinColumn(0, 'Less');
        PDFCanvas.Font.Style := [];
        CY := CY + Metrics.tmHeight;
        end;
      if (AccountingFmt) and (AccountRec.Accountno = DEPNINTEREST) then
        horzLine(2, 0);
      if AccountRec.Accountno = NETPROFIT then
        begin
        PCSalesRowOut(AccountRec);
        CY := CY + Metrics.tmHeight ;
        SectionsComplete[6] := True;
        end;
      end;
    end;
end;

function TTrackingDPLReport.RowOut(AccountRec : TReportDataRecPtr): Boolean;
var
  Nonzero: boolean;
  I: Integer;
//  repcol : TRepColPtr;
  TrackBal : TTrackingBals;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
	TextImage : string;
  Bals : Currency;
	annualiseStr : string;
begin
  NonZero := false;
  Bals := 0;

  for TrackBal := trperActual to trytdPlan do    // Iterate
    Bals := Bals + AccountRec.TrackBalances[TrackBal];
  if Bals <> 0 then nonzero := True;

  if Nonzero
    then begin
    if AccountRec.Annualise then
      annualiseStr := '*'
    else
      annualiseStr := '';
    if OffsetTitle then
      LeftinColumn(0, '  ' + AccountRec.AccountTitle + AnnualiseStr)
    else
      LeftinColumn(0, AccountRec.AccountTitle + AnnualiseStr);
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
//      repcol := TRepColPtr(Columns.Items[I]);
      textamount := '-';
      TextImage := '0';
      if (I < 3) or (I = 6)then
        TrackBal := TTRackingBals(I - 1)
      else if I = 3 then
        TrackBal := TTrackingBals(I + 1)
      else TrackBal := TTrackingBals(I - 2);
      if AccountRec.TrackBalances[TrackBal] <> 0
         then textAmount := formatFloat(AccountRec.FormatImage, AccountRec.TrackBalances[TrackBal]);
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
    end;    // for
  end;
  Result := NonZero;
end;

function TTrackingDPLReport.PCSalesRowOut(AccountRec : TReportDataRecPtr): Boolean;
var
  SalesRec : TReportDataRecPtr;
  trbal : TTrackingBals;
begin
  SalesRec := TReportDataRecPtr(ReportDataList.Items[0]);
// Overwrite the Report Record as it has been output and its not Sales
  AccountRec.AccountTitle := AccountRec.AccountTitle + ' %';

  for trbal := trperactual to trytdPlan do    // Iterate
    begin
    if SalesRec.TrackBalances[trbal] <> 0 then
      AccountRec.TrackBalances[trbal] := AccountRec.TrackBalances[trbal] * 100 / SalesRec.TrackBalances[trbal];
  end;    // for
  if (AccountRec.Accountno < FIRSTEXPENSE) or (AccountRec.AccountNo > TOTALEXPENSES)
    then begin
    AccountRec.TrackBalances[trpervar] := AccountRec.TrackBalances[trperActual] - AccountRec.TrackBalances[trperplan];
    AccountRec.TrackBalances[trytdvar] := AccountRec.TrackBalances[trytdActual] - AccountRec.TrackBalances[trytdplan];
  end
  else begin
    AccountRec.TrackBalances[trpervar] := AccountRec.TrackBalances[trperPlan] - AccountRec.TrackBalances[trperActual];
    AccountRec.TrackBalances[trytdvar] := AccountRec.TrackBalances[trytdPlan] - AccountRec.TrackBalances[trytdActual];
  end;
  AccountRec.FormatImage := '0.0';
  Result := rowout(AccountRec);
end;

{TKeyTrendReport}
constructor TKeyTrendReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Consolid, ReportName, Orientation);
  IsCashFlowReport := False;

  DataCollect.GetConsolidatedList(DataModuleClient.DepartmentsDEPT_ID.Value, Consolid);
  DataCollect.getTrackingkeyData(False, QStartDate, QEndDate, periodstartDate, SummaryType);

  BodyFontSize := 8;
//  ColMargin := 0.05;
  Narrowrep := False;
end;

destructor TKeyTrendReport.Destroy;
begin
  DataCollect.ClearReportDataList;
  DataCollect.ClearConsolidatedList;
  inherited destroy;
end;

procedure TKeyTrendReport.CheckColumns;
var
  j, kk: Integer;
  DaysinYear : integer;
//  SummaryPtr : TReportDataRecPtr;
  realCols : integer;
begin

{
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
}
  daysinyear := trunc(QEnddate) - trunc(QStartDate);
  if DetailedReportingPeriod > 0 then
    begin
    RealCols := createSummaryIndex(DetailedReportingPeriod, DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value, DataModuleClient.DepartmentsCURRENTMONITORINGEnd.value);
    kk := 1;
    while KK < realCols do
      begin
      if Trunc(DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value + SummaryPeriodIndexArray[kk - 1]) = Trunc(QEnddate) then
        break
      else
        inc(KK);
      end;    // while
    TotalNoColumns :=  KK + 1;
    end
  else
    begin
    Realcols := DaysinYear + 1;
    TotalNoColumns := RealCols + 1;
    end;
  for J := 0 to integer(Trunc(sizeof(KeyReportAccounts)/sizeof(integer)) - 1)
    do setAccount(ReportDataList.Items[GetReportAccountIndex(KeyReportAccounts[J])]);

  Fillchar(ChartDates, sizeof(TDateTimeArray), #0);
  for j := 0 to TotalNoColumns - 2 do    // Iterate
    begin
    if DetailedReportingPeriod = 0 then
      ChartDates[j] := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value + j
    else
      ChartDates[j] := DataModuleClient.DepartmentsCURRENTMONITORINGSTART.value + SummaryPeriodIndexArray[j];
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
    if RealCols > (NUM_COLUMNS - 1) then
      DetailWidth := DETAILEDTITLEWIDTH + kk * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH
    else
      DetailWidth := DETAILEDTITLEWIDTH + RealCols * DETAILEDCOLWIDTH + DETAILEDTOTALCOLWIDTH;
    DefaultOrientation := poLandscape;
    end;
  RightEdge := DetailWidth;
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

  RepPageHeader;

  Result := RepBody;
  RepPageFooter;
  PDFCanvas.Free; // Collapse Canvas to metafile!
end;

procedure TKeyTrendReport.RepPageHeader;
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

procedure TKeyTrendReport.RepPageFooter;
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

Function TKeyTrendReport.RepBody : Boolean;
var
  I: Integer;
//  colno: Integer;
//  textHT : integer;
  Metrics: TTextMetric;
//  repcol : TRepColPtr;
//  NewY, Yext: integer;
//  Subtitle : array[0..15] of char;
  SectionContainsValidLine : Boolean;
  AccountRec : TReportDataRecPtr;
//  DataRec : TReportDataRecPtr;
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
  for I := 0 to integer(Trunc(sizeof(KeyReportAccounts)/sizeof(integer)) - 1) Do
    begin
    AccountRec := TReportDataRecPtr(ReportDataList.Items[GetReportAccountIndex(KeyReportAccounts[I])]);
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
    end;
  PageStartColNo := PageEndColNo + 1;
  PageEndColNo := PageStartColNo + NUM_COLUMNS - 1;
  if PageEndColNo > (TotalNoColumns - 1) then
    PageEndColNo := TotalNoColumns - 1;
  Result := False;
  if PageStartColNo < TotalNoColumns then
    Result := True;
end;

function TKeyTrendReport.RowOut(AccountRec : TReportDataRecPtr): Boolean;
var
  I, J: Integer;
  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
	TextAmount : string;
  TextImage : string;
  SmallerFont : Boolean;
  Metrics: TTextMetric;
  DetailArray : TDetailedBalArrayPtr;
  SummaryArray : TSummaryBalArrayPtr;
  AccountTotal : Currency;
  Titlecolwidth : Extended;
begin
  if AccountRec.Nonzero then
    begin
    RepCol := TRepColPtr(Columns.Items[0]);
    TitleColWidth := Repcol.Width;
    Repcol.Width := TitleColWidth * 0.75;
    GetTextMetrics(PDFCanvas.Handle, Metrics);
// if the account is ACTUAL or GPUNITS, Bold the line.
    if (AccountRec.Accountno = BILLED) or (AccountRec.Accountno = GPUNIT) then
      PDFCanvas.Font.Style := [fsBold]
    else
      PDFCanvas.Font.Style := [];
    if AccountRec.Accountno <> GPUNIT then
      LeftinColumn(0, AccountRec.AccountTitle)
    else
      LeftinColumn(0, '# ' + AccountRec.AccountTitle);
    Repcol.Width := TitleColWidth;
    RightinColumn(0, 'Target');
    TextImage := '0';
    SmallerFont := False;
    for J := 0 to 1 do    // Iterate
      begin
      if J = 0 then
        begin
        DetailArray := @(AccountRec.PlanDetail);
        SummaryArray := @(AccountRec.PlanSummary);
        AccountTotal := AccountRec.PlanTotal;
        end
      else
        begin
        DetailArray := @(AccountRec.MonDetail);
        SummaryArray := @(AccountRec.MonSummary);
        AccountTotal := AccountRec.MonTotal;
        end;
      for I := 1 to Columns.count - 1 do    // Iterate
        begin
        repcol := TRepColPtr(Columns.Items[I]);
        if RepCol.source = 1 then
          textAmount := formatfloat(AccountRec.FormatImage, AccountTotal)
        else
          begin
          if DetailedReportingPeriod = 0 then
            textAmount := formatfloat(AccountRec.FormatImage, DetailArray[RepCol.DateIdx])
          else
            textAmount := formatfloat(AccountRec.FormatImage, SummaryArray[RepCol.DateIdx]);
          end;
        DecAligninColumn(I, TextAmount, textImage);
        end;
      if SmallerFont then
        begin
        PDFCanvas.Font.Size := PDFCanvas.Font.Size + 1;
        SmallerFont := False;
        end;
      if J = 0 then
        begin
        CY := CY + Metrics.tmHeight;
        RightinColumn(0, 'Actual');
        TextImage := '0';
        SmallerFont := False;
        end;
      end;    // for
    end;
  Result := AccountRec.Nonzero;
end;

procedure TKeyTrendReport.MakeColumns;
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

procedure TKeyTrendReport.SetAccount(AccountRec : TReportDataRecPtr);
//var
//  daysinyear: Integer;
//  I: Integer;
begin
  AccountRec.Nonzero := True;
//  daysinyear := trunc(DataModuleClient.DepartmentsCurrentPlanEnd.value) - trunc(DataModuleClient.DepartmentsCurrentPlanStart.value);
//  I := 0;
//  AccountRec.PlanTotal := 0;
//  AccountRec.MonTotal := 0;
//  for I := 0 to DaysinYear do    // Iterate
//    begin
//    Accountrec.PlanTotal := Accountrec.PlanTotal + Accountrec.Plandetail[I];
//    AccountRec.MonTotal := AccountRec.MonTotal + Accountrec.MonDetail[I];
//    end;    // for
//  while (I < DaysinYear) and (not AccountRec.NonZero) do    // Iterate
//    begin
//    if ((I = 0) and (AccountRec.PlanTotal <> 0)) or (AccountRec.PlanDetail[I] <> 0) then
//      AccountRec.Nonzero := True;
//    inc(I);
//    end;
  if (AccountRec.Accountno = TOTALEXPENSES) or
     (AccountRec.Accountno = TOTALEXPPC) or
     (AccountRec.Accountno = NETPROFIT) or
     (AccountRec.Accountno = NPPC) or
     (AccountRec.Accountno = HRSPERDAY) or
     (AccountRec.Accountno = FTEPROD) or
     (AccountRec.Accountno = TOTALEXPUNIT) or
     (AccountRec.Accountno = NPUNIT) or
     (AccountRec.Accountno = FTEOTHER) or
     (AccountRec.Accountno = SALESFTE) or
     (AccountRec.Accountno = GPFTE) or
     (AccountRec.Accountno = NPFTE) then
     AccountRec.Nonzero := False;
end;

end.
