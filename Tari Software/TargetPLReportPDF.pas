unit TargetPLReportPDF;

interface

Uses windows, graphics, classes, sysutils, auchTypes, DMClient, printers;

Const
  PENWIDTH = 0.035;

  TEXTSAMPLE = 'A';

  TITLEWIDTH = 5.95;
  DOLLARWIDTH = 2.47;
  PERCENTWIDTH = 1.25;
  COLMARGIN = 0.2;

type

  TRepColPtr = ^TRepColumn;TRepColumn = Record
  ColNo : array[0..11] of char;
  Majorcol : integer;
  Minorcol : integer;
  Start : Extended;
  Width : Extended;
  AnnualFactor : Extended;
  Top : Extended;
  Totaling : Boolean;
  Total : Currency;
  DateIdx : integer;
  Source : integer;
  FromDate : string;
  ToDate : string;
  end;

  TCustomReport = class(TObject)
  private
    CX : Integer; // Current X position
    CY : Integer; // Current Y position
    TM : Integer; // Top Margin
    BM : Integer; // Bottom Margin
    LM : integer; // Left Margin
    RM : Integer; // Right Margin
    BindM : integer; // Binding Margin
    PDF : Tprinter;
    DrawTop: Integer; // Top Y position of section
    DetailOffset : integer; // Calculated Offset for table
    PageNumber : integer;
    Columns : TList;
    fDetailWidth : extended;
    fConsolidate : Boolean;
    fUseColor : Boolean;
    fCurrentFont : string;
    fReportName : string;
    FPixelsPerX : integer;
    FPixelsPerY : integer;
    LeftOffset : integer;
    TopOffset : integer;
    PhysicalWidth : integer;
    PhysicalHeight : integer;
    Annualised : Boolean;
    bmParent : longint;
    procedure SetBookmarks;
    procedure CentreText(txt : String);
    procedure LeftText(txt : String);
    procedure RightText(txt : String);
    procedure HorzLine(fromCol, ToCol : integer);
    procedure CentreandWrap(Var yext: integer; x, w: integer; txt: string);
    function cmtopx(cmdx : extended): integer;
    function PosSpace(txt : Pchar; L : integer): integer;
    procedure LeftInColumn(Colnum : Integer; txt : string);
    procedure DecAlignInColumn(Colnum : Integer; txt, txtImage : string);
    function GetCurrentFont: string;
  protected
    property DetailWidth : extended read fDetailWidth write fDetailWidth;
    property Consolidate : Boolean read FConsolidate write FConsolidate;
    Property UseColor : Boolean read fUseColor write fUseColor;
    property currentFont : string read getcurrentFont write fcurrentFont;
    procedure RepPageHeader; virtual; abstract;
    procedure RepPageFooter; virtual; abstract;
    procedure RepBody; virtual; abstract;
  Public
    constructor create(ReportName : string; Orientation : TPrinterOrientation); virtual;
    destructor Destroy; override;
    procedure ColumnAdd(colrec : TRepColPtr);
    procedure DoPDFReport; virtual; abstract;
  End;

  TPLTrendReport = class(TCustomReport)
  private
    procedure RepPageHeader; Override;
    procedure RepPageFooter; Override;
    procedure RepBody;  Override;
    procedure CheckColumns;
    function RowOut(AccountRec : TPlanDataRecPtr) : Boolean;
  public
    constructor Create(ReportName : string; Orientation : TPrinterOrientation); override;
    destructor Destroy; override;
    property DetailWidth;
    property Consolidate;
    Property UseColor;
    property currentFont;
    procedure DoPDFReport;  Override;
  end;

implementation

constructor TCustomReport.create(ReportName : string; Orientation : TPrinterOrientation);
begin
  Columns := TList.create;
  fReportName := ReportName;
  Annualised := false;
  PdfPtr.PaperSize := 9; // A4
  PdfPtr.Resolution := DPI;
  if Orientation = poLandscape
    then begin
    pdfPtr.Orientation := 2; // Landscape
    PdfPtr.PaperWidth := 2970; // A4 Landscape
    PdfPtr.PaperLength := 2100; // A4 Landscape
  end
  else begin
    pdfPtr.Orientation := 1; // Portrait
    PdfPtr.PaperWidth := 2100; // A4 Portrait
    PdfPtr.PaperLength := 2970; // A4 Portrait
  end;
  PDF := Tprinter.create;
  PDF.PrinterIndex := Printer.Printers.IndexOf('Stratacom Printer');
  PDF.Orientation := Orientation;

  FPixelsPerX := GetDeviceCaps(Pdf.Handle, LOGPIXELSX);
  FPixelsPerY := GetDeviceCaps(Pdf.Handle, LOGPIXELSY);
  LeftOffset := GetDeviceCaps(Pdf.Handle, PHYSICALOFFSETX);
  TopOffset := GetDeviceCaps(Pdf.Handle, PHYSICALOFFSETY);

  LM := cmtopx(0.5) - LeftOffset;
  TM := cmtopx(0.5) - TopOffset;
  RM := PDF.PageWidth + (LeftOffset * 2) - cmtopx(0.5);
  BM := PDF.PageHeight + (TopOffset * 2) - cmtopx(0.5);
  PageNumber := 1;
end;

destructor TCustomReport.Destroy;
var
  I: Integer;
  Repcol : TRepColPtr;
begin
  for I := 0 to Columns.count - 1 do    // Iterate
    begin
    Repcol := TRepcolPtr(Columns.items[I]);
    Dispose(RepCol);
  end;    // for
  Columns.Free;
  Pdf.Free;
  inherited destroy;
end;

procedure TCustomReport.Setbookmarks;
begin
  PDF.Canvas.Textout(1, 1, '');
  if Pagenumber = 1
    then begin
    bmParent := PdfPtr.SetBookmark(PDF.Handle, 0, fReportName);
    PdfPtr.SetBookmark(PDF.Handle, bmParent, 'Page ' + inttostr(PDF.Pagenumber));
  end
  else
    PdfPtr.SetBookmark(PDF.Handle, bmParent, 'Page ' + inttostr(PDF.Pagenumber));
end;

function TCustomReport.cmtopx(cmdx : extended): integer;
begin
  result := Round((fPixelsperX * cmdx) / 2.54);
end;

procedure TCustomReport.ColumnAdd(colrec : TRepColPtr);
begin
  columns.add(colrec);
end;

procedure TCustomReport.CentreandWrap(Var yext: integer; x, w: integer; txt: string);
var
  width, len, L, Lcx, Lcy: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  Pstr : Pchar;
begin
  Yext := CY;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  L := Len;
  with PDF.Canvas do
    begin
    while (Len > 0) and (L > 0) do
      begin
      L := Len;
      GetTextExtentPoint(Handle, Pstr, L, Extent);
      if (L > 0) and (Extent.cX > w) Then
        begin
        L := PosSpace(Pstr, L);
        GetTextExtentPoint(Handle, Pstr, L, Extent);
      end;
      Lcx  := CX + round((w - Extent.cx)/2 );
      Windows.TextOut(Handle, LCX, YExt, Pstr, L);
      if L < Len
        then begin
        Inc(L); //
        Yext := Yext + Extent.cy;
      end;
      Dec(Len, L);
      Inc(Pstr, L);
    end;
  end;
end;

procedure TCustomReport.LeftInColumn(Colnum : Integer; txt : string);
var
  Repcol : TRepColPtr;
  width, len, L, Lcx, Lcy, Offset: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  Offset := 0;
  L := Len;
  with PDF.Canvas do
    begin
    while (Len > 0) and (L > 0) do
      begin
      L := Len;
      GetTextExtentPoint(Handle, Pstr, L, Extent);
      while (L > 0) and (Extent.cX > Width) do
        begin
        L := PosSpace(Pstr, L);
        GetTextExtentPoint(Handle, Pstr, L, Extent);
      end;
      Lcx  := CX + Offset;
      Windows.TextOut(Handle, LCX, CY, Pstr, L);
      if L < Len
        then begin
        Inc(L); //
        CY := CY + Extent.cy;
        if Offset = 0 then
          Offset := cmtopx(0.30);
      end;
      Dec(Len, L);
      Inc(Pstr, L);
    end;
  end;
end;

procedure TCustomReport.DecAlignInColumn(Colnum : Integer; txt, txtimage : string);
var
  I, J: Integer;
  Repcol : TRepColPtr;
  BracketWidth : integer;
  dashOffset : integer;
  partamount : string[10];
  pointFound : Boolean;
  destPtr : array[0..20] of char;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  dashOffset := 0;
  pointfound := false;
//  DestPtr := @partamount[1];
  J := 0;
  for I := 1 to length(txtimage) do    // Iterate
    begin
    if pointFound
      then begin
      destPtr[J] := txtImage[I];
      inc(J);
    end;
    if txtImage[I] = '.' then pointFound := True;
  end;
  DestPtr[J] := #0;
  Partamount := strPas(DestPtr);    // for
  BracketWidth := PDF.Canvas.TextWidth(')');
  if pointFound and (txt[1] = '-') and (length(txt) = 1) then
    DashOffset := PDF.canvas.textWidth(partamount);
  if txt[Length(txt)] = ')' then
    BracketWidth := 0;
  CX := DetailOffset + cmtopx(RepCol.start) + cmtopx(repcol.width) - cmtopx(0.10) - PDF.Canvas.TextWidth(txt) - BracketWidth - dashoffset;
  PDF.Canvas.TextOut(CX, CY, txt);
end;

function TCustomReport.PosSpace(txt : Pchar; L : integer): integer;
begin
  if (Txt[L] = ' ') and (L > 0) then
    Dec(L);
  while (L > 0) and (Txt[L] <> ' ') do dec(L);
  result := L;
end;

procedure TCustomReport.CentreText(txt : String);
begin
  CX := round((RM - LM - PDF.Canvas.TextWidth(txt)) / 2);
  Pdf.Canvas.TextOut(CX, CY, txt);
end;

procedure TCustomReport.RightText(txt : String);
begin
  CX := DetailOffset + cmtopx(DetailWidth) - PDF.Canvas.TextWidth(txt);
  Pdf.Canvas.TextOut(CX, CY, txt);
end;

procedure TCustomReport.LeftText(txt : String);
begin
  CX := DetailOffset;
  Pdf.Canvas.TextOut(CX, CY, txt);
end;

function TCustomReport.getCurrentFont: string;
begin
  result := FcurrentFont;
end;

procedure TCustomReport.HorzLine(fromCol, ToCol : integer);
var
  I, J: Integer;
  Repcol : TRepColPtr;
  Leftend, rightEnd : integer;
  Subtitle : array[0..15] of char;
  Metrics: TTextMetric;
begin
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY - Metrics.tmHeight + Metrics.tmDescent + round(Metrics.tmHeight / 2);
  LeftEnd := DetailOffset;
  RightEnd := 0; //initialise to something
  if FromCol > 1 then
    begin
    for I := 1 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if (Repcol.MajorCol = FromCol) and (repcol.minorCol = 0) then
        LeftEnd := DetailOffset + cmtopx(Repcol.start);
      if (ToCol > 0) and (Repcol.MajorCol = ToCol) and (repcol.minorCol = 0) then
        RightEnd := DetailOffset + cmtopx(Repcol.Start) + cmtopx(repcol.width);
    end;
  end;
  if ToCol = 0 then
    rightEnd := DetailOffset + cmtopx(DetailWidth);
  PDF.Canvas.MoveTo(leftEnd, CY);
  PDF.Canvas.Lineto(RightEnd, CY);
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
end;

{TPLTrendreport}
constructor TPLTrendReport.create(ReportName : string; Orientation : TPrinterOrientation);
begin
  inherited create(ReportName, Orientation);

  DataModuleClient.GetConsolidatedList(Consolidate);
  if DataModuleClient.Planloaded = false then
    DataModuleClient.getPlanningData;
  DataModuleClient.getPlanningExpData;
end;

destructor TPLTrendReport.Destroy;
begin
  DataModuleClient.ClearPlanDataList;
  DataModuleClient.ClearPlanExpDataList;
  DataModuleClient.ClearConsolidatedList;
  inherited destroy;
end;

procedure TPLTrendReport.DoPDFReport;
begin
  CheckColumns; // Check out zero value columns
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

  PDF.EndDoc;
end;

procedure TPLTrendReport.CheckColumns;
var
  I, J: Integer;
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
  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
  Subtitle : array[0..15] of char;
  annualiseStr : string[5];
begin
  If Pdf.PageNumber > 1
    then begin
    RepPageFooter;
    PDF.NewPage;
  end;
  CX := LM;
  CY := TM;
  SetBookMarks;
  PDF.Canvas.Font.Name := CurrentFont;
  PDF.Canvas.Font.Style := [fsBold];
  Pdf.Canvas.Font.Size := HEADERFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);
  // Set to Baseline
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
  SetTextAlign(PDF.Canvas.Handle, TA_BASELINE + TA_NOUPDATECP);
  CentreText(DataModuleClient.BusinessDetailsBusiness_Name.Value);

  CY := CY + PDF.Canvas.TextHeight('A');
  PDF.Canvas.Font.Style := [fsBold, fsUnderLine];
  Pdf.Canvas.Font.Size := TITLEFONTSIZE;

//  setline;
  CentreText(fReportname);

  PDF.Canvas.Font.Style := [];
  Pdf.Canvas.Font.Size := SECTIONFONTSIZE;
  GetTextMetrics(PDF.Canvas.Handle, Metrics);

  CY := CY + round(Metrics.tmHeight * 1.5);

  if Consolidate then
    LeftText('Department/Revenue Group: Consolidated')
  else;
    LeftText('Department/Revenue Group: ' + DataModuleClient.DepartmentsRevenueGroupName.Value);

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
      CX := DetailOffset + cmtopx(COLMARGIN) + cmtopx(repcol.start);
      CentreandWrap(NewY, CX, cmtopx(Repcol.width) - cmtopx(COLMARGIN) * 2, Repcol.FromDate + ' to ' + Repcol.ToDate + AnnualiseStr);
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
end;

procedure TPLTrendReport.RepPageFooter;
var
  I: Integer;
  repcol : TRepColPtr;
  Subtitle : array[0..15] of char;
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
  RightText('Page ' + InttoStr(Pdf.PageNumber));
end;

procedure TPLTrendReport.RepBody;
var
  I: Integer;
  colno: Integer;
  textHT : integer;
  Metrics: TTextMetric;
  repcol : TRepColPtr;
  NewY, Yext: integer;
  Subtitle : array[0..15] of char;
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
  Subtitle : array[0..15] of char;
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
          then textAmount := format('%.0n', [AccountRec.PastBalances[Repcol.DateIdx - 1] / Repcol.annualFactor]);
        if (Repcol.Source = TARGET) and (AccountRec.PlanTotal <> 0)
          then textAmount := format('%.0n', [AccountRec.PlanTotal / Repcol.annualFactor]);
      end;
      if Repcol.minorcol = 2
        then begin
        TextImage := '0.0';
        if (Repcol.Source = PAST)
           and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1] <> 0)
           and (AccountRec.PastBalances[Repcol.DateIdx - 1] <> 0)
           then textAmount := format('%.1n',[AccountRec.PastBalances[Repcol.DateIdx - 1] * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PastBalances[Repcol.DateIdx - 1]]);
        if (Repcol.Source = TARGET)
           and (TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal <> 0)
           and (AccountRec.PlanTotal <> 0)
           then textAmount := format('%.1n', [AccountRec.PlanTotal * 100 / TPlanDataRecPtr(PlanDataList.Items[getaccountlistindex(SALES)]).PlanTotal]);
      end;
      if length(textImage) > 0 then
        DecAligninColumn(I, TextAmount, textImage);
    end;    // for
  end;
  Result := NonZero;
end;

end.
