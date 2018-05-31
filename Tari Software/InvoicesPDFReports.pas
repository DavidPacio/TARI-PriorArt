unit InvoicesPDFReports;

interface

Uses windows, graphics, classes, sysutils, auchTypes, DMClient,
    DataCollector, printers, CustomPDFReport, variants;

Type

  TInvoicesReport = class(TCustomReport)
  private
    InvNumberText: string;
    StartItem : Integer;
//    procedure CheckColumns;
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
    constructor create(Monitoring : Boolean; ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
//    property DefaultOrientation;
    function GetNextPage : Boolean;  Override;
  end;


Var
  Showdetail: Boolean;
  Totalpages : integer;
  QstartDate, QEndDate, PeriodStartDate : TDateTime;
  QuotesortType : TQuoteSortType;
  SummaryType : integer;

implementation


{TInvoicesReport}
constructor TInvoicesReport.create(Monitoring : Boolean; ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(Monitoring, ReportName, Orientation);

//  if DataModuleClient.Planloaded = false then
  StartDate := QStartDate;
  EndDate := QEndDate;

  DataCollect.getQuotes(StartDate, EndDate);
  ColMargin := 0.05;
  StartItem := 0;
end;

destructor TInvoicesReport.Destroy;
begin
  DataCollect.ClearQuoteList;
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

  Result := RepBody;

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
        1: ColTitle := 'Sale ' + DataModuleClient.DepartmentsCurrency.value + '~A';
        2: ColTitle := 'Materials ' + DataModuleClient.DepartmentsCurrency.value + '~B';
        3: ColTitle := 'Subs '+ DataModuleClient.DepartmentsCurrency.value + '~C';
        4: ColTitle := 'Gross Profit ' + DataModuleClient.DepartmentsCurrency.value + '~D=A-(B+C)';
        5: ColTitle := 'GP%~E=D/A';
        6: ColTitle := 'No of ' + DataModuleClient.DepartmentsPlural_UnitDesc.value + '~F';
        7: begin
            if DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours' then
              ColTitle := 'Actual~Hours - G'
            else
              ColTitle := '';
           end;
        8: begin
            if (TimeSheetRate) and (DataModuleClient.DepartmentsPlural_UnitDesc.value = 'Hours') then
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

procedure TInvoicesReport.RepPageFooter;
var
  RateNote : String;
begin
  PDFCanvas.Font.Style := [fsItalic];
  PDFCanvas.Font.Size := 8;
  CY := BM - cmtopx(0.05) - PDFCanvas.TextHeight('A');
  if DataModuleClient.DepartmentsPlural_UnitDesc.Value = 'Hours' then
    begin
    if TimeSheetRate then
      RateNote := '(Rate calculated on Actual Hours)'
    else
      RateNote := '(Rate calculated on Billed Hours)';
    end;
  CX := DetailOffset + round(cmtopx(DetailWidth) / 2) - Round((PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN)) / 2);
  CentreandWrap(CY, CX, PDFCanvas.TextWidth(RateNote) + cmtopx(COLMARGIN) * 2, RateNote);
end;

Function TInvoicesReport.RepBody : Boolean;
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
  Varg[0] := DataModuleClient.DepartmentsDept_ID.value;
  for I := StartItem to QuoteList.count - 1 do    // Iterate
    begin
    InvNumberText := '';
    // Set to Baseline
    PDFCanvas.Font.Style := [];
    CY := CY + round(Metrics.tmHeight / 2);
    DrawTop := CY;

    CY := CY + Metrics.tmHeight + round(Metrics.tmHeight / 3);
    for JQR := QrrQuote to QrrVariance do    // Iterate
      begin
      if Showdetail and (JQR = QrrActual) then
        begin
        varg[1] := QuoteDataRec.Quote_Number;
        DataModuleClient.QuotesLU.Locate('Dept_ID;Quote_Number', varg, []);
        if InvCount > 1 then
          begin
          PDFCanvas.Font.Style := [];
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

function TInvoicesReport.RowOut(Balances: TQuoteValues; Rownum : TQuoteRepRows) : Boolean;
var
  I: TQuoteFields;
//  repcol : TRepColPtr;
//  Subtitle : array[0..15] of char;
  TextAmount : string[50];
  TextImage : string[50];
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
      or ((I = QfTimeSheetHours) and (DataModuleClient.DepartmentsSingular_UnitDesc.value = 'Hour')) then
      Textamount := formatfloat(REPORTCENTSCURRENCY, Balances[I, RowNum]);
    if length(textImage) > 0 then
      DecAligninColumn(Ord(I) + 1, TextAmount, textImage);
    end;    // for
end;

Procedure TInvoicesReport.InvRowsOut(Rowheight : Integer);
var
  TextAmount : string[50];
  TextImage : string[50];
  GPValue : Currency;
begin
//  PDFCanvas.Font.Style := [];
  DataModuleClient.InvQuoteLU.First;
  while DataModuleClient.InvQuoteLu.eof = False do begin
    CentreinColumn(0, DataModuleClient.InvQuoteLUInvoice_Number.value);
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
    DataModuleClient.InvQuoteLU.Next;
  enÚAÓHÈ¨Åø—u
À†ÉóØ¼(eì[É¤­RÏk‡|È¸ÑšSÇæ_Àb-ÊÚ‹0­÷r$uñé­f²âÀõ›ÙeH’@²‡*{Ëfê…¨ Åò#a¬µ­M]üşdc{ü2Ş•Ùü›_°€pöÁ¥ŸHÖÍŞ‹DŠâcuêÁçª,İ€™\*"™¹z•ˆ¬€3ˆ·¶Ü¯"§um  ìaÚ¦Wé}ïØ]L¶jûÀwÑë˜ÖĞëƒl$áİ
¾ªÛêĞT÷™4äÑ¬a\uÉÃù•X¦Ä›ÿl_š’ÙœŞV›wÏı¼Ç)ò¡• Ë}«ß‰b6VÂ|ËäiOê•v6è;€JQ˜Ì-/]İy!=™ÉÎAa*O›Ç°i¦¾&³Ÿkv‚DBÒíß¢Í¼y1¥Û›'BPÔÅ}6R{öèŸKÜ‹\\Å^´—Ù'm UFòÍù¢š8©ò¡
Ä²WTƒœ‘d4ËGV2Û±z©/I