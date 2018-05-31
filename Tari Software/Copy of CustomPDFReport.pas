unit CustomPDFReport;

interface

Uses windows, graphics, classes, sysutils, auchTypes, printers, DataCollector,
    CDIntf_TLB;

Const
  PENWIDTH = 0.035;

  TEXTSAMPLE = 'A';
  TITLEWIDTH = 5.95;
  DOLLARWIDTH = 2.47;
  PERCENTWIDTH = 1.25;
  DEFCOLMARGIN = 0.2;
  KEYINDICATORWIDTH = 3.47;

  DETAILEDTITLEWIDTH = 5.00;
  DETAILEDCOLWIDTH = 1.48;
  DETAILEDTOTALCOLWIDTH = 1.60;

  QUOTESREPCOL1 = 2.8;
  QUOTESREPCOLS = 3.2;

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
//    BindM : integer; // Binding Margin
    fDetailWidth : extended;
    fConsolidate : Boolean;
    fUseColor : Boolean;
    fCurrentFont : string;
    fReportName : string;
    fDocTitle : string;
    fBodyFontSize : integer;
    FPixelsPerX : integer;
    FPixelsPerY : integer;
    LeftOffset : integer;
    TopOffset : integer;
    fColMargin : extended;
    fDefaultOrientation : TPrinterOrientation;
//    PhysicalWidth : integer;
//    PhysicalHeight : integer;
//    bmParent : longint;
//    procedure SetBookmarks;
    function GetCurrentFont: string;
  protected
    CX : Integer; // Current X position
    CY : Integer; // Current Y position
    TM : Integer; // Top Margin
    BM : Integer; // Bottom Margin
    LM : integer; // Left Margin
    RM : Integer; // Right Margin
    DetailOffset : integer; // Calculated Offset for table
    DrawTop: Integer; // Top Y position of section
    PDF : Tprinter;
    Columns : TList;
    PageNumber : integer;
    Annualised : Boolean;
    property currentFont : string read getcurrentFont write fCurrentFont;
    property DocTitle : string read fDocTitle write fdocTitle;
    property ReportName : string read fReportName write fReportName;
    property BodyFontSize : integer read fBodyFontSize write fBodyFontSize;
    property ColMargin : Extended read fColMargin write fColMargin;
    property DefaultOrientation : TPrinterOrientation read fDefaultOrientation write fDefaultOrientation;
    procedure RepPageHeader; virtual; abstract;
    procedure RepPageFooter; virtual; abstract;
    procedure RepBody; virtual; abstract;
    procedure SetPage;
    procedure CentreText(leftpos, rightpos: integer; txt : String);
    procedure LeftText(txt : String);
    procedure RightText(txt : String);
    procedure HorzLine(fromCol, ToCol : integer);
    procedure CentreandWrap(Var yext: integer; x, w: integer; txt: string);
    function cmtopx(cmdx : extended): integer;
    function PosSpace(txt : Pchar; L : integer): integer;
    function PosChar(txt : Pchar; Chr: char): integer;
    procedure LeftInColumn(Colnum : Integer; txt : string);
    procedure CentreInColumn(Colnum : Integer; txt : string);
    procedure DecAlignInColumn(Colnum : Integer; txt, txtImage : string);
  Public
    property DetailWidth : extended read fDetailWidth write fDetailWidth;
    property Consolidate : Boolean read FConsolidate write FConsolidate;
    Property UseColor : Boolean read fUseColor write fUseColor;
    constructor create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation); virtual;
    destructor Destroy; override;
    procedure ColumnAdd(colrec : TRepColPtr);
    procedure DoPDFReport; virtual; abstract;
  End;

// non classed procedures
procedure DoConcatentation(ConcatFile, FileName : String);
procedure SetBookmarks(FileName, Title: string; pages: integer);

implementation

constructor TCustomReport.create(Consolid : Boolean; ReportName : string; Orientation : TPrinterOrientation);
//var
//  I: Integer;
begin
  Columns := TList.create;
//  Rows := TList.Create;
  fReportName := ReportName;
  fConsolidate := Consolid;
  Annualised := false;
  fColMargin := 0.10;

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
  Columns.Destroy;
  Pdf.Free;
  inherited destroy;
end;

procedure TCustomReport.SetPage;
begin
  PdfPtr.PaperSize := 9; // A4
  PdfPtr.Resolution := DPI;
  if DefaultOrientation = poLandscape
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
//  PdfPtr.SetDefaultPrinter;
//  PDF := printer;
  PDF.PrinterIndex := FindPrinterIndex(PDFPrinterName);
  PDF.Orientation := DefaultOrientation;

  FPixelsPerX := GetDeviceCaps(Pdf.Handle, LOGPIXELSX);
  FPixelsPerY := GetDeviceCaps(Pdf.Handle, LOGPIXELSY);
  LeftOffset := GetDeviceCaps(Pdf.Handle, PHYSICALOFFSETX);
  TopOffset := GetDeviceCaps(Pdf.Handle, PHYSICALOFFSETY);

  LM := cmtopx(0.5){ - LeftOffset};
  TM := cmtopx(0.2) {- TopOffset};
  RM := PDF.PageWidth {- LeftOffset} - cmtopx(0.5);
  BM := PDF.PageHeight {- TopOffset} - cmtopx(0.2);
  PageNumber := 0;
end;

{
procedure TCustomReport.Setbookmarks;
begin
  PDF.Canvas.Textout(1, 1, '');
  if Pagenumber = 0
    then begin
    bmParent := PdfPtr.SetBookmark(PDF.Handle, 0, fReportName);
    PdfPtr.SetBookmark(PDF.Handle, bmParent, 'Page ' + inttostr(PDF.Pagenumber));
  end
  else
    PdfPtr.SetBookmark(PDF.Handle, bmParent, 'Page ' + inttostr(PDF.Pagenumber));
end;
}

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
  Len, L, Lcx, LCS: integer;
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
  width, len, L, Lcx, Offset: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(fColMargin) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(fColMargin) * 2;
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

procedure TCustomReport.CentreInColumn(Colnum : Integer; txt : string);
var
  Repcol : TRepColPtr;
  width, len, L, Lcx: integer;
  Extent: TSize;
  lstr: array[0..100] of char;
  Pstr : Pchar;
begin
  repcol := TRepColPtr(Columns.Items[Colnum]);
  CX := DetailOffset + cmtopx(fColMargin) + cmtopx(repcol.start);
  Width := cmtopx(Repcol.width) - cmtopx(fColMargin) * 2;
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
      while (L > 0) and (Extent.cX > Width) do
        begin
        L := PosSpace(Pstr, L);
        GetTextExtentPoint(Handle, Pstr, L, Extent);
      end;
      Lcx  := CX + round((Width - Extent.cx)/2 );
      Windows.TextOut(Handle, LCX, CY, Pstr, L);
      if L < Len
        then begin
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
  CX := DetailOffset + cmtopx(RepCol.start) + cmtopx(repcol.width) - cmtopx(fColMargin) - PDF.Canvas.TextWidth(txt) - BracketWidth - dashoffset;
  PDF.Canvas.TextOut(CX, CY, txt);
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
  tempCX := LeftPos + round((RightPos - LeftPos - PDF.Canvas.TextWidth(txt)) / 2);
  Pdf.Canvas.TextOut(tempCX, CY, txt);
end;

procedure TCustomReport.RightText(txt : String);
var
  tempcx : integer;
begin
  tempCX := DetailOffset + cmtopx(DetailWidth) - PDF.Canvas.TextWidth(txt);
  Pdf.Canvas.TextOut(tempCX, CY, txt);
end;

procedure TCustomReport.LeftText(txt : String);
begin
  Pdf.Canvas.TextOut(DetailOffset, CY, txt);
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
//  Subtitle : array[0..15] of char;
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

procedure DoConcatentation(ConcatFile, FileName : String);
var
  PdfDoc1 : IDIDocument;
  PdfDoc2 : IDIDocument;
  ScrFile : array[0..200] of char;
  DesFile : array[0..200] of char;
begin
  if Fileexists(ConcatFile)
    then begin
    PdfDoc1 := CoDocument.create;
    PdfDoc2 := CoDocument.create;
    PdfDoc1.Open(ConcatFile);
    PdfDoc2.Open(FileName);
    PdfDoc1.Appendex(PdfDoc2);
    PdfDoc1.Save(ConCatFile);
  end
  else
    CopyFile(StrPCopy(ScrFile, FileName), StrPCopy(DesFile, ConCatFile), False);
end;

procedure SetBookmarks(FileName, Title: string; pages: integer);
var
  I: Integer;
  PdfDoc : IDIDocument;
begin
  PdfDoc := CoDocument.create;
  PdfDoc.Open(FileName);
  Pdfdoc.ClearBookmarks;
  PdfDoc.SetBookmark(1, Title, 0);
  for I := 1 to pages do    // Iterate
    begin
    if I = 1 then
      PdfDoc.SetBookmark(I, 'Page ' + inttostr(I), 1)
    else
      PdfDoc.SetBookmark(I, 'Page ' + inttostr(I), 0);
  end;
  PdfDoc.Save(FileName);
end;

end.
