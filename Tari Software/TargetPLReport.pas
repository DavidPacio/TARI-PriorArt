unit TargetPLReport;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, QuickRpt, qrprntr, printers, AuchTypes, Qrctrls;

Type

  TPLRecPtr = ^TPLRec; TPLRec = record
    AccountTitle : string[80];
    AccountNumber: Integer;
    Balances : array[0..5] of currency;
  end;

  TTargetPLRptF = class(TForm)
    QARep1: TQuickAbstractRep;
    PageHeaderBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLoopBand1: TQRLoopBand;
    QRLabel2: TQRLabel;
    procedure QARep1StartPage(Sender: TCustomQuickRep);
    procedure QARep1BeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  Procedure PrinterSetup;
  Function doreport : Boolean;
  Procedure doheader;
  procedure OnPdfEvent(var Msage : TMsg; var Handled: Boolean);
  end;

Const
    Ttabs: Array[1..6] of integer = (0, 180, 300, 390, 600, 0);
    Btabs: Array[1..6] of integer = (0, 180, 300, 390, 600, 0);

var
  TargetPLRptF: TTargetPLRptF;
  pagenum : integer;
  LMargin,
  RMargin,
  TMargin,
  BMargin,
  CMargin,
  CurrentX,
  CurrentY,
  ColumnW,
  Binding : longint;
  autoprint : boolean;
  title1, IndexTitle, usefont : string;
  title1len, title2len : longint;
  Fontn1, Fontn2 : TFont;
  umpires : Tlist;
  CurrRow : integer;
  PDFEvent : DWORD;


implementation

{$R *.DFM}

uses DMClient, DataCollector;

Procedure TTargetPLRptF.PrinterSetup;
begin
  with TPrintDialog.Create(Self)do
  try
    if QRPrinter.PrinterOK then
    begin
      if (QRPrinter.Status = mpFinished) then
      begin
        MinPage := 1;
        MaxPage := QRPrinter.PageCount;
        FromPage := 1;
        ToPage := MaxPage;
      end;
      Copies := QRPrinter.Copies;
      Options := [poPageNums, poSelection, poWarning];
      if Execute then
      begin
        QRPrinter.Copies := Copies;
        QRPrinter.PrinterIndex := Printer.PrinterIndex;
        QRPrinter.Orientation := Printer.Orientation;
        QRPrinter.PaperLength := Printer.PageHeight;
        QRPrinter.PaperWidth := Printer.PageWidth;
        case PrintRange of
          prAllPages,
          prSelection : begin
                         QRPrinter.FirstPage := 0;
                         QRPrinter.LastPage := 0;
                       end;
          prPageNums : begin
                         QRPrinter.FirstPage := FromPage;
                         QRPrinter.LastPage := ToPage;
                       end;
        end;
      end;
    end;
  finally
    free;
  end
end;

Function TTargetPLRptF.doreport : Boolean;
var
  I: Integer;
  j: Integer;
//  Theight,
//  Tlength : extended;
//  tbuffer : string;
//  bufferlen,
//  bufferpos,
  k : integer;
//  ParentL : longint;
  Bookmark : array[0..255] of char;
begin
  Application.OnMessage := onPdfEvent;
  strPcopy(Bookmark, 'PDF Driver Event');
  PdfEvent := RegisterWindowMessage(Bookmark);
  QRPrinter.Cleanup;
  QRPrinter.Copies := 1;
  k := -1;
  for j := 0 to QRPrinter.Printers.Count - 1 do    // Iterate
  begin
    if (QRPrinter.Printers.Strings[j] = PdfPrinterName)
      then k := j;
  end;    // for
  if (QRPrinter.Status = mpReady) Then
    begin
    QRPrinter.PrinterIndex := k;
    QRPrinter.Orientation := PoLandscape;
    QRPrinter.BeginDoc;
    QRPrinter.NewPage;
//    PdfDc := QRprinter.DCHandle;//PdfPtr.createDC;
//    textout(PdfDC, 100, 100, strPcopy(BookMark, 'X'), 1);
//    Parentl := Pdfptr.SetBookmark(PdfDc, Parentl, 'Target Profit and Loss Trend');
    PageNum := 1;
//    k := QRPrinter.PaperLengthValue;
    Lmargin := 150 + Binding;
    Rmargin := QRPrinter.PaperWidthValue - 150;
    Tmargin := 100;
    BMargin := QRPrinter.PaperLengthValue - 100;
    CMargin := 25;
    With QRPrinter.Canvas do
      Begin
      CurrentY := QRPrinter.YPos(TMargin);// + round(Theight);
      for I := 0 to 0 do    // Iterate
      begin
      if (CurrentY = QRPrinter.YPos(TMargin)) or (CurrentY > QRPrinter.YPos(BMargin - 50))
        then DoHeader;
//      Parentl := Pdfptr.SetBookmark(PdfDc, 0, inttostr(PageNum) + 'Second Mark');
      CurrentY := CurrentY + round(textheight('AB') * 1.05);
//      Title1 := TUmprecPtr(Umpires.items[A]).Name;
      CurrentX := QRPrinter.XPos(LMargin) + btabs[1];
      Textout(currentX, CurrentY, 'Tesing a Title');
      CurrentY := QRPrinter.YPos(BMargin - 50) + 1;
      end;    // for
  End;
  QRPrinter.EndDoc;
  QRPRINTER.print;
  End;
Result := True;
End;

Procedure TTargetPLRptF.doheader;
var
  Theight : extended;
  A : integer;
begin
  if (CurrentY > QRPrinter.YPos(BMargin - 50))
    then begin
    QRPrinter.NewPage;
    inc(PageNum);
  end;
  with QRPrinter.canvas do
    begin
    Font.Color := clBlack;
    Font.Name := 'Arial';
    Font.Style := [fsBold];
    title1 := DataModuleClient.BusinessDetailsBusiness_Name.value;
    Font.Size := 20;
//    Theight := TextHeight('AB');
    CurrentY := QRPrinter.YPos(TMargin);// + round(Theight);
    title1len := textwidth(title1);
    A := round(QRPrinter.XPos(RMargin) - QRPrinter.Xpos(LMargin));
    CurrentX := QRPrinter.Xpos(LMargin) + Round((A - title1len) / 2);
    Textout(currentX, CurrentY, Title1);
    title1 := 'Profit and Loss Trends';
    Font.Size := 12;
    Theight := TextHeight('AB');
    CurrentY := QRPrinter.YPos(TMargin) + round(Theight * 2);
    title1len := textwidth(title1);
    A := round(QRPrinter.XPos(RMargin) - QRPrinter.Xpos(LMargin));
    CurrentX := QRPrinter.Xpos(LMargin) + Round((A - title1len) / 2);
    Textout(currentX, CurrentY, Title1);

    CurrentX := QRPrinter.XPos(LMargin);
    Font.Size := 10;
    CurrentY := CurrentY + round(textheight('AB') * 2);
//    tbuffer := 'Sorted by: ' + IndexTitle;
//    Textout(currentX, CurrentY, Tbuffer);

    Title1 := 'Page ' + inttostr(PageNum);
    title1len := textwidth(title1);
    CurrentX := QRPrinter.Xpos(RMargin) - Round(title1len);
    Textout(currentX, CurrentY, Title1);

    Pen.Color := clBlack;
    Pen.Width := 2;
    CurrentY := CurrentY + round(textheight('AB') * 2);
    MoveTo(QRPrinter.XPos(LMargin), CurrentY);
    LineTo(QRPrinter.XPos(RMargin), CurrentY);

    font.style := [];
  end;
end;

procedure TTargetPLRptF.OnPdfEvent(var Msage : TMsg; var Handled: Boolean);
var
  EventId: word;
//  JobId : DWORD;
  lHDC : HDC;
  stext : array[0..10] of char;
begin
//  if Msage.message > $7FFF
//    then EventId := 0;
  If Msage.message = PdfEvent
    then begin
    EventId := Lo(Msage.WParam);
    // Sort out what OS we are on and get JobID and hDC  if  then
    lHdc := Msage.LParam;
    if Eventid = 6 //DOCUMENTEVENT_STARTPAGE
      then begin
      textout(lHdc, 1, 1, strPCopy(stext, ' '), 1);
      Pdfptr.SetBookmark(lhdc, 0, 'Page 1');
    end;
    Handled := True;
  end;
end;

procedure TTargetPLRptF.QARep1StartPage(Sender: TCustomQuickRep);
begin
  PdfPtr.SetBookmark(0, 0, 'BookMark1');
end;

procedure TTargetPLRptF.QARep1BeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  Bookmark : array[0..255] of char;
begin
  Application.OnMessage := onPdfEvent;
  strPcopy(Bookmark, 'PDF Driver Event');
  PdfEvent := RegisterWindowMessage(Bookmark);
end;

end.
