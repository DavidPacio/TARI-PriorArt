unit CustomPDFReport;

interface

Uses windows, graphics, classes, sysutils, auchTypes, printers, DataCollector,
      ppBands, ppPaintBox, ppreport, ppCtrls, ppPrintr, ComCtrls;

Const

  PENWIDTH = 0.35;
  // All values here are in mm
  TEXTSAMPLE = 'A';
  TITLEWIDTH = 59.5;
  DOLLARWIDTH = 24.7;
  PERCENTWIDTH = 12.5;
  DEFCOLMARGIN = 0.15;
  KEYINDICATORWIDTH = 34.7;

  DETAILEDTITLEWIDTH = 45.0;
  DETAILEDCOLWIDTH = 16.3;
  DETAILEDTOTALCOLWIDTH = 18.0;

  QUOTESREPCOL1 = 26.0;
  QUOTESREPCOLS = 30.0;
  SECTIONCOUNT = 20;
  NUM_COLUMNS = 14;

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
    fDetailWidth : extended;
    fConsolidate : TConsolidateType;
    fUseColor : Boolean;
    fCurrentFont : string;
    fBusinessName : string;
    fReportTitle : string;
    fReportName : string;
    fDepartmentName : string;
    fDocTitle : string;
    fBodyFontSize : integer;
    FPixelsPerX : integer;
    FPixelsPerY : integer;
    LeftOffset : integer;
    TopOffset : integer;
    fColMargin : extended;
    fDefaultOrientation : TPrinterOrientation;
    function GetCurrentFont: string;
  protected
    CX : Integer; // Current X position
    CY : Integer; // Current Y position
    TM : Integer; // Top Margin
    BM : Integer; // Bottom Margin
    LM : integer; // Left Margin
    RM : Integer; // Right Margin
    DetailOffset : integer; // Calculated Offset for table
    RightEdge : Extended;
    DrawTop: Integer; // Top Y position of section
    Columns : TList;
    Annualised : Boolean;
    fDC : HDC;
    fenhDC : HDC;
    UsedppDC : Boolean;
    StartIndex : Integer; // Starting point for page;
    TotalNoColumns: Integer;
    PageStartColNo, PageEndColNo : integer;
    SectionsComplete : array[1..SECTIONCOUNT] of Boolean;
    property ColMargin : Extended read fColMargin write fColMargin;
    property DefaultOrientation : TPrinterOrientation read fDefaultOrientation write fDefaultOrientation;
    procedure RepPageHeader; virtual; abstract;
    procedure RepPageFooter; virtual; abstract;
    procedure SetPage;
    Function RepBody : Boolean; virtual; abstract;
    function StrPPas(Src : Pchar; Len: Integer): string;
    procedure CentreText(leftpos, rightpos: integer; txt : String);
    procedure LeftText(txt : String);
    procedure RightText(txt : String);
    procedure HorzLine(fromCol, ToCol : integer);
    procedure CentreandWrap(Var yext: integer; x, w: integer; txt: string);
    function cmtopx(cmdx : extended): integer;
    function PosSpace(txt : Pchar; L : integer): integer;
    function PosChar(txt : Pchar; Chr: char): integer;
    procedure LeftInColumn(Colnum : Integer; txt : string);
    procedure RightInColumn(Colnum : Integer; txt : string);
    procedure CentreInColumn(Colnum : Integer; txt : string);
    procedure DecAlignInColumn(Colnum : Integer; txt, txtImage : string);
    procedure InitSections;
  Public
    PDFCanvas, TempCanvas : TMetafileCanvas;
    Metafiles : array[1..MAXWMFPAGES] of TMetafile;
    PageNumber : integer;
    LinesInTitle : Integer;
    Prepared : boolean;
//    IsCashFlowReport : Boolean;
    AccountingFmt : Boolean;
    PlaceDisclaimer, OnLastPage : Boolean;
    DisclaimPageNo : integer;
    property DetailWidth : extended read fDetailWidth write fDetailWidth;
    property Consolidate : TConsolidateType read FConsolidate write FConsolidate;
    Property UseColor : Boolean read fUseColor write fUseColor;
    property DocTitle : string read fDocTitle write fdocTitle;
    property CurrentFont : string read getcurrentFont write fCurrentFont;
    property BusinessName : string read fBusinessName write fBusinessName;
    property ReportTitle : string read fReportTitle write fReportTitle;
    property ReportName : string read fReportName write fReportName;
    property DepartmentName : string read fDepartmentName write fDepartmentName;
    property BodyFontSize : integer read fBodyFontSize write fBodyFontSize;
    property ppPrinterDC : HDC read fDC write fDC;
		constructor Create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation); virtual;
		destructor Destroy; override;
    procedure ColumnAdd(colrec : TRepColPtr);
    procedure Initialise(Header : TppheaderBand);
    function Prepare(Var CanvasHeight : single; ppreport : Tppreport; Page : TppPaintBox): Integer; Dynamic;//CanvasHeight in mm - Returns Number of pages
    function GetNextPage : Boolean; virtual; abstract; //Return True if more pages
    procedure DeleteColumns;
    function ppHDC: HDC;
  End;

implementation

constructor TCustomReport.create(Consolid : TConsolidateType; ReportName : string; Orientation : TPrinterOrientation);
var
  I: Integer;
begin
  Columns := TList.create;
  fReportTitle := ReportTitle;
  fConsolidate := Consolid;
  Annualised := false;
  Prepared := False;
  PlaceDisclaimer := False;
  OnLastPage := False;
  DisclaimPageno := 0;
  fColMargin := 0.5;
  LinesInTitle := 1;
  for I := 1 to MAXWMFPAGES do    // Iterate
    begin
    Metafiles[I] := nil;
    end;    // for
  initsections;
end;

destructor TCustomReport.Destroy;
var
  I: Integer;
begin
  DeleteColumns;
  for I := 1 to MAXWMFPAGES do    // Iterate
    begin
    if Metafiles[i] <> nil then
      Metafiles[I].Free;
    end;    // for
  inherited destroy;
end;

procedure TCustomReport.InitSections;
var
  I: Integer;
begin
  for I := 1 to SECTIONCOUNT do    // Iterate
    SectionsComplete[I] := False;
end;

procedure TCustomReport.DeleteColumns;
var
  I: Integer;
  Repcol : TRepColPtr;
begin
  for I := 0 to Columns.count - 1 do    // Iterate
    begin
    Repcol := TRepcolPtr(Columns.items[I]);
    Dispose(RepCol);
  end;    // for
  Columns.Destroy;
end;

procedure TCustomReport.SetPage;
//var
//  i: Integer;
begin
  FPixelsPerX := GetDeviceCaps(PDFCanvas.Handle, LOGPIXELSX);
  FPixelsPerY := GetDeviceCaps(PDFCanvas.Handle, LOGPIXELSY);
  LeftOffset := 0;
  TopOffset := 0;
  RightEdge := DetailWidth;
  LM := LeftOffset;
  TM := TopOffset;
  Startindex := 0;
  DetailOffset := 0;
end;

function TCustomReport.ppHDC: HDC;
begin
//  result := fDC;
  if (ppPrinter <> nil) and (ppPrinter.DC <> 0) then
    begin
    result := ppPrinter.DC;
    end
  else
    begin
    result := GetDC(0);
    end;
end;

function TCustomReport.Prepare(Var CanvasHeight : single; ppreport : Tppreport; Page : TppPaintBox): Integer;
var
  X, Y : Integer;
//  ldc : HDC;
  LargeY : Integer;
  HH : single;
begin
  for X := 1 to MAXWMFPAGES do    // Iterate
    begin
    if Metafiles[X] <> nil then
      Metafiles[X].Free;
    end;    // for
  // Set up the first 15 columns
  PageStartColNo := 0;
  if TotalNoColumns < NUM_COLUMNS
    then PageEndColNo := TotalNoColumns - 1
  else PageEndColNo := NUM_COLUMNS - 1;
{
  if (ppReport <> nil) and (ppReport.printer.DC <> 0) then
    begin
    lDC := ppReport.printer.DC;
    end
  else
    begin
    lDC := GetDC(0);
    end;
}
  // Get the device context of the printing device

  X := GetDeviceCaps(ppHDC, LOGPIXELSX);
  Y := GetDeviceCaps(ppHDC, LOGPIXELSY);
  LargeY := 0;
  PageNumber := 1;
  Metafiles[Pagenumber] := TMetafile.Create;
  Metafiles[PageNumber].Enhanced := True;
  Metafiles[Pagenumber].width := round((X * DetailWidth) / 25.4);  // Total pixels per mm
  Metafiles[Pagenumber].height := round((Y * CanvasHeight) / 25.4);
  MetaFiles[Pagenumber].inch := 0;//X;
  BM := Round((Y * CanvasHeight) / 25.4);
  PDFCanvas := TMetafileCanvas.Create(Metafiles[Pagenumber], ppHDC);
  while getnextpage do
    begin
    if CY > LargeY then
      LargeY := CY;
    Metafiles[Pagenumber].MMWidth := Round(DetailWidth);
    MetaFiles[Pagenumber].MMHeight := Round((CY * 25.4) / Y);
    inc(PageNumber);
    Metafiles[Pagenumber] := TMetafile.Create;
    Metafiles[PageNumber].Enhanced := True;
    Metafiles[Pagenumber].width := round((X * DetailWidth) / 25.4);  // Total pixels per mm
    Metafiles[Pagenumber].height := round((Y * CanvasHeight) / 25.4);
    MetaFiles[Pagenumber].inch := 0; //X;
    BM := Round((Y * CanvasHeight) / 25.4);
    PDFCanvas := TMetafileCanvas.Create(Metafiles[Pagenumber], ppHDC);
    end;    // while
  if CY > LargeY then
    LargeY := CY;
  Metafiles[Pagenumber].MMWidth := Round(DetailWidth);
  MetaFiles[Pagenumber].MMHeight := Round((CY * 25.4) / Y);
  // detailwidth should be the largest of all pages
  HH := CanvasHeight; // + 50;
  CanvasHeight := (LargeY) * 25.4 / Y;   // add some height
  if (HH / 2) > CanvasHeight then
    CanvasHeight := (HH / 2) + 1;
  result := PageNumber;
//  DetailWidth := DetailWidth; // Added extra mm to avoid clipping
  Page.Width := DetailWidth + 5.0;
  RightEdge := DetailWidth;
  Page.Left := 0.0;

  Page.left := (ppreport.PrinterSetup.PaperWidth - ppreport.PrinterSetup.MarginLeft - ppreport.PrinterSetup.MarginRight - DetailWidth)/ 2;
end;


function TCustomReport.cmtopx(cmdx : extended): integer;
begin
  result := Round((fPixelsperX * cmdx) / 25.4);
end;

procedure TCustomReport.ColumnAdd(colrec : TRepColPtr);
begin
  columns.add(colrec);
end;

function TCustomReport.StrPPas(Src : Pchar; Len: Integer): string;
var
  lstr : array[0..200] of char;
begin
  result := strpas(StrPLCopy(lstr, strpas(src), len));
end;

procedure TCustomReport.CentreandWrap(Var yext: integer; x, w: integer; txt: string);
var
  Len, L, Lcx, LCS: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  LocalStr : String;
  Pstr : Pchar;
begin
  Yext := CY;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  L := Len;
  with PDFcanvas do
    begin
    while (Len > 0) and (L > 0) do
      begin
      L := Len;
      GetTextExtentPoint(Handle, Pstr, L, Extent);
      LCS := Poschar(Pstr, #126);
      if (L > 0) and ((Extent.cX > w) or (LCS > -1)) Then
        begin
        if LCS > -1 then
          L := LCS
        else
          L := PosSpace(Pstr, L);
        GetTextExtentPoint(Handle, Pstr, L, Extent);
      end;
      Lcx  := CX + round((w - Extent.cx)/2 );
      LocalStr := StrPPas(Pstr, L);
      textout(LCX, Yext, LocalStr);
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
  width, len, L, Lcx, Offset: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  LocalStr : String;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(fColMargin + 0.5) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(fColMargin) * 2;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  Offset := 0;
  L := Len;
  with PDFCanvas do
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
      LocalStr := StrPPas(Pstr, L);
      textout(LCX, CY, LocalStr);
      if L < Len Then
        begin
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

// This should only be used for very short amounts of text
procedure TCustomReport.RightInColumn(Colnum : Integer; txt : string);
var
  Repcol : TRepColPtr;
  width, len, L, Lcx: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  LocalStr : String;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(fColMargin + 0.5) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(fColMargin) * 2;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  L := Len;
  with PDFCanvas do
    begin
    GetTextExtentPoint(Handle, Pstr, L, Extent);
    Lcx  := CX + Width - Extent.cx - cmtopx(fColMargin);
    LocalStr := StrPPas(Pstr, L);
    textout(LCX, CY, LocalStr);
    end;
end;

procedure TCustomReport.CentreInColumn(Colnum : Integer; txt : string);
var
  Repcol : TRepColPtr;
  width, len, L, Lcx: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  LocalStr : String;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(fColMargin) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(fColMargin) * 2;
  StrPcopy(lstr, txt);
  Pstr := @Lstr[0];
  Len := Strlen(Lstr);
  L := Len;
  with PDFCanvas do
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
      Lcx  := CX + round((Width - Extent.cx)/2 );
      LocalStr := StrPPas(Pstr, L);
      textout(LCX, CY, LocalStr);
      if L < Len Then
        begin
        Inc(L); //
        CY := CY + Extent.cy;
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
	partamount : string;
  pointFound : Boolean;
  destPtr : array[0..20] of char;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  dashOffset := 0;
  pointfound := false;
  J := 0;
  for I := 1 to length(txtimage) do    // Iterate
    begin
    if pointFound then
      begin
      destPtr[J] := txtImage[I];
      inc(J);
      end;
    if txtImage[I] = '.' then
      pointFound := True;
    end;
  DestPtr[J] := #0;
  Partamount := strPas(DestPtr);    // for
  BracketWidth := PDFCanvas.TextWidth(')');
  if pointFound and (txt[1] = '-') and (length(txt) = 1) then
		DashOffset := PDFcanvas.textWidth(partamount);
  if txt[Length(txt)] = ')' then
    BracketWidth := 0;
  CX := DetailOffset + cmtopx(RepCol.start) + cmtopx(repcol.width) - cmtopx(fColMargin) - PDFCanvas.TextWidth(txt) - BracketWidth - dashoffset;
  PDFCanvas.TextOut(CX, CY, txt);
end;

function TCustomReport.PosSpace(txt : Pchar; L : integer): integer;
begin
  if (Txt[L] = ' ') and (L > 0) then
    Dec(L);
  while (L > 0) and (Txt[L] <> ' ') do dec(L);
  result := L;
end;

function TCustomReport.PosChar(txt : Pchar; Chr: char): integer;
var
  J : Pchar;
begin
  J := AnsiStrScan(txt, Chr);
  result := -1;
  if J <> nil then
    Result := J - txt;
end;

procedure TCustomReport.CentreText(leftpos, rightpos: integer; txt : String);
var
  tempcx : integer;
begin
  tempCX := LeftPos + round((RightPos - LeftPos - PDFCanvas.TextWidth(txt)) / 2);
  PdfCanvas.TextOut(tempCX, CY, txt);
end;

procedure TCustomReport.RightText(txt : String);
var
  tempcx : integer;
begin
  tempCX := DetailOffset + cmtopx(RightEdge) - PDFCanvas.TextWidth(txt);
  PdfCanvas.TextOut(tempCX, CY, txt);
end;

procedure TCustomReport.LeftText(txt : String);
begin
  PdfCanvas.TextOut(DetailOffset, CY, txt);
end;

function TCustomReport.getCurrentFont: string;
begin
  result := FcurrentFont;
end;

procedure TCustomReport.HorzLine(fromCol, ToCol : integer);
var
  I: Integer;
  Repcol : TRepColPtr;
  Leftend, rightEnd : integer;
  Metrics: TTextMetric;
begin
  GetTextMetrics(PDFCanvas.Handle, Metrics);

  CY := CY - Metrics.tmHeight + Metrics.tmDescent + round(Metrics.tmHeight / 2);
  LeftEnd := DetailOffset;
  RightEnd := 0; //initialise to something
  if FromCol > 1 then
    begin
    for I := 0 to Columns.count - 1 do    // Iterate
      begin
      repcol := TRepColPtr(Columns.Items[I]);
      if (Repcol.MajorCol = FromCol) and (repcol.minorCol = 0) then
        LeftEnd := DetailOffset + cmtopx(Repcol.start);
      if (ToCol > 0) and (Repcol.MajorCol = ToCol) and (repcol.minorCol = 0) then
        RightEnd := DetailOffset + cmtopx(Repcol.Start) + cmtopx(repcol.width);
      end;
    end;
  if ToCol = 0 then
    rightEnd := DetailOffset + cmtopx(RightEdge);
  PDFCanvas.MoveTo(leftEnd, CY);
  PDFCanvas.Lineto(RightEnd, CY);
  CY := CY + Metrics.tmAscent + round(Metrics.tmHeight / 2);
end;

procedure TCustomReport.initialise(Header : TppHeaderBand);
var
  i: Integer;
begin
  for I := 0 to header.ObjectCount - 1 do    // Iterate
  begin
    if Header.Objects[I].Name = 'BusinessName' then
      begin
      Header.Objects[I].Font.Name := fCurrentFont;
      Header.Objects[I].Font.Style := [fsBold];
      Header.Objects[I].Font.Size := HEADERFONTSIZE;
      Header.Objects[I].Caption := fBusinessName;
      end
    else
    if Header.Objects[I].Name = 'ReportTitle' then
      begin
      Header.Objects[I].Font.Name := fCurrentFont;
      Header.Objects[I].Font.Style := [fsBold, fsUnderLine];
      Header.Objects[I].Font.Size := TITLEFONTSIZE;
      Header.Objects[I].Caption := freporttitle;
      end
    else
    if Header.Objects[I].Name = 'DepartmentDetail' then
      begin
      Header.Objects[I].Font.Name := fCurrentFont;
      Header.Objects[I].Font.Style := [];
      Header.Objects[I].Font.Size := SECTIONFONTSIZE;
      if Consolidate = ctBusiness then
        Header.Objects[I].Caption := 'Business / Branch: Consolidated'
      else if Consolidate = ctDepartment then
        Header.Objects[I].Caption := 'Department/Revenue Group: Consolidated'
      else
        Header.Objects[I].Caption := 'Department/Revenue Group: ' + fDepartmentName;
      end;
  end;    // for
  PageNumber := 0;
end;

end.
